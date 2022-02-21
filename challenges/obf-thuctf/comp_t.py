import os
from compile_1 import *


if 1:
    os.system('gcc -E -o __tmp.c en3.c')
    code = open('__tmp.c', 'r').read()
    tokens = tokenize(code)
    # print(tokens)
    ok, ast = parse(tokens)
    # print(ast)
    tc = codegen(ast)
    #open('tc.txt', 'w').write(repr(tc))
    tc2 = eval(open('tc.txt').read())
    tc['funcs']['encrypt'] = tc2['funcs']['encrypt']
    # print(tc)
else:
    tc = eval(open('tc.txt').read())

asm = [('j', '_start')]
for name, body in tc['funcs'].items():
    print(name, body['stack'], '=' * 20)
    # for insn in body['code']:
    #    print(*insn)
    body['code'] = optimize(body['code'], body['argc'])
    print('optimize done')
    asm_t = [('label', name)] + asmgen(body['code'], body['argc'], body['stack'], name)
    if name == 'encrypt':
        asm_enc = asm_t
    else:
        asm += asm_t

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
for i in range(9999):
    res.append('.tryte 0')
#res += asm_enc
for op, *insn in asm_enc:
    assert op != 'loadag' and op != 'loads'
    if op == 'label':
        res.append(insn[0] + ':')
    elif op == 'lw' or op == 'lt' or op == 'sw' or op == 'st':
        res.append('%s %s, %d(%s)' % (op, insn[0], insn[2], insn[1]))
    else:
        res.append(op + ' ' + ', '.join(map(str, insn)))
open('en2.S', 'w').write('\n'.join(res))
