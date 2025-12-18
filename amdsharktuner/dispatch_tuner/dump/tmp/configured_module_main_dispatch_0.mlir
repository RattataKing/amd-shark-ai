hal.executable public @main_dispatch_0 {
  hal.executable.variant public @rocm_hsaco_fb target(<"rocm", "rocm-hsaco-fb", {abi = "hip", iree.encoding.resolver = #iree_gpu.gpu_encoding_resolver<>, iree_codegen.target_info = #iree_gpu.target<arch = "gfx1201", features = "", wgp = <compute =  fp64|fp32|fp16|int64|int32|int16|int8, storage =  b64|b32|b16|b8, subgroup =  shuffle|arithmetic, dot =  dp4xi8toi32, mma = [<WMMAR4_F32_16x16x16_F16>, <WMMAR4_F16_16x16x16_F16>, <WMMAR4_F32_16x16x16_BF16>, <WMMAR4_BF16_16x16x16_BF16>, <WMMAR4_F32_16x16x16_F8E5M2>, <WMMAR4_F32_16x16x16_F8E5M2_F8E4M3FN>, <WMMAR4_F32_16x16x16_F8E4M3FN>, <WMMAR4_F32_16x16x16_F8E4M3FN_F8E5M2>, <WMMAR4_I32_16x16x16_I8>], subgroup_size_choices = [32, 64], max_workgroup_sizes = [1024, 1024, 1024], max_thread_count_per_workgroup = 1024, max_workgroup_memory_bytes = 65536, max_workgroup_counts = [2147483647, 2147483647, 2147483647], max_load_instruction_bits = 128, simds_per_wgp = 4, vgpr_space_bits = 8192>>, ukernels = "none"}>) {
    hal.executable.export public @main_dispatch_0_matmul_1024x1280x1280_f32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      hal.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @main_dispatch_0_matmul_1024x1280x1280_f32() attributes {translation_info = #iree_codegen.translation_info<pipeline = LLVMGPUTileAndFuse workgroup_size = [32, 8, 1] subgroup_size = 32, {gpu_pipeline_options = #iree_gpu.pipeline_options<no_reduce_shared_memory_bank_conflicts = true, use_igemm_convolution = false>}>} {
        %cst = arith.constant 0.000000e+00 : f32
        %c0 = arith.constant 0 : index
        %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<1024x1280xf32, #hal.descriptor_type<storage_buffer>>
        %1 = amdgpu.fat_raw_buffer_cast %0 resetOffset : memref<1024x1280xf32, #hal.descriptor_type<storage_buffer>> to memref<1024x1280xf32, #amdgpu.address_space<fat_raw_buffer>>
        %2 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : memref<1280x1280xf32, #hal.descriptor_type<storage_buffer>>
        %3 = amdgpu.fat_raw_buffer_cast %2 resetOffset : memref<1280x1280xf32, #hal.descriptor_type<storage_buffer>> to memref<1280x1280xf32, #amdgpu.address_space<fat_raw_buffer>>
        %4 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) : memref<1024x1280xf32, #hal.descriptor_type<storage_buffer>>
        %5 = amdgpu.fat_raw_buffer_cast %4 resetOffset : memref<1024x1280xf32, #hal.descriptor_type<storage_buffer>> to memref<1024x1280xf32, #amdgpu.address_space<fat_raw_buffer>>
        %6 = iree_codegen.load_from_buffer %1 : memref<1024x1280xf32, #amdgpu.address_space<fat_raw_buffer>> -> tensor<1024x1280xf32>
        %7 = iree_codegen.load_from_buffer %3 : memref<1280x1280xf32, #amdgpu.address_space<fat_raw_buffer>> -> tensor<1280x1280xf32>
        %8 = tensor.empty() : tensor<1024x1280xf32>
        %9 = linalg.fill ins(%cst : f32) outs(%8 : tensor<1024x1280xf32>) -> tensor<1024x1280xf32>
        %10 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = ["parallel", "parallel", "reduction"]} ins(%6, %7 : tensor<1024x1280xf32>, tensor<1280x1280xf32>) outs(%9 : tensor<1024x1280xf32>) attrs =  {lowering_config = #iree_gpu.lowering_config<{reduction = [0, 0, 32], thread = [1, 16, 0], workgroup = [32, 128, 1]}>, root_op} {
        ^bb0(%in: f32, %in_0: f32, %out: f32):
          %11 = arith.mulf %in, %in_0 : f32
          %12 = arith.addf %out, %11 : f32
          linalg.yield %12 : f32
        } -> tensor<1024x1280xf32>
        iree_codegen.store_to_buffer %10, %5 : tensor<1024x1280xf32> into memref<1024x1280xf32, #amdgpu.address_space<fat_raw_buffer>>
        return
      }
    }
  }
}
