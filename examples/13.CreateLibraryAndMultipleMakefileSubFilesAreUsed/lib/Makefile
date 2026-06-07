#============================
# - Project Information
#============================
# @File      : Makefile
# @Author    : Yezc
# @Encoding  : UTF-8
# @Description : A cross-platform Makefile for enterprise and general development
# This Makefile is suitable for small, medium, and large projects

# https://github.com/Yezcgithub/makefile
# https://gitee.com/yezc/makefile
# https://gitcode.com/Yeccc/makefile

#============================
# - License
#============================
# - MIT
# https://mit-license.org/

# Copyright © 2025 <Yezc/Makefile>
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

#============================
# - Makefile Configuration
#============================
#----------------------------
# - Script-Related Configuration
#----------------------------
# -# Only script compilation method #
#  - Parameter = [YES]  Can only be compiled by the script, using make will prompt to use the script to execute (the variable MF_CONFIGURE_ONLY_STARTED_BY_SCRIPT must be set to YES in the script).
#  - Parameter = [NO]   Can be compiled directly using make.
MF_CONFIGURE_ONLY_STARTED_BY_SCRIPT ?= YES

#----------------------------
# - Configure the sub-makefile file (.mk)
#----------------------------
#  # The configuration requires the use of sub-makefile files (.mk) for multi-file management #
#    When developing large-scale projects, it is recommended to use this option. For smaller projects, it is not necessary to use it.
#  - Parameter = [YES]  Use, In the project, a top-level makefile file and the .mk files in each subfolder are used together for management.
#  - Parameter = [NO]   Do not use, In the project, only one top-level makefile file is used for management (by default).
MF_CONFIGURE_USING_SUB_MAKEFILE ?= NO

# -# The configuration requires adding the path of the sub-makefile file (including all the subfolders under that path) #
#  - Note : 
#    -- It only takes effect when MF_CONFIGURE_USING_SUB_MAKEFILE is set to YES.
#    -- Add multiple paths, separated by spaces.
#    -- It will automatically add all the subfolders under this path, without the need to repeatedly add subfolders.
#  - Example : 
#    -- ?= ./src ../timer
#    -- += ./test
MF_CONFIGURE_ADD_SUB_MAKEFILE_PATHS_AND_SUBPATHS ?=

# -# The configuration requires adding the path of the sub-makefile file #
#  - Note : 
#    -- It only takes effect when MF_CONFIGURE_USING_SUB_MAKEFILE is set to "YES".
#    -- Add multiple paths, separated by spaces.
#    -- Only add the sub-makefile files (.mk) located in the current directory.
#  - Example : 
#    -- ?= .
#    -- ?= ./src ./src/timer ./src/test
#    -- += ./test
MF_CONFIGURE_ADD_SUB_MAKEFILE_PATHS ?=

#----------------------------
# - Configure output target file information
#----------------------------
# -# Set the name of the target file #
#  - Note : 
#    -- This option cannot be left blank.
#    -- The name cannot be the same as that of an existing pseudo-target instruction.
#  - Example : 
#    -- ?= main
#    -- ?= test
MF_CONFIGURE_TARGET_FILE_NAME ?= library

# -# Output type of the compiled target file #
#  - Parameter = [RELEASE] Delete the symbol table in the executable file. The symbol table does not affect the program's operation, and it can reduce the size of the program.
#  - Parameter = [DEBUG]   Keep the symbol table in the executable file. When using gdb for debugging, set it to NO.
#  - Parameter = [RELEASE_AND_DEBUG] Keep the RELEASE and DEBUG files.
MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG ?= DEBUG

# -# Compilation output file type #
#  - Parameter = [EXECUTE]                    Generate an executable program.
#  - Parameter = [LIBRARY_DYNAMIC]            Generate (.so) dynamic library file.
#  - Parameter = [LIBRARY_STATIC]             Generate (.a) static library file.
#  - Parameter = [LIBRARY_STATIC_AND_DYNAMIC] Generate (.a and .so) dynamic and static library files.
MF_CONFIGURE_OUTPUT_TARGET_FILE_TYPE ?= LIBRARY_STATIC

#----------------------------
# - Configure output folder information
#----------------------------
# -# Set the output directory for the target file #
#  - Note : 
#    -- When this option is empty, it is equivalent to ?= .
#    -- When the option is set to "=.", the generated target file will be placed in the folder where the Makefile is located.
#  - Example : 
#    -- ?= ./build
#    -- ?= ./output
#    -- ?= .
MF_CONFIGURE_TARGET_FILE_OUTPUT_PATH ?= ./build

# -# Set the output directory for intermediate files during compilation #
#  - Note : 
#    -- When this option is empty, it is equivalent to ?= .
#    -- When the option is set to "=.", the intermediate file output during compilation will be located in the source code folder.
#  - Example : 
#    -- ?= ./build/output
#    -- ?= ./output
#    -- ?= .
MF_CONFIGURE_INTERMEDIATE_FILE_OUTPUT_PATH ?= ./build/output

#----------------------------
# - Configure add source code information
#----------------------------
# -# The path where the source files that need to be compiled are located (including all subfolders within this path) #
#  - Note : 
#    -- Add multiple paths, separated by spaces.
#    -- This option will automatically include all the subfolders under the directory, eliminating the need to repeatedly add subfolders.
#    -- It is not recommended to use this option in large projects. It will search through all subfolders, and when there are too many subfolders, it may affect the compilation efficiency. In large projects, the MF_CONFIGURE_ADD_SOURCE_CODE_PATHS option is recommended.
#    -- Default to being empty.
#  - Example : 
#    -- ?= ./src ../timer
#    -- += ./testd
MF_CONFIGURE_ADD_SOURCE_CODE_PATHS_AND_SUBPATHS ?= .

# -# Add the path of the source files that need to be compiled #
#  - Note : 
#    -- Add multiple directories separated by spaces.
#    -- Only effective for the currently added directory.
#  - Example : 
#    -- ?= .
#    -- ?= ./src ./src/timer
#    -- += ./test
MF_CONFIGURE_ADD_SOURCE_CODE_PATHS ?=

# -# Add the source code files that need to be compiled #
#  - Note : 
#    -- Add multiple source code files, separated by spaces.
#  - Example : 
#    -- ?= ./test.c
#    -- ?= ./src/main.c ./lib/test.c ./lib/timer/test.c
#    -- += ./src/test.c
MF_CONFIGURE_ADD_SOURCE_CODE_FILES ?=

#----------------------------
# - Configure delete (exclude) source code information
#----------------------------
# -# Delete (exclude) the path where the compilation source files are located (including all subfolders within that path) #
#  - Note : 
#    -- Add multiple paths, separated by spaces.
#    -- This option will automatically include all the subfolders under the directory, eliminating the need to repeatedly add subfolders.
#    -- It is not recommended to use this option in large projects. It will search through all subfolders, and when there are too many subfolders, it may affect the compilation efficiency. In large projects, the MF_CONFIGURE_DELETE_SOURCE_CODE_PATHS option is recommended.
#    -- Default to being empty.
#  - Example : 
#    -- ?= ./lib
#    -- ?= ./clib ./lib
#    -- += ./libtest
MF_CONFIGURE_DELETE_SOURCE_CODE_PATHS_AND_SUBPATHS ?=

# -# Delete (exclude) the path where the compilation source files are located #
#  - Note : 
#    -- Add multiple paths, separated by spaces.
#    -- Only effective for the currently added directory.
#  - Example : 
#    -- ?= ./lib
#    -- ?= ./lib ./lib/test ./lib/timer
#    -- += ./libtest
MF_CONFIGURE_DELETE_SOURCE_CODE_PATHS ?=

# -# Delete (exclude) the source code files for compilation #
#  - Note : 
#    -- Add multiple source code files, separated by spaces.
#  - Example : 
#    -- ?= ./test.c
#    -- ?= ./src/main.c ./lib/test.c ./lib/timer/test.c
#    -- += ./src/test.c
MF_CONFIGURE_DELETE_SOURCE_CODE_FILES ?=

#----------------------------
# - Configure header files information
#----------------------------
# -# Configure the path of header files to include the range # 
#  - Parameter = [ONLY_CONFIGURE_PATHS]    Only including the paths that are configured through the MF_CONFIGURE_ADD_HEADER_FILE_PATHS_AND_SUBPATHS or MF_CONFIGURE_ADD_HEADER_FILE_PATHS variables.
#  - Parameter = [BUILD_SOURCE_CODE_PATHS] In addition to ONLY_CONFIGURE_PATHS, it also includes the source file paths (source code compilation paths) that have not been deleted (excluded).
#  - Parameter = [ALL_SOURCE_CODE_PATHS]   Based on ONLY_CONFIGURE_PATHS, it also includes all the source file paths.
#  - Parameter = [ALL_PATHS]               Based on ALL_SOURCE_CODE_PATHS, it also includes the deleted (excluded) paths and library paths.
MF_CONFIGURE_HEADER_FILE_PATH_INCLUDE_RANGE ?= ALL_SOURCE_CODE_PATHS

# -# Add header file paths (including all subfolders under this path) #
#  - Note : 
#    -- The area specified by the variable MF_CONFIGURE_HEADER_FILE_PATH_INCLUDE_RANGE needs to be examined.
#    -- Add multiple paths, separated by spaces.
#    -- This option will automatically include all the subfolders under the directory, eliminating the need to repeatedly add subfolders.
#    -- It is not recommended to use this option in large projects. It will search through all subfolders, and when there are too many subfolders, it may affect the compilation efficiency. In large projects, the MF_CONFIGURE_ADD_HEADER_FILE_PATHS option is recommended.
#    -- Default to being empty.
#  - Example : 
#    -- ?= ../src/inc ./lib
#    -- += ../lib/inc
MF_CONFIGURE_ADD_HEADER_FILE_PATHS_AND_SUBPATHS ?= 

# -# Add header file paths #
#  - Note : 
#    -- The area specified by the variable MF_CONFIGURE_HEADER_FILE_PATH_INCLUDE_RANGE needs to be examined.
#    -- Add multiple paths, separated by spaces.
#    -- This option will only take effect for the currently added directory.
#    -- Default to being empty.
#  - Example : 
#    -- ?= .
#    -- ?= ../src/inc ./lib ./lib/test/inc
#    -- += ../lib/inc
MF_CONFIGURE_ADD_HEADER_FILE_PATHS ?=

#----------------------------
# - Configuration library information
#----------------------------
# -# Add the standard library name #
#  - Note : 
#    -- Add the standard library name.
#    -- Add multiple libraries, separated by spaces.
#  - Example : 
#    -- ?= pthread rt m dl
#    -- += dl
#    -- += m
MF_CONFIGURE_ADD_STD_LIBRARY_NAME ?=

# -# Add the path of the library you wrote yourself or a third-party library (including all subfolders under that path) #
#  - Note : 
#    -- Add multiple paths, separated by spaces.
#    -- This option will automatically include all the subfolders under the directory, eliminating the need to repeatedly add subfolders.
#    -- It is not recommended to use this option in large projects. It will search through all subfolders, and when there are too many subfolders, it may affect the compilation efficiency. In large projects, the MF_CONFIGURE_ADD_USER_LIBRARY_PATHS option is recommended.
#  - Example : 
#    -- ?= ./lib/timer
#    -- ?= ./src/lib
#    -- += ../lib
MF_CONFIGURE_ADD_USER_LIBRARY_PATHS_AND_SUBPATHS ?= 

# -# Add the path of the library you wrote yourself or a third-party library #
#  - Note : 
#    -- Add multiple paths, separated by spaces.
#    -- This option will only take effect for the currently added directory.
#  - Example : 
#    -- ?= ./lib/timer ./lib ./lib/test
#    -- ?= ./src/lib
#    -- += ../lib
MF_CONFIGURE_ADD_USER_LIBRARY_PATHS ?=

# -# Add the name of the library you wrote yourself or a third-party library #
#  - Note : 
#    -- Add the name of the library you wrote yourself or a third-party library.
#    -- In Linux, libtimer.so = timer
#    -- In Linux, libtest.a   = test
#    -- In Windows, media.lib = media
#    -- Add multiple libraries, separated by spaces.
#  - Example : 
#    -- ?= timer media test
#    -- += timer
#    -- += test
MF_CONFIGURE_ADD_USER_LIBRARY_NAME ?=

