#include <stdio.h>
#include <stdlib.h>

void *my_malloc(size_t n);

int main(void)
{
    void *p = my_malloc(1);

    printf("Malloc successed in concat.\n");

    free(p);

    return 0;
}

void *my_malloc(size_t n)
{
    void *p = malloc(n);

    if (p == NULL)
    {
        printf("Error: malloc failed in concat\n");
        exit(EXIT_FAILURE);
    }

    return p;
}
