#include <stdio.h>
#include "print_ascii_art.h"
void print_ascii_art(const char *text)
{
    for (int i = 0; text[i]; i++) {
        printf("%c: *****\n", text[i]);
    }
} 
