c = 0
r = []
for i in range(8):
    t = []
    for j in range(20):
        t.append(c)
        c += 1
    r.append('  encrypt_round(%s, %s);' % (i, ', '.join(map(str, t))))
print('\n'.join(r))
