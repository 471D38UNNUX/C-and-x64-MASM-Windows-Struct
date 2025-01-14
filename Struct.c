#include <stdio.h>
#include <Windows.h>

struct A
{
    struct a * B;
};

struct a
{
    void (* b)();
    void (* C)();
};

static void c(struct A * d)
{
    printf("Hello\n");
}

static void D(struct A * d)
{
    printf("World\n");
}

static void E(struct A * d)
{
    d->B->b = c;
    d->B->C = D;

    printf("Hello, World!\n");
}

int main() {
    struct a a;
    struct A A;
    struct A * d = & A;

    d->B = & a;

    E(d);

    d->B->b(& d);
    d->B->C(& d);

    ExitProcess(0);
}
