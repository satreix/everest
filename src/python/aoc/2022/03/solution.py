#!/usr/bin/env python3

"""
https://adventofcode.com/2022/day/3
"""

import os

def data_path(filename: str) -> str:
    return os.path.join(os.path.dirname(os.path.realpath(__file__)), filename)

with open(data_path("input.txt")) as f:
    lines = [l.strip() for l in f.readlines()]

print("--- first part ---")

def unique_items(s):
    return set([*s])

def priority(c):
    if ord('a') <= ord(c) <= ord('z'):
        return ord(c) - ord('a') + 1
    return ord(c) - ord('A') + 27

total_priority = 0
for line in lines:
    items_per_comp = int(len(line) / 2)
    comp_1 = line[0:items_per_comp]
    comp_2 = line[items_per_comp:]
    for c in unique_items(comp_1) & unique_items(comp_2):
        total_priority += priority(c)
print(f"{total_priority=}")

assert total_priority == 8240

print("--- second part ---")

# let's find the badges

badge_total_priority = 0
x = iter(lines)
for a, b, c, in zip(x, x, x):
    for b in unique_items(a) & unique_items(b) & unique_items(c):
        badge_total_priority += priority(b)
print(f"{badge_total_priority=}")
assert badge_total_priority == 2587
