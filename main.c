#include <stdio.h>
#include <stdbool.h>

int main() {
  while (true) {
    int x = 0;
    int res = scanf("%d", &x);
    if (res < 0) {
      break;
    }
    printf("%d\n", x * x);
  }
  return 0;
}
