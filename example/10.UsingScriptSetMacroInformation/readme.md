# UsingScriptSetMacroInformation

## * Explanation :

Set macro information using the script

## * Makefile Configuration :

```makefile
#----------------------------
# - Script-Related Configuration
#----------------------------
# -# Only script compilation method #
#  - Parameter = [YES]  Can only be compiled by the script, using make will prompt to use the script to execute (the variable MF_CONFIGURE_ONLY_STARTED_BY_SCRIPT must be set to YES in the script).
#  - Parameter = [NO]   Can be compiled directly using make.
MF_CONFIGURE_ONLY_STARTED_BY_SCRIPT ?= YES
```

## * build_v1.0.0_debug.sh Configuration :

```sh
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

CONFIGURE_ADD_USER_MACROS="_DEBUG"
CONFIGURE_ADD_USER_MACROS+=" _PROJECT_NAME=\\\"Makefile_debug\\\""
CONFIGURE_ADD_USER_MACROS+=" _VERSION_NUMBER=\\\"1.0.0\\\""
CONFIGURE_ADD_USER_MACROS+=" _PROJECT_DESCRIPTION=\\\"This_is_a_sample_project.\\\""
CONFIGURE_ADD_USER_MACROS+=" _NUM=100"
CONFIGURE_ADD_USER_MACROS+=" _PRINT_HELLO_WORLD=1"

export MF_CONFIGURE_ADD_USER_DEFINE=$CONFIGURE_ADD_USER_MACROS

#----------------------------
# - Log configuration
#----------------------------
# -# The compilation process console log is displayed in a formatted manner #
#  - Parameter = [YES] Using formatted display, which can print the currently compiling file name in a neatly formatted manner.
#  - Parameter = [NO]  Print compilation logs.
export MF_CONFIGURE_USING_FORMATTEND_LOG="NO"
```

## * build_v4.0.0_release.sh Configuration :

```sh
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
export MF_CONFIGURE_ADD_USER_DEFINE="_RELEASE \
                                      _PROJECT_NAME=\\\"Makefile_release\\\" \
                                      _VERSION_NUMBER=\\\"4.0.0\\\" \
                                      _PROJECT_DESCRIPTION=\\\"This_is_a_sample_project.\\\" \
                                      _NUM=400 \
                                      _PRINT_HELLO_WORLD=4"


#----------------------------
# - Log configuration
#----------------------------
# -# The compilation process console log is displayed in a formatted manner #
#  - Parameter = [YES] Using formatted display, which can print the currently compiling file name in a neatly formatted manner.
#  - Parameter = [NO]  Print compilation logs.
export MF_CONFIGURE_USING_FORMATTEND_LOG="NO"
```

## * build_v2.0.0_debug.bat Configuration :

```bat
::----------------------------
:: - Configure user macro information
::----------------------------
:: -:: Add user macro definitions ::
::  - Note : 
::    -- You can use macros in your application.
::    -- = __YE         Equivalent to C language ::define __YE
::    -- = __YE=1       Equivalent to C language ::define __YE 1
::    -- __YE=\"hello\" Equivalent to C language ::define __YE "hello"
::  - Example : 
::    -- ?= __YE __CC __VERSION=\"1.0.0\"
::    -- += __YECC=\"hello\"
::    -- += __YECC_NUM=1
::    -- += APP_VERSION=\"1.0.0\"

set "CONFIGURE_ADD_USER_MACROS=_DEBUG"
set "CONFIGURE_ADD_USER_MACROS=%CONFIGURE_ADD_USER_MACROS% _PROJECT_NAME=\"Makefile_debug\""
set "CONFIGURE_ADD_USER_MACROS=%CONFIGURE_ADD_USER_MACROS% _VERSION_NUMBER=\"2.0.0\""
set "CONFIGURE_ADD_USER_MACROS=%CONFIGURE_ADD_USER_MACROS% _PROJECT_DESCRIPTION=\"This_is_a_sample_project.\""
set "CONFIGURE_ADD_USER_MACROS=%CONFIGURE_ADD_USER_MACROS% _NUM=200"
set "CONFIGURE_ADD_USER_MACROS=%CONFIGURE_ADD_USER_MACROS% _PRINT_HELLO_WORLD=2"

set "MF_CONFIGURE_ADD_USER_DEFINE=%CONFIGURE_ADD_USER_MACROS%"

::----------------------------
:: - Log configuration
::----------------------------
:: -:: The compilation process console log is displayed in a formatted manner ::
::  - Parameter = [YES] Using formatted display, which can print the currently compiling file name in a neatly formatted manner.
::  - Parameter = [NO]  Print compilation logs.
set "MF_CONFIGURE_USING_FORMATTEND_LOG=NO"

::----------------------------
:: - Configuration tool
::----------------------------
:: -:: Configure the Windows tool path ::
::  - Note : 
::   -- This is mainly applicable to the situation where makefile is used in Windows.
::   -- In Linux, this setting is not necessary and can be omitted, such as ?=
::   -- When using makefile in Windows, the Windows tool path must be configured.
::   -- You can find the tools in the ./tools/ directory.
::  - Example : 
::    -- ?= ./tools/windows_tools_x86/usr/bin/
::    -- ?= ./tools/windows_tools_arm/usr/bin/
::    -- ?= ./tools/windows_tools/usr/bin/
::    -- ?= ./tools
set "MF_CONFIGURE_WINDOWS_TOOLS=../../tools/windows_tools/usr/bin/"
```

