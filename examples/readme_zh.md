# 示例项目概述

本目录包含一系列示例项目，演示如何使用 Makefile 系统。每个示例展示不同的功能和使用场景。

## 一、示例列表

### 01.UseDirectlyWithoutConfiguration
**描述：** 最基础的示例，展示在没有额外配置或脚本支持下使用 `Makefile` 进行项目组织与构建的方法。适合作为入门参考。

**包含内容：**
- 子目录 `src/` 下的多种功能模块（如 `addition/`、`subtraction/`、`multiplication/`、`division/` 等）。
- 通过一个顶层 `Makefile` 演示源文件收集、编译与链接的基本流程。

**注意事项：**
- 适配跨平台编译（Makefile 使用标准变量，便于在 Linux、macOS 与 MinGW 下工作）。

**详细说明：**
- **目标：** 教会如何用最小配置把多个源文件组织成可编译的程序并理解 Makefile 的基本规则与变量。
- **主要文件：** `Makefile`、`src/` 下的各模块源文件（如 `addition/*.c`）、公共头文件 `inc/`（若存在）。
- **关键 Make 变量：** `CC`（编译器）、`CFLAGS`（编译选项）、`LDFLAGS`（链接选项）、`OBJDIR`（目标对象目录）。
- **构建产物：** 可执行文件（通常放在 `bin/` 或顶层目录）。
- **验证：** 编译无错误且生成预期的可执行文件，运行例程应打印示例输出或返回预期状态码。


### 02.CreateDynamicLibrary
**描述：** 演示如何把一组源文件打包为动态/共享库，并在示例程序中动态链接与调用这些库函数。

**包含内容：**
- 示例动态库源码（常见的数学与工具函数），以及用于生成 `.so`/`.dll` 的 `Makefile` 规则。
- 提供调用示例，说明库导出与头文件组织方式。

**注意事项：**
- 包含跨平台导出符号与编译选项的说明（例如 Windows 下需要导出宏，Linux 下使用 `-fPIC`）。

**详细说明：**
- **目标：** 演示构建可被多个程序在运行时共享的库，以及如何组织头文件与导出符。
- **主要文件：** 库源 `src/*.c`、库头 `inc/*.h`、`Makefile`（生成 `.so`/`.dll`）、示例调用程序 `example/`（若存在）。
- **关键 Make 变量：** `SHARED_FLAGS`（例如 `-fPIC`）、`SONAME`/`DLL_NAME`、`PREFIX`（安装路径）。
- **构建产物：** 动态库（`lib*.so`、`*.dll`）与示例可执行文件。
- **验证：** 链接示例程序时确保运行时能找到库（LD_LIBRARY_PATH / PATH 或安装到标准位置），函数调用返回正确结果。


### 03.CreateStaticLibrary
**描述：** 演示如何创建静态库并在编译期将其链接到可执行文件中，适用于需要静态链接或无需运行时库依赖的场景。

**包含内容：**
- 静态库源码与 `Makefile` 规则，展示 `ar`/`ranlib` 的用法和静态库组织。
- 示例主程序展示如何在链接阶段使用 `-L`/`-l` 选项。

**注意事项：**
- 在 Windows 下可能生成 `.lib`，在 Unix-like 平台生成 `.a`。

**详细说明：**
- **目标：** 说明如何使用 `ar`/`ranlib` 创建静态库并在编译阶段链接以生成最终可执行文件。
- **主要文件：** 源文件、库头 `inc/`、`Makefile`（包含 `ar` 规则）、示例主程序。
- **关键 Make 变量：** `AR`、`ARFLAGS`、`LIBNAME`、`LIBDIR`。
- **构建产物：** 静态库（`lib*.a` 或 `.lib`）和使用该库的可执行文件。
- **验证：** 链接阶段成功，无运行时依赖，最终可执行文件大小与预期一致且功能正常。


### 04.UseStandardLibrary
**描述：** 展示如何在示例程序中合理使用 C 标准库函数和常见系统库（例如时间、字符串、I/O、数学等）。

**包含内容：**
- 小型示例程序，演示 `stdio.h`、`stdlib.h`、`string.h`、`time.h` 等的典型用法。

**注意事项：**
- 侧重可移植写法，避免使用平台特有的 API，或在注释中给出替代方案。

**详细说明：**
- **目标：** 教导正确使用标准头和函数、错误处理及跨平台兼容写法。
- **主要文件：** 若干小示例源文件（例如 `print_calendar.c`、`print_ascii_art.c`）和对应头文件。
- **关键 Make 变量：** `CFLAGS`（开启警告与标准，如 `-std=c11 -Wall -Wextra`）。
- **构建产物：** 多个小可执行工具以展示不同标准库功能。
- **验证：** 运行示例工具输出符合注释说明，且在不同平台上能正确编译运行。


