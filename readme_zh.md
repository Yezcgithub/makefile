# 一个可用于企业开发及通用跨平台的Makefile文件




## 一、简介

​    很高兴你能看到这个开源项目，希望这个项目能帮到你。

​    这是一个可直接用于企业开发使用的项目，只需要简单的配置信息就能方便管理你的工程。

#### 1. 简洁
​    核心只有一个Makefile文件。

#### 2. 通用性强
​    适用于小工程项目、中等工程项目及大工程项目。
#### 3. 跨平台
​    它可以自动识别所在平台，不需要配置就可以直接使用。
​          - 在Linux中直接拷贝Makefile文件到工程中就可以直接使用。
​          - 在Windows中需要工具的支持，你可以在 "./tools/windows_tools" 中找到它，在拷贝 Makefile 文件的同时把 tools 文件夹一起拷到你的工程中即可。

#### 4. 配置简单
​    在Makefile文件中你只要关心带有前缀 "MF_CONFIGURE_" 的变量，并且增加了大量的说明及示例，这样能非常方便的对每个工程个性化管理的需求。
#### 5. 结合脚本使用
​    你可以不用修改Makefile文件，在脚本中直接配置你的个性化需求，可以在工程中查看 build.sh 脚本文件(Linux使用的) 和  build.bat 脚本文件(Windows使用的)。
#### 6. 健壮性
​    在Makefile文件中增加了很多的校验，它能增加在执行make时不容易出错，能够提前告知你配置的问题设置
#### 7. 便于学习
​    如果近期你想了解或学习Makefile文件的知识，该项目是一个非常好的学习资料。在该项目中使用到了大部分的Makefile知识点，并且拥有大量的注释说明。在 "./doc" 文件夹中保存了make.pdf文件，这个也是你学习之路的不可或缺的的资料文件。



## 二、下载

| 项目源码获取平台 | 项目链接                         |
| -------- | -------------------------------------- |
| github   | https://github.com/Yezcgithub/makefile |
| gitee    | https://gitee.com/yezc/makefile        |
| gitcode  | https://gitcode.com/Yeccc/makefile     |



## 三、功能

1. 支持跨平台

2. 支持可配置交叉编译

3. 支持可配置只编译C语言文件或C\C++文件混合编译

4. 支持可配置生成目标文件有可执行程序、动态库、静态库以及同时生成动态和静态库

5. 支持可配置生成 release、debug 以及同时生成 release 和 debug 版本

6. 支持可配置生成的目标文件及生成的中间文件的保存位置

7. 支持可配置编译时的格式化日志打印

8. 支持生成预处理文件和生成汇编文件命令

9. 支持在脚本中配置参数

10. 支持单个Makefile管理和多.mk文件管理

11. 更多配置 . . .

## 四、目录

```sh
project
    ├── doc
    ├── example
    │    ├── example1
    │    ├── example2
    │    ├── example3
    │    └── ...
    ├── src
    │    └── ...
    ├── tools
    │    ├── script
    │    │    ├── build.bat
    │    │    └── build.sh
    │    ├── sub_makefile
    │    │    ├── add_header.mk
    │    │    ├── add_library.mk
    │    │    └── add_source.mk
    │    ├── windows_tools
    │    │    └── ...
    │    └── ...
    ├── build.bat (与 ./tools/script/build.bat 文件是一样的)
    ├── build.sh (与 ./tools/script/build.sh 文件是一样的)
    ├── LICENSE
    └── Makefile
```



## 五、命令

更多详细信息可通过 `make help` 来获取

```sh
The following is a detailed explanation of all the commands.

  make start_main  - Equivalent to the make build command.
  make build       - Generating the target file, It is the same as directly executing the make command.
  make rebuild     - Re-generate the target file.
  make all         - Generate all files (such as .o, .d, .i, .s and object files).
  make rebuild_all - Re-generate all files (.o, .d, .i, .s and object files), and debugging is available.
  make clean       - Delete all intermediate files and target files.
  make preprocess  - Generate preprocessing file.
  make assemble    - Generate assembly file.
  make object      - Generate object file.
  make version     - Makefile version information.
  make infoprint   - Print detailed information.
  make help        - Help Information.
```



