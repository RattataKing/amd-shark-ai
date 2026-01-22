from pathlib import Path
import pandas as pd
import logging
import os


base_path = Path(__file__).resolve().parent

csv_dir_name_list = [
    ["gfx1201_tuning_database_vd_1/", 
    "gfx1201_tuning_database_tf_1/"],
    ["gfx942_tuning_database_vd_1/", 
    "gfx942_tuning_database_tf_1/"],
    ["gfx950_tuning_database_vd_1/", 
    "gfx950_tuning_database_tf_1/",
    ]
]
win_thre = 0.05

for csv_dir_list in csv_dir_name_list:
    for csv_dir_name in csv_dir_list:
        if "_vd_" in csv_dir_name:
            vd_dir = base_path / csv_dir_name
        elif "_tf_" in csv_dir_name:
            tf_dir = base_path / csv_dir_name
        else:
            assert False
    tf_win = 0
    vd_win = 0
    tie = 0
    for file in sorted(vd_dir.glob("*.csv")):
        name = file.name
        vd_df = pd.read_csv(file)
        tf_df = pd.read_csv((Path(tf_dir) / name))
        vd_opt = vd_df["benchmark_speedup"].min()
        tf_opt = tf_df["benchmark_speedup"].min()
        if abs(vd_opt-tf_opt) > max([vd_opt,tf_opt])*win_thre:
            if tf_opt < vd_opt:
                tf_win += 1
            else:
                vd_win += 1
        else:
            tie += 1

    print(f"{csv_dir_name.split('_')[0]}")
    tie = len(sorted(vd_dir.glob("*.csv"))) - (tf_win+vd_win)
    print(f"WIN: opt_diff > slower_opt * {win_thre}")
    print(f"Total csv: {len(sorted(vd_dir.glob('*.csv')))}, DIFF:{tf_win+vd_win}, TIE:{tie}")
    print(f"tf vs. vd: {tf_win} : {vd_win}")