### 05.CreateLibraryAndUseLibrary
**描述：** 组合示例：先构建若干库（例如 `calculator`、`printall`），再在主程序中分别链接和调用这些库，展示库间依赖管理与分层构建。

**包含内容：**
- `lib/` 子目录下的库工程与 `src/` 下的主程序。
- 演示如何编写子 Makefile 并在顶层 Makefile 中调用以实现增量构建。

**注意事项：**
- 演示静态/动态两种链接方式并说明优缺点。

**详细说明：**
- **目标：** 演示如何分离库与应用、管理库依赖并进行分层构建。
- **主要文件：** `lib/calculator/`、`lib/printall/` 下的源和子 `Makefile`，顶层 `Makefile` 用于协调构建顺序。
- **关键 Make 变量：** `SUBDIRS`（子模块列表）、`PREFIX`、`LIBS`（链接时使用的库列表）。
- **构建产物：** 各库产物（静态或动态）和最终主程序。
- **验证：** 增量构建：修改库源码应只重建库与依赖目标，而非全量重建。


### 06.MixedDevelopmentOfCAndCPP
**描述：** 演示在同一工程中混合使用 C 和 C++ 源文件的实践，包括跨语言接口、`extern "C"` 的使用及名称修饰管理。

**包含内容：**
- 同时包含 `.c` 与 `.cpp` 源文件，演示单独编译后链接，以及如何在头文件中处理 C/C++ 兼容性。

**注意事项：**
- 提示在链接时选择正确的链接器（g++ 用于 C++ 链接以正确处理标准库）。

**详细说明：**
- **目标：** 演示如何安全地在同一项目中使用 C 和 C++，并正确处理头文件声明以避免名称修饰问题。
- **主要文件：** `.c` 与 `.cpp` 源、兼容头 `inc/`（使用 `#ifdef __cplusplus`/`extern "C"`）。
- **关键 Make 变量：** `CC`（C 编译器）、`CXX`（C++ 编译器）、`CFLAGS`、`CXXFLAGS`。
- **构建产物：** 混合链接的可执行文件。
- **验证：** 确认 C++ 链接器用于链接步骤，并测试跨语言接口调用是否正确。


### 07.SetMacroInformation
**描述：** 演示如何通过 Makefile 与脚本设置编译时宏和版本信息（例如通过 `-D` 定义宏、通过脚本注入版本号）。

**包含内容：**
- 示例 Makefile 展示宏定义的传递、条件编译以及基于版本号的构建规则。

**注意事项：**
- 说明如何在 CI 或自动化脚本中传入构建参数。

**详细说明：**
- **目标：** 让用户了解如何把版本号、构建时间等元信息注入到编译产物中，以便运行时或日志中使用。
- **主要文件：** 生成版本头的脚本 `tools/gen_version.sh`（或 `gen_version.bat`）、`Makefile` 中的规则。
- **关键 Make 变量：** `VERSION`、`BUILD_DATE`、`GIT_COMMIT`（可通过脚本生成并写入头文件）。
- **构建产物：** 包含版本信息的头文件（如 `inc/version.h`）及使用该头文件编译的二进制。
- **验证：** 在程序输出或 `--version` 信息中能看到注入的版本/构建时间。


### 08.UsingSimpleScript
**描述：** 展示使用简单的 shell/batch 脚本来辅助构建、清理或打包操作（提供 `build.sh` 与 `build.bat`）。

**包含内容：**
- 跨平台脚本示例，演示在 Windows/Unix 环境下的差异处理与常用选项。

**详细说明：**
- **目标：** 通过脚本展示如何在不同平台上统一构建流程、处理清理与打包步骤。
- **主要文件：** `build.sh`、`build.bat`、`clean.sh`（或 `clean.bat`）。
- **关键 Make 变量：** 脚本中常用的 `BUILD_TYPE`、`TARGET_DIR` 等。
- **构建产物：** 打包文件（如 `tar.gz` 或 `zip`）和构建产物目录。
- **验证：** 脚本执行完成后能在目标目录找到打包文件或可执行产物。


### 09.CreateLibraryAndUsingScript
**描述：** 结合脚本与库构建的示例，展示如何用脚本自动化构建库并将其集成到主项目中。

**包含内容：**
- 示例脚本、库源码和顶层 Makefile 的协作示例。

