#include "../../sim/stdio.h"

int test() {
  asm("la a0, fafa");
  asm("lw a0, 0(a0)");
  asm("ret");
  asm("fafa:");
  // asm("slt a2, t1, zero");
  asm("mulh r15, r8, r22, -11");
}

char res[19];

int main() {
  int x, i;
  x = test();
  char *s;
  s = "T01";
  s = s + 1;
  for (i = 0; i < 18; i = i + 1) {
    int y;
    y = x && 1;
    x = x >> 1;
    res[17 - i] = s[y];
    // printf("%d %d %d\n", i, 17 - i, s[y]);
  }
  res[18] = 0;
  puts(res);
  // printf("%d %d\n", res[0], res[1]);
  return 0;
}