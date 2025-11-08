#include <stdio.h>
#include "approximate_e.h"
double approximate_e(int terms)
{
    double e = 1;
    long fact = 1;
    for (int i = 1; i <= terms; i++) {
        fact *= i;
        e += 1.0 / (double)fact;
    }
    return e;
}
