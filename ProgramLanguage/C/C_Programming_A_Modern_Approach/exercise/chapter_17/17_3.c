#include <stdio.h>
#include <stdlib.h>

int *create_array(int n, int initial_value);

int main(void)
{
    int number, initial_value, *p;
    printf("Enter the number an initial value of an array:");
    scanf("%d%d", &number, &initial_value);
    
    p = create_array(number, initial_value);
    if(p == NULL)
    {
        printf("Error: malloc failed in concat\n");
        exit(EXIT_FAILURE);
    }

    for(int i = 0;i < number;i ++)
        printf("%d ", p[i]);
    printf("\n");

    free(p);

    return 0;
}

int *create_array(int n, int initial_value)
{
    int *p = malloc(n * sizeof(int));
    if (p == NULL)
        return NULL;
    
    for(int i = 0;i < n;i ++)
        p[i] = initial_value;

    return p;
}