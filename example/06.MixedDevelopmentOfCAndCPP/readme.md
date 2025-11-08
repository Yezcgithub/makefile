# MixedDevelopmentOfCAndCPP

## * Explanation :

Mixed development using C language and C++ language

## * Configuration :

```makefile
# -# The path where the source files that need to be compiled are located (including all subfolders within this path) #
#  - Note : 
#    -- Add multiple paths, separated by spaces.
#    -- This option will automatically include all the subfolders under the directory, eliminating the need to repeatedly add subfolders.
#    -- It is not recommended to use this option in large projects. It will search through all subfolders, and when there are too many subfolders, it may affect the compilation efficiency. In large projects, the MF_CONFIGURE_ADD_SOURCE_CODE_PATHS option is recommended.
#    -- Default to being empty.
#  - Example : 
#    -- ?= ./src ../timer
#    -- += ./testd
MF_CONFIGURE_ADD_SOURCE_CODE_PATHS_AND_SUBPATHS ?= ./src ./printc
```

```makefile
# -# Compile original file type #
#  - Parameter = [CPP_TYPE] Use C++ compiler to compile C and C++ files.
#  - Parameter = [C_TYPE]   Use C compiler to compile C files only.
MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE ?= CPP_TYPE
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

## * Execution steps : 

make

# The MIT License (MIT)

\# https://mit-license.org/

Copyright © 2025 <Yezc/Makefile>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