#----------------------------
# - Configure user macro information
#----------------------------
# -# Add user macro definitions #
#  - Note : 
#    -- You can use macros in your application.
#    -- = __YE         Equivalent to C language #define __YE
#    -- = __YE=1       Equivalent to C language #define __YE 1
#    -- __YE=\'hello\' Equivalent to C language #define __YE 'hello'
#  - Example : 
#    -- ?= __YE __CC __VERSION=1.0.0
#    -- += __YECC=hello
#    -- += __YECC_NUM=1
#    -- += APP_VERSION=1.0.0
MF_CONFIGURE_ADD_USER_DEFINE ?=

#----------------------------
# - Compilation configuration
#----------------------------
# -# Compile original file type #
#  - Parameter = [CPP_TYPE] Use C++ compiler to compile C and C++ files.
#  - Parameter = [C_TYPE]   Use C compiler to compile C files only.
MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE ?= C_TYPE

# -# Whether to use static compilation (only applicable to generating executable programs) #
#  - Parameter = [YES] Using static compilation, all the dependent files will be included during the compilation process. It has less dependence on the running environment and is highly compatible; however, the generated program is relatively large.
#  - Parameter = [NO]  Using dynamic compilation, the compiled program has a relatively small size. It relies on dynamic libraries and cannot run independently.
MF_CONFIGURE_USING_STATIC_COMPILATION ?= NO

# -# Whether to delete intermediate files (.d, .o, .i, .ii, .s) after compilation #
#  - Parameter = [YES] Delete intermediate files, every compilation will be a full compilation.
#  - Parameter = [NO]  Keep intermediate files.
MF_CONFIGURE_DELETING_INTERMEDIATE_FILES ?= NO

# -# Whether to create explicit declarations before compilation #
#  - Parameter = [YES] Use explicit declarations, which is not recommended. Creating explicit rules before compilation may slow down the compilation process, especially when there are many source files. Make version V3.81 or above is required to use this option. Otherwise, it will not take effect.
#  - Parameter = [NO]  Do not use explicit declarations, which is recommended.
MF_CONFIGURE_USE_EXPLICIT_DECLARATION ?= NO

#----------------------------
# - Log configuration
#----------------------------
# -# The compilation process console log is displayed in a formatted manner #
#  - Parameter = [YES] Using formatted display, which can print the currently compiling file name in a neatly formatted manner.
#  - Parameter = [NO]  Print compilation logs.
MF_CONFIGURE_USING_FORMATTEND_LOG ?= YES

# -# Compile log using formatted display strings(.c -> .o) #
#  - Note : 
#    -- It takes effect only when MF_CONFIGURE_USING_FORMATTEND_LOG is set to "YES".
#  - Example : 
#    -- ?= CC
#    -- ?= [CC]
#    -- ?= Building
#    -- ?= Compiling
MF_CONFIGURE_FORMATTEND_LOG_CC_OBJECT_SHOW_STRING ?= CC

# -# Compile log using formatted display strings(.cpp -> .o) #
#  - Note : 
#    -- It takes effect only when MF_CONFIGURE_USING_FORMATTEND_LOG is set to "YES".
#  - Example : 
#    -- ?= CPP
#    -- ?= [CPP]
#    -- ?= Building
#    -- ?= Compiling
MF_CONFIGURE_FORMATTEND_LOG_CPP_OBJECT_SHOW_STRING ?= CPP

# -# Compile log using formatted display strings(.c -> .s) or (.cpp -> .s) #
#  - Note : 
#    -- It takes effect only when MF_CONFIGURE_USING_FORMATTEND_LOG is set to "YES".
#  - Example : 
#    -- ?= AS
#    -- ?= [AS]
#    -- ?= [ASSEMBLY]
#    -- ?= Building
#    -- ?= Compiling
MF_CONFIGURE_FORMATTEND_LOG_ASSEMBLE_SHOW_STRING ?= AS

# -# Compile log using formatted display strings(.c -> .i) or (.cpp -> .ii) #
#  - Note : 
#    -- It takes effect only when MF_CONFIGURE_USING_FORMATTEND_LOG is set to "YES".
#  - Example : 
#    -- ?= PR
#    -- ?= [PR]
#    -- ?= [PREPROCESS]
#    -- ?= Building
#    -- ?= Compiling
MF_CONFIGURE_FORMATTEND_LOG_PREPROCESS_SHOW_STRING ?= PR

# -# Generate a log for the link packaging process of the static library, using formatted display strings #
#  - Note : 
#    -- It takes effect only when MF_CONFIGURE_USING_FORMATTEND_LOG is set to "YES".
#  - Example : 
#    -- ?= AR
#    -- ?= [AR]
#    -- ?= linking
#    -- ?= package
MF_CONFIGURE_FORMATTEND_LOG_LIBRARY_STATIC_SHOW_STRING ?= AR

# -# Generate dynamic library logs by packaging the links, using formatted display strings #
#  - Note : 
#    -- It takes effect only when MF_CONFIGURE_USING_FORMATTEND_LOG is set to "YES".
#  - Example : 
#    -- ?= LD
#    -- ?= [LD]
#    -- ?= linking
#    -- ?= package
MF_CONFIGURE_FORMATTEND_LOG_LIBRARY_DYNAMIC_SHOW_STRING ?= LD

# -# Generate logs for the link packaging process of the executable program, using formatted display strings #
#  - Note : 
#    -- It takes effect only when MF_CONFIGURE_USING_FORMATTEND_LOG is set to "YES".
#  - Example : 
#    -- ?= LD
#    -- ?= [LD]
#    -- ?= linking
#    -- ?= package
MF_CONFIGURE_FORMATTEND_LOG_EXECUTE_SHOW_STRING ?= LD

#----------------------------
# - Debugging options
#----------------------------
#  - Note : 
#    -- When the value of MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE is C_TYPE, use MF_CONFIGURE_C_FLAGS; otherwise, use MF_CONFIGURE_CPP_FLAGS.
#    -- += -g        During the compilation process, debugging information is generated.
#    -- += -gstabs   This option claims debugging information in the stabs format, but does not include gdb debugging information. 
#    -- += -gstabs+  This option claims the debugging information in the stabs format, and also includes additional debugging information that is only for use by gdb.
#    -- += -ggdb     This option will generate as much usable debugging information for gdb as possible.
#    -- += -glevel   Request to generate debugging information, and specify the amount of information required using the "level" parameter. The default level value is 2.
#    -- += ...
#  - Example : 
#    -- += -g
#    -- += -ggdb
MF_CONFIGURE_C_FLAGS   ?= -g
MF_CONFIGURE_CPP_FLAGS ?= -g

#----------------------------
# - Error and Alert Options
#----------------------------
#  - Note : 
#    -- When the value of MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE is C_TYPE, use MF_CONFIGURE_C_FLAGS; otherwise, use MF_CONFIGURE_CPP_FLAGS.
#    -- += -w To disable all compilation warnings
#    -- += -Wall To enable all common warnings (unused variables, uninitialized variables, undeclared functions, etc.)
#    -- += -Wextra To add additional warnings beyond -Wall (such as empty parameters, implicit loss of type conversions, etc.)
#    -- += -Wunused-function To detect static functions that are declared but unused
#    -- += -Wunused-label To detect unused labels (such as goto jump labels remaining after deletion)
#    -- += -Wshadow When a local variable shadows another local variable or a global variable, give a warning
#    -- += -Wunreachable-code If the compiler detects code that will never be executed, give a warning
#    -- += -Wundef When an undefined symbol appears in #if, give a warning.
#    -- += -Werror To convert all warnings to errors, terminating the compilation process when a warning occurs
#    -- += -Wfatal-errors Stop on the first error
#    -- += -Wconversion To warn about implicit type conversions (such as int to short, which may lose precision)
#    -- += -Wstrict-prototypes To require explicit parameter types in function declarations (disable int foo() form)
#    -- += -pedantic To allow all warnings listed in the ANSI/ISO C standard
#    -- += -pedantic-errors To allow all errors listed in the ANSI/ISO C standard
#    -- += -Wno-conversion To disable warnings about implicit type conversions
#    -- += -Wno-unused-variable To disable warnings about unused variables
#    -- += -Wno-unused-label To disable warnings about unused labels
#    -- += -Wno-unused-variable To disable warnings about unused variables
#    -- += -Wno-unused-label To disable warnings about unused labels
#    -- += -Wno-unused-function To disable warnings about unused functions
#    -- += ...
#  - Example : 
#    -- += -Wall -Werror -Wfatal-errors -Wunused-function -Wunused-label -Wconversion
#    -- += -Wall -Wfatal-errors -Wunused-function -Wunused-label -Wconversion
#    -- += -Wall -Werror
#    -- += -Wall
MF_CONFIGURE_C_FLAGS   += -Wall -Wfatal-errors -Wunused-function -Wunused-label -Wconversion
MF_CONFIGURE_CPP_FLAGS += -Wall -Wfatal-errors -Wunused-function -Wunused-label -Wconversion

#----------------------------
# - Dynamic library export symbols
#----------------------------
#  - Note : 
#    -- When the value of MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE is C_TYPE, use MF_CONFIGURE_C_FLAGS; otherwise, use MF_CONFIGURE_CPP_FLAGS.
#    -- It is recommended to disable in the RELEASE version.
#    -- += -rdynamic Dynamic library export symbols
#  - Example : 
#    -- += -rdynamic
#    -- +=
#MF_CONFIGURE_C_FLAGS   += -rdynamic
#MF_CONFIGURE_CPP_FLAGS += -rdynamic

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

#----------------------------
# - Compiler optimization level
#----------------------------
#  - Note : 
#    -- When the value of MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE is C_TYPE, use MF_CONFIGURE_C_FLAGS; otherwise, use MF_CONFIGURE_CPP_FLAGS.
#    -- += -O0 No optimization, retains complete debugging information, code execution is the slowest, suitable for development and debugging phases.
#    -- += -O1 Basic optimization, slightly improves performance, does not affect debugging, suitable for debugging versions with low performance requirements.
#    -- += -O2 Medium optimization, fully enables security optimizations, significantly improves performance, compile time is controllable, default choice for release versions.
#    -- += -O3 Highly optimized, may increase code size and compilation time, occasionally has compatibility issues, code execution speed is fast, suitable for specific scenarios such as high-performance computing.
#  - Example : 
#    -- += -O2
#    -- += -O1
#    -- += -O0
#MF_CONFIGURE_C_FLAGS   += -O2
#MF_CONFIGURE_CPP_FLAGS += -O2

#----------------------------
# - Other flags options
#----------------------------
#  - Note : 
#    -- When the value of MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE is C_TYPE, use MF_CONFIGURE_C_FLAGS; otherwise, use MF_CONFIGURE_CPP_FLAGS.
#    -- +=
#  - Example : 
#    -- +=
#MF_CONFIGURE_C_FLAGS   +=
#MF_CONFIGURE_CPP_FLAGS +=

#----------------------------
# - Compilation options that are applied to generate the .o file
#----------------------------
#  - Note : 
#    -- When the value of MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE is C_TYPE, use MF_CONFIGURE_C_FLAGS; otherwise, use MF_CONFIGURE_CPP_FLAGS.
#    -- ?= -MMD  : Generate dependency files, automatically generate .d dependency files, such as main.c → main.d.
#    -- ?= -MP   : In the generated .d file, add an independent pseudo-target for each header file. This ensures that make does not report an error when the header file is deleted.
#    -- ?= -fPIC : Generate position-independent code, which is used for compiling dynamic link libraries, but it is not commonly used here.
#  - Example : 
#    -- ?= -MMD -MP
#    -- ?= -MMD
#    -- ?= -MP
MF_CONFIGURE_C_OBJECTS_FLAGS   ?= -MMD -MP
MF_CONFIGURE_CPP_OBJECTS_FLAGS ?= -MMD -MP

