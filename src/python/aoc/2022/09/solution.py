#!/usr/bin/env python3

"""
https://adventofcode.com/2022/day/9
"""

from dataclasses import dataclass
import os


def data_path(filename: str) -> str:
    return os.path.join(os.path.dirname(os.path.realpath(__file__)), filename)


print("--- first part ---")


@dataclass
class Point:
    name: str
    x: int
    y: int


# board_x_min = 0
# board_x_max = 6
# board_y_min = 0
# board_y_max = 5
board_x_min = -11
board_x_max = 14
board_y_min = -5
board_y_max = 15


def print_board(rope, visited={}):
    def c(x, y):
        if (x, y) in visited:
            return "#"
        for n in rope:
            if x == n.x and y == n.y:
                return n.name
        if x == 0 and y == 0:
            return "s"
        return "."

    for y in reversed(range(board_y_min, board_y_max + 1)):
        for x in range(board_x_min, board_x_max + 1):
            print(f"{c(x, y)}", end="")
        print()
    print("-" * 10)


def update_h(H, sub):
    match sub:
        case "U":
            H.y += 1
        case "R":
            H.x += 1
        case "D":
            H.y -= 1
        case "L":
            H.x -= 1
    return H


# FIXME update to do a full rope
def update_t(T, H):
    diff = (H.x - T.x, H.y - T.y)
    changes = {
        (-1, -2): (-1, -1),
        (-1, 2): (-1, 1),
        (-2, -1): (-1, -1),
        (-2, 0): (-1, 0),
        (-2, 1): (-1, 1),
        (0, -2): (0, -1),
        (0, 2): (0, 1),
        (1, -2): (1, -1),
        (1, 2): (1, 1),
        (2, -1): (1, -1),
        (2, 0): (1, 0),
        (2, 1): (1, 1),
        # additional cases for part 2 as it can now move diagonally
        (-2, -2): (-1, -1),
        (-2, 2): (-1, 1),
        (2, -2): (1, -1),
        (2, 2): (1, 1),
    }
    try:
        c = changes[diff]
    except KeyError:
        return T
    return Point(T.name, T.x + c[0], T.y + c[1])


def execute_motions(rope, motions, verbose=False):
    visited = {(0, 0)}
    if verbose:
        print_board(rope)

    for m in motions:
        if m[0].startswith("#"):
            continue
        if verbose:
            print(f"=== {m[0]} {m[1]} ===")
        for _ in range(int(m[1])):
            rope[0] = update_h(rope[0], m[0])
            for i in range(len(rope) - 1):
                prev_value = Point("prev", rope[i + 1].x, rope[i + 1].y)
                new_value = update_t(rope[i + 1], rope[i])
                if new_value.x == prev_value.x and new_value.y == prev_value.y:
                    break
                rope[i + 1] = new_value
            visited.add((rope[-1].x, rope[-1].y))
        if verbose:
            print(f"\033[32m", end="")
            print_board(rope)
            print(f"\033[0m", end="")
    if verbose:
        print_board(rope, visited=visited)
    return len(visited)


with open(data_path("input.txt")) as f:
    data = f.read().splitlines()
    motions = [m.split(" ") for m in data if m.strip()]

res = execute_motions(
    [
        Point("H", 0, 0),
        Point("T", 0, 0),
    ],
    motions,
)
print(f"{res=}")
assert res == 6266  # input

print("--- second part ---")

with open(data_path("input.txt")) as f:
    data = f.read().splitlines()
    motions = [m.split(" ") for m in data if m.strip()]

res = execute_motions(
    [Point("H", 0, 0)] + [Point(f"{i}", 0, 0) for i in range(1, 10)],
    motions,
)
print(f"{res=}")
assert res == 2369
