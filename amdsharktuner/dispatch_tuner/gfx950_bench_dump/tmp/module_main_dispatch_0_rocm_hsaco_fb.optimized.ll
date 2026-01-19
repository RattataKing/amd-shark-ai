; To reproduce the .optimized.ll from the .linked.ll, run:
; opt -S -mtriple=amdgcn-amd-amdhsa -mcpu=gfx950 --passes='verify,memprof-remove-attributes,annotation2metadata,forceattrs,inferattrs,coro-early,function<eager-inv>(ee-instrument<>,lower-expect,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;no-switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,sroa<modify-cfg>,early-cse<>),openmp-opt,amdgpu-printf-runtime-binding,ipsccp,called-value-propagation,globalopt,function<eager-inv>(mem2reg,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>),always-inline,require<globals-aa>,function(invalidate<aa>),require<profile-summary>,cgscc(devirt<4>(inline,function-attrs<skip-non-recursive-function-attrs>,openmp-opt-cgscc,function(amdgpu-promote-kernel-arguments,infer-address-spaces,amdgpu-lower-kernel-attributes,amdgpu-promote-alloca-to-vector),function<eager-inv;no-rerun>(sroa<modify-cfg>,early-cse<memssa>,speculative-execution<only-if-divergent-target>,jump-threading,correlated-propagation,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,aggressive-instcombine,libcalls-shrinkwrap,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine,tailcallelim,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,reassociate,constraint-elimination,loop-mssa(loop-instsimplify,loop-simplifycfg,licm<no-allowspeculation>,loop-rotate<header-duplication;no-prepare-for-lto>,licm<allowspeculation>,simple-loop-unswitch<no-nontrivial;trivial>),simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,loop(loop-idiom,indvars,extra-simple-loop-unswitch-passes,loop-deletion,loop-unroll-full),sroa<modify-cfg>,vector-combine,mldst-motion<no-split-footer-bb>,gvn<>,sccp,bdce,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine,jump-threading,correlated-propagation,adce,memcpyopt,dse,move-auto-init,loop-mssa(licm<allowspeculation>),coro-elide,infer-address-spaces,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;switch-to-arithmetic;no-switch-to-lookup;keep-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=1;no-verify-fixpoint>,amdgpu-usenative,amdgpu-simplifylib,amdgpu-uniform-intrinsic-combine),function-attrs,function(require<should-not-run-function-passes>),coro-split,coro-annotation-elide)),deadargelim,coro-cleanup,globalopt,globaldce,elim-avail-extern,rpo-function-attrs,recompute-globalsaa,function<eager-inv>(drop-unnecessary-assumes,float2int,lower-constant-intrinsics,loop(loop-rotate<header-duplication;no-prepare-for-lto>,loop-deletion),loop-distribute,inject-tli-mappings,loop-vectorize<no-interleave-forced-only;no-vectorize-forced-only;>,drop-unnecessary-assumes,infer-alignment,loop-load-elim,instcombine<max-iterations=1;no-verify-fixpoint>,simplifycfg<bonus-inst-threshold=1;forward-switch-cond;switch-range-to-icmp;switch-to-arithmetic;switch-to-lookup;no-keep-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-common-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,slp-vectorizer,vector-combine,instcombine<max-iterations=1;no-verify-fixpoint>,loop-unroll<O2>,transform-warning,sroa<preserve-cfg>,infer-alignment,instcombine<max-iterations=1;no-verify-fixpoint>,loop-mssa(licm<allowspeculation>),alignment-from-assumptions,infer-address-spaces,loop-sink,instsimplify,div-rem-pairs,tailcallelim,simplifycfg<bonus-inst-threshold=1;no-forward-switch-cond;switch-range-to-icmp;switch-to-arithmetic;no-switch-to-lookup;keep-loops;no-hoist-common-insts;hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;speculate-unpredictables>),alloc-token,amdgpu-attributor,globaldce,constmerge,cg-profile,rel-lookup-table-converter,function(annotation-remarks),verify' <.linked.ll>
; The flag '-S' is to emit LLVMIR.
; The behavior of some passes depends on '-mtriple' and '-mcpu'.

; ModuleID = 'main_dispatch_0'
source_filename = "main_dispatch_0"
target datalayout = "e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"

@__shared_memory___0 = private unnamed_addr addrspace(3) global [128 x [264 x i8]] undef, align 16
@__shared_memory__ = private unnamed_addr addrspace(3) global [64 x [264 x i8]] undef, align 16