#----------------------------
# - Compilation tool configuration
#----------------------------
# -# Specify the path prefix for the used compilation tool #
#  - Note : 
#    -- Default value is empty.
#    -- When cross-compiling, the path prefix of the compilation tool must be specified.
#    -- When empty, the compiled program is the current system executable program.
#  - Example : 
#    -- ?= .
#    -- ?= arm-linux-
#    -- ?= arm-linux-gnueabi-
#    -- ?= arm-linux-gnueabihf-
#    -- ?= ./tools/compile_tools/arm-linux-gnueabihf-
MF_CONFIGURE_COMPILE_PATH_PREFIX ?= 

#----------------------------
# - Platform configuration
#----------------------------
# -# The platform used for configuring the makefile #
#  - Note : 
#    -- This determines on which platform the makefile is being used.
#    -- By default, it is set to ?= $(OS), which can automatically detect whether it is on a Windows system. Of course, it can also be specified manually directly.
#    -- auto    ：$(OS)
#    -- windows ：?= WINDOWS or ?= Windows_NT
#    -- linux   ：?= LINUX   or ?=
#  - Example : 
#    -- ?= $(OS)
#    -- ?= WINDOWS
#    -- ?= LINUX
MF_CONFIGURE_PLATFORM_OS ?= $(OS)

#----------------------------
# - Configuration tool
#----------------------------
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
MF_CONFIGURE_WINDOWS_TOOLS ?= ../../../tools/windows_tools/usr/bin/

# -# Configure the Linux tool path #
#  - Note : 
#   -- This is mainly applicable to the situation where makefile is used in Linux.
#   -- In Windows, this setting is not necessary and can be omitted, such as ?=
#   -- When using makefile in Linux, normally this option (such as ?=) does not need to be configured. Only when the system version is too low or some tool instructions are not fully functional, do you need to configure the tool path.
#   -- You can find the tools in the ./tools/ directory.
#  - Example : 
#    -- ?= ./tools/linux_tools/usr/bin/
#    -- ?= ./tools
MF_CONFIGURE_LINUX_TOOLS ?=

# -# The shell tool used for configuration #
#  - Note : 
#    -- This determines the tools that the makefile uses when executing shell commands.
#    -- By default, it is set to ?= SH
#  - Parameter = [SH]   Use "sh" to execute the shell command tool
#  - Parameter = [BASH] Use "bash" to execute the shell command tool
MF_CONFIGURE_USE_SHELL_TOOLS ?= BASH

#============================
# - Version Information
#============================
MF_VERSION      := 2
MF_SUBLEVEL     := 0
MF_PATCHLEVEL   := 0
MF_NAME         := 'Universal Makefile'

# Configuration completed
# - The following code will be executed through configuration items.
# - In general, it is recommended not to modify the following code unless there are special circumstances.
# - The modification might cause the 'makefile' to malfunction.

#============================
# - Version Information for Supported Features
#============================
#----------------------------
# - Support Standardized Intermediate File Output Path Version
#   Use eval function, minimum version v3.81
#----------------------------
MF_VERSION_STD_INTERMEDIATE_FILE_PATH := 3.81

#----------------------------
# - Use Sequential Execution Target Version
#   Avoid order problems when using -j
#   Use .WAIT, minimum version v4.4
#----------------------------
MF_VERSION_SEQUENTIAL_EXEC_TARGET := 4.4

#============================
# - Set makefile variable information rules
#============================
# Allow only one "make -f Makefile_zh" at a time, but pass parallelism.
#.NOTPARALLEL:

# Disable implicit rules so canonical targets will work.
.SUFFIXES:
# Disable VCS-based implicit rules.
% : %,v
# Disable VCS-based implicit rules.
% : RCS/%
# Disable VCS-based implicit rules.
% : RCS/%,v
# Disable VCS-based implicit rules.
% : SCCS/s.%
# Disable VCS-based implicit rules.
% : s.%

# Command-line flag to silence nested $(MAKE).
#$(VERBOSE)MAKEFLAGS += -s
#$(VERBOSE)MAKESILENT = -s
#Suppress display of executed commands.
#$(VERBOSE).SILENT:

#============================
# - Cross-platform Support
#============================
# - Automatically match platform based on $(OS) value
#   -- windows ：?= WINDOWS or ?= Windows_NT
#   -- linux   ：?= LINUX   or ?=
ifeq ($(strip $(firstword $(MF_CONFIGURE_PLATFORM_OS))), Windows_NT)
    MF_PLATFORM_OS := WINDOWS
else
ifeq ($(strip $(firstword $(MF_CONFIGURE_PLATFORM_OS))), WINDOWS)
    MF_PLATFORM_OS := WINDOWS
else
    MF_PLATFORM_OS := LINUX
endif
endif

#----------------------------
# - Platform-specific Information
#----------------------------
ifeq ($(MF_PLATFORM_OS), WINDOWS)
    # - Windows-specific Target File Prefixes
    #----------------------------
    MF_PLATFORM_TARGET_LIB_PREFIX         :=

    # - Windows-specific Target File Suffixes
    #----------------------------
    MF_PLATFORM_TARGET_EXECUTE_SUFFIX     := .exe
    MF_PLATFORM_TARGET_LIB_STATIC_SUFFIX  := .lib
    MF_PLATFORM_TARGET_LIB_DYNAMIC_SUFFIX := .dll

    # - Check if Windows tools path is defined
ifeq ($(strip $(MF_CONFIGURE_WINDOWS_TOOLS)),)
    $(error -> Note: The Windows tool is not defined!)
endif
    # - Specify shell tools, recommend using bash
    #----------------------------
ifeq ($(strip $(MF_CONFIGURE_USE_SHELL_TOOLS)), BASH)
    SHELL                                 := $(strip $(MF_CONFIGURE_WINDOWS_TOOLS))bash.exe
else
    SHELL                                 := $(strip $(MF_CONFIGURE_WINDOWS_TOOLS))sh.exe
endif

    # - Using the tools that are utilized in the 'makefile'
    MF_PLATFORM_USING_TOOLS_RM            := $(strip $(MF_CONFIGURE_WINDOWS_TOOLS))rm.exe -rf
    MF_PLATFORM_USING_TOOLS_MKDIR         := $(strip $(MF_CONFIGURE_WINDOWS_TOOLS))mkdir.exe -p
    MF_PLATFORM_USING_TOOLS_CP            := $(strip $(MF_CONFIGURE_WINDOWS_TOOLS))cp.exe -p
    MF_PLATFORM_USING_TOOLS_FIND          := $(strip $(MF_CONFIGURE_WINDOWS_TOOLS))find.exe
    MF_PLATFORM_USING_TOOLS_ECHO          := $(strip $(MF_CONFIGURE_WINDOWS_TOOLS))echo.exe
    MF_PLATFORM_USING_TOOLS_SED           := $(strip $(MF_CONFIGURE_WINDOWS_TOOLS))sed.exe
    MF_PLATFORM_USING_TOOLS_AWK           := $(strip $(MF_CONFIGURE_WINDOWS_TOOLS))awk.exe
    MF_PLATFORM_USING_TOOLS_SEQ           := $(strip $(MF_CONFIGURE_WINDOWS_TOOLS))seq.exe
    MF_PLATFORM_USING_TOOLS_PRINTF        := $(strip $(MF_CONFIGURE_WINDOWS_TOOLS))printf.exe
else
    # - Linux-specific Target File Prefixes
    #----------------------------
    MF_PLATFORM_TARGET_LIB_PREFIX         := lib

    # - Linux-specific Target File Suffixes
    #----------------------------
    MF_PLATFORM_TARGET_EXECUTE_SUFFIX     := 
    MF_PLATFORM_TARGET_LIB_STATIC_SUFFIX  := .a
    MF_PLATFORM_TARGET_LIB_DYNAMIC_SUFFIX := .so

    # - Specify shell tools, recommend using bash
    #----------------------------
ifeq ($(strip $(MF_CONFIGURE_USE_SHELL_TOOLS)), BASH)
    SHELL                                 := $(strip $(MF_CONFIGURE_LINUX_TOOLS))bash
else
    SHELL                                 := $(strip $(MF_CONFIGURE_LINUX_TOOLS))sh
endif

    # Using the tools that are utilized in the 'makefile'
    #----------------------------
    MF_PLATFORM_USING_TOOLS_RM            := $(strip $(MF_CONFIGURE_LINUX_TOOLS))rm -rf
    MF_PLATFORM_USING_TOOLS_MKDIR         := $(strip $(MF_CONFIGURE_LINUX_TOOLS))mkdir -p
    MF_PLATFORM_USING_TOOLS_CP            := $(strip $(MF_CONFIGURE_LINUX_TOOLS))cp -p
    MF_PLATFORM_USING_TOOLS_FIND          := $(strip $(MF_CONFIGURE_LINUX_TOOLS))find
    MF_PLATFORM_USING_TOOLS_ECHO          := $(strip $(MF_CONFIGURE_LINUX_TOOLS))echo
    MF_PLATFORM_USING_TOOLS_SED           := $(strip $(MF_CONFIGURE_LINUX_TOOLS))sed
    MF_PLATFORM_USING_TOOLS_AWK           := $(strip $(MF_CONFIGURE_LINUX_TOOLS))awk
    MF_PLATFORM_USING_TOOLS_SEQ           := $(strip $(MF_CONFIGURE_LINUX_TOOLS))seq
    MF_PLATFORM_USING_TOOLS_PRINTF        := $(strip $(MF_CONFIGURE_LINUX_TOOLS))printf
endif

#============================
# - Function definition
#============================
#----------------------------
# - Recursively find all subdirectories under the specified directory
#   Parameter $1: The root directory path to search
#----------------------------
define function_find_subdirectories
$(strip $(shell $(MF_PLATFORM_USING_TOOLS_FIND) $(1) -type d))
endef

#----------------------------
# - String search function
#   Parameter $1: The main string to search in
#   Parameter $2: The substring to search for
#   Return value: true or false
#----------------------------
define function_find_string
$(strip $(shell $(MF_PLATFORM_USING_TOOLS_ECHO) "$(strip $(1))" | $(MF_PLATFORM_USING_TOOLS_AWK) \
    'index($$0, "$(strip $(2))") > 0 { print "true"; exit } \
    !index($$0, "$(strip $(2))") { print "false"; exit }'   \
))
endef

#----------------------------
# - Compare with the current version
# Parameter $1: Version number to be compared
# When the input version number satisfies the condition of being less than or equal to the current version, it returns true; otherwise, it returns false
# Return value: true or false
#----------------------------
define function_check_make_version
$(strip $(shell $(MF_PLATFORM_USING_TOOLS_ECHO) '$(strip $1)' | $(MF_PLATFORM_USING_TOOLS_AWK) \
    -v current=$(strip "$(MAKE_VERSION)")           \
    'BEGIN {                                        \
        cleaned_current = current;                  \
        gsub(/^[^0-9.]+/, "", cleaned_current);     \
        split(cleaned_current, curr, ".");          \
        c1 = curr[1] + 0;                           \
        c2 = (length(curr) >= 2) ? curr[2] + 0 : 0; \
        c3 = (length(curr) >= 3) ? curr[3] + 0 : 0; \
    } {                                             \
        cleaned_input = $$0;                        \
        gsub(/^[^0-9.]+/, "", cleaned_input);       \
        split(cleaned_input, ver, ".");             \
        v1 = ver[1] + 0;                            \
        v2 = (length(ver) >= 2) ? ver[2] + 0 : 0;   \
        v3 = (length(ver) >= 3) ? ver[3] + 0 : 0;   \
                                                    \
        if (c1 > v1) { print "true"; exit }         \
        if (c1 < v1) { print "false"; exit }        \
        if (c2 > v2) { print "true"; exit }         \
        if (c2 < v2) { print "false"; exit }        \
        if (c3 >= v3) { print "true"; exit }        \
        print "false";                              \
    }'                                              \
))
endef

