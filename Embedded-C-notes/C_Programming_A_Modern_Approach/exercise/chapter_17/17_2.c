#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void *duplicate(const char *s);

int main(void)
{
    char *s = "Hello World!";
    char *p = duplicate(s);

    printf("The string is :%s\n", p);

    free(p);

    return 0;
}

void *duplicate(const char *s)
{
    void * p = malloc(strlen(s));
    if(p == NULL)
    {
        printf("Error: malloc failed in concat\n");
        return NULL;
    }
    strcpy(p, s);

    return p;
}