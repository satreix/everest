#!/usr/bin/env python3

"""
https://adventofcode.com/2022/day/6
"""

import os


def data_path(filename: str) -> str:
    return os.path.join(os.path.dirname(os.path.realpath(__file__)), filename)


with open(data_path("input.txt")) as f:
    data = f.read().strip()


def find_first_paquet(data, paquet_size):
    for i in range(0, len(data) - paquet_size):
        p = data[i : i + paquet_size]
        if len(set([c for c in p])) == paquet_size:
            return i + paquet_size


print("--- first part ---")

res = find_first_paquet(data, 4)
assert res == 1287

print("--- second part ---")

res = find_first_paquet(data, 14)
assert res == 3716
