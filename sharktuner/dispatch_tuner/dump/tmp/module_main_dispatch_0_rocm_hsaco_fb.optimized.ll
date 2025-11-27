; To reproduce the .optimized.ll from the .linked.ll, run:
; opt -S -mtriple=amdgcn-amd-amdhsa -mcpu=gfx942 --passes='verify,annotation2metadata,forceattrs,inferattrs,coro-early,function<eager-inv>(ee-instrument<>,lower-expect,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;no-switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,sroa<modify-cfg>,early-cse<>),openmp-opt,amdgpu-printf-runtime-binding,amdgpu-uniform-intrinsic-combine,ipsccp,called-value-propagation,globalopt,function<eager-inv>(mem2reg,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>),always-inline,require<globals-aa>,function(invalidate<aa>),require<profile-summary>,cgscc(devirt<4>(inline,function-attrs<skip-non-recursive-function-attrs>,openmp-opt-cgscc,function(amdgpu-promote-kernel-arguments,infer-address-spaces,amdgpu-lower-kernel-attributes,amdgpu-promote-alloca-to-vector),function<eager-inv;no-rerun>(sroa<modify-cfg>,early-cse<memssa>,speculative-execution<only-if-divergent-target>,jump-threading,correlated-propagation,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,aggressive-instcombine,libcalls-shrinkwrap,amdgpu-usenative,amdgpu-simplifylib,tailcallelim,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,reassociate,constraint-elimination,loop-mssa(loop-instsimplify,loop-simplifycfg,licm<no-allowspeculation>,loop-rotate<header-duplication;no-prepare-for-lto>,licm<allowspeculation>,simple-loop-unswitch<no-nontrivial;trivial>),simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,loop(loop-idiom,indvars,extra-simple-loop-unswitch-passes,loop-deletion,loop-unroll-full),sroa<modify-cfg>,vector-combine,mldst-motion<no-split-footer-bb>,gvn<>,sccp,bdce,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,jump-threading,correlated-propagation,adce,memcpyopt,dse,move-auto-init,loop-mssa(licm<allowspeculation>),coro-elide,infer-address-spaces,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;switch-to-arithmetic;no-switch-to-lookup;keep-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib),function-attrs,function(require<should-not-run-function-passes>),coro-split,coro-annotation-elide)),deadargelim,coro-cleanup,globalopt,globaldce,elim-avail-extern,rpo-function-attrs,recompute-globalsaa,function<eager-inv>(drop-unnecessary-assumes,float2int,lower-constant-intrinsics,loop(loop-rotate<header-duplication;no-prepare-for-lto>,loop-deletion),loop-distribute,inject-tli-mappings,loop-vectorize<no-interleave-forced-only;no-vectorize-forced-only;>,infer-alignment,loop-load-elim,instcombine<max-iterations=1;no-verify-fixpoint>,simplifycfg<bonus-inst-threshold=1;forward-switch-cond;switch-range-to-icmp;switch-to-arithmetic;switch-to-lookup;no-keep-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,slp-vectorizer,vector-combine,instcombine<max-iterations=1;no-verify-fixpoint>,loop-unroll<O2>,transform-warning,sroa<preserve-cfg>,infer-alignment,instcombine<max-iterations=1;no-verify-fixpoint>,loop-mssa(licm<allowspeculation>),alignment-from-assumptions,infer-address-spaces,loop-sink,instsimplify,div-rem-pairs,tailcallelim,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;speculate-unpredictables>),amdgpu-attributor,globaldce,constmerge,cg-profile,rel-lookup-table-converter,function(annotation-remarks),verify' <.linked.ll>
; The flag '-S' is to emit LLVMIR.
; The behavior of some passes depends on '-mtriple' and '-mcpu'.

; ModuleID = 'main_dispatch_0'
source_filename = "main_dispatch_0"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"

@__shared_memory___0 = private unnamed_addr addrspace(3) global [128 x [36 x half]] undef, align 16
@__shared_memory__ = private unnamed_addr addrspace(3) global [128 x [36 x half]] undef, align 16

; Function Attrs: alwaysinline nofree norecurse nounwind
define amdgpu_kernel void @main_dispatch_0_matmul_2048x1280x5120_f16xf16xf32(ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %0, ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %1, ptr addrspace(1) inreg noalias noundef nonnull align 16 %2) local_unnamed_addr #0 !reqd_work_group_size !2 {
  %4 = tail call range(i32 0, 256) i32 @llvm.amdgcn.workitem.id.x()
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %0, i64 64) ]
  %5 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %0, i16 0, i64 20971520, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %1, i64 64) ]
  %6 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %1, i16 0, i64 13107200, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %2, i64 64) ]
  %7 = and i32 %4, 15
  %8 = lshr i32 %4, 2
  %9 = and i32 %8, 12
  %10 = or disjoint i32 %8, 64
  %11 = shl nuw nsw i32 %4, 3
  %12 = and i32 %11, 24
  %13 = tail call range(i32 0, 160) i32 @llvm.amdgcn.workgroup.id.x()
  %.lhs.trunc = trunc nuw i32 %13 to i8
  %14 = udiv i8 %.lhs.trunc, 10
  %.zext = zext nneg i8 %14 to i32
  %15 = mul i8 %14, 10
  %.decomposed = sub i8 %.lhs.trunc, %15
  %.zext48 = zext nneg i8 %.decomposed to i32
  %16 = shl nuw nsw i32 %.zext, 7
  %17 = or disjoint i32 %16, %8
  %.idx = mul nuw nsw i32 %17, 10240
  %18 = getelementptr i8, ptr addrspace(7) %5, i32 %.idx
  %19 = getelementptr half, ptr addrspace(7) %18, i32 %12
  %20 = load <8 x half>, ptr addrspace(7) %19, align 2
  %21 = or disjoint i32 %16, %10
  %.idx49 = mul nuw nsw i32 %21, 10240
  %22 = getelementptr i8, ptr addrspace(7) %5, i32 %.idx49
  %23 = getelementptr half, ptr addrspace(7) %22, i32 %12
  %24 = load <8 x half>, ptr addrspace(7) %23, align 2
  %25 = shl nuw nsw i32 %.zext48, 7
  %26 = or disjoint i32 %25, %8
  %.idx50 = mul nuw nsw i32 %26, 10240
  %27 = getelementptr i8, ptr addrspace(7) %6, i32 %.idx50
  %28 = getelementptr half, ptr addrspace(7) %27, i32 %12
  %29 = load <8 x half>, ptr addrspace(7) %28, align 2
  %30 = or disjoint i32 %25, %10
  %.idx51 = mul nuw nsw i32 %30, 10240
  %31 = getelementptr i8, ptr addrspace(7) %6, i32 %.idx51
  %32 = getelementptr half, ptr addrspace(7) %31, i32 %12
  %33 = load <8 x half>, ptr addrspace(7) %32, align 2
  %narrow4 = mul nuw nsw i32 %8, 36
  %narrow5 = add nuw nsw i32 %narrow4, %12
  %34 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i32 %narrow5
  store <8 x half> %20, ptr addrspace(3) %34, align 8
  %narrow6 = mul nuw nsw i32 %10, 36
  %narrow7 = add nuw nsw i32 %narrow6, %12
  %35 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i32 %narrow7
  store <8 x half> %24, ptr addrspace(3) %35, align 8
  %36 = getelementptr half, ptr addrspace(3) @__shared_memory__, i32 %narrow5
  store <8 x half> %29, ptr addrspace(3) %36, align 8
  %37 = getelementptr half, ptr addrspace(3) @__shared_memory__, i32 %narrow7
  store <8 x half> %33, ptr addrspace(3) %37, align 8
  %38 = lshr i32 %4, 1
  %39 = and i32 %38, 64
  %40 = or disjoint i32 %39, %7
  %41 = or disjoint i32 %9, 16
  %42 = and i32 %4, 79
  %43 = or disjoint i32 %12, 32
  %narrow = mul nuw nsw i32 %40, 36
  %44 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i32 %9
  %45 = getelementptr half, ptr addrspace(3) %44, i32 %narrow
  %46 = getelementptr half, ptr addrspace(3) @__shared_memory___0, i32 %41
  %47 = getelementptr half, ptr addrspace(3) %46, i32 %narrow
  %48 = mul nuw nsw i32 %40, 36
  %narrow52 = add nuw nsw i32 %48, 576
  %49 = getelementptr half, ptr addrspace(3) %44, i32 %narrow52
  %50 = getelementptr half, ptr addrspace(3) %46, i32 %narrow52
  %51 = mul nuw nsw i32 %40, 36
  %narrow53 = add nuw nsw i32 %51, 1152
  %52 = getelementptr half, ptr addrspace(3) %44, i32 %narrow53
  %53 = getelementptr half, ptr addrspace(3) %46, i32 %narrow53
  %54 = mul nuw nsw i32 %40, 36
  %narrow54 = add nuw nsw i32 %54, 1728
  %55 = getelementptr half, ptr addrspace(3) %44, i32 %narrow54
  %56 = getelementptr half, ptr addrspace(3) %46, i32 %narrow54
  %narrow55 = mul nuw nsw i32 %42, 36
  %57 = getelementptr half, ptr addrspace(3) @__shared_memory__, i32 %9
  %58 = getelementptr half, ptr addrspace(3) %57, i32 %narrow55
  %59 = getelementptr half, ptr addrspace(3) @__shared_memory__, i32 %41
  %60 = getelementptr half, ptr addrspace(3) %59, i32 %narrow55
  %61 = mul nuw nsw i32 %42, 36
  %narrow56 = add nuw nsw i32 %61, 576
  %62 = getelementptr half, ptr addrspace(3) %57, i32 %narrow56
  %63 = getelementptr half, ptr addrspace(3) %59, i32 %narrow56
  %64 = mul nuw nsw i32 %42, 36
  %narrow57 = add nuw nsw i32 %64, 1152
  %65 = getelementptr half, ptr addrspace(3) %57, i32 %narrow57
  %66 = getelementptr half, ptr addrspace(3) %59, i32 %narrow57
  %67 = mul nuw nsw i32 %42, 36
  %narrow58 = add nuw nsw i32 %67, 1728
  %68 = getelementptr half, ptr addrspace(3) %57, i32 %narrow58
  %69 = getelementptr half, ptr addrspace(3) %59, i32 %narrow58
  br label %70

