import os, sys, string
from copy import deepcopy


def tokenize(code):
    digits = string.digits
    token_chars = string.digits + string.ascii_letters + '_'
    operators = {
        '{', '}', ';', ',',
        '<', '>', '<=', '>=', '==', '!=', '<<', '>>',
        '+', '-', '*', '**', '!',
        '^', '^^', '^^^', '|', '||', '|||', '&', '&&', '&&&',
        '[', ']', '(', ')',
    }
    op_chars = set(''.join(operators))
    code += ' ' * 10
    res = []
    i = 0
    while i < len(code):
        if code[i] == '#':
            j = i + 2
            while code[j] != '\n':
                j += 1
            i = j + 1
            continue
        if code[i] == '/':
            if code[i + 1] == '/':
                j = i + 2
                while code[j] != '\n':
                    j += 1
                i = j + 1
                continue
            if code[i + 1] == '*':
                j = i + 2
                while code[j] != '*' or code[j + 1] != '/':
                    j += 1
                i = j + 2
                continue
        if code[i] == '"' or code[i] == "'":
            j = i + 1
            u = b''
            while code[j] != code[i]:
                if code[j] == '\\':
                    u += eval("b'\\" + code[j + 1] + "'")
                    j += 2
                else:
                    u += code[j].encode()
                    j += 1
            res.append(('str' if code[i] == '"' else 'char', u))
            i = j + 1
            continue
        if code[i] in digits:
            j = i + 1
            while code[j] in digits:
                j += 1
            res.append(('int', int(code[i:j])))
            i = j
            continue
        if code[i] in token_chars:
            j = i + 1
            while code[j] in token_chars:
                j += 1
            res.append(('token', code[i:j]))
            i = j
            continue
        if code[i] in op_chars:
            j = i + 1
            while code[i:j + 1] in operators:
                j += 1
            res.append(('operator', code[i:j]))
            i = j
            continue
        i += 1
    return res


