# SetMacroInformation

## * Explanation :

Set macro information

## * Makefile Configuration :

```makefile
#----------------------------
# - Configure user macro information
#----------------------------
# -# Add user macro definitions #
#  - Note : 
#    -- You can use macros in your application.
#    -- = __YE         Equivalent to C language #define __YE
#    -- = __YE=1       Equivalent to C language #define __YE 1
#    -- __YE=\"hello\" Equivalent to C language #define __YE "hello"
#  - Example : 
#    -- ?= __YE __CC __VERSION=\"1.0.0\"
#    -- += __YECC=\"hello\"
#    -- += __YECC_NUM=1
#    -- += APP_VERSION=\"1.0.0\"
MF_CONFIGURE_ADD_USER_DEFINE ?= _DEBUG
MF_CONFIGURE_ADD_USER_DEFINE += _PROJECT_NAME=\"Makefile\"
MF_CONFIGURE_ADD_USER_DEFINE += _VERSION_NUMBER=\"2.0.0\"
MF_CONFIGURE_ADD_USER_DEFINE += _PROJECT_DESCRIPTION=\"This_is_a_sample_project.\"
MF_CONFIGURE_ADD_USER_DEFINE += _NUM=100
MF_CONFIGURE_ADD_USER_DEFINE += _PRINT_HELLO_WORLD=0
```

```makefile
#----------------------------
# - Specify the compiler version
#----------------------------
#  - Note : 
#    -- When the value of MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE is C_TYPE, use MF_CONFIGURE_C_FLAGS; otherwise, use MF_CONFIGURE_CPP_FLAGS.
#    -- += -std=c99
#    -- += -std=c++11
#  - Example : 
#    -- += -std=c99
#    -- += -std=c++11
#    -- +=

MF_CONFIGURE_C_FLAGS   += -std=c99
MF_CONFIGURE_CPP_FLAGS += -std=c++11
```

```makefile
# -# Configure the Windows tool path #
#  - Note : 
#   -- This is mainly applicable to the situation where makefile is used in Windows.
#   -- In Linux, this setting is not necessary and can be omitted, such as ?=
#   -- When using makefile in Windows, the Windows tool path must be configured.
#   -- You can find the tools in the ./tools/ directory.
#  - Example : 
#    -- ?= ./tools/windows_tools_x86/usr/bin/
#    -- ?= ./tools/windows_tools_arm/usr/bin/
#    -- ?= ./tools/windows_tools/usr/bin/
#    -- ?= ./tools
MF_CONFIGURE_WINDOWS_TOOLS ?= ../../tools/windows_tools/usr/bin/
```

## * main.c Source code :

```c
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
```


## * Execution steps : 

make

## * Output result :

```sh
Project Name   : Makefile
Version number : 2.0.0
Description    : This_is_a_sample_project.
num    : 100
Hello Makefile.
```

# The MIT License (MIT)

\# https://mit-license.org/

Copyright © 2025 <Yezc/Makefile>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
