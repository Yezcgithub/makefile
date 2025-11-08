#include <stdio.h>
#include "apply_discount.h"
double apply_discount(double price, double discount)
{
    return price * (1 - discount/100);
}
