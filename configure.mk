#============================
# - Project Information
#============================
# @File      : configure.mk
# @Encoding  : UTF-8

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
MF_CONFIGURE_ONLY_STARTED_BY_SCRIPT ?= NO

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
MF_CONFIGURE_TARGET_FILE_NAME ?= main

# -# Output type of the compiled target file #
#  - Parameter = [RELEASE] Delete the symbol table in the executable file. The symbol table does not affect the program's operation, and it can reduce the size of the program.
#  - Parameter = [DEBUG]   Keep the symbol table in the executable file. When using gdb for debugging, set it to NO.
#  - Parameter = [RELEASE_AND_DEBUG] Keep the RELEASE and DEBUG files.
MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG ?= RELEASE_AND_DEBUG

# -# Compilation output file type #
#  - Parameter = [EXECUTE]                    Generate an executable program.
#  - Parameter = [LIBRARY_DYNAMIC]            Generate (.so) dynamic library file.
#  - Parameter = [LIBRARY_STATIC]             Generate (.a) static library file.
#  - Parameter = [LIBRARY_STATIC_AND_DYNAMIC] Generate (.a and .so) dynamic and static library files.
MF_CONFIGURE_OUTPUT_TARGET_FILE_TYPE ?= EXECUTE

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
MF_CONFIGURE_ADD_SOURCE_CODE_PATHS_AND_SUBPATHS ?= ./src

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
#    -- __YE=\"hello\" Equivalent to C language #define __YE "hello"
#  - Example : 
#    -- ?= __YE __CC __VERSION=\"1.0.0\"
#    -- += __YECC=\"hello\"
#    -- += __YECC_NUM=1
#    -- += APP_VERSION=\"1.0.0\"
MF_CONFIGURE_ADD_USER_DEFINE ?=

#----------------------------
# - Compilation configuration
#----------------------------
# -# Compile original file type #
#  - Parameter = [CPP_TYPE] Use C++ compiler to compile C and C++ files.
#  - Parameter = [C_TYPE]   Use C compiler to compile C files only.
MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE ?= C_TYPE

# -# Use the C compiler for mixed compilation #
#  - Note : 
#    -- This option is only effective when MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE is set to C_TYPE.
#    -- If it is 'YES', the 'stdc++' library will be automatically added to the link.
#    -- If it is "YES", then the .h file must contain the following macros; otherwise, an error will occur during the linking process.
#       --- #ifdef __cplusplus
#       --- extern "C" {
#       --- #endif
#
#       --- #ifdef __cplusplus
#       ---  } /*extern "C"*/
#       --- #endif
#
#  - Parameter = [YES] Use the C compiler to perform mixed compilation of C and C++ source codes
#  - Parameter = [NO]  Only compile the C files
MF_CONFIGURE_USING_C_COMPILER_MIXED_COMPILATION ?= YES

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

# -# During compilation, the explicit compiler string printing is determined by the file type. #
#  The strings printed by the explicit tool are determined by MF_CONFIGURE_FORMATTEND_LOG_CC_OBJECT_SHOW_STRING and MF_CONFIGURE_FORMATTEND_LOG_CPP_OBJECT_SHOW_STRING.
#  - Note : 
#    -- It takes effect only when MF_CONFIGURE_USING_FORMATTEND_LOG is set to "YES".
#
#  - Parameter = [YES] The printing string is determined by the file type; for example, for files with the extension ".c", the printing string is "cc", and for files with the extension ".cpp", the printing string is "cpp".
#  - Parameter = [NO]  The printed string is determined by the compiler being used; for example: when using the gcc tool, the printed string is "cc", and when using the g++ tool, the printed string is "cpp"
MF_CONFIGURE_FORMATTEND_LOG_OBJECT_USING_FILE_TYPE_SHOW ?= YES

# -# Compile log using formatted display strings(.c -> .o) #
#  - Note : 
#    -- It takes effect only when MF_CONFIGURE_USING_FORMATTEND_LOG is set to "YES".
#  - Example : 
#    -- ?= CC
#    -- ?= Building
#    -- ?= Compiling
MF_CONFIGURE_FORMATTEND_LOG_CC_OBJECT_SHOW_STRING ?= cc

