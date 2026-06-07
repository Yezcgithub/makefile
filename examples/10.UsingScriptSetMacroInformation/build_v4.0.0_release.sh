#!/bin/bash
#============================
# -Project Information
#============================
# @file build.sh
# @General makefile file
# @Coding format UTF-8
# @Description : A cross-platform Makefile for enterprise and general development
# This Makefile is suitable for small, medium, and large projects

#============================
# -License
#============================
# https://mit-license.org/
# The MIT License (MIT)
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

#----------------------------
# - Script-Related Configuration
#----------------------------
# -# Only script compilation method #
#  When using the script for compilation, it is recommended to set it in the makefile file MF_CONFIGURE_ONLY_STARTED_BY_SCRIPT ?= NO
#  Parameter="build.sh"
export MF_CONFIGURE_ONLY_STARTED_BY_SCRIPT="build.sh"

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
export MF_CONFIGURE_ADD_USER_DEFINE="_RELEASE \
                                      _PROJECT_NAME=\\\"Makefile_release\\\" \
                                      _VERSION_NUMBER=\\\"4.0.0\\\" \
                                      _PROJECT_DESCRIPTION=\\\"This_is_a_sample_project.\\\" \
                                      _NUM=400 \
                                      _PRINT_HELLO_WORLD=4"


#----------------------------
# - Log configuration
#----------------------------
# -# The compilation process console log is displayed in a formatted manner #
#  - Parameter = [YES] Using formatted display, which can print the currently compiling file name in a neatly formatted manner.
#  - Parameter = [NO]  Print compilation logs.
export MF_CONFIGURE_USING_FORMATTEND_LOG="NO"

#----------------------------
# -command program path make_build_flag
#----------------------------
# Set the "make" parameter flag. If there are multiple ones, separate them with spaces.
make_flag="-j4"

# The "make" command program can specify the location.
# By default, it uses the "make" command from the system environment variables.
make_exec="make"

# command line argument processing
case "$1" in
    all)
        $make_exec infoprint $make_flag
        $make_exec all $make_flag
        ;;
    rebuild_all)
        $make_exec infoprint $make_flag
        $make_exec clean
        $make_exec all $make_flag
        ;;
    start_main)
        $make_exec infoprint $make_flag
        $make_exec start_main $make_flag
        ;;
    build)
        $make_exec infoprint $make_flag
        $make_exec build $make_flag
        ;;
    rebuild)
        $make_exec infoprint $make_flag
        $make_exec clean
        $make_exec build $make_flag
        ;;
    clean)
        $make_exec clean
        ;;
    preprocess)
        $make_exec preprocess $make_flag
        ;;
    assemble)
        $make_exec assemble $make_flag
        ;;
    object)
        $make_exec object $make_flag
        ;;
    version)
        $make_exec version
        ;;
    infoprint)
        $make_exec infoprint
        ;;
    help)
        $make_exec help
        ;;
    *)
        $make_exec infoprint $make_flag
        $make_exec $make_flag
        ;;
esac

exit 0
