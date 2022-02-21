import os
os.chdir('../../sim')
assert(os.system('python compile.py ../chals/pwn/pwn.c ../chals/pwn/pwn.S') == 0)
assert(os.system('python asm.py ../chals/pwn/pwn.S ../chals/pwn/pwn') == 0)
os.chdir('../chals/pwn')
