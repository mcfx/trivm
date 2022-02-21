import os
os.chdir('../../sim')
assert(os.system('python compile.py ../chals/re/test.c test2.S') == 0)
assert(os.system('python asm.py test2.S ../chals/re/test') == 0)
os.chdir('../chals/re')
