import sys

R_insns = {
    'add': '000',
    'sub': '001',
    'xor': '100',
    'xor.1': '101',
    'xor.T': '10T',
    'or': '110',
    'or.1': '111',
    'or.T': '11T',
    'and': '1T0',
    'and.1': '1T1',
    'and.T': '1TT',
    'sll': '010',
    'srl': '01T',
    'seq': '0T0',
    'sne': '0T1',
    'slt': '00T',
}

I_insns = {}
for x in R_insns:
    if '.' not in x:
        I_insns[x + 'i'] = x
    else:
        a, b = x.split('.')
        I_insns[a + 'i.' + b] = x

LS_insns = {
    'lt': '000',
    'lw': '001',
    'st': '010',
    'sw': '011',
}

B_insns = {
    'beq': '000',
    'bne': '001',
    'blt': '00T',
}

LU_insns = {
    'lui': '0T0',
    'auipc': '0T1',
}

MUL_insns = {
    'mul': '000',
    'mulh': '001',
}


def ireg(x):
    if x == 'zero':
        return 0
    if x == 'ra':
        return 1
    if x == 'sp':
        return 2
    try:
        p = int(x[1:])
    except:
        return None
    if x[0] == 'r':
        return p
    if x[0] == 'a':
        return p + 3
    if x[0] == 's':
        return p + 11
    if x[0] == 't':
        return p + 19
    return None


def creg(x):
    return ireg(x) is not None


def divmod3(x):
    u = x % 3
    if u == 2:
        u = -1
    return (x - u) // 3, u


def rs6(x):
    for _ in range(6):
        x, _ = divmod3(x)
    return x


fn = sys.argv[1]
fno = sys.argv[2]
code_raw = open(fn).read().split('\n')
code = []
labels = {}
offset = 0
for line in code_raw:
    if ';' in line:
        line = line.split(';', 1)[0]
    line = line.strip()
    if len(line) == 0:
        continue
    if line.endswith(':'):
        labels[line[:-1]] = offset
        continue
    op, b = (line + ' ').split(' ', 1)
    args = list(map(lambda x: x.strip(), b.split(',')))
    if op == '.tryte':
        code.append((offset, op, int(b)))
        offset += 1
        continue
    if offset % 3 != 0:
        for _ in range(3 - offset % 3):
            code.append((offset, '.tryte', 0))
            offset += 1
    if op in R_insns or op in MUL_insns:
        assert creg(args[0]) and creg(args[1]) and creg(args[2])
        if len(args) > 4:
            assert False
        elif len(args) == 4:
            ai = int(args[3])
            assert op != 'slt'
        else:
            ai = 0
        code.append((offset, op, ireg(args[0]), ireg(args[1]), ireg(args[2]), ai))
        offset += 3
    elif op in I_insns:
        assert creg(args[0]) and creg(args[1])
        code.append((offset, op, ireg(args[0]), ireg(args[1]), int(args[2])))
        offset += 3
    elif op in LS_insns:
        assert creg(args[0])
        assert args[1].endswith(')')
        c, d = args[1][:-1].split('(')
        assert creg(d)
        code.append((offset, op, ireg(args[0]), ireg(d), int(c)))
        offset += 3
    elif op in B_insns:
        assert creg(args[0]) and creg(args[1])
        code.append((offset, op, ireg(args[0]), ireg(args[1]), args[2]))
        offset += 3
    elif op == 'jal':
        if len(args) == 1:
            code.append((offset, op, ireg('ra'), args[0]))
        else:
            code.append((offset, op, ireg(args[0]), args[1]))
        offset += 3
    elif op == 'jalr':
        if len(args) == 2:
            code.append((offset, op, ireg('zero'), ireg(args[0]), int(args[1])))
        else:
            code.append((offset, op, ireg(args[0]), ireg(args[1]), int(args[2])))
        offset += 3
    elif op in LU_insns:
        code.append((offset, op, ireg(args[0]), int(args[1])))
        offset += 3
    elif op == 'ecall':
        code.append((offset, op))
        offset += 3
    elif op == 'nop':
        code.append((offset, 'add', ireg('zero'), ireg('zero'), ireg('zero'), 0))
        offset += 3
    elif op == 'j':
        code.append((offset, 'jal', ireg('zero'), args[0]))
        offset += 3
    elif op == 'ret':
        code.append((offset, 'jalr', ireg('zero'), ireg('ra'), 0))
        offset += 3
    elif op == 'mv':
        assert creg(args[0]) and creg(args[1])
        code.append((offset, 'add', ireg(args[0]), ireg(args[1]), ireg('zero'), 0))
        offset += 3
    elif op == 'li':
        assert creg(args[0])
        rg = ireg(args[0])
        ai = int(args[1])
        if abs(ai) <= 364:
            code.append((offset, 'addi', rg, ireg('zero'), ai))
            offset += 3
        else:
            t = rs6(ai)
            code.append((offset, 'lui', rg, t))
            offset += 3
            ai -= t * 3**6
            if ai:
                code.append((offset, 'addi', rg, rg, ai))
                offset += 3
    elif op == 'la':
        assert creg(args[0])
        ao = 0
        if '+' in args[1]:
            a, b = args[1].split('+')
            args[1] = a
            ao = int(b)
        elif '-' in args[1]:
            a, b = args[1].split('-')
            args[1] = a
            ao = -int(b)
        code.append((offset, 'la', ireg(args[0]), args[1], ao))
        offset += 6
    else:
        raise Exception('unknown op: ' + line)

