#include <stdio.h>
#include "calculate_bmi.h"
double calculate_bmi(double weight, double height)
{
    return weight / (height * height);
}
