#include <stdio.h>
#include "find_max_score.h"
double find_max_score(const double *scores, int count)
{
    double max = scores[0];
    for (int i = 1; i < count; i++) if (scores[i] > max) max = scores[i];
    return max;
}
