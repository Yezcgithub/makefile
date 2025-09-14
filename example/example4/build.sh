#!/bin/bash
#============================
# -Project Information
#============================
# @file build.sh
# @author yezc
# @General makefile file
# @Coding format UTF-8
# https://github.com/Yezcgithub/makefile
# https://gitee.com/yezc/makefile

#============================
# -License
#============================
# https://mit-license.org/
# The MIT License (MIT)
# Copyright © 2025 <copyright holders>
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software 
# and associated documentation files (the “Software”), to deal in the Software without restriction, 
# including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
# and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all copies or 
# substantial portions of the Software.

# THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING 
# BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND 
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
# DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#----------------------------
# -Configuration related to the script
#----------------------------
# -#Configuration compilation method#
#  Parameter="build.sh"
export MF_CONFIGURE_ONLY_STARTED_BY_SCRIPT="build.sh"

#----------------------------
# -Configuration files and paths
#----------------------------
# -# Configure to generate the target file name #
#  Note: Cannot be empty
#  Example: 
#  -  = "main"
#  -  = "test"
export MF_CONFIGURE_TARGET_FILE_NAME="test"

# -# Configure the target file directory generation #
#  The default is the folder where the Makefile is located (.)
#  Example: 
#  -  = "./build"
#  -  = "./output"
#  -  = "."
export MF_CONFIGURE_TARGET_FILE_OUTPUT_PATH="."

# -# Configuration for the output directory of intermediate files during compilation #
#  The default is the source code folder ()
#  Example: 
#  -  = "./build/output"
#  -  = "./output"
#  -  = "."
export MF_CONFIGURE_INTERMEDIATE_FILE_OUTPUT_PATH="./build/output"

# -# The root directory (including subfolders) for compiling the source code #
# Add multiple root directories separated by spaces, for example: (./src ./lib)
# Note: It will automatically include all subfolders under the directory, so no need to repeatedly add subfolders
# Default is the folder where the Makefile is located and all its subfolders (.)
#  Example: 
#  -  = "."
#  -  = "./src ../timer"
#  -  = "./test"
export MF_CONFIGURE_SOURCE_CODE_DIRECTORYS="."

# -# The configuration requires excluding all source file directories (including all subdirectories) in this folder#
#  Add multiple entries separated by spaces. For example: (./src ./lib)
#  Note: It will automatically include all subdirectories within the directory, so no need to repeatedly add subdirectories
#  Default is empty
#  Example: 
#  -  = "./lib"
#  -  = "./clib ./lib"
#  -  = "./libtest"
export MF_CONFIGURE_EXCLUDED_DIRECTORYS_RECURSION=""

# -# The configuration requires the exclusion of all source file directories in this folder#
#  Add multiple directories separated by spaces. For example: = . ./lib ./lib/test ./lib/timer
#  Note: Only the added directories will take effect
#  Default is empty
#  Example: 
#  -  = ". ./lib"
#  -  = ". ./lib ./lib/test ./lib/timer"
#  -  = "./libtest"
export MF_CONFIGURE_EXCLUDED_DIRECTORYS=""

# -# Configuration for excluding files #
# Add multiple files separated by spaces. For example: = ./src/main.c ./lib/test.c
# Default is empty
#  Example: 
#  -  = "./test.c"
#  -  = "./src/main.c ./lib/test.c ./lib/timer/test.c"
#  -  = "./src/test.c"
export MF_CONFIGURE_EXCLUDED_FILES=""

# -# Add header file paths other than the root directory and its subfolders#
#  Add multiple paths separated by spaces. For example: = ../ .. /inc /lib/inc
#  Example: 
#  -  = "."
#  -  = "../src/inc ./lib"
#  -  = "../lib/inc"
export MF_CONFIGURE_OTHER_INCLUDE_PATHS=""

#----------------------------
# -Add configuration
#----------------------------
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
#  -  = "-lpthread -lrt -lm -ldl"
#  -  += "-ldl"
export MF_CONFIGURE_USING_STD_LIBRARY_FLAGS=""

# -#The libraries written by oneself or those from third parties#
#  Example: 
#  -  = "-L./lib/timer -ltimer -L./lib/test -ltest"
#  -  = "-L./lib/media -lmedia"
#  -  = "-L./lib -ltest -ltest1 -ltest2"
export MF_CONFIGURE_USING_LIBRARY_FLAGS=""

# -# Add User Macro Definitions #
#  These macros can be used in the application
#  = __YE           Equivalent to C language #define __YE
#  = __YE=1         Equivalent to C language #define __YE 1
#  = __YE="hello"   Equivalent to C language #define __YE "hello"
#  Example: 
#  -  = "__YE __CC"
#  -  = "__YECC=hello"
#  -  = "__YECC_NUM=1"
#  -  = "APP_VERSION=1.0.0"
export MF_CONFIGURE_ADD_USER_DEFINE=""

