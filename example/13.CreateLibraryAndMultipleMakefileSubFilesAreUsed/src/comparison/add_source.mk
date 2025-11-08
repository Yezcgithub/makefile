#============================
# - Project Information
#============================
# @file : add_source.mk
# @General : UTF-8
# @Description : A cross-platform Makefile for enterprise and general development
# This Makefile is suitable for small, medium, and large projects

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

#----------------------------
# - Configure to add header file information
#----------------------------
# -# The configuration requires adding the path of the header file (including all subfolders under this path) #
MF_CONFIGURE_ADD_HEADER_FILE_PATHS_AND_SUBPATHS +=
# -# The configuration requires adding the path of the header file. #
MF_CONFIGURE_ADD_HEADER_FILE_PATHS +=

#----------------------------
# - Configure to add source code information
#----------------------------
# -# The configuration needs to add the path of the source files for compilation (including all subfolders within that path) #
MF_CONFIGURE_ADD_SOURCE_CODE_PATHS_AND_SUBPATHS +=
# -# The configuration needs to include the path where the source files for compilation are located. #
MF_CONFIGURE_ADD_SOURCE_CODE_PATHS += ./src/comparison/max
MF_CONFIGURE_ADD_SOURCE_CODE_PATHS += ./src/comparison/min
# -# Configure to add the required source code files for compilation #
MF_CONFIGURE_ADD_SOURCE_CODE_FILES +=

#----------------------------
# - Configure delete (exclude) source code information
#----------------------------
# -# Delete (exclude) the path where the compilation source files are located (including all subfolders within that path) #
MF_CONFIGURE_DELETE_SOURCE_CODE_PATHS_AND_SUBPATHS +=
# -# Delete (exclude) the path where the compilation source files are located #
MF_CONFIGURE_DELETE_SOURCE_CODE_PATHS +=
# -# Delete (exclude) the source code files for compilation #
MF_CONFIGURE_DELETE_SOURCE_CODE_FILES +=
