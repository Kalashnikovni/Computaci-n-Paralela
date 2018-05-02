// Queremos que gcc optimice el código de test8
// IMPORTANTE:
// * La forma de escribir las operaciones importa mucho

#include <math.h>
#include <stdlib.h>

#define SIZE (1L << 16)

void test8(double * restrict a, double * restrict b){
  size_t i;

  double *x = __builtin_assume_aligned(a, 16);
  double *y = __builtin_assume_aligned(b, 16);

  for (i = 0; i < SIZE; i++)
    /* max() */
    if (y[i] > x[i]) x[i] = y[i];
}

void test9(double * restrict a, double * restrict b){
  size_t i;

  double *x = __builtin_assume_aligned(a, 16);
  double *y = __builtin_assume_aligned(b, 16);

  for (i = 0; i < SIZE; i++)
    /* max() */
    x[i] = ((y[i] > x[i]) ? y[i] : x[i]);
}

int main(void){
  double *a, *b;

  for(int i = 0; i < SIZE; i++){
    a[i] = 2 * i;
    b[i] = 3 + i;
  } 

  test8(a, b);

  return 0;
}

