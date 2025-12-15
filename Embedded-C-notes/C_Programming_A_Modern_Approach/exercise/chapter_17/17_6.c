#include <stdio.h>
#include <stdlib.h>

struct node
{
    int value;
    struct node *next;
};

struct node *add_to_list(struct node *list, int n)
{
    struct node *new_node;
    new_node = malloc(sizeof(struct node));
    if (new_node == NULL)
    {
        printf("Error: malloc failed in add_to list\n");
        exit(EXIT_FAILURE);
    }
    new_node->value = n;
    new_node->next = list;
    return new_node;
}

struct node *delete_from_list(struct node *list, int n)
{
    struct node *cur, *to_delete;

    if (list == NULL)
        return list;

    /* 删除头结点 */
    if (list->value == n) {
        to_delete = list;
        list = list->next;
        free(to_delete);
        return list;
    }

    /* 寻找要删除的节点的前一个 */
    for (cur = list;
         cur->next != NULL && cur->next->value != n;
         cur = cur->next)
        ;

    if (cur->next == NULL)
        return list;  /* 没找到 */

    /* 删除节点 */
    to_delete = cur->next;
    cur->next = to_delete->next;
    free(to_delete);

    return list;
}

struct node *read_numbers(void)
{
    struct node *first = NULL;
    int n;
    printf("Enter a series of integers (0 to terminate): ");
    for (;;)
    {
        scanf("%d", &n);
        if (n == 0)
            return first;
        first = add_to_list(first, n);
    }
}

struct node *search_list(struct node *list, int n)
{
    for (; list != NULL; list = list->next)
        if (list->value == n)
            return list;
    return NULL;
}

void print_list(struct node *list)
{
    printf("List: ");
    for (; list != NULL; list = list->next)
        printf("%d -> ", list->value);
    printf("NULL\n");
}

int main(void)
{
    struct node *list = NULL;
    struct node *found;
    int n;

    /* add to list */
    list = read_numbers();
    print_list(list);

    /* search a value */
    printf("Enter a value to search: ");
    scanf("%d", &n);

    found = search_list(list, n);
    if (found != NULL)
        printf("%d found at node %p\n", n, (void *)found);
    else
        printf("%d not found in list.\n", n);

    /* delete a value */
    printf("Enter a value to delete: ");
    scanf("%d", &n);

    list = delete_from_list(list, n);
    print_list(list);

    return 0;
}
