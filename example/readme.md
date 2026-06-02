# Examples Overview

This directory contains a collection of examples demonstrating how to use the Makefile system. Each example showcases different features and use cases.

## 1. List of Examples

### 01.UseDirectlyWithoutConfiguration
**Description:** The most basic example, showing how to organize and build a project with a `Makefile` without extra scripts or configuration. Good as an introductory reference.

**Includes:**
- Multiple feature modules under `src/` (e.g. `addition/`, `subtraction/`, `multiplication/`, `division/`).
- A top-level `Makefile` demonstrating source discovery, compilation, and linking.

**Notes:**
- Makefile uses standard variables so it can be adapted to Linux, macOS, and MinGW environments.

**Details:**
- **Goal:** Teach how to organize multiple source files into a buildable program with minimal configuration and understand common Makefile rules/variables.
- **Key files:** `Makefile`, module sources under `src/` (e.g. `addition/*.c`), common headers under `inc/` if present.
- **Important Make variables:** `CC`, `CFLAGS`, `LDFLAGS`, `OBJDIR`.
- **Artifacts:** Executable(s) typically placed in `bin/` or at top-level.
- **Verification:** Build completes without errors and produces expected binaries that run and produce sample outputs.


### 02.CreateDynamicLibrary
**Description:** Demonstrates how to package a set of source files into a dynamic/shared library and how to link and call the library from example programs.

**Includes:**
- Dynamic library source code (math and utility functions) and Makefile rules to produce `.so`/`.dll`.
- Example callers and header organization to demonstrate exported symbols.

**Notes:**
- Covers cross-platform export macros and build flags (e.g. `-fPIC` on Unix, export macros on Windows).

**Details:**
- **Goal:** Demonstrate building runtime-shared libraries and organizing headers and exported symbols.
- **Key files:** library sources `src/*.c`, public headers `inc/*.h`, `Makefile` that builds `.so`/`.dll`, and example callers under `example/` if present.
- **Important Make variables:** `SHARED_FLAGS` (e.g. `-fPIC`), `SONAME`/`DLL_NAME`, `PREFIX`.
- **Artifacts:** Dynamic libs (`lib*.so`, `*.dll`) and example executables.
- **Verification:** Example programs can link at runtime (via LD_LIBRARY_PATH/PATH or installed locations) and function calls return expected results.


### 03.CreateStaticLibrary
**Description:** Demonstrates creating a static library and linking it into an executable at build time—useful when avoiding runtime dependencies.

**Includes:**
- Static library sources and Makefile examples using `ar`/`ranlib`.
- Sample main showing `-L`/`-l` linkage.

**Notes:**
- On Windows static libraries may be `.lib`, while on Unix-like systems they are `.a`.

**Details:**
- **Goal:** Show how to create static archives using `ar`/`ranlib` and link them into final executables.
- **Key files:** source files, library headers under `inc/`, `Makefile` with `ar` rules, sample main program.
- **Important Make variables:** `AR`, `ARFLAGS`, `LIBNAME`, `LIBDIR`.
- **Artifacts:** static library files (`lib*.a` or `.lib`) and executables that link against them.
- **Verification:** Link phase succeeds with no runtime dependency on the library, and the executable behaves as expected.


### 04.UseStandardLibrary
**Description:** Examples showing idiomatic use of the C standard library and common system headers (time, string, I/O, math, etc.).

**Includes:**
- Small programs demonstrating `stdio.h`, `stdlib.h`, `string.h`, `time.h` usage patterns.

**Notes:**
- Emphasizes portable code and suggests alternatives for platform-specific APIs.

**Details:**
- **Goal:** Teach correct usage of standard headers and functions, error handling, and portable patterns.
- **Key files:** small example programs (e.g. `print_calendar.c`, `print_ascii_art.c`) and headers.
- **Important Make variables:** `CFLAGS` (recommend `-std=c11 -Wall -Wextra`).
- **Artifacts:** small utilities/executables demonstrating library features.
- **Verification:** Run sample tools and confirm outputs match documented examples across platforms.


