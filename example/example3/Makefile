#============================
# -Project Information
#============================
# @file Makefile
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

#============================
# -Makeflie Configuration
#============================
#----------------------------
# -Configuration files and paths
#----------------------------
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

#----------------------------
# -Compilation configuration
#----------------------------
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

#----------------------------
# -Debugging options
#----------------------------
#  += -g        During compilation, generate debugging information
#  += -gstabs   This option claims debugging information in stabs format, but does not include gdb debugging information.
#  += -gstabs+  This option claims debugging information in stabs format and includes additional debugging information specifically for gdb.
#  += -ggdb     This option will generate as much gdb-compatible debugging information as possible.
#  += -glevel   Request to generate debugging information, and specify the level of information needed using the 'level' parameter. The default level value is 2.
MF_CONFIGURE_C_FLAGS      += -g
MF_CONFIGURE_CPP_FLAGS    += -g

#----------------------------
# -Error and Alert Options
#----------------------------
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
MF_CONFIGURE_C_FLAGS      += -Wall -Werror -Wfatal-errors -Wunused-function -Wunused-label -Wconversion
MF_CONFIGURE_CPP_FLAGS    += -Wall -Werror -Wfatal-errors -Wunused-function -Wunused-label -Wconversion

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
MF_CONFIGURE_CPP_FLAGS    +=  -std=c++11

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
MF_CONFIGURE_BUSYBOX_TOOLS         ?= "../../tools/windows_tools/busybox"

# Configuration completed
# - The following code will be executed based on the configuration settings
# - In most cases, it is recommended not to modify the following code

#============================
# -Version Information
#============================
MF_VERSION      := 1
MF_PATCHLEVEL   := 0
MF_SUBLEVEL     := 10
MF_EXTRAVERSION := 0
MF_NAME         := "Universal Makefile"

#============================
# -Cross-platform
#============================

# -# - Based on parameter matching for platform selection
#  windows ：?= WINDOWS or ?= Windows_NT
#  linux   ：?= LINUX   or ?=
ifeq ($(firstword $(MF_CONFIGURE_PLATFORM_OS)), Windows_NT)
	MF_PLATFORM_OS := WINDOWS
else
ifeq ($(firstword $(MF_CONFIGURE_PLATFORM_OS)), WINDOWS)
	MF_PLATFORM_OS := WINDOWS
else
	MF_PLATFORM_OS := LINUX
endif
endif

#----------------------------
# -Platform-related information
#----------------------------
ifeq ($(MF_PLATFORM_OS), WINDOWS)
	# Target file extension
	#----------------------------
	MF_PLATFORM_TARGET_EXECUTE_SUFFIX     := .exe
	MF_PLATFORM_TARGET_LIB_STATIC_SUFFIX  := .lib
	MF_PLATFORM_TARGET_LIB_DYNAMIC_SUFFIX := .dll

	# Check if the path of the busybox tool has been defined
ifndef MF_CONFIGURE_BUSYBOX_TOOLS
    $(error -> Note: The busybox tool is not defined!)
endif
	# In the makefile, the used tools are utilized. The busybox stores the paths of the tools.
	MF_PLATFORM_USING_TOOLS_RM            := $(firstword $(MF_CONFIGURE_BUSYBOX_TOOLS)) rm -rf
	MF_PLATFORM_USING_TOOLS_MKDIR         := $(firstword $(MF_CONFIGURE_BUSYBOX_TOOLS)) mkdir -p
	MF_PLATFORM_USING_TOOLS_CP            := $(firstword $(MF_CONFIGURE_BUSYBOX_TOOLS)) cp -p
	MF_PLATFORM_USING_TOOLS_FIND          := $(firstword $(MF_CONFIGURE_BUSYBOX_TOOLS)) find
	MF_PLATFORM_USING_TOOLS_ECHO          := $(firstword $(MF_CONFIGURE_BUSYBOX_TOOLS)) echo
