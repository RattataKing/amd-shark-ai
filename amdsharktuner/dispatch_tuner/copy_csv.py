import shutil
from pathlib import Path

PREFIX_TUNING_DIR = "tuning_2026"
PREFIX_LOG = "autotune"
MARKER = "codegen_pipeline"
VD_TOKEN = "llvmgpu_vector_distribute"

MAX_LOG_LINES = 30

DEST_TF = "tuning_database_tf"
DEST_VD = "tuning_database_vd"

def first_n_lines(path: Path, n: int) -> list[str]:
    try:
        with path.open("r", encoding="utf-8", errors="replace") as f:
            return [next(f, "") for _ in range(n)]
    except OSError:
        return []


def main():
    base_dir = Path(__file__).resolve().parent
    parent_dir = base_dir.parent

    dst_tf = base_dir / DEST_TF
    dst_vd = base_dir / DEST_VD
    dst_tf.mkdir(parents=True, exist_ok=True)
    dst_vd.mkdir(parents=True, exist_ok=True)

    for tdir in sorted(parent_dir.glob(f"{PREFIX_TUNING_DIR}*")):
        if not tdir.is_dir():
            assert False
            continue

        logs = sorted(tdir.glob(f"{PREFIX_LOG}*"))
        if not logs:
            assert False
            continue

        lines = first_n_lines(logs[0], MAX_LOG_LINES)
        pipeline_line = next((ln for ln in lines if MARKER in ln), "")

        if not pipeline_line:
            continue

        dst = dst_vd if VD_TOKEN in pipeline_line else dst_tf

        for csv in sorted(tdir.glob("*.csv")):
            shutil.copy2(csv, dst / csv.name)


if __name__ == "__main__":
    main()