70:                                               ; preds = %3, %70
  %71 = phi [4 x [4 x [4 x <1 x float>]]] [ zeroinitializer, %3 ], [ %418, %70 ]
  %72 = phi i32 [ 0, %3 ], [ %419, %70 ]
  %73 = shl nuw nsw i32 %72, 4
  %74 = add nuw nsw i32 %43, %73
  %75 = getelementptr half, ptr addrspace(7) %18, i32 %74
  %76 = load <8 x half>, ptr addrspace(7) %75, align 2
  %77 = getelementptr half, ptr addrspace(7) %22, i32 %74
  %78 = load <8 x half>, ptr addrspace(7) %77, align 2
  %79 = getelementptr half, ptr addrspace(7) %27, i32 %74
  %80 = load <8 x half>, ptr addrspace(7) %79, align 2
  %81 = getelementptr half, ptr addrspace(7) %31, i32 %74
  %82 = load <8 x half>, ptr addrspace(7) %81, align 2
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %83 = load <4 x half>, ptr addrspace(3) %45, align 8
  %84 = load <4 x half>, ptr addrspace(3) %47, align 8
  %85 = load <4 x half>, ptr addrspace(3) %49, align 8
  %86 = load <4 x half>, ptr addrspace(3) %50, align 8
  %87 = load <4 x half>, ptr addrspace(3) %52, align 8
  %88 = load <4 x half>, ptr addrspace(3) %53, align 8
  %89 = load <4 x half>, ptr addrspace(3) %55, align 8
  %90 = load <4 x half>, ptr addrspace(3) %56, align 8
  %91 = load <4 x half>, ptr addrspace(3) %58, align 8
  %92 = load <4 x half>, ptr addrspace(3) %60, align 8
  %93 = load <4 x half>, ptr addrspace(3) %62, align 8
  %94 = load <4 x half>, ptr addrspace(3) %63, align 8
  %95 = load <4 x half>, ptr addrspace(3) %65, align 8
  %96 = load <4 x half>, ptr addrspace(3) %66, align 8
  %97 = load <4 x half>, ptr addrspace(3) %68, align 8
  %98 = load <4 x half>, ptr addrspace(3) %69, align 8
  %99 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 0, 0, 0
  %100 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 0, 0, 1
  %101 = shufflevector <1 x float> %99, <1 x float> %100, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %102 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 0, 0, 2
  %103 = shufflevector <1 x float> %102, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %104 = shufflevector <4 x float> %101, <4 x float> %103, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %105 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 0, 0, 3
  %106 = shufflevector <1 x float> %105, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %107 = shufflevector <4 x float> %104, <4 x float> %106, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %108 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %83, <4 x half> %91, <4 x float> %107, i32 0, i32 0, i32 0)
  %109 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 0, 1, 0
  %110 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 0, 1, 1
  %111 = shufflevector <1 x float> %109, <1 x float> %110, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %112 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 0, 1, 2
  %113 = shufflevector <1 x float> %112, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %114 = shufflevector <4 x float> %111, <4 x float> %113, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %115 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 0, 1, 3
  %116 = shufflevector <1 x float> %115, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %117 = shufflevector <4 x float> %114, <4 x float> %116, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %118 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %83, <4 x half> %93, <4 x float> %117, i32 0, i32 0, i32 0)
  %119 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 0, 2, 0
  %120 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 0, 2, 1
  %121 = shufflevector <1 x float> %119, <1 x float> %120, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %122 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 0, 2, 2
  %123 = shufflevector <1 x float> %122, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %124 = shufflevector <4 x float> %121, <4 x float> %123, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %125 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 0, 2, 3
  %126 = shufflevector <1 x float> %125, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %127 = shufflevector <4 x float> %124, <4 x float> %126, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %128 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %83, <4 x half> %95, <4 x float> %127, i32 0, i32 0, i32 0)
  %129 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 0, 3, 0
  %130 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 0, 3, 1
  %131 = shufflevector <1 x float> %129, <1 x float> %130, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %132 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 0, 3, 2
  %133 = shufflevector <1 x float> %132, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %134 = shufflevector <4 x float> %131, <4 x float> %133, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %135 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 0, 3, 3
  %136 = shufflevector <1 x float> %135, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %137 = shufflevector <4 x float> %134, <4 x float> %136, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %138 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %83, <4 x half> %97, <4 x float> %137, i32 0, i32 0, i32 0)
  %139 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 1, 0, 0
  %140 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 1, 0, 1
  %141 = shufflevector <1 x float> %139, <1 x float> %140, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %142 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 1, 0, 2
  %143 = shufflevector <1 x float> %142, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %144 = shufflevector <4 x float> %141, <4 x float> %143, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %145 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 1, 0, 3
  %146 = shufflevector <1 x float> %145, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %147 = shufflevector <4 x float> %144, <4 x float> %146, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %148 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %85, <4 x half> %91, <4 x float> %147, i32 0, i32 0, i32 0)
  %149 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 1, 1, 0
  %150 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 1, 1, 1
  %151 = shufflevector <1 x float> %149, <1 x float> %150, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %152 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 1, 1, 2
  %153 = shufflevector <1 x float> %152, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %154 = shufflevector <4 x float> %151, <4 x float> %153, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %155 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 1, 1, 3
  %156 = shufflevector <1 x float> %155, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %157 = shufflevector <4 x float> %154, <4 x float> %156, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %158 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %85, <4 x half> %93, <4 x float> %157, i32 0, i32 0, i32 0)
  %159 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 1, 2, 0
  %160 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 1, 2, 1
  %161 = shufflevector <1 x float> %159, <1 x float> %160, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %162 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 1, 2, 2
  %163 = shufflevector <1 x float> %162, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %164 = shufflevector <4 x float> %161, <4 x float> %163, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %165 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 1, 2, 3
  %166 = shufflevector <1 x float> %165, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %167 = shufflevector <4 x float> %164, <4 x float> %166, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %168 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %85, <4 x half> %95, <4 x float> %167, i32 0, i32 0, i32 0)
  %169 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 1, 3, 0
  %170 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 1, 3, 1
  %171 = shufflevector <1 x float> %169, <1 x float> %170, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %172 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 1, 3, 2
  %173 = shufflevector <1 x float> %172, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %174 = shufflevector <4 x float> %171, <4 x float> %173, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %175 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 1, 3, 3
  %176 = shufflevector <1 x float> %175, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %177 = shufflevector <4 x float> %174, <4 x float> %176, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %178 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %85, <4 x half> %97, <4 x float> %177, i32 0, i32 0, i32 0)
  %179 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 2, 0, 0
  %180 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 2, 0, 1
  %181 = shufflevector <1 x float> %179, <1 x float> %180, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %182 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 2, 0, 2
  %183 = shufflevector <1 x float> %182, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %184 = shufflevector <4 x float> %181, <4 x float> %183, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %185 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 2, 0, 3
  %186 = shufflevector <1 x float> %185, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %187 = shufflevector <4 x float> %184, <4 x float> %186, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %188 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %87, <4 x half> %91, <4 x float> %187, i32 0, i32 0, i32 0)
  %189 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 2, 1, 0
  %190 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 2, 1, 1
  %191 = shufflevector <1 x float> %189, <1 x float> %190, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %192 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 2, 1, 2
  %193 = shufflevector <1 x float> %192, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %194 = shufflevector <4 x float> %191, <4 x float> %193, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %195 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 2, 1, 3
  %196 = shufflevector <1 x float> %195, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %197 = shufflevector <4 x float> %194, <4 x float> %196, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %198 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %87, <4 x half> %93, <4 x float> %197, i32 0, i32 0, i32 0)
  %199 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 2, 2, 0
  %200 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 2, 2, 1
  %201 = shufflevector <1 x float> %199, <1 x float> %200, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %202 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 2, 2, 2
  %203 = shufflevector <1 x float> %202, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %204 = shufflevector <4 x float> %201, <4 x float> %203, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %205 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 2, 2, 3
  %206 = shufflevector <1 x float> %205, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %207 = shufflevector <4 x float> %204, <4 x float> %206, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %208 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %87, <4 x half> %95, <4 x float> %207, i32 0, i32 0, i32 0)
  %209 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 2, 3, 0
  %210 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 2, 3, 1
  %211 = shufflevector <1 x float> %209, <1 x float> %210, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %212 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 2, 3, 2
  %213 = shufflevector <1 x float> %212, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %214 = shufflevector <4 x float> %211, <4 x float> %213, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %215 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 2, 3, 3
  %216 = shufflevector <1 x float> %215, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %217 = shufflevector <4 x float> %214, <4 x float> %216, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %218 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %87, <4 x half> %97, <4 x float> %217, i32 0, i32 0, i32 0)
  %219 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 3, 0, 0
  %220 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 3, 0, 1
  %221 = shufflevector <1 x float> %219, <1 x float> %220, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %222 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 3, 0, 2
  %223 = shufflevector <1 x float> %222, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %224 = shufflevector <4 x float> %221, <4 x float> %223, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %225 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 3, 0, 3
  %226 = shufflevector <1 x float> %225, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %227 = shufflevector <4 x float> %224, <4 x float> %226, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %228 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %89, <4 x half> %91, <4 x float> %227, i32 0, i32 0, i32 0)
  %229 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 3, 1, 0
  %230 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 3, 1, 1
  %231 = shufflevector <1 x float> %229, <1 x float> %230, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %232 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 3, 1, 2
  %233 = shufflevector <1 x float> %232, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %234 = shufflevector <4 x float> %231, <4 x float> %233, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %235 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 3, 1, 3
  %236 = shufflevector <1 x float> %235, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %237 = shufflevector <4 x float> %234, <4 x float> %236, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %238 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %89, <4 x half> %93, <4 x float> %237, i32 0, i32 0, i32 0)
  %239 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 3, 2, 0
  %240 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 3, 2, 1
  %241 = shufflevector <1 x float> %239, <1 x float> %240, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %242 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 3, 2, 2
  %243 = shufflevector <1 x float> %242, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %244 = shufflevector <4 x float> %241, <4 x float> %243, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %245 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 3, 2, 3
  %246 = shufflevector <1 x float> %245, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %247 = shufflevector <4 x float> %244, <4 x float> %246, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %248 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %89, <4 x half> %95, <4 x float> %247, i32 0, i32 0, i32 0)
  %249 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 3, 3, 0
  %250 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 3, 3, 1
  %251 = shufflevector <1 x float> %249, <1 x float> %250, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %252 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 3, 3, 2
  %253 = shufflevector <1 x float> %252, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %254 = shufflevector <4 x float> %251, <4 x float> %253, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %255 = extractvalue [4 x [4 x [4 x <1 x float>]]] %71, 3, 3, 3
  %256 = shufflevector <1 x float> %255, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %257 = shufflevector <4 x float> %254, <4 x float> %256, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %258 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %89, <4 x half> %97, <4 x float> %257, i32 0, i32 0, i32 0)
  %259 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %84, <4 x half> %92, <4 x float> %108, i32 0, i32 0, i32 0)
  %260 = shufflevector <4 x float> %259, <4 x float> poison, <1 x i32> zeroinitializer
  %261 = insertvalue [4 x <1 x float>] poison, <1 x float> %260, 0
  %262 = shufflevector <4 x float> %259, <4 x float> poison, <1 x i32> <i32 1>
  %263 = insertvalue [4 x <1 x float>] %261, <1 x float> %262, 1
  %264 = shufflevector <4 x float> %259, <4 x float> poison, <1 x i32> <i32 2>
  %265 = insertvalue [4 x <1 x float>] %263, <1 x float> %264, 2
  %266 = shufflevector <4 x float> %259, <4 x float> poison, <1 x i32> <i32 3>
  %267 = insertvalue [4 x <1 x float>] %265, <1 x float> %266, 3
  %268 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %84, <4 x half> %94, <4 x float> %118, i32 0, i32 0, i32 0)
  %269 = shufflevector <4 x float> %268, <4 x float> poison, <1 x i32> zeroinitializer
  %270 = insertvalue [4 x <1 x float>] poison, <1 x float> %269, 0
  %271 = shufflevector <4 x float> %268, <4 x float> poison, <1 x i32> <i32 1>
  %272 = insertvalue [4 x <1 x float>] %270, <1 x float> %271, 1
  %273 = shufflevector <4 x float> %268, <4 x float> poison, <1 x i32> <i32 2>
  %274 = insertvalue [4 x <1 x float>] %272, <1 x float> %273, 2
  %275 = shufflevector <4 x float> %268, <4 x float> poison, <1 x i32> <i32 3>
  %276 = insertvalue [4 x <1 x float>] %274, <1 x float> %275, 3
  %277 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %84, <4 x half> %96, <4 x float> %128, i32 0, i32 0, i32 0)
  %278 = shufflevector <4 x float> %277, <4 x float> poison, <1 x i32> zeroinitializer
  %279 = insertvalue [4 x <1 x float>] poison, <1 x float> %278, 0
  %280 = shufflevector <4 x float> %277, <4 x float> poison, <1 x i32> <i32 1>
  %281 = insertvalue [4 x <1 x float>] %279, <1 x float> %280, 1
  %282 = shufflevector <4 x float> %277, <4 x float> poison, <1 x i32> <i32 2>
  %283 = insertvalue [4 x <1 x float>] %281, <1 x float> %282, 2
  %284 = shufflevector <4 x float> %277, <4 x float> poison, <1 x i32> <i32 3>
  %285 = insertvalue [4 x <1 x float>] %283, <1 x float> %284, 3
  %286 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %84, <4 x half> %98, <4 x float> %138, i32 0, i32 0, i32 0)
  %287 = shufflevector <4 x float> %286, <4 x float> poison, <1 x i32> zeroinitializer
  %288 = insertvalue [4 x <1 x float>] poison, <1 x float> %287, 0
  %289 = shufflevector <4 x float> %286, <4 x float> poison, <1 x i32> <i32 1>
  %290 = insertvalue [4 x <1 x float>] %288, <1 x float> %289, 1
  %291 = shufflevector <4 x float> %286, <4 x float> poison, <1 x i32> <i32 2>
  %292 = insertvalue [4 x <1 x float>] %290, <1 x float> %291, 2
  %293 = shufflevector <4 x float> %286, <4 x float> poison, <1 x i32> <i32 3>
  %294 = insertvalue [4 x <1 x float>] %292, <1 x float> %293, 3
  %295 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %86, <4 x half> %92, <4 x float> %148, i32 0, i32 0, i32 0)
  %296 = shufflevector <4 x float> %295, <4 x float> poison, <1 x i32> zeroinitializer
  %297 = insertvalue [4 x <1 x float>] poison, <1 x float> %296, 0
  %298 = shufflevector <4 x float> %295, <4 x float> poison, <1 x i32> <i32 1>
  %299 = insertvalue [4 x <1 x float>] %297, <1 x float> %298, 1
  %300 = shufflevector <4 x float> %295, <4 x float> poison, <1 x i32> <i32 2>
  %301 = insertvalue [4 x <1 x float>] %299, <1 x float> %300, 2
  %302 = shufflevector <4 x float> %295, <4 x float> poison, <1 x i32> <i32 3>
  %303 = insertvalue [4 x <1 x float>] %301, <1 x float> %302, 3
  %304 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %86, <4 x half> %94, <4 x float> %158, i32 0, i32 0, i32 0)
  %305 = shufflevector <4 x float> %304, <4 x float> poison, <1 x i32> zeroinitializer
  %306 = insertvalue [4 x <1 x float>] poison, <1 x float> %305, 0
  %307 = shufflevector <4 x float> %304, <4 x float> poison, <1 x i32> <i32 1>
  %308 = insertvalue [4 x <1 x float>] %306, <1 x float> %307, 1
  %309 = shufflevector <4 x float> %304, <4 x float> poison, <1 x i32> <i32 2>
  %310 = insertvalue [4 x <1 x float>] %308, <1 x float> %309, 2
  %311 = shufflevector <4 x float> %304, <4 x float> poison, <1 x i32> <i32 3>
  %312 = insertvalue [4 x <1 x float>] %310, <1 x float> %311, 3
  %313 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %86, <4 x half> %96, <4 x float> %168, i32 0, i32 0, i32 0)
  %314 = shufflevector <4 x float> %313, <4 x float> poison, <1 x i32> zeroinitializer
  %315 = insertvalue [4 x <1 x float>] poison, <1 x float> %314, 0
  %316 = shufflevector <4 x float> %313, <4 x float> poison, <1 x i32> <i32 1>
  %317 = insertvalue [4 x <1 x float>] %315, <1 x float> %316, 1
  %318 = shufflevector <4 x float> %313, <4 x float> poison, <1 x i32> <i32 2>
  %319 = insertvalue [4 x <1 x float>] %317, <1 x float> %318, 2
  %320 = shufflevector <4 x float> %313, <4 x float> poison, <1 x i32> <i32 3>
  %321 = insertvalue [4 x <1 x float>] %319, <1 x float> %320, 3
  %322 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %86, <4 x half> %98, <4 x float> %178, i32 0, i32 0, i32 0)
  %323 = shufflevector <4 x float> %322, <4 x float> poison, <1 x i32> zeroinitializer
  %324 = insertvalue [4 x <1 x float>] poison, <1 x float> %323, 0
  %325 = shufflevector <4 x float> %322, <4 x float> poison, <1 x i32> <i32 1>
  %326 = insertvalue [4 x <1 x float>] %324, <1 x float> %325, 1
  %327 = shufflevector <4 x float> %322, <4 x float> poison, <1 x i32> <i32 2>
  %328 = insertvalue [4 x <1 x float>] %326, <1 x float> %327, 2
  %329 = shufflevector <4 x float> %322, <4 x float> poison, <1 x i32> <i32 3>
  %330 = insertvalue [4 x <1 x float>] %328, <1 x float> %329, 3
  %331 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %88, <4 x half> %92, <4 x float> %188, i32 0, i32 0, i32 0)
  %332 = shufflevector <4 x float> %331, <4 x float> poison, <1 x i32> zeroinitializer
  %333 = insertvalue [4 x <1 x float>] poison, <1 x float> %332, 0
  %334 = shufflevector <4 x float> %331, <4 x float> poison, <1 x i32> <i32 1>
  %335 = insertvalue [4 x <1 x float>] %333, <1 x float> %334, 1
  %336 = shufflevector <4 x float> %331, <4 x float> poison, <1 x i32> <i32 2>
  %337 = insertvalue [4 x <1 x float>] %335, <1 x float> %336, 2
  %338 = shufflevector <4 x float> %331, <4 x float> poison, <1 x i32> <i32 3>
  %339 = insertvalue [4 x <1 x float>] %337, <1 x float> %338, 3
  %340 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %88, <4 x half> %94, <4 x float> %198, i32 0, i32 0, i32 0)
  %341 = shufflevector <4 x float> %340, <4 x float> poison, <1 x i32> zeroinitializer
  %342 = insertvalue [4 x <1 x float>] poison, <1 x float> %341, 0
  %343 = shufflevector <4 x float> %340, <4 x float> poison, <1 x i32> <i32 1>
  %344 = insertvalue [4 x <1 x float>] %342, <1 x float> %343, 1
  %345 = shufflevector <4 x float> %340, <4 x float> poison, <1 x i32> <i32 2>
  %346 = insertvalue [4 x <1 x float>] %344, <1 x float> %345, 2
  %347 = shufflevector <4 x float> %340, <4 x float> poison, <1 x i32> <i32 3>
  %348 = insertvalue [4 x <1 x float>] %346, <1 x float> %347, 3
  %349 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %88, <4 x half> %96, <4 x float> %208, i32 0, i32 0, i32 0)
  %350 = shufflevector <4 x float> %349, <4 x float> poison, <1 x i32> zeroinitializer
  %351 = insertvalue [4 x <1 x float>] poison, <1 x float> %350, 0
  %352 = shufflevector <4 x float> %349, <4 x float> poison, <1 x i32> <i32 1>
  %353 = insertvalue [4 x <1 x float>] %351, <1 x float> %352, 1
  %354 = shufflevector <4 x float> %349, <4 x float> poison, <1 x i32> <i32 2>
  %355 = insertvalue [4 x <1 x float>] %353, <1 x float> %354, 2
  %356 = shufflevector <4 x float> %349, <4 x float> poison, <1 x i32> <i32 3>
  %357 = insertvalue [4 x <1 x float>] %355, <1 x float> %356, 3
  %358 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %88, <4 x half> %98, <4 x float> %218, i32 0, i32 0, i32 0)
  %359 = shufflevector <4 x float> %358, <4 x float> poison, <1 x i32> zeroinitializer
  %360 = insertvalue [4 x <1 x float>] poison, <1 x float> %359, 0
  %361 = shufflevector <4 x float> %358, <4 x float> poison, <1 x i32> <i32 1>
  %362 = insertvalue [4 x <1 x float>] %360, <1 x float> %361, 1
  %363 = shufflevector <4 x float> %358, <4 x float> poison, <1 x i32> <i32 2>
  %364 = insertvalue [4 x <1 x float>] %362, <1 x float> %363, 2
  %365 = shufflevector <4 x float> %358, <4 x float> poison, <1 x i32> <i32 3>
  %366 = insertvalue [4 x <1 x float>] %364, <1 x float> %365, 3
  %367 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %90, <4 x half> %92, <4 x float> %228, i32 0, i32 0, i32 0)
  %368 = shufflevector <4 x float> %367, <4 x float> poison, <1 x i32> zeroinitializer
  %369 = insertvalue [4 x <1 x float>] poison, <1 x float> %368, 0
  %370 = shufflevector <4 x float> %367, <4 x float> poison, <1 x i32> <i32 1>
  %371 = insertvalue [4 x <1 x float>] %369, <1 x float> %370, 1
  %372 = shufflevector <4 x float> %367, <4 x float> poison, <1 x i32> <i32 2>
  %373 = insertvalue [4 x <1 x float>] %371, <1 x float> %372, 2
  %374 = shufflevector <4 x float> %367, <4 x float> poison, <1 x i32> <i32 3>
  %375 = insertvalue [4 x <1 x float>] %373, <1 x float> %374, 3
  %376 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %90, <4 x half> %94, <4 x float> %238, i32 0, i32 0, i32 0)
  %377 = shufflevector <4 x float> %376, <4 x float> poison, <1 x i32> zeroinitializer
  %378 = insertvalue [4 x <1 x float>] poison, <1 x float> %377, 0
  %379 = shufflevector <4 x float> %376, <4 x float> poison, <1 x i32> <i32 1>
  %380 = insertvalue [4 x <1 x float>] %378, <1 x float> %379, 1
  %381 = shufflevector <4 x float> %376, <4 x float> poison, <1 x i32> <i32 2>
  %382 = insertvalue [4 x <1 x float>] %380, <1 x float> %381, 2
  %383 = shufflevector <4 x float> %376, <4 x float> poison, <1 x i32> <i32 3>
  %384 = insertvalue [4 x <1 x float>] %382, <1 x float> %383, 3
  %385 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %90, <4 x half> %96, <4 x float> %248, i32 0, i32 0, i32 0)
  %386 = shufflevector <4 x float> %385, <4 x float> poison, <1 x i32> zeroinitializer
  %387 = insertvalue [4 x <1 x float>] poison, <1 x float> %386, 0
  %388 = shufflevector <4 x float> %385, <4 x float> poison, <1 x i32> <i32 1>
  %389 = insertvalue [4 x <1 x float>] %387, <1 x float> %388, 1
  %390 = shufflevector <4 x float> %385, <4 x float> poison, <1 x i32> <i32 2>
  %391 = insertvalue [4 x <1 x float>] %389, <1 x float> %390, 2
  %392 = shufflevector <4 x float> %385, <4 x float> poison, <1 x i32> <i32 3>
  %393 = insertvalue [4 x <1 x float>] %391, <1 x float> %392, 3
  %394 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %90, <4 x half> %98, <4 x float> %258, i32 0, i32 0, i32 0)
  %395 = shufflevector <4 x float> %394, <4 x float> poison, <1 x i32> zeroinitializer
  %396 = insertvalue [4 x <1 x float>] poison, <1 x float> %395, 0
  %397 = shufflevector <4 x float> %394, <4 x float> poison, <1 x i32> <i32 1>
  %398 = insertvalue [4 x <1 x float>] %396, <1 x float> %397, 1
  %399 = shufflevector <4 x float> %394, <4 x float> poison, <1 x i32> <i32 2>
  %400 = insertvalue [4 x <1 x float>] %398, <1 x float> %399, 2
  %401 = shufflevector <4 x float> %394, <4 x float> poison, <1 x i32> <i32 3>
  %402 = insertvalue [4 x <1 x float>] %400, <1 x float> %401, 3
  %403 = insertvalue [4 x [4 x [4 x <1 x float>]]] zeroinitializer, [4 x <1 x float>] %267, 0, 0
  %404 = insertvalue [4 x [4 x [4 x <1 x float>]]] %403, [4 x <1 x float>] %276, 0, 1
  %405 = insertvalue [4 x [4 x [4 x <1 x float>]]] %404, [4 x <1 x float>] %285, 0, 2
  %406 = insertvalue [4 x [4 x [4 x <1 x float>]]] %405, [4 x <1 x float>] %294, 0, 3
  %407 = insertvalue [4 x [4 x [4 x <1 x float>]]] %406, [4 x <1 x float>] %303, 1, 0
  %408 = insertvalue [4 x [4 x [4 x <1 x float>]]] %407, [4 x <1 x float>] %312, 1, 1
  %409 = insertvalue [4 x [4 x [4 x <1 x float>]]] %408, [4 x <1 x float>] %321, 1, 2
  %410 = insertvalue [4 x [4 x [4 x <1 x float>]]] %409, [4 x <1 x float>] %330, 1, 3
  %411 = insertvalue [4 x [4 x [4 x <1 x float>]]] %410, [4 x <1 x float>] %339, 2, 0
  %412 = insertvalue [4 x [4 x [4 x <1 x float>]]] %411, [4 x <1 x float>] %348, 2, 1
  %413 = insertvalue [4 x [4 x [4 x <1 x float>]]] %412, [4 x <1 x float>] %357, 2, 2
  %414 = insertvalue [4 x [4 x [4 x <1 x float>]]] %413, [4 x <1 x float>] %366, 2, 3
  %415 = insertvalue [4 x [4 x [4 x <1 x float>]]] %414, [4 x <1 x float>] %375, 3, 0
  %416 = insertvalue [4 x [4 x [4 x <1 x float>]]] %415, [4 x <1 x float>] %384, 3, 1
  %417 = insertvalue [4 x [4 x [4 x <1 x float>]]] %416, [4 x <1 x float>] %393, 3, 2
  %418 = insertvalue [4 x [4 x [4 x <1 x float>]]] %417, [4 x <1 x float>] %402, 3, 3
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  tail call void @llvm.amdgcn.sched.barrier(i32 0)
  store <8 x half> %76, ptr addrspace(3) %34, align 8
  store <8 x half> %78, ptr addrspace(3) %35, align 8
  store <8 x half> %80, ptr addrspace(3) %36, align 8
  store <8 x half> %82, ptr addrspace(3) %37, align 8
  %419 = add nuw nsw i32 %72, 2
  %420 = icmp samesign ult i32 %72, 316
  br i1 %420, label %70, label %421