; Function Attrs: alwaysinline nofree norecurse nounwind
define amdgpu_kernel void @main_dispatch_0_matmul_4096x640x2560_f8E4M3FNxf8E4M3FNxf32(ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 captures(none) %0, ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 captures(none) %1, ptr addrspace(1) inreg noalias noundef nonnull writeonly align 16 captures(none) %2) local_unnamed_addr #0 !reqd_work_group_size !2 {
  %4 = tail call range(i32 0, 256) i32 @llvm.amdgcn.workitem.id.x()
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %0, i64 64) ]
  %5 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %0, i16 0, i64 10485760, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %1, i64 64) ]
  %6 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %1, i16 0, i64 1638400, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %2, i64 64) ]
  %7 = lshr i32 %4, 4
  %8 = and i32 %7, 3
  %9 = and i32 %4, 15
  %10 = shl nuw nsw i32 %8, 5
  %11 = or disjoint i32 %7, 16
  %12 = or disjoint i32 %7, 32
  %13 = or disjoint i32 %7, 48
  %14 = or disjoint i32 %7, 64
  %15 = or disjoint i32 %7, 80
  %16 = or disjoint i32 %7, 96
  %17 = or disjoint i32 %7, 112
  %18 = shl nuw nsw i32 %4, 4
  %19 = and i32 %18, 240
  %20 = tail call range(i32 0, 320) i32 @llvm.amdgcn.workgroup.id.x()
  %.lhs.trunc = trunc nuw nsw i32 %20 to i16
  %21 = udiv i16 %.lhs.trunc, 5
  %22 = mul i16 %21, 5
  %.decomposed = sub i16 %.lhs.trunc, %22
  %23 = shl nuw nsw i16 %21, 6
  %24 = zext nneg i16 %23 to i32
  %25 = or disjoint i32 %7, %24
  %narrow = mul nuw nsw i32 %25, 2560
  %26 = getelementptr i8, ptr addrspace(7) %5, i32 %narrow
  %27 = getelementptr i8, ptr addrspace(7) %26, i32 %19
  %28 = load <16 x i8>, ptr addrspace(7) %27, align 1
  %29 = or disjoint i32 %11, %24
  %narrow1 = mul nuw nsw i32 %29, 2560
  %30 = getelementptr i8, ptr addrspace(7) %5, i32 %narrow1
  %31 = getelementptr i8, ptr addrspace(7) %30, i32 %19
  %32 = load <16 x i8>, ptr addrspace(7) %31, align 1
  %33 = or disjoint i32 %12, %24
  %narrow2 = mul nuw nsw i32 %33, 2560
  %34 = getelementptr i8, ptr addrspace(7) %5, i32 %narrow2
  %35 = getelementptr i8, ptr addrspace(7) %34, i32 %19
  %36 = load <16 x i8>, ptr addrspace(7) %35, align 1
  %37 = or disjoint i32 %13, %24
  %narrow3 = mul nuw nsw i32 %37, 2560
  %38 = getelementptr i8, ptr addrspace(7) %5, i32 %narrow3
  %39 = getelementptr i8, ptr addrspace(7) %38, i32 %19
  %40 = load <16 x i8>, ptr addrspace(7) %39, align 1
  %41 = shl nuw nsw i16 %.decomposed, 7
  %42 = zext nneg i16 %41 to i32
  %43 = or disjoint i32 %7, %42
  %narrow4 = mul nuw nsw i32 %43, 2560
  %44 = getelementptr i8, ptr addrspace(7) %6, i32 %narrow4
  %45 = getelementptr i8, ptr addrspace(7) %44, i32 %19
  %46 = load <16 x i8>, ptr addrspace(7) %45, align 1
  %47 = or disjoint i32 %11, %42
  %narrow5 = mul nuw nsw i32 %47, 2560
  %48 = getelementptr i8, ptr addrspace(7) %6, i32 %narrow5
  %49 = getelementptr i8, ptr addrspace(7) %48, i32 %19
  %50 = load <16 x i8>, ptr addrspace(7) %49, align 1
  %51 = or disjoint i32 %12, %42
  %narrow6 = mul nuw nsw i32 %51, 2560
  %52 = getelementptr i8, ptr addrspace(7) %6, i32 %narrow6
  %53 = getelementptr i8, ptr addrspace(7) %52, i32 %19
  %54 = load <16 x i8>, ptr addrspace(7) %53, align 1
  %55 = or disjoint i32 %13, %42
  %narrow7 = mul nuw nsw i32 %55, 2560
  %56 = getelementptr i8, ptr addrspace(7) %6, i32 %narrow7
  %57 = getelementptr i8, ptr addrspace(7) %56, i32 %19
  %58 = load <16 x i8>, ptr addrspace(7) %57, align 1
  %59 = or disjoint i32 %14, %42
  %narrow8 = mul nuw nsw i32 %59, 2560
  %60 = getelementptr i8, ptr addrspace(7) %6, i32 %narrow8
  %61 = getelementptr i8, ptr addrspace(7) %60, i32 %19
  %62 = load <16 x i8>, ptr addrspace(7) %61, align 1
  %63 = or disjoint i32 %15, %42
  %narrow9 = mul nuw nsw i32 %63, 2560
  %64 = getelementptr i8, ptr addrspace(7) %6, i32 %narrow9
  %65 = getelementptr i8, ptr addrspace(7) %64, i32 %19
  %66 = load <16 x i8>, ptr addrspace(7) %65, align 1
  %67 = or disjoint i32 %16, %42
  %narrow10 = mul nuw nsw i32 %67, 2560
  %68 = getelementptr i8, ptr addrspace(7) %6, i32 %narrow10
  %69 = getelementptr i8, ptr addrspace(7) %68, i32 %19
  %70 = load <16 x i8>, ptr addrspace(7) %69, align 1
  %71 = or disjoint i32 %17, %42
  %narrow11 = mul nuw nsw i32 %71, 2560
  %72 = getelementptr i8, ptr addrspace(7) %6, i32 %narrow11
  %73 = getelementptr i8, ptr addrspace(7) %72, i32 %19
  %74 = load <16 x i8>, ptr addrspace(7) %73, align 1
  %narrow12 = mul nuw nsw i32 %7, 264
  %narrow13 = add nuw nsw i32 %narrow12, %19
  %75 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %narrow13
  store <16 x i8> %28, ptr addrspace(3) %75, align 8
  %narrow14 = mul nuw nsw i32 %11, 264
  %narrow15 = add nuw nsw i32 %narrow14, %19
  %76 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %narrow15
  store <16 x i8> %32, ptr addrspace(3) %76, align 8
  %narrow16 = mul nuw nsw i32 %12, 264
  %narrow17 = add nuw nsw i32 %narrow16, %19
  %77 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %narrow17
  store <16 x i8> %36, ptr addrspace(3) %77, align 8
  %narrow18 = mul nuw nsw i32 %13, 264
  %narrow19 = add nuw nsw i32 %narrow18, %19
  %78 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %narrow19
  store <16 x i8> %40, ptr addrspace(3) %78, align 8
  %79 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow13
  store <16 x i8> %46, ptr addrspace(3) %79, align 8
  %80 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow15
  store <16 x i8> %50, ptr addrspace(3) %80, align 8
  %81 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow17
  store <16 x i8> %54, ptr addrspace(3) %81, align 8
  %82 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow19
  store <16 x i8> %58, ptr addrspace(3) %82, align 8
  %narrow20 = mul nuw nsw i32 %14, 264
  %83 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow20
  %84 = getelementptr i8, ptr addrspace(3) %83, i32 %19
  store <16 x i8> %62, ptr addrspace(3) %84, align 8
  %narrow22 = mul nuw nsw i32 %15, 264
  %85 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow22
  %86 = getelementptr i8, ptr addrspace(3) %85, i32 %19
  store <16 x i8> %66, ptr addrspace(3) %86, align 8
  %narrow24 = mul nuw nsw i32 %16, 264
  %87 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow24
  %88 = getelementptr i8, ptr addrspace(3) %87, i32 %19
  store <16 x i8> %70, ptr addrspace(3) %88, align 8
  %narrow26 = mul nuw nsw i32 %17, 264
  %89 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %narrow26
  %90 = getelementptr i8, ptr addrspace(3) %89, i32 %19
  store <16 x i8> %74, ptr addrspace(3) %90, align 8
  %91 = lshr i32 %4, 2
  %92 = and i32 %91, 32
  %93 = or disjoint i32 %92, %9
  %94 = or disjoint i32 %10, 128
  %95 = and i32 %4, 79
  %narrow61 = mul nuw nsw i32 %93, 264
  %96 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %10
  %97 = getelementptr i8, ptr addrspace(3) %96, i32 %narrow61
  %98 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i32 %94
  %99 = getelementptr i8, ptr addrspace(3) %98, i32 %narrow61
  %100 = mul nuw nsw i32 %93, 264
  %narrow62 = add nuw nsw i32 %100, 4224
  %101 = getelementptr i8, ptr addrspace(3) %96, i32 %narrow62
  %102 = getelementptr i8, ptr addrspace(3) %98, i32 %narrow62
  %narrow63 = mul nuw nsw i32 %95, 264
  %103 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %10
  %104 = getelementptr i8, ptr addrspace(3) %103, i32 %narrow63
  %105 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i32 %94
  %106 = getelementptr i8, ptr addrspace(3) %105, i32 %narrow63
  %107 = mul nuw nsw i32 %95, 264
  %narrow64 = add nuw nsw i32 %107, 4224
  %108 = getelementptr i8, ptr addrspace(3) %103, i32 %narrow64
  %109 = getelementptr i8, ptr addrspace(3) %105, i32 %narrow64
  %110 = mul nuw nsw i32 %95, 264
  %narrow65 = add nuw nsw i32 %110, 8448
  %111 = getelementptr i8, ptr addrspace(3) %103, i32 %narrow65
  %112 = getelementptr i8, ptr addrspace(3) %105, i32 %narrow65
  %113 = mul nuw nsw i32 %95, 264
  %narrow66 = add nuw nsw i32 %113, 12672
  %114 = getelementptr i8, ptr addrspace(3) %103, i32 %narrow66
  %115 = getelementptr i8, ptr addrspace(3) %105, i32 %narrow66
  br label %116

