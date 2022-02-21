import random
s = list(map(int, open('flist.txt').read().split()))
flag = b'm4trIx_p0wEr___4nd_wa15h_Tr4nsf0rm'
assert len(flag) == len(s) * 2


def reduce(x, y):
    return (x + y // 2) % y - y // 2


def mod256(x):
    if x < 0:
        x = -x
    return x % 256


a = 3**18
b = 3**9

for i in range(17):
    while True:
        x = reduce(random.randint(0, a), a)
        v = reduce(x + s[i], a)
        t = reduce(v, b)
        u = (v - t) // b
        t *= b
        if mod256(u) == flag[i * 2] and mod256(t) == flag[i * 2 + 1]:
            break
    print('v[%d]=%d;' % (i, x))
    #print('//', u, t)
