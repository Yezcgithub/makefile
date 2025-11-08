#include <stdio.h>
#include "is_armstrong_number.h"
int is_armstrong_number(int num)
{
    int temp = num, sum = 0;
    while (temp) {
        int digit = temp % 10;
        sum += digit*digit*digit;
        temp /= 10;
    }
    return sum == num;
}
