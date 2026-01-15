import glob
import pandas as pd

files_1 = glob.glob('./dispatch_tuner/tuning_database_clean/*.csv')
files_1 = [
    f for f in files_1
    if all(pd.read_csv(f)[col].iloc[0] > 648 for col in ["cfg.M", "cfg.N", "cfg.K"])
]
assert len(files_1) != 0

files_2 = glob.glob('./dispatch_tuner/tuning_database_vecdis/*.csv')
files_2 = [
    f for f in files_2
    if all(pd.read_csv(f)[col].iloc[0] > 648 for col in ["knob_M", "knob_N", "knob_K"])
]
assert len(files_2) != 0

assert len(files_1) == len(files_2)

print(f"Found {len(files_1)} vs. {len(files_2)} CSV files")

col_map = {
    "cfg.m": "knob_tile_m",
    "cfg.n": "knob_tile_n",
    "cfg.k": "knob_tile_k",
    "cfg.wg_x": "knob_wg_x",
    "cfg.wg_y": "knob_wg_y",
    "cfg.wg_z": "knob_wg_z",
    "cfg.sg_m_cnt": "knob_subgroup_m_cnt",
    "cfg.sg_n_cnt": "knob_subgroup_n_cnt",
    "cfg.intrinsic_mn": "knob_intrinsic_mn",
    "cfg.intrinsic_k": "knob_intrinsic_k",
}

def match_can(row1, df2, col_map):
    mask = pd.Series(True, index=df2.index)
    for c1, c2 in col_map.items():
        val = row1[c1]
        mask &= (df2[c2] == val)
    matches = mask[mask].index.tolist()

    # matches = [0] if matches==[] else matches
    return matches

def filename(f_str):
    return f_str.split('/')[-1]

for i, (f1, f2) in enumerate(zip(files_1, files_2)):
    # df1 = pd.read_csv(f1)
    # df2 = pd.read_csv(f2)
    df2 = pd.read_csv("/home/amily/shark-ai/sharktuner/dispatch_tuner/tuning_database/tuning_tk_gemm_2048_1280_1280_f8E4M3FNUZ_f32_tB_2.csv")
    df3 = pd.read_csv("/home/amily/shark-ai/sharktuner/dispatch_tuner/tuning_database/tuning_tk_gemm_2048_1280_1280_f8E4M3FNUZ_f32_tB_3.csv")
    df4 = pd.read_csv("/home/amily/shark-ai/sharktuner/dispatch_tuner/tuning_database/tuning_tk_gemm_2048_1280_1280_f8E4M3FNUZ_f32_tB_4.csv")
    # assert filename(f1) == filename(f2)

    idx2_min = df2["benchmark_speedup"].idxmin()
    row2_min = df2.loc[idx2_min]
    matches = match_can(row2_min, df3, col_map)
    df2_rank = int(df2.loc[idx2_min]["benchmark_rank_order"])
    df3_rank = int(df3.iloc[matches[0]]["benchmark_rank_order"])
    print(df2_rank, df3_rank)
    exit()

    # print(df1["benchmark_speedup"].min())
    idx1_min = df1["benchmark_speedup"].idxmin()
    row1_min = df1.loc[idx1_min]
    # print(df1.loc[idx1_min]["benchmark_speedup"])

    matches = match_can(row1_min, df2, col_map)
    # print(f1)
    # print(f2)
    # print(f"file_1 row[{idx1_min}] = file_2 row{matches}")
    assert len(matches) == 1
    df1_rank = int(df1.loc[idx1_min]["benchmark_result_order"])
    df2_rank = int(df2.iloc[matches[0]]["benchmark_rank_order"])
    # print(f"Rank in file_1 vs. file_2 = {df1_rank} vs. {df2_rank}")
    # print(df1.loc[idx1_min]["candidate_id"])
    # print(df2.iloc[matches[0]]["candidate_id"])

    # print(df1.loc[idx1_min].head(30))
    # print(df2.iloc[matches[0]])
    # exit()
    # print(df2.iloc[matches[0]]["benchmark_rank_order"])
    # print(df2.iloc[matches[0]]["benchmark_speedup"])

    matches = match_can(row1_min, df3, col_map)
    print(matches)
    df3_rank = int(df2.iloc[matches[0]]["benchmark_rank_order"]) if matches else None
    print(f"Rank in file_1 vs. file_2 vs file_3 = {df1_rank} vs. {df2_rank} vs. {df3_rank}")
    # print(df2.iloc[matches[0]]["to_benchmark"]) if matches else None
    # exit()


