from pathlib import Path
import os
import random


failed_mlir = [
    "compute_gemm_4096_4096_8192_f32_f32_tB_benchmark.mlir",
    "compute_gemm_4096_4096_8192_i32_i32_tB_benchmark.mlir",

    "square_gemm_1024_1024_1024_f32_f32_tB_benchmark.mlir",
    "square_gemm_1024_1024_1024_i32_i32_tB_benchmark.mlir",
    "square_gemm_128_128_128_f32_f32_tB_benchmark.mlir",
    "square_gemm_128_128_128_i32_i32_tB_benchmark.mlir",
    "square_gemm_2048_2048_2048_f32_f32_tB_benchmark.mlir",
    "square_gemm_2048_2048_2048_i32_i32_tB_benchmark.mlir",
    "square_gemm_256_256_256_f32_f32_tB_benchmark.mlir",
    "square_gemm_256_256_256_i32_i32_tB_benchmark.mlir",
    "square_gemm_4096_4096_4096_f32_f32_tB_benchmark.mlir",
    "square_gemm_4096_4096_4096_i32_i32_tB_benchmark.mlir",
    "square_gemm_512_512_512_f32_f32_tB_benchmark.mlir",
    "square_gemm_512_512_512_i32_i32_tB_benchmark.mlir",
    "square_gemm_8192_8192_8192_f32_f32_tB_benchmark.mlir",
    "square_gemm_8192_8192_8192_i32_i32_tB_benchmark.mlir",

    "tk_gemm_128_1280_2048_f32_f32_tB_benchmark.mlir",
    "tk_gemm_128_1280_2048_i32_i32_tB_benchmark.mlir",
    "tk_gemm_2048_10240_1280_f32_f32_tB_benchmark.mlir",
    "tk_gemm_2048_10240_1280_i32_i32_tB_benchmark.mlir",
    "tk_gemm_2048_1280_1280_f32_f32_tB_benchmark.mlir",
    "tk_gemm_2048_1280_1280_i32_i32_tB_benchmark.mlir",
    "tk_gemm_2048_1280_5120_f32_f32_tB_benchmark.mlir",
    "tk_gemm_2048_1280_5120_i32_i32_tB_benchmark.mlir",
    "tk_gemm_8192_5120_640_f32_f32_tB_benchmark.mlir",
    "tk_gemm_8192_5120_640_i32_i32_tB_benchmark.mlir",

    "unet_gemm_1024_10240_1280_f32_f32_tB_benchmark.mlir",
    "unet_gemm_1024_10240_1280_i32_i32_tB_benchmark.mlir",
    "unet_gemm_1024_1280_1280_f32_f32_tB_benchmark.mlir",
    "unet_gemm_1024_1280_1280_i32_i32_tB_benchmark.mlir",
    "unet_gemm_1024_1280_5120_f32_f32_tB_benchmark.mlir",
    "unet_gemm_1024_1280_5120_i32_i32_tB_benchmark.mlir",
    "unet_gemm_128_1280_2048_f32_f32_tB_benchmark.mlir",
    "unet_gemm_128_1280_2048_i32_i32_tB_benchmark.mlir",
    "unet_gemm_2048_10240_1280_f32_f32_tB_benchmark.mlir",
    "unet_gemm_2048_10240_1280_i32_i32_tB_benchmark.mlir",
    "unet_gemm_2048_1280_1280_f32_f32_tB_benchmark.mlir",
    "unet_gemm_2048_1280_1280_i32_i32_tB_benchmark.mlir",
    "unet_gemm_2048_1280_5120_f32_f32_tB_benchmark.mlir",
    "unet_gemm_2048_1280_5120_i32_i32_tB_benchmark.mlir",
    "unet_gemm_4096_5120_640_f32_f32_tB_benchmark.mlir",
    "unet_gemm_4096_5120_640_i32_i32_tB_benchmark.mlir",
    "unet_gemm_4096_640_2560_f32_f32_tB_benchmark.mlir",
    "unet_gemm_4096_640_2560_i32_i32_tB_benchmark.mlir",
    "unet_gemm_4096_640_640_f32_f32_tB_benchmark.mlir",
    "unet_gemm_4096_640_640_i32_i32_tB_benchmark.mlir",
    "unet_gemm_64_1280_2048_f32_f32_tB_benchmark.mlir",
    "unet_gemm_64_1280_2048_i32_i32_tB_benchmark.mlir",
    "unet_gemm_64_640_2048_f32_f32_tB_benchmark.mlir",
    "unet_gemm_64_640_2048_i32_i32_tB_benchmark.mlir",
    "unet_gemm_8192_5120_640_f32_f32_tB_benchmark.mlir",
    "unet_gemm_8192_5120_640_i32_i32_tB_benchmark.mlir",
    "unet_gemm_8192_640_2560_f32_f32_tB_benchmark.mlir",
    "unet_gemm_8192_640_2560_i32_i32_tB_benchmark.mlir",
    "unet_gemm_8192_640_640_f32_f32_tB_benchmark.mlir",
    "unet_gemm_8192_640_640_i32_i32_tB_benchmark.mlir",
]

