#include "../../sim_v2/stdio.h"
#include "ops.h"

int seed;

int rand() {
    return seed = (seed * 124691 + 1724901) ^ -1924;
}

int main() {
    int i, a, b, c, d;
    for (i = 0; i < 100; i = i + 1) {
        a = rand(), b = rand(), c = rand(), d = rand();
        printf("%d %d %d\n", i, a && b, gand1_3(a, b, c, d));
        //((((((((((((((((a))))))))))+((((((((((b))))))))))))))));
    }
    puts("ok");
    return 0;
}