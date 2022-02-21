import os
os.chdir('../../sim')
assert(os.system('python compile.py ../chals/misc/misc-uncensored.c ../chals/misc/misc-uncensored.S') == 0)
assert(os.system('python asm.py ../chals/misc/misc-uncensored.S ../chals/misc/misc') == 0)
os.chdir('../chals/misc')


def censor(x):
    return x.replace('mulh r15, r8, r22, -11', '[[ there was an instruction here ]]')


open('misc.c', 'w').write(censor(open('misc-uncensored.c').read()))
open('misc.S', 'w').write(censor(open('misc-uncensored.S').read()))