todo_list = [
    # CDNA3 fp8 type = f8E4M3FNUZ
    # UDNA4 fp8 type = f8E4M3FN
    "compute_gemm_4096_4096_8192_f32_f32_tB_benchmark.mlir",
    "square_gemm_1024_1024_1024_i8_i32_tB_benchmark.mlir",
    "square_gemm_2048_2048_2048_f32_f32_tB_benchmark.mlir",
    "square_gemm_2048_2048_2048_i32_i32_tB_benchmark.mlir",
    "square_gemm_256_256_256_f32_f32_tB_benchmark.mlir",
    "square_gemm_512_512_512_f16_f32_tB_benchmark.mlir",
    "square_gemm_512_512_512_f32_f32_tB_benchmark.mlir",
    "square_gemm_512_512_512_f8E4M3FN_f32_tB_benchmark.mlir",
    "square_gemm_8192_8192_8192_f32_f32_tB_benchmark.mlir",
    "square_gemm_8192_8192_8192_i8_i32_tB_benchmark.mlir",
    "tk_gemm_2048_10240_1280_i8_i32_tB_benchmark.mlir",
    "tk_gemm_2048_1280_1280_f16_f32_tB_benchmark.mlir",
    "tk_gemm_2048_1280_1280_f8E4M3FN_f32_tB_benchmark.mlir",
    "tk_gemm_8192_5120_640_i32_i32_tB_benchmark.mlir",
    "unet_gemm_1024_10240_1280_f16_f32_tB_benchmark.mlir",
    "unet_gemm_1024_1280_5120_f32_f32_tB_benchmark.mlir",
    "unet_gemm_128_1280_2048_i8_i32_tB_benchmark.mlir",
    "unet_gemm_2048_10240_1280_i32_i32_tB_benchmark.mlir",
    "unet_gemm_2048_1280_1280_f8E4M3FN_f32_tB_benchmark.mlir",
    "unet_gemm_4096_5120_640_f16_f32_tB_benchmark.mlir",
    "unet_gemm_4096_5120_640_f32_f32_tB_benchmark.mlir",
    "unet_gemm_4096_5120_640_f8E4M3FN_f32_tB_benchmark.mlir",
    "unet_gemm_4096_640_640_f16_f32_tB_benchmark.mlir",
    "unet_gemm_64_1280_2048_f16_f32_tB_benchmark.mlir",
    "unet_gemm_64_640_2048_f16_f32_tB_benchmark.mlir",
    "unet_gemm_64_640_2048_f8E4M3FN_f32_tB_benchmark.mlir",
    "unet_gemm_8192_5120_640_f16_f32_tB_benchmark.mlir",
    "unet_gemm_8192_5120_640_f8E4M3FN_f32_tB_benchmark.mlir",
    "unet_gemm_8192_5120_640_i32_i32_tB_benchmark.mlir",
    "unet_gemm_8192_5120_640_i8_i32_tB_benchmark.mlir",
    "unet_gemm_8192_640_2560_f8E4M3FN_f32_tB_benchmark.mlir",
    "unet_gemm_8192_640_640_i32_i32_tB_benchmark.mlir",
]


