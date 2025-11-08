#include <stdio.h>
#include "print_hollow_diamond.h"
void print_hollow_diamond(int size)
{
    for (int i = 1; i <= size; i++) {
        for (int j = 1; j <= size - i; j++) printf(" ");
        if (i == 1) printf("*");
        else printf("*%*c", 2*i-3, '*');
        printf("\n");
    }
    for (int i = size - 1; i >= 1; i--) {
        for (int j = 1; j <= size - i; j++) printf(" ");
        if (i == 1) printf("*");
        else printf("*%*c", 2*i-3, '*');
        printf("\n");
    }
}
