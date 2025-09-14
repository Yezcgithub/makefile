# A cross-platform universal Makefile file



## 1、Project Overview

​	I'm very glad that you can see this open-source project. I hope this project can be of help to you.
​	This is a project that can be directly used for enterprise development.

​	The path of the project on GitHub : https://github.com/Yezcgithub/makefile
​	The path of the project on Gitee   : https://gitee.com/yezc/makefile

## 2、Project Features

1. Support cross-platform
2. Support configurable cross-compilation
3. Support configurable compilation of either C language files or a mixture of C and C++ files
4. Support configurable generation of target files including executable programs, dynamic libraries, static libraries, and simultaneous generation of dynamic and static libraries
5. Support configurable generation of release, debug, and simultaneous generation of release and debug versions
6. Support configurable saving locations for generated target files and generated intermediate files
7. Support generation of preprocessor files and assembly file commands
8. Support the configuration of parameters in the script

## 3、Advantages

1. Simple, with only one Makefile file as the core.
2. Cross-platform, it can automatically identify the current platform and can be used directly without any configuration.
   - In Linux, you can simply copy the Makefile file to the project directory and it can be used directly.
   - In Windows, busybox support is required. You can find it in "./tools/windows_tools". Alternatively, you can download the latest version from the busybox official website: https://frippery.org/busybox/. When using the Makefile in Windows, simply copy the Makefile file and the "tools" folder together to your project directory.
3. The configuration is convenient. In the Makefile file, you only need to pay attention to the variables prefixed with "MF_CONFIGURE_", and a large number of explanations and examples have been added. This makes it very convenient to meet the personalized management requirements for each project.
4. When used in conjunction with the script, you can directly configure your personalized requirements within the script without modifying the Makefile. You can view the build.sh script file (used on Linux) and the build.bat script file (used on Windows) in the project.
5. Robustness. In the Makefile, many checks have been added. This can reduce the likelihood of errors during the execution of make and can proactively alert you to any configuration issues.
6. It is convenient for learning. If you want to learn or understand the knowledge of Makefile files in the near future, this project is an excellent learning resource. Most of the Makefile knowledge points are used in this project, and there are also a large number of comments and explanations. The make.pdf file is saved in the "./doc" folder, which is also an indispensable reference file on your learning journey. Of course, you can also download the latest documentation from the Make website: https://www.gnu.org/software/make/

## 4、Configuration Instructions

### 1、Configuration related to the script

```makefile
# -#Configuration compilation method#
#  Parameter = [YES] It can only be compiled by a script. When using make for compilation, it will prompt to use the script for execution (the script must set this variable and the value must not be "YES")
#  Parameter = [NO]  You can directly use "make" to compile.
MF_CONFIGURE_ONLY_STARTED_BY_SCRIPT        ?= NO
```

### 2、Configuration files and paths