116:                                              ; preds = %3, %116
  %117 = phi [2 x [4 x [4 x <1 x float>]]] [ zeroinitializer, %3 ], [ %317, %116 ]
  %118 = phi i32 [ 0, %3 ], [ %119, %116 ]
  %119 = add nuw nsw i32 %118, 2
  %120 = shl nuw nsw i32 %119, 7
  %121 = or disjoint i32 %120, %19
  %122 = getelementptr i8, ptr addrspace(7) %26, i32 %121
  %123 = load <16 x i8>, ptr addrspace(7) %122, align 1
  %124 = getelementptr i8, ptr addrspace(7) %30, i32 %121
  %125 = load <16 x i8>, ptr addrspace(7) %124, align 1
  %126 = getelementptr i8, ptr addrspace(7) %34, i32 %121
  %127 = load <16 x i8>, ptr addrspace(7) %126, align 1
  %128 = getelementptr i8, ptr addrspace(7) %38, i32 %121
  %129 = load <16 x i8>, ptr addrspace(7) %128, align 1
  %130 = getelementptr i8, ptr addrspace(7) %44, i32 %121
  %131 = load <16 x i8>, ptr addrspace(7) %130, align 1
  %132 = getelementptr i8, ptr addrspace(7) %48, i32 %121
  %133 = load <16 x i8>, ptr addrspace(7) %132, align 1
  %134 = getelementptr i8, ptr addrspace(7) %52, i32 %121
  %135 = load <16 x i8>, ptr addrspace(7) %134, align 1
  %136 = getelementptr i8, ptr addrspace(7) %56, i32 %121
  %137 = load <16 x i8>, ptr addrspace(7) %136, align 1
  %138 = getelementptr i8, ptr addrspace(7) %61, i32 %120
  %139 = load <16 x i8>, ptr addrspace(7) %138, align 1
  %140 = getelementptr i8, ptr addrspace(7) %65, i32 %120
  %141 = load <16 x i8>, ptr addrspace(7) %140, align 1
  %142 = getelementptr i8, ptr addrspace(7) %69, i32 %120
  %143 = load <16 x i8>, ptr addrspace(7) %142, align 1
  %144 = getelementptr i8, ptr addrspace(7) %73, i32 %120
  %145 = load <16 x i8>, ptr addrspace(7) %144, align 1
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %146 = load <8 x i32>, ptr addrspace(3) %97, align 8
  %147 = load <8 x i32>, ptr addrspace(3) %99, align 8
  %148 = load <8 x i32>, ptr addrspace(3) %101, align 8
  %149 = load <8 x i32>, ptr addrspace(3) %102, align 8
  %150 = load <8 x i32>, ptr addrspace(3) %104, align 8
  %151 = load <8 x i32>, ptr addrspace(3) %106, align 8
  %152 = load <8 x i32>, ptr addrspace(3) %108, align 8
  %153 = load <8 x i32>, ptr addrspace(3) %109, align 8
  %154 = load <8 x i32>, ptr addrspace(3) %111, align 8
  %155 = load <8 x i32>, ptr addrspace(3) %112, align 8
  %156 = load <8 x i32>, ptr addrspace(3) %114, align 8
  %157 = load <8 x i32>, ptr addrspace(3) %115, align 8
  %158 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 0, 0, 0
  %159 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 0, 0, 1
  %160 = shufflevector <1 x float> %158, <1 x float> %159, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %161 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 0, 0, 2
  %162 = shufflevector <1 x float> %161, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %163 = shufflevector <4 x float> %160, <4 x float> %162, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %164 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 0, 0, 3
  %165 = shufflevector <1 x float> %164, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %166 = shufflevector <4 x float> %163, <4 x float> %165, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %167 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %146, <8 x i32> %150, <4 x float> %166, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %168 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 0, 1, 0
  %169 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 0, 1, 1
  %170 = shufflevector <1 x float> %168, <1 x float> %169, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %171 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 0, 1, 2
  %172 = shufflevector <1 x float> %171, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %173 = shufflevector <4 x float> %170, <4 x float> %172, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %174 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 0, 1, 3
  %175 = shufflevector <1 x float> %174, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %176 = shufflevector <4 x float> %173, <4 x float> %175, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %177 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %146, <8 x i32> %152, <4 x float> %176, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %178 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 0, 2, 0
  %179 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 0, 2, 1
  %180 = shufflevector <1 x float> %178, <1 x float> %179, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %181 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 0, 2, 2
  %182 = shufflevector <1 x float> %181, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %183 = shufflevector <4 x float> %180, <4 x float> %182, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %184 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 0, 2, 3
  %185 = shufflevector <1 x float> %184, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %186 = shufflevector <4 x float> %183, <4 x float> %185, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %187 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %146, <8 x i32> %154, <4 x float> %186, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %188 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 0, 3, 0
  %189 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 0, 3, 1
  %190 = shufflevector <1 x float> %188, <1 x float> %189, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %191 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 0, 3, 2
  %192 = shufflevector <1 x float> %191, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %193 = shufflevector <4 x float> %190, <4 x float> %192, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %194 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 0, 3, 3
  %195 = shufflevector <1 x float> %194, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %196 = shufflevector <4 x float> %193, <4 x float> %195, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %197 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %146, <8 x i32> %156, <4 x float> %196, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %198 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 1, 0, 0
  %199 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 1, 0, 1
  %200 = shufflevector <1 x float> %198, <1 x float> %199, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %201 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 1, 0, 2
  %202 = shufflevector <1 x float> %201, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %203 = shufflevector <4 x float> %200, <4 x float> %202, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %204 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 1, 0, 3
  %205 = shufflevector <1 x float> %204, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %206 = shufflevector <4 x float> %203, <4 x float> %205, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %207 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %148, <8 x i32> %150, <4 x float> %206, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %208 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 1, 1, 0
  %209 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 1, 1, 1
  %210 = shufflevector <1 x float> %208, <1 x float> %209, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %211 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 1, 1, 2
  %212 = shufflevector <1 x float> %211, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %213 = shufflevector <4 x float> %210, <4 x float> %212, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %214 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 1, 1, 3
  %215 = shufflevector <1 x float> %214, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %216 = shufflevector <4 x float> %213, <4 x float> %215, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %217 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %148, <8 x i32> %152, <4 x float> %216, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %218 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 1, 2, 0
  %219 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 1, 2, 1
  %220 = shufflevector <1 x float> %218, <1 x float> %219, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %221 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 1, 2, 2
  %222 = shufflevector <1 x float> %221, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %223 = shufflevector <4 x float> %220, <4 x float> %222, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %224 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 1, 2, 3
  %225 = shufflevector <1 x float> %224, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %226 = shufflevector <4 x float> %223, <4 x float> %225, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %227 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %148, <8 x i32> %154, <4 x float> %226, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %228 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 1, 3, 0
  %229 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 1, 3, 1
  %230 = shufflevector <1 x float> %228, <1 x float> %229, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %231 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 1, 3, 2
  %232 = shufflevector <1 x float> %231, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %233 = shufflevector <4 x float> %230, <4 x float> %232, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %234 = extractvalue [2 x [4 x [4 x <1 x float>]]] %117, 1, 3, 3
  %235 = shufflevector <1 x float> %234, <1 x float> poison, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %236 = shufflevector <4 x float> %233, <4 x float> %235, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %237 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %148, <8 x i32> %156, <4 x float> %236, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %238 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %147, <8 x i32> %151, <4 x float> %167, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %239 = shufflevector <4 x float> %238, <4 x float> poison, <1 x i32> zeroinitializer
  %240 = insertvalue [4 x <1 x float>] poison, <1 x float> %239, 0
  %241 = shufflevector <4 x float> %238, <4 x float> poison, <1 x i32> <i32 1>
  %242 = insertvalue [4 x <1 x float>] %240, <1 x float> %241, 1
  %243 = shufflevector <4 x float> %238, <4 x float> poison, <1 x i32> <i32 2>
  %244 = insertvalue [4 x <1 x float>] %242, <1 x float> %243, 2
  %245 = shufflevector <4 x float> %238, <4 x float> poison, <1 x i32> <i32 3>
  %246 = insertvalue [4 x <1 x float>] %244, <1 x float> %245, 3
  %247 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %147, <8 x i32> %153, <4 x float> %177, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %248 = shufflevector <4 x float> %247, <4 x float> poison, <1 x i32> zeroinitializer
  %249 = insertvalue [4 x <1 x float>] poison, <1 x float> %248, 0
  %250 = shufflevector <4 x float> %247, <4 x float> poison, <1 x i32> <i32 1>
  %251 = insertvalue [4 x <1 x float>] %249, <1 x float> %250, 1
  %252 = shufflevector <4 x float> %247, <4 x float> poison, <1 x i32> <i32 2>
  %253 = insertvalue [4 x <1 x float>] %251, <1 x float> %252, 2
  %254 = shufflevector <4 x float> %247, <4 x float> poison, <1 x i32> <i32 3>
  %255 = insertvalue [4 x <1 x float>] %253, <1 x float> %254, 3
  %256 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %147, <8 x i32> %155, <4 x float> %187, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %257 = shufflevector <4 x float> %256, <4 x float> poison, <1 x i32> zeroinitializer
  %258 = insertvalue [4 x <1 x float>] poison, <1 x float> %257, 0
  %259 = shufflevector <4 x float> %256, <4 x float> poison, <1 x i32> <i32 1>
  %260 = insertvalue [4 x <1 x float>] %258, <1 x float> %259, 1
  %261 = shufflevector <4 x float> %256, <4 x float> poison, <1 x i32> <i32 2>
  %262 = insertvalue [4 x <1 x float>] %260, <1 x float> %261, 2
  %263 = shufflevector <4 x float> %256, <4 x float> poison, <1 x i32> <i32 3>
  %264 = insertvalue [4 x <1 x float>] %262, <1 x float> %263, 3
  %265 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %147, <8 x i32> %157, <4 x float> %197, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %266 = shufflevector <4 x float> %265, <4 x float> poison, <1 x i32> zeroinitializer
  %267 = insertvalue [4 x <1 x float>] poison, <1 x float> %266, 0
  %268 = shufflevector <4 x float> %265, <4 x float> poison, <1 x i32> <i32 1>
  %269 = insertvalue [4 x <1 x float>] %267, <1 x float> %268, 1
  %270 = shufflevector <4 x float> %265, <4 x float> poison, <1 x i32> <i32 2>
  %271 = insertvalue [4 x <1 x float>] %269, <1 x float> %270, 2
  %272 = shufflevector <4 x float> %265, <4 x float> poison, <1 x i32> <i32 3>
  %273 = insertvalue [4 x <1 x float>] %271, <1 x float> %272, 3
  %274 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %149, <8 x i32> %151, <4 x float> %207, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %275 = shufflevector <4 x float> %274, <4 x float> poison, <1 x i32> zeroinitializer
  %276 = insertvalue [4 x <1 x float>] poison, <1 x float> %275, 0
  %277 = shufflevector <4 x float> %274, <4 x float> poison, <1 x i32> <i32 1>
  %278 = insertvalue [4 x <1 x float>] %276, <1 x float> %277, 1
  %279 = shufflevector <4 x float> %274, <4 x float> poison, <1 x i32> <i32 2>
  %280 = insertvalue [4 x <1 x float>] %278, <1 x float> %279, 2
  %281 = shufflevector <4 x float> %274, <4 x float> poison, <1 x i32> <i32 3>
  %282 = insertvalue [4 x <1 x float>] %280, <1 x float> %281, 3
  %283 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %149, <8 x i32> %153, <4 x float> %217, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %284 = shufflevector <4 x float> %283, <4 x float> poison, <1 x i32> zeroinitializer
  %285 = insertvalue [4 x <1 x float>] poison, <1 x float> %284, 0
  %286 = shufflevector <4 x float> %283, <4 x float> poison, <1 x i32> <i32 1>
  %287 = insertvalue [4 x <1 x float>] %285, <1 x float> %286, 1
  %288 = shufflevector <4 x float> %283, <4 x float> poison, <1 x i32> <i32 2>
  %289 = insertvalue [4 x <1 x float>] %287, <1 x float> %288, 2
  %290 = shufflevector <4 x float> %283, <4 x float> poison, <1 x i32> <i32 3>
  %291 = insertvalue [4 x <1 x float>] %289, <1 x float> %290, 3
  %292 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %149, <8 x i32> %155, <4 x float> %227, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %293 = shufflevector <4 x float> %292, <4 x float> poison, <1 x i32> zeroinitializer
  %294 = insertvalue [4 x <1 x float>] poison, <1 x float> %293, 0
  %295 = shufflevector <4 x float> %292, <4 x float> poison, <1 x i32> <i32 1>
  %296 = insertvalue [4 x <1 x float>] %294, <1 x float> %295, 1
  %297 = shufflevector <4 x float> %292, <4 x float> poison, <1 x i32> <i32 2>
  %298 = insertvalue [4 x <1 x float>] %296, <1 x float> %297, 2
  %299 = shufflevector <4 x float> %292, <4 x float> poison, <1 x i32> <i32 3>
  %300 = insertvalue [4 x <1 x float>] %298, <1 x float> %299, 3
  %301 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %149, <8 x i32> %157, <4 x float> %237, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %302 = shufflevector <4 x float> %301, <4 x float> poison, <1 x i32> zeroinitializer
  %303 = insertvalue [4 x <1 x float>] poison, <1 x float> %302, 0
  %304 = shufflevector <4 x float> %301, <4 x float> poison, <1 x i32> <i32 1>
  %305 = insertvalue [4 x <1 x float>] %303, <1 x float> %304, 1
  %306 = shufflevector <4 x float> %301, <4 x float> poison, <1 x i32> <i32 2>
  %307 = insertvalue [4 x <1 x float>] %305, <1 x float> %306, 2
  %308 = shufflevector <4 x float> %301, <4 x float> poison, <1 x i32> <i32 3>
  %309 = insertvalue [4 x <1 x float>] %307, <1 x float> %308, 3
  %310 = insertvalue [2 x [4 x [4 x <1 x float>]]] zeroinitializer, [4 x <1 x float>] %246, 0, 0
  %311 = insertvalue [2 x [4 x [4 x <1 x float>]]] %310, [4 x <1 x float>] %255, 0, 1
  %312 = insertvalue [2 x [4 x [4 x <1 x float>]]] %311, [4 x <1 x float>] %264, 0, 2
  %313 = insertvalue [2 x [4 x [4 x <1 x float>]]] %312, [4 x <1 x float>] %273, 0, 3
  %314 = insertvalue [2 x [4 x [4 x <1 x float>]]] %313, [4 x <1 x float>] %282, 1, 0
  %315 = insertvalue [2 x [4 x [4 x <1 x float>]]] %314, [4 x <1 x float>] %291, 1, 1
  %316 = insertvalue [2 x [4 x [4 x <1 x float>]]] %315, [4 x <1 x float>] %300, 1, 2
  %317 = insertvalue [2 x [4 x [4 x <1 x float>]]] %316, [4 x <1 x float>] %309, 1, 3
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  tail call void @llvm.amdgcn.sched.barrier(i32 0)
  store <16 x i8> %123, ptr addrspace(3) %75, align 8
  store <16 x i8> %125, ptr addrspace(3) %76, align 8
  store <16 x i8> %127, ptr addrspace(3) %77, align 8
  store <16 x i8> %129, ptr addrspace(3) %78, align 8
  store <16 x i8> %131, ptr addrspace(3) %79, align 8
  store <16 x i8> %133, ptr addrspace(3) %80, align 8
  store <16 x i8> %135, ptr addrspace(3) %81, align 8
  store <16 x i8> %137, ptr addrspace(3) %82, align 8
  store <16 x i8> %139, ptr addrspace(3) %84, align 8
  store <16 x i8> %141, ptr addrspace(3) %86, align 8
  store <16 x i8> %143, ptr addrspace(3) %88, align 8
  store <16 x i8> %145, ptr addrspace(3) %90, align 8
  %318 = icmp samesign ult i32 %118, 16
  br i1 %318, label %116, label %319

