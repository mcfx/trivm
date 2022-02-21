#include "../../sim_v2/stdio.h"
#include "key.c"

FAFA;

#define encrypt_round(round, U1, U2, U3, U4, U5, U6, U7, U8, U9, U10, U11, U12, U13, U14, U15, U16, U17, U18, U19, U20) \
  x0 = ggadd_##U1(x, key##round##0, RR, RR); \
  x1 = ggxor_##U2(x0, key##round##1, RR, RR); \
  x2 = ggadd_##U3(x1, key##round##2, RR, RR); \
  y0 = ggxor_##U4(y, key##round##3, RR, RR); \
  y1 = ggadd_##U5(y0, key##round##4, RR, RR); \
  z0 = ggadd_##U6(z, key##round##5, RR, RR); \
  pyz = ggxor_##U7(y1, z0, RR, RR); \
  p = ggxor_##U8(x2, pyz, RR, RR); \
  a = ggxor_##U9(p, key##round##6, RR, RR); \
  b = ggadd_##U10(p, key##round##7, RR, RR); \
  c = ggand1_##U11(a, b, RR, RR); \
  d = ggxorT_##U12(a, b, RR, RR); \
  e = ggadd_##U13(c, key##round##8, RR, RR); \
  f = ggxor_##U14(d, key##round##9, RR, RR); \
  g = ggor_##U15(e, f, RR, RR); \
  rt = ggxor_##U16(b, e, RR, RR); \
  p = ggadd_##U17(rt, g, RR, RR); \
  x = ggxor_##U18(x2, p, RR, RR); \
  y = ggxor_##U19(y1, p, RR, RR); \
  z = ggxor_##U20(z0, p, RR, RR); \

int main() {
  /*int i, j, k[8][10], s[3];
  for (i = 0; i < 8; i = i + 1)
    for (j = 0; j < 10; j = j + 1)
      scanf("%d", &k[i][j]);
  while (1) {
    scanf("%d%d%d", s, s + 1, s + 2);
    encrypt(s, s + 1, s + 2);
    printf("%d %d %d\n", s[0], s[1], s[2]);
    // scanf("%d%d", s, s + 1);
    // printf("%d\n", mulc(s[0], s[1]));
  }*/
  int i,j,g[13];
  printf("input flag: ");
  scanf("%s",g);
  for(i=0;i<12;i=i+3){
    encrypt(g+i,g+i+1,g+i+2);
  }
  //for(i=0;i<12;i=i+1)
  //  printf("if(g[%d]==%d)\n",i,g[i]);
  //if(g[0]==61101153)
if(g[1]==135461653)
if(g[2]==137064784)
if(g[3]==85530621)
if(g[4]==-174382741)
if(g[5]==7581309)
if(g[6]==17193688)
if(g[7]==-24086902)
if(g[8]==164919797)
if(g[9]==-118079291)
if(g[10]==189168511)
if(g[11]==-171475695){
  puts("correct");
  return 0;
}
puts("try again");
  return 0;
}

int encrypt(int *_x, int *_y, int *_z) {
  int x, y, z, p;
  int x0, x1, x2, y0, y1, z0, pyz, rt;
  int a, b, c, d, e, f, g;
  x = *_x, y = *_y, z = *_z;
  x0 = x, x1 = y, x2 = z;
  y0 = x, y1 = y, z0 = z;
  p = x, pyz = y, rt = z;
  a = x, b = y, c = z, d = x, e = y, f = z, g = x;
  encrypt_round(0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19);
  encrypt_round(1, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39);
  encrypt_round(2, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59);
  encrypt_round(3, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79);
  encrypt_round(4, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99);
  encrypt_round(5, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119);
  encrypt_round(6, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139);
  encrypt_round(7, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159);
  *_x = x, *_y = y, *_z = z;
  return 0;
}