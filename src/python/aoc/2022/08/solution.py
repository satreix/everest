#!/usr/bin/env python3

"""
https://adventofcode.com/2022/day/8
"""

import os


def data_path(filename: str) -> str:
    return os.path.join(os.path.dirname(os.path.realpath(__file__)), filename)


with open(data_path("input.txt")) as f:
    data = [[int(c) for c in l] for l in f.read().splitlines() if l.strip()]


print("--- first part ---")

max_height = 9
board = data
lines = len(board)
columns = len(board[0])


def print_board(board, visible={}, verbose=False):
    print(f"{len(visible)} trees are")
    for y in range(lines):
        for x in range(columns):
            t = board[y][x]
            s = f"\033[33;1m{t}\033[0m" if (x, y) in visible else t
            s = f"{x=},{y=}={s}" if verbose else s
            print(s, end=" ")
        print()


def find_visible_trees(board):
    out = set()

    # horizontal
    right_visible = set()
    left_visible = set()
    for y in range(lines):
        r_top = None
        l_top = None
        # right
        for x in range(columns):
            t = board[y][x]
            if r_top is None or t > r_top:
                right_visible.add((x, y))
                r_top = t
            if t == max_height:
                # print(f"right break on {x},{y}")
                break
        # left
        for x in reversed(range(columns)):
            t = board[y][x]
            if l_top is None or t > l_top:
                left_visible.add((x, y))
                l_top = t
            if t == max_height:
                # print(f"left break on {x},{y}")
                break

    # print("-- right ------")
    # print_board(data, visible=right_visible)
    out = out | right_visible
    # print("-- left ------")
    # print_board(data, visible=left_visible)
    out = out | left_visible

    # vertical
    down_visible = set()
    up_visible = set()
    for x in range(columns):
        d_top = None
        u_top = None
        # down
        for y in range(lines):
            t = board[y][x]
            if d_top is None or t > d_top:
                down_visible.add((x, y))
                d_top = t
            if t == max_height:
                # print(f"down break on {x},{y}")
                break
        # up
        for y in reversed(range(lines)):
            t = board[y][x]
            if u_top is None or t > u_top:
                up_visible.add((x, y))
                u_top = t
            if t == max_height:
                # print(f"up break on {x},{y}")
                break

    # print("-- down ------")
    # print_board(data, visible=down_visible)
    out = out | down_visible
    # print("-- up ------")
    # print_board(data, visible=up_visible)
    out = out | up_visible

    return out


# print_board(board, verbose=True)
# print("=" * 20)
vts = find_visible_trees(board)
# print("=" * 20)
# print_board(board, visible=vts)

res = len(vts)
print(f"{res=}")
# assert res == 1684

print("--- second part ---")

# print_board(board)
# print("=" * 20)

max_scenic_score = 0


def scenic_score(board, x, y):
    h = board[y][x]

    def los(elts, h):
        out = []
        for e in elts:
            out.append(e)
            if e >= h:
                break
        return out

    up = los([board[oy][x] for oy in reversed(range(0, y))], h)
    # print(f"{up=}")
    left = los([board[y][ox] for ox in reversed(range(0, x))], h)
    # print(f"{left=}")
    right = los([board[y][ox] for ox in range(x + 1, columns)], h)
    # print(f"{right=}")
    down = los([board[oy][x] for oy in range(y + 1, lines)], h)
    # print(f"{down=}")

    return len(up) * len(left) * len(right) * len(down)


# assert scenic_score(board, 2, 1) == 4
# assert scenic_score(board, 2, 3) == 8


for y in range(lines - 1)[1:]:
    for x in range(columns - 1)[1:]:
        max_scenic_score = max(max_scenic_score, scenic_score(board, x, y))

print(f"{max_scenic_score=}")
