
; To reproduce the .optimized.ll from the .linked.ll, run:
; opt -S -mtriple=amdgcn-amd-amdhsa -mcpu=gfx942 --passes='verify,annotation2metadata,forceattrs,inferattrs,coro-early,function<eager-inv>(ee-instrument<>,lower-expect,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;no-switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,sroa<modify-cfg>,early-cse<>),openmp-opt,amdgpu-printf-runtime-binding,ipsccp,called-value-propagation,globalopt,function<eager-inv>(mem2reg,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>),always-inline,require<globals-aa>,function(invalidate<aa>),require<profile-summary>,cgscc(devirt<4>(inline,function-attrs<skip-non-recursive-function-attrs>,openmp-opt-cgscc,function(amdgpu-promote-kernel-arguments,infer-address-spaces,amdgpu-lower-kernel-attributes,amdgpu-promote-alloca-to-vector),function<eager-inv;no-rerun>(sroa<modify-cfg>,early-cse<memssa>,speculative-execution<only-if-divergent-target>,jump-threading,correlated-propagation,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,aggressive-instcombine,libcalls-shrinkwrap,amdgpu-usenative,amdgpu-simplifylib,tailcallelim,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,reassociate,constraint-elimination,loop-mssa(loop-instsimplify,loop-simplifycfg,licm<no-allowspeculation>,loop-rotate<header-duplication;no-prepare-for-lto>,licm<allowspeculation>,simple-loop-unswitch<no-nontrivial;trivial>),simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,loop(loop-idiom,indvars,extra-simple-loop-unswitch-passes,loop-deletion,loop-unroll-full),sroa<modify-cfg>,vector-combine,mldst-motion<no-split-footer-bb>,gvn<>,sccp,bdce,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,jump-threading,correlated-propagation,adce,memcpyopt,dse,move-auto-init,loop-mssa(licm<allowspeculation>),coro-elide,infer-address-spaces,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib),function-attrs,function(require<should-not-run-function-passes>),coro-split,coro-annotation-elide)),deadargelim,coro-cleanup,globalopt,globaldce,elim-avail-extern,rpo-function-attrs,recompute-globalsaa,function<eager-inv>(float2int,lower-constant-intrinsics,loop(loop-rotate<header-duplication;no-prepare-for-lto>,loop-deletion),loop-distribute,inject-tli-mappings,loop-vectorize<no-interleave-forced-only;no-vectorize-forced-only;>,infer-alignment,loop-load-elim,instcombine<max-iterations=1;no-verify-fixpoint>,simplifycfg<bonus-inst-threshold=1;forward-switch-cond;switch-range-to-icmp;switch-to-lookup;no-keep-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,slp-vectorizer,vector-combine,instcombine<max-iterations=1;no-verify-fixpoint>,loop-unroll<O2>,transform-warning,sroa<preserve-cfg>,infer-alignment,instcombine<max-iterations=1;no-verify-fixpoint>,loop-mssa(licm<allowspeculation>),alignment-from-assumptions,infer-address-spaces,loop-sink,instsimplify,div-rem-pairs,tailcallelim,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist-common-insts;hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;speculate-unpredictables>),amdgpu-attributor,globaldce,constmerge,cg-profile,rel-lookup-table-converter,function(annotation-remarks),verify'
; The flag '-S' to emit LLVMIR.
; The behavior of some passes depends on '-mtriple' and '-mcpu'

; ModuleID = 'main_dispatch_0'
source_filename = "main_dispatch_0"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"

@__shared_memory___0 = private unnamed_addr addrspace(3) global [64 x [264 x i8]] undef, align 16
@__shared_memory__ = private unnamed_addr addrspace(3) global [64 x [264 x i8]] undef, align 16