class Parser:
    def __init__(self, tokens):
        self.tokens = tokens
        self.pos = 0

    def back(self, u):
        self.pos = u
        return False, None

    def read_req(self, x=None, y=None):
        ux, uy = self.tokens[self.pos]
        if x is None or ux == x:
            if y is None or uy == y:
                self.pos += 1
                return True, (ux, uy)
        return False, None

    def read_token(self, x=None):
        return self.read_req('token', x)

    def read_int(self):
        return self.read_req('int', None)

    def read_op(self, x=None):
        return self.read_req('operator', x)

    def read_ops(self, s):
        for x in s:
            ok, v = self.read_op(x)
            if ok:
                return True, v
        return False, None

    def eof(self):
        return self.pos == len(self.tokens)

    def parse_type(self):
        ok, v = self.read_token('int')
        if ok:
            return True, v
        ok, v = self.read_token('char')
        if ok:
            return True, v
        return False, None

    def parse_program(self):
        res = []
        while not self.eof():
            ok, v = self.parse_global_definition()
            if not ok:
                return False, None
            res.append(v)
        return True, res

    def parse_global_definition(self):
        ok, v = self.parse_variable_definition()
        if ok:
            return True, v
        ok, v = self.parse_function()
        if ok:
            return True, v
        return False, None

    def parse_decl1(self):
        o = self.pos
        po_cnt = 0
        while True:
            ok, _ = self.read_op('*')
            if not ok:
                break
            po_cnt += 1
        ok, tk = self.read_token()
        if not ok:
            return self.back(o)
        array = []
        while True:
            ok, _ = self.read_op('[')
            if not ok:
                break
            ok, l = self.read_int()
            if not ok:
                return self.back(o)
            ok, _ = self.read_op(']')
            if not ok:
                return self.back(o)
            array.append(l[1])
        return True, (po_cnt, tk[1], array)

    def parse_variable_definition(self):
        o = self.pos
        ok, tp = self.parse_type()
        if ok:
            vars = []
            while True:
                ok, u = self.parse_decl1()
                if not ok:
                    return self.back(o)
                vars.append(u)
                ok, no = self.read_ops([';', ','])
                if not ok:
                    return self.back(o)
                if no[1] == ';':
                    break
            return True, ('vardef', tp[1], vars)
        return False, None

    def parse_function(self):
        o = self.pos
        ok, tp = self.parse_type()
        if ok:
            ok, v = self.parse_decl1()
            if not ok:
                return self.back(o)
            po_cnt, tk, array = v
            if len(array):
                return self.back(o)
            ok, _ = self.read_op('(')
            if not ok:
                return self.back(o)
            ok, _ = self.read_op(')')
            args = []
            if not ok:
                while True:
                    ok, atp = self.parse_type()
                    if not ok:
                        return self.back(o)
                    ok, v = self.parse_decl1()
                    if not ok:
                        return self.back(o)
                    args.append((atp[1], *v))
                    ok, no = self.read_ops([')', ','])
                    if not ok:
                        return self.back(o)
                    if no[1] == ')':
                        break
            func_def = (tp[1], po_cnt, tk, args)
            ok, func_body = self.parse_block()
            if not ok:
                return self.back(o)
            return True, ('func', func_def, func_body)
        return False, None

    def parse_block(self):
        o = self.pos
        ok, _ = self.read_op('{')
        if not ok:
            return self.back(o)
        r = []
        while True:
            ok, _ = self.read_op('}')
            if ok:
                break
            ok, v = self.parse_statement()
            if not ok:
                return self.back(o)
            r.append(v)
        return True, r

    def parse_statement(self):
        ok, _ = self.read_op(';')
        if ok:
            return True, ('empty',)
        ok, v = self.parse_variable_definition()
        if ok:
            return True, v
        ok, v = self.parse_block()
        if ok:
            return True, ('block', v)
        ok, v = self.parse_if()
        if ok:
            return True, v
        ok, v = self.parse_while()
        if ok:
            return True, v
        ok, v = self.parse_for()
        if ok:
            return True, v
        ok, v = self.parse_return()
        if ok:
            return True, v
        o = self.pos
        ok, _ = self.read_token('continue')
        if ok:
            ok, _ = self.read_op(';')
            if not ok:
                return self.back(o)
            return True, ('continue',)
        ok, _ = self.read_token('break')
        if ok:
            ok, _ = self.read_op(';')
            if not ok:
                return self.back(o)
            return True, ('break',)
        ok, v = self.parse_expr()
        if ok:
            ok, _ = self.read_op(';')
            if not ok:
                return self.back(o)
            return True, ('expr', v)
        return False, None

    def parse_while(self):
        o = self.pos
        ok, _ = self.read_token('while')
        if not ok:
            return False, None
        ok, _ = self.read_op('(')
        if not ok:
            return self.back(o)
        ok, req = self.parse_expr()
        if not ok:
            return self.back(o)
        ok, _ = self.read_op(')')
        if not ok:
            return self.back(o)
        ok, substmt = self.parse_statement()
        if not ok:
            return self.back(o)
        return True, ('while', req, substmt)

    def parse_for(self):
        o = self.pos
        ok, _ = self.read_token('for')
        if not ok:
            return False, None
        ok, _ = self.read_op('(')
        if not ok:
            return self.back(o)
        _, a = self.parse_expr()
        ok, _ = self.read_op(';')
        if not ok:
            return self.back(o)
        ok, b = self.parse_expr()
        if not ok:
            return self.back(o)
        ok, _ = self.read_op(';')
        if not ok:
            return self.back(o)
        _, c = self.parse_expr()
        ok, _ = self.read_op(')')
        if not ok:
            return self.back(o)
        ok, substmt = self.parse_statement()
        if not ok:
            return self.back(o)
        return True, ('for', a, b, c, substmt)

    def parse_if(self):
        o = self.pos
        ok, _ = self.read_token('if')
        if not ok:
            return False, None
        ok, _ = self.read_op('(')
        if not ok:
            return self.back(o)
        ok, req = self.parse_expr()
        if not ok:
            return self.back(o)
        ok, _ = self.read_op(')')
        if not ok:
            return self.back(o)
        ok, substmt = self.parse_statement()
        if not ok:
            return self.back(o)
        ok, _ = self.read_token('else')
        if ok:
            ok, elsestmt = self.parse_statement()
            if not ok:
                return self.back(o)
        else:
            elsestmt = None
        return True, ('if', req, substmt, elsestmt)

    def parse_return(self):
        o = self.pos
        ok, _ = self.read_token('return')
        if not ok:
            return self.back(o)
        ok, e = self.parse_expr()
        if not ok:
            return self.back(o)
        ok, _ = self.read_op(';')
        if not ok:
            return self.back(o)
        return True, ('return', e)

    def expand_comma_args(self, v):
        r = []
        while v[0] == 'binop' and v[1] == ',':
            r = [v[3]] + r
            v = v[2]
        return [v] + r

    def parse_expr(self, layer=0):
        #print(self.pos, layer)
        o = self.pos
        if layer == 1:
            ok, left = self.parse_expr(layer + 1)
            if not ok:
                return self.back(o)
            ok, op = self.read_op('=')
            if not ok:
                return True, left
            ok, right = self.parse_expr(layer)
            if not ok:
                return self.back(o)
            return True, ('binop', op[1], left, right)
        layers_ops = {
            0: [','],
            2: ['|', '||', '|||'],
            3: ['&', '&&', '&&&'],
            4: ['^', '^^', '^^^'],
            5: ['==', '!='],
            6: ['<', '>', '<=', '>='],
            7: ['<<', '>>'],
            8: ['+', '-'],
            9: ['*', '**'],
        }
        if layer <= 9:
            ok, cur = self.parse_expr(layer + 1)
            if not ok:
                return self.back(o)
            while True:
                ok, op = self.read_ops(layers_ops[layer])
                if not ok:
                    break
                ok, nxt = self.parse_expr(layer + 1)
                if not ok:
                    return self.back(o)
                cur = ('binop', op[1], cur, nxt)
            return True, cur
        if layer == 10:  # unary op
            ok, op = self.read_ops(['+', '-', '*', '&', '!'])
            if ok:
                ok, sub = self.parse_expr(layer)
                if not ok:
                    return self.back(o)
                return True, ('unop', op[1], sub)
            return self.parse_expr(layer + 1)
        if layer == 11:  # call and subscript
            ok, clr = self.parse_expr(layer + 1)
            if ok:
                o2 = self.pos
                ok, _ = self.read_op('(')
                if ok:
                    ok, _ = self.read_op(')')
                    if ok:
                        return True, ('call', clr, [])
                    ok, args = self.parse_expr(0)
                    if ok:
                        args = self.expand_comma_args(args)
                        ok, _ = self.read_op(')')
                        if ok:
                            return True, ('call', clr, args)
                self.back(o2)
                ok, _ = self.read_op('[')
                if ok:
                    ok, arg = self.parse_expr(0)
                    if ok:
                        ok, _ = self.read_op(']')
                        if ok:
                            cres = ('subscript', clr, arg)
                            while True:
                                ok, _ = self.read_op('[')
                                if not ok:
                                    return True, cres
                                ok, arg = self.parse_expr(0)
                                if not ok:
                                    return self.back(o)
                                ok, _ = self.read_op(']')
                                if not ok:
                                    return self.back(o)
                                cres = ('subscript', cres, arg)
                return True, clr  # maybe wrong
            self.back(o)
            return self.parse_expr(layer + 1)
        if layer == 12:  # variable/num/(xxx)
            ok, _ = self.read_op('(')
            if ok:
                ok, inner = self.parse_expr(0)
                if ok:
                    ok, _ = self.read_op(')')
                    if ok:
                        return True, inner
            ok, v = self.read_int()
            if ok:
                return True, ('int', v[1])
            ok, v = self.read_req('char')
            if ok:
                u = 0
                for i in range(len(v[1]) - 1, -1, -1):
                    u = u * 729 + v[1][i]
                return True, ('int', u)
            ok, v = self.read_req('str')
            if ok:
                return True, ('str', v[1])
            ok, v = self.read_token()
            if ok:
                return True, ('var', v[1])
            return False, None
        assert False


def parse(tokens):
    p = Parser(tokens)
    return p.parse_program()


def arrsize(s):
    r = 1
    for x in s:
        r *= x
    return r


def type_size(name, po_cnt, *_):
    return 3 if name == 'int' or po_cnt > 0 else 1


