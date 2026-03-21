#include <stdio.h>

// 一个简单的加法函数，模拟“隐藏功能”
void secret_func(int a) {
    int b = a + 100;  // 计算a+100，模拟程序内部逻辑
    printf("Secret value is: %d\n", b);  // 输出计算结果
}

int main() {
    int target = 10;  // 定义一个变量，赋值为10
    printf("Hello GDB!\n");  // 打印提示信息，标记程序执行节点
    
    // 调用隐藏函数，传递target作为参数
    secret_func(target);
    
    printf("Program finished.\n");  // 程序结束提示
    return 0;  // 程序正常退出
}

