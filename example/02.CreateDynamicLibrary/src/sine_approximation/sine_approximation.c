#include <stdio.h>
#include "sine_approximation.h"
double sine_approximation(double x)
{
    double result = 0, term = x;
    for (int i = 1; i <= 10; i += 2) {
        result += term;
        term = -term * x*x / ((2*i+1)*(2*i+2));
    }
    return result;
}