; Function Attrs: alwaysinline nofree norecurse nounwind
define amdgpu_kernel void @main_dispatch_0_matmul_64x640x2048_f8E4M3FNUZxf8E4M3FNUZxf32(ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %0, ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %1, ptr addrspace(1) inreg noalias noundef nonnull align 16 %2) local_unnamed_addr #0 !reqd_work_group_size !2 {
  %4 = tail call range(i32 0, 256) i32 @llvm.amdgcn.workitem.id.x()
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %0, i64 64) ]
  %5 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %0, i16 0, i32 131072, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %1, i64 64) ]
  %6 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %1, i16 0, i32 1310720, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %2, i64 64) ]
  %7 = tail call range(i32 0, 10) i32 @llvm.amdgcn.workgroup.id.x()
  %8 = shl nuw nsw i32 %7, 6
  %9 = lshr i32 %4, 4
  %10 = and i32 %4, 15
  %11 = or disjoint i32 %9, 16
  %12 = or disjoint i32 %9, 32
  %13 = or disjoint i32 %9, 48
  %14 = or disjoint i32 %9, %8
  %15 = shl nuw nsw i32 %10, 4
  %16 = and i32 %9, 3
  %17 = lshr i32 %4, 2
  %18 = and i32 %17, 32
  %19 = or disjoint i32 %18, %10
  %20 = shl nuw nsw i32 %16, 3
  %21 = or disjoint i32 %20, 32
  %22 = or disjoint i32 %20, 64
  %23 = or disjoint i32 %20, 96
  %24 = or disjoint i32 %20, 128
  %25 = or disjoint i32 %20, 160
  %26 = or disjoint i32 %20, 192
  %27 = or disjoint i32 %20, 224
  %28 = lshr i32 %4, 1
  %29 = and i32 %28, 32
  %30 = or disjoint i32 %29, %10
  %31 = shl nuw nsw i32 %9, 11
  %32 = getelementptr i8, ptr addrspace(7) %5, i32 %31
  %33 = shl nuw nsw i32 %11, 11
  %34 = getelementptr i8, ptr addrspace(7) %5, i32 %33
  %35 = shl nuw nsw i32 %12, 11
  %36 = getelementptr i8, ptr addrspace(7) %5, i32 %35
  %37 = shl nuw nsw i32 %13, 11
  %38 = getelementptr i8, ptr addrspace(7) %5, i32 %37
  %39 = shl nuw nsw i32 %14, 11
  %40 = getelementptr i8, ptr addrspace(7) %6, i32 %39
  %narrow17 = mul nuw nsw i32 %9, 264
  %narrow18 = add nuw nsw i32 %narrow17, %15
  %41 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %narrow18
  %narrow19 = mul nuw nsw i32 %11, 264
  %narrow20 = add nuw nsw i32 %narrow19, %15
  %42 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %narrow20
  %narrow21 = mul nuw nsw i32 %12, 264
  %narrow22 = add nuw nsw i32 %narrow21, %15
  %43 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %narrow22
  %narrow23 = mul nuw nsw i32 %13, 264
  %narrow24 = add nuw nsw i32 %narrow23, %15
  %44 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %narrow24
  %45 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow18
  %46 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow20
  %47 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow22
  %48 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow24
  %narrow25 = mul nuw nsw i32 %19, 264
  %49 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %narrow25
  %50 = getelementptr i8, ptr addrspace(3) %49, i32 %20
  %51 = getelementptr i8, ptr addrspace(3) %49, i32 %21
  %52 = getelementptr i8, ptr addrspace(3) %49, i32 %22
  %53 = getelementptr i8, ptr addrspace(3) %49, i32 %23
  %54 = getelementptr i8, ptr addrspace(3) %49, i32 %24
  %55 = getelementptr i8, ptr addrspace(3) %49, i32 %25
  %56 = getelementptr i8, ptr addrspace(3) %49, i32 %26
  %57 = getelementptr i8, ptr addrspace(3) %49, i32 %27
  %58 = getelementptr i8, ptr addrspace(3) %49, i32 4224
  %59 = getelementptr i8, ptr addrspace(3) %58, i32 %20
  %60 = getelementptr i8, ptr addrspace(3) %58, i32 %21
  %61 = getelementptr i8, ptr addrspace(3) %58, i32 %22
  %62 = getelementptr i8, ptr addrspace(3) %58, i32 %23
  %63 = getelementptr i8, ptr addrspace(3) %58, i32 %24
  %64 = getelementptr i8, ptr addrspace(3) %58, i32 %25
  %65 = getelementptr i8, ptr addrspace(3) %58, i32 %26
  %66 = getelementptr i8, ptr addrspace(3) %58, i32 %27
  %narrow29 = mul nuw nsw i32 %30, 264
  %67 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow29
  %68 = getelementptr i8, ptr addrspace(3) %67, i32 %20
  %69 = getelementptr i8, ptr addrspace(3) %67, i32 %21
  %70 = getelementptr i8, ptr addrspace(3) %67, i32 %22
  %71 = getelementptr i8, ptr addrspace(3) %67, i32 %23
  %72 = getelementptr i8, ptr addrspace(3) %67, i32 %24
  %73 = getelementptr i8, ptr addrspace(3) %67, i32 %25
  %74 = getelementptr i8, ptr addrspace(3) %67, i32 %26
  %75 = getelementptr i8, ptr addrspace(3) %67, i32 %27
  %76 = getelementptr i8, ptr addrspace(3) %67, i32 4224
  %77 = getelementptr i8, ptr addrspace(3) %76, i32 %20
  %78 = getelementptr i8, ptr addrspace(3) %76, i32 %21
  %79 = getelementptr i8, ptr addrspace(3) %76, i32 %22
  %80 = getelementptr i8, ptr addrspace(3) %76, i32 %23
  %81 = getelementptr i8, ptr addrspace(3) %76, i32 %24
  %82 = getelementptr i8, ptr addrspace(3) %76, i32 %25
  %83 = getelementptr i8, ptr addrspace(3) %76, i32 %26
  %84 = getelementptr i8, ptr addrspace(3) %76, i32 %27
  br label %85

