#include <stdio.h>
#include "generate_alphabet.h"
void generate_alphabet(char *buf)
{
    for (int i = 0; i < 26; i++) buf[i] = (char)('A' + i);
    buf[26] = '\0';
}
