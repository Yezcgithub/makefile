#include <stdio.h>
#include "print_heart.h"
void print_heart(void)
{
    for (double y = 1.5f; y > -1; y -= 0.1) {
        for (double x = -1.5f; x < 1.5f; x += 0.05f) {
            double a = x*x + y*y - 1;
            putchar(a*a*a - x*x*y*y*y <= 0 ? '*' : ' ');
        }
        putchar('\n');
    }
}
