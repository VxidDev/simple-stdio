#include "include/simple-stdio.h"

void consumeRest() {
  char c;
  do {
    c = simpleGetchar();
  } while (c != '\n' && c != 0);
}

int main(void) {
  simplePuts("Hello, World!");

  simplePutchar('A');
  simplePutchar('\n');

  char *string = "Enter a character: \0";
  for (int i = 0; string[i] != '\0'; i++)
    simplePutchar(string[i]);

  int c = simpleGetchar();

  simplePutchar(c);
  simplePutchar('\n');

  consumeRest();

  int file = simpleFopen("example.txt", 'w');

  if (file < 0) {
    simplePuts("Error occured while opening file.");
    return 1;
  }

  simplePutc('H', file);
  simpleFputc('i', file);
  simplePutc('!', file);

  simpleFclose(file);

  return 0;
}
