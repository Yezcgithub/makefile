@echo off
::============================
:: -Project Information
::============================
:: @file build.bat
:: @General makefile file
:: @Coding format UTF-8
:: @Description : A cross-platform Makefile for enterprise and general development
:: This Makefile is suitable for small, medium, and large projects

::============================
:: -License
::============================
:: https://mit-license.org/
:: The MIT License (MIT)
:: Copyright © 2025 <Yezc/Makefile>
:: Permission is hereby granted, free of charge, to any person obtaining a copy of this software 
:: and associated documentation files (the “Software”), to deal in the Software without restriction, 
:: including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
:: and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
:: subject to the following conditions:

:: The above copyright notice and this permission notice shall be included in all copies or 
:: substantial portions of the Software.

:: THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING 
:: BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND 
:: NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
:: DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
:: OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

::----------------------------
:: - Script-Related Configuration
::----------------------------
:: -:: Only script compilation method ::
::  When using the script for compilation, it is recommended to set it in the makefile file MF_CONFIGURE_ONLY_STARTED_BY_SCRIPT ?= NO
::  Parameter="build.bat"
set "MF_CONFIGURE_ONLY_STARTED_BY_SCRIPT=build.bat"

::----------------------------
:: - Configure output target file information
::----------------------------
:: -:: Set the name of the target file ::
::  - Note : 
::    -- This option cannot be left blank.
::    -- The name cannot be the same as that of an existing pseudo-target instruction.
::  - Example : 
::    -- ?= main
::    -- ?= test
set "MF_CONFIGURE_TARGET_FILE_NAME=demo"

:: -:: Output type of the compiled target file ::
::  - Parameter = [RELEASE] Delete the symbol table in the executable file. The symbol table does not affect the program's operation, and it can reduce the size of the program.
::  - Parameter = [DEBUG]   Keep the symbol table in the executable file. When using gdb for debugging, set it to NO.
::  - Parameter = [RELEASE_AND_DEBUG] Keep the RELEASE and DEBUG files.
set "MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG=DEBUG"

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
set "MF_CONFIGURE_ADD_SOURCE_CODE_PATHS_AND_SUBPATHS=./src ./main"

::----------------------------
:: - Configure header files information
::----------------------------
:: -:: Add header file paths ::
::  - Note : 
::    -- The area specified by the variable MF_CONFIGURE_HEADER_FILE_PATH_INCLUDE_RANGE needs to be examined.
::    -- Add multiple paths, separated by spaces.
::    -- This option will only take effect for the currently added directory.
::    -- Default to being empty.
::  - Example : 
::    -- ?= .
::    -- ?= ../src/inc ./lib ./lib/test/inc
::    -- += ../lib/inc
set "MF_CONFIGURE_ADD_HEADER_FILE_PATHS=./inc"

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
set "MF_CONFIGURE_WINDOWS_TOOLS=../../tools/windows_tools/usr/bin/"

:: =============================================
:: -command
:: =============================================
:: Set the "make" parameter flag. If there are multiple ones, separate them with spaces.
set "make_flag=-j4"

::The "make" command program can specify the location.
:: By default, it uses the "make" command from the system environment variables.
set "make_exec=make"

:: -command line argument processing
if "%1"=="" (
    %make_exec% infoprint %make_flag%
    %make_exec% %make_flag%
    goto :eof
)
set "arg=%~1"
if /i "%arg%"=="all" (
    %make_exec% infoprint %make_flag%
    %make_exec% all %make_flag%
) else if /i "%arg%"=="rebuild_all" (
    %make_exec% infoprint %make_flag%
    %make_exec% clean
    %make_exec% all %make_flag%
) else if /i "%arg%"=="start_main" (
    %make_exec% infoprint %make_flag%
    %make_exec% start_main %make_flag%
) else if /i "%arg%"=="build" (
    %make_exec% infoprint %make_flag%
    %make_exec% build %make_flag%
) else if /i "%arg%"=="rebuild" (
    %make_exec% infoprint %make_flag%
    %make_exec% clean
    %make_exec% build %make_flag%
)  else if /i "%arg%"=="clean" (
    %make_exec% clean
) else if /i "%arg%"=="preprocess" (
    %make_exec% preprocess %make_flag%
) else if /i "%arg%"=="assemble" (
    %make_exec% assemble %make_flag%
) else if /i "%arg%"=="object" (
    %make_exec% object %make_flag%
) else if /i "%arg%"=="version" (
    %make_exec% version
) else if /i "%arg%"=="infoprint" (
    %make_exec% infoprint
) else if /i "%arg%"=="help" (
    %make_exec% help
) else (
    %make_exec% infoprint %make_flag%
    %make_exec% %make_flag%
    exit /b 1
)

exit /b 0
