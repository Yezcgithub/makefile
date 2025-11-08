#include <stdio.h>
#include "split_string.h"
void split_string(const char *in, char *out, char delimiter)
{
    int i = 0;
    while (*in && i < 100) {
        if (*in == delimiter) {
            out[i++] = '\0';
            return;
        }
        out[i++] = *in++;
    }
    out[i] = '\0';
}
