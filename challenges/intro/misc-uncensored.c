#include "../../sim/stdio.h"

int q1_ans, q3_ans;
char q2_ans[18];

int show_q(int x) {
  return printf("================ Question %d ================\n", x);
}

int q1() {
  show_q(1);
  printf("What's the INT_MIN in TriVM? ");
  scanf("%d", &q1_ans);
  return 0;
}

int q2() {
  show_q(2);
  puts("In this code, an instrction is censored. Can you find it out?");
  puts("Answer should be in the balanced ternary format of the instruction,");
  puts("e.g. 'slt a2, t1, zero' -> 00000000TT1T1TT000");
  printf("Your answer: ");
  scanf("%s", q2_ans);
  return 0;
  asm("censored:");
  asm("mulh r15, r8, r22, -11");
}
int q3() {
  show_q(3);
  puts("How many different instructions are there in TriVM?");
  puts("Tips:");
  puts("1. 'add t0, zero, zero, 0' and 'addi t0, zero, 0' are different");
  puts("instructions, though they do the same thing");
  puts("2. 000000000000000100 and 1T1T1T1T1T1T1T1100 are the same instruction");
  puts("'ecall', since only opcode is used, all other trits are ignored");
  printf("Your answer: ");
  scanf("%d", &q3_ans);
  return 0;
}

int main() {
  puts("This challenge helps you to get familiar with TriVM.");
  puts("You need to answer a few questions to get the correct answer.");
  q1();
  q2();
  q3();
  puts("Congratulations! If you answered these question correctly,");
  puts("you can get the flag using this python code:");
  puts("");
  puts("from hashlib import md5");
  printf("print('THUCTF{Simple_VM_%%s}' %% md5(b'%d_%s_%d').hexdigest())\n",
         q1_ans, q2_ans, q3_ans);
  return 0;
}