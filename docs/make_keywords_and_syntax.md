# GNU Make Keywords and Syntax

> This document covers common keywords, special targets, built-in functions, automatic variables, conditional statements, and file inclusion syntax for GNU Make version 4.4.1 and earlier.

## Table of Contents

1. [Overview of Keyword Categories](#overview-of-keyword-categories)
2. [Variable Assignment Operators](#variable-assignment-operators)
3. [Conditionals and Control Directives](#conditionals-and-control-directives)
4. [File Inclusion and Search Paths](#file-inclusion-and-search-paths)
5. [Special Targets](#special-targets)
6. [Built-in Functions](#built-in-functions)
7. [Automatic Variables](#automatic-variables)
8. [Pattern Rules and Suffix Rules](#pattern-rules-and-suffix-rules)
9. [Command-line Special Syntax and Environment](#command-line-special-syntax-and-environment)
10. [Common Reserved Names and Conventions](#common-reserved-names-and-conventions)

---

## Overview of Keyword Categories

GNU Make keywords are not strict reserved words like those in programming languages; they are syntax elements that shape the structure of a Makefile. The main categories include:

| Category            | Common Keywords                                                                                                                                                                                                                                                                                                                     |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Variable assignment | `=`, `:=`, `?=`, `+=`, `::=`                                                                                                                                                                                                                                                                                                       |
| Conditionals        | `ifeq`, `ifneq`, `ifdef`, `ifndef`, `else`, `endif`                                                                                                                                                                                                                                                                               |
| File inclusion      | `include`, `sinclude`, `-include`                                                                                                                                                                                                                                                                                                 |
| Export variables    | `export`, `unexport`                                                                                                                                                                                                                                                                                                              |
| Override variables  | `override`, `private`                                                                                                                                                                                                                                                                                                             |
| Definition blocks   | `define`, `endef`                                                                                                                                                                                                                                                                                                                 |
| Undefine            | `undefine`                                                                                                                                                                                                                                                                                                                        |
| Runtime messages    | `$(error ...)`, `$(warning ...)`, `$(info ...)`                                                                                                                                                                                                                                                                                   |
| Built-in functions  | `$(subst ...)`, `$(patsubst ...)`, `$(shell ...)`, `$(foreach ...)`, `$(if ...)`, `$(call ...)`, etc.                                                                                                                                                                                                                          |
| Special targets     | `.PHONY`, `.SUFFIXES`, `.DEFAULT`, `.SECONDARY`, `.PRECIOUS`, `.INTERMEDIATE`, `.NOTINTERMEDIATE`, `.DELETE_ON_ERROR`, `.IGNORE`, `.SILENT`, `.LOW_RESOLUTION_TIME`, `.ONESHELL`, `.POSIX`, `.SECONDEXPANSION`, `.EXPORT_ALL_VARIABLES`, `.NOTPARALLEL`, `.WAIT`, `.RECIPEPREFIX`, `.SHELLFLAGS`, `.DEFAULT_GOAL`, `.FEATURES`, `.INCLUDE_DIRS` |
| Automatic variables | `$@`, `$<`, `$^`, `$+`, `$?`, `$*`, `$(@D)`, `$(@F)`, etc.                                                                                                                                                                                                                                                                        |

---

## Keyword List

The following table shows common GNU Make keywords and syntax elements for version 4.4.1 and earlier:

| Keyword Category                   | Keywords                                                                                                                                                                                                                                                                                                                                                 |
| ---------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Assignment and variable control    | `=`, `:=`, `?=`, `+=`, `::=`, `override`, `private`, `export`, `unexport`, `define`, `endef`, `undefine`, `export VAR`, `export VAR=value`                                                                                                                                                                                                             |
| Conditionals and flow control      | `ifeq`, `ifneq`, `ifdef`, `ifndef`, `else`, `endif`, `$(if ...)`, `$(and ...)`, `$(or ...)`, `$(not ...)`, `$(foreach ...)`, `$(call ...)`, `$(eval ...)`, `$(let ...)`, `$(intcmp ...)`, `$(error ...)`, `$(warning ...)`, `$(info ...)`, `$(origin ...)`, `$(flavor ...)`, `$(value ...)`, `$(shell ...)`, `$(file ...)`, `$(wildcard ...)` |
| Inclusion and path keywords        | `include`, `sinclude`, `-include`, `vpath`, `vpath pattern directories`                                                                                                                                                                                                                                                                                |
| Special target keywords            | `.PHONY`, `.SUFFIXES`, `.DEFAULT`, `.SECONDARY`, `.PRECIOUS`, `.INTERMEDIATE`, `.NOTINTERMEDIATE`, `.DELETE_ON_ERROR`, `.IGNORE`, `.SILENT`, `.LOW_RESOLUTION_TIME`, `.ONESHELL`, `.POSIX`, `.SECONDEXPANSION`, `.EXPORT_ALL_VARIABLES`, `.NOTPARALLEL`, `.WAIT`                                                                    |
| Automatic variable keywords        | `$@`, `$<`, `$^`, `$+`, `$?`, `$*`, `$%`, `$(@D)`, `$(@F)`, `$(*D)`, `$(*F)`, `$^D`, `$^F`                                                                                                                                                                                                                                                              |
| Common target names and conventions | `all`, `clean`, `distclean`, `install`, `uninstall`, `check`, `test`, `help`, `rebuild`, `dist`, `tags`, `maintainer-clean`, `install-strip`, `mostlyclean`, `TAGS`, `$(MAKEFILE_LIST)`, `$(MAKECMDGOALS)`, `$(CURDIR)`, `$(MAKE_VERSION)`                                                                                                         |

---

## Variable Assignment Operators

GNU Make provides multiple assignment forms, and each one is an important syntax element.

| Operator / Keyword         | Description                                                                                          |
| ------------------------- | ---------------------------------------------------------------------------------------------------- |
| `=`                       | Recursive expansion assignment, expanded lazily. Example: `FOO = $(BAR)`                             |
| `:=`                      | Simple assignment, expanded immediately. Example: `FOO := $(BAR)`                                    |
| `?=`                      | Conditional assignment, only assigns if the variable is undefined. Example: `FOO ?= default`         |
| `+=`                      | Append assignment, adds text to the existing variable. Example: `FOO += extra`                        |
| `::=`                     | Rare simple assignment syntax similar to `:=`. Example: `FOO ::= value`                              |
| `override`                | Forces override of variables passed from the environment or command line. Example: `override CFLAGS := -O2` |
| `private`                 | Marks a variable as local to the Makefile, preventing export to child make instances. Example: `private TMPDIR := /tmp` |
| `export`                  | Exports variables to subprocesses and child make. Syntax: `export VAR` or `export VAR=value`           |
| `unexport`                | Cancels export of a variable. Syntax: `unexport VAR`                                                   |
| `define` / `endef`        | Defines a multiline variable or macro. Example: `define VAR_NAME ... endef`                           |
| `undefine`                | Removes a variable definition. Syntax: `undefine VAR_NAME`                                            |

### Variable Assignment Examples

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

## Conditionals and Control Directives

Conditional structures are important keywords for controlling build logic in Makefiles.

| Directive                       | Description                                                                                                            |
| ------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `ifeq` / `ifneq`                | Compares two strings. Syntax: `ifeq (arg1, arg2)` or `ifneq (arg1, arg2)`, with either commas or spaces as separators |
| `ifdef` / `ifndef`              | Tests whether a variable is defined. `ifdef VAR` is true when `VAR` is defined; `ifndef VAR` is true when `VAR` is undefined |
| `else`                          | Used with conditionals to specify the false branch                                                                     |
| `endif`                         | Ends a conditional block                                                                                               |
| `$(if condition,true,false)`    | Built-in conditional function useful for variable assignment and inline logic                                         |
| `$(error ...)`                  | Reports an error at parse time and stops the build                                                                     |
| `$(warning ...)`                | Emits a warning at parse time but continues the build                                                                  |
| `$(info ...)`                   | Prints informational output at parse time without stopping the build                                                   |
| `$(and ...)`                    | Logical AND operation, returns the last argument when all arguments are non-empty                                     |
| `$(or ...)`                     | Logical OR operation, returns the first non-empty argument                                                             |
| `$(not ...)`                    | Logical NOT operation, returns `1` if the argument is empty, otherwise returns an empty string                        |
| `$(foreach ...)`                | Loop function that performs text substitution for each word in a list                                                  |
| `$(call ...)`                   | Calls a user-defined macro or function                                                                                 |
| `$(eval ...)`                   | Re-evaluates text during parse time, dynamically generating rules or variables                                        |
| `$(origin ...)`                 | Queries the origin of a variable                                                                                        |
| `$(flavor ...)`                 | Queries the type of a variable (`recursive` or `simple`)                                                               |
| `$(value ...)`                  | Returns the unexpanded value of a variable                                                                              |
| `$(shell ...)`                  | Executes a shell command and returns its output                                                                         |
| `$(file ...)`                   | Performs file operations such as writing, reading, or deleting files                                                    |
| `$(wildcard ...)`               | Expands file patterns                                                                                                  |

### Conditional and Diagnostic Examples

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

## File Inclusion and Search Paths

Keywords used for including other Makefiles or defining search paths.

| Directive   | Description                                                                                                              |
| ----------- | ------------------------------------------------------------------------------------------------------------------------ |
| `include`   | Includes one or more other Makefiles. Syntax: `include file1 file2 ...`. If a file is missing, Make reports an error by default |
| `sinclude`  | Similar to `include`, but ignores missing files. Equivalent to `-include`                                               |
| `-include`  | Same as `sinclude`, meaning "include if it exists, ignore if it does not"                                              |
| `vpath`     | Sets path search locations for source files. Syntax: `vpath pattern directories`, for example: `vpath %.c src include`  |

### Inclusion and Path Examples

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

## Special Targets

Special targets are important GNU Make keywords used to control dependency processing, rule generation, and build behavior.

### Common Special Targets

| Special Target              | Description                                                                                                            |
| --------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| `.PHONY`                    | Declares phony targets that do not correspond to actual files. Commonly used for `clean`, `all`, `install`, etc. Syntax: `.PHONY: clean all` |
| `.SUFFIXES`                 | Defines a list of suffixes used by suffix rules. Syntax: `.SUFFIXES: .c .o .cpp`                                       |
| `.DEFAULT`                  | Specifies the default commands for targets with no explicit rule. Syntax: `.DEFAULT:`<br>`    @echo "No rule for $@"` |
| `.SECONDARY`                | Prevents intermediate files from being removed. Syntax: `.SECONDARY: foo.o`                                            |
| `.PRECIOUS`                 | Prevents target files from being deleted if a command fails. Syntax: `.PRECIOUS: %.o`                                  |
| `.INTERMEDIATE`             | Marks files as intermediate; these files may be removed after the build finishes.                                      |
| `.NOTINTERMEDIATE`          | Cancels intermediate status for specific files or patterns so they are not treated as intermediate files. (Introduced in v4.4) |
| `.DELETE_ON_ERROR`          | Deletes target files when a command fails. Syntax: `.DELETE_ON_ERROR:`                                                 |
| `.IGNORE`                   | Ignores failures in rule commands. Syntax: `.IGNORE:` or prefix a command with `-`.                                   |
| `.SILENT`                   | Silences command echoing. Syntax: `.SILENT:` or use `@command`                                                         |
| `.LOW_RESOLUTION_TIME`      | Uses low-resolution timestamps to improve behavior on remote file systems. Syntax: `.LOW_RESOLUTION_TIME:`              |
| `.ONESHELL`                 | Executes all commands in a rule with a single shell invocation. Syntax: `.ONESHELL:` (Introduced in v3.82)              |
| `.POSIX`                    | Enables POSIX mode, limiting certain GNU Make extensions. Syntax: `.POSIX:`                                            |
| `.SECONDEXPANSION`          | Enables second expansion for prerequisites and `$$()` syntax in commands. Syntax: `.SECONDEXPANSION:` (Introduced in v3.81) |
| `.EXPORT_ALL_VARIABLES`     | Exports all variables to subprocesses. Syntax: `.EXPORT_ALL_VARIABLES:`                                               |
| `.NOTPARALLEL`              | Disables parallel build execution. Syntax: `.NOTPARALLEL:` (Introduced in v3.82; dependency support introduced in v4.4)  |
| `.WAIT`                     | Controls ordering dependencies in parallel builds. Syntax: `.WAIT` (Introduced in v4.4)                                 |

### Special Target Examples

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

---

### Target-Specific Variable Examples

```make
prog: CFLAGS += -O2
prog: LDFLAGS += -lm

debug: CFLAGS += -g
```

### Parallel and Ordering Examples

```make
parallel: step1 step2

step1:
	@echo step1

step2:
	@echo step2

serial: step1 .WAIT step2
```

### Second Expansion Example

```make
.SECONDEXPANSION:

files := a b

a $$(files):
	@echo second expansion for $@
```

### Target-Specific Variable Syntax

These special forms are used to define target-specific variables or prerequisites for pattern rules:

| Syntax                        | Description                                              |
| ----------------------------- | -------------------------------------------------------- |
| `target: variable = value`    | Recursive expansion assignment for a specific target     |
| `target: variable := value`   | Simple assignment for a specific target                  |
| `target: variable ?= value`   | Conditional assignment for a specific target             |
| `target: variable += value`   | Append assignment for a target-specific variable         |

For example:

```make
prog: CFLAGS += -O2
```

---

## Built-in Functions

GNU Make includes many built-in functions, which can be grouped by text processing, conditionals, file operations, function calling, looping, arithmetic, and variable inspection.

### 1. Text Processing Functions

| Function                                | Description                                                                                       |
| --------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `$(subst from,to,text)`                 | Text substitution. Example: `$(subst .c,.o,$(SOURCES))`                                          |
| `$(patsubst pattern,replacement,text)`  | Pattern substitution. Example: `$(patsubst %.c,%.o,$(SOURCES))`                                  |
| `$(strip string)`                       | Removes leading and trailing whitespace and collapses repeated whitespace into a single space     |
| `$(findstring find,in)`                 | Returns `find` if it appears in `in`                                                             |
| `$(filter pattern...,text)`             | Returns words matching the given patterns                                                       |
| `$(filter-out pattern...,text)`         | Returns words that do not match the given patterns                                               |
| `$(sort list)`                          | Sorts words and removes duplicates                                                               |
| `$(word n,text)`                        | Returns the nth word                                                                             |
| `$(wordlist s,e,text)`                  | Returns words s through e                                                                        |
| `$(words text)`                         | Returns the number of words                                                                      |
| `$(firstword text)`                     | Returns the first word                                                                           |
| `$(lastword text)`                      | Returns the last word                                                                            |
| `$(dir names...)`                       | Returns the directory part of each name                                                          |
| `$(notdir names...)`                    | Returns the filename part of each name                                                           |
| `$(suffix names...)`                    | Returns the suffix of each name                                                                  |
| `$(basename names...)`                  | Returns the basename of each name                                                                |
| `$(addprefix prefix,names...)`          | Adds a prefix to each name                                                                       |
| `$(abspath names...)`                   | Returns an absolute path by normalizing `.` and `..`                                              |
| `$(addsuffix suffix,names...)`          | Adds a suffix to each name                                                                       |
| `$(join list1,list2)`                   | Joins two lists element-wise                                                                     |
| `$(wildcard pattern...)`                | Expands file patterns                                                                            |
| `$(realpath names...)`                  | Normalizes paths by removing `.` and `..`                                                         |

#### Text Processing Examples

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

### 2. File and Environment Functions

| Function                                | Description                                                                                                      |
| --------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `$(file operation,filename,text...)`     | Directly performs file-system operations such as writing files. Common operations are `>`, `>>`, `<`, `DELETE`     |
| `$(wildcard pattern...)`                 | Finds files that match a pattern                                                                                 |
| `$(origin variable)`                     | Returns the origin type of a variable (`default`, `environment`, `file`, `command line`, `override`, `automatic`, etc.) |
| `$(flavor variable)`                     | Returns the variable type: `recursive` or `simple`                                                              |
| `$(shell command)`                       | Executes a command in the shell and returns its output                                                          |
| `$(error text)`                          | Raises an error and stops the build                                                                              |
| `$(warning text)`                        | Prints a warning without stopping the build                                                                     |
| `$(info text)`                           | Prints informational output without stopping the build                                                          |

#### File and Environment Examples

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

### 3. Conditional and Flow Control Functions

| Function                                        | Description                                                                                                |
| ----------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `$(if condition,then-part[,else-part])`          | Conditional function useful for building logic during variable assignment                                  |
| `$(and arg1,arg2,...)`                          | Logical AND, returns the last argument when all arguments are non-empty                                    |
| `$(or arg1,arg2,...)`                           | Logical OR, returns the first non-empty argument                                                            |
| `$(not arg)`                                    | Logical NOT, returns `1` when the argument is empty, otherwise returns an empty string                      |
| `$(foreach var,list,text)`                      | Loop function that performs text substitution for each word in a list                                      |
| `$(call variable,param1,param2,...)`            | Calls a user-defined macro or function                                                                      |
| `$(eval text)`                                  | Re-evaluates text during parse time, dynamically generating rules or variables                             |
| `$(value variable)`                             | Returns the unexpanded value of a variable                                                                 |
| `$(let variable=value,text)`                    | Creates a local variable within a user-defined macro and limits its scope. (Introduced in v4.4)            |
| `$(intcmp arg1,arg2,less,equal,greater)`        | Numeric comparison function. (Introduced in v4.4)                                                          |
| `$(file ...)`                                   | Performs file write/read/delete operations                                                                  |
| `$(error ...)`, `$(warning ...)`, `$(info ...)` | Runtime diagnostic and output functions                                                                     |

### 4. Arithmetic and String Length Functions

| Function                        | Description                                                                                         |
| ------------------------------- | --------------------------------------------------------------------------------------------------- |
| `$(shell expr)`                 | Uses a shell command to compute a value, often used for arithmetic expressions                     |
| GNU Make does not include native arithmetic functions | Arithmetic is usually performed via `$(shell ...)` calling external tools such as `expr` or `printf` |

### 5. Variable Inspection and Modifier Functions

| Function            | Description                    |
| ------------------- | ----------------------------- |
| `$(origin var)`     | Queries the origin of a variable  |
| `$(flavor var)`     | Queries the variable type       |
| `$(value var)`      | Retrieves the raw text of a variable |
| `$(call ...)`       | Calls a macro dynamically        |
| `$(eval ...)`       | Dynamically generates Makefile content |

---

## Automatic Variables

Automatic variables are only valid in rule commands and typically represent target, dependency, and filename information.

| Automatic Variable             | Description                                                                                                         |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------------- |
| `$@`                           | The current target filename                                                                                         |
| `$%`                           | The member name in archive member targets                                                                           |
| `$<`                           | The first prerequisite filename. For pattern rules, usually the first matching prerequisite                         |
| `$^`                           | All prerequisite filenames, with duplicate prerequisites removed                                                   |
| `$+`                           | All prerequisite filenames, preserving duplicate prerequisites                                                      |
| `$?`                           | Prerequisite filenames that are newer than the target                                                              |
| `$*`                           | The stem of the target filename (without suffix)                                                                    |
| `$(@D)`                        | The directory part of the target                                                                                   |
| `$(@F)`                        | The file part of the target                                                                                        |
| `$<D`, `$<F`, `$^D`, `$^F`, etc | GNU Make 4.4.1 introduced automatic variable modifiers for extracting directories, filenames, suffixes, etc. Examples include `$(@D)`, `$(@F)`, `$(*F)`, and `$(*D)` |

### Automatic Variable Examples

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

## Pattern Rules and Suffix Rules

Pattern rules and suffix rules are not single keywords, but they are important parts of Makefile syntax.

### Pattern Rule Syntax

- Target pattern: `%.o: %.c`
- Multiple target patterns: `lib%.a foo%.o: %.c`
- Implicit prerequisites: `%.o: %.c %.h`
- Command sequence:
  ```make
  %.o: %.c
      $(CC) -c $(CFLAGS) -o $@ $<
  ```

### Static Pattern Rules

- `targets...: target-pattern: prerequisites...`
- Example:
  ```make
  objects := foo.o bar.o
  $(objects): %.o: %.c
      $(CC) -c $(CFLAGS) -o $@ $<
  ```

### Suffix Rules (Legacy)

- Define suffix lists using `.SUFFIXES`
- Rule form: `.c.o:`
- Example:
  ```make
  .SUFFIXES: .c .o
  .c.o:
      $(CC) -c $(CFLAGS) -o $@ $<
  ```

### Static Pattern and Pattern Rule Syntax

- `pattern: prerequisites`
- `target-pattern: target-pattern: prerequisites`
- `pattern-specific variable assignment`

---

## Command-line Special Syntax and Environment

GNU Make also has special syntax and environment handling on the command line:

- Command-line variable assignment: `make VAR=value`
- Variable precedence: command line > `override` > Makefile > environment > default values
- Phony target syntax: `.PHONY: name`
- Implicit command prefixes: `@`, `-`, `+`

  - `@`: suppresses command echoing
  - `-`: ignores command failure
  - `+`: forces command execution even when not invoked in parallel mode
- Parallel build control: `-j`, `--jobs`

  - These are not Makefile keywords, but they work together with `.NOTPARALLEL` and `.WAIT`
- `MAKE_TMPDIR` environment variable: specifies the temporary directory used by GNU Make. (Introduced in v4.4)
- `.RECIPEPREFIX` special variable: changes the prefix character for recipe lines in a Makefile, for example using `+` instead of TAB. (Introduced in v3.82)
- `.SHELLFLAGS` special variable: sets options passed to the shell by GNU Make, such as `-c` or `-ec`. (Introduced in v3.82)
- `.DEFAULT_GOAL` special variable: specifies the default goal when no target is provided on the command line. (Introduced in v3.81)
- `.FEATURES` special variable: lists the features supported by the current GNU Make version. (Introduced in v3.81)
- `.INCLUDE_DIRS` special variable: lists directories searched for included files by GNU Make. (Introduced in v3.81)
- Recursive make keyword: `$(MAKE)`

  - Represents the current Make program for recursive calls to child make instances

---

## Common Reserved Names and Conventions

This document also lists names commonly used as keywords or reserved conventions in GNU Make files:

- `all`

  - A common default target name; not a Make keyword, but conventionally used as the default build goal
- `clean`, `distclean`, `install`, `uninstall`, `check`, `test`

  - Conventional target names
- `$(MAKEFILES)`

  - Automatic variable listing all included Makefiles
- `$(MAKECMDGOALS)`

  - Automatic variable containing the list of goals passed on the command line
- `$(CURDIR)`

  - Automatic variable for the current working directory
- `$(MAKE_VERSION)`

  - Automatic variable for the current Make version
- `$(COMPILE)`, `$(CC)`, `$(CFLAGS)`, `$(LDFLAGS)`

  - Not reserved keywords, but widely accepted convention variable names in Makefiles

---

## Conclusion

This document categorizes common GNU Make 4.4.1 and earlier keywords, special targets, built-in functions, automatic variables, and syntax structures. These keywords and constructs are the most common and important parts of writing Makefiles and reading existing build scripts.
