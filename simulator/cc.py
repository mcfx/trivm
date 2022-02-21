import os, sys

fn = sys.argv[1]

if os.system('python compile.py %s __tmp.S' % fn) == 0:
    os.system('python asm.py __tmp.S %s' % fn[:-2])