## * build_v3.0.0_release.bat Configuration :

```bat
::----------------------------
:: - Configure user macro information
::----------------------------
:: -:: Add user macro definitions ::
::  - Note : 
::    -- You can use macros in your application.
::    -- = __YE         Equivalent to C language ::define __YE
::    -- = __YE=1       Equivalent to C language ::define __YE 1
::    -- __YE=\"hello\" Equivalent to C language ::define __YE "hello"
::  - Example : 
::    -- ?= __YE __CC __VERSION=\"1.0.0\"
::    -- += __YECC=\"hello\"
::    -- += __YECC_NUM=1
::    -- += APP_VERSION=\"1.0.0\"
set "MF_CONFIGURE_ADD_USER_DEFINE=_RELEASE _PROJECT_NAME=\"Makefile_release\" _VERSION_NUMBER=\"3.0.0\" _PROJECT_DESCRIPTION=\"This_is_a_sample_project.\" _NUM=300 _PRINT_HELLO_WORLD=3"

::----------------------------
:: - Log configuration
::----------------------------
:: -:: The compilation process console log is displayed in a formatted manner ::
::  - Parameter = [YES] Using formatted display, which can print the currently compiling file name in a neatly formatted manner.
::  - Parameter = [NO]  Print compilation logs.
set "MF_CONFIGURE_USING_FORMATTEND_LOG=NO"

::----------------------------
:: - Configuration tool
::----------------------------
:: -:: Configure the Windows tool path ::
::  - Note : 
::   -- This is mainly applicable to the situation where makefile is used in Windows.
::   -- In Linux, this setting is not necessary and can be omitted, such as ?=
::   -- When using makefile in Windows, the Windows tool path must be configured.
::   -- You can find the tools in the ./tools/ directory.
::  - Example : 
::    -- ?= ./tools/windows_tools_x86/usr/bin/
::    -- ?= ./tools/windows_tools_arm/usr/bin/
::    -- ?= ./tools/windows_tools/usr/bin/
::    -- ?= ./tools
set "MF_CONFIGURE_WINDOWS_TOOLS=../../tools/windows_tools/usr/bin/"
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
    printf("Hello Makefile Release.\n");
    return 0;
}

#endif
```


## * Execution steps : 

linux: 
```sh
build_v1.0.0_debug.sh
build_v4.0.0_release.sh
```
windows: 
```bat
build_v2.0.0_debug.bat
build_v3.0.0_release.bat
```

## * Output result :

### linux: 

build_v1.0.0_debug.sh
```sh
Project Name   : Makefile_debug
Version number : 1.0.0
Description    : This_is_a_sample_project.
num    : 100
Hello, World!
```

build_v4.0.0_release.sh
```sh
Project Name   : Makefile_release
Version number : 4.0.0
Description    : This_is_a_sample_project.
num    : 400
Hello Makefile Release.
```

### windows: 

build_v2.0.0_debug.bat
```bat
Project Name   : Makefile_debug
Version number : 2.0.0
Description    : This_is_a_sample_project.
num    : 200
Hello Makefile.
```

build_v3.0.0_release.bat
```bat
Project Name   : Makefile_release
Version number : 3.0.0
Description    : This_is_a_sample_project.
num    : 300
Hello Makefile Release.
```

# The MIT License (MIT)

\# https://mit-license.org/

Copyright © 2025 <Yezc/Makefile>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
