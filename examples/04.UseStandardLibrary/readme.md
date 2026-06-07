# UseStandardLibrary

## * Explanation :

Use the standard library

## * Configuration :

```makefile
# -# Add the standard library name #
#  - Note : 
#    -- Add the standard library name.
#    -- Add multiple libraries, separated by spaces.
#  - Example : 
#    -- ?= pthread rt m dl
#    -- += dl
#    -- += m
MF_CONFIGURE_ADD_STD_LIBRARY_NAME ?= pthread m
```

```makefile
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