```makefile
# -# Configure to generate the target file name #
#  Note: Cannot be empty
#  Example: 
#  -  ?= main
#  -  ?= test
MF_CONFIGURE_TARGET_FILE_NAME              ?= main

# -# Configure the target file directory generation #
#  The default is the folder where the Makefile is located (./build)
#  Example: 
#  -  ?= ./build
#  -  ?= ./output
#  -  ?= .
MF_CONFIGURE_TARGET_FILE_OUTPUT_PATH       ?= ./build

# -# Configuration for the output directory of intermediate files during compilation #
#  The default is the source code folder (./build/output)
#  Example: 
#  -  ?= ./build/output
#  -  ?= ./output
#  -  ?= .
MF_CONFIGURE_INTERMEDIATE_FILE_OUTPUT_PATH ?= ./build/output

# -# The root directory (including subfolders) for compiling the source code #
# Add multiple root directories separated by spaces, for example: (./src ./lib)
# Note: It will automatically include all subfolders under the directory, so no need to repeatedly add subfolders
# Default is the folder where the Makefile is located and all its subfolders (.)
#  Example: 
#  -  ?= .
#  -  ?= ./src ../timer
#  -  += ./test
MF_CONFIGURE_SOURCE_CODE_DIRECTORYS        ?= .

# -# The configuration requires excluding all source file directories (including all subdirectories) in this folder#
#  Add multiple entries separated by spaces. For example: (./src ./lib)
#  Note: It will automatically include all subdirectories within the directory, so no need to repeatedly add subdirectories
#  Default is empty
#  Example: 
#  -  ?= ./lib
#  -  ?= ./clib ./lib
#  -  += ./libtest
MF_CONFIGURE_EXCLUDED_DIRECTORYS_RECURSION ?=

# -# The configuration requires the exclusion of all source file directories in this folder#
#  Add multiple directories separated by spaces. For example: = . ./lib ./lib/test ./lib/timer
#  Note: Only the added directories will take effect
#  Default is empty
#  Example: 
#  -  ?= . ./lib
#  -  ?= . ./lib ./lib/test ./lib/timer
#  -  += ./libtest
MF_CONFIGURE_EXCLUDED_DIRECTORYS           ?=

# -# Configuration for excluding files #
# Add multiple files separated by spaces. For example: = ./src/main.c ./lib/test.c
# Default is empty
#  Example: 
#  -  ?= ./test.c
#  -  ?= ./src/main.c ./lib/test.c ./lib/timer/test.c
#  -  += ./src/test.c
MF_CONFIGURE_EXCLUDED_FILES                ?=

# -# Add header file paths other than the root directory and its subfolders#
#  Add multiple paths separated by spaces. For example: = ../ .. /inc /lib/inc
#  Example: 
#  -  ?= .
#  -  ?= ../src/inc ./lib
#  -  += ../lib/inc
MF_CONFIGURE_OTHER_INCLUDE_PATHS           ?=
```

### 3、Add parameter configuration

```makefile
# -# The third-party libraries used in the program, need to be added during compilation#
# -L: The directory name where the dependent libraries are located
# -l: The specific library to be used -L./lib -ltest
#    When calling standard libraries, such as: if using threads, add -pthread
#    When calling your own libraries or third-party libraries, you need to write the path of the library
#    For example: if libtest.so is placed in the directory /aaa/bbb/ccc, then the linking parameter is -L/aaa/bbb/ccc -ltest
#    If using dynamic libraries, add the library directory to the environment variable
#    For example: /data/lib/libtest.so, export LD_LIBRARY_PATH=/data/lib:$LD_LIBRARY_PATH
# -# Standard libraries #
#  Example: 
#  -  ?= -lpthread -lrt -lm -ldl
#  -  += -ldl
MF_CONFIGURE_USING_STD_LIBRARY_FLAGS       ?= 

# -#The libraries written by oneself or those from third parties#
#  Example: 
#  -  ?= -L./lib/timer -ltimer -L./lib/test -ltest
#  -  += -L./lib/media -lmedia
#  -  += -L./lib -ltest -ltest1 -ltest2
MF_CONFIGURE_USING_LIBRARY_FLAGS           ?=

# -# Add User Macro Definitions #
#  These macros can be used in the application
#  = __YE           Equivalent to C language #define __YE
#  = __YE=1         Equivalent to C language #define __YE 1
#  = __YE="hello"   Equivalent to C language #define __YE "hello"
#  Example: 
#  -  ?= __YE __CC
#  -  += __YECC=hello
#  -  += __YECC_NUM=1
#  -  += APP_VERSION=1.0.0
MF_CONFIGURE_ADD_USER_DEFINE               ?=
```

### 4、Set file compilation options