## 六、配置

### 1、与脚本相关的配置

```makefile
# -# 仅脚本编译方式 #
#  - 参数 = [YES]  只能由脚本来编译, 使用make将会提示使用脚本来执行(脚本中必须设置这个变量并且值不为YES)
#  - 参数 = [NO]   可以直接使用make来编译
MF_CONFIGURE_ONLY_STARTED_BY_SCRIPT ?= NO
```

### 2、配置子makefile文件(.mk)

```makefile
#  # 配置需要使用子makefile文件(.mk), 多文件管理 #
#    当你在开发大型项目时建议使用该选项, 中小型项目可以不使用
#  - 参数 = [YES]  使用, 工程中使用一个顶层makefile文件及每个子文件夹下的.mk文件一起管理
#  - 参数 = [NO]   不使用, 工程中只使用一个顶层makefile文件管理(默认)
MF_CONFIGURE_USING_SUB_MAKEFILE ?= NO

# -# 配置需要添加子makefile文件路径(包含该路径下所有的子文件夹) #
#  - 说明 : 
#    -- 只有 MF_CONFIGURE_USING_SUB_MAKEFILE = YES 时才生效
#    -- 添加多个路径以空格隔开
#    -- 它会自动添加该路径下所有的子文件夹，不需要重复增加子文件夹
#  - 例子 : 
#    -- ?= ./src ../timer
#    -- += ./test
MF_CONFIGURE_ADD_SUB_MAKEFILE_PATHS_AND_SUBPATHS ?=

# -# 配置需要添加子makefile文件路径 #
#  - 说明 : 
#    -- 只有 MF_CONFIGURE_USING_SUB_MAKEFILE = YES 时才生效
#    -- 添加多个路径以空格隔开
#    -- 只添加该路径下的子makefile文件(.mk)
#  - 例子 : 
#    -- ?= .
#    -- ?= ./src ./src/timer ./src/test
#    -- += ./test
MF_CONFIGURE_ADD_SUB_MAKEFILE_PATHS ?=
```

### 3、配置输出目标文件信息

```makefile
# -# 配置生成目标文件名称 #
#  - 说明 : 
#    -- 该选项不能为空
#    -- 不能设置与已有的伪目标指令一样的名称
#  - 例子 : 
#    -- ?= main
#    -- ?= test
MF_CONFIGURE_TARGET_FILE_NAME ?= main

# -# 编译后的目标文件输出类型 #
#  - 参数 = [RELEASE] 删除可执行文件中的符号表,符号表不影响程序的运行,减小程序体积
#  - 参数 = [DEBUG]   保留可执行文件中的符号表,使用gdb调试时要设置为 NO
#  - 参数 = [RELEASE_AND_DEBUG]   保留RELEASE和DEBUG可执行文件
MF_CONFIGURE_TARGET_RELEASE_OR_DEBUG ?= RELEASE_AND_DEBUG

# -# 编译输出文件类型 #
#  - 参数 = [EXECUTE]                    生成可执行程序
#  - 参数 = [LIBRARY_DYNAMIC]            生成(.so) 动态库文件
#  - 参数 = [LIBRARY_STATIC]             生成(.a) 静态库文件
#  - 参数 = [LIBRARY_STATIC_AND_DYNAMIC] 生成(.a and .so) 动态静态库文件
MF_CONFIGURE_OUTPUT_TARGET_FILE_TYPE ?= LIBRARY_STATIC_AND_DYNAMIC
```

### 4、配置输出文件夹信息

