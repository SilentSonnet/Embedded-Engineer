#include <stdio.h>
#include <stdatomic.h>

int main() {
    _Atomic int counter = 0;

    atomic_fetch_add(&counter, 1);

    printf("counter = %d\n", counter);
    return 0;
}
