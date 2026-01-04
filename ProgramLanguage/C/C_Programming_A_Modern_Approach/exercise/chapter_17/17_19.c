#include <stdio.h>
#include <stdbool.h>
#include <string.h>

void new_cmd(void)
{
    printf("new_cmd called\n");
}

void open_cmd(void)
{
    printf("open_cmd called\n");
}

void close_cmd(void)
{
    printf("close_cmd called\n");
}

void close_all_cmd(void)
{
    printf("close_all_cmd called\n");
}

void save_cmd(void)
{
    printf("save_cmd called\n");
}

void save_as_cmd(void)
{
    printf("save_as_cmd called\n");
}

void save_all_cmd(void)
{
    printf("save_all_cmd called\n");
}

void print_cmd(void)
{
    printf("print_cmd called\n");
}

void exit_cmd(void)
{
    printf("exit_cmd called\n");
}


struct
{
    char *cmd_name;
    void (*cmd_pointer)(void);
} file_cmd[] =
    {{"new", new_cmd},
     {"open", open_cmd},
     {"close", close_cmd},
     {"close all", close_all_cmd},
     {"save", save_cmd},
     {"save as", save_as_cmd},
     {"save all", save_all_cmd},
     {"print", print_cmd},
     {"exit", exit_cmd}};


bool cmd_function(const char *cmd)
{
    int len = sizeof(file_cmd) / sizeof(file_cmd[0]);
    for(int i = 0;i < len;i ++)
    {
        if(strcmp(file_cmd[i].cmd_name, cmd) == 0)
        {
            (*file_cmd[i].cmd_pointer)();
            return true;
        }
    }
    return false;
}

int main(void)
{
    char *a = "save all";
    if(!cmd_function(a))
        printf("Error : false input.\n");
    return 0;
}