```makefile
# -# 配置生成目标文件目录 #
#  - 说明 : 
#    -- 当该选项为空时相当于 ?= .
#    -- 当该选项为 ?= . 时, 生成的目标文件会在Makefile所在文件夹中
#  - 例子 : 
#    -- ?= ./build
#    -- ?= ./output
#    -- ?= .
MF_CONFIGURE_TARGET_FILE_OUTPUT_PATH ?= ./build

# -# 配置编译时的中间文件输出目录 #
#  - 说明 : 
#    -- 当该选项为空时相当于 ?= .
#    -- 当该选项为 ?= . 时, 编译时的中间文件输出会在源码文件夹中
#  - 例子 : 
#    -- ?= ./build/output
#    -- ?= ./output
#    -- ?= .
MF_CONFIGURE_INTERMEDIATE_FILE_OUTPUT_PATH ?= ./build/output
```

### 5、配置添加源码信息

```makefile
# -# 配置需要添加编译源文件所在的路径(包含该路径下所有的子文件夹) #
#  - 说明 : 
#    -- 添加多个根目录以空格隔开
#    -- 该选项会自动包含目录下所有的子文件夹, 不需要重复增加子文件夹
#    -- 在大型项目中不建议使用该选项, 它会检索所有的子文件夹, 当子文件夹过多时可能会影响编译效率. 在大型项目中建议 MF_CONFIGURE_ADD_SOURCE_CODE_PATHS 选项.
#    -- 默认为空
#  - 例子 : 
#    -- ?= ./src ../timer
#    -- += ./testd
MF_CONFIGURE_ADD_SOURCE_CODE_PATHS_AND_SUBPATHS ?= ../makefile1/src

# -# 配置需要添加编译源文件所在的路径 #
#  - 说明 : 
#    -- 添加多个目录以空格隔开
#    -- 该选项只会生效添加的目录
#  - 例子 : 
#    -- ?= .
#    -- ?= ./src ./src/timer
#    -- += ./test
MF_CONFIGURE_ADD_SOURCE_CODE_PATHS ?=

# -# 配置需要添加的编译源码文件 #
#  - 说明 : 
#    -- 添加多个编译源码文件以空格隔开
#  - 例子 : 
#    -- ?= ./test.c
#    -- ?= ./src/main.c ./lib/test.c ./lib/timer/test.c
#    -- += ./src/test.c
MF_CONFIGURE_ADD_SOURCE_CODE_FILES ?=
```

### 6、配置删除(排除)源码信息

```makefile
# -# 配置需要删除(排除)的编译源文件所在的路径(包含该路径下所有的子文件夹) #
#  - 说明 : 
#    -- 添加多个根目录以空格隔开
#    -- 该选项会自动包含目录下所有的子文件夹, 不需要重复增加子文件夹
#    -- 在大型项目中不建议使用该选项, 它会检索所有的子文件夹, 当子文件夹过多时可能会影响编译效率. 在大型项目中建议 MF_CONFIGURE_DELETE_SOURCE_CODE_PATHS 选项.
#    -- 默认为空
#  - 例子 : 
#    -- ?= ./lib
#    -- ?= ./clib ./lib
#    -- += ./libtest
MF_CONFIGURE_DELETE_SOURCE_CODE_PATHS_AND_SUBPATHS ?=

# -# 配置需要删除(排除)的编译源文件所在的路径 #
#  - 说明 : 
#    -- 添加多个根目录以空格隔开
#    -- 该选项只会生效添加的目录
#  - 例子 : 
#    -- ?= ./lib
#    -- ?= ./lib ./lib/test ./lib/timer
#    -- += ./libtest
MF_CONFIGURE_DELETE_SOURCE_CODE_PATHS ?=

# -# 配置需要删除(排除)的编译源码文件 #
#  - 说明 : 
#    -- 添加多个文件以空格隔开
#  - 例子 : 
#    -- ?= ./test.c
#    -- ?= ./src/main.c ./lib/test.c ./lib/timer/test.c
#    -- += ./src/test.c
MF_CONFIGURE_DELETE_SOURCE_CODE_FILES ?=
```

### 7、配置头文件