**详细说明：**
- **目标：** 展示自动化流程：先用脚本或子 Makefile 构建库，然后将库安装到本地目录供主程序使用。
- **主要文件：** 库脚本 `scripts/build_lib.sh`、子 `Makefile`、安装目标 `install`。
- **关键 Make 变量：** `INSTALL_PREFIX`、`DESTDIR`、`LIB_INSTALL_DIR`。
- **构建产物：** 安装到本地目录的库文件与头文件。
- **验证：** 主程序能从 `INSTALL_PREFIX` 指定的路径找到并链接该库。


### 10.UsingScriptSetMacroInformation
**描述：** 演示如何使用脚本在构建前生成或修改源文件/头文件中的宏信息（例如构建时间、版本号、编译选项）。

**详细说明：**
- **目标：** 通过预处理脚本自动生成带宏定义的头文件，以使构建产物携带元信息。
- **主要文件：** 生成脚本、模板头 `version.h.in`、生成后的 `version.h`。
- **关键 Make 变量：** `VERSION_TEMPLATE`、`GEN_SCRIPT`。
- **验证：** 编译后的程序在查询版本信息时显示由脚本生成的数据。


### 11.UsingScriptConfiguration
**描述：** 展示更复杂的脚本化配置流程，包含 `inc/`、`main/`、`src/` 等分层目录，用脚本生成配置头和选择性启用模块。

**详细说明：**
- **目标：** 演示通过脚本在构建前选择模块、生成配置文件并控制编译选项。
- **主要文件：** 配置脚本 `configure.sh`/`configure.bat`、生成的 `config.h`、模块目录。
- **关键 Make 变量：** `ENABLE_FEATURE_X`、`CONFIG_HEADER`。
- **验证：** 根据配置开启或禁用模块，构建产物大小和功能随之变化。


### 12.MultipleMakefileSubFilesAreUsed
**描述：** 演示将项目拆分为多个子 Makefile（例如 `comm/`, `inc/`, `src/`），通过顶层 Makefile 协调子模块构建。

**详细说明：**
- **目标：** 介绍如何管理大型项目的构建，把子模块分散到各自目录并由顶层 Makefile 协调。
- **主要文件：** 各子目录的 `Makefile`、顶层 `Makefile`、`sub_makefile/` 辅助包含文件。
- **关键 Make 变量：** `SUBDIRS`、`INCLUDES`、`VPATH`。
- **验证：** 子模块单独构建与顶层协调构建都能成功，且依赖关系被正确处理。


### 13.CreateLibraryAndMultipleMakefileSubFilesAreUsed
**描述：** 将库创建与多子 Makefile 结构结合的示例，展示模块化组织与局部库的管理。

**详细说明：**
- **目标：** 演示在模块化项目中创建库并管理各子模块的构建规则。
- **主要文件：** 各模块源码与子 Makefile、顶层整合脚本。
- **关键 Make 变量：** `MODULES`、`LIBPATHS`、`DEPENDENCIES`。
- **验证：** 能按模块进行增量构建，并正确链接各模块库。


### 14.UsingMultipleSubMakefileAndScriptConfiguration
**描述：** 结合多子 Makefile 与脚本化配置的复杂示例，适用于大型或多模块工程结构。

**详细说明：**
- **目标：** 展示复杂工程中脚本与多级 Makefile 的协同使用，以实现可配置、可扩展的构建系统。
- **主要文件：** 多级 `Makefile`、配置脚本、模块清单文件。
- **关键 Make 变量：** `CONFIG_FILES`、`TARGET_MODULES`、`BUILD_PROFILE`。
- **验证：** 根据不同 `BUILD_PROFILE` 能生成不同特性的构建产物。


### 15.IncludesSettingParentSourceCodeDirectory
**描述：** 演示在 Makefile 中设置包含父目录源代码路径的做法，适合把通用代码放在上级目录并在多个示例中复用的场景。

**详细说明：**
- **目标：** 说明如何在子目录的 Makefile 中通过 `VPATH` 或 `-I` 包含上级通用代码与头文件。
- **主要文件：** 通用代码目录（可能位于仓库根或 `../common`）、子目录 Makefile。
- **关键 Make 变量：** `VPATH`、`INCLUDE_DIRS`、`COMMON_DIR`。
- **验证：** 子目录能成功引用并编译父目录的源文件或头文件。


## 包含的工具
- `tools/windows_tools/`: 包含 Windows 构建工具，包括 MinGW 实用程序

## 项目结构概览
- `example/`: 示例集合，每个子目录为一个自包含示例。
- `tools/windows_tools/`: Windows 平台相关的构建辅助工具和脚本。

## 二、许可证

The MIT License (MIT)

https://mit-license.org/

Copyright © 2025 <Yezc/Makefile>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
