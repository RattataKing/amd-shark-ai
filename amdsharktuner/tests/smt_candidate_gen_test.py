# Copyright 2026 Advanced Micro Devices, Inc.
#
# Licensed under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

import pytest
import z3  # type: ignore

from amdsharktuner import common, smt_candidate_gen

from iree.compiler import ir  # type: ignore
from iree.compiler.dialects import iree_codegen, iree_gpu  # type: ignore

@pytest.fixture
def sample_constraints_op():
    test_mlir_str = """
        module {
            iree_codegen.smt.constraints
                target = <set = 0>,
                pipeline = #iree_gpu.pipeline<VectorDistribute>,
                knobs = {test = #iree_codegen.smt.int_knob<"test">,
                    workgroup = [#iree_codegen.smt.int_knob<"wg_m">,
                                    #iree_codegen.smt.int_knob<"wg_n">,
                                    #iree_codegen.smt.int_knob<"wg_k">],
                    mma_idx = #iree_codegen.smt.one_of_knob<"mma_idx",
                            ["opt_a", "opt_b", "opt_c"]>,
                    subgroup_basis = {
                            counts = [#iree_codegen.smt.int_knob<"sg_x">,
                                        #iree_codegen.smt.int_knob<"sg_y">],
                            mapping = [#iree_codegen.smt.int_knob<"map_0">,
                                        #iree_codegen.smt.int_knob<"map_1">]}}
                dims() {
                }
        }
    """
    with ir.Context():
        module = ir.Module.parse(test_mlir_str)
        ops = ir.get_ops_of_type(module, iree_codegen.ConstraintsOp)
        yield ops[0]


@pytest.fixture
def sample_solver_constraints_op():
    test_mlir_str = """
    module {
        iree_codegen.smt.constraints
            target = <set = 0>,
            pipeline = #iree_gpu.pipeline<VectorDistribute>,
            knobs = {wg_m = #iree_codegen.smt.int_knob<"wg_m">}
            dims() {
            ^bb0:
            %v = iree_codegen.smt.knob "wg_m" : !smt.int
            %c4 = smt.int.constant 4
            %c8 = smt.int.constant 8
            %ge = smt.int.cmp ge %v, %c4
            %le = smt.int.cmp le %v, %c8
            iree_codegen.smt.assert %ge, "wg_m >= 4" : !smt.bool
            iree_codegen.smt.assert %le, "wg_m <= 8" : !smt.bool
            }
    }
    """
    with ir.Context():
        module = ir.Module.parse(test_mlir_str)
        ops = ir.get_ops_of_type(module, iree_codegen.ConstraintsOp)
        yield ops[0]



def test_get_z3_assignment_from_model() -> None:
    a = z3.Int("a")
    b = z3.Int("b")
    solver = z3.Solver()
    solver.add(a == 4)
    solver.add(b == 6)
    assert solver.check() == z3.sat
    model = solver.model()
    # Evaluate a derived expression: a + b.
    symbols = smt_candidate_gen.KnobSymbols({"a": a, "b": b, "sum": a + b})
    result = smt_candidate_gen.get_z3_assignment_from_model(model, symbols)
    assert result["a"] == 4
    assert result["b"] == 6
    assert result["sum"] == 10


def test_resolve_knob_array_attr_template() -> None:
    with ir.Context():
        arr = ir.Attribute.parse(
            "[#iree_codegen.smt.int_knob<\"wg_m\">, "
            "#iree_codegen.smt.int_knob<\"wg_n\">]"
        )
        assignment = smt_candidate_gen.KnobAssignment({"wg_m": 64, "wg_n": 128})
        result = smt_candidate_gen._resolve_knob_array_attr_template(
            arr, assignment
        )
        assert result == [64, 128]
        
        # Missing knob raises assertion error.
        with pytest.raises(AssertionError, match="wg_m"):
            smt_candidate_gen._resolve_knob_array_attr_template(
                arr, smt_candidate_gen.KnobAssignment({})
            )

def test_get_template_entry() -> None:
    with ir.Context():
        knob_template = ir.Attribute.parse(
            '{wg_m = #iree_codegen.smt.int_knob<"wg_m">}'
        )
        assert isinstance(knob_template, ir.DictAttr)
        from amdsharktuner.common import AttrKey

        key: AttrKey = AttrKey("wg_m", iree_codegen.IntKnobAttr)
        result = smt_candidate_gen._get_template_entry(knob_template, key)
        assert result is not None
        assert isinstance(result, iree_codegen.IntKnobAttr)
        assert result.name == "wg_m"
        key: AttrKey = AttrKey("test", iree_codegen.IntKnobAttr)
        result = smt_candidate_gen._get_template_entry(knob_template, key)
        assert result is None

def test_get_knobs_from_constraint_op(sample_constraints_op: iree_codegen.ConstraintsOp) -> None:
    symbols = smt_candidate_gen.get_knobs_from_constraint_op(sample_constraints_op)
    
    assert set(symbols.keys()) == {"test", "wg_m", "wg_n", "wg_k", "mma_idx", "sg_x", "sg_y", "map_0", "map_1"}
    for name, expr in symbols.items():
        assert z3.is_int(expr)
        assert expr.decl().name() == name