success_mlir = [
    "compute_gemm_4096_4096_8192_f16_f32_tB_benchmark.mlir",
    "compute_gemm_4096_4096_8192_f8E4M3FN_f32_tB_benchmark.mlir",
    "compute_gemm_4096_4096_8192_i8_i32_tB_benchmark.mlir",

    "square_gemm_1024_1024_1024_f16_f32_tB_benchmark.mlir",
    "square_gemm_1024_1024_1024_f8E4M3FN_f32_tB_benchmark.mlir",
    "square_gemm_1024_1024_1024_i8_i32_tB_benchmark.mlir",

    "square_gemm_128_128_128_f16_f32_tB_benchmark.mlir",
    "square_gemm_128_128_128_f8E4M3FN_f32_tB_benchmark.mlir",
    "square_gemm_128_128_128_i8_i32_tB_benchmark.mlir",

    "square_gemm_2048_2048_2048_f16_f32_tB_benchmark.mlir",
    "square_gemm_2048_2048_2048_f8E4M3FN_f32_tB_benchmark.mlir",
    "square_gemm_2048_2048_2048_i8_i32_tB_benchmark.mlir",

    "square_gemm_256_256_256_f16_f32_tB_benchmark.mlir",
    "square_gemm_256_256_256_f8E4M3FN_f32_tB_benchmark.mlir",
    "square_gemm_256_256_256_i8_i32_tB_benchmark.mlir",

    "square_gemm_4096_4096_4096_f16_f32_tB_benchmark.mlir",
    "square_gemm_4096_4096_4096_f8E4M3FN_f32_tB_benchmark.mlir",
    "square_gemm_4096_4096_4096_i8_i32_tB_benchmark.mlir",

    "square_gemm_512_512_512_f16_f32_tB_benchmark.mlir",
    "square_gemm_512_512_512_f8E4M3FN_f32_tB_benchmark.mlir",
    "square_gemm_512_512_512_i8_i32_tB_benchmark.mlir",

    "square_gemm_8192_8192_8192_f16_f32_tB_benchmark.mlir",
    "square_gemm_8192_8192_8192_f8E4M3FN_f32_tB_benchmark.mlir",
    "square_gemm_8192_8192_8192_i8_i32_tB_benchmark.mlir",

    "tk_gemm_128_1280_2048_f16_f32_tB_benchmark.mlir",
    "tk_gemm_128_1280_2048_f8E4M3FN_f32_tB_benchmark.mlir",
    "tk_gemm_128_1280_2048_i8_i32_tB_benchmark.mlir",

    "tk_gemm_2048_10240_1280_f16_f32_tB_benchmark.mlir",
    "tk_gemm_2048_10240_1280_f8E4M3FN_f32_tB_benchmark.mlir",
    "tk_gemm_2048_10240_1280_i8_i32_tB_benchmark.mlir",

    "tk_gemm_2048_1280_1280_f16_f32_tB_benchmark.mlir",
    "tk_gemm_2048_1280_1280_f8E4M3FN_f32_tB_benchmark.mlir",
    "tk_gemm_2048_1280_1280_i8_i32_tB_benchmark.mlir",

    "tk_gemm_2048_1280_5120_f16_f32_tB_benchmark.mlir",
    "tk_gemm_2048_1280_5120_f8E4M3FN_f32_tB_benchmark.mlir",
    "tk_gemm_2048_1280_5120_i8_i32_tB_benchmark.mlir",

    "tk_gemm_8192_5120_640_f16_f32_tB_benchmark.mlir",
    "tk_gemm_8192_5120_640_f8E4M3FN_f32_tB_benchmark.mlir",
    "tk_gemm_8192_5120_640_i8_i32_tB_benchmark.mlir",

    "unet_gemm_1024_10240_1280_f16_f32_tB_benchmark.mlir",
    "unet_gemm_1024_10240_1280_f8E4M3FN_f32_tB_benchmark.mlir",
    "unet_gemm_1024_10240_1280_i8_i32_tB_benchmark.mlir",

    "unet_gemm_1024_1280_1280_f16_f32_tB_benchmark.mlir",
    "unet_gemm_1024_1280_1280_f8E4M3FN_f32_tB_benchmark.mlir",
    "unet_gemm_1024_1280_1280_i8_i32_tB_benchmark.mlir",

    "unet_gemm_1024_1280_5120_f16_f32_tB_benchmark.mlir",
    "unet_gemm_1024_1280_5120_f8E4M3FN_f32_tB_benchmark.mlir",
    "unet_gemm_1024_1280_5120_i8_i32_tB_benchmark.mlir",

    "unet_gemm_128_1280_2048_f16_f32_tB_benchmark.mlir",
    "unet_gemm_128_1280_2048_f8E4M3FN_f32_tB_benchmark.mlir",
    "unet_gemm_128_1280_2048_i8_i32_tB_benchmark.mlir",

    "unet_gemm_2048_10240_1280_f16_f32_tB_benchmark.mlir",
    "unet_gemm_2048_10240_1280_f8E4M3FN_f32_tB_benchmark.mlir",
    "unet_gemm_2048_10240_1280_i8_i32_tB_benchmark.mlir",

    "unet_gemm_2048_1280_1280_f16_f32_tB_benchmark.mlir",
    "unet_gemm_2048_1280_1280_f8E4M3FN_f32_tB_benchmark.mlir",
    "unet_gemm_2048_1280_1280_i8_i32_tB_benchmark.mlir",

    "unet_gemm_2048_1280_5120_f16_f32_tB_benchmark.mlir",
    "unet_gemm_2048_1280_5120_f8E4M3FN_f32_tB_benchmark.mlir",
    "unet_gemm_2048_1280_5120_i8_i32_tB_benchmark.mlir",

    "unet_gemm_4096_5120_640_f16_f32_tB_benchmark.mlir",
    "unet_gemm_4096_5120_640_f8E4M3FN_f32_tB_benchmark.mlir",
    "unet_gemm_4096_5120_640_i8_i32_tB_benchmark.mlir",

    "unet_gemm_4096_640_2560_f16_f32_tB_benchmark.mlir",
    "unet_gemm_4096_640_2560_f8E4M3FN_f32_tB_benchmark.mlir",
    "unet_gemm_4096_640_2560_i8_i32_tB_benchmark.mlir",

    "unet_gemm_4096_640_640_f16_f32_tB_benchmark.mlir",
    "unet_gemm_4096_640_640_f8E4M3FN_f32_tB_benchmark.mlir",
    "unet_gemm_4096_640_640_i8_i32_tB_benchmark.mlir",

    "unet_gemm_64_1280_2048_f16_f32_tB_benchmark.mlir",
    "unet_gemm_64_1280_2048_f8E4M3FN_f32_tB_benchmark.mlir",
    "unet_gemm_64_1280_2048_i8_i32_tB_benchmark.mlir",

    "unet_gemm_64_640_2048_f16_f32_tB_benchmark.mlir",
    "unet_gemm_64_640_2048_f8E4M3FN_f32_tB_benchmark.mlir",
    "unet_gemm_64_640_2048_i8_i32_tB_benchmark.mlir",

    "unet_gemm_8192_5120_640_f16_f32_tB_benchmark.mlir",
    "unet_gemm_8192_5120_640_f8E4M3FN_f32_tB_benchmark.mlir",
    "unet_gemm_8192_5120_640_i8_i32_tB_benchmark.mlir",

    "unet_gemm_8192_640_2560_f16_f32_tB_benchmark.mlir",
    "unet_gemm_8192_640_2560_f8E4M3FN_f32_tB_benchmark.mlir",
    "unet_gemm_8192_640_2560_i8_i32_tB_benchmark.mlir",

    "unet_gemm_8192_640_640_f16_f32_tB_benchmark.mlir",
    "unet_gemm_8192_640_640_f8E4M3FN_f32_tB_benchmark.mlir",
    "unet_gemm_8192_640_640_i8_i32_tB_benchmark.mlir",
]

