import os
os.chdir('../../sim')
assert(os.system('python compile.py ../chals/crypto/crypto.c ../chals/crypto/crypto.S') == 0)
assert(os.system('python asm.py ../chals/crypto/crypto.S ../chals/crypto/crypto') == 0)
os.chdir('../chals/crypto')
