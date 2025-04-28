#!/usr/bin/env python3

import argparse
import os
import re
import sys


def extract_srcs_from_build(build_file_path, target_name):
    with open(build_file_path) as f:
        build_file_content = f.read()

    # Find the `go_library` call with name = target_name
    pattern = re.compile(
        rf"go_library\(\s*name\s*=\s*\"{re.escape(target_name)}\".*?\)", re.DOTALL
    )
    match = pattern.search(build_file_content)
    if not match:
        raise ValueError(
            f"No go_library target named '{target_name}' found in {build_file_path}"
        )

    target_block = match.group(0)

    # Now find the srcs = [...] inside that block
    srcs_pattern = re.compile(r"srcs\s*=\s*\[(.*?)\]", re.DOTALL)
    srcs_match = srcs_pattern.search(target_block)
    if not srcs_match:
        raise ValueError(f"No srcs attribute found in target '{target_name}'")

    srcs = []
    for line in srcs_match.group(1).splitlines():
        line = line.strip().rstrip(",")
        if line.startswith('"') and line.endswith('"'):
            srcs.append(line[1:-1])  # Remove quotes

    return sorted(srcs)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--build-file", required=True, help="path to the BUILD file to parse"
    )
    parser.add_argument(
        "--target-name", required=True, help="name of the go_library target to check"
    )
    parser.add_argument(
        "output_dir", help="directory containing the output files to check"
    )
    parser.add_argument("expected_files", nargs="+", help="list of expected filenames")
    args = parser.parse_args()

    output_dir = args.output_dir
    expected_files = sorted(args.expected_files)
    go_lib_srcs = extract_srcs_from_build(args.build_file, args.target_name)

    if not os.path.isdir(output_dir):
        print(f"Error: Output directory '{output_dir}' does not exist.")
        sys.exit(1)

    # List all regular files (not subdirectories) directly under output_dir
    actual_files = sorted(
        f for f in os.listdir(output_dir) if os.path.isfile(os.path.join(output_dir, f))
    )

    if expected_files != actual_files:
        print("Mismatch detected!")
        print(f"Expected files: {expected_files}")
        print(f"Actual files:   {actual_files}")
        sys.exit(1)

    if expected_files != go_lib_srcs:
        print("Mismatch detected!")
        print(f"Expected files:   {expected_files}")
        print(f"Go library files: {go_lib_srcs}")
        sys.exit(1)

    print("Test PASSED: Outputs match expected files.")


if __name__ == "__main__":
    main()