#----------------------------
# -Compilation configuration
#----------------------------
# -#Output type of the compiled target file#
# Parameter = [RELEASE] Remove the symbol table from the executable file. The symbol table does not affect the program's operation and can reduce the file size.
# Parameter = [DEBUG] Keep the symbol table in the executable file. Set to NO when using gdb for debugging.
# Parameter = [RELEASE_AND_DEBUG] Keep both the RELEASE and DEBUG executable files.
export MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG="DEBUG"

# -#Compilation output file type#
# Parameter = [EXECUTE]                    Generates an executable program
# Parameter = [LIBRARY_DYNAMIC]            Generates (.so) dynamic library file
# Parameter = [LIBRARY_STATIC]             Generates (.a) static library file
# Parameter = [LIBRARY_STATIC_AND_DYNAMIC] Generates (.a and .so) dynamic-static library file
export MF_CONFIGURE_OUTPUT_TARGET_FILE_TYPE="EXECUTE"

# -#Compile the original file type#
# Parameter = [CPP_TYPE] Compiles both C and CPP files
# Parameter = [C_TYPE]   Compiles only C files
export MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE="CPP_TYPE"

# -#Whether to use static compilation (only applicable for generating executable programs)#
# Parameter = [YES] Use static compilation
# Parameter Explanation: During compilation, all dependent files will be included. It has less dependence on the running environment and is highly compatible; however, the generated program is relatively large.
# Parameter = [NO] Use dynamic compilation
# Parameter Explanation: After compilation, the program size is smaller and it relies on dynamic libraries. It cannot run independently.
export MF_CONFIGURE_USING_STATIC_COMPILATION="NO"

# -#Delete intermediate files after compilation(.d, .o, .i, .ii, .s)#
# Parameter = [YES] Delete intermediate files. Each compilation will be a full compilation.
# Parameter = [NO] Keep intermediate files.
export MF_CONFIGURE_DELETING_INTERMEDIATE_FILES="NO"

# -# The console log during the compilation process is displayed in a formatted manner#
# Parameter = [YES] Displays the formatted log, allowing the filenames being compiled to be printed neatly
# Parameter = [NO]  Prints the default log
export MF_CONFIGURE_USING_FORMATTEND_LOG="YES"

#----------------------------
# -Options for generating the .o file during compilation
#----------------------------
# -MMD: Generate dependency files, automatically generate .d dependency files, such as main.c → main.d
# -MP: Add a non-dependent pseudo-target for each header file in the generated .d file. This prevents make from reporting errors when the header file is deleted
# -fPIC: Generate position-independent code, used for compiling dynamic libraries. However, this is generally not used here
export MF_CONFIGURE_C_OBJECTS_FLAGS="-MMD -MP"
export MF_CONFIGURE_CPP_OBJECTS_FLAGS="-MMD -MP"

#----------------------------
# -Compilation tool configuration
#----------------------------
# - Specifies the path prefix for the used compiler tool
#  By default, it is empty. When compiling, the resulting program will be an executable for the current system
#  For cross-compilation, the path prefix of the compiler tool must be specified
#  Example:
#  -  =
#  -  = arm-linux-
#  -  = arm-linux-gnueabi-
#  -  = arm-linux-gnueabihf-
export MF_CONFIGURE_COMPILE_PATH_PREFIX=""

#----------------------------
# -Platform configuration
#----------------------------
# - This determines in which platform the makefile is used.
# By default, it is set to ?= $(OS), which can automatically detect whether it is on a Windows system.
# Of course, it can also be specified manually directly.
#  Example:
#  -  auto    $(OS)
#  -  windows = WINDOWS or = Windows_NT
#  -  linux   = LINUX   or =
#export MF_CONFIGURE_PLATFORM_OS="LINUX"

#----------------------------
# -Configuration of the busybox tool
#----------------------------
# This is mainly applicable to the situation where makefile is used in Windows.
# In Linux, this setting is not necessary and can be omitted, such as ? =
# When using makefile in Windows, the busybox tool path must be configured.
# You can find busybox.exe in the ./tools/ directory.
# You can also download it from the busybox official website at https://frippery.org/busybox/
#  Example:
#  -  = "./tools/windows_tools/busybox"
#  -  = "./tools/busybox"
#export MF_CONFIGURE_BUSYBOX_TOOLS="./tools/windows_tools/busybox"

#----------------------------
# -command
#----------------------------
case "$1" in
    all)
        make all
        ;;
    clean)
        make clean
        ;;
    preprocess)
        make preprocess
        ;;
    assemble)
        make assemble
        ;;
    object)
        make object
        ;;
    version)
        make version
        ;;
    *)
        make
        ;;
esac

exit 0

