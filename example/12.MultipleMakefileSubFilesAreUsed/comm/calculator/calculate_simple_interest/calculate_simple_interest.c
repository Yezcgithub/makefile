#include <stdio.h>
#include "calculate_simple_interest.h"
double calculate_simple_interest(double principal, double rate, int years)
{
    return principal * rate/100 * years;
}
