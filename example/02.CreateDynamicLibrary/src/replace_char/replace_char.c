#include <stdio.h>
#include "replace_char.h"
void replace_char(char *str, char old, char new)
{
    for (; *str; str++) if (*str == old) *str = new;
}
