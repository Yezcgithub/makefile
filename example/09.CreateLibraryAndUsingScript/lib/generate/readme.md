# generate

## * Explanation :

Compile the generate library

## * Configuration :

```makefile
#----------------------------
# - Script-Related Configuration
#----------------------------
# -# Only script compilation method #
#  - Parameter = [YES]  Can only be compiled by the script, using make will prompt to use the script to execute (the variable MF_CONFIGURE_ONLY_STARTED_BY_SCRIPT must be set to YES in the script).
#  - Parameter = [NO]   Can be compiled directly using make.
MF_CONFIGURE_ONLY_STARTED_BY_SCRIPT ?= YES
```

```makefile
# -# Set the name of the target file #
#  - Note : 
#    -- This option cannot be left blank.
#    -- The name cannot be the same as that of an existing pseudo-target instruction.
#  - Example : 
#    -- ?= main
#    -- ?= test
MF_CONFIGURE_TARGET_FILE_NAME ?= generate
```

```makefile
# -# Output type of the compiled target file #
#  - Parameter = [RELEASE] Delete the symbol table in the executable file. The symbol table does not affect the program's operation, and it can reduce the size of the program.
#  - Parameter = [DEBUG]   Keep the symbol table in the executable file. When using gdb for debugging, set it to NO.
#  - Parameter = [RELEASE_AND_DEBUG] Keep the RELEASE and DEBUG files.
MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG ?= DEBUG
```

```makefile
# -# Compilation output file type #
#  - Parameter = [EXECUTE]                    Generate an executable program.
#  - Parameter = [LIBRARY_DYNAMIC]            Generate (.so) dynamic library file.
#  - Parameter = [LIBRARY_STATIC]             Generate (.a) static library file.
#  - Parameter = [LIBRARY_STATIC_AND_DYNAMIC] Generate (.a and .so) dynamic and static library files.
MF_CONFIGURE_OUTPUT_TARGET_FILE_TYPE ?= LIBRARY_STATIC
```

```makefile
# -# Set the output directory for the target file #
#  - Note : 
#    -- When this option is empty, it is equivalent to ?= .
#    -- When the option is set to "=.", the generated target file will be placed in the folder where the Makefile is located.
#  - Example : 
#    -- ?= ./build
#    -- ?= ./output
#    -- ?= .
MF_CONFIGURE_TARGET_FILE_OUTPUT_PATH ?= ../build
```

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
MF_CONFIGURE_ADD_SOURCE_CODE_PATHS_AND_SUBPATHS ?= .
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
MF_CONFIGURE_WINDOWS_TOOLS ?= ../../../../tools/windows_tools/usr/bin/
```

## * Execution steps :

linux: 
```bash
cd ../..
build.sh build_library
```
windows: 
```bash
cd ../..
build.bat build_library
```

# The MIT License (MIT)

\# https://mit-license.org/

Copyright © 2025 <Yezc/Makefile>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
