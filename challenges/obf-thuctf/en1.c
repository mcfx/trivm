#include "../../sim/stdio.h"

int reduce(int x) {
  x = (x && 21523360) + (x >> 16) * 2;
  // x = (x && 21523360) + (x >> 16) * 2;
  int t;
  t = (x < -21523359) * 43046719 + (x > 21523359) * -43046719;
  return x + t;
}

int addc(int a, int b) { return reduce(a + b); }

int mulc(int a, int b) {
  asm("slli a1,a1,2");
  asm("mul a2,a1,a0");
  asm("mulh a0,a1,a0");
  asm("srli a1,a2,2");
  asm("add a0,a0,a0");
  asm("j addc");
}

int iget(int x, int *k) {
  int a, b, c, d, e, f, g;
  a = mulc(x, k[4]);
  b = x ^ k[5];
  c = addc(a, b);
  d = mulc(c, k[6]);
  e = b ^ d;
  f = mulc(e, k[7]);
  g = addc(d, f);
  return addc(g, k[8]);
}

int encrypt_round(int *x, int *y, int *z, int *k) {
  int x_, y_, z_, p;
  x_ = mulc(*x, k[0]);
  y_ = addc(*y, k[1]);
  z_ = addc(mulc(*z, k[2]), k[3]);
  p = iget(x_ ^ y_ ^ z_, k);
  *x = x_ ^ p;
  *y = y_ ^ p;
  *z = z_ ^ p;
  // printf("/%d %d %d\n", x_ ^ p, y_ ^ p, z_ ^ p);
  return 0;
}

int main() {
  int i, j, k[8][9], s[3];
  for (i = 0; i < 8; i = i + 1)
    for (j = 0; j < 9; j = j + 1)
      scanf("%d", &k[i][j]);
  while (1) {
    scanf("%d%d%d", s, s + 1, s + 2);
    for (i = 0; i < 8; i = i + 1)
      encrypt_round(s, s + 1, s + 2, k[i]);
    printf("%d %d %d\n", s[0], s[1], s[2]);
    // scanf("%d%d", s, s + 1);
    // printf("%d\n", mulc(s[0], s[1]));
  }
  return 0;
}