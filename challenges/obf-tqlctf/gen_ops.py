import subprocess

seed = 11490173186511


def get(ustr, v):
    global seed
    res = []
    for i in range(200):
        seed += 1
        t = subprocess.getoutput('./gen_op %d a b c d %s' % (seed, v)).strip()
        res.append('#define %s_%d(a,b,c,d) %s' % (ustr, i, t))
    return '\n'.join(res)


s = [
    get('gadd', '1 1 0 0 0 0'),
    get('gxor', '0 0 1 0 0 0'),
    get('gand1', '0 0 0 1 0 0'),
    get('gor', '0 0 0 0 1 0'),
    get('gxorT', '0 0 0 0 0 1'),
]
open('ops.h', 'w').write('\n\n'.join(s))
