# 一个跨平台通用的Makefile文件




## 一、背景

​	很高兴你能看到这个开源项目，希望这个项目能帮到你。
​	这是一个可直接用于企业开发使用的项目

​	项目在github的路径 : https://github.com/Yezcgithub/makefile
​	项目在gitee的路径   : https://gitee.com/yezc/makefile

## 二、功能

1. 支持跨平台
2. 支持可配置交叉编译
3. 支持可配置只编译C语言文件或C\C++文件混合编译
4. 支持可配置生成目标文件有可执行程序、动态库、静态库以及同时生成动态和静态库
5. 支持可配置生成 release、debug 以及同时生成 release 和 debug 版本
6. 支持可配置生成的目标文件及生成的中间文件的保存位置
7. 支持生成预处理文件和生成汇编文件命令
8. 支持在脚本中配置参数

## 三、优点

1. 简洁，核心只有一个Makefile文件
2. 跨平台，它可以自动识别所在平台，不需要配置就可以直接使用
   - 在Linux中直接拷贝Makefile文件到工程中就可以直接使用
   - 在Windows中需要busybox的支持，你可以在 "./tools/windows_tools" 中找到它，也可以在busybox官网中下载最新版本 https://frippery.org/busybox/ ， 在Windows使用Makefile该文件时，在拷贝Makefile文件的同时把 tools 文件夹一起拷到你的工程中即可
2. 配置方便，在Makefile文件中你只要关心带有前缀 "MF_CONFIGURE_" 的变量，并且增加了大量的说明及示例，这样能非常方便的对每个工程个性化管理的需求
3. 结合脚本使用，你可以不用修改Makefile文件，在脚本中直接配置你的个性化需求，可以在工程中查看 build.sh 脚本文件(Linux使用的) 和  build.bat 脚本文件(Windows使用的)
4. 健壮性，在Makefile文件中增加了很多的校验，它能增加在执行make时不容易出错，能够提前告知你配置的问题设置
5. 便于学习，如果近期你想了解或学习Makefile文件的知识，该项目是一个非常好的学习资料。在该项目中使用到了大部分的Makefile知识点，并且拥有大量的注释说明。在 "./doc" 文件夹中保存了make.pdf文件，这个也是你学习之路的不可或缺的的资料文件。当然也可以到make官网上下载最新的文档 https://www.gnu.org/software/make/ 

## 四、配置说明

### 1、与脚本相关的配置

```makefile
# -#配置编译方式#
#  参数 = [YES]  只能由脚本来编译, 使用make将会提示使用脚本来执行(脚本中必须设置这个变量并且值不为YES)
#  参数 = [NO]   可以直接使用make来编译
MF_CONFIGURE_ONLY_STARTED_BY_SCRIPT        ?= NO
```

### 2、配置文件和路径