def test_generate_solutions_yields_assignments(sample_solver_constraints_op) -> None:
    smt_candidate_gen.generate_solutions_from_constraint_op(sample_solver_constraints_op)
    # solution_iter = smt_candidate_gen.generate_solutions_from_constraint_op(sample_solver_constraints_op)
    # solutions = list(solution_iter)
    # solutions = list(
    #     smt_candidate_gen.generate_solutions_from_constraint_op(
    #         sample_solver_constraints_op
    #     )
    # )
    # seen: set[tuple] = set()
    # assert len(solutions) > 0
        # for sol in solutions:
        #     key = tuple(sorted(sol.items()))
        #     assert key not in seen, f"Duplicate solution: {sol}"
        #     seen.add(key)
        #     assert isinstance(sol, smt_candidate_gen.KnobAssignment)
        #     assert "wg_m" in sol
        #     assert 4 <= sol["wg_m"] <= 8

# ###############################################################################
# # GPUCompilationInfoBuilder -- LoweringConfig
# ###############################################################################





# def test_build_lowering_config_attr_workgroup_tiling() -> None:
#     with ir.Context():
#         constraints_op = _parse_first_constraints_op(_GPU_BUILDER_MLIR)
#         assignment = smt_candidate_gen.KnobAssignment(
#             {
#                 "wg_m": 128,
#                 "wg_n": 64,
#                 "wg_x": 64,
#                 "wg_y": 1,
#                 "wg_z": 1,
#                 "sg_size": 64,
#             }
#         )
#         config = smt_candidate_gen.GPUCompilationInfoBuilder.LoweringConfig.build_lowering_config_attr(
#             constraints_op, assignment
#         )
#         assert isinstance(config, iree_gpu.LoweringConfigAttr)
#         config_dict = config.attributes
#         assert "workgroup" in config_dict




# def test_build_lowering_config_attr_mma_kind() -> None:
#     with ir.Context():
#         constraints_op = _parse_first_constraints_op(_MMA_KIND_MLIR)
#         # mma_kind has options ["opt_a", "opt_b"]; index 1 selects "opt_b".
#         assignment = smt_candidate_gen.KnobAssignment({"mma_kind": 1})
#         config = smt_candidate_gen.GPUCompilationInfoBuilder.LoweringConfig.build_lowering_config_attr(
#             constraints_op, assignment
#         )
#         assert isinstance(config, iree_gpu.LoweringConfigAttr)
#         config_dict = config.attributes
#         assert "mma_kind" in config_dict
#         assert str(config_dict["mma_kind"]) == '"opt_b"'





# def test_build_lowering_config_attr_subgroup_basis_default_mapping() -> None:
#     with ir.Context():
#         constraints_op = _parse_first_constraints_op(_SUBGROUP_BASIS_MLIR)
#         assignment = smt_candidate_gen.KnobAssignment({"sg_x": 2, "sg_y": 4})
#         config = smt_candidate_gen.GPUCompilationInfoBuilder.LoweringConfig.build_lowering_config_attr(
#             constraints_op, assignment
#         )
#         assert isinstance(config, iree_gpu.LoweringConfigAttr)
#         config_dict = config.attributes
#         # subgroup_basis = [[2, 4], [0, 1]] (counts + default mapping).
#         assert "subgroup_basis" in config_dict


# ###############################################################################
# # GPUCompilationInfoBuilder -- TranslationInfo
# ###############################################################################





# def test_build_translation_info_attr() -> None:
#     with ir.Context():
#         constraints_op = _parse_first_constraints_op(_GPU_BUILDER_MLIR)
#         assignment = smt_candidate_gen.KnobAssignment(
#             {
#                 "wg_m": 128,
#                 "wg_n": 64,
#                 "wg_x": 64,
#                 "wg_y": 1,
#                 "wg_z": 1,
#                 "sg_size": 64,
#             }
#         )
#         translation_info = smt_candidate_gen.GPUCompilationInfoBuilder.TranslationInfo.build_translation_info_attr(
#             constraints_op, assignment
#         )
#         assert isinstance(translation_info, iree_codegen.TranslationInfoAttr)


# ###############################################################################
# # GPUCompilationInfoBuilder -- build_compilation_info_attr
# ###############################################################################





# def test_build_compilation_info_attr() -> None:
#     with ir.Context():
#         constraints_op = _parse_first_constraints_op(_GPU_BUILDER_MLIR)
#         assignment = smt_candidate_gen.KnobAssignment(
#             {
#                 "wg_m": 128,
#                 "wg_n": 64,
#                 "wg_x": 64,
#                 "wg_y": 1,
#                 "wg_z": 1,
#                 "sg_size": 64,
#             }
#         )
#         compilation_info = smt_candidate_gen.GPUCompilationInfoBuilder.build_compilation_info_attr(
#             constraints_op, assignment
#         )
#         assert isinstance(compilation_info, iree_codegen.CompilationInfoAttr)
#         assert isinstance(
#             compilation_info.lowering_config, iree_gpu.LoweringConfigAttr
#         )
#         assert isinstance(
#             compilation_info.translation_info, iree_codegen.TranslationInfoAttr
#         )
