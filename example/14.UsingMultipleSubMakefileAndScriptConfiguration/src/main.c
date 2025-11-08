#include <stdio.h>
#include "config.h"
#include "addition.h"
#include "multiplication.h"
#include "division.h"
#include "subtraction.h"

int main(int argc, char **argv)
{
    int a = 10;
    int b = 5;
    int c = 0;
    c = add(a, b);
    printf("a + b = %d\n", c);

    c = sub(a, b);
    printf("a - b = %d\n", c);

    c = multiply(a, b);
    printf("a * b = %d\n", c);

    c = div(a, b);
    printf("a / b = %d\n", c);
    return 0;
}