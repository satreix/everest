#!/usr/bin/env python3

import argparse
import os
import stat
import subprocess
import sys


def main():
    p = argparse.ArgumentParser()
    p.add_argument('day', type=int)
    args = p.parse_args()

    day_dir = os.path.join("src/python/aoc/2022", f"{str(args.day).zfill(2)}")
    solution_file = os.path.join(day_dir, "solution.py")

    if not os.path.exists(day_dir):
        os.mkdir(day_dir)
        with open(solution_file, 'w') as f:
            print("#!/usr/bin/env python3", file=f)
            print("", file=f)
            print("\"\"\"", file=f)
            print(f"https://adventofcode.com/2022/day/{args.day}", file=f)
            print("\"\"\"", file=f)
            print("", file=f)
            print("""import os


def data_path(filename: str) -> str:
    return os.path.join(os.path.dirname(os.path.realpath(__file__)), filename)


with open(data_path("input.txt")) as f:
    data = f.read().strip()


print("--- first part ---")
print("--- second part ---")
""", file=f)
        st = os.stat(solution_file)
        os.chmod(solution_file, st.st_mode | stat.S_IEXEC)

    subprocess.check_call(["black", solution_file])
    subprocess.run(
        [solution_file],
        stdout=sys.stdout,
        stderr=sys.stderr,
    )


if __name__ == "__main__":
    main()
