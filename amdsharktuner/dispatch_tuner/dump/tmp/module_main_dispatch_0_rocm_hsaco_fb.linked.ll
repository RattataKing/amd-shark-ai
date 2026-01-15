; ModuleID = 'main_dispatch_0'
source_filename = "main_dispatch_0"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9"

@__shared_memory___0 = private addrspace(3) global [64 x [264 x i8]] undef, align 16
@__shared_memory__ = private addrspace(3) global [64 x [264 x i8]] undef, align 16

; Function Attrs: alwaysinline
define amdgpu_kernel void @main_dispatch_0_matmul_64x640x2048_f8E4M3FNUZxf8E4M3FNUZxf32(ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %0, ptr addrspace(1) inreg noalias noundef nonnull readonly align 16 %1, ptr addrspace(1) inreg noalias noundef nonnull align 16 %2) #0 !reqd_work_group_size !2 {
  %4 = call range(i32 0, 256) i32 @llvm.amdgcn.workitem.id.x()
  %5 = sext i32 %4 to i64
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %0, i64 64) ]
  %6 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %0, i16 0, i32 131072, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %1, i64 64) ]
  %7 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %1, i16 0, i32 1310720, i32 159744)
  call void @llvm.assume(i1 true) [ "align"(ptr addrspace(1) %2, i64 64) ]
  %8 = call ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) %2, i16 0, i32 163840, i32 159744)
  %9 = call range(i32 0, 10) i32 @llvm.amdgcn.workgroup.id.x()
  %10 = sext i32 %9 to i64
  %11 = trunc i64 %10 to i32
  %12 = mul nsw i32 %11, 64
  %13 = trunc i64 %5 to i32
  %14 = udiv i32 %13, 16
  %15 = zext i32 %14 to i64
  %16 = urem i32 %13, 16
  %17 = add nsw i32 %14, 16
  %18 = zext i32 %17 to i64
  %19 = add nsw i32 %14, 32
  %20 = zext i32 %19 to i64
  %21 = add nsw i32 %14, 48
  %22 = zext i32 %21 to i64
  %23 = add nsw i32 %14, %12
  %24 = zext i32 %23 to i64
  %25 = add nsw i32 %23, 16
  %26 = zext i32 %25 to i64
  %27 = add nsw i32 %23, 32
  %28 = zext i32 %27 to i64
  %29 = add nsw i32 %23, 48
  %30 = zext i32 %29 to i64
  %31 = mul nsw i32 %16, 16
  %32 = zext i32 %31 to i64
  %33 = udiv i32 %13, 128
  %34 = urem i32 %13, 128
  %35 = udiv i32 %34, 64
  %36 = urem i32 %13, 64
  %37 = udiv i32 %36, 16
  %38 = mul nsw i32 %33, 32
  %39 = add nsw i32 %38, %16
  %40 = zext i32 %39 to i64
  %41 = mul nsw i32 %37, 8
  %42 = zext i32 %41 to i64
  %43 = add nsw i32 %41, 32
  %44 = zext i32 %43 to i64
  %45 = add nsw i32 %41, 64
  %46 = zext i32 %45 to i64
  %47 = add nsw i32 %41, 96
  %48 = zext i32 %47 to i64
  %49 = add nsw i32 %41, 128
  %50 = zext i32 %49 to i64
  %51 = add nsw i32 %41, 160
  %52 = zext i32 %51 to i64
  %53 = add nsw i32 %41, 192
  %54 = zext i32 %53 to i64
  %55 = add nsw i32 %41, 224
  %56 = zext i32 %55 to i64
  %57 = add nsw i32 %39, 16
  %58 = zext i32 %57 to i64
  %59 = mul nsw i32 %35, 32
  %60 = add nsw i32 %59, %16
  %61 = zext i32 %60 to i64
  %62 = add nsw i32 %60, 16
  %63 = zext i32 %62 to i64
  br label %64

64:                                               ; preds = %68, %3
  %65 = phi i32 [ %451, %68 ], [ 0, %3 ]
  %66 = phi [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] [ %450, %68 ], [ zeroinitializer, %3 ]
  %67 = icmp slt i32 %65, 2048
  br i1 %67, label %68, label %452

