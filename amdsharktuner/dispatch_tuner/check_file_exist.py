from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent

TF_1 = "tuning_database_tf_1"
TF_2 = "tuning_database_tf_2"
VD_1 = "tuning_database_vd_1"
VD_2 = "tuning_database_vd_2"


def main():
    dir_tf1 = BASE_DIR / TF_1
    dir_tf2 = BASE_DIR / TF_2
    dir_vd1 = BASE_DIR / VD_1
    dir_vd2 = BASE_DIR / VD_2
    
    dir_list = [dir_tf1, dir_tf2, dir_vd1, dir_vd2]
    
    for dir_example in dir_list:
        for file in dir_example.iterdir():
            if not file.is_file():
                assert False
            name = file.name
            for other_dir in dir_list:
                if other_dir == dir_example:
                    continue
                if not (dir_tf2 / name).exists():
                    raise AssertionError(f"{other_dir.name} missing {dir_example.name}'s{name}")

    print("Files are matched across dirs")
if __name__ == "__main__":
    main()