```makefile
# -# 配置头文件路径包含范围 # 
#  - 参数 = [ONLY_CONFIGURE_PATHS]    只包含通过 MF_CONFIGURE_ADD_HEADER_FILE_PATHS_AND_SUBPATHS 或 MF_CONFIGURE_ADD_HEADER_FILE_PATHS 变量配置的路径
#  - 参数 = [BUILD_SOURCE_CODE_PATHS] 在 ONLY_CONFIGURE_PATHS 的基础上还包含没有被删除(排除)掉的源文件路径(编译源码路径)
#  - 参数 = [ALL_SOURCE_CODE_PATHS]   在 ONLY_CONFIGURE_PATHS 的基础上还包含所有的源文件路径
#  - 参数 = [ALL_PATHS]               在 ALL_SOURCE_CODE_PATHS 的基础上还包含被删除(排除)的路径及库路径
MF_CONFIGURE_HEADER_FILE_PATH_INCLUDE_RANGE ?= ALL_SOURCE_CODE_PATHS

# -# 配置需要添加头文件路径(包含该路径下所有的子文件夹) #
#  - 说明 : 
#    -- 需要看 MF_CONFIGURE_HEADER_FILE_PATH_INCLUDE_RANGE 变量配置的区域
#    -- 添加多个路径以空格隔开
#    -- 该选项会自动包含目录下所有的子文件夹, 不需要重复增加子文件夹
#    -- 在大型项目中不建议使用该选项, 它会检索所有的子文件夹, 当子文件夹过多时可能会影响编译效率. 在大型项目中建议 MF_CONFIGURE_ADD_HEADER_FILE_PATHS 选项.
#    -- 默认为空
#  - 例子 : 
#    -- ?= ../src/inc ./lib
#    -- += ../lib/inc
MF_CONFIGURE_ADD_HEADER_FILE_PATHS_AND_SUBPATHS ?= 

# -# 配置需要添加头文件路径 #
#  - 说明 : 
#    -- 需要看 MF_CONFIGURE_HEADER_FILE_PATH_INCLUDE_RANGE 变量配置的区域
#    -- 添加多个路径以空格隔开
#    -- 该选项只会生效添加的目录
#    -- 默认为空
#  - 例子 : 
#    -- ?= .
#    -- ?= ../src/inc ./lib ./lib/test/inc
#    -- += ../lib/inc
MF_CONFIGURE_ADD_HEADER_FILE_PATHS ?=
```

### 8、配置库信息

```makefile
# -# 配置需要添加标准的库名称 #
#  - 说明 : 
#    -- 添加标准的库名称
#    -- 添加多个库以空格隔开
#  - 例子 : 
#    -- ?= pthread rt m dl
#    -- += dl
#    -- += m
MF_CONFIGURE_ADD_STD_LIBRARY_NAME ?=

# -# 配置需要添加自己写的库或第三方库路径(包含该路径下所有的子文件夹) #
#  - 说明 : 
#    -- 添加多个根目录以空格隔开
#    -- 该选项会自动包含目录下所有的子文件夹, 不需要重复增加子文件夹
#    -- 在大型项目中不建议使用该选项, 它会检索所有的子文件夹, 当子文件夹过多时可能会影响编译效率. 在大型项目中建议 MF_CONFIGURE_ADD_USER_LIBRARY_PATHS 选项.
#  - 例子 : 
#    -- ?= ./lib/timer
#    -- ?= ./src/lib
#    -- += ../lib
MF_CONFIGURE_ADD_USER_LIBRARY_PATHS_AND_SUBPATHS ?= 

# -# 配置需要添加自己写的库或第三方库路径 #
#  - 说明 : 
#    -- 添加多个根目录以空格隔开
#    -- 该选项只会生效添加的目录
#  - 例子 : 
#    -- ?= ./lib/timer ./lib ./lib/test
#    -- ?= ./src/lib
#    -- += ../lib
MF_CONFIGURE_ADD_USER_LIBRARY_PATHS ?=

# -# 配置需要添加自己写的库或第三方库名称 #
#  - 说明 : 
#    -- 添加自己写的库或第三方库名称
#    -- 在linux中 libtimer.so = timer
#    -- 在linux中 libtest.a   = test
#    -- 在windows中 media.lib = media
#    -- 添加多个库以空格隔开
#  - 例子 : 
#    -- ?= timer media test
#    -- += timer
#    -- += test
MF_CONFIGURE_ADD_USER_LIBRARY_NAME ?=
```

