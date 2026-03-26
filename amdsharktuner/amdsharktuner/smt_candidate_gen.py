# Copyright 2026 Advanced Micro Devices, Inc.
#
# Licensed under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception


from iree.compiler import ir  # type: ignore
from iree.compiler.dialects import iree_codegen, iree_gpu  # type: ignore
import z3  # type: ignore
from typing import Iterator

from .common import AttrKey, CompilationInfoKeys


class KnobSymbols(dict[str, z3.ExprRef]):
    """Maps knob names to z3 symbolic constants (pre-solving)."""
    pass

class KnobAssignment(dict[str, int]):
    """Maps knob names to integer values (post-solving)."""
    pass


def resolve_knob_array_template_entry(
    template_entry: ir.ArrayAttr,
    knob_assignment: KnobAssignment,
) -> list[int]:
    """Resolve IntKnobAttr placeholders to knob assignment values.
    E.g. 
    template_entry = [#iree_codegen.smt.int_knob<"wg_m">, #iree_codegen.smt.int_knob<"wg_n">]
    knob_assignment = {"wg_m": 4, "wg_n": 5}
    result = [4, 5].
    """
    result: list[int] = []
    for elem in template_entry:
        
        if not isinstance(elem, iree_codegen.IntKnobAttr):
            raise ValueError(f"Unexpected element in array template entry: {elem}")

        assert elem.name in knob_assignment, f"Knob '{elem.name}' not found in assignment."
        result.append(knob_assignment[elem.name])

    return result


def i64_array_attr(vals: list[int]) -> ir.ArrayAttr:
    """Build an ArrayAttr of i64 IntegerAttrs from a list of ints."""
    i64 = ir.IntegerType.get_signless(64)
    return ir.ArrayAttr.get([ir.IntegerAttr.get(i64, v) for v in vals])


class GPUCompilationInfoKeys(CompilationInfoKeys):
    """Key names for GPU compilation info attrs, matching IREE's
    GPULoweringConfigUtils.cpp conventions.
    """

    class LoweringConfig(CompilationInfoKeys.LoweringConfig):
        """Key names used in iree_gpu.LoweringConfigAttr's DictionaryAttr."""

        # Tiling levels.
        WORKGROUP: AttrKey[ir.ArrayAttr] = AttrKey("workgroup", ir.ArrayAttr)
        REDUCTION: AttrKey[ir.ArrayAttr] = AttrKey("reduction", ir.ArrayAttr)
        THREAD: AttrKey[ir.ArrayAttr] = AttrKey("thread", ir.ArrayAttr)
        SUBGROUP: AttrKey[ir.ArrayAttr] = AttrKey("subgroup", ir.ArrayAttr)

        # MMA intrinsic: OneOfKnobAttr index selects from the options array.
        MMA_KIND: AttrKey[iree_codegen.OneOfKnobAttr] = AttrKey(
            "mma_kind", iree_codegen.OneOfKnobAttr
        )

        # Subgroup basis: stored as [[counts...], [mapping...]] (two i64 arrays).
        SUBGROUP_BASIS: AttrKey[ir.DictAttr] = AttrKey("subgroup_basis", ir.DictAttr)
        SUBGROUP_BASIS_COUNTS: AttrKey[ir.ArrayAttr] = AttrKey("counts", ir.ArrayAttr)
        SUBGROUP_BASIS_MAPPING: AttrKey[ir.ArrayAttr] = AttrKey("mapping", ir.ArrayAttr)

        TILING_LEVELS = (WORKGROUP, REDUCTION, THREAD, SUBGROUP)

    class TranslationInfo(CompilationInfoKeys.TranslationInfo):
        """Key names in the knobs dict for iree_codegen.TranslationInfoAttr."""

        WORKGROUP_SIZE: AttrKey[ir.ArrayAttr] = AttrKey("workgroup_size", ir.ArrayAttr)
        SUBGROUP_SIZE: AttrKey[iree_codegen.IntKnobAttr] = AttrKey(
            "subgroup_size", iree_codegen.IntKnobAttr
        )



