import random

M = 3**18
M2 = M // 2


def reduce(x):
    return (x + M2) % M - M2


def addmod(x, y):
    return reduce(x + y)


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


def xor(a, b):
    return from_trits(map(lambda x, y: r3(x + y), to_trits(a), to_trits(b)))


def or1(a, b):
    def foo(x, y):
        if x == 1 or y == 1:
            return 1
        if x == 0 or y == 0:
            return 0
        return -1
    return from_trits(map(foo, to_trits(a), to_trits(b)))


def and2(a, b):
    def foo(x, y):
        if x == 0 or y == 0:
            return 0
        if x == -1 or y == -1:
            return -1
        return 1
    return from_trits(map(foo, to_trits(a), to_trits(b)))


def xor3(a, b):
    def foo(x, y):
        if x == 0:
            return y
        if y == 0:
            return x
        if x == y:
            return 0
        return -1
    return from_trits(map(foo, to_trits(a), to_trits(b)))


def iget(x, k):
    a = xor(x, k[6])
    b = addmod(x, k[7])
    c = and2(a, b)
    d = xor3(a, b)
    e = addmod(c, k[8])
    f = xor(d, k[9])
    g = or1(e, f)
    return addmod(xor(b, e), g)


def encrypt_round(x, y, z, k):
    x = addmod(xor(addmod(x, k[0]), k[1]), k[2])
    y = addmod(xor(y, k[3]), k[4])
    z = addmod(z, k[5])
    p = iget(xor(xor(x, y), z), k)
    return xor(x, p), xor(y, p), xor(z, p)


def decrypt_round(x, y, z, k):
    p = iget(xor(xor(x, y), z), k)
    x, y, z = xor(xor(x, p), p), xor(xor(y, p), p), xor(xor(z, p), p)
    x = addmod(xor(addmod(x, -k[2]), xor(k[1], k[1])), -k[0])
    y = xor(addmod(y, -k[4]), xor(k[3], k[3]))
    z = addmod(z, -k[5])
    return x, y, z


def key_gen():
    r = []
    for _ in range(10):
        x = random.randint(-M2, M2)
        r.append(x)
    return r


def encrypt(x, y, z, ks):
    for i in range(len(ks)):
        x, y, z = encrypt_round(x, y, z, ks[i])
        # print('#', x, y, z)
    return x, y, z


def decrypt(x, y, z, ks):
    for i in range(len(ks) - 1, -1, -1):
        # print('#', x, y, z)
        x, y, z = decrypt_round(x, y, z, ks[i])
    return x, y, z


random.seed(124629361246923652831929391624981689462049184017489326896219835)
keys = [key_gen()for _ in range(8)]
if 1:
    for x, y, z in [
        (61101153, 135461653, 137064784),
        (85530621, -174382741, 7581309),
        (17193688, -24086902, 164919797),
        (-118079291, 189168511, -171475695),
    ]:
        x, y, z = decrypt(x, y, z, keys)
        print(bytes([x % 729, x // 729 % 729, x // 729**2, y % 729, y // 729 % 729, y // 729**2, z % 729, z // 729 % 729, z // 729**2]))
    exit()
fk = open('key.c', 'w')
for i in range(8):
    for j in range(10):
        fk.write('#define key%d%d %d\n' % (i, j, keys[i][j]))
fk.close()
fi = open('in.txt', 'w')
fo = open('out.txt', 'w')
for k in keys:
    fi.write(' '.join(map(str, k)) + '\n')
for _ in range(100):
    if 1:
        x = random.randint(-M2, M2)
        y = random.randint(-M2, M2)
        z = random.randint(-M2, M2)
        print(x, y, z)
    else:
        x, y, z = map(int, input().split())
    fi.write('%d %d %d\n' % (x, y, z))
    x2, y2, z2 = encrypt(x, y, z, keys)
    print(x2, y2, z2)
    fo.write('%d %d %d\n' % (x2, y2, z2))
    x3, y3, z3 = decrypt(x2, y2, z2, keys)
    assert x3 == x and y3 == y and z3 == z
    #print(*encrypt(x2, y2, z2, keys))
fi.close()
fo.close()
