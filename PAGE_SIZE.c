#include <stdio.h>
#include <unistd.h>
int main() {
  printf("%lu\n", sysconf(_SC_PAGESIZE));
}
