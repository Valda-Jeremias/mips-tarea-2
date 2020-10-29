#include <stdio.h>

int factorial(int n) {
  int resultado = 1;
  while (n > 0) {
    resultado *= n;
    n--;
  }
  return resultado;
}

int main() {
  int n = 0;
  printf("Ingrese un numero: ");
  scanf("%d", &n);
  int res = factorial(n);
  printf("%d\n", res);
  return 0;
}
