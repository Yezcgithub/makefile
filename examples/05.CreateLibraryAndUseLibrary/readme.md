# CreateLibraryAndUseLibrary

## * Explanation :

Create a library and use the library

## * Configuration :

```makefile
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
MF_CONFIGURE_ADD_HEADER_FILE_PATHS_AND_SUBPATHS ?= ./lib
```

```makefile
# -# Add the path of the library you wrote yourself or a third-party library #
#  - Note : 
#    -- Add multiple paths, separated by spaces.
#    -- This option will only take effect for the currently added directory.
#  - Example : 
#    -- ?= ./lib/timer ./lib ./lib/test
#    -- ?= ./src/lib
#    -- += ../lib
MF_CONFIGURE_ADD_USER_LIBRARY_PATHS ?= ./lib/build
```

```makefile
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
MF_CONFIGURE_ADD_USER_LIBRARY_NAME ?= calculator printall
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


## * Execution steps :

1 The first step : Create the library calculator
    cd ./lib/calculator
    make
2 The second step : Create the library printall
    cd ./lib/printall
    make
3 The third step : Compile the main program
    make

# The MIT License (MIT)

\# https://mit-license.org/

Copyright © 2025 <Yezc/Makefile>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
