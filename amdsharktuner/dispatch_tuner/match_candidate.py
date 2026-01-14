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

def list_csv_names(d: Path) -> set[str]:
    return {p.name for p in d.glob("*.csv") if p.is_file()}
def load_csv(path: Path) -> pd.DataFrame:
    return pd.read_csv(path)


def main():
    for dir_list_set in dir_list_list:
        set_name, dir_list = dir_list_set
        print(f"{set_name} mismatched files:")
        for i, file in enumerate(sorted(dir_list[0].glob("*.csv")), start=1):
            name = file.name
            df1 = load_csv(file)
            df2 = load_csv(dir_list[1] / name)
            
            cols = ["gen_id"] + [c for c in df1.columns if c.startswith("knob_")]
            
            a = df1[cols].reset_index(drop=True)
            b = df2[cols].reset_index(drop=True)

            if not a.equals(b):
                print(name)
                continue
            
        print()
    
    # print("All CSVs matched across all rows for gen_id and knob_* columns (tf1 vs tf2).")

if __name__ == "__main__":
    main()