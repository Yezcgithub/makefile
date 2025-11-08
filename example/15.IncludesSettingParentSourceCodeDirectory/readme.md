# IncludesSettingParentSourceCodeDirectory

## * Explanation :

When your project is particularly unique, include the parent source code directory.
For instance, some public code, header files or libraries, etc. are combined into a workspace. And your project is located in a certain folder within this workspace. During your development, you need to use other source code resources from the workspace.

In this scenario, you can set the source code path to include the parent directory of your project. This allows you to access and utilize the shared resources effectively.

When the configuration of the intermediate output file is neither "= " nor "=.", and there is information like "../" in the source code configuration, it is recommended to use the following writing style as shown in the example. Otherwise, it may cause confusion between the intermediate files and the project files.

```makefile
When MF_CONFIGURE_ADD_SOURCE_CODE_PATHS_AND_SUBPATHS ?= ./src, then MF_CONFIGURE_INTERMEDIATE_FILE_OUTPUT_PATH ?= build/output
When MF_CONFIGURE_ADD_SOURCE_CODE_PATHS_AND_SUBPATHS ?= ../src, then MF_CONFIGURE_INTERMEDIATE_FILE_OUTPUT_PATH ?= build/output/__
When MF_CONFIGURE_ADD_SOURCE_CODE_PATHS_AND_SUBPATHS ?= ../../src, then MF_CONFIGURE_INTERMEDIATE_FILE_OUTPUT_PATH ?= build/output/__/__
When MF_CONFIGURE_ADD_SOURCE_CODE_PATHS_AND_SUBPATHS ?= ../../../src, then MF_CONFIGURE_INTERMEDIATE_FILE_OUTPUT_PATH ?= build/output/__/__/__
```

## * Example :
```sh
workspace
    ├── build
    ├── comm
    │    ├── include
    │    ├── generate_barcode
    │    ├── generate_qr_code
    │    └── ...
    ├── device
    │    ├── generate_alphabet
    │    ├── generate_number_sequence
    │    └── ...
    ├── docs
    │    └── ...
    ├── lib
    │    └── ...
    ├── frameworks
    │    └── ...
    ├── project
    ├──    ├── my_project1   (Suppose this is your Project 1)
    ├──    ├── my_project2   (Suppose this is your Project 2)
    ├──    └── ...           (...)
    └── system
```


## * Execution steps : 

```sh
cd project/my_project1
make

or

cd project/my_project2
make

or

cd project/my_projectxxx
make

...

```

# The MIT License (MIT)

\# https://mit-license.org/

Copyright © 2025 <Yezc/Makefile>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
