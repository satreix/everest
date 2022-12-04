#!/usr/bin/env python3

"""
https://adventofcode.com/2022/day/4
"""

import os

def data_path(filename: str) -> str:
    return os.path.join(os.path.dirname(os.path.realpath(__file__)), filename)

with open(data_path("input.txt")) as f:
    lines = [l.strip() for l in f.readlines()]

print("--- first part ---")

def parse_range(s):
    fp = s.split('-')
    return list(range(int(fp[0]), int(fp[1]) + 1))

fully_contained_pairs = 0
for line in lines:
    first, second = line.split(',')
    first = parse_range(first)
    second = parse_range(second)
    if all([a in second for a in first]) or all([b in first for b in second]):
        fully_contained_pairs += 1

print(f"{fully_contained_pairs=}")
assert fully_contained_pairs == 441

print("--- second part ---")

overlap_pairs = 0
for line in lines:
    first, second = line.split(',')
    first = set(parse_range(first))
    second = set(parse_range(second))
    if first & second:
        overlap_pairs += 1

print(f"{overlap_pairs=}")
assert overlap_pairs == 861
