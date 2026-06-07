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
:: - Configure user macro information
::----------------------------
:: -:: Add user macro definitions ::
::  - Note : 
::    -- You can use macros in your application.
::    -- = __YE         Equivalent to C language ::define __YE
::    -- = __YE=1       Equivalent to C language ::define __YE 1
::    -- __YE=\"hello\" Equivalent to C language ::define __YE "hello"
::  - Example : 
::    -- ?= __YE __CC __VERSION=\"1.0.0\"
::    -- += __YECC=\"hello\"
::    -- += __YECC_NUM=1
::    -- += APP_VERSION=\"1.0.0\"

set "CONFIGURE_ADD_USER_MACROS=_DEBUG"
set "CONFIGURE_ADD_USER_MACROS=%CONFIGURE_ADD_USER_MACROS% _PROJECT_NAME=\"Makefile_debug\""
set "CONFIGURE_ADD_USER_MACROS=%CONFIGURE_ADD_USER_MACROS% _VERSION_NUMBER=\"2.0.0\""
set "CONFIGURE_ADD_USER_MACROS=%CONFIGURE_ADD_USER_MACROS% _PROJECT_DESCRIPTION=\"This_is_a_sample_project.\""
set "CONFIGURE_ADD_USER_MACROS=%CONFIGURE_ADD_USER_MACROS% _NUM=200"
set "CONFIGURE_ADD_USER_MACROS=%CONFIGURE_ADD_USER_MACROS% _PRINT_HELLO_WORLD=2"

set "MF_CONFIGURE_ADD_USER_DEFINE=%CONFIGURE_ADD_USER_MACROS%"

::----------------------------
:: - Log configuration
::----------------------------
:: -:: The compilation process console log is displayed in a formatted manner ::
::  - Parameter = [YES] Using formatted display, which can print the currently compiling file name in a neatly formatted manner.
::  - Parameter = [NO]  Print compilation logs.
set "MF_CONFIGURE_USING_FORMATTEND_LOG=NO"

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