fail_mlir = [
    "compute_gemm_4096_4096_8192_f32_f32_tB_benchmark.mlir",
    "compute_gemm_4096_4096_8192_i32_i32_tB_benchmark.mlir",

    "square_gemm_1024_1024_1024_f32_f32_tB_benchmark.mlir",
    "square_gemm_1024_1024_1024_i32_i32_tB_benchmark.mlir",
    "square_gemm_128_128_128_f32_f32_tB_benchmark.mlir",
    "square_gemm_128_128_128_i32_i32_tB_benchmark.mlir",
    "square_gemm_2048_2048_2048_f32_f32_tB_benchmark.mlir",
    "square_gemm_2048_2048_2048_i32_i32_tB_benchmark.mlir",
    "square_gemm_256_256_256_f32_f32_tB_benchmark.mlir",
    "square_gemm_256_256_256_i32_i32_tB_benchmark.mlir",
    "square_gemm_4096_4096_4096_f32_f32_tB_benchmark.mlir",
    "square_gemm_4096_4096_4096_i32_i32_tB_benchmark.mlir",
    "square_gemm_512_512_512_f32_f32_tB_benchmark.mlir",
    "square_gemm_512_512_512_i32_i32_tB_benchmark.mlir",
    "square_gemm_8192_8192_8192_f32_f32_tB_benchmark.mlir",
    "square_gemm_8192_8192_8192_i32_i32_tB_benchmark.mlir",

    "tk_gemm_128_1280_2048_f32_f32_tB_benchmark.mlir",
    "tk_gemm_128_1280_2048_i32_i32_tB_benchmark.mlir",
    "tk_gemm_2048_10240_1280_f32_f32_tB_benchmark.mlir",
    "tk_gemm_2048_10240_1280_i32_i32_tB_benchmark.mlir",
    "tk_gemm_2048_1280_1280_f32_f32_tB_benchmark.mlir",
    "tk_gemm_2048_1280_1280_i32_i32_tB_benchmark.mlir",
    "tk_gemm_2048_1280_5120_f32_f32_tB_benchmark.mlir",
    "tk_gemm_2048_1280_5120_i32_i32_tB_benchmark.mlir",
    "tk_gemm_8192_5120_640_f32_f32_tB_benchmark.mlir",
    "tk_gemm_8192_5120_640_i32_i32_tB_benchmark.mlir",

    "unet_gemm_1024_10240_1280_f32_f32_tB_benchmark.mlir",
    "unet_gemm_1024_10240_1280_i32_i32_tB_benchmark.mlir",
    "unet_gemm_1024_1280_1280_f32_f32_tB_benchmark.mlir",
    "unet_gemm_1024_1280_1280_i32_i32_tB_benchmark.mlir",
    "unet_gemm_1024_1280_5120_f32_f32_tB_benchmark.mlir",
    "unet_gemm_1024_1280_5120_i32_i32_tB_benchmark.mlir",
    "unet_gemm_128_1280_2048_f32_f32_tB_benchmark.mlir",
    "unet_gemm_128_1280_2048_i32_i32_tB_benchmark.mlir",
    "unet_gemm_2048_10240_1280_f32_f32_tB_benchmark.mlir",
    "unet_gemm_2048_10240_1280_i32_i32_tB_benchmark.mlir",
    "unet_gemm_2048_1280_1280_f32_f32_tB_benchmark.mlir",
    "unet_gemm_2048_1280_1280_i32_i32_tB_benchmark.mlir",
    "unet_gemm_2048_1280_5120_f32_f32_tB_benchmark.mlir",
    "unet_gemm_2048_1280_5120_i32_i32_tB_benchmark.mlir",
    "unet_gemm_4096_5120_640_f32_f32_tB_benchmark.mlir",
    "unet_gemm_4096_5120_640_i32_i32_tB_benchmark.mlir",
    "unet_gemm_4096_640_2560_f32_f32_tB_benchmark.mlir",
    "unet_gemm_4096_640_2560_i32_i32_tB_benchmark.mlir",
    "unet_gemm_4096_640_640_f32_f32_tB_benchmark.mlir",
    "unet_gemm_4096_640_640_i32_i32_tB_benchmark.mlir",
    "unet_gemm_64_1280_2048_f32_f32_tB_benchmark.mlir",
    "unet_gemm_64_1280_2048_i32_i32_tB_benchmark.mlir",
    "unet_gemm_64_640_2048_f32_f32_tB_benchmark.mlir",
    "unet_gemm_64_640_2048_i32_i32_tB_benchmark.mlir",
    "unet_gemm_8192_5120_640_f32_f32_tB_benchmark.mlir",
    "unet_gemm_8192_5120_640_i32_i32_tB_benchmark.mlir",
    "unet_gemm_8192_640_2560_f32_f32_tB_benchmark.mlir",
    "unet_gemm_8192_640_2560_i32_i32_tB_benchmark.mlir",
    "unet_gemm_8192_640_640_f32_f32_tB_benchmark.mlir",
    "unet_gemm_8192_640_640_i32_i32_tB_benchmark.mlir",
]