```makefile
# -#配置生成目标文件名称#
#  注意:不能为空
#  例子: 
#  -  ?= main
#  -  ?= test
MF_CONFIGURE_TARGET_FILE_NAME              ?= main

# -#配置生成目标文件目录#
#  默认为Makefile所在文件夹(./build)
#  例子: 
#  -  ?= ./build
#  -  ?= ./output
#  -  ?= .
MF_CONFIGURE_TARGET_FILE_OUTPUT_PATH       ?= ./build

# -#配置编译时的中间文件输出目录#
#  默认为源码文件夹(./build/output)
#  例子: 
#  -  ?= ./build/output
#  -  ?= ./output
#  -  ?= .
MF_CONFIGURE_INTERMEDIATE_FILE_OUTPUT_PATH ?= ./build/output

# -#需要编译源码的根目录(包含子文件夹)#
#  添加多个根目录以空格隔开，如:(./src ./lib)
#  注意:会自动包含目录下所有的子文件夹，不需要重复增加子文件夹
#  默认为Makefile所在文件夹及所有子文件夹(.)
#  例子: 
#  -  ?= .
#  -  ?= ./src ../timer
#  -  += ./test
MF_CONFIGURE_SOURCE_CODE_DIRECTORYS        ?= .

# -#配置需要排除此文件夹中所有源文件目录(包含所有的子文件夹)#
#  添加多个以空格隔开.如:(./src ./lib)
#  注意:会自动包含目录下所有的子文件夹，不需要重复增加子文件夹
#  默认为空
#  例子: 
#  -  ?= ./lib
#  -  ?= ./clib ./lib
#  -  += ./libtest
MF_CONFIGURE_EXCLUDED_DIRECTORYS_RECURSION ?=

# -#配置需要排除此文件夹中所有源文件目录#
#  添加多个以空格隔开.如: = . ./lib ./lib/test ./lib/timer
#  注意:只生效添加的目录
#  默认为空
#  例子: 
#  -  ?= . ./lib
#  -  ?= . ./lib ./lib/test ./lib/timer
#  -  += ./libtest
MF_CONFIGURE_EXCLUDED_DIRECTORYS           ?=

# -#配置需要排除的文件#
#  添加多个以空格隔开.如: = ./src/main.c ./lib/test.c
#  默认为空
#  例子: 
#  -  ?= ./test.c
#  -  ?= ./src/main.c ./lib/test.c ./lib/timer/test.c
#  -  += ./src/test.c
MF_CONFIGURE_EXCLUDED_FILES                ?=

# -#添加除根目录及子文件夹外的头文件路径#
#  添加多个以空格隔开.如: = ../ ../inc /lib/inc
#  例子: 
#  -  ?= .
#  -  ?= ../src/inc ./lib
#  -  += ../lib/inc
MF_CONFIGURE_OTHER_INCLUDE_PATHS           ?=
```

### 3、添加参数配置

```makefile
# -#在程序中用到的第3方库,编译时需要添加#
#-L：依赖的库所在的目录名
#-l：依赖的具体库 -L./lib -ltest
#    调用标准的库时如:用到线程需要添加 -pthread
#    调用自己写的库或第三方库时需要把库所在路径写出来,
#    如:把libtest.so放在/aaa/bbb/ccc目录下，那链接参数就是 -L/aaa/bbb/ccc –ltest
#    使用动态库需要将库所在目录添加到环境变量中,
#    如: /data/lib/libtest.so , export LD_LIBRARY_PATH=/data/lib/:$LD_LIBRARY_PATH
# -#标准的库#
#  例子: 
#  -  ?= -lpthread -lrt -lm -ldl
#  -  += -ldl
MF_CONFIGURE_USING_STD_LIBRARY_FLAGS       ?= 

# -#自己写的库或第三方库#
#  例子: 
#  -  ?= -L./lib/timer -ltimer -L./lib/test -ltest
#  -  += -L./lib/media -lmedia
#  -  += -L./lib -ltest -ltest1 -ltest2
MF_CONFIGURE_USING_LIBRARY_FLAGS           ?=

# -#添加用户宏定义#
#  可在应用程序中使用宏
#  = __YE           相当于C语言 #define __YE
#  = __YE=1         相当于C语言 #define __YE 1
#  = __YE=\"hello\" 相当于C语言 #define __YE "hello"
#  例子: 
#  -  ?= __YE __CC
#  -  += __YECC=hello
#  -  += __YECC_NUM=1
#  -  += APP_VERSION=1.0.0
MF_CONFIGURE_ADD_USER_DEFINE               ?=
```

### 4、设置文件编译选项

