#include <stdio.h>
#include "generate_qr_code.h"
void generate_qr_code(const char *data, char *out)
{
    // 简化实现
    for (int i = 0; i < 21; i++) {
        for (int j = 0; j < 21; j++) {
            out[i*22+j] = (i+j) % 2 ? 'X' : ' ';
        }
    }
    out[21*22] = '\0';
}