def build_gpu_compilation_info(
    constraints_op: iree_codegen.ConstraintsOp,
    knob_assignment: KnobAssignment,
) -> iree_codegen.CompilationInfoAttr:
    """Build a concrete CompilationInfoAttr for a GPU backend.

    Resolves all IntKnobAttr and OneOfKnobAttr placeholders in the knobs
    template using `knob_assignment`, then constructs the corresponding
    iree_gpu.LoweringConfigAttr and iree_codegen.TranslationInfoAttr.
    """
    lc_keys = GPUCompilationInfoKeys.LoweringConfig
    ti_keys = GPUCompilationInfoKeys.TranslationInfo
    knob_template: ir.DictAttr = constraints_op.knobs
    pipeline: ir.Attribute = constraints_op.pipeline

    # --- Build iree_gpu.LoweringConfigAttr ---
    config_entries: dict[str, ir.Attribute] = {}  # built up and passed to LoweringConfigAttr.

    # Tiling levels: workgroup, reduction, thread, subgroup.
    for key in lc_keys.TILING_LEVELS:
        tiling_attr = knob_template.get(key.name)
        if tiling_attr is None:
            continue

        assert isinstance(tiling_attr, key.attr_type)
        config_entries[key.name] = i64_array_attr(
            resolve_knob_array_template_entry(tiling_attr, knob_assignment)
        )

    # MMA kind: OneOfKnobAttr holds options; knob_assignment gives the index.
    mma_template = knob_template.get(lc_keys.MMA_KIND.name)
    if mma_template is None:
        continue

        assert isinstance(mma_template, lc_keys.MMA_KIND.attr_type)
        idx = knob_assignment[mma_template.name]
        options = mma_template.options
        if idx < 0 or idx >= len(options):
            raise ValueError(
                f"mma_kind index {idx} out of range [0, {len(options)})."
            )
        # Store the selected MMA attr directly, e.g. #iree_gpu.mma<...>.
        config_entries[lc_keys.MMA_KIND.name] = options[idx]

    # Subgroup basis: stored as [[counts...], [mapping...]] in the config.
    sg_basis_template = knob_template.get(lc_keys.SUBGROUP_BASIS.name)
    if sg_basis_template is not None:
        assert isinstance(sg_basis_template, lc_keys.SUBGROUP_BASIS.attr_type)
        counts_template = sg_basis_template.get(lc_keys.SUBGROUP_BASIS_COUNTS.name)
        if counts_template is not None:
            assert isinstance(counts_template, lc_keys.SUBGROUP_BASIS_COUNTS.attr_type)
            counts = resolve_knob_array_template_entry(counts_template, knob_assignment)
            mapping_template = sg_basis_template.get(
                lc_keys.SUBGROUP_BASIS_MAPPING.name
            )
            if mapping_template is not None:
                assert isinstance(
                    mapping_template, lc_keys.SUBGROUP_BASIS_MAPPING.attr_type
                )
                mapping = resolve_knob_array_template_entry(mapping_template, knob_assignment)
            else:
                # Default mapping: [0, 1, ...].
                mapping = list(range(len(counts)))
            config_entries[lc_keys.SUBGROUP_BASIS.name] = ir.ArrayAttr.get(
                [i64_array_attr(counts), i64_array_attr(mapping)]
            )

    lowering_config = iree_gpu.LoweringConfigAttr.get(
        ir.DictAttr.get(config_entries)
    )

    # --- Build iree_codegen.TranslationInfoAttr ---
    # workgroup_size and subgroup_size live at the top level of the knobs dict.
    workgroup_size: list[int] | None = None
    subgroup_size: int | None = None

    wg_size_template = knob_template.get(ti_keys.WORKGROUP_SIZE.name)
    if wg_size_template is not None:
        assert isinstance(wg_size_template, ti_keys.WORKGROUP_SIZE.attr_type)
        workgroup_size = resolve_knob_array_template_entry(wg_size_template, knob_assignment)

    sg_size_template = knob_template.get(ti_keys.SUBGROUP_SIZE.name)
    if sg_size_template is not None:
        assert isinstance(sg_size_template, ti_keys.SUBGROUP_SIZE.attr_type)
        subgroup_size = knob_assignment.get(sg_size_template.name)

    translation_info = iree_codegen.TranslationInfoAttr.get(
        pipeline,
        workgroup_size=workgroup_size,
        subgroup_size=subgroup_size,
    )

    return iree_codegen.CompilationInfoAttr.get(lowering_config, translation_info)


