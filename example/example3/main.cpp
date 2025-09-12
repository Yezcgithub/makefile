#include <iostream>
#include "src/addition/addition.h"
void print() {
    std::cout << std::endl;
}

template <typename T, typename... Args>
void print(T first, Args... args) {
    std::cout << first << " ";
    print(args...);
}

int main() {
    print(1, "Hello", 3.14, 'A');
    
    int a = 10;
    int b = 5;
    int c = 0;
    c = my_add(a, b);
    std::cout << "a + b = " << c << std::endl;

    return 0;
}