else
	# Target file extension
	#----------------------------
	MF_PLATFORM_TARGET_EXECUTE_SUFFIX     := 
	MF_PLATFORM_TARGET_LIB_STATIC_SUFFIX  := .a
	MF_PLATFORM_TARGET_LIB_DYNAMIC_SUFFIX := .so

	# Using the tools that are utilized in the makefile
	#----------------------------
	MF_PLATFORM_USING_TOOLS_RM            := "rm" -rf
	MF_PLATFORM_USING_TOOLS_MKDIR         := "mkdir" -p
	MF_PLATFORM_USING_TOOLS_CP            := "cp" -p
	MF_PLATFORM_USING_TOOLS_FIND          := "find"
	MF_PLATFORM_USING_TOOLS_ECHO          := "echo"
endif

#============================
# -Function
#============================
#----------------------------
# - Recursively search for all subdirectories within the specified directory
#   Parameter $1: The root directory path to be searched
#----------------------------
ifeq ($(MF_PLATFORM_OS), WINDOWS)
define function_find_subdirectories
	$(shell $(MF_PLATFORM_USING_TOOLS_FIND) $(1) -type d)
endef
else
define function_find_subdirectories
	$(shell $(MF_PLATFORM_USING_TOOLS_FIND) $(1) -type d)
endef
endif

#----------------------------
# -Function for cleaning intermediate files
#----------------------------
define function_clean_intermediate_file
	@$(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_C_OBJECTS)
	@$(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_C_DEPENDENTS)
	@$(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_CPP_OBJECTS)
	@$(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_CPP_DEPENDENTS)
	@$(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_PREPROCESSED)
	@$(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_ASSEMBLY)
endef

#----------------------------
# -Function for cleaning target files
#----------------------------
define function_clean_target_file
	@$(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_TARGET_EXECUTE)
	@$(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_TARGET_LIB_STATIC)
	@$(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_TARGET_LIB_DYNAMIC)

	@$(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_TARGET_EXECUTE_DEBUG)
	@$(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_TARGET_LIB_STATIC_DEBUG)
	@$(MF_PLATFORM_USING_TOOLS_RM) $(MF_PARAM_TARGET_LIB_DYNAMIC_DEBUG)
endef

#============================
# -Parameter verification
#============================
# Check if the variable is defined

# Verify the name of the target file
ifeq ($(strip $(MF_CONFIGURE_TARGET_FILE_NAME)),)
	$(error -> Note: The target file name cannot be empty!)
endif
#----------------------------
# -Use tools for verification
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

# Verification of the output directory of the target file
MF_VERIFY_TARGET_FILE_OUTPUT_PATH       := $(if $(strip $(MF_CONFIGURE_TARGET_FILE_OUTPUT_PATH)), $(firstword $(MF_CONFIGURE_TARGET_FILE_OUTPUT_PATH)), .)
# Verification of the intermediate file output directory
MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH := $(if $(strip $(MF_CONFIGURE_INTERMEDIATE_FILE_OUTPUT_PATH)), $(firstword $(MF_CONFIGURE_INTERMEDIATE_FILE_OUTPUT_PATH)), .)

# Verification of the root directory for compiling source code
MF_VERIFY_SOURCE_CODE_DIRECTORYS        := $(if $(strip $(MF_CONFIGURE_SOURCE_CODE_DIRECTORYS)), $(MF_CONFIGURE_SOURCE_CODE_DIRECTORYS), .)

# Make sure the output directory exists
$($(MF_PLATFORM_USING_TOOLS_MKDIR) $(MF_VERIFY_TARGET_FILE_OUTPUT_PATH))
$($(MF_PLATFORM_USING_TOOLS_MKDIR) $(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH))

