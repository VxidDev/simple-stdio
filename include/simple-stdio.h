//
// Simple Stdio From Scratch
// Only linux support available.
//

#ifndef SIMPLE_STDIO
#define SIMPLE_STDIO

#define stdin 0
#define stdout 1

#define SEEK_SET 0
#define SEEK_CUR 1
#define SEEK_END 2

/* output */
int simplePuts(const char *s);
int simplePutchar(const char c);

/* input */
int simpleGetchar();

/* File I/O */
int simpleFopen(const char *filename, const char flag);
int simpleFclose(const int file);

int simpleFputc(const char c, const int stream);
#define simplePutc(c, fd) simpleFputc(c, fd)

int simpleFgetc(const int stream);
#define simpleGetc(stream) simpleFgetc(stream)

char *simpleFgets(char *str , const int n, const int stream);

int simpleFputs(const char *str , const int stream);

long simpleFtell(const int stream);
int simpleFseek(const int stream , const long int offset , const int whence);
#define simpleRewind(file) simpleFseek(file, 0, SEEK_SET)

int simpleRename(const char *old , const char *new);
int simpleRemove(const char *filename);

#endif