85:                                               ; preds = %3, %85
  %86 = phi [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] [ zeroinitializer, %3 ], [ %240, %85 ]
  %87 = phi i32 [ 0, %3 ], [ %241, %85 ]
  tail call void @llvm.amdgcn.s.waitcnt(i32 -7937)
  tail call void @llvm.amdgcn.s.barrier()
  %88 = or disjoint i32 %87, %15
  %89 = getelementptr i8, ptr addrspace(7) %32, i32 %88
  %90 = load <16 x i8>, ptr addrspace(7) %89, align 1
  %91 = getelementptr i8, ptr addrspace(7) %34, i32 %88
  %92 = load <16 x i8>, ptr addrspace(7) %91, align 1
  %93 = getelementptr i8, ptr addrspace(7) %36, i32 %88
  %94 = load <16 x i8>, ptr addrspace(7) %93, align 1
  %95 = getelementptr i8, ptr addrspace(7) %38, i32 %88
  %96 = load <16 x i8>, ptr addrspace(7) %95, align 1
  %97 = getelementptr i8, ptr addrspace(7) %40, i32 %88
  %98 = load <16 x i8>, ptr addrspace(7) %97, align 1
  %99 = getelementptr i8, ptr addrspace(7) %97, i32 32768
  %100 = load <16 x i8>, ptr addrspace(7) %99, align 1
  %101 = getelementptr i8, ptr addrspace(7) %97, i32 65536
  %102 = load <16 x i8>, ptr addrspace(7) %101, align 1
  %103 = getelementptr i8, ptr addrspace(7) %97, i32 98304
  %104 = load <16 x i8>, ptr addrspace(7) %103, align 1
  store <16 x i8> %90, ptr addrspace(3) %41, align 8
  store <16 x i8> %92, ptr addrspace(3) %42, align 8
  store <16 x i8> %94, ptr addrspace(3) %43, align 8
  store <16 x i8> %96, ptr addrspace(3) %44, align 8
  store <16 x i8> %98, ptr addrspace(3) %45, align 8
  store <16 x i8> %100, ptr addrspace(3) %46, align 8
  store <16 x i8> %102, ptr addrspace(3) %47, align 8
  store <16 x i8> %104, ptr addrspace(3) %48, align 8
  tail call void @llvm.amdgcn.s.waitcnt(i32 -7937)
  tail call void @llvm.amdgcn.s.barrier()
  %105 = load i64, ptr addrspace(3) %50, align 8
  %106 = load i64, ptr addrspace(3) %51, align 8
  %107 = load i64, ptr addrspace(3) %52, align 8
  %108 = load i64, ptr addrspace(3) %53, align 8
  %109 = load i64, ptr addrspace(3) %54, align 8
  %110 = load i64, ptr addrspace(3) %55, align 8
  %111 = load i64, ptr addrspace(3) %56, align 8
  %112 = load i64, ptr addrspace(3) %57, align 8
  %113 = load i64, ptr addrspace(3) %59, align 8
  %114 = load i64, ptr addrspace(3) %60, align 8
  %115 = load i64, ptr addrspace(3) %61, align 8
  %116 = load i64, ptr addrspace(3) %62, align 8
  %117 = load i64, ptr addrspace(3) %63, align 8
  %118 = load i64, ptr addrspace(3) %64, align 8
  %119 = load i64, ptr addrspace(3) %65, align 8
  %120 = load i64, ptr addrspace(3) %66, align 8
  %121 = load i64, ptr addrspace(3) %68, align 8
  %122 = load i64, ptr addrspace(3) %69, align 8
  %123 = load i64, ptr addrspace(3) %70, align 8
  %124 = load i64, ptr addrspace(3) %71, align 8
  %125 = load i64, ptr addrspace(3) %72, align 8
  %126 = load i64, ptr addrspace(3) %73, align 8
  %127 = load i64, ptr addrspace(3) %74, align 8
  %128 = load i64, ptr addrspace(3) %75, align 8
  %129 = load i64, ptr addrspace(3) %77, align 8
  %130 = load i64, ptr addrspace(3) %78, align 8
  %131 = load i64, ptr addrspace(3) %79, align 8
  %132 = load i64, ptr addrspace(3) %80, align 8
  %133 = load i64, ptr addrspace(3) %81, align 8
  %134 = load i64, ptr addrspace(3) %82, align 8
  %135 = load i64, ptr addrspace(3) %83, align 8
  %136 = load i64, ptr addrspace(3) %84, align 8
  %137 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %86, 0, 0, 0, 0, 0
  %138 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %86, 0, 0, 0, 0, 1
  %139 = shufflevector <1 x float> %137, <1 x float> %138, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %140 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %86, 0, 0, 0, 0, 2
  %141 = shufflevector <1 x float> %140, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %142 = shufflevector <4 x float> %139, <4 x float> %141, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %143 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %86, 0, 0, 0, 0, 3
  %144 = shufflevector <1 x float> %143, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %145 = shufflevector <4 x float> %142, <4 x float> %144, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %146 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %105, i64 %121, <4 x float> %145, i32 0, i32 0, i32 0)
  %147 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %106, i64 %122, <4 x float> %146, i32 0, i32 0, i32 0)
  %148 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %107, i64 %123, <4 x float> %147, i32 0, i32 0, i32 0)
  %149 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %108, i64 %124, <4 x float> %148, i32 0, i32 0, i32 0)
  %150 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %109, i64 %125, <4 x float> %149, i32 0, i32 0, i32 0)
  %151 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %110, i64 %126, <4 x float> %150, i32 0, i32 0, i32 0)
  %152 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %111, i64 %127, <4 x float> %151, i32 0, i32 0, i32 0)
  %153 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %112, i64 %128, <4 x float> %152, i32 0, i32 0, i32 0)
  %154 = shufflevector <4 x float> %153, <4 x float> poison, <1 x i32> zeroinitializer
  %155 = insertvalue [1 x [1 x [4 x <1 x float>]]] poison, <1 x float> %154, 0, 0, 0
  %156 = shufflevector <4 x float> %153, <4 x float> poison, <1 x i32> <i32 1>
  %157 = insertvalue [1 x [1 x [4 x <1 x float>]]] %155, <1 x float> %156, 0, 0, 1
  %158 = shufflevector <4 x float> %153, <4 x float> poison, <1 x i32> <i32 2>
  %159 = insertvalue [1 x [1 x [4 x <1 x float>]]] %157, <1 x float> %158, 0, 0, 2
  %160 = shufflevector <4 x float> %153, <4 x float> poison, <1 x i32> <i32 3>
  %161 = insertvalue [1 x [1 x [4 x <1 x float>]]] %159, <1 x float> %160, 0, 0, 3
  %162 = insertvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] zeroinitializer, [1 x [1 x [4 x <1 x float>]]] %161, 0, 0
  %163 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %86, 0, 1, 0, 0, 0
  %164 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %86, 0, 1, 0, 0, 1
  %165 = shufflevector <1 x float> %163, <1 x float> %164, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %166 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %86, 0, 1, 0, 0, 2
  %167 = shufflevector <1 x float> %166, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %168 = shufflevector <4 x float> %165, <4 x float> %167, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %169 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %86, 0, 1, 0, 0, 3
  %170 = shufflevector <1 x float> %169, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %171 = shufflevector <4 x float> %168, <4 x float> %170, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %172 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %105, i64 %129, <4 x float> %171, i32 0, i32 0, i32 0)
  %173 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %106, i64 %130, <4 x float> %172, i32 0, i32 0, i32 0)
  %174 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %107, i64 %131, <4 x float> %173, i32 0, i32 0, i32 0)
  %175 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %108, i64 %132, <4 x float> %174, i32 0, i32 0, i32 0)
  %176 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %109, i64 %133, <4 x float> %175, i32 0, i32 0, i32 0)
  %177 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %110, i64 %134, <4 x float> %176, i32 0, i32 0, i32 0)
  %178 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %111, i64 %135, <4 x float> %177, i32 0, i32 0, i32 0)
  %179 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %112, i64 %136, <4 x float> %178, i32 0, i32 0, i32 0)
  %180 = shufflevector <4 x float> %179, <4 x float> poison, <1 x i32> zeroinitializer
  %181 = insertvalue [1 x [1 x [4 x <1 x float>]]] poison, <1 x float> %180, 0, 0, 0
  %182 = shufflevector <4 x float> %179, <4 x float> poison, <1 x i32> <i32 1>
  %183 = insertvalue [1 x [1 x [4 x <1 x float>]]] %181, <1 x float> %182, 0, 0, 1
  %184 = shufflevector <4 x float> %179, <4 x float> poison, <1 x i32> <i32 2>
  %185 = insertvalue [1 x [1 x [4 x <1 x float>]]] %183, <1 x float> %184, 0, 0, 2
  %186 = shufflevector <4 x float> %179, <4 x float> poison, <1 x i32> <i32 3>
  %187 = insertvalue [1 x [1 x [4 x <1 x float>]]] %185, <1 x float> %186, 0, 0, 3
  %188 = insertvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %162, [1 x [1 x [4 x <1 x float>]]] %187, 0, 1
  %189 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %86, 1, 0, 0, 0, 0
  %190 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %86, 1, 0, 0, 0, 1
  %191 = shufflevector <1 x float> %189, <1 x float> %190, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %192 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %86, 1, 0, 0, 0, 2
  %193 = shufflevector <1 x float> %192, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %194 = shufflevector <4 x float> %191, <4 x float> %193, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %195 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %86, 1, 0, 0, 0, 3
  %196 = shufflevector <1 x float> %195, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %197 = shufflevector <4 x float> %194, <4 x float> %196, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %198 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %113, i64 %121, <4 x float> %197, i32 0, i32 0, i32 0)
  %199 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %114, i64 %122, <4 x float> %198, i32 0, i32 0, i32 0)
  %200 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %115, i64 %123, <4 x float> %199, i32 0, i32 0, i32 0)
  %201 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %116, i64 %124, <4 x float> %200, i32 0, i32 0, i32 0)
  %202 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %117, i64 %125, <4 x float> %201, i32 0, i32 0, i32 0)
  %203 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %118, i64 %126, <4 x float> %202, i32 0, i32 0, i32 0)
  %204 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %119, i64 %127, <4 x float> %203, i32 0, i32 0, i32 0)
  %205 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %120, i64 %128, <4 x float> %204, i32 0, i32 0, i32 0)
  %206 = shufflevector <4 x float> %205, <4 x float> poison, <1 x i32> zeroinitializer
  %207 = insertvalue [1 x [1 x [4 x <1 x float>]]] poison, <1 x float> %206, 0, 0, 0
  %208 = shufflevector <4 x float> %205, <4 x float> poison, <1 x i32> <i32 1>
  %209 = insertvalue [1 x [1 x [4 x <1 x float>]]] %207, <1 x float> %208, 0, 0, 1
  %210 = shufflevector <4 x float> %205, <4 x float> poison, <1 x i32> <i32 2>
  %211 = insertvalue [1 x [1 x [4 x <1 x float>]]] %209, <1 x float> %210, 0, 0, 2
  %212 = shufflevector <4 x float> %205, <4 x float> poison, <1 x i32> <i32 3>
  %213 = insertvalue [1 x [1 x [4 x <1 x float>]]] %211, <1 x float> %212, 0, 0, 3
  %214 = insertvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %188, [1 x [1 x [4 x <1 x float>]]] %213, 1, 0
  %215 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %86, 1, 1, 0, 0, 0
  %216 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %86, 1, 1, 0, 0, 1
  %217 = shufflevector <1 x float> %215, <1 x float> %216, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %218 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %86, 1, 1, 0, 0, 2
  %219 = shufflevector <1 x float> %218, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %220 = shufflevector <4 x float> %217, <4 x float> %219, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %221 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %86, 1, 1, 0, 0, 3
  %222 = shufflevector <1 x float> %221, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %223 = shufflevector <4 x float> %220, <4 x float> %222, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %224 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %113, i64 %129, <4 x float> %223, i32 0, i32 0, i32 0)
  %225 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %114, i64 %130, <4 x float> %224, i32 0, i32 0, i32 0)
  %226 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %115, i64 %131, <4 x float> %225, i32 0, i32 0, i32 0)
  %227 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %116, i64 %132, <4 x float> %226, i32 0, i32 0, i32 0)
  %228 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %117, i64 %133, <4 x float> %227, i32 0, i32 0, i32 0)
  %229 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %118, i64 %134, <4 x float> %228, i32 0, i32 0, i32 0)
  %230 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %119, i64 %135, <4 x float> %229, i32 0, i32 0, i32 0)
  %231 = tail call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %120, i64 %136, <4 x float> %230, i32 0, i32 0, i32 0)
  %232 = shufflevector <4 x float> %231, <4 x float> poison, <1 x i32> zeroinitializer
  %233 = insertvalue [1 x [1 x [4 x <1 x float>]]] poison, <1 x float> %232, 0, 0, 0
  %234 = shufflevector <4 x float> %231, <4 x float> poison, <1 x i32> <i32 1>
  %235 = insertvalue [1 x [1 x [4 x <1 x float>]]] %233, <1 x float> %234, 0, 0, 1
  %236 = shufflevector <4 x float> %231, <4 x float> poison, <1 x i32> <i32 2>
  %237 = insertvalue [1 x [1 x [4 x <1 x float>]]] %235, <1 x float> %236, 0, 0, 2
  %238 = shufflevector <4 x float> %231, <4 x float> poison, <1 x i32> <i32 3>
  %239 = insertvalue [1 x [1 x [4 x <1 x float>]]] %237, <1 x float> %238, 0, 0, 3
  %240 = insertvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %214, [1 x [1 x [4 x <1 x float>]]] %239, 1, 1
  %241 = add nuw nsw i32 %87, 256
  %242 = icmp samesign ult i32 %87, 1792
  br i1 %242, label %85, label %243

