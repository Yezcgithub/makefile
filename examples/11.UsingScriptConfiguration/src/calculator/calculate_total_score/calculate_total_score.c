#include <stdio.h>
#include "calculate_total_score.h"
double calculate_total_score(const double *scores, int count)
{
    double sum = 0;
    for (int i = 0; i < count; i++) sum += scores[i];
    return sum;
}
