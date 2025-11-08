#include <stdio.h>
#include "print_spiral_numbers.h"
void print_spiral_numbers(int size)
{
    int matrix[size][size];
    int num = 1;
    for (int layer = 0; layer < (size+1)/2; layer++) {
        for (int i = layer; i < size - layer; i++) matrix[layer][i] = num++;
        for (int i = layer + 1; i < size - layer; i++) matrix[i][size-1-layer] = num++;
        for (int i = size - 2 - layer; i >= layer; i--) matrix[size-1-layer][i] = num++;
        for (int i = size - 2 - layer; i > layer; i--) matrix[i][layer] = num++;
    }
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) printf("%2d ", matrix[i][j]);
        printf("\n");
    }
}