### 9、配置用户宏信息

```makefile
# -# 配置需要添加用户宏定义 #
#  - 说明 : 
#    -- 可在应用程序中使用宏
#    -- = __YE         相当于C语言 #define __YE
#    -- = __YE=1       相当于C语言 #define __YE 1
#    -- __YE=\"hello\" 相当于C语言 #define __YE "hello"
#  - 例子 : 
#    -- ?= __YE __CC __VERSION=\"1.0.0\"
#    -- += __YECC=\"hello\"
#    -- += __YECC_NUM=1
#    -- += APP_VERSION=\"1.0.0\"
MF_CONFIGURE_ADD_USER_DEFINE ?=
```

### 10、编译配置

```makefile
# -# 编译原文件类型 #
#  - 参数 = [CPP_TYPE] 使用c++编译器，编译包括C和CPP文件
#  - 参数 = [C_TYPE]   使用c编译器，只编译包括C文件
MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE ?= C_TYPE

# -# 是否使用静态编译(仅作用于生成可执行程序) #
#  - 参数 = [YES] 使用静态编译, 编译时会将所有的依赖文件都打包进来.对运行环境的依赖性较小,兼容性强;生成的程序比较大.
#  - 参数 = [NO]  使用动态编译, 编译后有着较小的程序体积,依赖动态库，不能独立运行.
MF_CONFIGURE_USING_STATIC_COMPILATION ?= NO

# -# 编译后是否删除中间文件(.d, .o, .i, .ii, .s) #
#  - 参数 = [YES] 删除中间文件,每一次编译都将是全编译
#  - 参数 = [NO]  保留中间文件
MF_CONFIGURE_DELETING_INTERMEDIATE_FILES ?= NO

# -# 是否在执行编译前先创建显式声明 #
#  - 参数 = [YES] 使用显式声明, 不建议使用，源文件过多时编译前需要创建显式规则会拖慢编译时间, 需要make版本V3.81及以上可用否则不生效
#  - 参数 = [NO]  不使用显式声明, 建议使用
MF_CONFIGURE_USE_EXPLICIT_DECLARATION ?= NO
```

### 11、日志配置