```makefile
# -#Output type of the compiled target file#
# Parameter = [RELEASE] Remove the symbol table from the executable file. The symbol table does not affect the program's operation and can reduce the file size.
# Parameter = [DEBUG] Keep the symbol table in the executable file. Set to NO when using gdb for debugging.
# Parameter = [RELEASE_AND_DEBUG] Keep both the RELEASE and DEBUG executable files.
MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG       ?= RELEASE_AND_DEBUG

# -#Compilation output file type#
# Parameter = [EXECUTE]                    Generates an executable program
# Parameter = [LIBRARY_DYNAMIC]            Generates (.so) dynamic library file
# Parameter = [LIBRARY_STATIC]             Generates (.a) static library file
# Parameter = [LIBRARY_STATIC_AND_DYNAMIC] Generates (.a and .so) dynamic-static library file
MF_CONFIGURE_OUTPUT_TARGET_FILE_TYPE       ?= EXECUTE

# -#Compile the original file type#
# Parameter = [CPP_TYPE] Compiles both C and CPP files
# Parameter = [C_TYPE]   Compiles only C files
MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE    ?= CPP_TYPE

# -#Whether to use static compilation (only applicable for generating executable programs)#
# Parameter = [YES] Use static compilation
# Parameter Explanation: During compilation, all dependent files will be included. It has less dependence on the running environment and is highly compatible; however, the generated program is relatively large.
# Parameter = [NO] Use dynamic compilation
# Parameter Explanation: After compilation, the program size is smaller and it relies on dynamic libraries. It cannot run independently.
MF_CONFIGURE_USING_STATIC_COMPILATION      ?= NO

# -#Delete intermediate files after compilation(.d, .o, .i, .ii, .s)#
# Parameter = [YES] Delete intermediate files. Each compilation will be a full compilation.
# Parameter = [NO] Keep intermediate files.
MF_CONFIGURE_DELETING_INTERMEDIATE_FILES   ?= NO

# -# The console log during the compilation process is displayed in a formatted manner#
# Parameter = [YES] Displays the formatted log, allowing the filenames being compiled to be printed neatly
# Parameter = [NO]  Prints the default log
MF_CONFIGURE_USING_FORMATTEND_LOG          ?= YES
```

### 5、Debugging options

```makefile
#  += -g        During compilation, generate debugging information
#  += -gstabs   This option claims debugging information in stabs format, but does not include gdb debugging information.
#  += -gstabs+  This option claims debugging information in stabs format and includes additional debugging information specifically for gdb.
#  += -ggdb     This option will generate as much gdb-compatible debugging information as possible.
#  += -glevel   Request to generate debugging information, and specify the level of information needed using the 'level' parameter. The default level value is 2.
MF_CONFIGURE_C_FLAGS      += -g
MF_CONFIGURE_CPP_FLAGS    += -g
```

### 6、Error and Alert Options

```makefile
#  += -w , To disable all compilation warnings
#  += -Wall , To enable all common warnings (unused variables, uninitialized variables, undeclared functions, etc.)
#  += -Wextra , To add additional warnings beyond -Wall (such as empty parameters, implicit loss of type conversions, etc.)
#  += -Wunused-function , To detect static functions that are declared but unused
#  += -Wunused-label , To detect unused labels (such as goto jump labels remaining after deletion)
#  += -Wshadow , To give a warning when a local variable shadows another local variable or a global variable
#  += -Wunreachable-code , To give a warning if the compiler detects code that will never be executed
#  += -Wundef , To give a warning when a symbol that has not been defined appears in #if
#  += -Werror , To convert all warnings into errors, terminating the compilation process when a warning occurs
#  += -Wfatal-errors , To stop when the first error is encountered
#  += -Wconversion , To give a warning for implicit type conversions (such as int to short, which may lose precision)
#  += -Wstrict-prototypes , To require explicit parameter types in function declarations (disable the form of int foo())
#  += -pedantic , To allow all warnings listed in the ANSI/ISO C standard
#  += -pedantic-errors , To allow all errors listed in the ANSI/ISO C standard
#  += -Wno-conversion , To disable warnings for implicit type conversions
#  += -Wno-unused-variable , To disable warnings for unused variables
#  += -Wno-unused-label , To disable warnings for unused labels
#  += -Wno-unused-variable , To disable warnings for unused variables
#  += -Wno-unused-label , To disable warnings for unused labels
#  += -Wno-unused-function , To disable warnings for unused functions
MF_CONFIGURE_C_FLAGS      += -Wall -Werror -Wfatal-errors -Wunused-function -Wunused-label -Wconversion -Wstrict-prototypes
MF_CONFIGURE_CPP_FLAGS    += -Wall -Werror -Wfatal-errors -Wunused-function -Wunused-label -Wconversion -Wstrict-prototypes
```

