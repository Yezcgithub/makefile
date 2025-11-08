#include <stdio.h>
#include "print_letter_pyramid.h"
void print_letter_pyramid(int rows)
{
    char ch = 'A';
    for (int i = 1; i <= rows; i++) {
        for (int j = 1; j <= rows - i; j++) printf(" ");
        for (int j = 1; j <= i; j++) printf("%c ", ch++);
        ch--;
        for (int j = i - 1; j >= 1; j--) printf("%c ", --ch);
        ch = (char)('A' + i);
        printf("\n");
    }
}
