#!/usr/bin/env python3

"""
https://adventofcode.com/2022/day/1
"""

import os

def data_path(filename: str) -> str:
    return os.path.join(os.path.dirname(os.path.realpath(__file__)), filename)

with open(data_path("input.txt")) as f:
    lines = [l.strip() for l in f.readlines()]

print("--- first part ---")

m = 0
c = 0

for line in lines:
    if line == "":
        m = max(m, c)
        c = 0
    else:
        c += int(line)
m = max(m, c)
c = 0

print(f"{m}")

# check
assert m == 69795

print("--- second part ---")

elves = []
c = 0

for line in lines:
    if line == "":
        elves.append(c)
        c = 0
    else:
        c += int(line)
elves.append(c)
c = 0

res = sum(list(reversed(sorted(elves)))[:3])
print(res)

assert res == 208437