#----------------------------
# - Check and calculate the number of occurrences of "../" in the longest string of the path
#   Parameter $1: The path variable
#   Return value: The number of occurrences of "../" in the longest string of the path (numeric)
#----------------------------
define function_upperlevel_path_count_occurrences
$(strip $(shell $(MF_PLATFORM_USING_TOOLS_ECHO) '$1' | $(MF_PLATFORM_USING_TOOLS_AWK) \
    'BEGIN { max_count = 0 } {                        \
        for (i=1; i<=NF; i++) {                       \
            count = 0; pos = 1; len = length($$i);    \
            while (pos <= len-2) {                    \
                if (substr($$i, pos, 3) == "../") {   \
                    count++; pos += 3;                \
                }                                     \
                else { break; }                       \
            }                                         \
            if (count > max_count) max_count = count; \
        }                                             \
    }                                                 \
    END { print max_count }'                          \
))
endef

#----------------------------
# - Output extended path
#   Parameter $1: The number of extended path segments
#   Return value: Returns $1 times of "_/" string
#----------------------------
define function_output_extend_path
$(strip $(if $(filter-out 0,$(strip $1)), \
    $(shell $(MF_PLATFORM_USING_TOOLS_ECHO) "" | $(MF_PLATFORM_USING_TOOLS_AWK) \
        -v count=$(strip $1) \
        'BEGIN { while (count-->0) printf "_/"} END {printf "\n"}' \
    ) \
))
endef

#----------------------------
# - Simple normalize path function
#   Parameter $1: The directory path to normalize
#   Conversion rules:
#   /./ -> /
#   // -> /
#
# $(subst //,/,$(subst /./,/, $(1)))
#----------------------------
define function_simple_normalize_path
$(strip $(shell $(MF_PLATFORM_USING_TOOLS_ECHO) '$1' | $(MF_PLATFORM_USING_TOOLS_SED) \
    -e 's|/\./|/|g'    \
    -e 's|//|/|g'      \
))
endef

#----------------------------
# - Target file normalize path function
#   Parameter $1: The directory path to normalize
#   Conversion rules:
#   /./ -> /
#   // -> /
#   ../ -> __/
#----------------------------
# Whether to use explicit declaration
ifeq ($(MF_CONFIGURE_USE_EXPLICIT_DECLARATION), YES)
# Check if 'make' version supports 'eval' function
ifeq ($(call function_check_make_version, $(MF_VERSION_STD_INTERMEDIATE_FILE_PATH)), true)
define function_obj_normalize_path
    $(strip $(shell $(MF_PLATFORM_USING_TOOLS_ECHO) '$1' | $(MF_PLATFORM_USING_TOOLS_SED) \
    -e 's|/\./|/|g'    \
    -e 's|//|/|g'      \
    -e 's|\.\./|__/|g' \
))
endef

else # ifeq ($(call function_check_make_version, $(MF_VERSION_STD_INTERMEDIATE_FILE_PATH)), true)
define function_obj_normalize_path
$(strip $(shell $(MF_PLATFORM_USING_TOOLS_ECHO) '$1' | $(MF_PLATFORM_USING_TOOLS_SED) \
    -e 's|/\./|/|g'    \
    -e 's|//|/|g'      \
))
endef
endif # ifeq ($(call function_check_make_version, $(MF_VERSION_STD_INTERMEDIATE_FILE_PATH)), true)

else  #ifeq ($(MF_CONFIGURE_USE_EXPLICIT_DECLARATION), YES)
define function_obj_normalize_path
$(strip $(shell $(MF_PLATFORM_USING_TOOLS_ECHO) '$1' | $(MF_PLATFORM_USING_TOOLS_SED) \
    -e 's|/\./|/|g'    \
    -e 's|//|/|g'      \
))
endef
endif # ifeq ($(MF_CONFIGURE_USE_EXPLICIT_DECLARATION), YES)


#----------------------------
# - Source file normalize path function
#   Parameter $1: The directory path to normalize
#   Conversion rules:
#   /./ -> /
#   // -> /
#   __/ -> ../
#----------------------------
define function_src_normalize_path
$(strip $(shell $(MF_PLATFORM_USING_TOOLS_ECHO) '$1' | $(MF_PLATFORM_USING_TOOLS_SED) \
    -e 's|/\./|/|g'    \
    -e 's|//|/|g'      \
    -e 's|__/|\.\./|g' \
))
endef

#----------------------------
# - Clean intermediate files function
#----------------------------
define function_clean_intermediate_file
    $(if $(strip $(MF_PARAM_C_OBJECTS)), $(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_C_OBJECTS))
    $(if $(strip $(MF_PARAM_C_DEPENDENTS)), $(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_C_DEPENDENTS))
    $(if $(strip $(MF_PARAM_CPP_OBJECTS)), $(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_CPP_OBJECTS))
    $(if $(strip $(MF_PARAM_CPP_DEPENDENTS)), $(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_CPP_DEPENDENTS))
    $(if $(strip $(MF_PARAM_PREPROCESSED)), $(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_PREPROCESSED))
    $(if $(strip $(MF_PARAM_ASSEMBLY)), $(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_ASSEMBLY))
endef

#----------------------------
# - Clean target files function
#----------------------------
define function_clean_target_file
    $(if $(strip $(MF_PARAM_TARGET_EXECUTE)), $(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_TARGET_EXECUTE))
    $(if $(strip $(MF_PARAM_TARGET_LIB_STATIC)), $(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_TARGET_LIB_STATIC))
    $(if $(strip $(MF_PARAM_TARGET_LIB_DYNAMIC)), $(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_TARGET_LIB_DYNAMIC))
    $(if $(strip $(MF_PARAM_TARGET_EXECUTE_DEBUG)), $(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_TARGET_EXECUTE_DEBUG))
    $(if $(strip $(MF_PARAM_TARGET_LIB_STATIC_DEBUG)), $(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_TARGET_LIB_STATIC_DEBUG))
    $(if $(strip $(MF_PARAM_TARGET_LIB_DYNAMIC_DEBUG)), $(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_TARGET_LIB_DYNAMIC_DEBUG))
endef

#============================
# - Obtain information of the '.mk' files
#============================
# In the specified directory path, find all '.mk' files and their directory information (subdirectories)
# Only effective when MF_CONFIGURE_USING_SUB_MAKEFILE = YES
ifeq ($(strip $(firstword $(MF_CONFIGURE_USING_SUB_MAKEFILE))), YES)

# Check if sub-makefile directory paths are defined
ifeq ($(strip $(MF_CONFIGURE_ADD_SUB_MAKEFILE_PATHS_AND_SUBPATHS)),)
ifeq ($(strip $(MF_CONFIGURE_ADD_SUB_MAKEFILE_PATHS)),)
    $(error -> Note: The sub-makefile directory path is not defined!)
