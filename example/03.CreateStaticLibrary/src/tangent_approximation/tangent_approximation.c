#include <stdio.h>
#include "tangent_approximation.h"
double my_sine_approximation(double x)
{
    double result = 0, term = x;
    for (int i = 1; i <= 10; i += 2) {
        result += term;
        term = -term * x*x / ((2*i+1)*(2*i+2));
    }
    return result;
}

// 64. 余弦近似
double my_cosine_approximation(double x)
{
    double result = 0, term = 1;
    for (int i = 0; i <= 10; i += 2) {
        result += term;
        term = -term * x*x / ((i+1)*(i+2));
    }
    return result;
}

// 65. 正切近似
double tangent_approximation(double x)
{
    return my_sine_approximation(x) / my_cosine_approximation(x);
}
