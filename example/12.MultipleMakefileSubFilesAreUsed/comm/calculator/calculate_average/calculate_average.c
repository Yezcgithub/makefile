#include <stdio.h>
#include "calculate_average.h"
double calculate_average(const double *scores, int count)
{
    double sum = 0;
    for (int i = 0; i < count; i++) sum += scores[i];
    return sum / count;
}
