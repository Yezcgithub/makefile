#include <stdio.h>
#include "print_calendar.h"
void print_calendar(int year, int month)
{
    int i = 0;
    int days = 31;
    int first = 1;
    printf("Su Mo Tu We Th Fr Sa\n");
    for (i = 0; i < first; i++) printf("   ");
    for (i = 1; i <= days; i++) {
        printf("%2d ", i);
        if ((i + first - 1) % 7 == 0) printf("\n");
    }
}
