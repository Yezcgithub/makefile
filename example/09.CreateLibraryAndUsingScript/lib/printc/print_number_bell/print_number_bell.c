#include <stdio.h>
#include "print_number_bell.h"
void print_number_bell(void)
{
    for (int i = 1; i <= 5; i++) {
        for (int j = 1; j <= i; j++) printf("%d", j);
        printf("\n");
    }
    for (int i = 4; i >= 1; i--) {
        for (int j = 1; j <= i; j++) printf("%d", j);
        printf("\n");
    }
}
