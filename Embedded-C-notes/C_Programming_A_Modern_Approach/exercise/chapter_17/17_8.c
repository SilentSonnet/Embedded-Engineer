#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

struct node
{
    int value;
    struct node *next;
};

struct node *top = NULL;

void make_empty(void)
{
    struct node *to_delete;
    while (top != NULL)
    {
        to_delete = top;
        top = top->next;
        free(to_delete);
    }
}

bool is_empty(void)
{
    return top == NULL;
}

bool push(int n)
{
    struct node *new_node;
    new_node = malloc(sizeof(struct node));
    if (new_node == NULL)
        return false;

    new_node->value = n;
    new_node->next = top;
    top = new_node;
    return true;
}

int pop(void)
{
    struct node *to_delete;
    int temp;

    if(is_empty())
    {
        printf("*** Stack underflow. program terminated. ***\n");
        exit(EXIT_FAILURE);
    }
    temp = top->value;
    to_delete = top;
    top = top->next;
    free(to_delete);

    return temp;
}

void read_number(void)
{
    int n;

    printf("Enter a series of numbers to restore: ");
    while(scanf("%d", &n) == 1 && n != 0)
        if(!push(n))
            break;
}

void print_stack(void)
{
    struct node *cur = top;

    printf("List :");
    while(cur != NULL)
    {
        printf(" %d -> ", cur->value);
        cur = cur->next;
    }
    printf("NULL\n");
}

int main(void)
{
    int n;

    read_number();
    print_stack();

    printf("Pop the first element.\n");
    printf("Popped value :%d\n", pop());

    print_stack();

    make_empty();
    if(is_empty())
        printf("The stack is already empty.\n");

    return 0;
}