def get_z3_assignment_from_model(
    model: z3.ModelRef,
    z3_const_exprs: KnobSymbols,
) -> KnobAssignment:
    def get_z3_const_val(v: z3.ExprRef) -> int:
        # Evaluate arbitrary expressions over a model, convert z3 expr to int.
        val = model.eval(v)
        assert z3.is_int_value(
            val
        ), f"Unassigned or non-concrete constant: {v} -> {val}"
        return val.as_long()
    return KnobAssignment(
        {name: get_z3_const_val(expr) for name, expr in z3_const_exprs.items()}
    )



def get_knobs_from_constraint_op(
    constraints_op: iree_codegen.ConstraintsOp,
) -> KnobSymbols:
    """Extract all SMT knob names from a ConstraintsOp and create z3 constants.

    Recursively walks the knobs DictAttr, collecting the name of every
    IntKnobAttr and OneOfKnobAttr leaf. Returns a map from each name to a
    fresh z3 Int constant with the same name, matching the SMT-LIB declarations
    produced by `convert_constraints_op_to_smtlib`.
    """
    knob_names: list[str] = []

    def collect(attr: ir.Attribute) -> None:
        if isinstance(attr, iree_codegen.IntKnobAttr):
            # E.g. #iree_codegen.smt.int_knob<"wg_m">.
            knob_names.append(attr.name)  # e.g. "wg_m"
        elif isinstance(attr, iree_codegen.OneOfKnobAttr):
            # E.g. #iree_codegen.smt.one_of_knob<"mma_idx", [...]>.
            knob_names.append(attr.name)  # e.g. "mma_idx"
        elif isinstance(attr, ir.ArrayAttr):
            # E.g. workgroup = [#iree_codegen.smt.int_knob<"wg_m">,
            #                   #iree_codegen.smt.int_knob<"wg_n">].
            for elem in attr:
                collect(elem)
        elif isinstance(attr, ir.DictAttr):
            # E.g. subgroup_basis = {counts = [#iree_codegen.smt.int_knob<"sg_x">,
            #                                   #iree_codegen.smt.int_knob<"sg_y">],
            #                        mapping = [0, 1]},
            # where entry.name = "counts", entry.attr = [...].
            for entry in attr:
                collect(entry.attr)
        else:
            raise ValueError(f"Unknown knob attribute type: {type(attr)}")

    collect(constraints_op.knobs)
    return KnobSymbols({name: z3.Int(name) for name in knob_names})


def generate_solutions_from_constraint_op(
    constraints_op: iree_codegen.ConstraintsOp,
) -> Iterator[KnobAssignment]:
    smtlib = iree_codegen.convert_constraints_op_to_smtlib(constraints_op, emit_reset=False)

    z3_const_exprs = get_knobs_from_constraint_op(constraints_op)
    z3_vars = list(z3_const_exprs.values())

    solver = z3.Solver()
    solver.add(z3.parse_smt2_string(smtlib))

    while solver.check() == z3.sat:
        model = solver.model()

        # Add new constraints to find the next solution.
        solver.add(
            z3.Or([v != model.eval(v, model_completion=True) for v in z3_vars])
        )

        yield get_z3_assignment_from_model(model, z3_const_exprs)
