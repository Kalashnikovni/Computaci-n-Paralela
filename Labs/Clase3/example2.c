// Ejemplo para probar una ayudita al compilador: __builtin_expect
// Compilar con: gcc example2.c -o example2.out -lgomp -std=c99
// Pudimos observar una mejora de algunos segundos

#define likely(x)   __builtin_expect((x), 1)
#define unlikely(x) __builtin_expect((x), 0)
#define N 50000

#include <omp.h>
#include <stdio.h>

int main(void){
  int a[N] = {0}, j = 1;
  double t = omp_get_wtime(), t1, t2; 

  for(int i = 1; i < N; i++)
    if(likely(j))
      a[i] = a[i] + 17;

  t1 = omp_get_wtime();

  for(int i = 1; i < N; i++)
    if(j)
      a[i] = a[i] + 17;

  t2 = omp_get_wtime();

  printf("Primer loop, con __builtin_expect: %f\nSegundo loop sin __builtin_expect: %f\n", t1 - t, t2 - t1);

  return 0;
}


