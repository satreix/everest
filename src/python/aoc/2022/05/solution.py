#!/usr/bin/env python3

"""
https://adventofcode.com/2022/day/5
"""

import os


def data_path(filename: str) -> str:
    return os.path.join(os.path.dirname(os.path.realpath(__file__)), filename)


with open(data_path("input.txt")) as f:
    lines = f.read().splitlines()

print("--- first part ---")


def print_stacks(stacks):
    for i, stack in enumerate(stacks):
        print(f"{i}: {stack}")
    print("-" * 10)


stacks = None
phase = "stacks"
for line in lines:
    if line == "":
        phase = "instructions"
        print_stacks(stacks)
        continue

    if phase == "stacks":
        if stacks is None:
            stacks = [[] for i in range(int((len(line) + 1) / 4))]
        if "[" not in line and "]" not in line:
            continue
        for i in range(len(stacks)):
            content = line[1 + i * 4]
            if content != " ":
                stacks[i] = [content] + stacks[i]

    elif phase == "instructions":
        _, count, _, src, _, dst = line.split(" ")
        count = int(count)
        src = int(src) - 1
        dst = int(dst) - 1
        print(f"move {count=} {src=} {dst=}")

        bottom = -count
        elts = stacks[src][bottom:]
        stacks[dst] += list(reversed(elts))
        stacks[src] = stacks[src][:bottom]

        print_stacks(stacks)

res = "".join([s[-1] for s in stacks])
print(res)
assert res == "SHMSDGZVC"

print("--- second part ---")

stacks = None
phase = "stacks"
for line in lines:
    if line == "":
        phase = "instructions"
        print_stacks(stacks)
        continue

    if phase == "stacks":
        if stacks is None:
            stacks = [[] for i in range(int((len(line) + 1) / 4))]
        if "[" not in line and "]" not in line:
            continue
        for i in range(len(stacks)):
            content = line[1 + i * 4]
            if content != " ":
                stacks[i] = [content] + stacks[i]

    elif phase == "instructions":
        _, count, _, src, _, dst = line.split(" ")
        count = int(count)
        src = int(src) - 1
        dst = int(dst) - 1
        print(f"move {count=} {src=} {dst=}")

        bottom = -count
        elts = stacks[src][bottom:]
        stacks[dst] += elts
        stacks[src] = stacks[src][:bottom]

        print_stacks(stacks)

res = "".join([s[-1] for s in stacks])
print(res)
