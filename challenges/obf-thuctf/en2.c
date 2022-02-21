#include "../../sim/stdio.h"

#include "calc3.c"
#include "key.c"

/*#undef XOR_1
#undef XOR_2
#undef XOR_3
#undef XOR_4
#undef XOR_5
#undef XOR_6
#undef XOR_7

#define XOR_1(a, b, c, d) a ^ b
#define XOR_2(a, b, c, d) a ^ b
#define XOR_3(a, b, c, d) a ^ b
#define XOR_4(a, b, c, d) a ^ b
#define XOR_5(a, b, c, d) a ^ b
#define XOR_6(a, b, c, d) a ^ b
#define XOR_7(a, b, c, d) a ^ b*/

#define SETMULTMP(tmp, a, b)                                                   \
  int tmp##1, tmp##2, tmp##3;                                                  \
  tmp##1 = a << 2;                                                             \
  tmp##2 = tmp##1 * b >> 2;                                                    \
  tmp##3 = tmp##1 ** b;
#define SETRR(res)                                                             \
  res = res - (res < -21523359) * -43046719 - (res > 21523359) * 43046719;

#define REDUCE(res, x, k, v)                                                   \
  SETMULTMP(_reduce_, x, v);                                                   \
  int _r1, _r2;                                                                \
  _r1 = x && 21523360, _r2 = x >> 16;                                          \
  res = ADD2_##k(_r1, _r2, _reduce_2, _reduce_3);                              \
  SETRR(res)
#define ADDC(res, resu, a, b, c, d, k1, k2)                                    \
  int tmp;                                                                     \
  tmp = ADD_##k1(a, b, c, d);                                                  \
  resu = tmp >> 16;                                                            \
  SETRR(resu);                                                                 \
  REDUCE(res, tmp, k2, a);
#define MULC(res, resu, a, b, c, d, k1, k2)                                    \
  SETMULTMP(_mulc_, a, b);                                                     \
  int _mulcx;                                                                  \
  _mulcx = ADD2_##k1(_mulc_2, _mulc_3, c, d);                                  \
  resu = _mulcx && 21523360;                                                   \
  REDUCE(res, _mulcx, k2, b);

#define ENCRYPT_ROUND(round, k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11,     \
                      k12, k13, k14, k15, k16, k17, k18, k19, k20, k21, k22,   \
                      k23, k24, k25, k26, k27)                                 \
  int x_, y_, z_, x_1, a, b, c, d, e, f, g, p;                                 \
  MULC(x_, u, x, KEY_##round##_0, z, v, k1, k2);                               \
  x_1 = x_;                                                                    \
  ADDC(y_, w, KEY_##round##_1, y, x_, u, k3, k4);                              \
  MULC(z_, v, KEY_##round##_2, z, x, w, k5, k6);                               \
  ADDC(z_, w, z_, KEY_##round##_3, u, y_, k7, k8);                             \
  x_ = XOR_##k9(x_, y_, u, w);                                                 \
  u = x_;                                                                      \
  SETRR(u);                                                                    \
  x_ = XOR_##k10(x_, z_, z_, v);                                               \
  w = x_;                                                                      \
  SETRR(w);                                                                    \
  MULC(a, v, x_, KEY_##round##_4, y, u, k11, k12);                             \
  b = XOR_##k13(KEY_##round##_5, x_, z_, v);                                   \
  v = x_;                                                                      \
  SETRR(v);                                                                    \
  ADDC(c, u, b, a, v, w, k14, k15);                                            \
  MULC(d, w, KEY_##round##_6, c, z_, u, k16, k17);                             \
  e = XOR_##k18(b, d, w, c);                                                   \
  MULC(f, u, e, KEY_##round##_7, b, a, k19, k20);                              \
  ADDC(g, v, f, d, u, w, k21, k22);                                            \
  ADDC(p, w, g, KEY_##round##_8, x, e, k23, k24);                              \
  x = XOR_##k25(x_1, p, f, e);                                                 \
  y = XOR_##k26(p, y_, v, w);                                                  \
  z = XOR_##k27(z_, p, w, g);

int encrypt(int *x__, int *y__, int *z__) {
  int x, y, z, u, v, w, _;
  x = *x__;
  y = *y__;
  z = *z__;
  u = x, v = y, w = z;
  ENCRYPT_ROUND(0, 6, 3, 5, 1, 3, 6, 2, 1, 6, 3, 6, 3, 2, 5, 2, 2, 4, 7, 7, 1,
                7, 5, 6, 1, 2, 2, 4);
  ENCRYPT_ROUND(1, 4, 7, 2, 6, 7, 7, 3, 6, 3, 3, 3, 4, 5, 1, 3, 4, 7, 7, 1, 6,
                7, 6, 6, 6, 2, 7, 3)
  ENCRYPT_ROUND(2, 4, 7, 1, 3, 7, 3, 6, 7, 7, 2, 6, 6, 6, 1, 5, 1, 6, 4, 6, 5,
                3, 4, 6, 7, 5, 5, 7);
  ENCRYPT_ROUND(3, 7, 6, 2, 2, 2, 7, 7, 6, 3, 1, 1, 2, 7, 4, 6, 7, 6, 3, 1, 6,
                2, 4, 5, 1, 6, 4, 1);
  ENCRYPT_ROUND(4, 6, 4, 7, 2, 7, 4, 4, 3, 2, 7, 3, 1, 3, 2, 7, 4, 7, 1, 1, 1,
                7, 3, 3, 3, 3, 6, 1);
  ENCRYPT_ROUND(5, 3, 1, 1, 4, 5, 2, 2, 2, 5, 3, 1, 1, 1, 7, 7, 3, 2, 3, 2, 2,
                7, 4, 7, 7, 7, 4, 6);
  ENCRYPT_ROUND(6, 2, 6, 4, 6, 4, 1, 2, 5, 2, 5, 5, 3, 7, 3, 1, 4, 7, 4, 6, 7,
                6, 7, 3, 3, 2, 3, 7);
  ENCRYPT_ROUND(7, 5, 7, 5, 2, 5, 1, 5, 2, 7, 3, 6, 6, 2, 1, 3, 7, 2, 2, 7, 1,
                2, 1, 4, 1, 1, 7, 6);
  ADDC(x, _, x, 0, u, v, 7, 1);
  ADDC(y, _, y, 0, u, w, 2, 3);
  ADDC(z, _, z, 0, v, w, 4, 5);
  *x__ = x;
  *y__ = y;
  *z__ = z;
  return 0;
}

int encrypt_loader(int *x__, int *y__, int *z__) {
  asm("la a3,encrypt");
  asm("jalr zero,a3,0");
}

int main() {
  int s[3];
  while (1) {
    scanf("%d%d%d", s, s + 1, s + 2);
    encrypt_loader(s, s + 1, s + 2);
    printf("%d %d %d\n", s[0], s[1], s[2]);
  }
  return 0;
}