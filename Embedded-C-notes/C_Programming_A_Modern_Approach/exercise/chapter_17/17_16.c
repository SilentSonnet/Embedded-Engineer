#include <stdio.h>

int sum(int (*f)(int), int start, int end);
int g(int i);

int main(void)
{
    printf("The sum is %d.\n", sum(g, 1, 10));
    return 0;
}

int sum(int (*f)(int), int start, int end)
{
    int sum = 0;
    for(int i = start;i <= end;i ++)
        sum += (*f)(i);
    return sum;
}

int g(int i)
{
    return i * i;
}