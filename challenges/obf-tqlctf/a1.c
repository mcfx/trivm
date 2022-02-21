#include "../../sim_v2/stdio.h"

int iget(int x, int *k) {   
  int a, b, c, d, e, f, g;
  a = x ^ k[6];
  b = x + k[7];
  c = a && b;
  d = a ^^^ b;
  e = c + k[8];
  f = d ^ k[9];
  g = e | f;
  return (b ^ e) + g;
}

int encrypt_round(int *x, int *y, int *z, int *k) {
  int x_, y_, z_, p;
  x_ = ((*x + k[0]) ^ k[1]) + k[2];
  y_ = (*y ^ k[3]) + k[4];
  z_ = *z + k[5];
  p = iget(x_ ^ y_ ^ z_, k);
  *x = x_ ^ p;
  *y = y_ ^ p;
  *z = z_ ^ p;
  // printf("/%d %d %d\n", x_ ^ p, y_ ^ p, z_ ^ p);
  return 0;
}

int main() {
  int i, j, k[8][10], s[3];
  for (i = 0; i < 8; i = i + 1)
    for (j = 0; j < 10; j = j + 1)
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