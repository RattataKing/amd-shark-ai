from pathlib import Path
import pandas as pd
import logging
import os

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
# dir_list = [dir_tf1, dir_tf2, dir_vd1, dir_vd2]

def load_csv(path: Path) -> pd.DataFrame:
    return pd.read_csv(path)

# suspicious_files = ["square_gemm_2048_2048_2048_f8E4M3FNUZ_f32_tB.csv",
# "square_gemm_4096_4096_4096_f8E4M3FNUZ_f32_tB.csv",
# "square_gemm_512_512_512_f8E4M3FNUZ_f32_tB.csv",
# "unet_gemm_1024_10240_1280_f16_f32_tB.csv",
# "unet_gemm_1024_1280_5120_f32_f32_tB.csv",

# "unet_gemm_2048_10240_1280_i8_i32_tB.csv",
# "tk_gemm_2048_10240_1280_i8_i32_tB.csv",
# "unet_gemm_2048_10240_1280_f8E4M3FNUZ_f32_tB.csv"]

def setup_logging() -> logging.Logger:
    base_dir = Path(os.path.abspath(__file__)).parent
    log_file_name = "opt_results_cmp.log"
    run_log_path = base_dir / log_file_name

    # Create file handler for logging to a file.
    # file_handler = logging.FileHandler(run_log_path, mode="w")
    file_handler = logging.FileHandler(run_log_path, mode="w")
    file_handler.setLevel(logging.DEBUG)

    # Create stream handler for logging to the console (only warnings and higher).
    console_handler = logging.StreamHandler()
    console_handler.setLevel(logging.INFO)

    # Create a formatter that dynamically adds [levelname] for ERROR and WARNING.
    class CustomFormatter(logging.Formatter):
        def format(self, record):
            if record.levelno == logging.INFO:
                return f"{record.message}"
            else:
                return f"[{record.levelname}] {record.message}"

    file_formatter = logging.Formatter("%(asctime)s - %(levelname)s - %(message)s")
    console_formatter = CustomFormatter()

    # Set formatters to handlers.
    file_handler.setFormatter(file_formatter)
    console_handler.setFormatter(console_formatter)

    # Configure the root logger.
    logging.basicConfig(
        level=logging.DEBUG,  # Set the root logger to the lowest level.
        handlers=[file_handler, console_handler],
    )

    return logging.getLogger()

skip_list = []
win_list = []
data_diff_thre = 0.05
win_thre = 0.05
def main():
    logger = setup_logging()
    tf_win = 0
    vd_win = 0
    for file in sorted(dir_tf1.glob("*.csv")):
        name = file.name
        logging.debug(name)
        compare_avf = []
        for dir_list in dir_list_list:
            pipeline, dir_list = dir_list
            avg = []
            for i, dir_name in enumerate(dir_list, start=1):
                df = load_csv(Path(dir_name) / name)
                logging.debug(f"{pipeline}_{i}: {df["benchmark_speedup"].min()}")
                avg.append(df["benchmark_speedup"].min())
                # res_list.append(df["benchmark_speedup"].min())
                if abs(max(avg) - min(avg)) > min(avg)*data_diff_thre:
                    # print(name)
                    # print(f"{max(avg)}, {min(avg)}")
                    skip_list.append(name)
                    # continue
            avg = sum(avg) / len(avg)
            compare_avf.append(avg)
        if abs(compare_avf[0] - compare_avf[1]) > min(compare_avf)*win_thre:
            if compare_avf[0] < compare_avf[1]:
                tf_win+=1
            elif compare_avf[1] < compare_avf[0]:
                vd_win+=1
            else: pass
        #     print(skip_list)
        #     if skip:
        #         print(f"drop {name}")
            if name not in skip_list:
                win_list.append(name)
            #     print(name)
    # for i in skip_list:
    #     print(i)
    # print(skip_list)
    tie = len(sorted(dir_tf1.glob("*.csv"))) - len(skip_list) - (tf_win+vd_win)
    print(f"SKIP: same pipeline data_diff > min_val * {data_diff_thre}")
    print(f"WIN: opt_diff > opt_min * {win_thre}")
    print(f"Total csv: {len(sorted(dir_tf1.glob("*.csv")))}, SKIP: {len(skip_list)}, DIFF:{tf_win+vd_win}, TIE:{tie}")
    print(f"tf vs. vd: {tf_win} : {vd_win}")
    
    
    for file in sorted(dir_tf1.glob("*.csv")):
        name = file.name
        if name not in win_list:
            continue
        logging.info(name)
        for dir_list in dir_list_list:
            pipeline, dir_list = dir_list
            for i, dir_name in enumerate(dir_list, start=1):
                df = load_csv(Path(dir_name) / name)
                logging.info(f"{pipeline}_{i}: {df["benchmark_speedup"].min()}")
        

if __name__ == "__main__":
    main()