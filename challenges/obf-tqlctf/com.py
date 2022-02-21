import os, shutil, random

random.seed(197012490182038120)
shutil.copyfile('../../sim_v2/compile.py', 'compile.py')
if 1:
    from compile import *


def reorder(s):
    def get(x):
        if type(x) is int:
            return x
        if x not in table:
            table[x] = 't%d' % len(table)
        return table[x]
    table = {}
    for i in range(4):
        table['t' + str(i)] = 't' + str(i)
    res = []
    for op, *insn in s:
        if op == 'lw':
            res.append(('lw', get(insn[0]), get(insn[1]), insn[2]))
        elif op == 'sw':
            res.append(('sw', get(insn[0]), get(insn[1]), insn[2]))
        elif op == 'binop':
            res.append(('binop', insn[0], get(insn[1]), get(insn[2]), get(insn[3])))
        elif op == 'loadi':
            res.append(('loadi', get(insn[0]), insn[1]))
        elif op == 'assign':
            res.append(('assign', get(insn[0]), get(insn[1])))
        elif op == 'ret':
            res.append(('ret',))
        else:
            assert False
    return res


os.system('gcc -E -o __tmp.c a3.c')
code = open('__tmp.c', 'r').read()
codet = code.split('RR')
nc = []
vars = 'x, y, z, p, x0, x1, x2, y0, y1, z0, pyz, rt, a, b, c, d, e, f, g'.replace(',', '').split()
for x in codet:
    nc.append(random.choice(vars))
    nc.append(x)
code = ''.join(nc[1:])
open('__tmp2.c', 'w').write(code.replace('gg', 'g').replace('FAFA;', '#include "ops.h"'))
os.system('gcc -E -o __tmp.c __tmp2.c')
code = open('__tmp.c', 'r').read()
tokens = tokenize(code)
ok, ast = parse(tokens)
tc = codegen(ast)
if 1:
    body = tc['funcs']['encrypt']
    if 1:
        body['code'] = optimize(body['code'], body['argc'])
        open('body.txt', 'w').write(repr(body))
        print('optimize 1')
        os.system('python optimize.py body.txt bodyn.txt 100 0')
        body = eval(open('bodyn.txt').read())
        body['code'] = optimize(body['code'], body['argc'])
        open('body.txt', 'w').write(repr(body))
    print('optimize 2')
    os.system('python optimize.py body.txt bodyn.txt 0 1')
    body = eval(open('bodyn.txt').read())
    body['code'] = reorder(body['code'])
    tc['funcs']['encrypt'] = body


asm = [('j', '_start')]
for name, body in tc['funcs'].items():
    print(name, body['stack'], '=' * 20)
    for insn in body['code']:
        print(*insn)
    body['code'] = optimize(body['code'], body['argc'])
    asm.append(('label', name))
    asm += asmgen(body['code'], body['argc'], body['stack'], name)

strs = []
for op, *insn in asm:
    if op == 'loads':
        strs.append(insn[1])
strs.sort(key=lambda x: (-len(x), x))
strf = []
for x in strs:
    if any(y.endswith(x) for y in strf):
        continue
    strf.append(x)
allstr = b''.join(map(lambda x: x + b'\0', strf))
while len(allstr) % 3:
    allstr += b'\0'

for i, (op, *insn) in enumerate(asm):
    if op == 'loadag':
        asm[i] = ('la', insn[0], '__globals+%d' % insn[1])
    elif op == 'loads':
        asm[i] = ('la', insn[0], '__strings+%d' % allstr.find(insn[1] + b'\0'))

res = []
for op, *insn in asm:
    if op == 'label':
        res.append(insn[0] + ':')
    elif op == 'lw' or op == 'lt' or op == 'sw' or op == 'st':
        res.append('%s %s, %d(%s)' % (op, insn[0], insn[2], insn[1]))
    else:
        res.append(op + ' ' + ', '.join(map(str, insn)))
res.append('__strings:')
for x in allstr:
    res.append('.tryte ' + str(x))
res.append('__globals:')
open('a3.S', 'w').write('\n'.join(res))