def print_list(input_list, size=None):
    if not size:
        size = len(input_list)
    print("[")
    for i in sorted(input_list[:size]):
        print(f'"{i}",')
    print("]")


random.seed(42)
base_path = Path(os.path.dirname(os.path.abspath(__file__)))
mlir_benchmark_folder_path = (base_path / "bench_dump").expanduser().resolve()
mlir_benchmark_files = sorted(mlir_benchmark_folder_path.glob("*.mlir"))
mlir_benchmark_filenames = [f.name for f in mlir_benchmark_files]
mlir_benchmark_filenames = [i for i in mlir_benchmark_filenames if i not in fail_mlir]
todo_list = [i for i in todo_list if i not in failed_mlir]

random.shuffle(mlir_benchmark_filenames)

# print(len(mlir_benchmark_filenames))
# print(len(todo_list))
# for i in sorted(mlir_benchmark_filenames):
#     print(i)

    
import pandas as pd

df_origin = pd.read_csv(base_path / "check_fail_mlir_record.csv")
df = df_origin.copy()
df["mlir"] = df["mlir"].str.replace(r"_f8[^_]*_", "_f8_", regex=True)

df_gfx942 = df[df["sku"] == "gfx942"]
df_gfx1201 = df[df["sku"] == "gfx1201"]
df_gfx950 = df[df["sku"] == "gfx950"]

