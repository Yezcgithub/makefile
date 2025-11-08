#include <stdio.h>
#include "permutation.h"
long permutation(int n, int k)
{
    long res = 1;
    int i = 0;
    for (i = 0; i < k; i++) res *= (n - i);
    return res;
}
