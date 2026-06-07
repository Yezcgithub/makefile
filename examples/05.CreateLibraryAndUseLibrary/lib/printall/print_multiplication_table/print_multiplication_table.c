#include <stdio.h>
#include "print_multiplication_table.h"
void print_multiplication_table(void)
{
    for (int i = 1; i <= 9; i++) {
        for (int j = 1; j <= i; j++) {
            printf("%d×%d=%-2d  ", j, i, i * j);
        }
        printf("\n");
    }
}
