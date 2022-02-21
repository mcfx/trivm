int read(int fd, char *buf, int count) {
  asm("mv a3, a2");
  asm("addi a2, a1, -1");
  asm("mv a1, a0");
  asm("mv a0, zero");
  asm("ecall");
  asm("ret");
}
int write(int fd, char *buf, int count) {
  asm("mv a3, a2");
  asm("addi a2, a1, -1");
  asm("mv a1, a0");
  asm("li a0, 1");
  asm("ecall");
  asm("ret");
}
int open(char *pathname, int flags, int mode) {
  asm("mv a3, a2");
  asm("mv a2, a1");
  asm("addi a1, a0, -1");
  asm("li a0, 2");
  asm("ecall");
  asm("ret");
}
int close(int fd) {
  asm("mv a1, a0");
  asm("li a0, 3");
  asm("ecall");
  asm("ret");
}
int exit(int fd) {
  asm("mv a1, a0");
  asm("li a0, 4");
  asm("ecall");
  asm("ret");
}
char ibuf[729], *ibufs, *ibufe;
char getchar() {
  if (ibufs == ibufe) {
    ibufe = ibuf + read(0, ibuf, 729);
    ibufs = ibuf;
  }
  char res;
  res = *ibufs;
  ibufs = ibufs + 1;
  return res;
}
char obuf[729], *obufend;
int putchar(char x) {
  *obufend = x;
  obufend = obufend + 1;
  if (obufend == obuf + 729) {
    write(1, obuf, 729);
    obufend = obuf;
  }
  return 0;
}
int _start() {
  ibufs = ibufe = ibuf;
  obufend = obuf;
  exit(main());
}
int flush() {
  write(1, obuf, obufend - obuf);
  obufend = obuf;
  return 0;
}
int puts(char *s) {
  char t;
  for (; t = *s; s = s + 1)
    putchar(t);
  putchar(10);
  flush();
  return 0;
}
int print_digit(int x, int y) {
  int c;
  c = 0;
  while (x >= y) {
    x = x - y;
    c = c + 1;
  }
  putchar(c + 48);
  return x;
}
int print_uint(int x) {
  int flag;
  flag = 0;
  if (x >= 100000000)
    x = print_digit(x, 100000000), flag = 1;
  if (x >= 10000000 || flag)
    x = print_digit(x, 10000000), flag = 1;
  if (x >= 1000000 || flag)
    x = print_digit(x, 1000000), flag = 1;
  if (x >= 100000 || flag)
    x = print_digit(x, 100000), flag = 1;
  if (x >= 10000 || flag)
    x = print_digit(x, 10000), flag = 1;
  if (x >= 1000 || flag)
    x = print_digit(x, 1000), flag = 1;
  if (x >= 100 || flag)
    x = print_digit(x, 100), flag = 1;
  if (x >= 10 || flag)
    x = print_digit(x, 10);
  putchar(x + 48);
  return 0;
}
int printf(char *s, int *a1, int *a2, int *a3, int *a4, int *a5, int *a6,
           int *a7) {
  char t;
  int *as[7], p;
  as[0] = a1;
  as[1] = a2;
  as[2] = a3;
  as[3] = a4;
  as[4] = a5;
  as[5] = a6;
  as[6] = a7;
  p = 0;
  for (; t = *s; s = s + 1) {
    if (t != '%') {
      putchar(t);
      continue;
    }
    s = s + 1;
    t = *s;
    if (t == '%') {
      putchar(t);
      continue;
    }
    if (t == 'c') {
      putchar(as[p]);
      p = p + 1;
      continue;
    }
    if (t == 'd') {
      int x;
      x = as[p];
      p = p + 1;
      if (x == 0) {
        putchar('0');
      } else {
        if (x < 0)
          x = -x, putchar('-');
        print_uint(x);
      }
      continue;
    }
    if (t == 's') {
      char *x, t;
      x = as[p];
      p = p + 1;
      for (; t = *x; x = x + 1)
        putchar(t);
      continue;
    }
  }
  flush();
  return 0;
}
int scanf(char *s, int *a1, int *a2, int *a3, int *a4, int *a5, int *a6,
          int *a7) {
  char t;
  int *as[7], p;
  as[0] = a1;
  as[1] = a2;
  as[2] = a3;
  as[3] = a4;
  as[4] = a5;
  as[5] = a6;
  as[6] = a7;
  p = 0;
  for (; t = *s; s = s + 1) {
    if (t != '%') {
      getchar();
      continue;
    }
    s = s + 1;
    t = *s;
    if (t == '%') {
      getchar();
      continue;
    }
    if (t == 'c') {
      char *x;
      x = as[p];
      *x = getchar();
      p = p + 1;
      continue;
    }
    if (t == 'd') {
      int *x;
      x = as[p];
      p = p + 1;
      int tmp, flag;
      char c;
      tmp = 0;
      flag = 0;
      c = getchar();
      while ((c < '0' || c > '9') && c != '-')
        c = getchar();
      if (c == '-')
        flag = 1, c = getchar();
      while (c >= '0' && c <= '9') {
        tmp = tmp * 10 + c - 48;
        c = getchar();
      }
      if (flag)
        tmp = -tmp;
      *x = tmp;
      continue;
    }
    if (t == 's') {
      char *x, c;
      x = as[p];
      p = p + 1;
      c = getchar();
      while (c == ' ' || c == '\n')
        c = getchar();
      for (; c != ' ' && c != '\n'; c = getchar())
        *x = c, x = x + 1;
      continue;
    }
  }
  return 0;
}