class CodeGen:
    def __init__(self, ast):
        self.ast = ast
        self.globalvars = {}
        self.funcrets = {}
        tgi = []
        tgc = []
        for tp, *gdef in ast:
            if tp == 'vardef':
                vtp = gdef[0]
                for po_cnt, name, array in gdef[1]:
                    utp = (vtp, po_cnt, array)
                    t = (arrsize(array), name, utp)
                    if vtp == 'char' and po_cnt == 0:
                        tgc.append(t)
                    else:
                        tgi.append(t)
            elif tp == 'func':
                rtype, po_cnt, name, _ = gdef[0]
                self.funcrets[name] = (rtype, po_cnt, [])
        off = 0
        for asz, name, tp in tgi:
            assert name not in self.globalvars
            self.globalvars[name] = (tp, off)
            off += asz * 3
        for asz, name, tp in tgc:
            assert name not in self.globalvars
            self.globalvars[name] = (tp, off)
            off += asz
        self.gv_totsize = off

    def alloca(self, single_size, n):
        if single_size == 1:
            totsize = n + (3 - n) % 3
        else:
            totsize = n * 3
        res = self.alloca_n
        self.alloca_n += totsize
        self.max_alloca = max(self.max_alloca, self.alloca_n)
        return res

    def newtmp(self):
        res = 't' + str(self.tcnt)
        self.tcnt += 1
        return res

    def newlabel(self):
        res = 'label' + str(self.tcnt)
        self.tcnt += 1
        return res

    def _assign(self, name, v):
        self.context[-1][0][name] = v

    def assign(self, name, tp, tmp, is_def):
        self._assign(name, ('local', tp, tmp, is_def))

    def assign_stack(self, name, tp, offset):
        self._assign(name, ('stack', tp, offset, True))

    def locate(self, name, layer=None):
        if layer is None:
            layer = len(self.context) - 1
        for i in range(layer, -1, -1):
            if name in self.context[i][0]:
                return self.context[i][0][name]
        if name in self.globalvars:
            return 'global', *self.globalvars[name], False
        return '', None, None, None

    def locate_def(self, name, layer=None):
        if layer is None:
            layer = len(self.context) - 1
        for i in range(layer, -1, -1):
            if name in self.context[i][0] and self.context[i][0][name][3]:
                return i
        return -1

    def resetcxt(self):
        self.context = []
        self.tcnt = 0
        self.alloca_n = 0
        self.max_alloca = 0
        self.code = []

    def pushcxt(self):
        self.context.append(({}, {}, self.alloca_n))
        return len(self.context) - 1

    def setcxt(self, n):
        self.context = self.context[:n]
        self.alloca_n = self.context[-1][2]

    def fix_vars(self, target_layer):
        fixed = set()
        res = []
        for i in range(len(self.context) - 1, target_layer, -1):
            cur = self.context[i][0]
            for varname, (tp, _, tname, _) in cur.items():
                if tp == 'stack':
                    continue
                a = self.locate_def(varname, i)
                b = self.locate_def(varname, target_layer)
                if a == b and varname not in fixed:
                    _, _, otname, _ = self.locate(varname, target_layer)
                    res.append(('assign', otname, tname))
                    fixed.add(varname)
        return res

    def find_dest(self, tp):
        for i in range(len(self.context) - 1, -1, -1):
            if tp in self.context[i][1]:
                return i, self.context[i][1][tp]
        raise Exception('no dest found')

    def set_dest(self, tp, label):
        self.context[-1][1][tp] = label

    def add_code(self, *args):
        self.code.append((*args,))

    def add_codes(self, s):
        self.code += s

    def to_value(self, varref):
        return varref[0]

    def _load(self, vt, tp):
        basetp, po_cnt, arr = tp
        assert len(arr) == 0 and po_cnt > 0
        tmp = self.newtmp()
        if po_cnt == 1 and basetp == 'char':
            self.add_code('lt', tmp, vt, -1)
            return (tmp, ('char', 0, []), 'pointer', vt)
        self.add_code('lw', tmp, vt, 0)
        return (tmp, (basetp, po_cnt - 1, []), 'pointer', vt)

    def cast_char_int(self, old, tp):
        if tp == 'int':
            return old
        tmp = self.newtmp()
        self.add_code('binop', '&&', tmp, old, 364)
        return tmp

    def gen_expr(self, expr):
        # format: (value, type, reftype, ref)
        # ref can be: ('none', None) ('var', var_name) ('pointer', point_tname)
        tp, *vs = expr
        if tp == 'var':
            tp, vtp, st, _ = self.locate(vs[0])
            if tp == 'local':
                return (st, vtp, 'var', vs[0])
            #print(vs[0], tp, vtp, st)
            assert tp == 'stack' or tp == 'global'
            basetp, po_cnt, arr = vtp
            tmp = self.newtmp()
            if tp == 'stack':
                self.add_code('loadas', tmp, st)
            else:
                self.add_code('loadag', tmp, st)
            if len(arr):
                return (tmp, vtp, 'none', None)
            return self._load(tmp, (basetp, po_cnt + 1, []))
        if tp == 'call':
            assert vs[0][0] == 'var'
            func_name = vs[0][1]
            if func_name == 'asm':
                assert len(vs[1]) == 1 and vs[1][0][0] == 'str'
                self.add_code('asm', vs[1][0][1].decode())
                return (self.newtmp(), ('int', 0, []), 'none', None)
            args = []
            for arg in vs[1]:
                args.append(self.to_value(self.gen_expr(arg)))
            rtmp = self.newtmp()
            self.add_code('call', func_name, rtmp, args)
            return (rtmp, self.funcrets[func_name], 'none', None)
        if tp == 'subscript':
            vt, tp, rt, rf = self.gen_expr(vs[0])
            pt, _, _, _ = self.gen_expr(vs[1])
            basetp, po_cnt, arr = tp
            if arr == []:
                tmp = self.newtmp()
                tmp2 = self.newtmp()
                self.add_code('binop', '<<', tmp, pt, 0 if 1 == type_size(basetp, po_cnt - 1) else 1)
                self.add_code('binop', '+', tmp2, tmp, vt)
                return self._load(tmp2, tp)
            arro = arr[1:]
            tmp = self.newtmp()
            tmp2 = self.newtmp()
            self.add_code('binop', '*', tmp, arrsize(arro) * type_size(basetp, po_cnt), pt)
            self.add_code('binop', '+', tmp2, tmp, vt)
            if len(arro) == 0:
                return self._load(tmp2, (basetp, po_cnt + 1, []))
            return (tmp2, (basetp, po_cnt, arro), 'none', None)
        if tp == 'int':
            tmp = self.newtmp()
            self.add_code('loadi', tmp, vs[0])
            return (tmp, ('int', 0, []), 'none', None)
        if tp == 'str':
            tmp = self.newtmp()
            self.add_code('loads', tmp, vs[0])
            return (tmp, ('char', 1, []), 'none', None)
        if tp == 'unop':
            # '+', '-', '*', '&', '!'
            op = vs[0]
            vt, tp, rt, rf = self.gen_expr(vs[1])
            basetp, po_cnt, arr = tp
            if op == '+' or op == '-' or op == '!':
                tmp = self.newtmp()
                self.add_code('binop', '==' if op == '!' else op, tmp, 0, vt)
                if op == '!':
                    return (tmp, ('int', 0, []), 'none', None)
                return (tmp, (basetp, po_cnt, arr), 'none', None)
            if op == '&':
                if rt == 'pointer':
                    return (rf, (basetp, po_cnt + 1, arr), 'none', None)
                assert False
            if op == '*':
                return self._load(vt, tp)
            assert False
        assert tp == 'binop'
        op = vs[0]
        if op == ',':
            self.gen_expr(vs[1])
            return self.gen_expr(vs[2])
        if op != '=':
            l, ltp, _, _ = self.gen_expr(vs[1])
            r, rtp, _, _ = self.gen_expr(vs[2])
            lbtp, lpoc, larr = ltp
            rbtp, rpoc, rarr = rtp
            tmp = self.newtmp()
            if lpoc == 0 and larr == [] and rpoc == 0 and rarr == []:
                self.add_code('binop', op, tmp, self.cast_char_int(l, lbtp), self.cast_char_int(r, rbtp))
                return (tmp, ('int', 0, []), 'none', None)
            assert len(larr) <= 1 and len(rarr) <= 1 and (op == '+' or op == '-' or op == '==')
            if len(larr) == 1:
                lpoc += 1
                larr = []
            if len(rarr) == 1:
                rpoc += 1
                rarr = []
            if op == '+':
                if lpoc == 0:
                    l, ltp, lbtp, r, rtp, rbtp = r, rtp, rbtp, l, ltp, lbtp
                assert rpoc == 0
                tr = self.cast_char_int(r, rbtp)
                if type_size(lbtp, lpoc - 1) == 3:
                    tmp2 = self.newtmp()
                    self.add_code('binop', '<<', tmp2, tr, 1)
                    tr = tmp2
                self.add_code('binop', op, tmp, l, tr)
                return (tmp, (lbtp, lpoc, []), 'none', None)
            assert lbtp == rbtp and lpoc == rpoc
            self.add_code('binop', op, tmp, l, r)
            if type_size(lbtp, lpoc - 1) == 1 or op == '==':
                return (tmp, ('int', 0, []), 'none', None)
            tmp2 = self.newtmp()
            self.add_code('binop', '>>', tmp2, tmp, 1)
            return (tmp, ('int', 0, []), 'none', None)
        l, ltp, rt, rf = self.gen_expr(vs[1])
        r, rtp, _, _ = self.gen_expr(vs[2])
        #assert ltp == rtp
        if rt == 'var':
            self.assign(rf, ltp, r, False)
            return (r, ltp, rt, rf)
        assert rt == 'pointer'
        if type_size(*ltp) == 1:
            self.add_code('st', r, rf, -1)
        else:
            self.add_code('sw', r, rf, 0)
        return (r, ltp, rt, rf)

    def gen_stmt(self, _stmt):
        tp, *stmt = _stmt
        if tp == 'empty':
            return
        if tp == 'vardef':
            self.pushcxt()
            vtp = stmt[0]
            for po_cnt, name, array in stmt[1]:
                if len(array) == 0:
                    self.assign(name, (vtp, po_cnt, array), self.newtmp(), True)
                else:
                    offset = self.alloca(type_size(vtp, po_cnt), arrsize(array))
                    self.assign_stack(name, (vtp, po_cnt, array), offset)
            self.pushcxt()
            return
        if tp == 'block':
            o = self.pushcxt()
            self.gen_blocks(stmt[0])
            self.add_codes(self.fix_vars(o))
            self.setcxt(o)
            return
        if tp == 'if':
            req = self.gen_expr(stmt[0])
            o = self.pushcxt()
            self.pushcxt()
            if stmt[2] is None:
                label_end = self.newlabel()
                self.add_code('bez', self.to_value(req), label_end)
                self.gen_stmt(stmt[1])
                self.add_codes(self.fix_vars(o))
                self.setcxt(o + 1)
                self.add_code('label', label_end)
            else:
                label_else = self.newlabel()
                label_end = self.newlabel()
                self.add_code('bez', self.to_value(req), label_else)
                self.gen_stmt(stmt[1])
                self.add_codes(self.fix_vars(o))
                self.setcxt(o + 1)
                self.add_code('goto', label_end)
                self.add_code('label', label_else)
                self.gen_stmt(stmt[2])
                self.add_codes(self.fix_vars(o))
                self.setcxt(o + 1)
                self.add_code('label', label_end)
            return
        if tp == 'while':
            o = self.pushcxt()
            self.pushcxt()
            label_start = self.newlabel()
            label_end = self.newlabel()
            self.set_dest('break', label_end)
            self.set_dest('continue', label_start)
            self.add_code('label', label_start)
            self.pushcxt()
            req = self.gen_expr(stmt[0])
            end_fix = self.fix_vars(o)
            self.pushcxt()
            self.add_code('bez', self.to_value(req), label_end)
            self.gen_stmt(stmt[1])
            self.add_codes(self.fix_vars(o))
            self.setcxt(o + 1)
            self.add_code('goto', label_start)
            self.add_code('label', label_end)
            self.add_codes(end_fix)
            return
        if tp == 'for':
            label_start = self.newlabel()
            label_continue = self.newlabel()
            label_end = self.newlabel()
            o = self.pushcxt()
            self.pushcxt()
            o2 = self.pushcxt()
            if stmt[0] is not None:
                self.gen_expr(stmt[0])
            self.add_code('label', label_start)
            self.set_dest('break', label_end)
            self.set_dest('continue', label_continue)
            self.pushcxt()
            req = self.gen_expr(stmt[1])
            end_fix = self.fix_vars(o2)
            self.pushcxt()
            self.add_code('bez', self.to_value(req), label_end)
            self.gen_stmt(stmt[3])
            self.add_codes(self.fix_vars(o2))
            self.setcxt(o2 + 1)
            self.add_code('label', label_continue)
            self.pushcxt()
            if stmt[2] is not None:
                self.gen_expr(stmt[2])
            self.add_codes(self.fix_vars(o2))
            self.setcxt(o2 + 1)
            self.add_code('goto', label_start)
            self.add_code('label', label_end)
            self.add_codes(end_fix)
            self.add_codes(self.fix_vars(o))
            self.setcxt(o + 1)
            return
        if tp == 'return':
            o = self.pushcxt()
            self.assign('__result', ('int', 0, []), self.to_value(self.gen_expr(stmt[0])), False)
            self.add_codes(self.fix_vars(0))
            self.add_code('ret')
            self.setcxt(o + 1)
            return
        if tp == 'continue' or tp == 'break':
            t, label = self.find_dest(tp)
            self.add_codes(self.fix_vars(t))
            self.add_code('goto', label)
            return
        assert tp == 'expr'
        self.gen_expr(stmt[0])

    def gen_blocks(self, node):
        self.pushcxt()
        for stmt in node:
            self.gen_stmt(stmt)

    def gen(self):
        res = {}
        for tp, funcsig, funcbody in self.ast:
            if tp != 'func':
                continue
            rtype, po_cnt, name, args = funcsig
            self.resetcxt()
            self.pushcxt()
            self.assign('__result', (rtype, po_cnt, []), self.newtmp(), True)
            self.pushcxt()
            for atype, apo_cnt, aname, aarray in args:
                self.assign(aname, (atype, apo_cnt, aarray), self.newtmp(), True)
            self.gen_blocks(funcbody)
            res[name] = {
                'stack': self.max_alloca,
                'code': self.code,
                'argc': len(args),
            }
        return {
            'gv_size': self.gv_totsize,
            'funcs': res
        }


