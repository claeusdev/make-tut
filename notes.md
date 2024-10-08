# Intro to makefiles

## Anatomy of a rule

```md
target: [list of prereqs]
[<tab> command]
```

- for target to be generated, prereqs must all exists or must be generated.
- `target` is generated by executing the specified command
- `#` prefixed lines are comments, thus not evaluated

## Automatic variables in commands

- `$@`: replaced by name of target
- `$<`: replaced by name of first prereq
- `$^`: replaced by names of all prereqs

## Pattern rules

A pattern rule `%.o: %.c` says how to generate any file `<file>.o` from another file `<file>.c`.

## Variables

```md
CC := gcc
CFLAGS := -Wall -Wextra -Werror
CFLAGS += -g
PANDOC := pandoc
```

## Nice output

- use `@` to hide command output.
- use `echo` to display what you want

## Conditional variables

```md
ifneq($(V),1)
Q = @
endif
```

## Rule composition

- ability to have multiple rules for same target.
- `-MMD`: flag that allows GCC to generate files for dependency tracking
- dependency tracking should be below `all` rule
