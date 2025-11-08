#============================
# - Project Information
#============================
# @file : add_library.mk
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
# - Configuration library information
#----------------------------
# -# The configuration requires adding the standard library name. #
MF_CONFIGURE_ADD_STD_LIBRARY_NAME += 
# -# The configuration requires adding the names of your own-written libraries or third-party libraries. #
MF_CONFIGURE_ADD_USER_LIBRARY_NAME += 
# -# The configuration requires adding the path of the library you wrote yourself or a third-party library (including all subfolders under that path) #
MF_CONFIGURE_ADD_USER_LIBRARY_PATHS_AND_SUBPATHS += 
# -# The configuration requires adding the paths of the libraries you have written or third-party libraries. #
MF_CONFIGURE_ADD_USER_LIBRARY_PATHS += 
