#include <stdio.h>
#include "print_pascals_triangle.h"
void print_pascals_triangle(int rows)
{
    int arr[rows][rows];
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j <= i; j++) {
            if (j == 0 || j == i) arr[i][j] = 1;
            else arr[i][j] = arr[i-1][j-1] + arr[i-1][j];
        }
    }
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j <= i; j++) printf("%d ", arr[i][j]);
        printf("\n");
    }
}
