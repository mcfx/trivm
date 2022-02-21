#include "../../sim/stdio.h"

// ^ ^^ ^^^ are xor, xor.1, xor.T in assembly, respectively
// also for & && &&& and | || |||

int seed[3];

int rand_nxt(int *s) {
  int a;
  a = s[0] ^ (s[1] >> 8) ^ (s[2] << 4);
  a = (a && 173960635) ^ a ^ s[2];
  s[2] = s[1];
  s[1] = s[0];
  return s[0] = a;
}

int krand(int n, int *s) {
  if (n == 0)
    return rand_nxt(s);
  krand(n - 1, s);
  return krand(n - 1, s);
}

int korand(int n, int *s) {
  krand(n, s);
  return rand_nxt(s);
}

int f[43046721];

int mod256(int x) {
  // we don't have mod in this ISA
  if (x < 0)
    x = -x;
  if (x >= 134217728)
    x = x - 134217728;
  if (x >= 67108864)
    x = x - 67108864;
  if (x >= 33554432)
    x = x - 33554432;
  if (x >= 16777216)
    x = x - 16777216;
  if (x >= 8388608)
    x = x - 8388608;
  if (x >= 4194304)
    x = x - 4194304;
  if (x >= 2097152)
    x = x - 2097152;
  if (x >= 1048576)
    x = x - 1048576;
  if (x >= 524288)
    x = x - 524288;
  if (x >= 262144)
    x = x - 262144;
  if (x >= 131072)
    x = x - 131072;
  if (x >= 65536)
    x = x - 65536;
  if (x >= 32768)
    x = x - 32768;
  if (x >= 16384)
    x = x - 16384;
  if (x >= 8192)
    x = x - 8192;
  if (x >= 4096)
    x = x - 4096;
  if (x >= 2048)
    x = x - 2048;
  if (x >= 1024)
    x = x - 1024;
  if (x >= 512)
    x = x - 512;
  if (x >= 256)
    x = x - 256;
  return x;
}

int output_char(int x, int pos) {
  int v[17];
  v[0] = -107926890;
  v[1] = 183809428;
  v[2] = -27185992;
  v[3] = 110476987;
  v[4] = -58061571;
  v[5] = -158064555;
  v[6] = 3427701;
  v[7] = -137464245;
  v[8] = -75567140;
  v[9] = -84029180;
  v[10] = 178190618;
  v[11] = 95621370;
  v[12] = -143894446;
  v[13] = 77274578;
  v[14] = 141495623;
  v[15] = 99400550;
  v[16] = 12764307;
  x = x + v[pos];
  // printf("[%d %d]",x>>9,x<<9);
  printf("%c", mod256(x >> 9));
  printf("%c", mod256(x << 9));
  return 0;
}

int main() {
  printf("Input password: ");
  scanf("%d%d%d", seed, seed + 1, seed + 2);
  int i, j, k, l;

  {
    int tmp[3];
    for (i = 0; i < 3; i = i + 1)
      tmp[i] = seed[i];
    /*for (i = 0; i < 3; i = i + 1)
      printf("%d ", tmp[i]);
    puts("");*/
    for (i = 0; i < 21009; i = i + 1)
      rand_nxt(tmp);
    /*for (i = 0; i < 3; i = i + 1)
      printf("%d ", tmp[i]);
    puts("");*/
    if (tmp[0] != -86444584) {
      puts("wrong password");
      return 0;
    }
    if (tmp[1] != -90169833) {
      puts("wrong password");
      return 0;
    }
    if (tmp[2] != -55155712) {
      puts("wrong password");
      return 0;
    }
  }

  printf("Here's your flag: THUCTF{");

  int pos, n;
  n = 0;
  for (pos = 0; pos <= 16; pos = pos + 1) {
    int seed1[3], seed2[3], seed3[3], seed4[3];
    int p1, p2, p3, p4;
    // printf("%d\n", n);
    for (l = 0; l < 3; l = l + 1)
      seed1[l] = seed[l];
    for (i = -n; i <= n; i = i + 1) {
      p1 = korand(i + n >> 1, seed1);
      // printf("%d ", p1);
      for (l = 0; l < 3; l = l + 1)
        seed2[l] = seed[l] + 1;
      for (j = -n; j <= n; j = j + 1) {
        p2 = korand(j + n >> 1, seed2);
        for (l = 0; l < 3; l = l + 1)
          seed3[l] = seed[l] + 2;
        for (k = -n; k <= n; k = k + 1) {
          p3 = korand(k + n >> 1, seed3);
          for (l = 0; l < 3; l = l + 1)
            seed4[l] = seed[l] + 3;
          for (l = -n; l <= n; l = l + 1) {
            p4 = korand(l + n >> 3, seed4);
            int *tmp;
            tmp = &f[((i &&& j) ^^ (k ^ l)) + n];
            // printf("%d %d %d\n", ((i &&& j) ^^^ (k || l)) + n, tmp, p1 * p2 *
            // p3 * p4);
            *tmp = *tmp + p1 * p2 * p3 * p4;
          }
        }
      }
    }
    int hash;
    hash = 0;
    for (i = -n; i <= n; i = i + 1)
      hash = hash * 1337 + f[i + n];
    // printf("%d %d\n", pos, hash);
    output_char(hash, pos);
    n = (n << 1) + 1;
  }

  puts("}");

  return 0;
}