319:                                              ; preds = %116
  %320 = shl nuw nsw i32 %8, 2
  %321 = tail call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) nonnull %2, i16 0, i64 10485760, i32 159744)
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  %322 = load <8 x i32>, ptr addrspace(3) %97, align 8
  %323 = load <8 x i32>, ptr addrspace(3) %99, align 8
  %324 = load <8 x i32>, ptr addrspace(3) %101, align 8
  %325 = load <8 x i32>, ptr addrspace(3) %102, align 8
  %326 = load <8 x i32>, ptr addrspace(3) %104, align 8
  %327 = load <8 x i32>, ptr addrspace(3) %106, align 8
  %328 = load <8 x i32>, ptr addrspace(3) %108, align 8
  %329 = load <8 x i32>, ptr addrspace(3) %109, align 8
  %330 = load <8 x i32>, ptr addrspace(3) %111, align 8
  %331 = load <8 x i32>, ptr addrspace(3) %112, align 8
  %332 = load <8 x i32>, ptr addrspace(3) %114, align 8
  %333 = load <8 x i32>, ptr addrspace(3) %115, align 8
  %334 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %322, <8 x i32> %326, <4 x float> %238, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %335 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %322, <8 x i32> %328, <4 x float> %247, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %336 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %322, <8 x i32> %330, <4 x float> %256, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %337 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %322, <8 x i32> %332, <4 x float> %265, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %338 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %324, <8 x i32> %326, <4 x float> %274, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %339 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %324, <8 x i32> %328, <4 x float> %283, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %340 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %324, <8 x i32> %330, <4 x float> %292, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %341 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %324, <8 x i32> %332, <4 x float> %301, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %342 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %323, <8 x i32> %327, <4 x float> %334, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %343 = shufflevector <4 x float> %342, <4 x float> poison, <1 x i32> zeroinitializer
  %344 = shufflevector <4 x float> %342, <4 x float> poison, <1 x i32> <i32 1>
  %345 = shufflevector <4 x float> %342, <4 x float> poison, <1 x i32> <i32 2>
  %346 = shufflevector <4 x float> %342, <4 x float> poison, <1 x i32> <i32 3>
  %347 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %323, <8 x i32> %329, <4 x float> %335, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %348 = shufflevector <4 x float> %347, <4 x float> poison, <1 x i32> zeroinitializer
  %349 = shufflevector <4 x float> %347, <4 x float> poison, <1 x i32> <i32 1>
  %350 = shufflevector <4 x float> %347, <4 x float> poison, <1 x i32> <i32 2>
  %351 = shufflevector <4 x float> %347, <4 x float> poison, <1 x i32> <i32 3>
  %352 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %323, <8 x i32> %331, <4 x float> %336, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %353 = shufflevector <4 x float> %352, <4 x float> poison, <1 x i32> zeroinitializer
  %354 = shufflevector <4 x float> %352, <4 x float> poison, <1 x i32> <i32 1>
  %355 = shufflevector <4 x float> %352, <4 x float> poison, <1 x i32> <i32 2>
  %356 = shufflevector <4 x float> %352, <4 x float> poison, <1 x i32> <i32 3>
  %357 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %323, <8 x i32> %333, <4 x float> %337, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %358 = shufflevector <4 x float> %357, <4 x float> poison, <1 x i32> zeroinitializer
  %359 = shufflevector <4 x float> %357, <4 x float> poison, <1 x i32> <i32 1>
  %360 = shufflevector <4 x float> %357, <4 x float> poison, <1 x i32> <i32 2>
  %361 = shufflevector <4 x float> %357, <4 x float> poison, <1 x i32> <i32 3>
  %362 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %325, <8 x i32> %327, <4 x float> %338, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %363 = shufflevector <4 x float> %362, <4 x float> poison, <1 x i32> zeroinitializer
  %364 = shufflevector <4 x float> %362, <4 x float> poison, <1 x i32> <i32 1>
  %365 = shufflevector <4 x float> %362, <4 x float> poison, <1 x i32> <i32 2>
  %366 = shufflevector <4 x float> %362, <4 x float> poison, <1 x i32> <i32 3>
  %367 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %325, <8 x i32> %329, <4 x float> %339, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %368 = shufflevector <4 x float> %367, <4 x float> poison, <1 x i32> zeroinitializer
  %369 = shufflevector <4 x float> %367, <4 x float> poison, <1 x i32> <i32 1>
  %370 = shufflevector <4 x float> %367, <4 x float> poison, <1 x i32> <i32 2>
  %371 = shufflevector <4 x float> %367, <4 x float> poison, <1 x i32> <i32 3>
  %372 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %325, <8 x i32> %331, <4 x float> %340, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %373 = shufflevector <4 x float> %372, <4 x float> poison, <1 x i32> zeroinitializer
  %374 = shufflevector <4 x float> %372, <4 x float> poison, <1 x i32> <i32 1>
  %375 = shufflevector <4 x float> %372, <4 x float> poison, <1 x i32> <i32 2>
  %376 = shufflevector <4 x float> %372, <4 x float> poison, <1 x i32> <i32 3>
  %377 = tail call <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32> %325, <8 x i32> %333, <4 x float> %341, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  %378 = shufflevector <4 x float> %377, <4 x float> poison, <1 x i32> zeroinitializer
  %379 = shufflevector <4 x float> %377, <4 x float> poison, <1 x i32> <i32 1>
  %380 = shufflevector <4 x float> %377, <4 x float> poison, <1 x i32> <i32 2>
  %381 = shufflevector <4 x float> %377, <4 x float> poison, <1 x i32> <i32 3>
  %382 = or disjoint i32 %320, %24
  %383 = or disjoint i32 %382, %92
  %384 = or disjoint i32 %95, %42
  %.idx = mul nuw nsw i32 %383, 2560
  %385 = getelementptr i8, ptr addrspace(7) %321, i32 %.idx
  %386 = getelementptr float, ptr addrspace(7) %385, i32 %384
  store <1 x float> %343, ptr addrspace(7) %386, align 4
  %387 = or disjoint i32 %384, 16
  %388 = getelementptr float, ptr addrspace(7) %385, i32 %387
  store <1 x float> %348, ptr addrspace(7) %388, align 4
  %389 = or disjoint i32 %384, 32
  %390 = getelementptr float, ptr addrspace(7) %385, i32 %389
  store <1 x float> %353, ptr addrspace(7) %390, align 4
  %391 = or disjoint i32 %384, 48
  %392 = getelementptr float, ptr addrspace(7) %385, i32 %391
  store <1 x float> %358, ptr addrspace(7) %392, align 4
  %393 = getelementptr i8, ptr addrspace(7) %385, i32 2560
  %394 = getelementptr float, ptr addrspace(7) %393, i32 %384
  store <1 x float> %344, ptr addrspace(7) %394, align 4
  %395 = getelementptr float, ptr addrspace(7) %393, i32 %387
  store <1 x float> %349, ptr addrspace(7) %395, align 4
  %396 = getelementptr float, ptr addrspace(7) %393, i32 %389
  store <1 x float> %354, ptr addrspace(7) %396, align 4
  %397 = getelementptr float, ptr addrspace(7) %393, i32 %391
  store <1 x float> %359, ptr addrspace(7) %397, align 4
  %398 = getelementptr i8, ptr addrspace(7) %385, i32 5120
  %399 = getelementptr float, ptr addrspace(7) %398, i32 %384
  store <1 x float> %345, ptr addrspace(7) %399, align 4
  %400 = getelementptr float, ptr addrspace(7) %398, i32 %387
  store <1 x float> %350, ptr addrspace(7) %400, align 4
  %401 = getelementptr float, ptr addrspace(7) %398, i32 %389
  store <1 x float> %355, ptr addrspace(7) %401, align 4
  %402 = getelementptr float, ptr addrspace(7) %398, i32 %391
  store <1 x float> %360, ptr addrspace(7) %402, align 4
  %403 = getelementptr i8, ptr addrspace(7) %385, i32 7680
  %404 = getelementptr float, ptr addrspace(7) %403, i32 %384
  store <1 x float> %346, ptr addrspace(7) %404, align 4
  %405 = getelementptr float, ptr addrspace(7) %403, i32 %387
  store <1 x float> %351, ptr addrspace(7) %405, align 4
  %406 = getelementptr float, ptr addrspace(7) %403, i32 %389
  store <1 x float> %356, ptr addrspace(7) %406, align 4
  %407 = getelementptr float, ptr addrspace(7) %403, i32 %391
  store <1 x float> %361, ptr addrspace(7) %407, align 4
  %408 = getelementptr i8, ptr addrspace(7) %385, i32 40960
  %409 = getelementptr float, ptr addrspace(7) %408, i32 %384
  store <1 x float> %363, ptr addrspace(7) %409, align 4
  %410 = getelementptr float, ptr addrspace(7) %408, i32 %387
  store <1 x float> %368, ptr addrspace(7) %410, align 4
  %411 = getelementptr float, ptr addrspace(7) %408, i32 %389
  store <1 x float> %373, ptr addrspace(7) %411, align 4
  %412 = getelementptr float, ptr addrspace(7) %408, i32 %391
  store <1 x float> %378, ptr addrspace(7) %412, align 4
  %413 = getelementptr i8, ptr addrspace(7) %385, i32 43520
  %414 = getelementptr float, ptr addrspace(7) %413, i32 %384
  store <1 x float> %364, ptr addrspace(7) %414, align 4
  %415 = getelementptr float, ptr addrspace(7) %413, i32 %387
  store <1 x float> %369, ptr addrspace(7) %415, align 4
  %416 = getelementptr float, ptr addrspace(7) %413, i32 %389
  store <1 x float> %374, ptr addrspace(7) %416, align 4
  %417 = getelementptr float, ptr addrspace(7) %413, i32 %391
  store <1 x float> %379, ptr addrspace(7) %417, align 4
  %418 = getelementptr i8, ptr addrspace(7) %385, i32 46080
  %419 = getelementptr float, ptr addrspace(7) %418, i32 %384
  store <1 x float> %365, ptr addrspace(7) %419, align 4
  %420 = getelementptr float, ptr addrspace(7) %418, i32 %387
  store <1 x float> %370, ptr addrspace(7) %420, align 4
  %421 = getelementptr float, ptr addrspace(7) %418, i32 %389
  store <1 x float> %375, ptr addrspace(7) %421, align 4
  %422 = getelementptr float, ptr addrspace(7) %418, i32 %391
  store <1 x float> %380, ptr addrspace(7) %422, align 4
  %423 = getelementptr i8, ptr addrspace(7) %385, i32 48640
  %424 = getelementptr float, ptr addrspace(7) %423, i32 %384
  store <1 x float> %366, ptr addrspace(7) %424, align 4
  %425 = getelementptr float, ptr addrspace(7) %423, i32 %387
  store <1 x float> %371, ptr addrspace(7) %425, align 4
  %426 = getelementptr float, ptr addrspace(7) %423, i32 %389
  store <1 x float> %376, ptr addrspace(7) %426, align 4
  %427 = getelementptr float, ptr addrspace(7) %423, i32 %391
  store <1 x float> %381, ptr addrspace(7) %427, align 4
  fence syncscope("workgroup") release, !mmra !3
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire, !mmra !3
  ret void
}

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

