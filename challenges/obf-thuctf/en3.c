#include "../../sim/stdio.h"

int encrypt_loader(int *x__, int *y__, int *z__) {
  asm("la a3,encrypt");
  asm("jalr zero,a3,0");
}

int main() {
  /*int s[3];
  while (1) {
    scanf("%d%d%d", s, s + 1, s + 2);
    encrypt_loader(s, s + 1, s + 2);
    printf("%d %d %d\n", s[0], s[1], s[2]);
  }*/
  int i,j,g[12];
  char s[37];
  printf("input flag: ");
  scanf("%s",s);
  for(i=0;i<36;i=i+9){
    int t[3];
    t[0]=s[i]*65536+s[i+1]*256+s[i+2];
    t[1]=s[i+3]*65536+s[i+4]*256+s[i+5];
    t[2]=s[i+6]*65536+s[i+7]*256+s[i+8];
    encrypt_loader(t,t+1,t+2);
    for(j=0;j<3;j=j+1)
      g[(i>>1)+j]=t[j];
  }
  //for(i=0;i<12;i=i+1)
//    printf("if(g[%d]==%d)\n",i,g[i]);
if(g[0]==-10383934)
if(g[1]==-5276999)
if(g[2]==-18683711)
if(g[3]==44382)
if(g[4]==2402453)
if(g[5]==-9335978)
if(g[6]==-16896976)
if(g[7]==13820279)
if(g[8]==13665339)
if(g[9]==19631704)
if(g[10]==-18002943)
if(g[11]==-18303780){
  puts("correct");
  return 0;
}
puts("try again");
  return 0;
}