# print(code)
# print(labels)

code2 = []
for offset, op, *args in code:
    args = list(args)
    if op in B_insns:
        if args[2] in labels:
            args[2] = labels[args[2]] - offset
        else:
            args[2] = int(args[2])
        assert args[2] % 3 == 0
        args[2] //= 3
    elif op == 'jal':
        if args[1] in labels:
            args[1] = labels[args[1]] - offset
        else:
            args[1] = int(args[1])
    elif op == 'la':
        u = labels[args[1]] + args[2] - offset
        u6 = rs6(u)
        code2.append(('auipc', args[0], u6))
        code2.append(('addi', args[0], args[0], u - u6 * 3**6))
        continue
    code2.append((op, *args))
code = code2
# print(code)


def re27(x):
    if x > 13:
        x -= 27
    return x


def sti(s):
    r = 0
    for x in s:
        r = r * 3 + (1 if x == '1' else -1 if x == 'T' else 0)
    return r


def tob16(x):
    t = []
    for _ in range(6):
        x, u = divmod3(x)
        t.append(u)
    assert x == 0
    r = 0
    for i in range(5, -1, -1):
        r = r * 4 + (3 if t[i] == -1 else t[i])
    return r


def gen_r(opcode, funct3, rd, rs1, rs2, imm3):
    return [
        re27(rd) * 27 + sti(opcode),
        sti(funct3) * 27 + re27(rs1),
        imm3 * 27 + re27(rs2)
    ]


def gen_i(opcode, funct3, rd, rs1, imm6):
    immlo = re27(imm6 % 27)
    immhi = (imm6 - immlo) // 27
    return [
        re27(rd) * 27 + sti(opcode),
        sti(funct3) * 27 + re27(rs1),
        immlo * 27 + immhi
    ]


def gen_jalr(opcode, rd, rs1, imm9):
    imm6 = imm9 % 729
    if imm6 > 364:
        imm6 -= 729
    immlo = re27(imm6 % 27)
    immhi = (imm6 - immlo) // 27
    imm6h = (imm9 - imm6) // 729
    return [
        re27(rd) * 27 + sti(opcode),
        imm6h * 27 + re27(rs1),
        immlo * 27 + immhi
    ]


def gen_u(opcode, rd, imm12):
    imm6 = imm12 % 729
    if imm6 > 364:
        imm6 -= 729
    immlo = re27(imm6 % 27)
    immhi = (imm6 - immlo) // 27
    imm6h = (imm12 - imm6) // 729
    return [
        re27(rd) * 27 + sti(opcode),
        imm6h,
        immlo * 27 + immhi
    ]


re_bs = []

for op, *args in code:
    if op in R_insns:
        re_bs += gen_r('000', R_insns[op], args[0], args[1], args[2], args[3])
    elif op in MUL_insns:
        re_bs += gen_r('101', MUL_insns[op], args[0], args[1], args[2], args[3])
    elif op in I_insns:
        re_bs += gen_i('001', R_insns[I_insns[op]], args[0], args[1], args[2])
    elif op in LS_insns:
        re_bs += gen_i('00T', LS_insns[op], args[0], args[1], args[2])
    elif op in LU_insns:
        re_bs += gen_u(LU_insns[op], args[0], args[1])
    elif op in B_insns:
        re_bs += gen_i('010', B_insns[op], args[0], args[1], args[2])
    elif op == 'jal':
        re_bs += gen_u('011', args[0], args[1])
    elif op == 'jalr':
        re_bs += gen_jalr('01T', args[0], args[1], args[2])
    elif op == 'ecall':
        re_bs += gen_r('100', '000', 0, 0, 0, 0)
    elif op == '.tryte':
        re_bs.append(args[0])
    else:
        assert False
    for i in range(-3, 0):
        if re_bs[i] < -364 or re_bs[i] > 364:
            print(op, *args)
            exit()

print(re_bs)

fo = open(fno, 'wb')
fo.write(b'TRVM')
for x in re_bs:
    fo.write(tob16(x).to_bytes(2, 'little'))
fo.close()