```makefile
# -#配置头文件路径包含范围# 
#  参数 = [ONLY_CONFIGURE_PATHS]    只包含通过 MF_CONFIGURE_OTHER_HEADER_FILE_PATHS 变量配置的路径
#  参数 = [BUILD_SOURCE_CODE_PATHS] 在 ONLY_CONFIGURE_PATHS 的基础上还包含没有被排除掉的源文件目录(编译源码路径)
#  参数 = [ALL_SOURCE_CODE_PATHS]   在 ONLY_CONFIGURE_PATHS 的基础上还包含所有的源文件目录
#  参数 = [ALL_PATHS]               在 ALL_SOURCE_CODE_PATHS 的基础上还包含被排除的文件目录
MF_CONFIGURE_HEADER_FILE_PATH_INCLUDE_RANGE  ?= ALL_SOURCE_CODE_PATHS

# -#编译后的目标文件输出类型#
#  参数 = [RELEASE] 删除可执行文件中的符号表,符号表不影响程序的运行,减小程序体积
#  参数 = [DEBUG]   保留可执行文件中的符号表,使用gdb调试时要设置为 NO
#  参数 = [RELEASE_AND_DEBUG]   保留RELEASE和DEBUG可执行文件
MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG       ?= RELEASE_AND_DEBUG

# -#编译输出文件类型#compile
#  参数 = [EXECUTE]                    生成可执行程序
#  参数 = [LIBRARY_DYNAMIC]            生成(.so) 动态库文件
#  参数 = [LIBRARY_STATIC]             生成(.a) 静态库文件
#  参数 = [LIBRARY_STATIC_AND_DYNAMIC] 生成(.a and .so) 动态静态库文件
MF_CONFIGURE_OUTPUT_TARGET_FILE_TYPE       ?= LIBRARY_STATIC_AND_DYNAMIC

# -#编译原文件类型#
#  参数 = [CPP_TYPE]  编译包括C和CPP文件
#  参数 = [C_TYPE]    只编译包括C文件
MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE    ?= CPP_TYPE

# -#是否使用静态编译[仅作用于生成可执行程序]#
#  参数 = [YES]  使用静态编译
#  参数说明 : 编译时会将所有的依赖文件都打包进来.对运行环境的依赖性较小,兼容性强;生成的程序比较大.
#  参数 = [NO]   使用动态编译
#  参数说明 : 编译后有着较小的程序体积,依赖动态库，不能独立运行.
MF_CONFIGURE_USING_STATIC_COMPILATION      ?= NO

# -#编译后是否删除中间文件(.d, .o, .i, .ii, .s)#
#  参数 = [YES]  删除中间文件,每一次编译都将是全编译
#  参数 = [NO]   保留中间文件
MF_CONFIGURE_DELETING_INTERMEDIATE_FILES   ?= NO

# -#编译过程控制台日志使用格式化显示#
#  参数 = [YES]  使用格式化显示,能整齐的打印正在编译的文件名
#  参数 = [NO]   打印GUN日志
MF_CONFIGURE_USING_FORMATTEND_LOG          ?= YES
```

### 5、调试选项

```makefile
#  += -g        在编译的时候,产生调试信息
#  += -gstabs   此选项以stabs格式声称调试信息,但是不包括gdb调试信息. 
#  += -gstabs+  此选项以stabs格式声称调试信息,并且包含仅供gdb使用的额外调试信息.
#  += -ggdb     此选项将尽可能的生成gdb的可以使用的调试信息.
#  += -glevel   请求生成调试信息，同时用level指出需要多少信息，默认的level值是2
MF_CONFIGURE_C_FLAGS      += -g
MF_CONFIGURE_CPP_FLAGS    += -g
```

### 6、错误与告警选项

```makefile
# -基本警告控制
#  += -w 关闭所有编译警告
#  += -Wall 启用所有常用警告(未使用变量、未初始化变量、函数未声明等)
#  += -Wextra 在-Wall基础上增加额外警告(如空参数、类型转换隐式丢失等)
#  += -Wunused-function 检测声明但未使用的静态函数
#  += -Wunused-label 检测未使用的标签(如goto跳转标签被删除后残留)
#  += -Wshadow 当一个局部变量遮盖住了另一个局部变量，或者全局变量时，给出警告
#  += -Wunreachable-code 如果编译器探测到永远不会执行到的代码，就给出警告
#  += -Wundef 当一个没有定义的符号出现在 #if 中时，给出警告。
#  += -Werror   把所有警告转换为错误，以在警告发生时中止编译过程
#  += -Wfatal-errors 遇到第一个错误就停止
#  += -Wconversion 警告隐式类型转换（如int转short可能丢失精度）
#  += -Wstrict-prototypes 要求函数声明明确参数类型(禁用int foo()形式)
#  += -pedantic 允许发出ANSI/ISO C标准所列出的所有警告
#  += -pedantic-errors 允许发出ANSI/ISO C标准所列出的错误
#  += -Wno-conversion 禁止警告隐式类型转换
#  += -Wno-unused-variable  禁止警告未使用的变量
#  += -Wno-unused-label  禁止警告未使用的标签
#  += -Wno-unused-variable  禁止警告未使用的变量
#  += -Wno-unused-label  禁止警告未使用的标签
#  += -Wno-unused-function  禁止警告未使用的函数
MF_CONFIGURE_C_FLAGS      += -Wall -Werror -Wfatal-errors -Wunused-function -Wunused-label -Wconversion -Wstrict-prototypes
MF_CONFIGURE_CPP_FLAGS    += -Wall -Werror -Wfatal-errors -Wunused-function -Wunused-label -Wconversion -Wstrict-prototypes

```