#============================
# -Compilation tool
#============================
# Make variables (CC, etc...)
# -as gcc is used to output assembly files, and the resulting object files are linked by the linker ld.
MF_COMPILE_TOOL_AS                := $(MF_CONFIGURE_COMPILE_PATH_PREFIX)as
# -ld Linking combines all the.o files to generate an executable file, not a pure binary file.
MF_COMPILE_TOOL_LD                := $(MF_CONFIGURE_COMPILE_PATH_PREFIX)ld
# -gcc C compiler command
MF_COMPILE_TOOL_CC                := $(MF_CONFIGURE_COMPILE_PATH_PREFIX)gcc
# -g++ C++ compilation command
MF_COMPILE_TOOL_CPP               := $(MF_CONFIGURE_COMPILE_PATH_PREFIX)g++ #$(GCC_TOOL_CC) -E
# -ar Package, extract and archive the files
MF_COMPILE_TOOL_AR                := $(MF_CONFIGURE_COMPILE_PATH_PREFIX)ar
# -nm View the symbol table of the executable file
MF_COMPILE_TOOL_NM                := $(MF_CONFIGURE_COMPILE_PATH_PREFIX)nm
# -strip Compression file command, deleting symbol tables in executable files
MF_COMPILE_TOOL_STRIP             := $(MF_CONFIGURE_COMPILE_PATH_PREFIX)strip
# -objcopy Generate a binary file (.bin) from the.elf file.
MF_COMPILE_TOOL_OBJCOPY           := $(MF_CONFIGURE_COMPILE_PATH_PREFIX)objcopy
# -objdump Disassemble the.elf file to generate a disassembly file (.dis)
MF_COMPILE_TOOL_OBJDUMP           := $(MF_CONFIGURE_COMPILE_PATH_PREFIX)objdump
# -size List the size of each section of the target file as well as the total size.
MF_COMPILE_TOOL_SIZE              := $(MF_CONFIGURE_COMPILE_PATH_PREFIX)size

#============================
# -Obtain information about the files in the specified source code directory
#============================
# -Find the directory information (subfolders) of all the files in the source code directory path
MF_SOURCES_ALL_DIRECTORY_PATHS    := $(call function_find_subdirectories, $(MF_VERIFY_SOURCE_CODE_DIRECTORYS))
# -Locate the directory information (subfolders) that need to be excluded in the source code directory path
MF_SOURCES_EXCLUDED_DIRECTORYS    := $(if $(strip $(MF_CONFIGURE_EXCLUDED_DIRECTORYS_RECURSION)), $(call function_find_subdirectories, $(MF_CONFIGURE_EXCLUDED_DIRECTORYS_RECURSION)),)
# -Exclude the specified directory from the source code directory path
MF_SOURCES_DIRECTORY_PATHS        := $(filter-out $(MF_CONFIGURE_EXCLUDED_DIRECTORYS) $(MF_SOURCES_EXCLUDED_DIRECTORYS), $(MF_SOURCES_ALL_DIRECTORY_PATHS))

# -Add all the header file folders in the source code directory -l(-I)
MF_SOURCES_HEADER_FILE_PATHS      := $(addprefix -I, $(MF_SOURCES_DIRECTORY_PATHS))
# -Header file directory: Except for the specified source code directory and its subdirectories, it is necessary to manually add it to the variable MF_CONFIGURE_OTHER_INCLUDE_PATHS.
MF_SOURCES_ALL_HEADER_FILE_PATHS  := $(MF_SOURCES_HEADER_FILE_PATHS) $(addprefix -I, $(basename $(MF_CONFIGURE_OTHER_INCLUDE_PATHS)))

