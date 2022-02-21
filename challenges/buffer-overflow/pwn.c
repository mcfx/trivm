#include "../../sim/stdio.h"

char name[100];
int main() {
  char fruit[100];
  puts("Welcome to this easy pwn challenge!");
  printf("Tell me your name: ");
  scanf("%s", name);
  printf("Hello, %s!\n", name);
  printf("What's your favorite fruit? ");
  scanf("%s", fruit);
  printf("My favorite fruit is %s, too!\n", fruit);
  printf("Goodbye, %s!\n", name);
  return 0;
}