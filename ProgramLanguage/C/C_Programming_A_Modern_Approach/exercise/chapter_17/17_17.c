#include <stdio.h>
#include <stdlib.h>

int a[100] = {
    42, 7, 89, 15, 63, 28, 91, 3, 56, 74,
    18, 99, 34, 2, 67, 81, 45, 23, 10, 58,
    77, 6, 31, 94, 50, 12, 86, 39, 71, 20,
    65, 4, 97, 29, 52, 14, 88, 60, 25, 83,
    9, 70, 36, 92, 47, 19, 75, 1, 68, 33,
    55, 96, 21, 80, 8, 44, 90, 26, 62, 17,
    73, 5, 84, 40, 59, 11, 95, 30, 66, 22,
    49, 87, 13, 72, 35, 98, 27, 61, 16, 82,
    54, 24, 93, 41, 64, 6, 78, 32, 69, 48,
    57, 85, 37, 100, 53, 76, 43, 52, 14, 90
};


int compare(const void *p, const void *q)
{
    int x = *(const int *)p;
    int y = *(const int *)q;
    return x - y;
}

int main(void)
{
    printf("The first 50 elements :");
    for(int i = 0;i < 50;i ++)
        printf("%d ", a[i]);
    printf("\n");
    printf("The last 50 elements :");
    for(int i = 50;i < 100;i ++)
        printf("%d ", a[i]);
    printf("\n");

    qsort(&a[50], 50, sizeof(a[0]), compare);

    printf("The first 50 elements :");
    for(int i = 0;i < 50;i ++)
        printf("%d ", a[i]);
    printf("\n");
    printf("The last 50 elements :");
    for(int i = 50;i < 100;i ++)
        printf("%d ", a[i]);
    printf("\n");

    return 0;
}