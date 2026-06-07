#include <stdio.h>

#ifdef _DEBUG
int main(int argc, char **argv)
{

#ifdef _PROJECT_NAME
    printf("Project Name   : %s\n", _PROJECT_NAME);
#endif

#ifdef _VERSION_NUMBER
    printf("Version number : %s\n", _VERSION_NUMBER);
#endif

#ifdef _PROJECT_DESCRIPTION
    printf("Description    : %s\n", _PROJECT_DESCRIPTION);
#endif

#ifdef _NUM
    printf("num    : %d\n", _NUM);
#endif

#if (_PRINT_HELLO_WORLD == 1)
    printf("Hello, World!\n");

#else
    printf("Hello Makefile.\n");
#endif

    return 0;
}

#else
int main(int argc, char **argv)
{
    printf("Hello Makefile Release.\n");
    return 0;
}

#endif