```makefile
# -# 编译过程控制台日志使用格式化显示 #
#  - 参数 = [YES] 使用格式化显示,能整齐的打印正在编译的文件名
#  - 参数 = [NO]  打印编译日志
MF_CONFIGURE_USING_FORMATTEND_LOG ?= YES

# -# 编译日志使用格式化显示字符串(.c -> .o) #
#  - 说明 : 
#    -- MF_CONFIGURE_USING_FORMATTEND_LOG = YES 时才生效
#  - 例子 : 
#    -- ?= CC
#    -- ?= [CC]
#    -- ?= Building
#    -- ?= Compiling
MF_CONFIGURE_FORMATTEND_LOG_CC_OBJECT_SHOW_STRING ?= CC

# -# 编译日志使用格式化显示字符串(.cpp -> .o) #
#  - 说明 : 
#    -- MF_CONFIGURE_USING_FORMATTEND_LOG = YES 时才生效
#  - 例子 : 
#    -- ?= CPP
#    -- ?= [CPP]
#    -- ?= Building
#    -- ?= Compiling
MF_CONFIGURE_FORMATTEND_LOG_CPP_OBJECT_SHOW_STRING ?= CPP

# -# 编译日志使用格式化显示字符串(.c -> .s) 或(.cpp -> .s) #
#  - 说明 : 
#    -- MF_CONFIGURE_USING_FORMATTEND_LOG = YES 时才生效
#  - 例子 : 
#    -- ?= AS
#    -- ?= [AS]
#    -- ?= [ASSEMBLY]
#    -- ?= Building
#    -- ?= Compiling
MF_CONFIGURE_FORMATTEND_LOG_ASSEMBLE_SHOW_STRING ?= AS

# -# 编译日志使用格式化显示字符串(.c -> .i) 或 (.cpp -> .ii) #
#  - 说明 : 
#    -- MF_CONFIGURE_USING_FORMATTEND_LOG = YES 时才生效
#  - 例子 : 
#    -- ?= PR
#    -- ?= [PR]
#    -- ?= [PREPROCESS]
#    -- ?= Building
#    -- ?= Compiling
MF_CONFIGURE_FORMATTEND_LOG_PREPROCESS_SHOW_STRING ?= PR

# -# 链接打包生成静态库日志使用格式化显示字符串 #
#  - 说明 : 
#    -- MF_CONFIGURE_USING_FORMATTEND_LOG = YES 时才生效
#  - 例子 : 
#    -- ?= AR
#    -- ?= [AR]
#    -- ?= linking
#    -- ?= package
MF_CONFIGURE_FORMATTEND_LOG_LIBRARY_STATIC_SHOW_STRING ?= AR

# -# 链接打包生成动态库日志使用格式化显示字符串 #
#  - 说明 : 
#    -- MF_CONFIGURE_USING_FORMATTEND_LOG = YES 时才生效
#  - 例子 : 
#    -- ?= LD
#    -- ?= [LD]
#    -- ?= linking
#    -- ?= package
MF_CONFIGURE_FORMATTEND_LOG_LIBRARY_DYNAMIC_SHOW_STRING ?= LD

# -# 链接打包生成可执行程序日志使用格式化显示字符串 #
#  - 说明 : 
#    -- MF_CONFIGURE_USING_FORMATTEND_LOG = YES 时才生效
#  - 例子 : 
#    -- ?= LD
#    -- ?= [LD]
#    -- ?= linking
#    -- ?= package
MF_CONFIGURE_FORMATTEND_LOG_EXECUTE_SHOW_STRING ?= LD
```

### 12、调试选项

```makefile
#  - 说明 : 
#    -- 当 MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE = C_TYPE 时使用 MF_CONFIGURE_C_FLAGS, 否则使用 MF_CONFIGURE_CPP_FLAGS
#    -- += -g        在编译的时候,产生调试信息
#    -- += -gstabs   此选项以stabs格式声称调试信息,但是不包括gdb调试信息. 
#    -- += -gstabs+  此选项以stabs格式声称调试信息,并且包含仅供gdb使用的额外调试信息.
#    -- += -ggdb     此选项将尽可能的生成gdb的可以使用的调试信息.
#    -- += -glevel   请求生成调试信息，同时用level指出需要多少信息，默认的level值是2
#    -- += ...
#  - 例子 : 
#    -- += -g
#    -- += -ggdb
MF_CONFIGURE_C_FLAGS   ?= -g
MF_CONFIGURE_CPP_FLAGS ?= -g
```

### 13、错误与告警选项

