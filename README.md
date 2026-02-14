# Simple-Stdio

Simple-Stdio is a recreation of selected functions from `<stdio.h>` library, written in Assembly x86-64 and C.

## API

| Function                       | Description           | Arguments                | Return       |
| -------------------------------| --------------------- | ------------------------ | ------------ |
| `int simplePuts(const char* s)`|print string to stdout.| `s` - null-terminated string | `0` on success.|
| `int simplePutchar(const char c)`| print char to stdout.| `c` - char                   | `c` ascii code on success.|
| `int simpleGetchar()`        | get char from stdin     | void                   | ascii code on success |
| `int simpleFopen(const char *filename , const char mode)` | open a file with mode of choice. (w , r, a) | `filename` - name of the file to open , `mode` - mode to open a file with. | File descriptor on success, `< 0` otherwise. |
| `int simpleFclose(const int file)` | close file. | `file` - file descriptor from `simpleFopen` | `0` on success |
| `int simpleFputc(const char c, const int stream)` | print char to the given stream. | `c` - char to print , `stream` - 0/1 for stdin/stdout or file descriptor. | `c` ascii code on success. |
| `int simplePutc(const char c, const int stream)`| same as Fputc. | same as Fputc. | Same as Fputc. |
| `int simpleFgetc(const int stream)` | read single char from stream. | `stream` - 0/1 for stdin/stdout or file descriptor. | ascii code on success, `< 0` on error/EOF. |
| `int simpleGetc(const int stream)` | same as Fgetc. | same as Fgetc. | Same as Fgetc. |
| `char *simpleFgets(char *str, const int n, const int stream)` | read line from stream into buffer. | `str` - buffer to store string, `n` - max chars to read, `stream` - file descriptor. | pointer to `str` on success, `NULL` on error/EOF. |
| `int simpleFputs(const char *str, const int stream)` | write string to stream. | `str` - null-terminated string, `stream` - file descriptor. | non-negative on success, `< 0` on error. |
| `long simpleFtell(const int stream)` | get current file position. | `stream` - file descriptor. | current offset on success, `-1` on error. |
| `int simpleFseek(const int stream, const long int offset, const int whence)` | set file position. | `stream` - file descriptor, `offset` - byte offset, `whence` - SEEK_SET/SEEK_CUR/SEEK_END. | `0` on success, `-1` on error. |
| `int simpleRewind(const int stream)` | rewind file position to start. | `stream` - file descriptor | same as Fseek. |
| `int simpleRename(const char *old , const char *new)` | rename file with name `old` to `new`. | `old , new` - null-terminated strings. | `0` on success. |
| `int simpleRemove(const char *filename)` | remove a file. | `filename` - name of the file to delete | `0` on success |


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
