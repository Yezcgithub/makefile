#include <stdio.h>
#include "print_letter_diamond.h"
void print_letter_diamond(int size)
{
    for (int i = 1; i <= size; i++) {
        for (int j = 1; j <= size - i; j++) printf(" ");
        for (int j = 1; j <= i; j++) printf("%c", 'A' + j - 1);
        for (int j = i - 1; j >= 1; j--) printf("%c", 'A' + j - 1);
        printf("\n");
    }
    for (int i = size - 1; i >= 1; i--) {
        for (int j = 1; j <= size - i; j++) printf(" ");
        for (int j = 1; j <= i; j++) printf("%c", 'A' + j - 1);
        for (int j = i - 1; j >= 1; j--) printf("%c", 'A' + j - 1);
        printf("\n");
    }
}
