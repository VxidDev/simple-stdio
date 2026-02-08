# Simple-Stdio

Simple-Stdio is a recreation of selected functions from `<stdio.h>` library, written in Assembly x86-64 and C.

## API

| Function                       | Description           | Arguments                | Return       |
| -------------------------------| --------------------- | ------------------------ | ------------ |
| `int simplePuts(const char* s)`|print string to stdout.| `s` - null-terminated string | `0` on success.|
| `int simplePutc(const char c)`| print char to stdout.| c - char                   | `c` ascii code on success.|

## Tech Stack

Headers: C
API: Assembly x86-64

## Build

To build Simple-Stdio:

1. Clone the repository
`git clone https://github.com/VxidDev/simple-stdio.git`
2. Use `make` to build.
`make`

To use this library in the project:

1. Include the header
`#include "include/simple-stdio.h"`
2. Modify GCC command
`gcc <*.c> -L. -lsimple-stdio -o <*.o>`

## Example Usage

```c
#include "include/simple-stdio.h"

int main(void) {
  simplePuts("Hello, World!");
  return 0;
}
```
