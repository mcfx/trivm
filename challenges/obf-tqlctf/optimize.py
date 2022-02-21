import os, sys

body = eval(open(sys.argv[1]).read())
code = body['code']
inp = []
for i in range(3):
    inp.append(int(code[i][1][1:]))
opid = {'+': 0, '|': 1, '||': 2, '|||': 3, '&': 4, '&&': 5, '&&&': 6, '^': 7, '^^': 8, '^^^': 9, '*': 10}
res = [' '.join(map(str, inp))]


def u(x):
    if type(x) is int:
        return '1 %d' % x
    return '0 %d' % int(x[1:])


for i in range(3, len(code) - 6):
    insn, op, x, y, z = code[i]
    assert insn == 'binop'
    res.append('%d %d %s %s' % (opid[op], int(x[1:]), u(y), u(z)))
open('data.txt', 'w').write('\n'.join(res))

print('executing opt')
os.system('./opt.exe %s %s' % (sys.argv[3], sys.argv[4]))

body = eval(open(sys.argv[1]).read())
code = body['code']
opid = {'+': 0, '|': 1, '||': 2, '|||': 3, '&': 4, '&&': 5, '&&&': 6, '^': 7, '^^': 8, '^^^': 9, '*': 10}
ops = {y: x for x, y in opid.items()}
coden = code[:3]
for line in open('dataw.txt').readlines():
    id, ri, xt, xi, yt, yi = map(int, line.split())
    x = xi if xt else 't%d' % xi
    y = yi if yt else 't%d' % yi
    coden.append(('binop', ops[id], 't%d' % ri, x, y))
for i in range(len(code) - 6, len(code)):
    coden.append(code[i])
body['code'] = coden
open(sys.argv[2], 'w').write(repr(body))
