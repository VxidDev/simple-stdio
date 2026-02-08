#include "include/simple-stdio.h"

void consumeRest() {
  char c;
  do {
    c = simpleGetchar();
  } while (c != '\n' && c != 0);
}

int main(void) {
  simplePuts("Hello, World!");

  simplePutc('A');
  simplePutc('\n');

  char *string = "Enter a character: \0";
  for (int i = 0; string[i] != '\0'; i++)
    simplePutc(string[i]);

  int c = simpleGetchar();

  simplePutc(c);
  simplePutc('\n');

  consumeRest();

  return 0;
}
