hal.executable public @main_dispatch_0 {
  hal.executable.variant public @rocm_hsaco_fb target(<"rocm", "rocm-hsaco-fb", {abi = "hip", iree.encoding.resolver = #iree_gpu.gpu_encoding_resolver<>, iree_codegen.target_info = #iree_gpu.target<arch = "gfx1201", features = "", wgp = <compute =  fp64|fp32|fp16|int64|int32|int16|int8, storage =  b64|b32|b16|b8, subgroup =  shuffle|arithmetic, dot =  dp4xi8toi32, mma = [<WMMAR4_F32_16x16x16_F16>, <WMMAR4_F16_16x16x16_F16>, <WMMAR4_F32_16x16x16_BF16>, <WMMAR4_BF16_16x16x16_BF16>, <WMMAR4_F32_16x16x16_F8E5M2>, <WMMAR4_F32_16x16x16_F8E5M2_F8E4M3FN>, <WMMAR4_F32_16x16x16_F8E4M3FN>, <WMMAR4_F32_16x16x16_F8E4M3FN_F8E5M2>, <WMMAR4_I32_16x16x16_I8>], subgroup_size_choices = [32, 64], max_workgroup_sizes = [1024, 1024, 1024], max_thread_count_per_workgroup = 1024, max_workgroup_memory_bytes = 65536, max_workgroup_counts = [2147483647, 2147483647, 2147483647], max_load_instruction_bits = 128, simds_per_wgp = 4, vgpr_space_bits = 8192>>, ukernels = "none"}>) {
    hal.executable.export public @main_dispatch_0_matmul_1024x1280x1280_f32 ordinal(0) layout(#hal.pipeline.layout<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) count(%arg0: !hal.device) -> (index, index, index) {
      %x, %y, %z = iree_tensor_ext.dispatch.workgroup_count_from_slice()
      hal.return %x, %y, %z : index, index, index
    }
    builtin.module {
      func.func @main_dispatch_0_matmul_1024x1280x1280_f32() {
        %cst = arith.constant 0.000000e+00 : f32
        %c0 = arith.constant 0 : index
        %0 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(0) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1024x1280xf32>>
        %1 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(1) alignment(64) offset(%c0) flags("ReadOnly|Indirect") : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1280x1280xf32>>
        %2 = hal.interface.binding.subspan layout(<bindings = [#hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, "ReadOnly|Indirect">, #hal.pipeline.binding<storage_buffer, Indirect>], flags = Indirect>) binding(2) alignment(64) offset(%c0) flags(Indirect) : !iree_tensor_ext.dispatch.tensor<writeonly:tensor<1024x1280xf32>>
        %3 = iree_tensor_ext.dispatch.tensor.load %0, offsets = [0, 0], sizes = [1024, 1280], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1024x1280xf32>> -> tensor<1024x1280xf32>
        %4 = iree_tensor_ext.dispatch.tensor.load %1, offsets = [0, 0], sizes = [1280, 1280], strides = [1, 1] : !iree_tensor_ext.dispatch.tensor<readonly:tensor<1280x1280xf32>> -> tensor<1280x1280xf32>
        %5 = tensor.empty() : tensor<1024x1280xf32>
        %6 = linalg.fill ins(%cst : f32) outs(%5 : tensor<1024x1280xf32>) -> tensor<1024x1280xf32>
        %7 = linalg.matmul indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>] ins(%3, %4 : tensor<1024x1280xf32>, tensor<1280x1280xf32>) outs(%6 : tensor<1024x1280xf32>) -> tensor<1024x1280xf32>
        iree_tensor_ext.dispatch.tensor.store %7, %2, offsets = [0, 0], sizes = [1024, 1280], strides = [1, 1] : tensor<1024x1280xf32> -> !iree_tensor_ext.dispatch.tensor<writeonly:tensor<1024x1280xf32>>
        return
      }
    }
  }
}
