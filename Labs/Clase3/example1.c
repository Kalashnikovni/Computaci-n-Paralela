// Ejemplo para probar unrolling
// Compilar con: gcc example1.c -o example1.out -lgomp -std=c99
// La diferencia entre amabas versiones es evidente, la 2da version
// es casi 2x veces mas rapida

#define N 50000

#include <omp.h>
#include <stdio.h>

int main(void){
  int a[N] = {0};
  double t = omp_get_wtime(), t1, t2; 

  for(int i = 0; i < N; i++)
    a[i] = a[i] + 17;

  t1 = omp_get_wtime();

  for(int i = 0; i < N / 2; i++){
    a[i] = a[i] + 17;
    a[i + 1] = a[i + 1] + 17;
  }

  t2 = omp_get_wtime();

  printf("Primer loop: %f\nSegundo loop: %f\n", t1 - t, t2 - t1);

  return 0;
}


