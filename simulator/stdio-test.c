#include "stdio.h"
int main() {
  puts("ok");
  printf("test: %d %c%c, %s\n", 114514, 97, 65, "string test");
  int a[2];
  scanf("%d%d", a, a + 1);
  printf("%d\n", a[0] + a[1]);
  return 0;
}