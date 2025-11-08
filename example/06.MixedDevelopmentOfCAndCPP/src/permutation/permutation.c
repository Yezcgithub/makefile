#include <stdio.h>
#include "permutation.h"
long permutation(int n, int k)
{
    long res = 1;
    for (int i = 0; i < k; i++) res *= (n - i);
    return res;
}