### 7、其他参数配置

```makefile
#----------------------------
# -动态库导出符号
#----------------------------
#  建议在RELEASE版本中关闭
#  += -rdynamic  动态库导出符号
#MF_CONFIGURE_C_FLAGS      += -rdynamic
#MF_CONFIGURE_CPP_FLAGS    += -rdynamic

#----------------------------
# -指定编译器
#----------------------------
#MF_CONFIGURE_C_FLAGS      += -std=c99
#MF_CONFIGURE_CPP_FLAGS    += -std=c++98

#----------------------------
# -编译器优化级别
#----------------------------
# += -O0 无优化，保留完整调试信息，代码执行最慢，开发调试阶段
# += -O1 基础优化，轻微提升性能，不影响调试，对性能要求不高的调试版本
# += -O2 中等优化，全面启用安全优化，显著提升性能，编译时间可控，发布版本的默认选择
# += -O3 高度优化，可能增加代码体积和编译时间，偶有兼容性问题，代码执行速度快，高性能计算等特定场景
#MF_CONFIGURE_C_FLAGS      += -O2
#MF_CONFIGURE_CPP_FLAGS    += -O2

#----------------------------
# -其他选项
#----------------------------
#MF_CONFIGURE_C_FLAGS      +=
#MF_CONFIGURE_CPP_FLAGS    +=

#----------------------------
# -作用于生成.o文件编译选项
#----------------------------
# -MMD  : 生成依赖文件, 自动生成 .d 依赖文件, 如 main.c → main.d
# -MP   : 在生成的 .d 文件中为每个头文件添加一个无依赖的伪目标, 当头文件被删除时，避免make报错)
# -fPIC : 生成位置无关代码, 用于编译动态链接库, 但这里一般不用
MF_CONFIGURE_C_OBJECTS_FLAGS      ?= -MMD -MP
MF_CONFIGURE_CPP_OBJECTS_FLAGS    ?= -MMD -MP

#----------------------------
# -编译工具配置
#----------------------------
# -指定使用的编译工具路径前缀
#  默认为空 ?= 时编译出来的程序为当前系统可执行程序
#  交叉编译时必须写上编译工具路径前缀
#  例子:
#  -  ?=
#  -  ?= arm-linux-
#  -  ?= arm-linux-gnueabi-
#  -  ?= arm-linux-gnueabihf-
MF_CONFIGURE_COMPILE_PATH_PREFIX   ?= 

#----------------------------
# -平台配置
#----------------------------
# -这个决定了makefile是在哪个平台下使用的
#  默认情况下为 ?= $(OS) 它可以自动识别是否在windows系统
#  当然也可以直接手动指定
#  例子:
#  -  auto    ：$(OS)
#  -  windows ：?= WINDOWS or ?= Windows_NT
#  -  linux   ：?= LINUX   or ?=
MF_CONFIGURE_PLATFORM_OS          ?= $(OS)

#----------------------------
# -busybox工具配置
#----------------------------
#  这项主要是针对windows中使用makefile的情况
#  在linux中这项可以不配置，如 ?=
#  在windows中使用makefile时，必须配置busybox工具路径
#  你可以在./tools/目录下找到busybox.exe
#  也可以在busybox官网在下载 https://frippery.org/busybox/
#  例子:
#  -  ?= "./tools/windows_tools/busybox"
#  -  ?= "./tools/busybox"
MF_CONFIGURE_BUSYBOX_TOOLS         ?= "./tools/windows_tools/busybox"
```

# The MIT License (MIT)

\# https://mit-license.org/

Copyright © 2025 <copyright holders>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
