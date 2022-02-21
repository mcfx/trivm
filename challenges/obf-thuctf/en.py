from gmpy2 import invert, gcd
import random

M = 3**18
M2 = M // 2
C = 3**16 - 2
assert C == 43046719
C2 = C // 2


def reduce(x):
    return (x + M2) % M - M2


def reduceC(x):
    return (x + C2) % C - C2


def invC(x):
    return reduceC(int(invert(x, C)))


def addmodC(x, y):
    return reduceC(x + y)


def mulmodC(x, y):
    return reduceC(x * y)


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


def iget(x, k):
    a = mulmodC(x, k[4])
    b = xor(x, k[5])
    c = addmodC(a, b)
    d = mulmodC(c, k[6])
    e = xor(b, d)
    f = mulmodC(e, k[7])
    g = addmodC(d, f)
    return addmodC(g, k[8])


def encrypt_round(x, y, z, k):
    x = mulmodC(x, k[0])
    y = addmodC(y, k[1])
    z = addmodC(mulmodC(z, k[2]), k[3])
    #print('===', x, y, z)
    p = iget(xor(xor(x, y), z), k)
    return xor(x, p), xor(y, p), xor(z, p)


def decrypt_round(x, y, z, k):
    p = iget(xor(xor(x, y), z), k)
    x, y, z = xor(xor(x, p), p), xor(xor(y, p), p), xor(xor(z, p), p)
    x = mulmodC(x, invC(k[0]))
    y = addmodC(y, -k[1])
    z = mulmodC(addmodC(z, -k[3]), invC(k[2]))
    return x, y, z


def key_gen():
    r = []
    ni = [0, 2, 4, 6, 7]
    for i in range(9):
        while True:
            x = random.randint(-C2, C2)
            if i not in ni or gcd(abs(x), C) == 1:
                break
        r.append(x)
    return r


def encrypt(x, y, z, ks):
    for i in range(len(ks)):
        x, y, z = encrypt_round(x, y, z, ks[i])
        print('#', x, y, z)
    return x, y, z


def decrypt(x, y, z, ks):
    for i in range(len(ks) - 1, -1, -1):
        x, y, z = decrypt_round(x, y, z, ks[i])
    return x, y, z


while 0:
    x, y = map(int, input().split())
    print(mulmodC(x, y))

random.seed(1112470141242352353425394598236597832659233284523875432978569873246598236549823458923465879324587623465)
keys = [key_gen()for _ in range(8)]
fk = open('key.c', 'w')
for i in range(8):
    for j in range(9):
        fk.write('#define KEY_%d_%d %d\n' % (i, j, keys[i][j]))
fk.close()
fi = open('in.txt', 'w')
fo = open('out.txt', 'w')
for k in keys:
    fi.write(' '.join(map(str, k)) + '\n')
for _ in range(100):
    if 0:
        x = random.randint(-C2, C2)
        y = random.randint(-C2, C2)
        z = random.randint(-C2, C2)
        print(x, y, z)
    else:
        x, y, z = map(int, input().split())
    fi.write('%d %d %d\n' % (x, y, z))
    x2, y2, z2 = encrypt(x, y, z, keys)
    print(x2, y2, z2)
    fo.write('%d %d %d\n' % (x2, y2, z2))
    #print(*encrypt(x2, y2, z2, keys))
fi.close()
fo.close()
