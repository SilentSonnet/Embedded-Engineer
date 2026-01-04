#include <stdio.h>
#include <stdlib.h>

struct node
{
    int value;
    struct node *next;
};

struct node *add_to_list(struct node *list, int n);
struct node *insert_into_ordered_list(struct node *list, struct node *new_node);
struct node *delete_from_list(struct node *list, int n);
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
    int n, number, m, i;

    list = read_numbers();
    print_list(list);

    printf("Enter a number to delete:");
    scanf("%d", &n);
    list = delete_from_list(list, n);
    print_list(list);

    printf("Enter a number to search:");
    scanf("%d", &n);
    found = search_list(list, n);
    if (found != NULL)
        printf("%d is found at node %p\n", found->value, (void *)found);
    else
        printf("%d not found in the list.\n", n);

    printf("Enter a number to insert: ");
    scanf("%d", &i);
    new_node = malloc(sizeof(struct node));
    if(new_node == NULL)
    {
        printf("Error: malloc failed in main.\n");
        exit(EXIT_FAILURE);
    }
    new_node->value = i;
    insert_into_ordered_list(list, new_node);
    print_list(list);

    printf("Enter the number to count: ");
    scanf("%d", &number);
    printf("%d occurs %d times.\n", number, count_occurrences(list, number));

    printf("Enter the number to find the last node: ");
    scanf("%d", &m);
    printf("The last %d is at %p.\n", m, find_last(list, m));

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

struct node *delete_from_list(struct node *list, int n)
{
    struct node *cur, *to_delete;

    /* If the list is empty, return the list */
    if (list == NULL)
        return list;

    /* If the first node is the one to delete */
    if (list->value == n)
    {
        to_delete = list;
        list = list->next;
        free(to_delete);
        return list;
    }

    /* search for the node to delete (starting after the first) */
    for (cur = list;
         cur->next != NULL && cur->next->value != n;
         cur = cur->next)
        ;

    /* Did not find the node */
    if (cur->next == NULL)
        return list;

    /* Found the node to delete */
    to_delete = cur->next;
    cur->next = to_delete->next;
    free(to_delete);

    return list;
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