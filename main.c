#include <stdio.h>
#include <stdlib.h>

#include "fact.h"

int main(int argc, char **argv) {
  int n;
  if (argc < 2) {
    fprintf(stderr, "Usage: fact <number>\n");
    exit(1);
  }

  n = atoi(argv[1]);
  printf("fact(%d) = %d\n", n, fact(n));
}
