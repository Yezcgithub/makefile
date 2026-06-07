#include <stdio.h>
#include "print_number_pyramid.h"
void print_number_pyramid(int rows)
{
    for (int i = 1; i <= rows; i++) {
        for (int j = 1; j <= rows - i; j++) printf(" ");
        for (int j = 1; j <= i; j++) printf("%d ", j);
        for (int j = i - 1; j >= 1; j--) printf("%d ", j);
        printf("\n");
    }
}
