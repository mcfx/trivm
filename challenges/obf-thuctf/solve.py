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
s = [
    -10383934, -5276999, -18683711,
    44382, 2402453, -9335978,
    -16896976, 13820279, 13665339,
    19631704, -18002943, -18303780
]
u = []
for i in range(0, len(s), 3):
    t = decrypt(*s[i:i + 3], keys)
    for x in t:
        u.append(x // 256**2)
        u.append(x // 256 % 256)
        u.append(x % 256)
print(bytes(u))