# -The C source files (.c) found in the source code directory path
MF_SOURCES_C_ALL_FILES            := $(foreach dir, $(MF_SOURCES_DIRECTORY_PATHS), $(wildcard $(dir)/*.c))
MF_SOURCES_C_FILES                := $(filter-out $(MF_CONFIGURE_EXCLUDED_FILES), $(MF_SOURCES_C_ALL_FILES))
MF_SOURCES_C_OBJECTS_FILES_TMP    := $(patsubst %.c, $(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH)/%.o, $(MF_SOURCES_C_FILES))
MF_SOURCES_C_OBJECTS_FILES        := $(subst //,/,$(subst /./,/,$(MF_SOURCES_C_OBJECTS_FILES_TMP)))
MF_SOURCES_C_DEPENDENT_FILES      := $(MF_SOURCES_C_OBJECTS_FILES:.o=.d)
MF_SOURCES_C_PREPROCESSED_FILES   := $(MF_SOURCES_C_OBJECTS_FILES:.o=.i)
MF_SOURCES_C_ASSEMBLY_FILES       := $(MF_SOURCES_C_OBJECTS_FILES:.o=.s)
MF_SOURCES_C_FILES_DIRECTORY      := $(dir $(MF_SOURCES_C_FILES))
MF_SOURCES_C_OBJECTS_DIRECTORY    := $(dir $(MF_SOURCES_C_OBJECTS_FILES))

# -The C++ source files (.cpp) found in the source code directory path
MF_SOURCES_CPP_ALL_FILES          := $(foreach dir, $(MF_SOURCES_DIRECTORY_PATHS), $(wildcard $(dir)/*.cpp))
MF_SOURCES_CPP_FILES              := $(filter-out $(MF_CONFIGURE_EXCLUDED_FILES), $(MF_SOURCES_CPP_ALL_FILES))
MF_SOURCES_CPP_OBJECTS_FILES_TMP  := $(patsubst %.cpp, $(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH)/%.o, $(MF_SOURCES_CPP_FILES))
MF_SOURCES_CPP_OBJECTS_FILES      := $(subst //,/,$(subst /./,/,$(MF_SOURCES_CPP_OBJECTS_FILES_TMP)))
MF_SOURCES_CPP_DEPENDENT_FILES    := $(MF_SOURCES_CPP_OBJECTS_FILES:.o=.d)
MF_SOURCES_CPP_PREPROCESSED_FILES := $(MF_SOURCES_CPP_OBJECTS_FILES:.o=.ii)
MF_SOURCES_CPP_ASSEMBLY_FILES     := $(MF_SOURCES_CPP_OBJECTS_FILES:.o=.s)
MF_SOURCES_CPP_FILES_DIRECTORY    := $(dir $(MF_SOURCES_CPP_FILES))
MF_SOURCES_CPP_OBJECTS_DIRECTORY  := $(dir $(MF_SOURCES_CPP_OBJECTS_FILES))

#============================
# -Add files, parameters
#============================
#----------------------------
# -C file information
#----------------------------
MF_PARAM_C_SOURCES                := $(MF_SOURCES_C_FILES)
MF_PARAM_C_OBJECTS                := $(MF_SOURCES_C_OBJECTS_FILES)
MF_PARAM_C_DEPENDENTS             := $(MF_SOURCES_C_DEPENDENT_FILES)

#----------------------------
# -C++ file information
#----------------------------
MF_PARAM_CPP_SOURCES              := $(MF_SOURCES_CPP_FILES)
MF_PARAM_CPP_OBJECTS              := $(MF_SOURCES_CPP_OBJECTS_FILES)
MF_PARAM_CPP_DEPENDENTS           := $(MF_SOURCES_CPP_DEPENDENT_FILES)

#----------------------------
# -Debugging file information
#----------------------------
MF_PARAM_PREPROCESSED             := $(MF_SOURCES_C_PREPROCESSED_FILES) $(MF_SOURCES_CPP_PREPROCESSED_FILES)
MF_PARAM_ASSEMBLY                 := $(MF_SOURCES_C_ASSEMBLY_FILES) $(MF_SOURCES_CPP_ASSEMBLY_FILES)

#----------------------------
# -Add the macro (-D xxx) prefix
#----------------------------
MF_PARAM_DEFINE_FLAGS             := $(if $(strip $(MF_CONFIGURE_ADD_USER_DEFINE)), $(addprefix -D, $(basename $(MF_CONFIGURE_ADD_USER_DEFINE))),)

#----------------------------
# -Add the C/C++ flag
#----------------------------
MF_PARAM_C_FLAGS                  := $(MF_CONFIGURE_C_FLAGS) $(MF_SOURCES_ALL_HEADER_FILE_PATHS) $(MF_PARAM_DEFINE_FLAGS)
MF_PARAM_CPP_FLAGS                := $(MF_CONFIGURE_CPP_FLAGS) $(MF_SOURCES_ALL_HEADER_FILE_PATHS) $(MF_PARAM_DEFINE_FLAGS)
#----------------------------
# -The third-party libraries used in the program need to be added during the compilation process.
#----------------------------
MF_PARAM_USING_LIBRARY_FLAGS      := $(MF_CONFIGURE_USING_STD_LIBRARY_FLAGS) $(MF_CONFIGURE_USING_LIBRARY_FLAGS)

#----------------------------
# -Redefine the name
#----------------------------
MF_PARAM_TARGET_EXECUTE           := $(MF_VERIFY_TARGET_FILE_OUTPUT_PATH)/$(MF_CONFIGURE_TARGET_FILE_NAME)$(MF_PLATFORM_TARGET_EXECUTE_SUFFIX)
MF_PARAM_TARGET_LIB_STATIC        := $(MF_VERIFY_TARGET_FILE_OUTPUT_PATH)/lib$(MF_CONFIGURE_TARGET_FILE_NAME)$(MF_PLATFORM_TARGET_LIB_STATIC_SUFFIX)
MF_PARAM_TARGET_LIB_DYNAMIC       := $(MF_VERIFY_TARGET_FILE_OUTPUT_PATH)/lib$(MF_CONFIGURE_TARGET_FILE_NAME)$(MF_PLATFORM_TARGET_LIB_DYNAMIC_SUFFIX)
# This is merely used to set the target name.
MF_PARAM_TARGET_LIB_STATICDYNAMIC := $(MF_VERIFY_TARGET_FILE_OUTPUT_PATH)/lib$(MF_CONFIGURE_TARGET_FILE_NAME)_a_so

# debug target, (MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG = RELEASE_AND_DEBUG)
MF_PARAM_TARGET_EXECUTE_DEBUG     := $(MF_VERIFY_TARGET_FILE_OUTPUT_PATH)/$(MF_CONFIGURE_TARGET_FILE_NAME)_debug$(MF_PLATFORM_TARGET_EXECUTE_SUFFIX)
MF_PARAM_TARGET_LIB_STATIC_DEBUG  := $(MF_VERIFY_TARGET_FILE_OUTPUT_PATH)/lib$(MF_CONFIGURE_TARGET_FILE_NAME)_debug$(MF_PLATFORM_TARGET_LIB_STATIC_SUFFIX)
MF_PARAM_TARGET_LIB_DYNAMIC_DEBUG := $(MF_VERIFY_TARGET_FILE_OUTPUT_PATH)/lib$(MF_CONFIGURE_TARGET_FILE_NAME)_debug$(MF_PLATFORM_TARGET_LIB_DYNAMIC_SUFFIX)

MF_PARAM_TARGET                    = $(MF_PARAM_TARGET_EXECUTE)

#----------------------------
# -Whether to use static compilation
#----------------------------
ifeq ($(MF_CONFIGURE_USING_STATIC_COMPILATION), YES)
	MF_PARAM_USING_STATIC_COMPILATION := -static
else
	MF_PARAM_USING_STATIC_COMPILATION :=
endif

#----------------------------
# -Compile the original file type
#----------------------------
ifeq ($(MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE), C_TYPE)
	MF_PARAM_COMPILE_TOOL_CC := $(MF_COMPILE_TOOL_CC)
	MF_PARAM_CC_OBJECTS      := $(MF_PARAM_C_OBJECTS)
else
	MF_PARAM_COMPILE_TOOL_CC := $(MF_COMPILE_TOOL_CPP)
	MF_PARAM_CC_OBJECTS      := $(MF_PARAM_C_OBJECTS) $(MF_PARAM_CPP_OBJECTS)
endif

#----------------------------
# -Check if there are any target files
#----------------------------
ifeq ($(strip $(MF_PARAM_CC_OBJECTS)),)
	$(error -> Note: The target file was not found. Please check the source code directory.)
endif

#============================
# -Dependence files
#============================
#----------------------------
# -Generate .i file (from .c file)
#----------------------------
$(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH)/%.i : %.c
	@$(MF_PLATFORM_USING_TOOLS_MKDIR) $(@D)
ifeq ($(MF_CONFIGURE_USING_FORMATTEND_LOG), YES)
	@$(MF_PLATFORM_USING_TOOLS_ECHO) "[PREPROCESS] $< -> $@"
	@$(MF_PARAM_COMPILE_TOOL_CC) -E "$<" -o "$@" $(MF_PARAM_C_FLAGS)
else
	$(MF_PARAM_COMPILE_TOOL_CC) -E "$<" -o "$@" $(MF_PARAM_C_FLAGS)
endif

#----------------------------
# -Generate .s file (from .c file)
#----------------------------
$(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH)/%.s : %.c
	@$(MF_PLATFORM_USING_TOOLS_MKDIR) $(@D)
ifeq ($(MF_CONFIGURE_USING_FORMATTEND_LOG), YES)
	@$(MF_PLATFORM_USING_TOOLS_ECHO) "[ASSEMBLY] $< -> $@"
	@$(MF_PARAM_COMPILE_TOOL_CC) -S "$<" -o "$@" $(MF_PARAM_C_FLAGS)
else
	$(MF_PARAM_COMPILE_TOOL_CC) -S "$<" -o "$@" $(MF_PARAM_C_FLAGS)
endif

#----------------------------
# -Generate .o file (from .c file)
#----------------------------
$(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH)/%.o : %.c
	@$(MF_PLATFORM_USING_TOOLS_MKDIR) $(@D)
ifeq ($(MF_CONFIGURE_USING_FORMATTEND_LOG), YES)
	@$(MF_PLATFORM_USING_TOOLS_ECHO) "[CC] $<"
	@$(MF_PARAM_COMPILE_TOOL_CC) $(MF_CONFIGURE_C_OBJECTS_FLAGS) -c "$<" -o "$@" $(MF_PARAM_C_FLAGS)
else
	$(MF_PARAM_COMPILE_TOOL_CC) $(MF_CONFIGURE_C_OBJECTS_FLAGS) -c "$<" -o "$@" $(MF_PARAM_C_FLAGS)
endif

#----------------------------
# -Generate .ii file (from .cpp file)
#----------------------------
$(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH)/%.ii : %.cpp
	@$(MF_PLATFORM_USING_TOOLS_MKDIR) $(@D)
ifeq ($(MF_CONFIGURE_USING_FORMATTEND_LOG), YES)
	@$(MF_PLATFORM_USING_TOOLS_ECHO) "[PREPROCESS] $< -> $@"
	@$(MF_COMPILE_TOOL_CPP) -E "$<" -o "$@" $(MF_PARAM_CPP_FLAGS)
else
	$(MF_COMPILE_TOOL_CPP) -E "$<" -o "$@" $(MF_PARAM_CPP_FLAGS)
endif

#----------------------------
# -Generate .s file (from .cpp file)
#----------------------------
$(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH)/%.s : %.cpp
	@$(MF_PLATFORM_USING_TOOLS_MKDIR) $(@D)
ifeq ($(MF_CONFIGURE_USING_FORMATTEND_LOG), YES)
	@$(MF_PLATFORM_USING_TOOLS_ECHO) "[ASSEMBLY] $< -> $@"
	@$(MF_COMPILE_TOOL_CPP) -S "$<" -o "$@" $(MF_PARAM_CPP_FLAGS)
else
	$(MF_COMPILE_TOOL_CPP) -S "$<" -o "$@" $(MF_PARAM_CPP_FLAGS)
endif

#----------------------------
# -Generate .o file (from .cpp file)
#----------------------------
$(MF_VERIFY_INTERMEDIATE_FILE_OUTPUT_PATH)/%.o : %.cpp
	@$(MF_PLATFORM_USING_TOOLS_MKDIR) $(@D)
ifeq ($(MF_CONFIGURE_USING_FORMATTEND_LOG), YES)
	@$(MF_PLATFORM_USING_TOOLS_ECHO) "[CPP] $<"
	@$(MF_COMPILE_TOOL_CPP) $(MF_CONFIGURE_CPP_OBJECTS_FLAGS) -c "$<" -o "$@" $(MF_PARAM_CPP_FLAGS)
else
	$(MF_COMPILE_TOOL_CPP) $(MF_CONFIGURE_CPP_OBJECTS_FLAGS) -c "$<" -o "$@" $(MF_PARAM_CPP_FLAGS)
endif

#============================
# -Generate binary file
#============================
#----------------------------
# -Static library construction
#----------------------------
# target file output type begin
ifeq ($(MF_CONFIGURE_OUTPUT_TARGET_FILE_TYPE), LIBRARY_STATIC)
MF_PARAM_TARGET = $(MF_PARAM_TARGET_LIB_STATIC)
$(MF_PARAM_TARGET): $(MF_PARAM_CC_OBJECTS)
# - Parameter rcs
# r[ab][f][u] - Replace existing files in the archived file or add new files
# [c]         - Do not give a warning when it is not necessary to create a library
# [u]         - Only replace files that are newer than the current archived content
	@$(MF_COMPILE_TOOL_AR) rcs $(MF_PARAM_TARGET_LIB_STATIC) $^

# target file output release or debug begin
ifeq ($(MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG), RELEASE)
	$(MF_COMPILE_TOOL_STRIP) $(MF_PARAM_TARGET_LIB_STATIC)
endif
ifeq ($(MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG), RELEASE_AND_DEBUG)
	@$(MF_PLATFORM_USING_TOOLS_CP) $(MF_PARAM_TARGET_LIB_STATIC)  $(MF_PARAM_TARGET_LIB_STATIC_DEBUG)
	@$(MF_COMPILE_TOOL_STRIP) $(MF_PARAM_TARGET_LIB_STATIC)
endif
# target file output release or debug end
	@$(MF_PLATFORM_USING_TOOLS_ECHO) "[AR] $(MF_PARAM_TARGET_LIB_STATIC)"

endif
# target file output type end

#----------------------------
# -Dynamic library construction
#----------------------------
# target file output type begin
ifeq ($(MF_CONFIGURE_OUTPUT_TARGET_FILE_TYPE), LIBRARY_DYNAMIC)
MF_PARAM_TARGET = $(MF_PARAM_TARGET_LIB_DYNAMIC)
$(MF_PARAM_TARGET): $(MF_PARAM_CC_OBJECTS)
	@$(MF_PARAM_COMPILE_TOOL_CC) -shared -fPIC -o $(MF_PARAM_TARGET_LIB_DYNAMIC) $^ $(MF_PARAM_USING_LIBRARY_FLAGS)

# target file output release or debug begin
ifeq ($(MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG), RELEASE)
	@$(MF_COMPILE_TOOL_STRIP) $(MF_PARAM_TARGET_LIB_DYNAMIC)
endif
ifeq ($(MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG), RELEASE_AND_DEBUG)
	@$(MF_PLATFORM_USING_TOOLS_CP) $(MF_PARAM_TARGET_LIB_DYNAMIC) $(MF_PARAM_TARGET_LIB_DYNAMIC_DEBUG)
	@$(MF_COMPILE_TOOL_STRIP) $(MF_PARAM_TARGET_LIB_DYNAMIC)
endif
# target file output release or debug end

	@$(MF_PLATFORM_USING_TOOLS_ECHO) "[LD] $(MF_PARAM_TARGET_LIB_DYNAMIC)"

endif
# target file output type end

#----------------------------
# -Static library and dynamic library construction
#----------------------------
# target file output type begin
ifeq ($(MF_CONFIGURE_OUTPUT_TARGET_FILE_TYPE), LIBRARY_STATIC_AND_DYNAMIC)
MF_PARAM_TARGET = $(MF_PARAM_TARGET_LIB_STATICDYNAMIC)
$(MF_PARAM_TARGET): $(MF_PARAM_CC_OBJECTS)
# - Parameter rcs
# r[ab][f][u] - Replace existing files in the archived file or add new files
# [c]         - Do not give a warning when it is not necessary to create a library
# [u]         - Only replace files that are newer than the current archived content
	@$(MF_COMPILE_TOOL_AR) rcs $(MF_PARAM_TARGET_LIB_STATIC) $^
	@$(MF_PARAM_COMPILE_TOOL_CC) -shared -fPIC -o $(MF_PARAM_TARGET_LIB_DYNAMIC) $^ $(MF_PARAM_USING_LIBRARY_FLAGS)

# target file output release or debug begin
ifeq ($(MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG), RELEASE)
	@$(MF_COMPILE_TOOL_STRIP) $(MF_PARAM_TARGET_LIB_STATIC)
	@$(MF_COMPILE_TOOL_STRIP) $(MF_PARAM_TARGET_LIB_DYNAMIC)
endif
ifeq ($(MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG), RELEASE_AND_DEBUG)
	@$(MF_PLATFORM_USING_TOOLS_CP) $(MF_PARAM_TARGET_LIB_STATIC)  $(MF_PARAM_TARGET_LIB_STATIC_DEBUG)
	@$(MF_PLATFORM_USING_TOOLS_CP) $(MF_PARAM_TARGET_LIB_DYNAMIC) $(MF_PARAM_TARGET_LIB_DYNAMIC_DEBUG)
	@$(MF_COMPILE_TOOL_STRIP) $(MF_PARAM_TARGET_LIB_STATIC)
	@$(MF_COMPILE_TOOL_STRIP) $(MF_PARAM_TARGET_LIB_DYNAMIC)
endif
# target file output release or debug end

	@$(MF_PLATFORM_USING_TOOLS_ECHO) "[AR] $(MF_PARAM_TARGET_LIB_STATIC)"
	@$(MF_PLATFORM_USING_TOOLS_ECHO) "[LD] $(MF_PARAM_TARGET_LIB_DYNAMIC)"
endif
# target file output type end

#----------------------------
# -Executable file construction
#----------------------------
# target file output type begin
ifeq ($(MF_CONFIGURE_OUTPUT_TARGET_FILE_TYPE), EXECUTE)
MF_PARAM_TARGET = $(MF_PARAM_TARGET_EXECUTE)
$(MF_PARAM_TARGET) : $(MF_PARAM_CC_OBJECTS)
	@$(MF_PARAM_COMPILE_TOOL_CC) $(MF_PARAM_USING_STATIC_COMPILATION) -o $@ $^ $(MF_PARAM_USING_LIBRARY_FLAGS)

# target file output release or debug begin
ifeq ($(MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG), RELEASE)
	@$(MF_COMPILE_TOOL_STRIP) $(MF_PARAM_TARGET_EXECUTE)
endif
ifeq ($(MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG), RELEASE_AND_DEBUG)
	@$(MF_PLATFORM_USING_TOOLS_CP) $(MF_PARAM_TARGET_EXECUTE) $(MF_PARAM_TARGET_EXECUTE_DEBUG)
	@$(MF_COMPILE_TOOL_STRIP) $(MF_PARAM_TARGET_EXECUTE)
endif
# target file output release or debug end

	@$(MF_PLATFORM_USING_TOOLS_ECHO) "[LD] $(MF_PARAM_TARGET_EXECUTE)"
endif
# target file output type end

#============================
# -Phony target instruction
#============================
#----------------------------
# -The first pseudo-target instruction, "make" is executed.
#----------------------------
MF_PHONY = start
start : $(MF_PARAM_TARGET)
	@$(MF_PLATFORM_USING_TOOLS_ECHO) "build success!"

ifeq ($(MF_CONFIGURE_DELETING_INTERMEDIATE_FILES), YES)
	$(call function_clean_intermediate_file)
endif

#----------------------------
# -Generate all files
#----------------------------
MF_PHONY += all
all : clean start

#----------------------------
# -Generate preprocessing file
#----------------------------
MF_PHONY += preprocess
preprocess: $(MF_PARAM_PREPROCESSED)

#----------------------------
# -Generate assembly file
#----------------------------
MF_PHONY += assemble
assemble: $(MF_PARAM_ASSEMBLY)

#----------------------------
# -Generate the target file
#----------------------------
MF_PHONY += object
object: $(MF_PARAM_C_OBJECTS) $(MF_PARAM_CPP_OBJECTS)

#----------------------------
# -Print version information
#----------------------------
MF_PHONY += version
version:
	@$(MF_PLATFORM_USING_TOOLS_ECHO) $(MF_NAME)
	@$(MF_PLATFORM_USING_TOOLS_ECHO) "version: $(MF_VERSION).$(MF_PATCHLEVEL).$(MF_SUBLEVEL).$(MF_EXTRAVERSION)"

#----------------------------
# -Delete all intermediate files
#----------------------------
MF_PHONY += clean
clean:
	$(call function_clean_intermediate_file)
	$(call function_clean_target_file)
	@$(MF_PLATFORM_USING_TOOLS_ECHO) "clean success!"

# -Phony command
.PHONY: $(MF_PHONY)
