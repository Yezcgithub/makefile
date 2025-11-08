#include <stdio.h>
#include "print_diamond.h"
void print_diamond(int size)
{
    int i = 0;
    int j = 0;
    for (i = 1; i <= size; i++) {
        for (j = 1; j <= size - i; j++) printf(" ");
        for (j = 1; j <= 2*i - 1; j++) printf("*");
        printf("\n");
    }
    for (i = size - 1; i >= 1; i--) {
        for (j = 1; j <= size - i; j++) printf(" ");
        for (j = 1; j <= 2*i - 1; j++) printf("*");
        printf("\n");
    }
}