# -# Compile log using formatted display strings(.cpp -> .o) #
#  - Note : 
#    -- It takes effect only when MF_CONFIGURE_USING_FORMATTEND_LOG is set to "YES".
#  - Example : 
#    -- ?= CPP
#    -- ?= Building
#    -- ?= Compiling
MF_CONFIGURE_FORMATTEND_LOG_CPP_OBJECT_SHOW_STRING ?= cpp

# -# Compile log using formatted display strings(.c -> .s) or (.cpp -> .s) #
#  - Note : 
#    -- It takes effect only when MF_CONFIGURE_USING_FORMATTEND_LOG is set to "YES".
#  - Example : 
#    -- ?= AS
#    -- ?= Building
#    -- ?= Compiling
MF_CONFIGURE_FORMATTEND_LOG_ASSEMBLE_SHOW_STRING ?= as

# -# Compile log using formatted display strings(.c -> .i) or (.cpp -> .ii) #
#  - Note : 
#    -- It takes effect only when MF_CONFIGURE_USING_FORMATTEND_LOG is set to "YES".
#  - Example : 
#    -- ?= PR
#    -- ?= [PREPROCESS]
#    -- ?= Building
#    -- ?= Compiling
MF_CONFIGURE_FORMATTEND_LOG_PREPROCESS_SHOW_STRING ?= pr

# -# Generate a log for the link packaging process of the static library, using formatted display strings #
#  - Note : 
#    -- It takes effect only when MF_CONFIGURE_USING_FORMATTEND_LOG is set to "YES".
#  - Example : 
#    -- ?= AR
#    -- ?= linking
#    -- ?= package
MF_CONFIGURE_FORMATTEND_LOG_LIBRARY_STATIC_SHOW_STRING ?= ar

# -# Generate dynamic library logs by packaging the links, using formatted display strings #
#  - Note : 
#    -- It takes effect only when MF_CONFIGURE_USING_FORMATTEND_LOG is set to "YES".
#  - Example : 
#    -- ?= LD
#    -- ?= linking
#    -- ?= package
MF_CONFIGURE_FORMATTEND_LOG_LIBRARY_DYNAMIC_SHOW_STRING ?= ld

# -# Generate logs for the link packaging process of the executable program, using formatted display strings #
#  - Note : 
#    -- It takes effect only when MF_CONFIGURE_USING_FORMATTEND_LOG is set to "YES".
#  - Example : 
#    -- ?= LD
#    -- ?= linking
#    -- ?= package
MF_CONFIGURE_FORMATTEND_LOG_EXECUTE_SHOW_STRING ?= ld

#----------------------------
# - Debugging options
#----------------------------
#  - Note : 
#    -- When the value of MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE is C_TYPE, use MF_CONFIGURE_C_DEBUG_OPTIONS; otherwise, use MF_CONFIGURE_CPP_DEBUG_OPTIONS.
#    -- += -g        During the compilation process, debugging information is generated.
#    -- += -gstabs   This option claims debugging information in the stabs format, but does not include gdb debugging information. 
#    -- += -gstabs+  This option claims the debugging information in the stabs format, and also includes additional debugging information that is only for use by gdb.
#    -- += -ggdb     This option will generate as much usable debugging information for gdb as possible.
#    -- += -glevel   Request to generate debugging information, and specify the amount of information required using the "level" parameter. The default level value is 2.
#    -- += ...
#  - Example : 
#    -- += -g
#    -- += -ggdb
MF_CONFIGURE_C_DEBUG_OPTIONS   ?= -g
MF_CONFIGURE_CPP_DEBUG_OPTIONS ?= -g

#----------------------------
# - Error and Alert Options
#----------------------------
#  - Note : 
#    -- When the value of MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE is C_TYPE, use MF_CONFIGURE_C_ERROR_ALERT_OPTIONS; otherwise, use MF_CONFIGURE_CPP_ERROR_ALERT_OPTIONS.
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
#    -- ?= -Wall -Werror -Wfatal-errors -Wunused-function -Wunused-label -Wconversion
#    -- ?= -Wall -Wfatal-errors -Wunused-function -Wunused-label -Wconversion
#    -- ?= -Wall -Werror
#    -- ?= -Wall
MF_CONFIGURE_C_ERROR_ALERT_OPTIONS   ?= -Wall -Wfatal-errors -Wunused-function -Wunused-label -Wconversion
MF_CONFIGURE_CPP_ERROR_ALERT_OPTIONS ?= -Wall -Wfatal-errors -Wunused-function -Wunused-label -Wconversion

