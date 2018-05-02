// Queremos que gcc vectorize el código de test5
// IMPORTANTE:
// * Usar el tipo indicado para la operación a realizar
// * Siempre tratar de tener la menor cantidad de loops posibles

#include <math.h>
#include <stdlib.h>

#define SIZE (1L << 16)

void test5(double * restrict a, double * restrict b){
  int i, j;

  double *x = __builtin_assume_aligned(a, 16);
  double *y = __builtin_assume_aligned(b, 16);

  for (j = 0; j < SIZE; j++)
    for (i = 0; i < SIZE; i++)
      x[i + j * SIZE] += y[i + j * SIZE];
}

void test6(double * restrict a, double * restrict b){
  size_t i, j;

  double *x = __builtin_assume_aligned(a, 16);
  double *y = __builtin_assume_aligned(b, 16);

  for (j = 0; j < SIZE; j++)
    for (i = 0; i < SIZE; i++)
      x[i + j * SIZE] += y[i + j * SIZE];
}

void test7(double * restrict a, double * restrict b)
{
  size_t i;

  double *x = __builtin_assume_aligned(a, 16);
  double *y = __builtin_assume_aligned(b, 16);

  for (i = 0; i < SIZE * SIZE; i++)
    x[i] += y[i];
}

int main(void){
  double *a, *b;

  for(int i = 0; i < SIZE; i++){
    a[i] = 2 * i;
    b[i] = 3 + i;
  } 

  test7(a, b);

  return 0;
}

