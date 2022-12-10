#!/usr/bin/env python3

"""
https://adventofcode.com/2022/day/7
"""

import os
from pprint import pprint


def data_path(filename: str) -> str:
    return os.path.join(os.path.dirname(os.path.realpath(__file__)), filename)


with open(data_path("input.txt")) as f:
    lines = f.read().splitlines()


def new_dir():
    return {"size": 0, "data": {}}


def add_file(disk, path, name, size):
    disk["size"] += size
    if path:
        if path[0] not in disk["data"]:
            disk["data"][path[0]] = new_dir()
        add_file(disk["data"][path[0]], path[1:], name, size)
    else:
        disk["data"][name] = size


print("--- first part ---")
disk = new_dir()

wd = []
for line in lines:
    if line.startswith("$"):
        tokens = line.split(" ")[1:]
        match tokens[0]:
            case "cd":
                match tokens[1]:
                    case "/":
                        wd = []
                    case "..":
                        wd.pop()
                    case _:
                        wd.append(tokens[1])
            case "ls":
                pass
            case _:
                raise Exception(f"command not implemented: {tokens[0]}")
    else:
        tokens = line.split(" ")
        if tokens[0] != "dir":
            add_file(disk, wd, tokens[1], int(tokens[0]))

max_dir_size = 100000


def access(disk, path):
    o = disk
    for p in path:
        o = o["data"][p]
    return o


def sum_dirs(disk, path):
    total = 0
    target = access(disk, path)
    if isinstance(target, int):
        pass
    else:
        if target["size"] <= max_dir_size:
            total += target["size"]
        for k in target["data"]:
            total += sum_dirs(disk, path + [k])
    return total


res = sum_dirs(disk, [])
print(res)
assert res == 1845346

print("--- second part ---")

total_disk_space = 70000000
update_size = 30000000
unused = total_disk_space - disk["size"]
freeup_needed = update_size - unused


def find_smallest_viable_delete(disk, path):
    target = access(disk, path)
    if target["size"] < freeup_needed:
        return []

    out = [("/".join(path), target["size"])]
    for k, v in target["data"].items():
        if isinstance(v, int):
            continue
        out += find_smallest_viable_delete(disk, path + [k])

    return out


potential = find_smallest_viable_delete(disk, [])
res = sorted(potential, key=lambda x: x[1])[0][1]
print(res)
assert res == 3636703
