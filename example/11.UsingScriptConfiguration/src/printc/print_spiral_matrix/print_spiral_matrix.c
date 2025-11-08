#include <stdio.h>
#include "print_spiral_matrix.h"
void print_spiral_matrix(int n)
{
    int matrix[n][n];
    int num = 1;
    for (int layer = 0; layer < (n+1)/2; layer++) {
        for (int i = layer; i < n - layer; i++) matrix[layer][i] = num++;
        for (int i = layer + 1; i < n - layer; i++) matrix[i][n-1-layer] = num++;
        for (int i = n - 2 - layer; i >= layer; i--) matrix[n-1-layer][i] = num++;
        for (int i = n - 2 - layer; i > layer; i--) matrix[i][layer] = num++;
    }
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) printf("%2d ", matrix[i][j]);
        printf("\n");
    }
}
