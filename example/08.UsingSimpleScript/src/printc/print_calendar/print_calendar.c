#include <stdio.h>
#include "print_calendar.h"
void print_calendar(int year, int month)
{
    printf("Su Mo Tu We Th Fr Sa\n");
    int days = 31; // 简化处理
    int first = 1; // 假设1号是星期一
    for (int i = 0; i < first; i++) printf("   ");
    for (int i = 1; i <= days; i++) {
        printf("%2d ", i);
        if ((i + first - 1) % 7 == 0) printf("\n");
    }
}