```makefile
#  - 说明 : 
#    -- 当 MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE = C_TYPE 时使用 MF_CONFIGURE_C_FLAGS, 否则使用 MF_CONFIGURE_CPP_FLAGS
#    -- += -w 关闭所有编译警告
#    -- += -Wall 启用所有常用警告(未使用变量、未初始化变量、函数未声明等)
#    -- += -Wextra 在-Wall基础上增加额外警告(如空参数、类型转换隐式丢失等)
#    -- += -Wunused-function 检测声明但未使用的静态函数
#    -- += -Wunused-label 检测未使用的标签(如goto跳转标签被删除后残留)
#    -- += -Wshadow 当一个局部变量遮盖住了另一个局部变量，或者全局变量时，给出警告
#    -- += -Wunreachable-code 如果编译器探测到永远不会执行到的代码，就给出警告
#    -- += -Wundef 当一个没有定义的符号出现在 #if 中时，给出警告。
#    -- += -Werror   把所有警告转换为错误，以在警告发生时中止编译过程
#    -- += -Wfatal-errors 遇到第一个错误就停止
#    -- += -Wconversion 警告隐式类型转换（如int转short可能丢失精度）
#    -- += -Wstrict-prototypes 要求函数声明明确参数类型(禁用int foo()形式)
#    -- += -pedantic 允许发出ANSI/ISO C标准所列出的所有警告
#    -- += -pedantic-errors 允许发出ANSI/ISO C标准所列出的错误
#    -- += -Wno-conversion 禁止警告隐式类型转换
#    -- += -Wno-unused-variable  禁止警告未使用的变量
#    -- += -Wno-unused-label  禁止警告未使用的标签
#    -- += -Wno-unused-variable  禁止警告未使用的变量
#    -- += -Wno-unused-label  禁止警告未使用的标签
#    -- += -Wno-unused-function  禁止警告未使用的函数
#    -- += ...
#  - 例子 : 
#    -- += -Wall -Werror -Wfatal-errors -Wunused-function -Wunused-label -Wconversion
#    -- += -Wall -Wfatal-errors -Wunused-function -Wunused-label -Wconversion
#    -- += -Wall -Werror
#    -- += -Wall
MF_CONFIGURE_C_FLAGS   += -Wall -Wfatal-errors -Wunused-function -Wunused-label -Wconversion
MF_CONFIGURE_CPP_FLAGS += -Wall -Wfatal-errors -Wunused-function -Wunused-label -Wconversion
```

### 14、动态库导出符号

```makefile
#  - 说明 : 
#    -- 当 MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE = C_TYPE 时使用 MF_CONFIGURE_C_FLAGS, 否则使用 MF_CONFIGURE_CPP_FLAGS
#    -- 建议在RELEASE版本中关闭
#    -- += -rdynamic 动态库导出符号
#  - 例子 : 
#    -- += -rdynamic
#    -- +=
#MF_CONFIGURE_C_FLAGS   += -rdynamic
#MF_CONFIGURE_CPP_FLAGS += -rdynamic
```

### 15、指定编译器

```makefile
#  - 说明 : 
#    -- 当 MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE = C_TYPE 时使用 MF_CONFIGURE_C_FLAGS, 否则使用 MF_CONFIGURE_CPP_FLAGS
#    -- += -std=c99
#    -- += -std=c++11
#  - 例子 : 
#    -- += -std=c99
#    -- += -std=c++11
#    -- +=

#MF_CONFIGURE_C_FLAGS   += -std=c99
#MF_CONFIGURE_CPP_FLAGS += -std=c++11
```

### 16、编译器优化级别

```makefile
#  - 说明 : 
#    -- 当 MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE = C_TYPE 时使用 MF_CONFIGURE_C_FLAGS, 否则使用 MF_CONFIGURE_CPP_FLAGS
#    -- += -O0 无优化，保留完整调试信息，代码执行最慢，开发调试阶段
#    -- += -O1 基础优化，轻微提升性能，不影响调试，对性能要求不高的调试版本
#    -- += -O2 中等优化，全面启用安全优化，显著提升性能，编译时间可控，发布版本的默认选择
#    -- += -O3 高度优化，可能增加代码体积和编译时间，偶有兼容性问题，代码执行速度快，高性能计算等特定场景
#  - 例子 : 
#    -- += -O2
#    -- += -O1
#    -- += -O0
#MF_CONFIGURE_C_FLAGS   += -O2
#MF_CONFIGURE_CPP_FLAGS += -O2
```

### 17、其他选项

```makefile
#  - 说明 : 
#    -- 当 MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE = C_TYPE 时使用 MF_CONFIGURE_C_FLAGS, 否则使用 MF_CONFIGURE_CPP_FLAGS
#    -- +=
#  - 例子 : 
#    -- +=
#MF_CONFIGURE_C_FLAGS   +=
#MF_CONFIGURE_CPP_FLAGS +=
```

### 18、作用于生成.o文件编译选项

