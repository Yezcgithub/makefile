#include <stdio.h>
#include "print_snake_matrix.h"
void print_snake_matrix(int n)
{
    int matrix[n][n];
    int num = 1;
    for (int i = 0; i < n; i++) {
        if (i % 2 == 0) {
            for (int j = 0; j < n; j++) matrix[i][j] = num++;
        } else {
            for (int j = n-1; j >= 0; j--) matrix[i][j] = num++;
        }
    }
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) printf("%2d ", matrix[i][j]);
        printf("\n");
    }
}