endif
endif
    # Search for all subfolders under this directory path
    MF_SUB_MAKEFILE_FIND_DIRECTORYS     := $(strip $(if $(strip $(MF_CONFIGURE_ADD_SUB_MAKEFILE_PATHS_AND_SUBPATHS)), $(call function_find_subdirectories, $(MF_CONFIGURE_ADD_SUB_MAKEFILE_PATHS_AND_SUBPATHS)),))
    # All directory paths that need to be included
    MF_SUB_MAKEFILE_ALL_DIRECTORY_PATHS := $(strip $(sort $(MF_CONFIGURE_ADD_SUB_MAKEFILE_PATHS) $(MF_SUB_MAKEFILE_FIND_DIRECTORYS)))
    # Search for all '.mk' files under these directory paths
    MF_SUB_MAKEFILE_FIND_FILES          := $(strip $(foreach dir, $(MF_SUB_MAKEFILE_ALL_DIRECTORY_PATHS), $(wildcard $(dir)/*.mk)))

    # Include all '.mk' files found under these directory paths
ifneq ($(strip $(firstword $(MF_SUB_MAKEFILE_FIND_FILES))),)
    include $(MF_SUB_MAKEFILE_FIND_FILES)
endif
endif

# Check if source code directory paths and source code files are defined
ifeq ($(strip $(MF_CONFIGURE_ADD_SOURCE_CODE_PATHS_AND_SUBPATHS)),)
ifeq ($(strip $(MF_CONFIGURE_ADD_SOURCE_CODE_PATHS)),)
ifeq ($(strip $(MF_CONFIGURE_ADD_SOURCE_CODE_FILES)),)
    $(error -> Note: The source code directory and source code files have not been configured.)
endif
endif
endif

#============================
# - Parameter verification
#============================
#----------------------------
# - Script-related configuration verification
#----------------------------
# Check if the compilation is launched only by the script
ifeq ($(firstword $(strip $(MF_CONFIGURE_ONLY_STARTED_BY_SCRIPT))), YES)
    $(error -> Note: You have set it to be launched only by the script. Please use the script for compilation.)
endif

#----------------------------
# - Tool-related configuration verification
#----------------------------
ifeq ($(strip $(MF_PLATFORM_USING_TOOLS_RM)),)
    $(error -> Note: The rm tool is not defined!)
endif
ifeq ($(strip $(MF_PLATFORM_USING_TOOLS_MKDIR)),)
    $(error -> Note: The mkdir tool is not defined!)
endif
ifeq ($(strip $(MF_PLATFORM_USING_TOOLS_CP)),)
    $(error -> Note: The cp tool is not defined!)
endif
ifeq ($(strip $(MF_PLATFORM_USING_TOOLS_FIND)),)
    $(error -> Note: The find tool is not defined!)
endif
ifeq ($(strip $(MF_PLATFORM_USING_TOOLS_ECHO)),)
    $(error -> Note: The echo tool is not defined!)
endif
ifeq ($(strip $(MF_PLATFORM_USING_TOOLS_SED)),)
    $(error -> Note: The sed tool is not defined!)
endif
ifeq ($(strip $(MF_PLATFORM_USING_TOOLS_AWK)),)
    $(error -> Note: The awk tool is not defined!)
endif
ifeq ($(strip $(MF_PLATFORM_USING_TOOLS_PRINTF)),)
    $(error -> Note: The printf tool is not defined!)
endif

#----------------------------
# - Target file name verification
#----------------------------
# Check if the target file name is empty
ifeq ($(strip $(MF_CONFIGURE_TARGET_FILE_NAME)),)
    $(error -> Note: The target file name cannot be empty!)
else
ifeq ($(strip $(MF_CONFIGURE_TARGET_FILE_NAME)), '')
    $(error -> Note: The target file name cannot be empty!)
endif
endif

# Check whether the output target file type is supported.
ifeq ($(strip $(MF_CONFIGURE_OUTPUT_TARGET_FILE_TYPE)),)
    $(error -> Note: The output target file type cannot be empty!)
else
ifneq ($(strip $(MF_CONFIGURE_OUTPUT_TARGET_FILE_TYPE)), EXECUTE)
ifneq ($(strip $(MF_CONFIGURE_OUTPUT_TARGET_FILE_TYPE)), LIBRARY_STATIC)
ifneq ($(strip $(MF_CONFIGURE_OUTPUT_TARGET_FILE_TYPE)), LIBRARY_DYNAMIC)
ifneq ($(strip $(MF_CONFIGURE_OUTPUT_TARGET_FILE_TYPE)), LIBRARY_STATIC_AND_DYNAMIC)
    $(error -> Note: The output target file type is not supported!)
endif
endif
endif
endif
endif

# Generate verification for the target file name
MF_VERIFY_TARGET_FILE_NAME        := $(strip $(if $(strip $(MF_CONFIGURE_TARGET_FILE_NAME)), $(firstword $(MF_CONFIGURE_TARGET_FILE_NAME)), main))

# Verification of the output directory for the target file
MF_VERIFY_TARGET_FILE_OUTPUT_PATH := $(strip $(if $(strip $(MF_CONFIGURE_TARGET_FILE_OUTPUT_PATH)), $(firstword $(MF_CONFIGURE_TARGET_FILE_OUTPUT_PATH)), .))

# Verification of the intermediate file output directory
MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH := $(strip $(if $(strip $(MF_CONFIGURE_INTERMEDIATE_FILE_OUTPUT_PATH)), $(firstword $(MF_CONFIGURE_INTERMEDIATE_FILE_OUTPUT_PATH)), .))

#============================
# - Compilation tool
#============================
# Make variables (CC, etc...)
# - as gcc is used to output assembly files, and the resulting object files are linked by the linker ld.
MF_COMPILE_TOOL_AS      := $(strip $(MF_CONFIGURE_COMPILE_PATH_PREFIX))as
# - ld Linking combines all the.o files to generate an executable file, not a pure binary file.
MF_COMPILE_TOOL_LD      := $(strip $(MF_CONFIGURE_COMPILE_PATH_PREFIX))ld
# - gcc C compiler command
MF_COMPILE_TOOL_CC      := $(strip $(MF_CONFIGURE_COMPILE_PATH_PREFIX))gcc
# - g++ C++ compilation command: $(GCC_TOOL_CC) -E
MF_COMPILE_TOOL_CPP     := $(strip $(MF_CONFIGURE_COMPILE_PATH_PREFIX))g++
# - ar Package, extract and archive the files
MF_COMPILE_TOOL_AR      := $(strip $(MF_CONFIGURE_COMPILE_PATH_PREFIX))ar
# - nm View the symbol table of the executable file
MF_COMPILE_TOOL_NM      := $(strip $(MF_CONFIGURE_COMPILE_PATH_PREFIX))nm
# - strip Compression file command, deleting symbol table in executable files
MF_COMPILE_TOOL_STRIP   := $(strip $(MF_CONFIGURE_COMPILE_PATH_PREFIX))strip
# - objcopy Generate a binary file (.bin) from the.elf file.
MF_COMPILE_TOOL_OBJCOPY := $(strip $(MF_CONFIGURE_COMPILE_PATH_PREFIX))objcopy
# - objdump Disassemble the.elf file to generate a disassembly file (.dis)
MF_COMPILE_TOOL_OBJDUMP := $(strip $(MF_CONFIGURE_COMPILE_PATH_PREFIX))objdump
# - size List the size of each section of the target file as well as the total size.
MF_COMPILE_TOOL_SIZE    := $(strip $(MF_CONFIGURE_COMPILE_PATH_PREFIX))size

#============================
# - Obtain information about C/C++ files
#============================
# Find the directory information (subfolders) of all the files in the source code directory paths
MF_SOURCES_FIND_DIRECTORY_PATHS     := $(strip $(if $(strip $(MF_CONFIGURE_ADD_SOURCE_CODE_PATHS_AND_SUBPATHS)), $(call function_find_subdirectories, $(MF_CONFIGURE_ADD_SOURCE_CODE_PATHS_AND_SUBPATHS)),))
# All the folders that need to be added for the table of contents
MF_SOURCES_ALL_DIRECTORY_PATHS      := $(strip $(sort $(MF_CONFIGURE_ADD_SOURCE_CODE_PATHS) $(MF_SOURCES_FIND_DIRECTORY_PATHS)))

# Locate the directory information (subfolders) that need to be excluded in the source code directory path
MF_SOURCES_FIND_EXCLUDED_DIRECTORYS := $(strip $(if $(strip $(MF_CONFIGURE_DELETE_SOURCE_CODE_PATHS_AND_SUBPATHS)), $(call function_find_subdirectories, $(MF_CONFIGURE_DELETE_SOURCE_CODE_PATHS_AND_SUBPATHS)),))
# All the directories and folders that need to be excluded
MF_SOURCES_ALL_EXCLUDED_DIRECTORYS  := $(strip $(sort $(MF_CONFIGURE_DELETE_SOURCE_CODE_PATHS) $(MF_SOURCES_FIND_EXCLUDED_DIRECTORYS)))

# The directory path of the source code that needs to be compiled
MF_SOURCES_DIRECTORY_PATHS          := $(strip $(sort $(filter-out $(MF_SOURCES_ALL_EXCLUDED_DIRECTORYS), $(MF_SOURCES_ALL_DIRECTORY_PATHS))))

# The C source files (.c) found in the source code directory paths
MF_SOURCES_C_ADD_FILTER_FILES       := $(strip $(filter %.c, $(MF_CONFIGURE_ADD_SOURCE_CODE_FILES)))
MF_SOURCES_C_DEL_FILTER_FILES       := $(strip $(filter %.c, $(MF_CONFIGURE_DELETE_SOURCE_CODE_FILES)))
MF_SOURCES_C_FIND_FILES             := $(strip $(foreach dir, $(MF_SOURCES_DIRECTORY_PATHS), $(wildcard $(dir)/*.c)))
MF_SOURCES_C_ALL_FILES              := $(strip $(MF_SOURCES_C_ADD_FILTER_FILES) $(MF_SOURCES_C_FIND_FILES))
MF_SOURCES_C_FILES                  := $(filter-out $(MF_SOURCES_C_DEL_FILTER_FILES), $(MF_SOURCES_C_ALL_FILES))
MF_SOURCES_C_OBJECTS_FILES_TMP      := $(patsubst %.c, $(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH)/%.o, $(MF_SOURCES_C_FILES))
MF_SOURCES_C_OBJECTS_FILES          := $(strip $(call function_obj_normalize_path, $(MF_SOURCES_C_OBJECTS_FILES_TMP)))
MF_SOURCES_C_DEPENDENT_FILES        := $(MF_SOURCES_C_OBJECTS_FILES:.o=.d)
MF_SOURCES_C_PREPROCESSED_FILES     := $(MF_SOURCES_C_OBJECTS_FILES:.o=.i)
MF_SOURCES_C_ASSEMBLY_FILES         := $(MF_SOURCES_C_OBJECTS_FILES:.o=.s)
MF_SOURCES_C_FILES_DIRECTORY        := $(dir $(MF_SOURCES_C_FILES))
MF_SOURCES_C_OBJECTS_DIRECTORY      := $(dir $(MF_SOURCES_C_OBJECTS_FILES))

# The C++ source files (.cpp) found in the source code directory paths
MF_SOURCES_CPP_ADD_FILTER_FILES     := $(strip $(filter %.cpp, $(MF_CONFIGURE_ADD_SOURCE_CODE_FILES)))
MF_SOURCES_CPP_DEL_FILTER_FILES     := $(strip $(filter %.cpp, $(MF_CONFIGURE_DELETE_SOURCE_CODE_FILES)))
MF_SOURCES_CPP_FIND_FILES           := $(strip $(foreach dir, $(MF_SOURCES_DIRECTORY_PATHS), $(wildcard $(dir)/*.cpp)))
MF_SOURCES_CPP_ALL_FILES            := $(strip $(MF_SOURCES_CPP_ADD_FILTER_FILES) $(MF_SOURCES_CPP_FIND_FILES))
MF_SOURCES_CPP_FILES                := $(filter-out $(MF_SOURCES_CPP_DEL_FILTER_FILES), $(MF_SOURCES_CPP_ALL_FILES))
MF_SOURCES_CPP_OBJECTS_FILES_TMP    := $(patsubst %.cpp, $(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH)/%.o, $(MF_SOURCES_CPP_FILES))
MF_SOURCES_CPP_OBJECTS_FILES        := $(strip $(call function_obj_normalize_path, $(MF_SOURCES_CPP_OBJECTS_FILES_TMP)))
MF_SOURCES_CPP_DEPENDENT_FILES      := $(MF_SOURCES_CPP_OBJECTS_FILES:.o=.d)
MF_SOURCES_CPP_PREPROCESSED_FILES   := $(MF_SOURCES_CPP_OBJECTS_FILES:.o=.ii)
MF_SOURCES_CPP_ASSEMBLY_FILES       := $(MF_SOURCES_CPP_OBJECTS_FILES:.o=.s)
MF_SOURCES_CPP_FILES_DIRECTORY      := $(dir $(MF_SOURCES_CPP_FILES))
MF_SOURCES_CPP_OBJECTS_DIRECTORY    := $(dir $(MF_SOURCES_CPP_OBJECTS_FILES))

#============================
# - Add parameter information
#============================
#----------------------------
# - C file information
#----------------------------
MF_PARAM_C_SOURCES                  := $(MF_SOURCES_C_FILES)
MF_PARAM_C_OBJECTS                  := $(MF_SOURCES_C_OBJECTS_FILES)
MF_PARAM_C_DEPENDENTS               := $(MF_SOURCES_C_DEPENDENT_FILES)

#----------------------------
# - C++ file information
#----------------------------
MF_PARAM_CPP_SOURCES                := $(MF_SOURCES_CPP_FILES)
MF_PARAM_CPP_OBJECTS                := $(MF_SOURCES_CPP_OBJECTS_FILES)
MF_PARAM_CPP_DEPENDENTS             := $(MF_SOURCES_CPP_DEPENDENT_FILES)

#----------------------------
# - Debugging file information
#----------------------------
MF_PARAM_PREPROCESSED               := $(MF_SOURCES_C_PREPROCESSED_FILES) $(MF_SOURCES_CPP_PREPROCESSED_FILES)
MF_PARAM_ASSEMBLY                   := $(MF_SOURCES_C_ASSEMBLY_FILES) $(MF_SOURCES_CPP_ASSEMBLY_FILES)

#----------------------------
# - Add library information (library path prefix -L, library file prefix -l)
#----------------------------
# - Description:
# -- When using third-party libraries in the program, the corresponding link parameters need to be added.
# -- -L: The directory name where the dependent libraries are located.
# -- -l: The specific library to be used -L./lib -ltest
# -- When calling standard libraries, such as if using threads, the -pthread flag needs to be added.
# -- When calling your own libraries or third-party libraries, the path of the library needs to be written out.
# -- For example, if libtest.so is placed in the /aaa/bbb/ccc directory, the link parameter would be -L/aaa/bbb/ccc –ltest.
# -- Using dynamic libraries requires adding the library directory to the environment variable.
# -- For example: /data/lib/libtest.so, export LD_LIBRARY_PATH=/data/lib/:$LD_LIBRARY_PATH

# Search for all subfolders under this directory paths
MF_PARAM_FIND_USING_LIBRARY_PATHS   := $(strip $(if $(strip $(MF_CONFIGURE_ADD_USER_LIBRARY_PATHS_AND_SUBPATHS)), $(call function_find_subdirectories, $(MF_CONFIGURE_ADD_USER_LIBRARY_PATHS_AND_SUBPATHS)),))
# All the required library paths
MF_PARAM_ALL_USING_LIBRARY_PATHS    := $(strip $(sort $(MF_CONFIGURE_ADD_USER_LIBRARY_PATHS) $(MF_PARAM_FIND_USING_LIBRARY_PATHS)))
# Library path information (library path prefix -L)
MF_PARAM_USING_LIBRARY_PATHS        := $(strip $(if $(MF_PARAM_ALL_USING_LIBRARY_PATHS), $(addprefix -L, $(MF_PARAM_ALL_USING_LIBRARY_PATHS)),))

# Library file information (library file prefix -l)
MF_PARAM_ALL_USING_LIBRARY_NAME     := $(strip $(sort $(strip $(MF_CONFIGURE_ADD_STD_LIBRARY_NAME)) $(strip $(MF_CONFIGURE_ADD_USER_LIBRARY_NAME))))
MF_PARAM_USING_LIBRARY_NAME         := $(strip $(if $(MF_PARAM_ALL_USING_LIBRARY_NAME), $(addprefix -l, $(MF_PARAM_ALL_USING_LIBRARY_NAME)),))

# Library path information and library file information
MF_PARAM_USING_LIBRARY_FLAGS        := $(strip $(MF_PARAM_USING_LIBRARY_PATHS) $(MF_PARAM_USING_LIBRARY_NAME))

#----------------------------
# - Add header file directory (prefix -I)
#----------------------------
# = ONLY_CONFIGURE_PATHS, Only including the paths that are configured through the MF_CONFIGURE_ADD_HEADER_FILE_PATHS_AND_SUBPATHS or MF_CONFIGURE_ADD_HEADER_FILE_PATHS variables.
ifeq ($(strip $(firstword $(MF_CONFIGURE_HEADER_FILE_PATH_INCLUDE_RANGE))), ONLY_CONFIGURE_PATHS)
    MF_PARAM_SOURCES_HEADER_FILE_PATHS :=
else
# = BUILD_SOURCE_CODE_PATHS, In addition to ONLY_CONFIGURE_PATHS, it also includes the source file paths (source code compilation paths) that have not been deleted (excluded).
ifeq ($(strip $(firstword $(MF_CONFIGURE_HEADER_FILE_PATH_INCLUDE_RANGE))), BUILD_SOURCE_CODE_PATHS)
    MF_PARAM_SOURCES_HEADER_FILE_PATHS := $(strip $(MF_SOURCES_DIRECTORY_PATHS))
else
# = ALL_PATHS, It includes the deleted (excluded) paths and library paths in addition to ALL_SOURCE_CODE_PATHS.
ifeq ($(strip $(firstword $(MF_CONFIGURE_HEADER_FILE_PATH_INCLUDE_RANGE))), ALL_PATHS)
    MF_PARAM_SOURCES_HEADER_FILE_PATHS := $(strip $(MF_SOURCES_ALL_DIRECTORY_PATHS) $(MF_SOURCES_ALL_EXCLUDED_DIRECTORYS) $(MF_PARAM_ALL_USING_LIBRARY_PATHS))
# = ALL_SOURCE_CODE_PATHS, It includes all the source file paths in addition to ONLY_CONFIGURE_PATHS.
else
    MF_PARAM_SOURCES_HEADER_FILE_PATHS := $(strip $(MF_SOURCES_ALL_DIRECTORY_PATHS))
endif
endif
endif

# - Header file directory. Except for the specified source code directory and its subdirectories, it is necessary to add them manually to the variable MF_CONFIGURE_ADD_HEADER_FILE_PATHS_AND_SUBPATHS or MF_CONFIGURE_ADD_HEADER_FILE_PATHS.
MF_PARAM_FIND_HEADER_FILE_PATHS     := $(strip $(if $(strip $(MF_CONFIGURE_ADD_HEADER_FILE_PATHS_AND_SUBPATHS)), $(call function_find_subdirectories, $(MF_CONFIGURE_ADD_HEADER_FILE_PATHS_AND_SUBPATHS)),))
MF_PARAM_ALL_HEADER_FILE_PATHS      := $(strip $(sort $(MF_PARAM_SOURCES_HEADER_FILE_PATHS) $(MF_CONFIGURE_ADD_HEADER_FILE_PATHS) $(MF_PARAM_FIND_HEADER_FILE_PATHS)))
MF_PARAM_HEADER_FILE_PATHS          := $(strip $(if $(MF_PARAM_ALL_HEADER_FILE_PATHS), $(addprefix -I, $(MF_PARAM_ALL_HEADER_FILE_PATHS)),))

#----------------------------
# - Add macro information (prefix -D)
#----------------------------
MF_PARAM_DEFINE_FLAGS               := $(strip $(if $(strip $(MF_CONFIGURE_ADD_USER_DEFINE)), $(addprefix -D, $(MF_CONFIGURE_ADD_USER_DEFINE)),))

#----------------------------
# - Add GCC flags
#----------------------------
MF_PARAM_C_FLAGS                    := $(strip $(MF_CONFIGURE_C_FLAGS)) $(MF_PARAM_HEADER_FILE_PATHS) $(MF_PARAM_DEFINE_FLAGS)
MF_PARAM_CPP_FLAGS                  := $(strip $(MF_CONFIGURE_CPP_FLAGS)) $(MF_PARAM_HEADER_FILE_PATHS) $(MF_PARAM_DEFINE_FLAGS)

#----------------------------
# - Redefine the target name
#----------------------------
MF_PARAM_TARGET_EXECUTE             := $(strip $(MF_VERIFY_TARGET_FILE_OUTPUT_PATH))/$(strip $(MF_VERIFY_TARGET_FILE_NAME))$(strip $(MF_PLATFORM_TARGET_EXECUTE_SUFFIX))
MF_PARAM_TARGET_LIB_STATIC          := $(strip $(MF_VERIFY_TARGET_FILE_OUTPUT_PATH))/$(strip $(MF_PLATFORM_TARGET_LIB_PREFIX))$(strip $(MF_VERIFY_TARGET_FILE_NAME))$(strip $(MF_PLATFORM_TARGET_LIB_STATIC_SUFFIX))
MF_PARAM_TARGET_LIB_DYNAMIC         := $(strip $(MF_VERIFY_TARGET_FILE_OUTPUT_PATH))/$(strip $(MF_PLATFORM_TARGET_LIB_PREFIX))$(strip $(MF_VERIFY_TARGET_FILE_NAME))$(strip $(MF_PLATFORM_TARGET_LIB_DYNAMIC_SUFFIX))

# debug target, (MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG = RELEASE_AND_DEBUG)
MF_PARAM_TARGET_EXECUTE_DEBUG       := $(strip $(MF_VERIFY_TARGET_FILE_OUTPUT_PATH))/$(strip $(MF_VERIFY_TARGET_FILE_NAME))_debug$(strip $(MF_PLATFORM_TARGET_EXECUTE_SUFFIX))
MF_PARAM_TARGET_LIB_STATIC_DEBUG    := $(strip $(MF_VERIFY_TARGET_FILE_OUTPUT_PATH))/$(strip $(MF_PLATFORM_TARGET_LIB_PREFIX))$(strip $(MF_VERIFY_TARGET_FILE_NAME))_debug$(strip $(MF_PLATFORM_TARGET_LIB_STATIC_SUFFIX))
MF_PARAM_TARGET_LIB_DYNAMIC_DEBUG   := $(strip $(MF_VERIFY_TARGET_FILE_OUTPUT_PATH))/$(strip $(MF_PLATFORM_TARGET_LIB_PREFIX))$(strip $(MF_VERIFY_TARGET_FILE_NAME))_debug$(strip $(MF_PLATFORM_TARGET_LIB_DYNAMIC_SUFFIX))

MF_PARAM_TARGET                      = $(MF_PARAM_TARGET_EXECUTE)

#----------------------------
# - Whether to use static compilation
#----------------------------
ifeq ($(strip $(firstword $(MF_CONFIGURE_USING_STATIC_COMPILATION))), YES)
    MF_PARAM_USING_STATIC_COMPILATION := -static
else
    MF_PARAM_USING_STATIC_COMPILATION :=
endif

#----------------------------
# - Compile the original file type
#----------------------------
ifeq ($(strip $(firstword $(MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE))), C_TYPE)
    MF_PARAM_COMPILE_TOOL_CC  := $(strip $(MF_COMPILE_TOOL_CC))
    MF_PARAM_CC_OBJECTS       := $(strip $(MF_PARAM_C_OBJECTS))
    MF_PARAM_CC_FLAGS         := $(strip $(MF_PARAM_C_FLAGS))
    MF_PARAM_CC_OBJECTS_FLAGS := $(strip $(MF_CONFIGURE_C_OBJECTS_FLAGS))
else
    MF_PARAM_COMPILE_TOOL_CC  := $(strip $(MF_COMPILE_TOOL_CPP))
    MF_PARAM_CC_OBJECTS       := $(strip $(MF_PARAM_C_OBJECTS)) $(strip $(MF_PARAM_CPP_OBJECTS))
    MF_PARAM_CC_FLAGS         := $(strip $(MF_PARAM_CPP_FLAGS))
    MF_PARAM_CC_OBJECTS_FLAGS := $(strip $(MF_CONFIGURE_CPP_OBJECTS_FLAGS))
endif

#----------------------------
# - Check if there are any target files
#----------------------------
ifeq ($(strip $(MF_PARAM_CC_OBJECTS)),)
    $(error -> Note: The target file was not found. Please check the source code directory.)
endif

#============================
# - The first pseudo-target instruction, "make" is executed.
#============================
MF_PHONY = start_main
start_main : build

#============================
# - Explicitly declare the dependent file functions
#============================
#========================================================
# Whether to use explicit declaration
ifeq ($(MF_CONFIGURE_USE_EXPLICIT_DECLARATION), YES)

MF_OBJECT_USING_LOG_ENABLED := $(strip $(firstword $(MF_CONFIGURE_USING_FORMATTEND_LOG)))
MF_OBJECT_USING_LOG         := $(if $(filter YES,$(MF_OBJECT_USING_LOG_ENABLED)),YES,NO)
#----------------------------
# - Generate .i file (from .c file)
#----------------------------
define function_c_language_preprocess_rule
$(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH)/$(strip $1) : $(strip $2)
	@$$(MF_PLATFORM_USING_TOOLS_MKDIR) $$(@D)
ifeq ($$(MF_OBJECT_USING_LOG), YES)
	@$$(MF_PLATFORM_USING_TOOLS_ECHO) '$(strip $(MF_CONFIGURE_FORMATTEND_LOG_PREPROCESS_SHOW_STRING) $$< -> $$@)'
	@$$(MF_PARAM_COMPILE_TOOL_CC) -E $$(strip '$$<' -o '$$@' $$(MF_PARAM_CC_FLAGS))
else
	$$(MF_PARAM_COMPILE_TOOL_CC) -E '$$(strip $$<' -o '$$@' $$(MF_PARAM_CC_FLAGS))
endif
endef

#----------------------------
# - Generate .s file (from .c file)
#----------------------------
define function_c_language_assemble_rule
$(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH)/$(strip $1) : $(strip $2)
	@$$(MF_PLATFORM_USING_TOOLS_MKDIR) $$(@D)
ifeq ($$(MF_OBJECT_USING_LOG), YES)
	@$$(MF_PLATFORM_USING_TOOLS_ECHO) '$(strip $(MF_CONFIGURE_FORMATTEND_LOG_ASSEMBLE_SHOW_STRING) $$< -> $$@)'
	@$$(MF_PARAM_COMPILE_TOOL_CC) $$(strip -S '$$<' -o '$$@' $$(MF_PARAM_CC_FLAGS))
else
	$$(MF_PARAM_COMPILE_TOOL_CC) $$(strip -S '$$<' -o '$$@' $$(MF_PARAM_CC_FLAGS))
endif
endef

#----------------------------
# - Generate .o file (from .c file)
#----------------------------
define function_c_language_object_rule
$(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH)/$(strip $1) : $(strip $2)
	@$$(MF_PLATFORM_USING_TOOLS_MKDIR) $$(@D)
ifeq ($$(MF_OBJECT_USING_LOG), YES)
	@$$(MF_PLATFORM_USING_TOOLS_ECHO) '$(strip $(MF_CONFIGURE_FORMATTEND_LOG_CC_OBJECT_SHOW_STRING) $$<)'
	@$$(MF_PARAM_COMPILE_TOOL_CC) $$(strip $$(MF_PARAM_CC_OBJECTS_FLAGS) -c '$$<' -o '$$@' $$(MF_PARAM_CC_FLAGS))
else
	$$(MF_PARAM_COMPILE_TOOL_CC) $$(strip $$(MF_PARAM_CC_OBJECTS_FLAGS) -c '$$<' -o '$$@' $$(MF_PARAM_CC_FLAGS))
endif
endef

#----------------------------
# - Generate .ii file (from .cpp file)
#----------------------------
define function_cpp_language_preprocess_rule
$(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH)/$(strip $1) : $(strip $2)
	@$$(MF_PLATFORM_USING_TOOLS_MKDIR) $$(@D)
ifeq ($$(MF_OBJECT_USING_LOG), YES)
	@$$(MF_PLATFORM_USING_TOOLS_ECHO) '$(strip $(MF_CONFIGURE_FORMATTEND_LOG_PREPROCESS_SHOW_STRING) $$< -> $$@)'
	@$$(MF_COMPILE_TOOL_CPP) $$(strip -E '$$<' -o '$$@' $$(MF_PARAM_CC_FLAGS))
else
	$$(MF_COMPILE_TOOL_CPP) $$(strip -E '$$<' -o '$$@' $$(MF_PARAM_CC_FLAGS))
endif
endef

#----------------------------
# - Generate .s file (from .cpp file)
#----------------------------
define function_cpp_language_assemble_rule
$(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH)/$(strip $1) : $(strip $2)
	@$$(MF_PLATFORM_USING_TOOLS_MKDIR) $$(@D)
ifeq ($$(MF_OBJECT_USING_LOG), YES)
	@$$(MF_PLATFORM_USING_TOOLS_ECHO) '$(strip $(MF_CONFIGURE_FORMATTEND_LOG_ASSEMBLE_SHOW_STRING) $$< -> $$@)'
	@$$(MF_COMPILE_TOOL_CPP) $(strip -S '$$<' -o '$$@' $$(MF_PARAM_CC_FLAGS))
else
	$$(MF_COMPILE_TOOL_CPP) $(strip -S '$$<' -o '$$@' $$(MF_PARAM_CC_FLAGS))
endif
endef

#----------------------------
# - Generate .o file (from .cpp file)
#----------------------------
define function_cpp_language_object_rule
$(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH)/$(strip $1) : $(strip $2)
	@$$(MF_PLATFORM_USING_TOOLS_MKDIR) $$(@D)
ifeq ($$(MF_OBJECT_USING_LOG), YES)
	@$$(MF_PLATFORM_USING_TOOLS_ECHO) '$(strip $(MF_CONFIGURE_FORMATTEND_LOG_CPP_OBJECT_SHOW_STRING) $$<)'
	@$$(MF_COMPILE_TOOL_CPP) $$(strip $$(MF_PARAM_CC_OBJECTS_FLAGS) -c '$$<' -o '$$@' $$(MF_PARAM_CC_FLAGS))
else
	$$(MF_COMPILE_TOOL_CPP) $$(strip $$(MF_PARAM_CC_OBJECTS_FLAGS) -c '$$<' -o '$$@' $$(MF_PARAM_CC_FLAGS))
endif
endef

#============================
# - Explicitly declare the function usage of the dependency file
#============================
# Use the eval function to dynamically generate rules. 'make' version V3.81.
ifeq ($(call function_check_make_version, $(MF_VERSION_STD_INTERMEDIATE_FILE_PATH)), true)
    $(foreach src,$(MF_PARAM_C_SOURCES),$(eval $(call function_c_language_preprocess_rule,$(call function_obj_normalize_path,$(src:.c=.i)),$(src))))
    $(foreach src,$(MF_PARAM_C_SOURCES),$(eval $(call function_c_language_assemble_rule,$(call function_obj_normalize_path,$(src:.c=.s)),$(src))))
    $(foreach src,$(MF_PARAM_C_SOURCES),$(eval $(call function_c_language_object_rule,$(call function_obj_normalize_path,$(src:.c=.o)),$(src))))
    $(foreach src,$(MF_PARAM_CPP_SOURCES),$(eval $(call function_cpp_language_preprocess_rule,$(call function_obj_normalize_path,$(src:.cpp=.ii)),$(src))))
    $(foreach src,$(MF_PARAM_CPP_SOURCES),$(eval $(call function_cpp_language_assemble_rule,$(call function_obj_normalize_path,$(src:.cpp=.s)),$(src))))
    $(foreach src,$(MF_PARAM_CPP_SOURCES),$(eval $(call function_cpp_language_object_rule,$(call function_obj_normalize_path,$(src:.cpp=.o)),$(src))))
endif ## ifeq ($(call function_check_make_version, $(MF_VERSION_STD_INTERMEDIATE_FILE_PATH)), true) end
endif ## ifeq ($(MF_CONFIGURE_USE_EXPLICIT_DECLARATION), YES) end
#========================================================

#============================
# - Standardized implicit declaration dependency file
#============================
#----------------------------
# - Generate .i file (from .c file)
#----------------------------
$(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH)/%.i : %.c
	@$(MF_PLATFORM_USING_TOOLS_MKDIR) $(@D)
ifeq ($(strip $(firstword $(MF_CONFIGURE_USING_FORMATTEND_LOG))), YES)
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '$(strip $(MF_CONFIGURE_FORMATTEND_LOG_PREPROCESS_SHOW_STRING) $< -> $@)'
	@$(MF_PARAM_COMPILE_TOOL_CC) $(strip -E '$<' -o '$@' $(MF_PARAM_CC_FLAGS))
else
	$(MF_PARAM_COMPILE_TOOL_CC) $(strip -E '$<' -o '$@' $(MF_PARAM_CC_FLAGS))
endif

#----------------------------
# - Generate .s file (from .c file)
#----------------------------
$(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH)/%.s : %.c
	@$(MF_PLATFORM_USING_TOOLS_MKDIR) $(@D)
ifeq ($(strip $(firstword $(MF_CONFIGURE_USING_FORMATTEND_LOG))), YES)
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '$(strip $(MF_CONFIGURE_FORMATTEND_LOG_ASSEMBLE_SHOW_STRING) $< -> $@)'
	@$(MF_PARAM_COMPILE_TOOL_CC) $(strip -S '$<' -o '$@' $(MF_PARAM_CC_FLAGS))
else
	$(MF_PARAM_COMPILE_TOOL_CC) $(strip -S '$<' -o '$@' $(MF_PARAM_CC_FLAGS))
endif

#----------------------------
# - Generate .o file (from .c file)
#----------------------------
$(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH)/%.o : %.c
	@$(MF_PLATFORM_USING_TOOLS_MKDIR) $(@D)
ifeq ($(strip $(firstword $(MF_CONFIGURE_USING_FORMATTEND_LOG))), YES)
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '$(strip $(MF_CONFIGURE_FORMATTEND_LOG_CC_OBJECT_SHOW_STRING) $<)'
	@$(MF_PARAM_COMPILE_TOOL_CC) $(strip $(MF_PARAM_CC_OBJECTS_FLAGS) -c '$<' -o '$@' $(MF_PARAM_CC_FLAGS))
else
	$(MF_PARAM_COMPILE_TOOL_CC) $(strip $(MF_PARAM_CC_OBJECTS_FLAGS) -c '$<' -o '$@' $(MF_PARAM_CC_FLAGS))
endif

#----------------------------
# - Generate .ii file (from .cpp file)
#----------------------------
$(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH)/%.ii : %.cpp
	@$(MF_PLATFORM_USING_TOOLS_MKDIR) $(@D)
ifeq ($(strip $(firstword $(MF_CONFIGURE_USING_FORMATTEND_LOG))), YES)
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '$(strip $(MF_CONFIGURE_FORMATTEND_LOG_PREPROCESS_SHOW_STRING) $< -> $@)'
	@$(MF_COMPILE_TOOL_CPP) $(strip -E '$<' -o '$@' $(MF_PARAM_CC_FLAGS))
else
	$(MF_COMPILE_TOOL_CPP) $(strip -E '$<' -o '$@' $(MF_PARAM_CC_FLAGS))
endif

#----------------------------
# - Generate .s file (from .cpp file)
#----------------------------
$(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH)/%.s : %.cpp
	@$(MF_PLATFORM_USING_TOOLS_MKDIR) $(@D)
ifeq ($(strip $(firstword $(MF_CONFIGURE_USING_FORMATTEND_LOG))), YES)
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '$(strip $(MF_CONFIGURE_FORMATTEND_LOG_ASSEMBLE_SHOW_STRING) $< -> $@)'
	@$(MF_COMPILE_TOOL_CPP) $(strip -S '$<' -o '$@' $(MF_PARAM_CC_FLAGS))
else
	$(MF_COMPILE_TOOL_CPP) $(strip -S '$<' -o '$@' $(MF_PARAM_CC_FLAGS))
endif

#----------------------------
# - Generate .o file (from .cpp file)
#----------------------------
$(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH)/%.o : %.cpp
	@$(MF_PLATFORM_USING_TOOLS_MKDIR) $(@D)
ifeq ($(strip $(firstword $(MF_CONFIGURE_USING_FORMATTEND_LOG))), YES)
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '$(strip $(MF_CONFIGURE_FORMATTEND_LOG_CPP_OBJECT_SHOW_STRING) $<)'
	@$(MF_COMPILE_TOOL_CPP) $(strip $(MF_PARAM_CC_OBJECTS_FLAGS) -c '$<' -o '$@' $(MF_PARAM_CC_FLAGS))
else
	$(MF_COMPILE_TOOL_CPP) $(strip $(MF_PARAM_CC_OBJECTS_FLAGS) -c '$<' -o '$@' $(MF_PARAM_CC_FLAGS))
endif

#============================
# - Generate binary file
#============================
#----------------------------
# - Static library construction
#----------------------------
# - target file output type begin
ifeq ($(strip $(firstword $(MF_CONFIGURE_OUTPUT_TARGET_FILE_TYPE))), LIBRARY_STATIC)
MF_PARAM_TARGET = $(MF_PARAM_TARGET_LIB_STATIC)
$(MF_PARAM_TARGET): $(MF_PARAM_CC_OBJECTS)
	@$(MF_PLATFORM_USING_TOOLS_MKDIR) $(@D)
# - ar Parameter = rcs
#   -- r <replace> : Replace the existing member files in the archived file, or add new files. If the file names match, the old files will be deleted and replaced with the new ones.
#   -- c <create>  : Silently create the archive file. If the archive file does not exist, it will be automatically created without displaying any warning messages.
#   -- s <index>   : Generate or update an index for archived files (similar to the function of the ranlib command), even if the file content has not been modified, this operation will be performed.
ifeq ($(strip $(firstword $(MF_CONFIGURE_USING_FORMATTEND_LOG))), YES)
	@$(MF_COMPILE_TOOL_AR) $(strip rcs $(MF_PARAM_TARGET_LIB_STATIC) $^)
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '$(strip $(MF_CONFIGURE_FORMATTEND_LOG_LIBRARY_STATIC_SHOW_STRING) $(MF_PARAM_TARGET_LIB_STATIC))'
else
	$(MF_COMPILE_TOOL_AR) $(strip rcs $(MF_PARAM_TARGET_LIB_STATIC) $^)
endif

# -- target file output release or debug begin
ifeq ($(strip $(firstword $(MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG))), RELEASE)
	$(MF_COMPILE_TOOL_STRIP) $(MF_PARAM_TARGET_LIB_STATIC)
endif
ifeq ($(strip $(firstword $(MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG))), RELEASE_AND_DEBUG)
	@$(MF_PLATFORM_USING_TOOLS_CP) $(MF_PARAM_TARGET_LIB_STATIC)  $(MF_PARAM_TARGET_LIB_STATIC_DEBUG)
	@$(MF_COMPILE_TOOL_STRIP) $(MF_PARAM_TARGET_LIB_STATIC)
endif
# -- target file output release or debug end
endif
# - target file output type end

#----------------------------
# - Dynamic library construction
#----------------------------
# - target file output type begin
ifeq ($(strip $(firstword $(MF_CONFIGURE_OUTPUT_TARGET_FILE_TYPE))), LIBRARY_DYNAMIC)
MF_PARAM_TARGET = $(MF_PARAM_TARGET_LIB_DYNAMIC)
$(MF_PARAM_TARGET): $(MF_PARAM_CC_OBJECTS)
	@$(MF_PLATFORM_USING_TOOLS_MKDIR) $(@D)
ifeq ($(strip $(firstword $(MF_CONFIGURE_USING_FORMATTEND_LOG))), YES)
	@$(MF_PARAM_COMPILE_TOOL_CC) $(strip -shared -fPIC -o $(MF_PARAM_TARGET_LIB_DYNAMIC) $^ $(MF_PARAM_USING_LIBRARY_FLAGS))
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '$(strip $(MF_CONFIGURE_FORMATTEND_LOG_LIBRARY_DYNAMIC_SHOW_STRING) $(MF_PARAM_TARGET_LIB_DYNAMIC))'
else
	$(MF_PARAM_COMPILE_TOOL_CC) $(strip -shared -fPIC -o $(MF_PARAM_TARGET_LIB_DYNAMIC) $^ $(MF_PARAM_USING_LIBRARY_FLAGS))
endif

# -- target file output release or debug begin
ifeq ($(strip $(firstword $(MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG))), RELEASE)
	@$(MF_COMPILE_TOOL_STRIP) $(MF_PARAM_TARGET_LIB_DYNAMIC)
endif
ifeq ($(strip $(firstword $(MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG))), RELEASE_AND_DEBUG)
	@$(MF_PLATFORM_USING_TOOLS_CP) $(MF_PARAM_TARGET_LIB_DYNAMIC) $(MF_PARAM_TARGET_LIB_DYNAMIC_DEBUG)
	@$(MF_COMPILE_TOOL_STRIP) $(MF_PARAM_TARGET_LIB_DYNAMIC)
endif
# -- target file output release or debug end
endif
# - target file output type end

#----------------------------
# - Static library and dynamic library construction
#----------------------------
# - target file output type begin
ifeq ($(strip $(firstword $(MF_CONFIGURE_OUTPUT_TARGET_FILE_TYPE))), LIBRARY_STATIC_AND_DYNAMIC)
MF_PARAM_TARGET = $(MF_PARAM_TARGET_LIB_STATIC) $(MF_PARAM_TARGET_LIB_DYNAMIC)
# - Static library
$(MF_PARAM_TARGET_LIB_STATIC): $(MF_PARAM_CC_OBJECTS)
	@$(MF_PLATFORM_USING_TOOLS_MKDIR) $(@D)
# - ar Parameter = rcs
#   -- r <replace> : Replace the existing member files in the archived file, or add new files. If the file names match, the old files will be deleted and replaced with the new ones.
#   -- c <create>  : Silently create the archive file. If the archive file does not exist, it will be automatically created without displaying any warning messages.
#   -- s <index>   : Generate or update an index for archived files (similar to the function of the ranlib command), even if the file content has not been modified, this operation will be performed.
ifeq ($(strip $(firstword $(MF_CONFIGURE_USING_FORMATTEND_LOG))), YES)
	@$(MF_COMPILE_TOOL_AR) $(strip rcs $(MF_PARAM_TARGET_LIB_STATIC) $^)
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '$(strip $(MF_CONFIGURE_FORMATTEND_LOG_LIBRARY_STATIC_SHOW_STRING) $(MF_PARAM_TARGET_LIB_STATIC))'
else
	$(MF_COMPILE_TOOL_AR) $(strip rcs $(MF_PARAM_TARGET_LIB_STATIC) $^)
endif

# -- target file output release or debug begin
ifeq ($(strip $(firstword $(MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG))), RELEASE)
	$(MF_COMPILE_TOOL_STRIP) $(MF_PARAM_TARGET_LIB_STATIC)
endif
ifeq ($(strip $(firstword $(MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG))), RELEASE_AND_DEBUG)
	@$(MF_PLATFORM_USING_TOOLS_CP) $(MF_PARAM_TARGET_LIB_STATIC)  $(MF_PARAM_TARGET_LIB_STATIC_DEBUG)
	@$(MF_COMPILE_TOOL_STRIP) $(MF_PARAM_TARGET_LIB_STATIC)
endif
# -- target file output release or debug end

# - Dynamic library
$(MF_PARAM_TARGET_LIB_DYNAMIC): $(MF_PARAM_CC_OBJECTS)
	@$(MF_PLATFORM_USING_TOOLS_MKDIR) $(@D)
ifeq ($(strip $(firstword $(MF_CONFIGURE_USING_FORMATTEND_LOG))), YES)
	@$(MF_PARAM_COMPILE_TOOL_CC) $(strip -shared -fPIC -o $(MF_PARAM_TARGET_LIB_DYNAMIC) $^ $(MF_PARAM_USING_LIBRARY_FLAGS))
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '$(strip $(MF_CONFIGURE_FORMATTEND_LOG_LIBRARY_DYNAMIC_SHOW_STRING) $(MF_PARAM_TARGET_LIB_DYNAMIC))'
else
	$(MF_PARAM_COMPILE_TOOL_CC) $(strip -shared -fPIC -o $(MF_PARAM_TARGET_LIB_DYNAMIC) $^ $(MF_PARAM_USING_LIBRARY_FLAGS))
endif

# -- target file output release or debug begin
ifeq ($(strip $(firstword $(MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG))), RELEASE)
	@$(MF_COMPILE_TOOL_STRIP) $(MF_PARAM_TARGET_LIB_DYNAMIC)
endif
ifeq ($(strip $(firstword $(MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG))), RELEASE_AND_DEBUG)
	@$(MF_PLATFORM_USING_TOOLS_CP) $(MF_PARAM_TARGET_LIB_DYNAMIC) $(MF_PARAM_TARGET_LIB_DYNAMIC_DEBUG)
	@$(MF_COMPILE_TOOL_STRIP) $(MF_PARAM_TARGET_LIB_DYNAMIC)
endif
# -- target file output release or debug end

endif
# - target file output type end

#----------------------------
# - Executable file construction
#----------------------------
# - target file output type begin
ifeq ($(strip $(firstword $(MF_CONFIGURE_OUTPUT_TARGET_FILE_TYPE))), EXECUTE)
MF_PARAM_TARGET = $(MF_PARAM_TARGET_EXECUTE)
$(MF_PARAM_TARGET) : $(MF_PARAM_CC_OBJECTS)
	@$(MF_PLATFORM_USING_TOOLS_MKDIR) $(@D)
ifeq ($(strip $(firstword $(MF_CONFIGURE_USING_FORMATTEND_LOG))), YES)
	@$(MF_PARAM_COMPILE_TOOL_CC) $(strip $(MF_PARAM_USING_STATIC_COMPILATION) -o $@ $^ $(MF_PARAM_USING_LIBRARY_FLAGS))
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '$(strip $(MF_CONFIGURE_FORMATTEND_LOG_EXECUTE_SHOW_STRING) $(MF_PARAM_TARGET_EXECUTE))'
else
	$(MF_PARAM_COMPILE_TOOL_CC) $(strip $(MF_PARAM_USING_STATIC_COMPILATION) -o $@ $^ $(MF_PARAM_USING_LIBRARY_FLAGS))
endif

# -- target file output release or debug begin
ifeq ($(strip $(firstword $(MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG))), RELEASE)
	@$(MF_COMPILE_TOOL_STRIP) $(MF_PARAM_TARGET_EXECUTE)
endif
ifeq ($(strip $(firstword $(MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG))), RELEASE_AND_DEBUG)
	@$(MF_PLATFORM_USING_TOOLS_CP) $(MF_PARAM_TARGET_EXECUTE) $(MF_PARAM_TARGET_EXECUTE_DEBUG)
	@$(MF_COMPILE_TOOL_STRIP) $(MF_PARAM_TARGET_EXECUTE)
endif
# -- target file output release or debug end
endif
# - target file output type end

#============================
# - pseudo-target
#============================
#----------------------------
# - Generate target files
#----------------------------
MF_PHONY = build
build : $(MF_PARAM_TARGET)
#@$(MF_PLATFORM_USING_TOOLS_ECHO) 'build success!'
# Delete the intermediate files if configured.
ifeq ($(strip $(firstword $(MF_CONFIGURE_DELETING_INTERMEDIATE_FILES))), YES)
	@$(call function_clean_intermediate_file)
endif

#----------------------------
# - Regenerate target files
#----------------------------
MF_PHONY += rebuild
# Direct writing does not support -j parallel compilation because they have an execution sequence. rebuild : clean build
# To support .WAIT, the make version needs to be v4.4 or above. rebuild : clean .WAIT build
ifeq ($(call function_check_make_version, $(MF_VERSION_SEQUENTIAL_EXEC_TARGET)), true)
rebuild : clean .WAIT build
else
rebuild : build
endif

#----------------------------
# - Generate all files
#----------------------------
MF_PHONY += all
all : object assemble preprocess $(MF_PARAM_TARGET)
#@$(MF_PLATFORM_USING_TOOLS_ECHO) 'build success!'
# Delete the intermediate files if configured.
ifeq ($(strip $(firstword $(MF_CONFIGURE_DELETING_INTERMEDIATE_FILES))), YES)
	@$(call function_clean_intermediate_file)
endif

#----------------------------
# - Regenerate all files
#----------------------------
MF_PHONY += rebuild_all
# Direct writing does not support -j parallel compilation because they have an execution sequence. rebuild_all : clean all
#To support .WAIT, the make version needs to be v4.4 or above. rebuild_all : clean .WAIT all
ifeq ($(call function_check_make_version, $(MF_VERSION_SEQUENTIAL_EXEC_TARGET)), true)
rebuild_all: clean .WAIT all
else
rebuild_all: all
endif
#----------------------------
# - Generate preprocessing files
#----------------------------
MF_PHONY += preprocess
preprocess: $(MF_PARAM_PREPROCESSED)

#----------------------------
# - Generate assembly files
#----------------------------
MF_PHONY += assemble
assemble: $(MF_PARAM_ASSEMBLY)

#----------------------------
# - Generate object files
#----------------------------
MF_PHONY += object
object: $(MF_PARAM_CC_OBJECTS)

#----------------------------
# - Delete all intermediate files and target files
#----------------------------
MF_PHONY += clean
clean:
	@$(call function_clean_intermediate_file)
	@$(call function_clean_target_file)
#@$(MF_PLATFORM_USING_TOOLS_ECHO) 'clean success!'

#----------------------------
# - Print version information
#----------------------------
MF_PHONY += version
version:
	@$(MF_PLATFORM_USING_TOOLS_ECHO) $(MF_NAME)
	@$(MF_PLATFORM_USING_TOOLS_ECHO) 'version: $(MF_VERSION).$(MF_SUBLEVEL).$(MF_PATCHLEVEL)'

#----------------------------
# - Print configuration information
#----------------------------
MF_PHONY += infoprint
infoprint:
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '---------'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) ' - The current platform: $(MF_PLATFORM_OS)'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) ' - The current version of make being used: $(MAKE_VERSION)'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) ' - Make flags: $(MAKEFLAGS)'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) ' - Use the shell: $(SHELL)'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) ''
	@$(MF_PLATFORM_USING_TOOLS_ECHO) ' - Use the c compiler tool: $(MF_COMPILE_TOOL_CC)'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) ' - Use the c++ compiler tool: $(MF_COMPILE_TOOL_CPP)'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) ' - Use the archiver tool: $(MF_COMPILE_TOOL_AR)'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) ' - Use the strip tool: $(MF_COMPILE_TOOL_STRIP)'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) ' - The currently in-use compilation tool: $(MF_PARAM_COMPILE_TOOL_CC)'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) ''
	@$(MF_PLATFORM_USING_TOOLS_ECHO) ' - Target file: $(MF_PARAM_TARGET)'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) ' - Target file name: $(MF_CONFIGURE_TARGET_FILE_NAME)'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) ' - Target file output directory: $(MF_CONFIGURE_TARGET_FILE_OUTPUT_PATH)'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) ' - Intermediate file output directory: $(MF_CONFIGURE_INTERMEDIATE_FILE_OUTPUT_PATH)'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) ' - Use the build type: $(MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG)'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) ' - Use the original file type: $(MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE)'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) ' - Use the target type: $(MF_CONFIGURE_OUTPUT_TARGET_FILE_TYPE)' 
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '---------'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) ''

#----------------------------
# - Print help information
#----------------------------
MF_PHONY += help
help:
	@$(MF_PLATFORM_USING_TOOLS_ECHO) $(MF_NAME)
	@$(MF_PLATFORM_USING_TOOLS_ECHO) 'version: $(MF_VERSION).$(MF_SUBLEVEL).$(MF_PATCHLEVEL)'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) 'The current version of make being used: $(MAKE_VERSION)'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) 'The following is a detailed explanation of all the commands.'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) ''
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '  make start_main  - Equivalent to the 'make build' command.'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '  make build       - Generating the target file, It is the same as directly executing the 'make' command.'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '  make rebuild     - Re-generate the target file.'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '                     Note: For versions of make v4.4 or higher,it will re-generate every time. Otherwise, it will be the same as the 'make build' command.'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '  make all         - Generate all files (such as .o, .d, .i, .s and object files).'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '  make rebuild_all - Re-generate all files (.o, .d, .i, .s and object files), and debugging is available.'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '                     Note: For versions of make v4.4 or higher,it will re-generate every time. Otherwise, it will be the same as the 'make all' command.'

	@$(MF_PLATFORM_USING_TOOLS_ECHO) '  make clean       - Delete all intermediate files and target files.'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '  make preprocess  - Generate preprocessing file.'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '  make assemble    - Generate assembly file.'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '  make object      - Generate object file.'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '  make version     - Makefile version information.'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '  make infoprint   - Print detailed information.'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) '  make help        - Help Information.'
	@$(MF_PLATFORM_USING_TOOLS_ECHO) ''

# - pseudo-target declaration
.PHONY: $(MF_PHONY)
