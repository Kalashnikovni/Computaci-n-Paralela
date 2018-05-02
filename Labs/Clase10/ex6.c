// Queremos que gcc optimice el código de test13
// IMPORTANTE:
// * El offset usado en los loops por los arrays es importante

#include <math.h>
#include <stdlib.h>

#define SIZE (1L << 16)

void test13(double * restrict a, double * restrict b){
  size_t i;

  double *x = __builtin_assume_aligned(a, 16);
  double *y = __builtin_assume_aligned(b, 16);

  for (i = 0; i < SIZE; i++)
    x[i] = y[i] + y[i + 1];
}

void test14(double * restrict a, double * restrict b){
  size_t i;

  double *x = __builtin_assume_aligned(a, 16);
  double *y = __builtin_assume_aligned(b, 16);

  for (i = 0; i < SIZE; i++)
      x[i] = y[i] + y[i + 2];
}

int main(void){
  double *a, *b;

  for(int i = 0; i < SIZE; i++){
    a[i] = 2 * i;
    b[i] = 3 + i;
  } 

  test13(a, b);

  return 0;
}

