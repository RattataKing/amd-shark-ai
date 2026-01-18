from pathlib import Path
import pandas as pd
import logging
import os
import random

BASE_DIR = Path(__file__).resolve().parent

bench_dir = BASE_DIR / "dump"

random.seed(42)


all_ben_list = [f.name for f in sorted(bench_dir.glob("*.mlir"))]

random.shuffle(all_ben_list)

for i in sorted(all_ben_list[:32]):
    print(i)
# print(len(all_ben_list))
# for i in all_ben_list:
#     print(i)