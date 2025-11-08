#include <stdio.h>
#include "generate_number_sequence.h"
void generate_number_sequence(int start, int end, char *buf)
{
    int idx = 0;
    for (int i = start; i <= end; i++) buf[idx++] = (char)('0' + i);
    buf[idx] = '\0';
}