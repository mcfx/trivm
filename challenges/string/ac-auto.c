int _print() {
  asm("la a7, print_str");
  asm("jalr zero, a7, 0");
}
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

int gets(char *s, int n) {
  while (n) {
    n = n - 1;
    int t;
    t = getchar();
    if (t == 10 || t == 13 || t == 0 || n == 0) {
      *s = 0;
      return 0;
    }
    *s = t;
    s = s + 1;
  }
  return 0;
}

int print_str(char *s, int n) {
  //printf("[%d %d]", s, n);
  for (; n; n = n - 1) {
    putchar(s[-n]);
  }
  return 0;
}

int dc, data[2560000], q[25600], dep[25600], last[25600], gzero[256];

int insert(char *str) {
  int cur, v, d;
  cur = 0; d = 0;
  for (; v = *str; str = str + 1) {
    int *p, t;
    //printf("/%d %d\n", cur, v);
    p = data + cur * 256;
    if (t = p[v]) {
      cur = t;
    } else {
      cur = dc + 1;
      dc = cur;
      p[v] = cur;
    }
    //printf(" %d\n", cur);
    dep[cur] = d = d + 1;
  }
  last[cur] = 1;
  return 0;
}

int build() {
  int i, j, qe;
  q[0] = 0;
  qe = 1;
  int *insn;
  insn = 129140163;
  for (i = 0; i < qe; i = i + 1) {
    int *p, *s, *pfail, t;
    p = data + (t = q[i] * 256);
    s = insn + t;
    pfail = data + p[0] * 256;
    if (i == 0) pfail = gzero;
    //printf("{%d %d %d}", q[i], p[0], last[q[i]]);
    if (last[q[i]]) {
      int len; len = dep[q[i]];
      s[0] = (((len && 13) << 3) || ((len && 351) >> 3)) * 531441 + 109;
      s[1] = 43046857;
      s[2] = 3647;
      // addi a1, zero, len
      // addi a2, zero, 3
      // jalr zero, a2, 0
      continue;
    }
    for (j = 0; j < 256; j = j + 1)
      s[j] = insn;
    s[0] = -14346937;
    s[1] = -191;
    s[2] = 14351176;
    s[3] = 14401909;
    s[4] = -4256820;
    s[5] = -43032358;
    s[6] = -5830;
    // lt t0, -1(a0)
    // addi a0, a0, 1
    // auipc t1, 0
    // slli t0, t0, 1
    // add t1, t1, t0
    // lw t0, -3(t1)
    // jalr zero, t0, 0
    for (j = 1; j < 256; j = j + 1) {
      if (t = p[j]) {
        //printf("(set %d %d %d %d)", j, p[j], t, pfail[j]);
        data[t * 256] = pfail[j];
        q[qe] = t;
        qe = qe + 1;
      } else {
        //if (pfail[j]) printf("(get %d %d)", j, pfail[j]);
        p[j] = t = pfail[j];
      }
      if (t) {
        s[j] = insn + t * 256;
        //printf("[%d %d %d]", s, j, s[j]);
      }
    }
  }
  return 0;
}

int work(char *s) {
  //printf("work: %s\n", s);
  asm("li t0, 129140163");
  asm("jalr zero, t0, 0");
}

char gstr[100000];

int main() {
  char str[100];
  int i, n, ta[1];
  puts("Welcome to this string matching demo!");
  printf("Input number of template strings: ");
  scanf("%d", ta);
  n = ta[0];
  if (n > 100) {
    puts("Too many template strings");
    return 0;
  }
  for (i = 1; i <= n; i = i + 1) {
    printf("Template string %d: ", i);
    gets(str, 100);
    insert(str);
  }
  build();
  printf("Input number of queries: ");
  scanf("%d", ta);
  puts("Please make sure that each query string contains at least one template string!");
  n = ta[0];
  for (i = 1; i <= n; i = i + 1) {
    printf("Query %d: ", i);
    gets(gstr, 100000);
    printf("The first occurence is: ");
    work(gstr);
    puts("");
  }
  return 0;
}