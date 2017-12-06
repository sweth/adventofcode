#!/usr/bin/env python
import sys
with open(sys.argv[1]) as input:
    instructions = [int(x) for x in input.readlines()]
jumps = 0
position = 0
exit = len(instructions)
while (position < exit):
    instruction = instructions[position]
    if instruction >= 3:
        instructions[position] = instruction - 1
    else:
        instructions[position] = instruction + 1
    position = position + instruction
    jumps += 1
print jumps
