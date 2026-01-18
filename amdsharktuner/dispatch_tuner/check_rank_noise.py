from pathlib import Path
import pandas as pd

BASE_DIR = Path(__file__).resolve().parent

TF_1 = "tuning_database_tf_1"
TF_2 = "tuning_database_tf_2"
VD_1 = "tuning_database_vd_1"
VD_2 = "tuning_database_vd_2"

dir_tf1 = BASE_DIR / TF_1
dir_tf2 = BASE_DIR / TF_2
dir_vd1 = BASE_DIR / VD_1
dir_vd2 = BASE_DIR / VD_2
    
dir_tf_list = [dir_tf1, dir_tf2]
dir_vd_list = [dir_vd1, dir_vd2]
dir_list_list = [("tf", dir_tf_list), ("vd", dir_vd_list)]

def load_csv(path: Path) -> pd.DataFrame:
    return pd.read_csv(path)


def main():
    diff = []
    # for set_name, dir_list in dir_list_list:
    for file in sorted(dir_tf1.glob("*.csv")):
        name = file.name
        df1 = load_csv(file)
        df2 = load_csv(dir_tf2 / name)

        # Index df2 by gen_id for fast lookup
        df2_by_id = df2.set_index("gen_id")

        # Only rows where benchmark_rank_order < 50
        df1_sub = df1[df1["benchmark_rank_order"] == 1]
        a = df1_sub["benchmark_speedup"]
        # print(df1_sub["benchmark_speedup"])
        
        df2_sub = df2[df2["benchmark_rank_order"] == 1]
        
        if df1_sub.empty or df2_sub.empty:
            continue
            print(file)
            assert False

        b= df2_sub["benchmark_speedup"]
        # print(df2_sub["benchmark_speedup"])
        a = df1_sub["benchmark_speedup"].iloc[0]
        b = df2_sub["benchmark_speedup"].iloc[0]
        diff.append(abs(a-b))
        if abs(a-b) > 0.05:
            print(file)
            print(abs(a-b))
        continue
        
        
        # exit()
        # df1_sub = df1[df1["benchmark_speedup"] < 10]

        rank_diff = []
        for _, row in df1_sub.iterrows():
            gen_id = row["gen_id"]
            bro1 = row["benchmark_speedup"]

            bro2 = df2_by_id.loc[gen_id, "benchmark_speedup"]

            if abs(bro1-bro2) > 10:
                print(file)
                print(abs(bro1-bro2))
            rank_diff.append(abs(bro1-bro2))
                # print(
                #     f"{name}: gen_id={gen_id} "
                #     f"benchmark_rank_order mismatch: df1={bro1} df2={bro2}"
                # )
        # exit()
    # print(sum(rank_diff) / len(rank_diff))
    print("avg")
    print(sum(diff) / len(diff))
    # print("All matched: benchmark_rank_order for rows with value < 50 (matched by gen_id).")


if __name__ == "__main__":
    main()