```makefile
#  - 说明 : 
#    -- 当 MF_CONFIGURE_COMPILE_ORIGINAL_FILE_TYPE = C_TYPE 时使用 MF_CONFIGURE_C_OBJECTS_FLAGS, 否则使用 MF_CONFIGURE_CPP_OBJECTS_FLAGS
#    -- ?= -MMD  : 生成依赖文件, 自动生成 .d 依赖文件, 如 main.c → main.d
#    -- ?= -MP   : 在生成的 .d 文件中为每个头文件添加一个无依赖的伪目标, 当头文件被删除时，避免make报错)
#    -- ?= -fPIC : 生成位置无关代码, 用于编译动态链接库, 但这里一般不用
#  - 例子 : 
#    -- ?= -MMD -MP
#    -- ?= -MMD
#    -- ?= -MP
MF_CONFIGURE_C_OBJECTS_FLAGS   ?= -MMD -MP
MF_CONFIGURE_CPP_OBJECTS_FLAGS ?= -MMD -MP
```

### 19、编译工具配置

```makefile
# -# 指定使用的编译工具路径前缀 #
#  - 说明 : 
#    -- 默认为空
#    -- 交叉编译时必须写上编译工具路径前缀
#    -- 当为空时编译出来的程序为当前系统可执行程序
#  - 例子 : 
#    -- ?= .
#    -- ?= arm-linux-
#    -- ?= arm-linux-gnueabi-
#    -- ?= arm-linux-gnueabihf-
#    -- ?= ./tools/compile_tools/arm-linux-gnueabihf-
MF_CONFIGURE_COMPILE_PATH_PREFIX ?= 
```

### 20、平台配置

```makefile
# -# 配置makefile使用的平台 #
#  - 说明 : 
#    -- 这个决定了makefile是在哪个平台下使用的
#    -- 默认情况下为 ?= $(OS) 它可以自动识别是否在windows系统, 当然也可以直接手动指定
#    -- auto    ：$(OS)
#    -- windows ：?= WINDOWS or ?= Windows_NT
#    -- linux   ：?= LINUX   or ?=
#  - 例子 : 
#    -- ?= $(OS)
#    -- ?= WINDOWS
#    -- ?= LINUX
MF_CONFIGURE_PLATFORM_OS ?= $(OS)
```

### 21、配置工具

```makefile
# -# 配置Windows工具路径 #
#  - 说明 : 
#    -- 这项主要是针对windows中使用makefile的情况
#    -- 在linux中这项可以不配置，如 ?=
#    -- 在windows中使用makefile时，必须配置Windows工具路径
#    -- 你可以在./tools/目录下找到工具
#  - 例子 : 
#    -- ?= ./tools/windows_tools_x86/usr/bin/
#    -- ?= ./tools/windows_tools_arm/usr/bin/
#    -- ?= ./tools/windows_tools/usr/bin/
#    -- ?= ./tools
MF_CONFIGURE_WINDOWS_TOOLS ?= ./tools/windows_tools/usr/bin/

# -# 配置Linux工具路径 #
#  - 说明 : 
#    -- 这项主要是针对linux中使用makefile的情况
#    -- 在windows中这项可以不配置，如 ?=
#    -- 在linux中使用makefile时，正常情况下是不需要配置该选项的，如 ?= ，只有当你使用的系统版本过低时，一些工具指令功能不完善时才需要配置该工具路径
#    -- 你可以在./tools/目录下找到工具
#  - 例子 : 
#    -- ?= ./tools/linux_tools/usr/bin/
#    -- ?= ./tools
MF_CONFIGURE_LINUX_TOOLS ?=

# -# 配置使用的shell工具 #
#  - 说明 : 
#    -- 这个决定了makefile在执行shell命令时使用的工具
#    -- 默认情况下为 ?= SH
#  - 参数 = [SH]   使用sh来执行shell命令工具
#  - 参数 = [BASH] 使用bash来执行shell命令工具
MF_CONFIGURE_USE_SHELL_TOOLS ?= BASH
```



## 七、许可证

The MIT License (MIT)

https://mit-license.org/

Copyright © 2025 <Yezc/Makefile>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
