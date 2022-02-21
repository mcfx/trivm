# Simulator

The simulator is in [sim.cpp](sim.cpp). It completely simulates these ternary operations, so the speed is very slow (even a simple addition takes hundreds of cycles in x86).

There are also an assembler and compiler in this folder. (Disassembler is not provided, but there is a built-in one in simulator)

## Assembler

Check [asm.py](asm.py).

This assembler does a lot of assumptions, for example, if you jump to somewhere too far away, it may give some exceptions.

## Compiler

Check [compile.py](compile.py).

This compiler contains bunch of bugs, it's designed for a subset of C, with some additional features (e.g. more operators for the (and/or/xor).1 and .T instructions).

The optimization level of this compiler seems to be somewhere between `O0` and `O1` of GCC.

There are bunch of bugs in this compiler, take care when using it!