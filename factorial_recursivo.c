#include <stdio.h>

int factorial(int n) {
  if (n < 1)
    return 1;
  else
    return factorial(n - 1) * n;
}

int main() {
  int n = 0;
  printf("Ingrese un numero: ");
  scanf("%d", &n);
  int res = factorial(n);
  printf("%d\n", res);
  return 0;
}