def codegen(ast):
    c = CodeGen(ast)
    return c.gen()


def reduce18(x):
    N = 3**18
    x = x % N
    if x > N // 2:
        x -= N
    return x


def do_trit_op(a, b, o):
    def r3(x):
        x %= 3
        return -1 if x == 2 else x

    def to_trits(x):
        res = []
        for _ in range(18):
            t = r3(x)
            res.append(t)
            x = (x - t) // 3
        assert x == 0
        return res[::-1]

    def from_trits(s):
        res = 0
        for t in s:
            res = res * 3 + t
        return res

    def bitfunc(a, b):
        if o == '^':
            return r3(a + b)

        def chain(x, y, z):
            if a == z or b == z:
                return z
            if a == y or b == y:
                return y
            return x
        if o == '|':
            return chain(-1, 0, 1)
        if o == '||':
            return chain(0, -1, 1)
        if o == '|||':
            return chain(0, 1, -1)
        if o == '&':
            return chain(1, 0, -1)
        if o == '&&':
            return chain(1, -1, 0)
        if o == '&&&':
            return chain(-1, 1, 0)
        if a == 0:
            return b
        if b == 0:
            return a
        if a == b:
            return 0
        if o == '^^':
            return 1
        return -1
    return from_trits(map(bitfunc, to_trits(a), to_trits(b)))