### 7、Other parameter settings

```makefile

#----------------------------
# -Dynamic library export symbols
#----------------------------
#  It is recommended to disable in the RELEASE version.
#  += -rdynamic  Dynamic library export symbols
#MF_CONFIGURE_C_FLAGS      += -rdynamic
#MF_CONFIGURE_CPP_FLAGS    += -rdynamic

#----------------------------
# -Specified compiler
#----------------------------
#MF_CONFIGURE_C_FLAGS      += -std=c99
#MF_CONFIGURE_CPP_FLAGS    += -std=c++98

#----------------------------
# -Compiler optimization level
#----------------------------
# += -O0 No optimization, retains complete debugging information, code execution is the slowest, suitable for development and debugging phases
# += -O1 Basic optimization, slightly improves performance, does not affect debugging, debugging version with low performance requirements
# += -O2 Medium optimization, fully enables security optimizations, significantly improves performance, compile time is controllable, default choice for release versions
# += -O3 Highly optimized, may increase code size and compilation time, occasionally has compatibility issues, code execution speed is fast, suitable for specific scenarios such as high-performance computing
#MF_CONFIGURE_C_FLAGS      += -O2
#MF_CONFIGURE_CPP_FLAGS    += -O2

#----------------------------
# -Other options
#----------------------------
#MF_CONFIGURE_C_FLAGS      +=
#MF_CONFIGURE_CPP_FLAGS    +=

#----------------------------
# -Options for generating the .o file during compilation
#----------------------------
# -MMD: Generate dependency files, automatically generate .d dependency files, such as main.c → main.d
# -MP: Add a non-dependent pseudo-target for each header file in the generated .d file. This prevents make from reporting errors when the header file is deleted
# -fPIC: Generate position-independent code, used for compiling dynamic libraries. However, this is generally not used here
MF_CONFIGURE_C_OBJECTS_FLAGS      ?= -MMD -MP
MF_CONFIGURE_CPP_OBJECTS_FLAGS    ?= -MMD -MP

#----------------------------
# -Compilation tool configuration
#----------------------------
# - Specifies the path prefix for the used compiler tool
#  By default, it is empty. When compiling, the resulting program will be an executable for the current system
#  For cross-compilation, the path prefix of the compiler tool must be specified
#  Example:
#  -  ?=
#  -  ?= arm-linux-
#  -  ?= arm-linux-gnueabi-
#  -  ?= arm-linux-gnueabihf-
MF_CONFIGURE_COMPILE_PATH_PREFIX   ?= 

#----------------------------
# -Platform configuration
#----------------------------
# - This determines in which platform the makefile is used.
# By default, it is set to ?= $(OS), which can automatically detect whether it is on a Windows system.
# Of course, it can also be specified manually directly.
#  Example:
#  -  auto    ：$(OS)
#  -  windows ：?= WINDOWS or ?= Windows_NT
#  -  linux   ：?= LINUX   or ?=
MF_CONFIGURE_PLATFORM_OS          ?= $(OS)

#----------------------------
# -Configuration of the busybox tool
#----------------------------
# This is mainly applicable to the situation where makefile is used in Windows.
# In Linux, this setting is not necessary and can be omitted, such as ? =
# When using makefile in Windows, the busybox tool path must be configured.
# You can find busybox.exe in the ./tools/ directory.
# You can also download it from the busybox official website at https://frippery.org/busybox/
#  Example:
#  -  ?= "./tools/windows_tools/busybox"
#  -  ?= "./tools/busybox"
MF_CONFIGURE_BUSYBOX_TOOLS         ?= "./tools/windows_tools/busybox"
```



# The MIT License (MIT)

\# https://mit-license.org/

Copyright © 2025 <copyright holders>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
