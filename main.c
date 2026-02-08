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

  return 0;
}