df_list = [df_gfx942, df_gfx1201, df_gfx950]

gfx942_total_list = df_gfx942["mlir"].tolist()
gfx1201_total_list = df_gfx1201["mlir"].tolist()
gfx950_total_list = df_gfx950["mlir"].tolist()
has_duplicates = len(gfx942_total_list) != len(set(gfx942_total_list))
assert has_duplicates==False
has_duplicates = len(gfx1201_total_list) != len(set(gfx1201_total_list))
assert has_duplicates==False
has_duplicates = len(gfx950_total_list) != len(set(gfx950_total_list))
assert has_duplicates==False

gfx942_success = df_gfx942[df_gfx942["success"] == True]["mlir"].tolist()
gfx1201_success = df_gfx1201[df_gfx1201["success"] == True]["mlir"].tolist()
gfx950_success = df_gfx950[df_gfx950["success"] == True]["mlir"].tolist()

print(len(gfx942_success), len(gfx1201_success), len(gfx950_success))


# df_success = df[df["success"] == True]["mlir"].drop_duplicates().tolist()
success_all_sku_mlir = (
    df
    .groupby("mlir")["success"]
    .all()
    .loc[lambda s: s]   # keep only True
    .index
    .tolist()
)
print(len(success_all_sku_mlir))

for i in gfx1201_success:
    if i not in gfx942_success:
        print(i)


random.shuffle(success_all_sku_mlir)
random.shuffle(gfx942_success)
random.shuffle(gfx1201_success)
random.shuffle(gfx950_success)

j = 0
rdna_list = []
for i in sorted(gfx942_success[:32]):
    if "_f32_f32_" in i:
        j += 1
    else:
        rdna_list.append(i)


gfx1201_success_rest = [i for i in gfx1201_success if i not in rdna_list]
random.shuffle(gfx1201_success_rest)
print_list(gfx1201_success_rest, 32-len(rdna_list))
rdna4_list_final = rdna_list + gfx1201_success_rest[:32-len(rdna_list)]
print_list(rdna4_list_final)
exit()



print("GFX942 complains:")
j=0
for i in sorted(gfx942_success[:32]):
    if i not in success_all_sku_mlir[:32]:
        print(i)
        j+=1
print(j)
j=0
print("GFX1201 complains:")
for i in sorted(gfx1201_success[:32]):
    if i not in success_all_sku_mlir[:32]:
        print(i)
        j+=1
print(j)
j=0
print("GFX950 complains:")
for i in sorted(gfx950_success[:32]):
    if i not in success_all_sku_mlir[:32]:
        print(i)
        j+=1
print(j)
j=0
# gfx942_total_list = df_gfx942["mlir"].tolist()
# old_count = len(gfx942_total_list)
# gfx942_total_list = df_gfx942["mlir"].drop_duplicates().tolist()
# print(old_count)
# print(len(gfx942_total_list))