421:                                              ; preds = %70
  %422 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %2, i16 0, i64 10485760, i32 159744)
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %423 = load <4 x half>, ptr addrspace(3) %45, align 8
  %424 = load <4 x half>, ptr addrspace(3) %47, align 8
  %425 = load <4 x half>, ptr addrspace(3) %49, align 8
  %426 = load <4 x half>, ptr addrspace(3) %50, align 8
  %427 = load <4 x half>, ptr addrspace(3) %52, align 8
  %428 = load <4 x half>, ptr addrspace(3) %53, align 8
  %429 = load <4 x half>, ptr addrspace(3) %55, align 8
  %430 = load <4 x half>, ptr addrspace(3) %56, align 8
  %431 = load <4 x half>, ptr addrspace(3) %58, align 8
  %432 = load <4 x half>, ptr addrspace(3) %60, align 8
  %433 = load <4 x half>, ptr addrspace(3) %62, align 8
  %434 = load <4 x half>, ptr addrspace(3) %63, align 8
  %435 = load <4 x half>, ptr addrspace(3) %65, align 8
  %436 = load <4 x half>, ptr addrspace(3) %66, align 8
  %437 = load <4 x half>, ptr addrspace(3) %68, align 8
  %438 = load <4 x half>, ptr addrspace(3) %69, align 8
  %439 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %423, <4 x half> %431, <4 x float> %259, i32 0, i32 0, i32 0)
  %440 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %423, <4 x half> %433, <4 x float> %268, i32 0, i32 0, i32 0)
  %441 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %423, <4 x half> %435, <4 x float> %277, i32 0, i32 0, i32 0)
  %442 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %423, <4 x half> %437, <4 x float> %286, i32 0, i32 0, i32 0)
  %443 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %425, <4 x half> %431, <4 x float> %295, i32 0, i32 0, i32 0)
  %444 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %425, <4 x half> %433, <4 x float> %304, i32 0, i32 0, i32 0)
  %445 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %425, <4 x half> %435, <4 x float> %313, i32 0, i32 0, i32 0)
  %446 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %425, <4 x half> %437, <4 x float> %322, i32 0, i32 0, i32 0)
  %447 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %427, <4 x half> %431, <4 x float> %331, i32 0, i32 0, i32 0)
  %448 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %427, <4 x half> %433, <4 x float> %340, i32 0, i32 0, i32 0)
  %449 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %427, <4 x half> %435, <4 x float> %349, i32 0, i32 0, i32 0)
  %450 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %427, <4 x half> %437, <4 x float> %358, i32 0, i32 0, i32 0)
  %451 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %429, <4 x half> %431, <4 x float> %367, i32 0, i32 0, i32 0)
  %452 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %429, <4 x half> %433, <4 x float> %376, i32 0, i32 0, i32 0)
  %453 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %429, <4 x half> %435, <4 x float> %385, i32 0, i32 0, i32 0)
  %454 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %429, <4 x half> %437, <4 x float> %394, i32 0, i32 0, i32 0)
  %455 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %424, <4 x half> %432, <4 x float> %439, i32 0, i32 0, i32 0)
  %456 = shufflevector <4 x float> %455, <4 x float> poison, <1 x i32> zeroinitializer
  %457 = shufflevector <4 x float> %455, <4 x float> poison, <1 x i32> <i32 1>
  %458 = shufflevector <4 x float> %455, <4 x float> poison, <1 x i32> <i32 2>
  %459 = shufflevector <4 x float> %455, <4 x float> poison, <1 x i32> <i32 3>
  %460 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %424, <4 x half> %434, <4 x float> %440, i32 0, i32 0, i32 0)
  %461 = shufflevector <4 x float> %460, <4 x float> poison, <1 x i32> zeroinitializer
  %462 = shufflevector <4 x float> %460, <4 x float> poison, <1 x i32> <i32 1>
  %463 = shufflevector <4 x float> %460, <4 x float> poison, <1 x i32> <i32 2>
  %464 = shufflevector <4 x float> %460, <4 x float> poison, <1 x i32> <i32 3>
  %465 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %424, <4 x half> %436, <4 x float> %441, i32 0, i32 0, i32 0)
  %466 = shufflevector <4 x float> %465, <4 x float> poison, <1 x i32> zeroinitializer
  %467 = shufflevector <4 x float> %465, <4 x float> poison, <1 x i32> <i32 1>
  %468 = shufflevector <4 x float> %465, <4 x float> poison, <1 x i32> <i32 2>
  %469 = shufflevector <4 x float> %465, <4 x float> poison, <1 x i32> <i32 3>
  %470 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %424, <4 x half> %438, <4 x float> %442, i32 0, i32 0, i32 0)
  %471 = shufflevector <4 x float> %470, <4 x float> poison, <1 x i32> zeroinitializer
  %472 = shufflevector <4 x float> %470, <4 x float> poison, <1 x i32> <i32 1>
  %473 = shufflevector <4 x float> %470, <4 x float> poison, <1 x i32> <i32 2>
  %474 = shufflevector <4 x float> %470, <4 x float> poison, <1 x i32> <i32 3>
  %475 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %426, <4 x half> %432, <4 x float> %443, i32 0, i32 0, i32 0)
  %476 = shufflevector <4 x float> %475, <4 x float> poison, <1 x i32> zeroinitializer
  %477 = shufflevector <4 x float> %475, <4 x float> poison, <1 x i32> <i32 1>
  %478 = shufflevector <4 x float> %475, <4 x float> poison, <1 x i32> <i32 2>
  %479 = shufflevector <4 x float> %475, <4 x float> poison, <1 x i32> <i32 3>
  %480 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %426, <4 x half> %434, <4 x float> %444, i32 0, i32 0, i32 0)
  %481 = shufflevector <4 x float> %480, <4 x float> poison, <1 x i32> zeroinitializer
  %482 = shufflevector <4 x float> %480, <4 x float> poison, <1 x i32> <i32 1>
  %483 = shufflevector <4 x float> %480, <4 x float> poison, <1 x i32> <i32 2>
  %484 = shufflevector <4 x float> %480, <4 x float> poison, <1 x i32> <i32 3>
  %485 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %426, <4 x half> %436, <4 x float> %445, i32 0, i32 0, i32 0)
  %486 = shufflevector <4 x float> %485, <4 x float> poison, <1 x i32> zeroinitializer
  %487 = shufflevector <4 x float> %485, <4 x float> poison, <1 x i32> <i32 1>
  %488 = shufflevector <4 x float> %485, <4 x float> poison, <1 x i32> <i32 2>
  %489 = shufflevector <4 x float> %485, <4 x float> poison, <1 x i32> <i32 3>
  %490 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %426, <4 x half> %438, <4 x float> %446, i32 0, i32 0, i32 0)
  %491 = shufflevector <4 x float> %490, <4 x float> poison, <1 x i32> zeroinitializer
  %492 = shufflevector <4 x float> %490, <4 x float> poison, <1 x i32> <i32 1>
  %493 = shufflevector <4 x float> %490, <4 x float> poison, <1 x i32> <i32 2>
  %494 = shufflevector <4 x float> %490, <4 x float> poison, <1 x i32> <i32 3>
  %495 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %428, <4 x half> %432, <4 x float> %447, i32 0, i32 0, i32 0)
  %496 = shufflevector <4 x float> %495, <4 x float> poison, <1 x i32> zeroinitializer
  %497 = shufflevector <4 x float> %495, <4 x float> poison, <1 x i32> <i32 1>
  %498 = shufflevector <4 x float> %495, <4 x float> poison, <1 x i32> <i32 2>
  %499 = shufflevector <4 x float> %495, <4 x float> poison, <1 x i32> <i32 3>
  %500 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %428, <4 x half> %434, <4 x float> %448, i32 0, i32 0, i32 0)
  %501 = shufflevector <4 x float> %500, <4 x float> poison, <1 x i32> zeroinitializer
  %502 = shufflevector <4 x float> %500, <4 x float> poison, <1 x i32> <i32 1>
  %503 = shufflevector <4 x float> %500, <4 x float> poison, <1 x i32> <i32 2>
  %504 = shufflevector <4 x float> %500, <4 x float> poison, <1 x i32> <i32 3>
  %505 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %428, <4 x half> %436, <4 x float> %449, i32 0, i32 0, i32 0)
  %506 = shufflevector <4 x float> %505, <4 x float> poison, <1 x i32> zeroinitializer
  %507 = shufflevector <4 x float> %505, <4 x float> poison, <1 x i32> <i32 1>
  %508 = shufflevector <4 x float> %505, <4 x float> poison, <1 x i32> <i32 2>
  %509 = shufflevector <4 x float> %505, <4 x float> poison, <1 x i32> <i32 3>
  %510 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %428, <4 x half> %438, <4 x float> %450, i32 0, i32 0, i32 0)
  %511 = shufflevector <4 x float> %510, <4 x float> poison, <1 x i32> zeroinitializer
  %512 = shufflevector <4 x float> %510, <4 x float> poison, <1 x i32> <i32 1>
  %513 = shufflevector <4 x float> %510, <4 x float> poison, <1 x i32> <i32 2>
  %514 = shufflevector <4 x float> %510, <4 x float> poison, <1 x i32> <i32 3>
  %515 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %430, <4 x half> %432, <4 x float> %451, i32 0, i32 0, i32 0)
  %516 = shufflevector <4 x float> %515, <4 x float> poison, <1 x i32> zeroinitializer
  %517 = shufflevector <4 x float> %515, <4 x float> poison, <1 x i32> <i32 1>
  %518 = shufflevector <4 x float> %515, <4 x float> poison, <1 x i32> <i32 2>
  %519 = shufflevector <4 x float> %515, <4 x float> poison, <1 x i32> <i32 3>
  %520 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %430, <4 x half> %434, <4 x float> %452, i32 0, i32 0, i32 0)
  %521 = shufflevector <4 x float> %520, <4 x float> poison, <1 x i32> zeroinitializer
  %522 = shufflevector <4 x float> %520, <4 x float> poison, <1 x i32> <i32 1>
  %523 = shufflevector <4 x float> %520, <4 x float> poison, <1 x i32> <i32 2>
  %524 = shufflevector <4 x float> %520, <4 x float> poison, <1 x i32> <i32 3>
  %525 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %430, <4 x half> %436, <4 x float> %453, i32 0, i32 0, i32 0)
  %526 = shufflevector <4 x float> %525, <4 x float> poison, <1 x i32> zeroinitializer
  %527 = shufflevector <4 x float> %525, <4 x float> poison, <1 x i32> <i32 1>
  %528 = shufflevector <4 x float> %525, <4 x float> poison, <1 x i32> <i32 2>
  %529 = shufflevector <4 x float> %525, <4 x float> poison, <1 x i32> <i32 3>
  %530 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half> %430, <4 x half> %438, <4 x float> %454, i32 0, i32 0, i32 0)
  %531 = shufflevector <4 x float> %530, <4 x float> poison, <1 x i32> zeroinitializer
  %532 = shufflevector <4 x float> %530, <4 x float> poison, <1 x i32> <i32 1>
  %533 = shufflevector <4 x float> %530, <4 x float> poison, <1 x i32> <i32 2>
  %534 = shufflevector <4 x float> %530, <4 x float> poison, <1 x i32> <i32 3>
  %535 = or disjoint i32 %9, %39
  %536 = or disjoint i32 %535, %16
  %537 = or disjoint i32 %42, %25
  %.idx74 = mul nuw nsw i32 %536, 5120
  %538 = getelementptr i8, ptr addrspace(7) %422, i32 %.idx74
  %539 = getelementptr float, ptr addrspace(7) %538, i32 %537
  store <1 x float> %456, ptr addrspace(7) %539, align 4
  %540 = or disjoint i32 %537, 16
  %541 = getelementptr float, ptr addrspace(7) %538, i32 %540
  store <1 x float> %461, ptr addrspace(7) %541, align 4
  %542 = or disjoint i32 %537, 32
  %543 = getelementptr float, ptr addrspace(7) %538, i32 %542
  store <1 x float> %466, ptr addrspace(7) %543, align 4
  %544 = or disjoint i32 %537, 48
  %545 = getelementptr float, ptr addrspace(7) %538, i32 %544
  store <1 x float> %471, ptr addrspace(7) %545, align 4
  %546 = getelementptr i8, ptr addrspace(7) %538, i32 5120
  %547 = getelementptr float, ptr addrspace(7) %546, i32 %537
  store <1 x float> %457, ptr addrspace(7) %547, align 4
  %548 = getelementptr float, ptr addrspace(7) %546, i32 %540
  store <1 x float> %462, ptr addrspace(7) %548, align 4
  %549 = getelementptr float, ptr addrspace(7) %546, i32 %542
  store <1 x float> %467, ptr addrspace(7) %549, align 4
  %550 = getelementptr float, ptr addrspace(7) %546, i32 %544
  store <1 x float> %472, ptr addrspace(7) %550, align 4
  %551 = getelementptr i8, ptr addrspace(7) %538, i32 10240
  %552 = getelementptr float, ptr addrspace(7) %551, i32 %537
  store <1 x float> %458, ptr addrspace(7) %552, align 4
  %553 = getelementptr float, ptr addrspace(7) %551, i32 %540
  store <1 x float> %463, ptr addrspace(7) %553, align 4
  %554 = getelementptr float, ptr addrspace(7) %551, i32 %542
  store <1 x float> %468, ptr addrspace(7) %554, align 4
  %555 = getelementptr float, ptr addrspace(7) %551, i32 %544
  store <1 x float> %473, ptr addrspace(7) %555, align 4
  %556 = getelementptr i8, ptr addrspace(7) %538, i32 15360
  %557 = getelementptr float, ptr addrspace(7) %556, i32 %537
  store <1 x float> %459, ptr addrspace(7) %557, align 4
  %558 = getelementptr float, ptr addrspace(7) %556, i32 %540
  store <1 x float> %464, ptr addrspace(7) %558, align 4
  %559 = getelementptr float, ptr addrspace(7) %556, i32 %542
  store <1 x float> %469, ptr addrspace(7) %559, align 4
  %560 = getelementptr float, ptr addrspace(7) %556, i32 %544
  store <1 x float> %474, ptr addrspace(7) %560, align 4
  %561 = getelementptr i8, ptr addrspace(7) %538, i32 81920
  %562 = getelementptr float, ptr addrspace(7) %561, i32 %537
  store <1 x float> %476, ptr addrspace(7) %562, align 4
  %563 = getelementptr float, ptr addrspace(7) %561, i32 %540
  store <1 x float> %481, ptr addrspace(7) %563, align 4
  %564 = getelementptr float, ptr addrspace(7) %561, i32 %542
  store <1 x float> %486, ptr addrspace(7) %564, align 4
  %565 = getelementptr float, ptr addrspace(7) %561, i32 %544
  store <1 x float> %491, ptr addrspace(7) %565, align 4
  %566 = getelementptr i8, ptr addrspace(7) %538, i32 87040
  %567 = getelementptr float, ptr addrspace(7) %566, i32 %537
  store <1 x float> %477, ptr addrspace(7) %567, align 4
  %568 = getelementptr float, ptr addrspace(7) %566, i32 %540
  store <1 x float> %482, ptr addrspace(7) %568, align 4
  %569 = getelementptr float, ptr addrspace(7) %566, i32 %542
  store <1 x float> %487, ptr addrspace(7) %569, align 4
  %570 = getelementptr float, ptr addrspace(7) %566, i32 %544
  store <1 x float> %492, ptr addrspace(7) %570, align 4
  %571 = getelementptr i8, ptr addrspace(7) %538, i32 92160
  %572 = getelementptr float, ptr addrspace(7) %571, i32 %537
  store <1 x float> %478, ptr addrspace(7) %572, align 4
  %573 = getelementptr float, ptr addrspace(7) %571, i32 %540
  store <1 x float> %483, ptr addrspace(7) %573, align 4
  %574 = getelementptr float, ptr addrspace(7) %571, i32 %542
  store <1 x float> %488, ptr addrspace(7) %574, align 4
  %575 = getelementptr float, ptr addrspace(7) %571, i32 %544
  store <1 x float> %493, ptr addrspace(7) %575, align 4
  %576 = getelementptr i8, ptr addrspace(7) %538, i32 97280
  %577 = getelementptr float, ptr addrspace(7) %576, i32 %537
  store <1 x float> %479, ptr addrspace(7) %577, align 4
  %578 = getelementptr float, ptr addrspace(7) %576, i32 %540
  store <1 x float> %484, ptr addrspace(7) %578, align 4
  %579 = getelementptr float, ptr addrspace(7) %576, i32 %542
  store <1 x float> %489, ptr addrspace(7) %579, align 4
  %580 = getelementptr float, ptr addrspace(7) %576, i32 %544
  store <1 x float> %494, ptr addrspace(7) %580, align 4
  %581 = getelementptr i8, ptr addrspace(7) %538, i32 163840
  %582 = getelementptr float, ptr addrspace(7) %581, i32 %537
  store <1 x float> %496, ptr addrspace(7) %582, align 4
  %583 = getelementptr float, ptr addrspace(7) %581, i32 %540
  store <1 x float> %501, ptr addrspace(7) %583, align 4
  %584 = getelementptr float, ptr addrspace(7) %581, i32 %542
  store <1 x float> %506, ptr addrspace(7) %584, align 4
  %585 = getelementptr float, ptr addrspace(7) %581, i32 %544
  store <1 x float> %511, ptr addrspace(7) %585, align 4
  %586 = getelementptr i8, ptr addrspace(7) %538, i32 168960
  %587 = getelementptr float, ptr addrspace(7) %586, i32 %537
  store <1 x float> %497, ptr addrspace(7) %587, align 4
  %588 = getelementptr float, ptr addrspace(7) %586, i32 %540
  store <1 x float> %502, ptr addrspace(7) %588, align 4
  %589 = getelementptr float, ptr addrspace(7) %586, i32 %542
  store <1 x float> %507, ptr addrspace(7) %589, align 4
  %590 = getelementptr float, ptr addrspace(7) %586, i32 %544
  store <1 x float> %512, ptr addrspace(7) %590, align 4
  %591 = getelementptr i8, ptr addrspace(7) %538, i32 174080
  %592 = getelementptr float, ptr addrspace(7) %591, i32 %537
  store <1 x float> %498, ptr addrspace(7) %592, align 4
  %593 = getelementptr float, ptr addrspace(7) %591, i32 %540
  store <1 x float> %503, ptr addrspace(7) %593, align 4
  %594 = getelementptr float, ptr addrspace(7) %591, i32 %542
  store <1 x float> %508, ptr addrspace(7) %594, align 4
  %595 = getelementptr float, ptr addrspace(7) %591, i32 %544
  store <1 x float> %513, ptr addrspace(7) %595, align 4
  %596 = getelementptr i8, ptr addrspace(7) %538, i32 179200
  %597 = getelementptr float, ptr addrspace(7) %596, i32 %537
  store <1 x float> %499, ptr addrspace(7) %597, align 4
  %598 = getelementptr float, ptr addrspace(7) %596, i32 %540
  store <1 x float> %504, ptr addrspace(7) %598, align 4
  %599 = getelementptr float, ptr addrspace(7) %596, i32 %542
  store <1 x float> %509, ptr addrspace(7) %599, align 4
  %600 = getelementptr float, ptr addrspace(7) %596, i32 %544
  store <1 x float> %514, ptr addrspace(7) %600, align 4
  %601 = getelementptr i8, ptr addrspace(7) %538, i32 245760
  %602 = getelementptr float, ptr addrspace(7) %601, i32 %537
  store <1 x float> %516, ptr addrspace(7) %602, align 4
  %603 = getelementptr float, ptr addrspace(7) %601, i32 %540
  store <1 x float> %521, ptr addrspace(7) %603, align 4
  %604 = getelementptr float, ptr addrspace(7) %601, i32 %542
  store <1 x float> %526, ptr addrspace(7) %604, align 4
  %605 = getelementptr float, ptr addrspace(7) %601, i32 %544
  store <1 x float> %531, ptr addrspace(7) %605, align 4
  %606 = getelementptr i8, ptr addrspace(7) %538, i32 250880
  %607 = getelementptr float, ptr addrspace(7) %606, i32 %537
  store <1 x float> %517, ptr addrspace(7) %607, align 4
  %608 = getelementptr float, ptr addrspace(7) %606, i32 %540
  store <1 x float> %522, ptr addrspace(7) %608, align 4
  %609 = getelementptr float, ptr addrspace(7) %606, i32 %542
  store <1 x float> %527, ptr addrspace(7) %609, align 4
  %610 = getelementptr float, ptr addrspace(7) %606, i32 %544
  store <1 x float> %532, ptr addrspace(7) %610, align 4
  %611 = getelementptr i8, ptr addrspace(7) %538, i32 256000
  %612 = getelementptr float, ptr addrspace(7) %611, i32 %537
  store <1 x float> %518, ptr addrspace(7) %612, align 4
  %613 = getelementptr float, ptr addrspace(7) %611, i32 %540
  store <1 x float> %523, ptr addrspace(7) %613, align 4
  %614 = getelementptr float, ptr addrspace(7) %611, i32 %542
  store <1 x float> %528, ptr addrspace(7) %614, align 4
  %615 = getelementptr float, ptr addrspace(7) %611, i32 %544
  store <1 x float> %533, ptr addrspace(7) %615, align 4
  %616 = getelementptr i8, ptr addrspace(7) %538, i32 261120
  %617 = getelementptr float, ptr addrspace(7) %616, i32 %537
  store <1 x float> %519, ptr addrspace(7) %617, align 4
  %618 = getelementptr float, ptr addrspace(7) %616, i32 %540
  store <1 x float> %524, ptr addrspace(7) %618, align 4
  %619 = getelementptr float, ptr addrspace(7) %616, i32 %542
  store <1 x float> %529, ptr addrspace(7) %619, align 4
  %620 = getelementptr float, ptr addrspace(7) %616, i32 %544
  store <1 x float> %534, ptr addrspace(7) %620, align 4
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  ret void
}

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) readnone, i16, i64, i32) #1

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: alwaysinline convergent mustprogress nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #3

; Function Attrs: alwaysinline convergent mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x float> @llvm.amdgcn.mfma.f32.16x16x16f16(<4 x half>, <4 x half>, <4 x float>, i32 immarg, i32 immarg, i32 immarg) #4

; Function Attrs: alwaysinline convergent mustprogress nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.sched.barrier(i32 immarg) #3

attributes #0 = { alwaysinline nofree norecurse nounwind "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="256,256" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "uniform-work-group-size"="true" }
attributes #1 = { alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #3 = { alwaysinline convergent mustprogress nocallback nofree nounwind willreturn }
attributes #4 = { alwaysinline convergent mustprogress nocallback nofree nosync nounwind willreturn memory(none) }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"amdhsa_code_object_version", i32 500}
!2 = !{i32 256, i32 1, i32 1}
!3 = !{!"amdgpu-synchronize-as", !"local"}