### 05.CreateLibraryAndUseLibrary
**Description:** A composite example: build several libraries (e.g. `calculator`, `printall`) and use them in a main program, illustrating dependency management and layered builds.

**Includes:**
- `lib/` libraries and a `src/` main program.
- Sub-Makefiles demonstrating incremental builds from subprojects.

**Notes:**
- Shows both static and dynamic linking approaches and discusses trade-offs.

**Details:**
- **Goal:** Demonstrate separating libraries from applications, managing dependencies, and layered builds.
- **Key files:** `lib/calculator/`, `lib/printall/` with sources and sub-`Makefile`s; a top-level `Makefile` coordinating build order.
- **Important Make variables:** `SUBDIRS`, `PREFIX`, `LIBS`.
- **Artifacts:** library artifacts and a final main program executable.
- **Verification:** Incremental builds work: changing a library only rebuilds dependent targets.


### 06.MixedDevelopmentOfCAndCPP
**Description:** Demonstrates mixing C and C++ sources within one project, covering cross-language interfaces, `extern "C"`, and name-mangling considerations.

**Includes:**
- Both `.c` and `.cpp` files, compiled separately and linked together; headers illustrating compatibility.

**Notes:**
- Use the C++ linker (g++) when linking C++ objects to ensure standard library linkage.

**Details:**
- **Goal:** Show how to safely use C and C++ together and properly handle headers to avoid name mangling issues.
- **Key files:** `.c` and `.cpp` sources and compatibility headers using `#ifdef __cplusplus`/`extern "C"`.
- **Important Make variables:** `CC` (C compiler), `CXX` (C++ compiler), `CFLAGS`, `CXXFLAGS`.
- **Artifacts:** mixed-language executable.
- **Verification:** Ensure `g++` (or equivalent) is used for linking and cross-language calls succeed.


### 07.SetMacroInformation
**Description:** Demonstrates how to set compile-time macros and inject version/build metadata into sources via `-D` flags or scripts.

**Includes:**
- Makefile patterns demonstrating macro propagation and conditional compilation based on version or build type.

**Notes:**
- Useful for CI scripts to pass build-time parameters.

**Details:**
- **Goal:** Let users know how to inject version number, build time and other metadata into build artifacts for runtime or logging use.
- **Key files:** version generation scripts `tools/gen_version.sh` (or `gen_version.bat`), `Makefile` rules.
- **Important Make variables:** `VERSION`, `BUILD_DATE`, `GIT_COMMIT` (can be generated by script and written into a header).
- **Artifacts:** header containing version info (e.g. `inc/version.h`) and binaries built using that header.
- **Verification:** Version/build-time appears in program output or `--version` information.


### 08.UsingSimpleScript
**Description:** Demonstrates using simple shell/batch scripts to assist building, cleaning, or packaging (provides `build.sh` and `build.bat`).

**Includes:**
- Cross-platform script examples showing differences and common options between Windows/Unix environments.

**Details:**
- **Goal:** Use scripts to unify build, clean and packaging steps across platforms.
- **Key files:** `build.sh`, `build.bat`, `clean.sh` (or `clean.bat`).
- **Important Make variables:** script-level variables like `BUILD_TYPE`, `TARGET_DIR`.
- **Artifacts:** packaged archives (e.g. `tar.gz` or `zip`) and build output directories.
- **Verification:** Scripts complete and place expected artifacts in target directories.


### 09.CreateLibraryAndUsingScript
**Description:** Combines scripting with library builds to automate library creation and integration into a main project.

**Includes:**
- Example scripts, library sources and top-level Makefile coordination.

**Details:**
- **Goal:** Demonstrate an automated flow: build library artifacts (via script or sub-Makefile), install them to a local prefix, and consume them in the main project.
- **Key files:** library build script `scripts/build_lib.sh`, sub-`Makefile`s, `install` target.
- **Important Make variables:** `INSTALL_PREFIX`, `DESTDIR`, `LIB_INSTALL_DIR`.
- **Artifacts:** libraries and headers installed to `INSTALL_PREFIX`.
- **Verification:** Main project can locate and link against installed libraries.


