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

  file = simpleFopen("example.txt" , 'r');
  
  if (file < 0) {
    simplePuts("Error occured while opening file.");
    return 1;
  }

  c = simpleFgetc(file);

  while (c != -1 && c != '\n') {
    simplePutc(c, stdout);
    c = simpleGetc(file);
  }

  simpleFclose(file);

  simplePutc('\n', 1);

  char buff[16];

  if (simpleFgets(buff, 16 , 0) != (void*)0) { // (void*)0 == NULL
    for (int i = 0; buff[i]; i++) simplePutc(buff[i], stdout);
  }

  char FileBuff[8];
  file = simpleFopen("example.txt" , 'r');
  
  if (file < 0) {
    simplePuts("Failed to open file.");
    return 1;
  }

  if (simpleFgets(FileBuff, 8, file) != (void*)0) {
    for (int i = 0; FileBuff[i]; i++) simplePutc(FileBuff[i], stdout);
  }

  simpleFclose(file);

  simplePutc('\n', stdout);

  file = simpleFopen("example.txt" , 'a');
  
  if (file < 0) {
    simplePuts("Failed to open file.");
    return 1;
  }

  if (simpleFputs(" Writing using simple-stdio!\n" , file) < 0) {
    simplePuts("Failed to write to file!");
  }

  simpleFclose(file);

  file = simpleFopen("example.txt", 'r');
  if (file < 0) {
    simplePuts("Failed to open file.");
    return 1;
  }

  int currPos = simpleFtell(file);
  simplePutc((char)(currPos + 48) , stdout); // print converted digit.

  c = simpleGetc(file);
  simplePutc('\n', stdout);

  currPos = simpleFtell(file);
  simplePutc((char)(currPos + 48) , stdout); // print converted digit.
  simplePutc('\n', stdout);
  
  currPos = simpleFseek(file , 5 , 0);
  if (currPos == -1) {
    simplePuts("Failed to change file pos!");
    simpleFclose(file);
    return 1;
  }

  simplePutc((char)(currPos + 48) , stdout); // print converted digit.
  simplePutc('\n', stdout);

  simplePutc(simpleGetc(file) , stdout);
  simplePutc('\n' , stdout);

  simpleFclose(file);

  simpleRename("example.txt" , "example_r.txt");

  return 0;
}
