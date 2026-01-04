#include <stdio.h>
#include <stdlib.h>

struct point
{
    int x, y;
};
struct rectangle
{
    struct point upper_left, lower_right;
};

struct rectangle *p;

int main(void)
{
    p = malloc(sizeof(struct rectangle));
    if(p == NULL)
    {
        printf("Error: malloc failed in concat\n");
        exit(EXIT_FAILURE);
    }

    p->upper_left = (struct point){10, 25};
    p->lower_right = (struct point){20, 15};

    printf("The upper left point is :(%d, %d)\n", p->upper_left.x, p->upper_left.y);
    printf("The lower right point is :(%d, %d)\n", p->lower_right.x, p->lower_right.y);

    free(p);

    return 0;
}