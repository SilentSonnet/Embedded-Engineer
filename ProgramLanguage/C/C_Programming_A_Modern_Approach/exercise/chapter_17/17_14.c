#include <stdio.h>
#include <stdlib.h>

struct node
{
    int value;
    struct node *next;
};

struct node *add_to_list(struct node *list, int n);
struct node *insert_into_ordered_list(struct node *list, struct node *new_node);
void delete_from_list(struct node **list, int n);
struct node *read_numbers(void);
struct node *search_list(struct node *list, int n);
struct node *find_last(struct node *list, int n);
int count_occurrences(struct node *list, int n);
void print_list(struct node *list);
void free_list(struct node **list);

int main(void)
{
    struct node *list = NULL;
    struct node *found, *new_node;
    int n;

    list = read_numbers();
    print_list(list);

    printf("Enter a number to delete:");
    scanf("%d", &n);
    delete_from_list(&list, n);
    print_list(list);

    free_list(&list);
    print_list(list);

    return 0;
}

struct node *add_to_list(struct node *list, int n)
{
    struct node *new_node;
    new_node = malloc(sizeof(struct node));
    if (new_node == NULL)
    {
        printf("Error: malloc failed in add_to_list.\n");
        exit(EXIT_FAILURE);
    }
    new_node->value = n;
    new_node->next = list;

    return new_node;
}

struct node *insert_into_ordered_list(struct node *list, struct node *new_node)
{
    struct node *cur = list, *prev = NULL;
    while (cur->value <= new_node->value)
    {
        prev = cur;
        cur = cur->next;
    }
    prev->next = new_node;
    new_node->next = cur;
    return list;
}

void delete_from_list(struct node **list, int n)
{
    struct node *cur, *prev;
    for (cur = *list, prev = NULL;
         cur != NULL && cur->value != n;
         prev = cur, cur = cur->next)
        ;
    if (cur == NULL)
        return ; /* n was not found */
    if (prev == NULL)
        *list = (*list)->next; /* n is in the first node */
    else
        prev->next = cur->next; /* n is in some other node */
    free(cur);
}

struct node *read_numbers(void)
{
    struct node *list = NULL;
    int n;
    printf("Enter a series of integers (0 to terminate): ");
    for (;;)
    {
        scanf("%d", &n);
        if (n == 0)
            return list;
        list = add_to_list(list, n);
    }
}

struct node *search_list(struct node *list, int n)
{
    for (; list != NULL; list = list->next)
        if (list->value == n)
            return list;
    return NULL;
}

struct node *find_last(struct node *list, int n)
{
    struct node *cur, *last;
    for (cur = list, last = NULL; cur != NULL; cur = cur->next)
    {
        if (cur->value == n)
            last = cur;
    }
    return last;
}

int count_occurrences(struct node *list, int n)
{
    int count = 0;

    while (list != NULL)
    {
        if (list->value == n)
            count++;
        list = list->next;
    }
    return count;
}

void print_list(struct node *list)
{
    printf("List :");
    for (; list != NULL; list = list->next)
        printf("%d -> ", list->value);
    printf("NULL\n");
}

void free_list(struct node **list)
{
    struct node *to_delete;
    while (*list != NULL)
    {
        to_delete = *list;
        *list = (*list)->next;
        free(to_delete);
    }
}