def optimize(code, argc):
    code = code[:]
    precalc_ops = {
        '*', '<', '<=', '>', '>=', '==', '!=',
        '^', '^^', '^^^', '|', '||', '|||', '&', '&&', '&&&',
        '<<', '>>',
    }
    trit_op = {'^', '^^', '^^^', '|', '||', '|||', '&', '&&', '&&&'}

    assigned = set()
    vars = {}
    scope = {}
    scope_insn = []
    scope_cnt = 0
    for i in range(argc):
        scope['t' + str(i + 1)] = 0
    for i in range(len(code)):
        scope_insn.append(scope_cnt)
        op, *insn = code[i]
        if op == 'asm':
            continue
        if op == 'goto' or op == 'label' or op == 'ret' or op == 'bez':
            scope_cnt += 1
            continue
        if op == 'assign':
            scope[insn[0]] = -i - 1
            assigned.add(insn[0])
            continue
        if op == 'loadi':
            vars[insn[0]] = ('int', insn[1])
            scope[insn[0]] = scope_cnt
            continue
        if op == 'loadas':
            code[i] = ('binop', '+', insn[0], 'sp', insn[1])
            op, *insn = code[i]
        if op == 'loads' or op == 'loadag':
            vars[insn[0]] = ('', None)
            scope[insn[0]] = scope_cnt
            continue
        if op == 'lw' or op == 'lt':
            vars[insn[0]] = ('', None)
            scope[insn[0]] = scope_cnt
            continue
        if op == 'sw' or op == 'st':
            continue
        if op == 'call':
            vars[insn[1]] = ('', None)
            scope[insn[1]] = scope_cnt
            continue
        assert op == 'binop'
        t = insn[0]
        if t == '+' or t == '-' or t in precalc_ops:
            vars[insn[1]] = (t, insn[2], insn[3])
        else:
            vars[insn[1]] = ('', None)
        scope[insn[1]] = scope_cnt
    for x in assigned:
        vars[x] = ('', None)

    def isint(x):
        if type(x) is int:
            return True
        return x in vars and vars[x][0] == 'int' and x not in assigned

    def gint(x):
        if type(x) is int:
            return x
        return vars[x][1]

    def getvarpint(x):
        if x[0] == '+':
            if x[1] is int and x[2] is str:
                return (x[2], x[1])
            if x[2] is int and x[1] is str:
                return (x[1], x[2])
        elif x[0] == '-':
            if x[2] is int and x[1] is str:
                return (x[1], -x[2])
        return None

    def isvarpint(x, n):
        t = getvarpint(x)
        if t is None:
            return False
        if type(n) is str:
            ts = scope[n]
        else:
            ts = scope_insn[n]
        if t[0] != 'sp' and ts != scope[t[0]]:
            return False
        return True

    def check_scope(x, n):
        _, a, b = vars[x]
        return (type(a) is int or a == 'sp' or scope[a] == scope_insn[n]) \
            and (type(b) is int or b == 'sp' or scope[b] == scope_insn[n])

    # print(vars)
    while True:
        print('optimize pass')
        flag = False
        for name, (t, *u) in list(vars.items()):
            if name in assigned or t == 'int' or t == '':
                continue
            nu = list(u)
            for j in range(2):
                if isint(u[j]):
                    nu[j] = gint(u[j])
            if nu != list(u):
                vars[name] = (t, *nu)
                flag = True
            if isint(u[0]) and isint(u[1]):
                if t == '<<' or t == '>>':
                    assert t != '>>'
                    vars[name] = ('int', reduce18(gint(u[0]) * 3**gint(u[1])))
                elif t in trit_op:
                    vars[name] = ('int', do_trit_op(gint(u[0]), gint(u[1]), t))
                else:
                    vars[name] = ('int', reduce18(int(eval('%d%c%d' % (gint(u[0]), t, gint(u[1]))))))
                flag = True
            elif t == '+':
                if isint(u[0]) and isvarpint(u[1], name):
                    x, y = getvarpint(u[1])
                    vars[name] = ('+', x, reduce18(gint(u[0]) + y))
                    flag = True
                elif isint(u[1]) and isvarpint(u[0], name):
                    x, y = getvarpint(u[0])
                    vars[name] = ('+', x, reduce18(gint(u[1]) + y))
                    flag = True
            elif t == '-':
                if isint(u[1]) and isvarpint(u[0], name):
                    x, y = getvarpint(u[0])
                    vars[name] = ('+', x, reduce18(y - gint(u[1])))
                    flag = True
        if not flag:
            break

    used = {'t0'}
    edges = []

    for i in range(len(code)):
        op, *insn = code[i]
        if op == 'asm':
            continue
        if op == 'bez':
            op_r = {
                '-': 'eq',
                '<=': 'lt',
                '>=': 'lt',
                '==': 'ne',
                '!=': 'eq',
            }
            if vars[insn[0]][0] == 'int':
                code[i] = ('branch', 'eq', gint(insn[0]), 0, insn[1])
            elif vars[insn[0]][0] in op_r and check_scope(insn[0], i):
                a, b, c = vars[insn[0]]
                if a == '<=':
                    b, c = c, b
                code[i] = ('branch', op_r[a], b, c, insn[1])
                if type(b) is str:
                    used.add(b)
                if type(c) is str:
                    used.add(c)
            else:
                used.add(insn[0])
                code[i] = ('branch', 'eq', insn[0], 0, insn[1])
            continue
        if op == 'goto' or op == 'label' or op == 'ret':
            continue
        if op == 'assign':
            edges.append((insn[0], insn[1]))
            continue
        if op == 'loadi' or op == 'loads' or op == 'loadag':
            continue
        if op == 'lw' or op == 'lt' or op == 'sw' or op == 'st':
            if isvarpint(insn[1], i):
                x, y = getvarpint(insn[1])
                insn = (insn[0], x, reduce18(y + insn[2]))
                code[i] = (op, *insn)
        if op == 'lw' or op == 'lt':
            edges.append((insn[0], insn[1]))
            continue
        if op == 'sw' or op == 'st':
            used.add(insn[0])
            used.add(insn[1])
            continue
        if op == 'call':
            for v in insn[2]:
                edges.append((insn[1], v))
            used.add(insn[1])
            continue
        assert op == 'binop'
        if vars[insn[1]][0] == 'int':
            code[i] = ('loadi', insn[1], vars[insn[1]][1])
            continue
        if vars[insn[1]][0] != '':
            a, b, c = vars[insn[1]]
            code[i] = ('binop', a, insn[1], b, c)
            op, *insn = code[i]
        for i in range(2, 4):
            if type(insn[i]) is str:
                if 0 and isint(insn[i]):
                    insn = list(insn)
                    insn[i] = gint(insn[i])
                    insn = tuple(insn)
                    code[i] = op, *insn
                else:
                    edges.append((insn[1], insn[i]))

    print('len edges:', len(edges))

    edge_u = {}
    for x, y in edges:
        if x not in edge_u:
            edge_u[x] = []
        edge_u[x].append(y)
    q = list(used)
    i = 0
    while i < len(q):
        if q[i] in edge_u:
            for y in edge_u[q[i]]:
                if y not in used:
                    q.append(y)
                    used.add(y)
        i += 1

    res_code = []

    for op, *insn in code:
        if op == 'asm':
            pass
        elif op == 'goto' or op == 'label' or op == 'ret' or op == 'branch':
            pass
        elif op == 'assign':
            if insn[0] not in used:
                continue
        elif op == 'loadi':
            if insn[0] not in used:
                continue
        elif op == 'loads' or op == 'loadas' or op == 'loadag':
            if insn[0] not in used:
                continue
        elif op == 'lw' or op == 'lt':
            if insn[0] not in used:
                continue
        elif op == 'sw' or op == 'st':
            pass
        elif op == 'call':
            pass
        else:
            assert op == 'binop'
            if insn[1] not in used:
                continue
        res_code.append((op, *insn))
    return res_code


