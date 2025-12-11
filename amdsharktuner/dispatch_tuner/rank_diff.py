import pandas as pd
import math

TOP_NUM = 10
# ---- Load CSVs ----
# df1 = pd.read_csv("/home/amily/amd-shark-ai/amdsharktuner/tuning_2025_12_05_20_55/tk_gemm_2048_1280_1280_f8E4M3FNUZ_f32_tB_candidate_analysis_gpu2567_rep20.csv")
# df2 = pd.read_csv("/home/amily/amd-shark-ai/amdsharktuner/tuning_2025_12_08_07_42/tk_gemm_2048_1280_1280_f8E4M3FNUZ_f32_tB_candidate_analysis_gpu2567_rep20.csv")
# df1 = pd.read_csv("/home/amily/amd-shark-ai/amdsharktuner/tuning_2025_12_test/reserve_mi300x_2_rep20.csv")
# df2 = pd.read_csv("/home/amily/amd-shark-ai/amdsharktuner/tuning_2025_12_test/reserve_mi300x_3_rep20.csv")
# df1 = pd.read_csv("/home/amily/amd-shark-ai/amdsharktuner/tuning_2025_12_08_21_20/tk_gemm_2048_1280_1280_f8E4M3FNUZ_f32_tB_candidate_analysis_gpu2567_rep1.csv")
# df1 = pd.read_csv("/home/amily/amd-shark-ai/amdsharktuner/tuning_2025_12_08_21_20/tk_gemm_2048_1280_1280_f8E4M3FNUZ_f32_tB_candidate_analysis_gpu2567_rep1.csv")
# df2 = pd.read_csv("/home/amily/amd-shark-ai/amdsharktuner/tuning_2025_12_09_21_00/tk_gemm_2048_1280_1280_f8E4M3FNUZ_f32_tB_candidate_analysis_gpu2567_rep1.csv")
# df2 = pd.read_csv("/home/amily/amd-shark-ai/amdsharktuner/tuning_2025_12_09_01_46/tk_gemm_2048_1280_1280_f8E4M3FNUZ_f32_tB_candidate_analysis_gpu2567_rep5.csv")
# df2 = pd.read_csv("/home/amily/amd-shark-ai/amdsharktuner/tuning_2025_12_09_05_52/tk_gemm_2048_1280_1280_f8E4M3FNUZ_f32_tB_candidate_analysis_gpu2567_rep5.csv")
# df2 = pd.read_csv("/home/amily/amd-shark-ai/amdsharktuner/tuning_2025_12_09_21_13/tk_gemm_2048_1280_1280_f8E4M3FNUZ_f32_tB_candidate_analysis_gpu2567_rep3.csv")
# ---- Ensure candidate_id exists ----
if "candidate_id" not in df1.columns or "candidate_id" not in df2.columns:
    raise ValueError("Both CSVs must contain column 'candidate_id'")

# ---- Identify knob_* columns ----
knob_cols_1 = [c for c in df1.columns if c.startswith("knob_")]
knob_cols_2 = [c for c in df2.columns if c.startswith("knob_")]

# Only compare knobs that exist in BOTH files
common_knob_cols = list(set(knob_cols_1).intersection(knob_cols_2))
assert knob_cols_1 == knob_cols_2

# ---- Merge the two CSVs on candidate_id ----
merged = df1.merge(df2, on="candidate_id", suffixes=("_1", "_2"))

# ---- Check for mismatched knob values ----
mismatch_records = []

for knob in common_knob_cols:
    mismatch_mask = merged[f"{knob}_1"] != merged[f"{knob}_2"]
    if mismatch_mask.any():
        # Collect mismatch details
        mismatches = merged.loc[mismatch_mask, ["candidate_id", f"{knob}_1", f"{knob}_2"]]
        mismatch_records.append((knob, mismatches))

# ---- If any mismatch found, raise error ----
if mismatch_records:
    msg_lines = ["Knob value mismatches detected:"]
    for knob, mismatches in mismatch_records:
        msg_lines.append(f"\nMismatch in {knob}:")
        msg_lines.append(mismatches.to_string(index=False))

    raise ValueError("\n".join(msg_lines))

# ---- Compute absolute benchmark differences ----
if "benchmark_speedup" in df1.columns and "benchmark_speedup" in df2.columns:
    merged["benchmark_speedup_diff"] = (
        (merged["benchmark_speedup_1"] - merged["benchmark_speedup_2"]).abs()
    )

if "benchmark_rank_order" in df1.columns and "benchmark_rank_order" in df2.columns:
    merged["benchmark_rank_order_diff"] = (
        (merged["benchmark_rank_order_1"] - merged["benchmark_rank_order_2"]).abs()
    )

# ---- Output result ----
print("\n=== Comparison Result ===")
print(merged)

# Optionally save output
# merged.to_csv("comparison_output.csv", index=False)
print("comparison_output.csv")


# --- Top 30 in df1 ---
top30_df1 = df1.nsmallest(TOP_NUM, "benchmark_rank_order")

# keep only candidates that appear in df2
top30_df1_common = top30_df1.merge(
    df2[["candidate_id", "benchmark_rank_order"]],
    on="candidate_id",
    suffixes=("_1", "_2")
)

# compute absolute diff
top30_df1_common["rank_diff"] = (
    (top30_df1_common["benchmark_rank_order_1"]
     - top30_df1_common["benchmark_rank_order_2"]).abs()
)

avg_diff_df1 = top30_df1_common["rank_diff"].mean()


# --- Top 30 in df2 ---
top30_df2 = df2.nsmallest(TOP_NUM, "benchmark_rank_order")

# keep only candidates that appear in df1
top30_df2_common = top30_df2.merge(
    df1[["candidate_id", "benchmark_rank_order"]],
    on="candidate_id",
    suffixes=("_2", "_1")
)

# compute absolute diff
top30_df2_common["rank_diff"] = (
    (top30_df2_common["benchmark_rank_order_2"]
     - top30_df2_common["benchmark_rank_order_1"]).abs()
)

avg_diff_df2 = top30_df2_common["rank_diff"].mean()


# --- Print results ---
print(f"Average rank diff for df1's top-{TOP_NUM} candidates:", avg_diff_df1)
print(f"Average rank diff for df2's top-{TOP_NUM} candidates:", avg_diff_df2)