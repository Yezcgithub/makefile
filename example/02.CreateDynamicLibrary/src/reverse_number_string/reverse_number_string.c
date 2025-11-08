#include <stdio.h>
#include <string.h>
#include "reverse_number_string.h"
void reverse_number_string(char *num)
{
    int len = (int)strlen(num);
    for (int i = 0, j = len-1; i < j; i++, j--) {
        char t = num[i]; num[i] = num[j]; num[j] = t;
    }
}