; Function Attrs: alwaysinline mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) readnone, i16, i64, i32) #3

; Function Attrs: alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: alwaysinline convergent mustprogress nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #4

; Function Attrs: alwaysinline convergent mustprogress nocallback nocreateundeforpoison nofree nosync nounwind willreturn memory(none)
declare <4 x float> @llvm.amdgcn.mfma.scale.f32.16x16x128.f8f6f4.v8i32.v8i32(<8 x i32>, <8 x i32>, <4 x float>, i32 immarg, i32 immarg, i32 immarg, i32, i32 immarg, i32) #5

; Function Attrs: alwaysinline convergent mustprogress nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.sched.barrier(i32 immarg) #4

attributes #0 = { alwaysinline nofree norecurse nounwind "amdgpu-agpr-alloc"="0" "amdgpu-flat-work-group-size"="256,256" "amdgpu-no-cluster-id-x" "amdgpu-no-cluster-id-y" "amdgpu-no-cluster-id-z" "amdgpu-no-completion-action" "amdgpu-no-default-queue" "amdgpu-no-dispatch-id" "amdgpu-no-dispatch-ptr" "amdgpu-no-flat-scratch-init" "amdgpu-no-heap-ptr" "amdgpu-no-hostcall-ptr" "amdgpu-no-implicitarg-ptr" "amdgpu-no-lds-kernel-id" "amdgpu-no-multigrid-sync-arg" "amdgpu-no-queue-ptr" "amdgpu-no-workgroup-id-x" "amdgpu-no-workgroup-id-y" "amdgpu-no-workgroup-id-z" "amdgpu-no-workitem-id-x" "amdgpu-no-workitem-id-y" "amdgpu-no-workitem-id-z" "uniform-work-group-size"="true" }
attributes #1 = { alwaysinline mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { alwaysinline mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #3 = { alwaysinline mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { alwaysinline convergent mustprogress nocallback nofree nounwind willreturn }
attributes #5 = { alwaysinline convergent mustprogress nocallback nocreateundeforpoison nofree nosync nounwind willreturn memory(none) }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"amdhsa_code_object_version", i32 500}
!2 = !{i32 256, i32 1, i32 1}
!3 = !{!"amdgpu-synchronize-as", !"local"}