#----------------------------
# - Dynamic library export symbols
#----------------------------
#  - Note : 
#    -- When the value of MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE is C_TYPE, use MF_CONFIGURE_C_DYNAMIC_SYMBOLS; otherwise, use MF_CONFIGURE_CPP_DYNAMIC_SYMBOLS.
#    -- It is recommended to disable in the RELEASE version.
#    -- ?= -rdynamic Dynamic library export symbols
#  - Example : 
#    -- ?= -rdynamic
#    -- ?=
MF_CONFIGURE_C_DYNAMIC_SYMBOLS   ?= 
MF_CONFIGURE_CPP_DYNAMIC_SYMBOLS ?= 

#----------------------------
# - Specify the compiler version
#----------------------------
#  - Note : 
#    -- When the value of MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE is C_TYPE, use MF_CONFIGURE_C_COMPILER_VERSION; otherwise, use MF_CONFIGURE_CPP_COMPILER_VERSION.
#    -- ?= -std=c99
#    -- ?= -std=c++11
#  - Example : 
#    -- ?= -std=c99
#    -- ?= -std=c++11
#    -- ?=

MF_CONFIGURE_C_COMPILER_VERSION   ?= 
MF_CONFIGURE_CPP_COMPILER_VERSION ?= 

#----------------------------
# - Compiler optimization level
#----------------------------
#  - Note : 
#    -- When the value of MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE is C_TYPE, use MF_CONFIGURE_C_OPTIMIZATION_LEVEL; otherwise, use MF_CONFIGURE_CPP_OPTIMIZATION_LEVEL.
#    -- ?= -O0 No optimization, retains complete debugging information, code execution is the slowest, suitable for development and debugging phases.
#    -- ?= -O1 Basic optimization, slightly improves performance, does not affect debugging, suitable for debugging versions with low performance requirements.
#    -- ?= -O2 Medium optimization, fully enables security optimizations, significantly improves performance, compile time is controllable, default choice for release versions.
#    -- ?= -O3 Highly optimized, may increase code size and compilation time, occasionally has compatibility issues, code execution speed is fast, suitable for specific scenarios such as high-performance computing.
#  - Example : 
#    -- ?= -O2
#    -- ?= -O1
#    -- ?= -O0
MF_CONFIGURE_C_OPTIMIZATION_LEVEL   ?= 
MF_CONFIGURE_CPP_OPTIMIZATION_LEVEL ?= 

#----------------------------
# - Other flags options
#----------------------------
#  - Note : 
#    -- When the value of MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE is C_TYPE, use MF_CONFIGURE_C_FLAGS; otherwise, use MF_CONFIGURE_CPP_FLAGS.
#    -- ?= 
#  - Example : 
#    -- ?= -fsanitize=address -fno-omit-frame-pointer -fsanitize-recover=address
MF_CONFIGURE_C_FLAGS   ?= 
MF_CONFIGURE_CPP_FLAGS ?= 

#----------------------------
# - Linker flag options
#----------------------------
#  - Note : 
#    -- When the value of MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE is C_TYPE, use MF_CONFIGURE_C_LD_FLAGS; otherwise, use MF_CONFIGURE_CPP_LD_FLAGS.
#    -- ?= 
#  - Example : 
#    -- ?= -fsanitize=address -fno-omit-frame-pointer -fsanitize-recover=address
MF_CONFIGURE_C_LD_FLAGS   ?= 
MF_CONFIGURE_CPP_LD_FLAGS ?= 

#----------------------------
# - Compilation options that are applied to generate the .o file
#----------------------------
#  - Note : 
#    -- When the value of MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE is C_TYPE, use MF_CONFIGURE_C_OBJECTS_FLAGS; otherwise, use MF_CONFIGURE_CPP_OBJECTS_FLAGS.
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
MF_CONFIGURE_WINDOWS_TOOLS ?= ./tools/windows_tools/usr/bin/

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
