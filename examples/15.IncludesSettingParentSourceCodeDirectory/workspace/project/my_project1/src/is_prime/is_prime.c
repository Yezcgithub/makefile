#include <stdio.h>
#include "is_prime.h"
int is_prime(int n)
{
    int i = 0;
    if (n <= 1) return 0;
    for (i = 2; i <= n/2; i++) {
        if (n % i == 0) return 0;
    }
    return 1;
} 
