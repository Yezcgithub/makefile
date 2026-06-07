# GNU Make 关键字与语法

> 本文档覆盖当前版本及之前版本中常见的关键字、特殊目标、内置函数、自动变量、条件语句和文件包含等语法概念。

## 目录

1. [关键字类别概览](#关键字类别概览)
2. [变量赋值运算符](#变量赋值运算符)
3. [条件与控制指令](#条件与控制指令)
4. [文件包含与搜索路径](#文件包含与搜索路径)
5. [特殊目标](#特殊目标)
6. [内置函数](#内置函数)
7. [自动变量](#自动变量)
8. [模式规则与后缀规则](#模式规则与后缀规则)
9. [命令行特殊语法和环境](#命令行特殊语法和环境)
10. [常见保留字和约定](#常见保留字和约定)

---

## 关键字类别概览

GNU Make 的关键字不是像编程语言那样严格的保留字，而是构成 Makefile 结构的语法元素。主要类别包括：


| 类别           | 常见关键字                                                                                                                                                                                                                                                                                                                                           |
| -------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 变量赋值运算符 | `=`, `:=`, `?=`, `+=`, `::=`                                                                                                                                                                                                                                                                                                                         |
| 条件指令       | `ifeq`, `ifneq`, `ifdef`, `ifndef`, `else`, `endif`                                                                                                                                                                                                                                                                                                  |
| 文件包含       | `include`, `sinclude`, `-include`                                                                                                                                                                                                                                                                                                                    |
| 变量导出       | `export`, `unexport`                                                                                                                                                                                                                                                                                                                                 |
| 变量覆盖       | `override`, `private`                                                                                                                                                                                                                                                                                                                                |
| 定义块         | `define`, `endef`                                                                                                                                                                                                                                                                                                                                    |
| 取消定义       | `undefine`                                                                                                                                                                                                                                                                                                                                           |
| 运行时消息     | `$(error ...)`, `$(warning ...)`, `$(info ...)`                                                                                                                                                                                                                                                                                                      |
| 内置函数       | `$(subst ...)`, `$(patsubst ...)`, `$(shell ...)`, `$(foreach ...)`, `$(if ...)`, `$(call ...)`, 等。                                                                                                                                                                                                                                                |
| 特殊目标       | `.PHONY`, `.SUFFIXES`, `.DEFAULT`, `.SECONDARY`, `.PRECIOUS`, `.INTERMEDIATE`, `.NOTINTERMEDIATE`, `.DELETE_ON_ERROR`, `.IGNORE`, `.SILENT`, `.LOW_RESOLUTION_TIME`, `.ONESHELL`, `.POSIX`, `.SECONDEXPANSION`, `.EXPORT_ALL_VARIABLES`, `.NOTPARALLEL`, `.WAIT`, `.RECIPEPREFIX`, `.SHELLFLAGS`, `.DEFAULT_GOAL`, `.FEATURES`, `.INCLUDE_DIRS` 等。 |
| 自动变量       | `$@`, `$<`, `$^`, `$+`, `$?`, `$*`, `$(@D)`, `$(@F)`, 等。                                                                                                                                                                                                                                                                                           |

---

## 关键字列表

以下是 GNU Make 4.4.1 及之前版本常见关键字和语法元素的表格展示：


| 关键字类别           | 关键字                                                                                                                                                                                                                                                                                                                                        |
| -------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 赋值与变量控制关键字 | `=`, `:=`, `?=`, `+=`, `::=`, `override`, `private`, `export`, `unexport`, `define`, `endef`, `undefine`, `export VAR`, `export VAR=value`                                                                                                                                                                                                    |
| 条件与流程控制关键字 | `ifeq`, `ifneq`, `ifdef`, `ifndef`, `else`, `endif`, `$(if ...)`, `$(and ...)`, `$(or ...)`, `$(not ...)`, `$(foreach ...)`, `$(call ...)`, `$(eval ...)`, `$(let ...)`, `$(intcmp ...)`, `$(error ...)`, `$(warning ...)`, `$(info ...)`, `$(origin ...)`, `$(flavor ...)`, `$(value ...)`, `$(shell ...)`, `$(file ...)`, `$(wildcard ...)` |
| 包含与路径关键字     | `include`, `sinclude`, `-include`, `vpath`, `vpath pattern directories`                                                                                                                                                                                                                                                                       |
| 特殊目标关键字       | `.PHONY`, `.SUFFIXES`, `.DEFAULT`, `.SECONDARY`, `.PRECIOUS`, `.INTERMEDIATE`, `.NOTINTERMEDIATE`, `.DELETE_ON_ERROR`, `.IGNORE`, `.SILENT`, `.LOW_RESOLUTION_TIME`, `.ONESHELL`, `.POSIX`, `.SECONDEXPANSION`, `.EXPORT_ALL_VARIABLES`, `.NOTPARALLEL`, `.WAIT`                                                                              |
| 自动变量关键字       | `$@`, `$<`, `$^`, `$+`, `$?`, `$*`, `$%`, `$(@D)`, `$(@F)`, `$(*D)`, `$(*F)`, `$^D`, `$^F`                                                                                                                                                                                                                                                    |
| 常见目标与约定名称   | `all`, `clean`, `distclean`, `install`, `uninstall`, `check`, `test`, `help`, `rebuild`, `dist`, `tags`, `maintainer-clean`, `install-strip`, `mostlyclean`, `TAGS`, `$(MAKEFILE_LIST)`, `$(MAKECMDGOALS)`, `$(CURDIR)`, `$(MAKE_VERSION)`                                                                                                    |

---

## 变量赋值运算符

GNU Make 提供多种赋值方式，每一种都是关键语法。


| 运算符 / 关键字    | 说明                                                                  |
| ------------------ | --------------------------------------------------------------------- |
| `=`                | 普通递归展开变量赋值，延迟展开。例如：`FOO = $(BAR)`                  |
| `:=`               | 简单变量赋值，立即展开。例如：`FOO := $(BAR)`                         |
| `?=`               | 条件赋值，仅当变量未定义时赋值。例如：`FOO ?= default`                |
| `+=`               | 追加赋值，用于在现有变量基础上追加文本。例如：`FOO += extra`          |
| `::=`              | 罕见的简单赋值语法，作用与`:=` 类似。例如：`FOO ::= value`            |
| `override`         | 强制覆盖外部或命令行传入变量。例如：`override CFLAGS := -O2`          |
| `private`          | 将变量设为本地变量，避免导出到子 Make。例如：`private TMPDIR := /tmp` |
| `export`           | 导出变量到子进程和子 Make。语法：`export VAR` 或 `export VAR=value`   |
| `unexport`         | 取消导出变量。语法：`unexport VAR`                                    |
| `define` / `endef` | 定义多行变量或宏。例如：`define VAR_NAME ... endef`                   |
| `undefine`         | 删除变量定义。语法：`undefine VAR_NAME`                               |

### 变量赋值示例

```make
FOO = $(BAR)
BAR = hello

FOO2 := $(BAR)
BAR := world

TARGET ?= default_target
TARGET ?= override_target

LIST = a b
LIST += c

FOO ::= immediate_value

override CFLAGS := -O2
private TMPDIR := /tmp

export PATH
export VERSION=1.0
unexport DEBUG

define GREETING
Hello, $(1)
endef

$(info $(call GREETING,User))

undefine UNUSED_VAR
```

---

## 条件与控制指令

条件结构是 Makefile 中控制构建逻辑的重要关键字。


| 指令                         | 说明                                                                                              |
| ---------------------------- | ------------------------------------------------------------------------------------------------- |
| `ifeq` / `ifneq`             | 对两个字符串进行比较。语法：`ifeq (arg1, arg2)` 或 `ifneq (arg1, arg2)`，可使用空格或逗号分隔参数 |
| `ifdef` / `ifndef`           | 测试变量是否已定义。`ifdef VAR`：如果 `VAR` 定义，则为真；`ifndef VAR`：如果 `VAR` 未定义，则为真 |
| `else`                       | 与条件一起使用，指定 false 分支                                                                   |
| `endif`                      | 结束条件块                                                                                        |
| `$(if condition,true,false)` | 内置函数形式的条件表达式，适用于变量赋值和内联条件判断                                            |
| `$(error ...)`               | 运行时报告错误并停止构建                                                                          |
| `$(warning ...)`             | 运行时发出警告，但继续构建                                                                        |
| `$(info ...)`                | 运行时输出信息，不停止构建                                                                        |
| `$(and ...)`                 | 逻辑与操作，所有参数非空时返回最后一个参数                                                        |
| `$(or ...)`                  | 逻辑或操作，返回第一个非空参数                                                                    |
| `$(not ...)`                 | 逻辑非操作，参数为空返回`1`，非空返回空字符串                                                     |
| `$(foreach ...)`             | 循环函数，针对每个单词执行文本替换                                                                |
| `$(call ...)`                | 调用用户定义的宏或函数                                                                            |
| `$(eval ...)`                | 在解析阶段重新评估文本，动态生成规则或变量                                                        |
| `$(origin ...)`              | 查询变量来源                                                                                      |
| `$(flavor ...)`              | 查询变量类型（`recursive` 或 `simple`）                                                           |
| `$(value ...)`               | 返回变量的未展开值                                                                                |
| `$(shell ...)`               | 在 shell 中执行命令并返回输出                                                                     |
| `$(file ...)`                | 文件写入、读取、删除等操作                                                                        |
| `$(wildcard ...)`            | 查找匹配模式的文件名                                                                              |

### 条件与诊断示例

```make
ifdef DEBUG
  CFLAGS += -g
else
  CFLAGS += -O2
endif

ifeq ($(OS),Windows_NT)
  EXT := .exe
else
  EXT :=
endif

MESSAGE := $(if $(filter debug,$(MAKECMDGOALS)),Debug build,Release build)

$(warning building $(MESSAGE))
$(info origin of CFLAGS is $(origin CFLAGS))
$(info flavor of MESSAGE is $(flavor MESSAGE))
$(info raw MESSAGE text: $(value MESSAGE))

FILES := $(wildcard src/*.c)
SOURCES := $(patsubst src/%.c,%.o,$(FILES))

$(eval GENERATED := genfile)

$(file > generated.txt,generated content)

RESULT := $(intcmp 5,10,less,equal,greater)
LET_RESULT := $(let msg=world,Hello $(msg))
$(info comparison result: $(RESULT))
$(info let result: $(LET_RESULT))
```

---

## 文件包含与搜索路径

包含其它 Makefile 或定义模块时使用的关键字。


| 指令       | 说明                                                                                          |
| ---------- | --------------------------------------------------------------------------------------------- |
| `include`  | 引入一个或多个其他 Makefile 文件。语法：`include file1 file2 ...`。如果文件不存在，默认会报错 |
| `sinclude` | 与`include` 类似，但在文件缺失时忽略错误。等价于 `-include`                                   |
| `-include` | 与`sinclude` 相同，表示“如果存在则包含，否则忽略”                                           |
| `vpath`    | 设置搜索源文件的路径。语法：`vpath pattern directories`，例如：`vpath %.c src include`        |

### 包含与路径示例

```make
include common.mk -include optional.mk

vpath %.c src include

SOURCES := main.c util.c helper.c
OBJECTS := $(patsubst %.c,%.o,$(SOURCES))

all: $(OBJECTS)

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<
```

---

## 特殊目标

特殊目标是 GNU Make 的重要关键字，用于控制依赖性处理、文件生成规则和构建行为。

### 常见特殊目标


| 特殊目标                | 说明                                                                                          |
| ----------------------- | --------------------------------------------------------------------------------------------- |
| `.PHONY`                | 声明伪目标，不对应实际文件。常用于`clean`, `all`, `install` 等目标。语法：`.PHONY: clean all` |
| `.SUFFIXES`             | 定义后缀列表，用于后缀规则。语法：`.SUFFIXES: .c .o .cpp`                                     |
| `.DEFAULT`              | 为所有未显式规则的目标指定默认命令。语法：`.DEFAULT:`<br>`    @echo "No rule for $@"`         |
| `.SECONDARY`            | 防止中间文件被删除。语法：`.SECONDARY: foo.o`                                                 |
| `.PRECIOUS`             | 阻止在命令失败时删除目标文件。语法：`.PRECIOUS: %.o`                                          |
| `.INTERMEDIATE`         | 标记中间文件，这类文件在构建结束后可能会被删除。                                              |
| `.NOTINTERMEDIATE`      | 取消对特定文件或模式的中间文件处理，使其不被视为中间文件。（引入于 v4.4）                     |
| `.DELETE_ON_ERROR`      | 如果命令失败，删除目标文件。语法：`.DELETE_ON_ERROR:`                                         |
| `.IGNORE`               | 忽略规则执行失败。语法：`.IGNORE:` 或在命令前加 `-`。                                         |
| `.SILENT`               | 静默执行规则，不打印命令。语法：`.SILENT:` 或 `@command`                                      |
| `.LOW_RESOLUTION_TIME`  | 使用低分辨率时间戳以改善远程文件系统行为。语法：`.LOW_RESOLUTION_TIME:`                       |
| `.ONESHELL`             | 将每个规则的所有命令作为一个 shell 执行。语法：`.ONESHELL:`（引入于 v3.82）。                 |
| `.POSIX`                | 启用 POSIX 模式，限制某些 GNU Make 扩展。语法：`.POSIX:`                                      |
| `.SECONDEXPANSION`      | 启用第二次展开规则依赖和命令中的`$$()` 语法。语法：`.SECONDEXPANSION:`（引入于 v3.81）。      |
| `.EXPORT_ALL_VARIABLES` | 导出所有变量到子进程。语法：`.EXPORT_ALL_VARIABLES:`                                          |
| `.NOTPARALLEL`          | 禁止并行构建。语法：`.NOTPARALLEL:`（引入于 v3.82；对其依赖支持于 v4.4 引入）。           |
| `.WAIT`                 | 控制并行构建中的命令顺序依赖。语法：`.WAIT`（引入于 v4.4）。                                  |

### 特殊目标示例

```make
.PHONY: all clean
.PRECIOUS: %.o
.SECONDARY: intermediate.o
.NOTINTERMEDIATE: intermediate.o
.ONESHELL:
.NOTPARALLEL:

all: prog

prog: main.o lib.o
	$(CC) -o $@ $^

main.o: main.c
	$(CC) -c -o $@ $<

clean:
	rm -f prog *.o generated.txt

intermediate.o: intermediate.c
	$(CC) -c -o $@ $<

.DEFAULT:
	@echo "No explicit rule for $@"
```

### 目标特定变量示例

```make
prog: CFLAGS += -O2
prog: LDFLAGS += -lm

debug: CFLAGS += -g
```

### 并行与顺序示例

```make
parallel: step1 step2

step1:
	@echo step1

step2:
	@echo step2

serial: step1 .WAIT step2
```

### 第二次展开示例

```make
.SECONDEXPANSION:

files := a b

a $$(files):
	@echo second expansion for $@
```

### 目标特定特殊变量

这些特殊变量用于定义目标特定变量或模式规则的依赖项：


| 语法                        | 说明                           |
| --------------------------- | ------------------------------ |
| `target: variable = value`  | 对指定目标进行递归展开变量赋值 |
| `target: variable := value` | 对指定目标进行简单变量赋值     |
| `target: variable ?= value` | 仅当变量未定义时对指定目标赋值 |
| `target: variable += value` | 对指定目标的变量追加值         |

例如：

```make
prog: CFLAGS += -O2
```

---

## 内置函数

GNU Make 内置函数数量众多，按功能可分为文本处理、条件判断、文件查找、函数调用、循环、算术与类型查询等。

### 1. 文本处理函数


| 函数                                   | 说明                                                 |
| -------------------------------------- | ---------------------------------------------------- |
| `$(subst from,to,text)`                | 文本替换函数。例如：`$(subst .c,.o,$(SOURCES))`      |
| `$(patsubst pattern,replacement,text)` | 模式替换函数。例如：`$(patsubst %.c,%.o,$(SOURCES))` |
| `$(strip string)`                      | 删除字符串前后多余空白，并将连续空白压缩为单个空格   |
| `$(findstring find,in)`                | 如果`find` 出现在 `in` 中，则返回 `find`             |
| `$(filter pattern...,text)`            | 返回匹配模式的单词                                   |
| `$(filter-out pattern...,text)`        | 返回不匹配模式的单词                                 |
| `$(sort list)`                         | 对单词排序并去除重复                                 |
| `$(word n,text)`                       | 返回第 n 个单词                                      |
| `$(wordlist s,e,text)`                 | 返回第 s 到 e 个单词                                 |
| `$(words text)`                        | 返回单词数                                           |
| `$(firstword text)`                    | 返回第一个单词                                       |
| `$(lastword text)`                     | 返回最后一个单词                                     |
| `$(dir names...)`                      | 返回每个名字的目录部分                               |
| `$(notdir names...)`                   | 返回每个名字的文件名部分                             |
| `$(suffix names...)`                   | 返回每个名字的后缀                                   |
| `$(basename names...)`                 | 返回每个名字的基础名                                 |
| `$(addprefix prefix,names...)`         | 为每个名字添加前缀                                   |
| `$(abspath names...)`                  | 返回每个名字的绝对路径，规范化`.` 和 `..`            |
| `$(addsuffix suffix,names...)`         | 为每个名字添加后缀                                   |
| `$(join list1,list2)`                  | 将两个列表按位置拼接                                 |
| `$(wildcard pattern...)`               | 扩展文件名模式                                       |
| `$(realpath names...)`                 | 归一化路径，移除`.` 和 `..`                          |

#### 文本处理函数示例

```make
SRCS := main.c util.c helper.c
OBJS := $(patsubst %.c,%.o,$(SRCS))
OBJS += extra.o

CLEANED := $(strip $(OBJS))
SRC_DIRS := src include lib
FILES := $(wildcard src/*.c)
FILTERED := $(filter %.c %.h,$(FILES))
SORTED := $(sort $(OBJS) $(OBJS))
NAME := $(basename main.c)
EXT := $(suffix main.c)
DIR := $(dir src/main.c)
FILE := $(notdir src/main.c)
ABSP := $(abspath src/../src/main.c)
JOINED := $(join a b,c d)
```

### 2. 文件与环境函数


| 函数                                 | 说明                                                                                               |
| ------------------------------------ | -------------------------------------------------------------------------------------------------- |
| `$(file operation,filename,text...)` | 直接操作文件系统，例如写文件。常见操作：`>`, `>>`, `<`, `DELETE`                                   |
| `$(wildcard pattern...)`             | 查找匹配模式的文件名                                                                               |
| `$(origin variable)`                 | 返回变量的来源类型（`default`, `environment`, `file`, `command line`, `override`, `automatic` 等） |
| `$(flavor variable)`                 | 返回变量的类型：`recursive` 或 `simple`                                                            |
| `$(shell command)`                   | 在 shell 中执行命令并返回输出                                                                      |
| `$(error text)`                      | 抛出错误并停止构建                                                                                 |
| `$(warning text)`                    | 输出警告，不停止构建                                                                               |
| `$(info text)`                       | 输出信息，不停止构建                                                                               |

#### 文件与环境函数示例

```make
HOSTNAME := $(shell hostname)
NOW := $(shell date +%Y-%m-%d)

$(info building on $(HOSTNAME) at $(NOW))

VAR := value

typedefs := $(origin VAR) $(flavor VAR)
$(info VAR origin=$(origin VAR) flavor=$(flavor VAR))

$(file > config.txt,CONFIG_VALUE=$(VAR))

ifeq ($(origin UNDEF_VAR),default)
  $(warning UNDEF_VAR is using default origin)
endif
```

### 3. 条件与流程控制函数


| 函数                                            | 说明                                                  |
| ----------------------------------------------- | ----------------------------------------------------- |
| `$(if condition,then-part[,else-part])`         | 条件函数，可在变量赋值时构建条件逻辑                  |
| `$(and arg1,arg2,...)`                          | 逻辑与，所有参数非空时返回最后一个参数                |
| `$(or arg1,arg2,...)`                           | 逻辑或，返回第一个非空参数                            |
| `$(not arg)`                                    | 逻辑非，参数为空返回`1`，非空返回空字符串             |
| `$(foreach var,list,text)`                      | 循环函数，针对每个单词执行文本替换                    |
| `$(call variable,param1,param2,...)`            | 调用用户定义的宏或函数                                |
| `$(eval text)`                                  | 在解析阶段重新评估文本，动态生成规则或变量            |
| `$(value variable)`                             | 返回变量的未展开值                                    |
| `$(let variable=value,text)`                    | 在用户定义宏中创建局部变量并限制作用域。（引入于 v4.4） |
| `$(intcmp arg1,arg2,less,equal,greater)`        | 基于数值比较的条件函数。（引入于 v4.4）                 |
| `$(file ...)`                                   | 文件写入、读取、删除等操作                            |
| `$(error ...)`, `$(warning ...)`, `$(info ...)` | 运行时诊断与输出函数                                  |

### 4. 数学与字符串长度函数


| 函数                            | 说明                                                        |
| ------------------------------- | ----------------------------------------------------------- |
| `$(shell expr)`                 | 通过 shell 命令计算值，常用于数学表达式                     |
| GNU Make 本身没有专门的算术函数 | 通常通过`$(shell ...)` 调用 `expr`, `printf` 或其他工具实现 |

### 5. 变量查询与修饰函数


| 函数            | 说明                   |
| --------------- | ---------------------- |
| `$(origin var)` | 查询变量来源           |
| `$(flavor var)` | 查询变量类型           |
| `$(value var)`  | 获取变量原始文本       |
| `$(call ...)`   | 动态宏调用             |
| `$(eval ...)`   | 动态生成 Makefile 内容 |

---

## 自动变量

自动变量只在规则命令中有效，通常表示规则的目标、依赖和文件名信息。


| 自动变量                      | 说明                                                                                                          |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `$@`                          | 当前目标文件名                                                                                                |
| `$%`                          | 在成员目标规则中表示归档成员名                                                                                |
| `$<`                          | 第一个依赖文件名。对于模式规则，通常为第一个匹配的依赖                                                        |
| `$^`                          | 所有依赖文件名，重复依赖会被省略                                                                              |
| `$+`                          | 所有依赖文件名，保留重复依赖                                                                                  |
| `$?`                          | 比目标新的依赖文件名列表                                                                                      |
| `$*`                          | 目标的主干名称（不包含后缀）                                                                                  |
| `$(@D)`                       | 目标目录部分                                                                                                  |
| `$(@F)`                       | 目标文件名部分                                                                                                |
| `$<D`, `$<F`, `$^D`, `$^F` 等 | GNU Make 4.4.1 开始支持自动变量修饰符，用于提取目录、文件名、后缀等。例如：`$(@D)`、`$(@F)`、`$(*F)`、`$(*D)` |

### 自动变量示例

```make
objects := src/main.o src/util.o

all: $(objects)
	@echo built $^

src/%.o: src/%.c
	$(CC) -c $(CFLAGS) -o $@ $<
	@echo target=$@ dir=$(@D) file=$(@F)
	@echo prereqs=$^ first=$< diff=$?

archive.a: src/main.o src/util.o
	ar rcs $@ $^

member: lib(a.o)
	@echo member archive $%
```

---

## 模式规则与后缀规则

模式规则和后缀规则本身不是单个关键词，但构成 Makefile 语法的重要部分。

### 模式规则语法

- 目标模式：`%.o: %.c`
- 多目标模式：`lib%.a foo%.o: %.c`
- 隐含依赖：`%.o: %.c %.h`
- 命令序列：
  ```make
  %.o: %.c
      $(CC) -c $(CFLAGS) -o $@ $<
  ```

### 静态模式规则

- `targets...: target-pattern: prerequisites...`
- 示例：
  ```make
  objects := foo.o bar.o
  $(objects): %.o: %.c
      $(CC) -c $(CFLAGS) -o $@ $<
  ```

### 后缀规则（旧式）

- 以 `.SUFFIXES` 定义后缀列表
- 规则形式：`.c.o:`
- 示例：
  ```make
  .SUFFIXES: .c .o
  .c.o:
      $(CC) -c $(CFLAGS) -o $@ $<
  ```

### 静态模式与模式规则关键语法

- `pattern: prerequisites`
- `target-pattern: target-pattern: prerequisites`
- `pattern-specific variable assignment`

---

## 命令行特殊语法和环境

GNU Make 在命令行和环境中也存在一些关键语法：

- 命令行变量定义：`make VAR=value`
- 变量来源优先级：命令行 > `override` > Makefile > 环境 > 默认值
- 伪目标语法：`.PHONY: name`
- 隐式命令前缀：`@`, `-`, `+`

  - `@`：不显示命令本身
  - `-`：忽略命令失败
  - `+`：即使不是并行构建也强制执行命令
- 并行构建控制：`-j`, `--jobs`

  - 这不是 Makefile 关键字，但与并行目标和 `.NOTPARALLEL`、`.WAIT` 配合使用
 - MAKE_TMPDIR 环境变量：用于指定 GNU Make 的临时目录。（引入于 v4.4）
 - `.RECIPEPREFIX` 特殊变量：可以更改 Makefile 中配方行的前缀字符，例如使用 `+` 而不是 TAB。（引入于 v3.82）
 - `.SHELLFLAGS` 特殊变量：设置 GNU Make 调用 shell 时传入的选项，例如 `-c` 或 `-ec`。（引入于 v3.82）
 - `.DEFAULT_GOAL` 特殊变量：指定默认目标，当命令行未提供目标时使用。（引入于 v3.81）
 - `.FEATURES` 特殊变量：列出当前 GNU Make 版本支持的特性。（引入于 v3.81）
 - `.INCLUDE_DIRS` 特殊变量：列出 GNU Make 搜索包含文件时使用的目录。（引入于 v3.81）
- 递归 Make 关键字：`$(MAKE)`

  - 代表当前的 Make 程序，用于递归调用子 Make

---

## 常见保留字和约定

本文档还列出一些在 GNU Make 文件中通常作为关键字或保留语义使用的名称：

- `all`

  - 常见默认目标名称，不是 Make 关键字，但约定用于默认构建目标
- `clean`, `distclean`, `install`, `uninstall`, `check`, `test`

  - 这些是惯用目标名称
- `$(MAKEFILES)`

  - 自动变量，列出所有包含的 Makefile 文件
- `$(MAKECMDGOALS)`

  - 自动变量，包含命令行目标列表
- `$(CURDIR)`

  - 自动变量，当前工作目录
- `$(MAKE_VERSION)`

  - 自动变量，当前 Make 版本
- `$(COMPILE)`, `$(CC)`, `$(CFLAGS)`, `$(LDFLAGS)`

  - 不是保留关键字，但在 Makefile 中为公认约定变量名

---

## 结语

本文档按类别列出了 GNU Make 4.4.1 及之前版本中常见的关键字、特殊目标、内置函数、自动变量和语法结构。对于写 Makefile 和阅读现有构建脚本，这些关键字和语法是最常见、最重要的部分。