243:                                              ; preds = %85
  %244 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %2, i16 0, i32 163840, i32 159744)
  %245 = shl nuw nsw i32 %16, 2
  %246 = or disjoint i32 %245, %18
  %247 = or disjoint i32 %30, %8
  %.idx = mul nuw nsw i32 %246, 2560
  %248 = getelementptr i8, ptr addrspace(7) %244, i32 %.idx
  %249 = getelementptr float, ptr addrspace(7) %248, i32 %247
  store <1 x float> %154, ptr addrspace(7) %249, align 4
  %250 = getelementptr i8, ptr addrspace(7) %248, i32 2560
  %251 = getelementptr float, ptr addrspace(7) %250, i32 %247
  store <1 x float> %156, ptr addrspace(7) %251, align 4
  %252 = getelementptr i8, ptr addrspace(7) %248, i32 5120
  %253 = getelementptr float, ptr addrspace(7) %252, i32 %247
  store <1 x float> %158, ptr addrspace(7) %253, align 4
  %254 = getelementptr i8, ptr addrspace(7) %248, i32 7680
  %255 = getelementptr float, ptr addrspace(7) %254, i32 %247
  store <1 x float> %160, ptr addrspace(7) %255, align 4
  %256 = or disjoint i32 %247, 16
  %257 = getelementptr float, ptr addrspace(7) %248, i32 %256
  store <1 x float> %180, ptr addrspace(7) %257, align 4
  %258 = getelementptr float, ptr addrspace(7) %250, i32 %256
  store <1 x float> %182, ptr addrspace(7) %258, align 4
  %259 = getelementptr float, ptr addrspace(7) %252, i32 %256
  store <1 x float> %184, ptr addrspace(7) %259, align 4
  %260 = getelementptr float, ptr addrspace(7) %254, i32 %256
  store <1 x float> %186, ptr addrspace(7) %260, align 4
  %261 = getelementptr i8, ptr addrspace(7) %248, i32 40960
  %262 = getelementptr float, ptr addrspace(7) %261, i32 %247
  store <1 x float> %206, ptr addrspace(7) %262, align 4
  %263 = getelementptr i8, ptr addrspace(7) %248, i32 43520
  %264 = getelementptr float, ptr addrspace(7) %263, i32 %247
  store <1 x float> %208, ptr addrspace(7) %264, align 4
  %265 = getelementptr i8, ptr addrspace(7) %248, i32 46080
  %266 = getelementptr float, ptr addrspace(7) %265, i32 %247
  store <1 x float> %210, ptr addrspace(7) %266, align 4
  %267 = getelementptr i8, ptr addrspace(7) %248, i32 48640
  %268 = getelementptr float, ptr addrspace(7) %267, i32 %247
  store <1 x float> %212, ptr addrspace(7) %268, align 4
  %269 = getelementptr float, ptr addrspace(7) %261, i32 %256
  store <1 x float> %232, ptr addrspace(7) %269, align 4
  %270 = getelementptr float, ptr addrspace(7) %263, i32 %256
  store <1 x float> %234, ptr addrspace(7) %270, align 4
  %271 = getelementptr float, ptr addrspace(7) %265, i32 %256
  store <1 x float> %236, ptr addrspace(7) %271, align 4
  %272 = getelementptr float, ptr addrspace(7) %267, i32 %256
  store <1 x float> %238, ptr addrspace(7) %272, align 4
  ret void
}

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) readnone, i16, i32, i32) #1

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: alwaysinline mustprogress nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.waitcnt(i32 immarg) #3

; Function Attrs: alwaysinline convergent mustprogress nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #4

; Function Attrs: alwaysinline convergent mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64, i64, <4 x float>, i32 immarg, i32 immarg, i32 immarg) #5

attributes #0 = { alwaysinline nofree norecurse nounwind "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="256,256" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "uniform-work-group-size"="true" }
attributes #1 = { alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #3 = { alwaysinline mustprogress nocallback nofree nounwind willreturn }
attributes #4 = { alwaysinline convergent mustprogress nocallback nofree nounwind willreturn }
attributes #5 = { alwaysinline convergent mustprogress nocallback nofree nosync nounwind willreturn memory(none) }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"amdhsa_code_object_version", i32 500}
!2 = !{i32 256, i32 1, i32 1}
