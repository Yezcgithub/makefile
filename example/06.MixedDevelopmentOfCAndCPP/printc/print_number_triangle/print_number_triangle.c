#include <stdio.h>
#include "print_number_triangle.h"
void print_number_triangle(int rows)
{
    int num = 1;
    for (int i = 1; i <= rows; i++) {
        for (int j = 1; j <= i; j++) printf("%d ", num++);
        printf("\n");
    }
}