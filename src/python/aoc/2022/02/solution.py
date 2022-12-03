#!/usr/bin/env python3

"""
https://adventofcode.com/2022/day/2
"""

import os

def data_path(filename: str) -> str:
    return os.path.join(os.path.dirname(os.path.realpath(__file__)), filename)

with open(data_path("input.txt")) as f:
    lines = [l.strip() for l in f.readlines()]

print("--- first part ---")

move_score = {
    "rock": 1,
    "paper": 2,
    "scissors": 3,
}

op_moves = {
    "A": "rock",
    "B": "paper",
    "C": "scissors",
}

me_moves = {
    "X": "rock",
    "Y": "paper",
    "Z": "scissors",
}

def score(op, me):
    out = move_score[me]
    if op == me:
        out += 3
    else:
        if op == 'rock':
            if me == 'paper':
                out += 6
        elif op == 'paper':
            if me != 'rock':
                out += 6
        else:
            if me == 'rock':
                out += 6
    return out

final_score = 0
for line in lines:
    op, me = line.split(" ")
    final_score += score(op_moves[op], me_moves[me])
print(f"{final_score=}")
assert final_score == 11150

print("--- second part ---")

me_outcomes = {
    "X": "lose",
    "Y": "draw",
    "Z": "win",
}

def score_2(op, me_outcome):
    if me_outcome == 'lose':
        if op == 'rock':
            me = 'scissors'
        elif op == 'paper':
            me = 'rock'
        else:
            me = 'paper'
    elif me_outcome == 'draw':
        me = op
    else:
        if op == 'rock':
            me = 'paper'
        elif op == 'paper':
            me = 'scissors'
        else:
            me = 'rock'
    return score(op, me)

final_score = 0
for line in lines:
    op, me = line.split(" ")
    final_score += score_2(op_moves[op], me_outcomes[me])
print(f"{final_score=}")
assert final_score == 8295