68:                                               ; preds = %64
  call void @llvm.amdgcn.s.waitcnt(i32 -7937)
  call void @llvm.amdgcn.s.barrier()
  %69 = add nsw i32 %31, %65
  %70 = zext i32 %69 to i64
  %71 = mul i64 %15, 2048
  %72 = add i64 %71, %70
  %73 = getelementptr i8, ptr addrspace(7) %6, i64 %72
  %74 = load <16 x i8>, ptr addrspace(7) %73, align 1
  %75 = mul i64 %18, 2048
  %76 = add i64 %75, %70
  %77 = getelementptr i8, ptr addrspace(7) %6, i64 %76
  %78 = load <16 x i8>, ptr addrspace(7) %77, align 1
  %79 = mul i64 %20, 2048
  %80 = add i64 %79, %70
  %81 = getelementptr i8, ptr addrspace(7) %6, i64 %80
  %82 = load <16 x i8>, ptr addrspace(7) %81, align 1
  %83 = mul i64 %22, 2048
  %84 = add i64 %83, %70
  %85 = getelementptr i8, ptr addrspace(7) %6, i64 %84
  %86 = load <16 x i8>, ptr addrspace(7) %85, align 1
  %87 = mul i64 %24, 2048
  %88 = add i64 %87, %70
  %89 = getelementptr i8, ptr addrspace(7) %7, i64 %88
  %90 = load <16 x i8>, ptr addrspace(7) %89, align 1
  %91 = mul i64 %26, 2048
  %92 = add i64 %91, %70
  %93 = getelementptr i8, ptr addrspace(7) %7, i64 %92
  %94 = load <16 x i8>, ptr addrspace(7) %93, align 1
  %95 = mul i64 %28, 2048
  %96 = add i64 %95, %70
  %97 = getelementptr i8, ptr addrspace(7) %7, i64 %96
  %98 = load <16 x i8>, ptr addrspace(7) %97, align 1
  %99 = mul i64 %30, 2048
  %100 = add i64 %99, %70
  %101 = getelementptr i8, ptr addrspace(7) %7, i64 %100
  %102 = load <16 x i8>, ptr addrspace(7) %101, align 1
  %103 = mul i64 %15, 264
  %104 = add i64 %103, %32
  %105 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %104
  store <16 x i8> %74, ptr addrspace(3) %105, align 1
  %106 = mul i64 %18, 264
  %107 = add i64 %106, %32
  %108 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %107
  store <16 x i8> %78, ptr addrspace(3) %108, align 1
  %109 = mul i64 %20, 264
  %110 = add i64 %109, %32
  %111 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %110
  store <16 x i8> %82, ptr addrspace(3) %111, align 1
  %112 = mul i64 %22, 264
  %113 = add i64 %112, %32
  %114 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %113
  store <16 x i8> %86, ptr addrspace(3) %114, align 1
  %115 = mul i64 %15, 264
  %116 = add i64 %115, %32
  %117 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %116
  store <16 x i8> %90, ptr addrspace(3) %117, align 1
  %118 = mul i64 %18, 264
  %119 = add i64 %118, %32
  %120 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %119
  store <16 x i8> %94, ptr addrspace(3) %120, align 1
  %121 = mul i64 %20, 264
  %122 = add i64 %121, %32
  %123 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %122
  store <16 x i8> %98, ptr addrspace(3) %123, align 1
  %124 = mul i64 %22, 264
  %125 = add i64 %124, %32
  %126 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %125
  store <16 x i8> %102, ptr addrspace(3) %126, align 1
  call void @llvm.amdgcn.s.waitcnt(i32 -7937)
  call void @llvm.amdgcn.s.barrier()
  %127 = mul i64 %40, 264
  %128 = add i64 %127, %42
  %129 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %128
  %130 = load <8 x i8>, ptr addrspace(3) %129, align 1
  %131 = mul i64 %40, 264
  %132 = add i64 %131, %44
  %133 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %132
  %134 = load <8 x i8>, ptr addrspace(3) %133, align 1
  %135 = mul i64 %40, 264
  %136 = add i64 %135, %46
  %137 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %136
  %138 = load <8 x i8>, ptr addrspace(3) %137, align 1
  %139 = mul i64 %40, 264
  %140 = add i64 %139, %48
  %141 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %140
  %142 = load <8 x i8>, ptr addrspace(3) %141, align 1
  %143 = mul i64 %40, 264
  %144 = add i64 %143, %50
  %145 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %144
  %146 = load <8 x i8>, ptr addrspace(3) %145, align 1
  %147 = mul i64 %40, 264
  %148 = add i64 %147, %52
  %149 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %148
  %150 = load <8 x i8>, ptr addrspace(3) %149, align 1
  %151 = mul i64 %40, 264
  %152 = add i64 %151, %54
  %153 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %152
  %154 = load <8 x i8>, ptr addrspace(3) %153, align 1
  %155 = mul i64 %40, 264
  %156 = add i64 %155, %56
  %157 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %156
  %158 = load <8 x i8>, ptr addrspace(3) %157, align 1
  %159 = mul i64 %58, 264
  %160 = add i64 %159, %42
  %161 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %160
  %162 = load <8 x i8>, ptr addrspace(3) %161, align 1
  %163 = mul i64 %58, 264
  %164 = add i64 %163, %44
  %165 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %164
  %166 = load <8 x i8>, ptr addrspace(3) %165, align 1
  %167 = mul i64 %58, 264
  %168 = add i64 %167, %46
  %169 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %168
  %170 = load <8 x i8>, ptr addrspace(3) %169, align 1
  %171 = mul i64 %58, 264
  %172 = add i64 %171, %48
  %173 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %172
  %174 = load <8 x i8>, ptr addrspace(3) %173, align 1
  %175 = mul i64 %58, 264
  %176 = add i64 %175, %50
  %177 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %176
  %178 = load <8 x i8>, ptr addrspace(3) %177, align 1
  %179 = mul i64 %58, 264
  %180 = add i64 %179, %52
  %181 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %180
  %182 = load <8 x i8>, ptr addrspace(3) %181, align 1
  %183 = mul i64 %58, 264
  %184 = add i64 %183, %54
  %185 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %184
  %186 = load <8 x i8>, ptr addrspace(3) %185, align 1
  %187 = mul i64 %58, 264
  %188 = add i64 %187, %56
  %189 = getelementptr i8, ptr addrspace(3) @__shared_memory__, i64 %188
  %190 = load <8 x i8>, ptr addrspace(3) %189, align 1
  %191 = mul i64 %61, 264
  %192 = add i64 %191, %42
  %193 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %192
  %194 = load <8 x i8>, ptr addrspace(3) %193, align 1
  %195 = mul i64 %61, 264
  %196 = add i64 %195, %44
  %197 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %196
  %198 = load <8 x i8>, ptr addrspace(3) %197, align 1
  %199 = mul i64 %61, 264
  %200 = add i64 %199, %46
  %201 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %200
  %202 = load <8 x i8>, ptr addrspace(3) %201, align 1
  %203 = mul i64 %61, 264
  %204 = add i64 %203, %48
  %205 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %204
  %206 = load <8 x i8>, ptr addrspace(3) %205, align 1
  %207 = mul i64 %61, 264
  %208 = add i64 %207, %50
  %209 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %208
  %210 = load <8 x i8>, ptr addrspace(3) %209, align 1
  %211 = mul i64 %61, 264
  %212 = add i64 %211, %52
  %213 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %212
  %214 = load <8 x i8>, ptr addrspace(3) %213, align 1
  %215 = mul i64 %61, 264
  %216 = add i64 %215, %54
  %217 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %216
  %218 = load <8 x i8>, ptr addrspace(3) %217, align 1
  %219 = mul i64 %61, 264
  %220 = add i64 %219, %56
  %221 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %220
  %222 = load <8 x i8>, ptr addrspace(3) %221, align 1
  %223 = mul i64 %63, 264
  %224 = add i64 %223, %42
  %225 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %224
  %226 = load <8 x i8>, ptr addrspace(3) %225, align 1
  %227 = mul i64 %63, 264
  %228 = add i64 %227, %44
  %229 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %228
  %230 = load <8 x i8>, ptr addrspace(3) %229, align 1
  %231 = mul i64 %63, 264
  %232 = add i64 %231, %46
  %233 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %232
  %234 = load <8 x i8>, ptr addrspace(3) %233, align 1
  %235 = mul i64 %63, 264
  %236 = add i64 %235, %48
  %237 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %236
  %238 = load <8 x i8>, ptr addrspace(3) %237, align 1
  %239 = mul i64 %63, 264
  %240 = add i64 %239, %50
  %241 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %240
  %242 = load <8 x i8>, ptr addrspace(3) %241, align 1
  %243 = mul i64 %63, 264
  %244 = add i64 %243, %52
  %245 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %244
  %246 = load <8 x i8>, ptr addrspace(3) %245, align 1
  %247 = mul i64 %63, 264
  %248 = add i64 %247, %54
  %249 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %248
  %250 = load <8 x i8>, ptr addrspace(3) %249, align 1
  %251 = mul i64 %63, 264
  %252 = add i64 %251, %56
  %253 = getelementptr i8, ptr addrspace(3) @__shared_memory___0, i64 %252
  %254 = load <8 x i8>, ptr addrspace(3) %253, align 1
  %255 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 0, 0, 0, 0, 0
  %256 = extractelement <1 x float> %255, i64 0
  %257 = insertelement <4 x float> poison, float %256, i64 0
  %258 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 0, 0, 0, 0, 1
  %259 = extractelement <1 x float> %258, i64 0
  %260 = insertelement <4 x float> %257, float %259, i64 1
  %261 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 0, 0, 0, 0, 2
  %262 = extractelement <1 x float> %261, i64 0
  %263 = insertelement <4 x float> %260, float %262, i64 2
  %264 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 0, 0, 0, 0, 3
  %265 = extractelement <1 x float> %264, i64 0
  %266 = insertelement <4 x float> %263, float %265, i64 3
  %267 = bitcast <8 x i8> %130 to i64
  %268 = bitcast <8 x i8> %194 to i64
  %269 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %267, i64 %268, <4 x float> %266, i32 0, i32 0, i32 0)
  %270 = bitcast <8 x i8> %134 to i64
  %271 = bitcast <8 x i8> %198 to i64
  %272 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %270, i64 %271, <4 x float> %269, i32 0, i32 0, i32 0)
  %273 = bitcast <8 x i8> %138 to i64
  %274 = bitcast <8 x i8> %202 to i64
  %275 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %273, i64 %274, <4 x float> %272, i32 0, i32 0, i32 0)
  %276 = bitcast <8 x i8> %142 to i64
  %277 = bitcast <8 x i8> %206 to i64
  %278 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %276, i64 %277, <4 x float> %275, i32 0, i32 0, i32 0)
  %279 = bitcast <8 x i8> %146 to i64
  %280 = bitcast <8 x i8> %210 to i64
  %281 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %279, i64 %280, <4 x float> %278, i32 0, i32 0, i32 0)
  %282 = bitcast <8 x i8> %150 to i64
  %283 = bitcast <8 x i8> %214 to i64
  %284 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %282, i64 %283, <4 x float> %281, i32 0, i32 0, i32 0)
  %285 = bitcast <8 x i8> %154 to i64
  %286 = bitcast <8 x i8> %218 to i64
  %287 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %285, i64 %286, <4 x float> %284, i32 0, i32 0, i32 0)
  %288 = bitcast <8 x i8> %158 to i64
  %289 = bitcast <8 x i8> %222 to i64
  %290 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %288, i64 %289, <4 x float> %287, i32 0, i32 0, i32 0)
  %291 = extractelement <4 x float> %290, i64 0
  %292 = insertelement <1 x float> poison, float %291, i64 0
  %293 = insertvalue [1 x [1 x [4 x <1 x float>]]] poison, <1 x float> %292, 0, 0, 0
  %294 = extractelement <4 x float> %290, i64 1
  %295 = insertelement <1 x float> poison, float %294, i64 0
  %296 = insertvalue [1 x [1 x [4 x <1 x float>]]] %293, <1 x float> %295, 0, 0, 1
  %297 = extractelement <4 x float> %290, i64 2
  %298 = insertelement <1 x float> poison, float %297, i64 0
  %299 = insertvalue [1 x [1 x [4 x <1 x float>]]] %296, <1 x float> %298, 0, 0, 2
  %300 = extractelement <4 x float> %290, i64 3
  %301 = insertelement <1 x float> poison, float %300, i64 0
  %302 = insertvalue [1 x [1 x [4 x <1 x float>]]] %299, <1 x float> %301, 0, 0, 3
  %303 = insertvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] zeroinitializer, [1 x [1 x [4 x <1 x float>]]] %302, 0, 0
  %304 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 0, 1, 0, 0, 0
  %305 = extractelement <1 x float> %304, i64 0
  %306 = insertelement <4 x float> poison, float %305, i64 0
  %307 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 0, 1, 0, 0, 1
  %308 = extractelement <1 x float> %307, i64 0
  %309 = insertelement <4 x float> %306, float %308, i64 1
  %310 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 0, 1, 0, 0, 2
  %311 = extractelement <1 x float> %310, i64 0
  %312 = insertelement <4 x float> %309, float %311, i64 2
  %313 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 0, 1, 0, 0, 3
  %314 = extractelement <1 x float> %313, i64 0
  %315 = insertelement <4 x float> %312, float %314, i64 3
  %316 = bitcast <8 x i8> %130 to i64
  %317 = bitcast <8 x i8> %226 to i64
  %318 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %316, i64 %317, <4 x float> %315, i32 0, i32 0, i32 0)
  %319 = bitcast <8 x i8> %134 to i64
  %320 = bitcast <8 x i8> %230 to i64
  %321 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %319, i64 %320, <4 x float> %318, i32 0, i32 0, i32 0)
  %322 = bitcast <8 x i8> %138 to i64
  %323 = bitcast <8 x i8> %234 to i64
  %324 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %322, i64 %323, <4 x float> %321, i32 0, i32 0, i32 0)
  %325 = bitcast <8 x i8> %142 to i64
  %326 = bitcast <8 x i8> %238 to i64
  %327 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %325, i64 %326, <4 x float> %324, i32 0, i32 0, i32 0)
  %328 = bitcast <8 x i8> %146 to i64
  %329 = bitcast <8 x i8> %242 to i64
  %330 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %328, i64 %329, <4 x float> %327, i32 0, i32 0, i32 0)
  %331 = bitcast <8 x i8> %150 to i64
  %332 = bitcast <8 x i8> %246 to i64
  %333 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %331, i64 %332, <4 x float> %330, i32 0, i32 0, i32 0)
  %334 = bitcast <8 x i8> %154 to i64
  %335 = bitcast <8 x i8> %250 to i64
  %336 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %334, i64 %335, <4 x float> %333, i32 0, i32 0, i32 0)
  %337 = bitcast <8 x i8> %158 to i64
  %338 = bitcast <8 x i8> %254 to i64
  %339 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %337, i64 %338, <4 x float> %336, i32 0, i32 0, i32 0)
  %340 = extractelement <4 x float> %339, i64 0
  %341 = insertelement <1 x float> poison, float %340, i64 0
  %342 = insertvalue [1 x [1 x [4 x <1 x float>]]] poison, <1 x float> %341, 0, 0, 0
  %343 = extractelement <4 x float> %339, i64 1
  %344 = insertelement <1 x float> poison, float %343, i64 0
  %345 = insertvalue [1 x [1 x [4 x <1 x float>]]] %342, <1 x float> %344, 0, 0, 1
  %346 = extractelement <4 x float> %339, i64 2
  %347 = insertelement <1 x float> poison, float %346, i64 0
  %348 = insertvalue [1 x [1 x [4 x <1 x float>]]] %345, <1 x float> %347, 0, 0, 2
  %349 = extractelement <4 x float> %339, i64 3
  %350 = insertelement <1 x float> poison, float %349, i64 0
  %351 = insertvalue [1 x [1 x [4 x <1 x float>]]] %348, <1 x float> %350, 0, 0, 3
  %352 = insertvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %303, [1 x [1 x [4 x <1 x float>]]] %351, 0, 1
  %353 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 1, 0, 0, 0, 0
  %354 = extractelement <1 x float> %353, i64 0
  %355 = insertelement <4 x float> poison, float %354, i64 0
  %356 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 1, 0, 0, 0, 1
  %357 = extractelement <1 x float> %356, i64 0
  %358 = insertelement <4 x float> %355, float %357, i64 1
  %359 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 1, 0, 0, 0, 2
  %360 = extractelement <1 x float> %359, i64 0
  %361 = insertelement <4 x float> %358, float %360, i64 2
  %362 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 1, 0, 0, 0, 3
  %363 = extractelement <1 x float> %362, i64 0
  %364 = insertelement <4 x float> %361, float %363, i64 3
  %365 = bitcast <8 x i8> %162 to i64
  %366 = bitcast <8 x i8> %194 to i64
  %367 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %365, i64 %366, <4 x float> %364, i32 0, i32 0, i32 0)
  %368 = bitcast <8 x i8> %166 to i64
  %369 = bitcast <8 x i8> %198 to i64
  %370 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %368, i64 %369, <4 x float> %367, i32 0, i32 0, i32 0)
  %371 = bitcast <8 x i8> %170 to i64
  %372 = bitcast <8 x i8> %202 to i64
  %373 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %371, i64 %372, <4 x float> %370, i32 0, i32 0, i32 0)
  %374 = bitcast <8 x i8> %174 to i64
  %375 = bitcast <8 x i8> %206 to i64
  %376 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %374, i64 %375, <4 x float> %373, i32 0, i32 0, i32 0)
  %377 = bitcast <8 x i8> %178 to i64
  %378 = bitcast <8 x i8> %210 to i64
  %379 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %377, i64 %378, <4 x float> %376, i32 0, i32 0, i32 0)
  %380 = bitcast <8 x i8> %182 to i64
  %381 = bitcast <8 x i8> %214 to i64
  %382 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %380, i64 %381, <4 x float> %379, i32 0, i32 0, i32 0)
  %383 = bitcast <8 x i8> %186 to i64
  %384 = bitcast <8 x i8> %218 to i64
  %385 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %383, i64 %384, <4 x float> %382, i32 0, i32 0, i32 0)
  %386 = bitcast <8 x i8> %190 to i64
  %387 = bitcast <8 x i8> %222 to i64
  %388 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %386, i64 %387, <4 x float> %385, i32 0, i32 0, i32 0)
  %389 = extractelement <4 x float> %388, i64 0
  %390 = insertelement <1 x float> poison, float %389, i64 0
  %391 = insertvalue [1 x [1 x [4 x <1 x float>]]] poison, <1 x float> %390, 0, 0, 0
  %392 = extractelement <4 x float> %388, i64 1
  %393 = insertelement <1 x float> poison, float %392, i64 0
  %394 = insertvalue [1 x [1 x [4 x <1 x float>]]] %391, <1 x float> %393, 0, 0, 1
  %395 = extractelement <4 x float> %388, i64 2
  %396 = insertelement <1 x float> poison, float %395, i64 0
  %397 = insertvalue [1 x [1 x [4 x <1 x float>]]] %394, <1 x float> %396, 0, 0, 2
  %398 = extractelement <4 x float> %388, i64 3
  %399 = insertelement <1 x float> poison, float %398, i64 0
  %400 = insertvalue [1 x [1 x [4 x <1 x float>]]] %397, <1 x float> %399, 0, 0, 3
  %401 = insertvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %352, [1 x [1 x [4 x <1 x float>]]] %400, 1, 0
  %402 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 1, 1, 0, 0, 0
  %403 = extractelement <1 x float> %402, i64 0
  %404 = insertelement <4 x float> poison, float %403, i64 0
  %405 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 1, 1, 0, 0, 1
  %406 = extractelement <1 x float> %405, i64 0
  %407 = insertelement <4 x float> %404, float %406, i64 1
  %408 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 1, 1, 0, 0, 2
  %409 = extractelement <1 x float> %408, i64 0
  %410 = insertelement <4 x float> %407, float %409, i64 2
  %411 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 1, 1, 0, 0, 3
  %412 = extractelement <1 x float> %411, i64 0
  %413 = insertelement <4 x float> %410, float %412, i64 3
  %414 = bitcast <8 x i8> %162 to i64
  %415 = bitcast <8 x i8> %226 to i64
  %416 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %414, i64 %415, <4 x float> %413, i32 0, i32 0, i32 0)
  %417 = bitcast <8 x i8> %166 to i64
  %418 = bitcast <8 x i8> %230 to i64
  %419 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %417, i64 %418, <4 x float> %416, i32 0, i32 0, i32 0)
  %420 = bitcast <8 x i8> %170 to i64
  %421 = bitcast <8 x i8> %234 to i64
  %422 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %420, i64 %421, <4 x float> %419, i32 0, i32 0, i32 0)
  %423 = bitcast <8 x i8> %174 to i64
  %424 = bitcast <8 x i8> %238 to i64
  %425 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %423, i64 %424, <4 x float> %422, i32 0, i32 0, i32 0)
  %426 = bitcast <8 x i8> %178 to i64
  %427 = bitcast <8 x i8> %242 to i64
  %428 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %426, i64 %427, <4 x float> %425, i32 0, i32 0, i32 0)
  %429 = bitcast <8 x i8> %182 to i64
  %430 = bitcast <8 x i8> %246 to i64
  %431 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %429, i64 %430, <4 x float> %428, i32 0, i32 0, i32 0)
  %432 = bitcast <8 x i8> %186 to i64
  %433 = bitcast <8 x i8> %250 to i64
  %434 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %432, i64 %433, <4 x float> %431, i32 0, i32 0, i32 0)
  %435 = bitcast <8 x i8> %190 to i64
  %436 = bitcast <8 x i8> %254 to i64
  %437 = call <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64 %435, i64 %436, <4 x float> %434, i32 0, i32 0, i32 0)
  %438 = extractelement <4 x float> %437, i64 0
  %439 = insertelement <1 x float> poison, float %438, i64 0
  %440 = insertvalue [1 x [1 x [4 x <1 x float>]]] poison, <1 x float> %439, 0, 0, 0
  %441 = extractelement <4 x float> %437, i64 1
  %442 = insertelement <1 x float> poison, float %441, i64 0
  %443 = insertvalue [1 x [1 x [4 x <1 x float>]]] %440, <1 x float> %442, 0, 0, 1
  %444 = extractelement <4 x float> %437, i64 2
  %445 = insertelement <1 x float> poison, float %444, i64 0
  %446 = insertvalue [1 x [1 x [4 x <1 x float>]]] %443, <1 x float> %445, 0, 0, 2
  %447 = extractelement <4 x float> %437, i64 3
  %448 = insertelement <1 x float> poison, float %447, i64 0
  %449 = insertvalue [1 x [1 x [4 x <1 x float>]]] %446, <1 x float> %448, 0, 0, 3
  %450 = insertvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %401, [1 x [1 x [4 x <1 x float>]]] %449, 1, 1
  %451 = add i32 %65, 256
  br label %64

