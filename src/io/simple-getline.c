#include "../../include/simple-stdio.h"

long simpleGetline(char *buf , long max, int stream) {
  long bytesRead = 0;
  int c;

  while (bytesRead < max - 1) {
    c = simpleGetc(stream);

    if (c == -1) {
      break;
    }

    buf[bytesRead++] = c;

    if (c == '\n') {
      break;
    }
  }
  
  buf[bytesRead] = '\0';

  return bytesRead;
} 

