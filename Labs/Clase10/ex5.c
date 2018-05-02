// Queremos que gcc optimice el código de test12

#include <math.h>
#include <stdlib.h>

#define SIZE (1L << 16)

void test12(double * restrict a, double * restrict b){
  size_t i;

  double *x = __builtin_assume_aligned(a, 16);
  double *y = __builtin_assume_aligned(b, 16);

  for(i = 0; i < SIZE; i++){
    /* early stop */
    if (x[i] < y[i]) break;

    x[i] += y[i];
  }
}

int main(void){
  double *a, *b;

  for(int i = 0; i < SIZE; i++){
    a[i] = 2 * i;
    b[i] = 3 + i;
  } 

  test12(a, b);

  return 0;
}