### 10.UsingScriptSetMacroInformation
**Description:** Demonstrates how to use scripts to generate or modify source/header macros before build (e.g. build time, version, compile options).

**Details:**
- **Goal:** Pre-generate headers with macro definitions so the build artifacts embed metadata.
- **Key files:** generator scripts, template header `version.h.in`, generated `version.h`.
- **Important Make variables:** `VERSION_TEMPLATE`, `GEN_SCRIPT`.
- **Verification:** Compiled program reports the script-generated metadata when queried.


### 11.UsingScriptConfiguration
**Description:** Shows a more advanced scripted configuration flow with layered directories (`inc/`, `main/`, `src/`) and script-generated config headers to enable/disable modules.

**Details:**
- **Goal:** Demonstrate choosing modules and generating configuration headers before build.
- **Key files:** configuration scripts `configure.sh`/`configure.bat`, generated `config.h`, module directories.
- **Important Make variables:** `ENABLE_FEATURE_X`, `CONFIG_HEADER`.
- **Artifacts:** build outputs reflecting enabled/disabled modules.
- **Verification:** Different configure options produce binaries with different features enabled.


### 12.MultipleMakefileSubFilesAreUsed
**Description:** Demonstrates splitting a project into multiple sub-Makefiles (e.g. `comm/`, `inc/`, `src/`) coordinated by a top-level Makefile.

**Details:**
- **Goal:** Show how to manage large builds by delegating to per-module Makefiles and including shared settings.
- **Key files:** subdirectory `Makefile`s, top-level `Makefile`, include files in `sub_makefile/`.
- **Important Make variables:** `SUBDIRS`, `INCLUDES`, `VPATH`.
- **Artifacts:** per-module object files and final combined binaries.
- **Verification:** top-level build triggers sub-builds; building submodule individually also works.


### 13.CreateLibraryAndMultipleMakefileSubFilesAreUsed
**Description:** Demonstrates library creation combined with multiple sub-Makefile structure to illustrate modular organization and local library management.

**Details:**
- **Goal:** Show creating libraries in a modular project layout with per-module Makefiles and top-level orchestration.
- **Key files:** module `Makefile`s and top-level integration rules.
- **Important Make variables:** `MODULES`, `LIBPATHS`, `DEPENDENCIES`.
- **Artifacts:** per-module libraries and integrated application binaries.
- **Verification:** module-level and top-level builds succeed and dependencies are respected.


### 14.UsingMultipleSubMakefileAndScriptConfiguration
**Description:** Combines multiple sub-Makefiles with script-driven configuration for larger multi-module projects.

**Details:**
- **Goal:** Demonstrate advanced patterns for extensible script-driven builds across many modules.
- **Key files:** nested `Makefile`s, configuration scripts, module lists.
- **Important Make variables:** `CONFIG_FILES`, `TARGET_MODULES`, `BUILD_PROFILE`.
- **Artifacts:** profile-dependent build outputs.
- **Verification:** switching `BUILD_PROFILE` changes the resulting artifact set.


### 15.IncludesSettingParentSourceCodeDirectory
**Description:** Demonstrates techniques for setting include/source paths that reference parent directories, useful when sharing common code across examples.

**Details:**
- **Goal:** Show how to use `VPATH` or `-I` to include parent/common code from child Makefiles.
- **Key files:** common code directory (possibly at repo root or `../common`) and child Makefiles.
- **Important Make variables:** `VPATH`, `INCLUDE_DIRS`, `COMMON_DIR`.
- **Artifacts:** successful builds that reference parent sources.
- **Verification:** child builds compile and link using parent/common code.


## Tools Included
- `tools/windows_tools/`: Contains Windows build tools including MinGW utilities

## Project Structure Overview
- `example/`: collection of examples, each subdirectory is a self-contained example.
- `tools/windows_tools/`: Windows-specific build helpers and scripts.

## 2. License

The MIT License (MIT)

https://mit-license.org/

Copyright © 2025 <Yezc/Makefile>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.