#include <stdio.h>
#include "generate_barcode.h"
void generate_barcode(int num, char *out)
{
    for (int i = 0; i < 10; i++) out[i] = (num & (1 << i)) ? '|' : ' ';
    out[10] = '\0';
}
