#include <stdio.h>
#include "find_min_score.h"
double find_min_score(const double *scores, int count)
{
    double min = scores[0];
    for (int i = 1; i < count; i++) if (scores[i] < min) min = scores[i];
    return min;
}
