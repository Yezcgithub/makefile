# UsingMultipleSubMakefileAndScriptConfiguration

## * Explanation :

Using multiple sub-Makefiles and scripts for configuration

File list of sub-Makefiles:
(Stored in the ./tools/sub_makefile/ directory of the project.)
```sh
Makefile
  -- add_header.mk
  -- add_source.mk
  -- add_library.mk
```

File list of script:
(Stored in the ./tools/script/ directory of the project.)
```sh
  -- build.sh
  -- build.bat
```

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

## * sub-Makefiles Configuration :

### Explanation
```sh
add_header.mk     - Add header file information
add_source.mk     - Add information about source files and header files
add_library.mk    - Add library file and header file information
```
### Configuration

```sh
Makefile
  -- comm                - (add_source.mk)
  -- inc                 - (add_header.mk)
  -- src                 - (add_source.mk)
    -- comparison        - (add_source.mk)
    -- is                - (add_source.mk)
    -- kg_to_pounds      - (add_source.mk)
    -- meters_to_feet    - (add_source.mk)
    -- printc            - (add_source.mk)
```

## Script Configuration :

build.sh Configuration
```sh
#----------------------------
# - Configure the sub-makefile file (.mk)
#----------------------------
#  # The configuration requires the use of sub-makefile files (.mk) for multi-file management #
#    When developing large-scale projects, it is recommended to use this option. For smaller projects, it is not necessary to use it.
#  - Parameter = [YES]  Use, In the project, a top-level makefile file and the .mk files in each subfolder are used together for management.
#  - Parameter = [NO]   Do not use, In the project, only one top-level makefile file is used for management (by default).
export MF_CONFIGURE_USING_SUB_MAKEFILE="YES"

# -# The configuration requires adding the path of the sub-makefile file (including all the subfolders under that path) #
#  - Note : 
#    -- It only takes effect when MF_CONFIGURE_USING_SUB_MAKEFILE is set to YES.
#    -- Add multiple paths, separated by spaces.
#    -- It will automatically add all the subfolders under this path, without the need to repeatedly add subfolders.
#  - Example : 
#    -- ?= ./src ../timer
#    -- += ./test
export MF_CONFIGURE_ADD_SUB_MAKEFILE_PATHS_AND_SUBPATHS="./src ./comm ./inc"

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
export MF_CONFIGURE_ADD_SOURCE_CODE_PATHS_AND_SUBPATHS=""

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
export MF_CONFIGURE_WINDOWS_TOOLS="./../../tools/windows_tools/usr/bin/"
```

build.bat Configuration
```bat
::----------------------------
:: - Configure the sub-makefile file (.mk)
::----------------------------
::  :: The configuration requires the use of sub-makefile files (.mk) for multi-file management ::
::    When developing large-scale projects, it is recommended to use this option. For smaller projects, it is not necessary to use it.
::  - Parameter = [YES]  Use, In the project, a top-level makefile file and the .mk files in each subfolder are used together for management.
::  - Parameter = [NO]   Do not use, In the project, only one top-level makefile file is used for management (by default).
set "MF_CONFIGURE_USING_SUB_MAKEFILE=YES"

:: -:: The configuration requires adding the path of the sub-makefile file (including all the subfolders under that path) ::
::  - Note : 
::    -- It only takes effect when MF_CONFIGURE_USING_SUB_MAKEFILE is set to YES.
::    -- Add multiple paths, separated by spaces.
::    -- It will automatically add all the subfolders under this path, without the need to repeatedly add subfolders.
::  - Example : 
::    -- ?= ./src ../timer
::    -- += ./test
set "MF_CONFIGURE_ADD_SUB_MAKEFILE_PATHS_AND_SUBPATHS=./src ./comm ./inc"

::----------------------------
:: - Configure add source code information
::----------------------------
:: -:: The path where the source files that need to be compiled are located (including all subfolders within this path) ::
::  - Note : 
::    -- Add multiple paths, separated by spaces.
::    -- This option will automatically include all the subfolders under the directory, eliminating the need to repeatedly add subfolders.
::    -- It is not recommended to use this option in large projects. It will search through all subfolders, and when there are too many subfolders, it may affect the compilation efficiency. In large projects, the MF_CONFIGURE_ADD_SOURCE_CODE_PATHS option is recommended.
::    -- Default to being empty.
::  - Example : 
::    -- ?= ./src ../timer
::    -- += ./testd
set "MF_CONFIGURE_ADD_SOURCE_CODE_PATHS_AND_SUBPATHS="

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
set "MF_CONFIGURE_WINDOWS_TOOLS=./../../tools/windows_tools/usr/bin/"
```

## * Execution steps : 

linux: 
```bash
build.sh
```
windows: 
```bash
build.bat
```

# The MIT License (MIT)

\# https://mit-license.org/

Copyright © 2025 <Yezc/Makefile>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