def asmgen(code, argc, stackarr_size, func_name):
    n = len(code)
    edges = [[]for _ in range(n + 1)]
    edges_r = [[]for _ in range(n + 1)]

    def adde(x, y):
        edges[x].append(y)
        edges_r[y].append(x)

    labels = {}
    for i, (op, *insn) in enumerate(code):
        if op == 'label':
            labels[insn[0]] = i
    for i, (op, *insn) in enumerate(code):
        if op == 'goto':
            adde(i, labels[insn[0]] + 1)
            continue
        elif op == 'branch':
            adde(i, labels[insn[3]] + 1)
        elif op == 'ret':
            continue
        adde(i, i + 1)

    exist = [set() for _ in range(n + 1)]
    require = [set() for _ in range(n + 1)]

    for i in range(argc):
        exist[0].add('t%d' % (i + 1))

    for i, (op, *insn) in enumerate(code):
        if op == 'asm':
            pass
        elif op == 'goto' or op == 'label':
            pass
        elif op == 'ret':
            require[i].add('t0')
        elif op == 'branch':
            for j in range(1, 3):
                if type(insn[j]) is not int:
                    require[i].add(insn[j])
        elif op == 'assign':
            exist[i + 1].add(insn[0])
            require[i].add(insn[1])
        elif op == 'loadi' or op == 'loads' or op == 'loadag':
            exist[i + 1].add(insn[0])
        elif op == 'lw' or op == 'lt':
            exist[i + 1].add(insn[0])
            require[i].add(insn[1])
        elif op == 'sw' or op == 'st':
            require[i].add(insn[0])
            require[i].add(insn[1])
        elif op == 'call':
            exist[i + 1].add(insn[1])
            for x in insn[2]:
                require[i].add(x)
        else:
            assert op == 'binop'
            exist[i + 1].add(insn[1])
            for j in range(2, 4):
                if type(insn[j]) is not int:
                    require[i].add(insn[j])

    def spread(s, o, e):
        s2 = []
        for i in range(n + 1):
            t = set()
            for x in s[i]:
                if x != 'sp':
                    t.add(x)
            s2.append(t)
        s = s2
        q = []
        for i in range(n + 1):
            for x in s[i]:
                q.append((i, x))
        i = 0
        while i < len(q):
            j, x = q[i]
            i += 1
            if x in o[j]:
                continue
            for k in e[j]:
                if x not in s[k]:
                    s[k].add(x)
                    q.append((k, x))
        return s

    vars = spread(require, exist, edges_r)
    usecnt = {}
    print('var spread done')

    for i in range(n + 1):
        vars[i] = {x: True for x in vars[i]}
        for x in list(require[i]) + list(exist[i]):
            if x not in usecnt:
                usecnt[x] = 0
            usecnt[x] += 1

    while True:
        print('reduce reg vars')
        flag = True
        ot = {}
        for i in range(n + 1):
            cnt = 0
            for x, y in vars[i].items():
                cnt += int(y)
            if cnt > 21:
                flag = False
                for x, y in vars[i].items():
                    if not y:
                        continue
                    if x not in ot:
                        ot[x] = 0
                    ot[x] += 1
        if flag:
            break
        if n < 10000:
            best = 1e9
            pos = None
            for x, y in ot.items():
                cost = usecnt[x] / y
                if cost < best and x not in exist[0]:
                    best = cost
                    pos = x
            assert pos is not None
            for i in range(n + 1):
                if pos in vars[i]:
                    vars[i][pos] = False
        else:
            uu = []
            for x, y in ot.items():
                cost = usecnt[x] / y
                if x not in exist[0]:
                    uu.append((cost, x))
            uu.sort()
            print('uu size:', len(uu))
            uus = {x for _, x in uu[:(len(uu) + 1) // 5]}
            for i in range(n + 1):
                t = vars[i]
                for x in t:
                    if x in uus:
                        t[x] = False
    print('reduce done')

    regs = ['a' + str(i)for i in range(8)] + ['t' + str(i)for i in range(6)] + ['s' + str(i)for i in range(8)]
    tmps = ['t' + str(i)for i in range(6, 8)]

    var_index = {}
    for i in range(n + 1):
        for x in vars[i]:
            if x not in var_index:
                var_index[x] = []
            var_index[x].append(i)

    def usable_regs(i):
        r = set()
        for x, y in vars[i].items():
            if type(y) is tuple:
                r.add(y[1])
        return set(regs) - r

    def used_mems(i):
        r = set()
        for x, y in vars[i].items():
            if type(y) is tuple and not y[0]:
                r.add(y[1])
        return r

    def assign_reg(varname, reg=None):
        if reg is not None:
            for i in var_index[varname]:
                if vars[i][varname] == True:
                    vars[i][varname] = (True, reg)
            return

        def alloc(l, r, s):
            t = 0
            while regs[t]not in s:
                t += 1
            t = regs[t]
            # for i in range(l, r):
            for i in var_index[varname]:
                if i >= l and i < r and vars[i][varname] == True:
                    vars[i][varname] = (True, t)
        last_usable = set(regs)
        last = -1
        for i in var_index[varname]:
            if vars[i][varname] == True:
                cur = usable_regs(i)
                assert len(cur) != 0
                nxt = last_usable & cur
                if len(nxt) == 0:
                    alloc(last + 1, i + 1, last_usable)
                    last = i
                    last_usable = cur
                else:
                    last_usable = nxt
        alloc(last + 1, n + 1, last_usable)

    stack_size = stackarr_size

    def assign_mem(varname):
        nonlocal stack_size
        used = set()
        for i in var_index[varname]:
            if vars[i][varname] == False:
                used |= used_mems(i)
        t = stackarr_size
        while t in used:
            t += 3
        stack_size = max(stack_size, t + 3)
        for i in var_index[varname]:
            if varname in vars[i] and vars[i][varname] == False:
                vars[i][varname] = (False, t)

    for i in range(argc):
        if 't' + str(i + 1) in var_index:
            assign_reg('t' + str(i + 1), 'a' + str(i))
    rcnt = {}
    mtmp = set()
    for i in range(n + 1):
        for x, y in vars[i].items():
            if y == True:
                if x not in rcnt:
                    rcnt[x] = 0
                rcnt[x] += 1
            elif y == False:
                mtmp.add(x)
    rtmp = sorted((-y, x)for x, y in rcnt.items())
    print('start assigning')
    tcnt = 0
    for _, x in rtmp:
        assign_reg(x)
        tcnt += 1
        if tcnt % 1000 == 0:
            print('progress: %d/%d' % (tcnt, len(rtmp)))
    print('assign reg done')
    tcnt = 0
    for x in mtmp:
        assign_mem(x)
        tcnt += 1
        if tcnt % 1000 == 0:
            print('progress: %d/%d' % (tcnt, len(mtmp)))
    print('assign mem done')
    all_regs = set()
    for i in range(n + 1):
        for x, (y, z) in vars[i].items():
            if y:
                all_regs.add(z)

    pad_enter = []
    pad_leave = []
    for i in range(8):
        r = 's' + str(i)
        if r in all_regs:
            pad_enter.append(('sw', r, 'sp', stack_size))
            pad_leave.append(('lw', r, 'sp', stack_size))
            stack_size += 3

    res = pad_enter

    def fix_regs(i, j):
        if type(i) is int:
            a = vars[i]
        else:
            a = i
        if type(j) is int:
            b = vars[j]
        else:
            b = j
        mvs = []
        for x in sorted(set(a) & set(b)):
            if a[x][0]:
                if a[x][1] != b[x][1]:
                    mvs.append((b[x][1], a[x][1]))
            else:
                assert a[x] == b[x]
        res = []
        while len(mvs):
            o = set()
            for i in range(len(mvs)):
                o.add(mvs[i][1])
            pos = None
            for i in range(len(mvs)):
                if mvs[i][0] not in o:
                    pos = i
                    break
            if pos is not None:
                t = mvs.pop(pos)
                res.append(('mv', t[0], t[1]))
                continue
            t = tmps[0]
            res.append(('mv', t, mvs[0][1]))
            mvs[0] = (mvs[0][0], t)
        return res

    def load_var(x, reg, forced=False):
        if x[0]:
            if not forced or reg == x[1]:
                return x[1], []
            return reg, [('mv', reg, x[1])]
        return reg, [('lw', reg, 'sp', x[1])]

    def save_var(x, reg):
        if x[0]:
            if x[1] != reg:
                return [('mv', x[1], reg)]
            return []
        return [('sw', reg, 'sp', x[1])]

    def get_var(x, reg):
        if x[0]:
            return x[1]
        return reg

    def load_vari(x, i, reg):
        if x == 'sp':
            return 'sp', []
        if type(x) is int:
            return reg, [('li', reg, x)]
        return load_var(vars[i][x], reg)

    def getpow3(x):
        if type(x) is not int:
            return None
        r = 0
        while x != 1:
            if x % 3:
                return None
            x //= 3
            r += 1
        return r

    def ispow3(x):
        return getpow3(x) is not None

    # for i in range(n + 1):
    #    print(vars[i])
    #    if i < n:
    #        print(*code[i])

    max_call_stack = 0
    called = False

    for i, (op, *insn) in enumerate(code):
        if op == 'asm':
            res.append((insn[0],))
        elif op == 'label':
            res.append(('label', '_' + func_name + '_' + insn[0]))
        elif op == 'goto':
            res += fix_regs(i, labels[insn[0]] + 1)
            res.append(('j', '_' + func_name + '_' + insn[0]))
        elif op == 'ret':
            _, t = load_var(vars[i]['t0'], 'a0', True)
            res += t
            res += pad_leave
            res.append(('ret',))
        elif op == 'branch':
            va = vars[labels[insn[3]] + 1]
            vb = vars[i + 1]
            vall = {}
            ur = set()
            for x in set(va) | set(vb):
                if x in va and x in vb:
                    assert va[x] == vb[x]  # maybe this can be different
                if x in va:
                    vall[x] = va[x]
                else:
                    vall[x] = vb[x]
                if vall[x][0]:
                    ur.add(vall[x][1])
            ur = set(regs) - ur
            for j in range(1, 3):
                if type(insn[j]) is str and insn[j] not in vall:
                    t = vars[i][insn[j]]
                    if t[0] and t[1] in ur:
                        t = t[1]
                        ur.remove(t)
                    else:
                        t = ur.pop()
                    vall[insn[j]] = (True, t)
            res += fix_regs(i, vall)
            rt = []
            for j in range(1, 3):
                if type(insn[j]) is str:
                    r, t = load_var(vall[insn[j]], tmps[j - 1])
                    rt.append(r)
                    res += t
                elif insn[j] == 0:
                    rt.append('zero')
                else:
                    res.append(('li', tmps[j - 1], insn[j]))
                    rt.append(tmps[j - 1])
            res.append(('b' + insn[0], rt[0], rt[1], '_' + func_name + '_' + insn[3]))
        elif op == 'assign':
            if insn[0] in vars[i + 1]:
                a = vars[i][insn[1]]
                b = vars[i + 1][insn[0]]
                if a[0]:
                    tr = a[1]
                else:
                    tr, t = load_var(a, tmps[0])
                    res += t
                res += save_var(b, tr)
        elif op == 'loadi':
            tr = get_var(vars[i + 1][insn[0]], tmps[0])
            res.append(('li', tr, insn[1]))
            res += save_var(vars[i + 1][insn[0]], tr)
        elif op == 'loads' or op == 'loadag':
            tr = get_var(vars[i + 1][insn[0]], tmps[0])
            res.append((op, tr, insn[1]))
            res += save_var(vars[i + 1][insn[0]], tr)
        elif op == 'lw' or op == 'lt':
            tr, t = load_var(vars[i][insn[1]], tmps[0])
            res += t
            tr2 = get_var(vars[i + 1][insn[0]], tmps[1])
            res.append((op, tr2, tr, insn[2]))
            res += save_var(vars[i + 1][insn[0]], tr2)
        elif op == 'sw' or op == 'st':
            tr, t = load_var(vars[i][insn[1]], tmps[0])
            res += t
            tr2, t = load_var(vars[i][insn[0]], tmps[1])
            res += t
            res.append((op, tr2, tr, insn[2]))
        elif op == 'call':
            called = True
            sregs = []
            for x in set(vars[i]) & set(vars[i + 1]):
                if vars[i][x][0] and not vars[i][x][1].startswith('s'):
                    sregs.append(vars[i][x][1])
            sregs.sort()
            max_call_stack = max(max_call_stack, len(sregs) * 3)
            for j, x in enumerate(sregs):
                res.append(('sw', x, 'sp', stack_size + j * 3))
            loadmem = []
            rtmp = {}
            for j, x in enumerate(insn[2]):
                t = vars[i][x]
                if not t[0]:
                    loadmem.append(('a' + str(j), t))
                else:
                    rtmp[x] = (True, 'a' + str(j))
            res += fix_regs(i, rtmp)
            for r, v in loadmem:
                _, t = load_var(v, r, True)
                res += t
            res.append(('jal', insn[0]))
            if insn[1] in vars[i + 1]:
                res += save_var(vars[i + 1][insn[1]], 'a0')
            for j, x in enumerate(sregs):
                res.append(('lw', x, 'sp', stack_size + j * 3))
        else:
            assert op == 'binop'
            if insn[1] not in vars[i + 1]:
                continue
            swappable = {'==', '!=', '+', '*', '^', '^^', '^^^', '|', '||', '|||', '&', '&&', '&&&'}
            op_asm = {
                '<': 'slt',
                '>=': 'slt',
                '==': 'seq', '!=': 'sne',
                '<<': 'sll', '>>': 'srl',
                '+': 'add', '-': 'sub', '*': 'mul', '**': 'mulh',
                '^': 'xor', '^^': 'xor.1', '^^^': 'xor.T',
                '|': 'or', '||': 'or.1', '|||': 'or.T',
                '&': 'and', '&&': 'and.1', '&&&': 'and.T',
            }
            if insn[0] in swappable and type(insn[2]) is int:
                insn[2], insn[3] = insn[3], insn[2]
            if insn[0] == '>' or insn[0] == '<=':
                insn[2], insn[3] = insn[3], insn[2]
                insn[0] = '<' if insn[0] == '>' else '>='
            r1, t = load_vari(insn[2], i, tmps[0])
            res += t
            rr = get_var(vars[i + 1][insn[1]], tmps[0])
            ge_fix = []
            if insn[0] == '>=':
                ge_fix.append(('seq', rr, rr, 'zero'))
            if insn[0] == '|' or insn[0] == '&&&':
                gadd = (-13,)
            elif insn[0] == '&' or insn[0] == '&&':
                gadd = (13,)
            else:
                gadd = ()
            if insn[0] == '*' and ispow3(insn[3]):
                insn = ('<<', insn[1], insn[2], getpow3(insn[3]))
            if type(insn[3]) is int and abs(insn[3]) <= 364 and insn[0] != '*':
                if insn[0] == '-':
                    insn[0] = '+'
                    insn[3] = -insn[3]
                opt = op_asm[insn[0]]
                if '.' in opt:
                    opt = opt.replace('.', 'i.')
                else:
                    opt = opt + 'i'
                res.append((opt, rr, r1, insn[3]))
                res += ge_fix
                res += save_var(vars[i + 1][insn[1]], rr)
            else:
                r2, t = load_vari(insn[3], i, tmps[1])
                res += t
                res.append((op_asm[insn[0]], rr, r1, r2, *gadd))
                res += ge_fix
                res += save_var(vars[i + 1][insn[1]], rr)

    stack_size += max_call_stack
    if called:
        stack_size += 3
    if stack_size != 0:
        if stack_size <= 364:
            res2 = [('addi', 'sp', 'sp', -stack_size)]
            retx = [('addi', 'sp', 'sp', stack_size)]
        else:
            res2 = [('li', 't7', stack_size), ('sub', 'sp', 'sp', 't7')]
            retx = [('li', 't7', stack_size), ('add', 'sp', 'sp', 't7')]
        if called:
            res2 = [('sw', 'ra', 'sp', -3)] + res2
            retx += [('lw', 'ra', 'sp', -3)]
        for insn in res:
            if insn[0] == 'ret':
                res2 += retx
            res2.append(insn)
        res = res2

    return res


if __name__ == '__main__':
    fn = sys.argv[1]
    fno = sys.argv[2]
    os.system('gcc -E -o __tmp.c %s' % fn)
    code = open('__tmp.c', 'r').read()
    tokens = tokenize(code)
    # print(tokens)
    ok, ast = parse(tokens)
    # print(ast)
    tc = codegen(ast)
    # print(tc)

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
    open(fno, 'w').write('\n'.join(res))
