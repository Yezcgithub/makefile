#include <stdio.h>
#include "bitwise_operation.h"

int bit_and(int a, int b)
{ 
    return a & b; 
}

int bit_or(int a, int b)
{ 
    return a | b; 
}

int bit_xor(int a, int b)
{ 
    return a ^ b; 
}

int bit_not(int a)
{ 
    return ~a; 
}

int left_shift(int a, int n)
{ 
    return a << n; 
}

int right_shift(int a, int n)
{ 
    return a >> n; 
}
