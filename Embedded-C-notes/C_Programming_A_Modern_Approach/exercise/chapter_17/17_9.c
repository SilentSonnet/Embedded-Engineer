#include <stdio.h>

struct node
{
    int a;
    struct node *next;
};

int main(void)
{
    struct node x = {1};

    printf("The value of struct x is %d.\n", x.a);
    printf("The value of struct x is %d.\n", (&x)->a);

    return 0;
}