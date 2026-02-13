//
// Simple Stdio From Scratch
// Only linux support available.
//

#ifndef SIMPLE_STDIO
#define SIMPLE_STDIO

#define stdin 0
#define stdout 1

/* output */
int simplePuts(const char *s);
int simplePutchar(const char c);

/* input */
int simpleGetchar();

/* File I/O */
int simpleFopen(const char *filename, const char flag);
int simpleFclose(const int file);

int simpleFputc(const char c, const int stream);
#define simplePutc(c, fd) simpleFputc(c, fd);

int simpleFgetc(const int stream);
#define simpleGetc(stream) simpleFgetc(stream);

char *simpleFgets(char *str , const int n, const int stream);

int simpleFputs(const char *str , const int stream);

#endif