452:                                              ; preds = %64
  %453 = mul nsw i32 %37, 4
  %454 = add nsw i32 %38, %453
  %455 = zext i32 %454 to i64
  %456 = add i32 %60, %12
  %457 = zext i32 %456 to i64
  %458 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 0, 0, 0, 0, 0
  %459 = mul i64 %455, 640
  %460 = add i64 %459, %457
  %461 = getelementptr float, ptr addrspace(7) %8, i64 %460
  store <1 x float> %458, ptr addrspace(7) %461, align 4
  %462 = add nsw i32 %454, 1
  %463 = zext i32 %462 to i64
  %464 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 0, 0, 0, 0, 1
  %465 = mul i64 %463, 640
  %466 = add i64 %465, %457
  %467 = getelementptr float, ptr addrspace(7) %8, i64 %466
  store <1 x float> %464, ptr addrspace(7) %467, align 4
  %468 = add nsw i32 %454, 2
  %469 = zext i32 %468 to i64
  %470 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 0, 0, 0, 0, 2
  %471 = mul i64 %469, 640
  %472 = add i64 %471, %457
  %473 = getelementptr float, ptr addrspace(7) %8, i64 %472
  store <1 x float> %470, ptr addrspace(7) %473, align 4
  %474 = add nsw i32 %454, 3
  %475 = zext i32 %474 to i64
  %476 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 0, 0, 0, 0, 3
  %477 = mul i64 %475, 640
  %478 = add i64 %477, %457
  %479 = getelementptr float, ptr addrspace(7) %8, i64 %478
  store <1 x float> %476, ptr addrspace(7) %479, align 4
  %480 = add nsw i32 %456, 16
  %481 = zext i32 %480 to i64
  %482 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 0, 1, 0, 0, 0
  %483 = mul i64 %455, 640
  %484 = add i64 %483, %481
  %485 = getelementptr float, ptr addrspace(7) %8, i64 %484
  store <1 x float> %482, ptr addrspace(7) %485, align 4
  %486 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 0, 1, 0, 0, 1
  %487 = mul i64 %463, 640
  %488 = add i64 %487, %481
  %489 = getelementptr float, ptr addrspace(7) %8, i64 %488
  store <1 x float> %486, ptr addrspace(7) %489, align 4
  %490 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 0, 1, 0, 0, 2
  %491 = mul i64 %469, 640
  %492 = add i64 %491, %481
  %493 = getelementptr float, ptr addrspace(7) %8, i64 %492
  store <1 x float> %490, ptr addrspace(7) %493, align 4
  %494 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 0, 1, 0, 0, 3
  %495 = mul i64 %475, 640
  %496 = add i64 %495, %481
  %497 = getelementptr float, ptr addrspace(7) %8, i64 %496
  store <1 x float> %494, ptr addrspace(7) %497, align 4
  %498 = add nsw i32 %454, 16
  %499 = zext i32 %498 to i64
  %500 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 1, 0, 0, 0, 0
  %501 = mul i64 %499, 640
  %502 = add i64 %501, %457
  %503 = getelementptr float, ptr addrspace(7) %8, i64 %502
  store <1 x float> %500, ptr addrspace(7) %503, align 4
  %504 = add nsw i32 %454, 17
  %505 = zext i32 %504 to i64
  %506 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 1, 0, 0, 0, 1
  %507 = mul i64 %505, 640
  %508 = add i64 %507, %457
  %509 = getelementptr float, ptr addrspace(7) %8, i64 %508
  store <1 x float> %506, ptr addrspace(7) %509, align 4
  %510 = add nsw i32 %454, 18
  %511 = zext i32 %510 to i64
  %512 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 1, 0, 0, 0, 2
  %513 = mul i64 %511, 640
  %514 = add i64 %513, %457
  %515 = getelementptr float, ptr addrspace(7) %8, i64 %514
  store <1 x float> %512, ptr addrspace(7) %515, align 4
  %516 = add nsw i32 %454, 19
  %517 = zext i32 %516 to i64
  %518 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 1, 0, 0, 0, 3
  %519 = mul i64 %517, 640
  %520 = add i64 %519, %457
  %521 = getelementptr float, ptr addrspace(7) %8, i64 %520
  store <1 x float> %518, ptr addrspace(7) %521, align 4
  %522 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 1, 1, 0, 0, 0
  %523 = mul i64 %499, 640
  %524 = add i64 %523, %481
  %525 = getelementptr float, ptr addrspace(7) %8, i64 %524
  store <1 x float> %522, ptr addrspace(7) %525, align 4
  %526 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 1, 1, 0, 0, 1
  %527 = mul i64 %505, 640
  %528 = add i64 %527, %481
  %529 = getelementptr float, ptr addrspace(7) %8, i64 %528
  store <1 x float> %526, ptr addrspace(7) %529, align 4
  %530 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 1, 1, 0, 0, 2
  %531 = mul i64 %511, 640
  %532 = add i64 %531, %481
  %533 = getelementptr float, ptr addrspace(7) %8, i64 %532
  store <1 x float> %530, ptr addrspace(7) %533, align 4
  %534 = extractvalue [2 x [2 x [1 x [1 x [4 x <1 x float>]]]]] %66, 1, 1, 0, 0, 3
  %535 = mul i64 %517, 640
  %536 = add i64 %535, %481
  %537 = getelementptr float, ptr addrspace(7) %8, i64 %536
  store <1 x float> %534, ptr addrspace(7) %537, align 4
  ret void
}

; Function Attrs: alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: alwaysinline nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

; Function Attrs: alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare ptr addrspace(7) @llvm.amdgcn.make.buffer.rsrc.p7.p1(ptr addrspace(1) readnone, i16, i32, i32) #1

; Function Attrs: alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: alwaysinline nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.waitcnt(i32 immarg) #3

; Function Attrs: alwaysinline convergent nocallback nofree nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #4

; Function Attrs: alwaysinline convergent nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x float> @llvm.amdgcn.mfma.f32.16x16x32.fp8.fp8(i64, i64, <4 x float>, i32 immarg, i32 immarg, i32 immarg) #5

attributes #0 = { alwaysinline "amdgpu-flat-work-group-size"="256,256" "uniform-work-group-size"="true" }
attributes #1 = { alwaysinline nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { alwaysinline nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #3 = { alwaysinline nocallback nofree nounwind willreturn }
attributes #4 = { alwaysinline convergent nocallback nofree nounwind willreturn }
attributes #5 = { alwaysinline convergent nocallback nofree nosync nounwind willreturn memory(none) }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"amdhsa_code_object_version", i32 500}
!2 = !{i32 256, i32 1, i32 1}
