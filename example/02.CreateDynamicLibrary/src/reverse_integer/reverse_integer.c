#include <stdio.h>
#include "reverse_integer.h"
int reverse_integer(int num)
{
    int reversed = 0;
    while (num) {
        reversed = reversed * 10 + num % 10;
        num /= 10;
    }
    return reversed;
}
