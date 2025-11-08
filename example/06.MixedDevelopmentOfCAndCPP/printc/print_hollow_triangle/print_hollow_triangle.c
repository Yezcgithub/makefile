#include <stdio.h>
#include "print_hollow_triangle.h"
void print_hollow_triangle(int height)
{
    for (int i = 1; i <= height; i++) {
        for (int j = 1; j <= height - i; j++) printf(" ");
        if (i == 1) {
            printf("*");
        } else if (i == height) {
            for (int j = 1; j <= 2*i - 1; j++) printf("*");
        } else {
            printf("*");
            for (int j = 1; j <= 2*i - 3; j++) printf(" ");
            printf("*");
        }
        printf("\n");
    }
}
