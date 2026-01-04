#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "line.h"

#define MAX_LINE_LEN 60

/* Linked-list node: stores a single word */
struct node
{
    char *word;            /* dynamically allocated string for the word */
    struct node *next;
};

/* Pointer replaces the original line[] array:
   'line' points to the first word node of the current line;
   when the line is empty, line == NULL */
static struct node *line = NULL;

/* Keep the original statistics: line length and word count */
static int line_len = 0;
static int num_words = 0;

/* Frees the entire linked list (used by clear_line) */
static void free_line(void)
{
    struct node *p = line;
    while (p != NULL)
    {
        struct node *next = p->next;
        free(p->word);
        free(p);
        p = next;
    }
    line = NULL;
}

void clear_line(void)
{
    /* Original version: line[0] = '\0'
       New version: free the linked list and reset the head pointer */
    free_line();
    line_len = 0;
    num_words = 0;
}

void add_word(const char *word)
{
    /* Original version: append characters to line[]
       New version: create a new node, copy the word into it,
       and append the node to the end of the list */

    struct node *new_node = malloc(sizeof(struct node));
    if (new_node == NULL)
    {
        fprintf(stderr, "malloc failed\n");
        exit(EXIT_FAILURE);
    }

    new_node->word = malloc(strlen(word) + 1);
    if (new_node->word == NULL)
    {
        fprintf(stderr, "malloc failed\n");
        exit(EXIT_FAILURE);
    }
    strcpy(new_node->word, word);
    new_node->next = NULL;

    /* Append the new node to the end of the list */
    if (line == NULL)
    {
        line = new_node;
    }
    else
    {
        struct node *p = line;
        while (p->next != NULL)
            p = p->next;
        p->next = new_node;
    }

    /* Maintain line_len and num_words:
       if this is not the first word, there is one space before it */
    if (num_words > 0)
        line_len += 1;     /* space between words */

    line_len += (int)strlen(word);
    num_words++;
}

int space_remaining(void)
{
    return MAX_LINE_LEN - line_len;
}

/* To write a line, we traverse the list and print each word,
   inserting spaces between words.
   write_line performs full justification by distributing extra spaces.
*/
void write_line(void)
{
    int extra_spaces, spaces_to_insert, j;
    struct node *p;

    if (num_words == 0)
    {
        putchar('\n');
        return;
    }

    extra_spaces = MAX_LINE_LEN - line_len;

    /* If there is only one word, no extra spaces are needed */
    if (num_words == 1)
    {
        puts(line->word);
        return;
    }

    p = line;

    /* Print the first word */
    fputs(p->word, stdout);
    p = p->next;

    /* From the second word on, print spaces followed by the word */
    /* Note: unlike the original version, we do not decrement num_words
       during output; instead we track how many gaps remain */
    int gaps_left = num_words - 1;

    while (p != NULL)
    {
        /* Each gap gets at least one space.
           Extra spaces are evenly distributed among the remaining gaps. */
        spaces_to_insert = extra_spaces / gaps_left;

        /* Print 1 + spaces_to_insert spaces */
        for (j = 0; j < 1 + spaces_to_insert; j++)
            putchar(' ');

        extra_spaces -= spaces_to_insert;
        gaps_left--;

        fputs(p->word, stdout);
        p = p->next;
    }

    putchar('\n');
}

/* flush_line prints the line without justification,
   using a single space between words */
void flush_line(void)
{
    struct node *p = line;

    if (line_len == 0)     /* alternatively: if (line == NULL) */
        return;

    while (p != NULL)
    {
        fputs(p->word, stdout);
        if (p->next != NULL)
            putchar(' ');
        p = p->next;
    }
    putchar('\n');
}
