// Queremos que gcc vectorize el código de test1
// IMPORTANTE:
// * Los arrays no se pisan (usar restrict)
// * Indicarle a gcc que los arrays son memory aligned 

#include <stdlib.h>
#include <math.h>

#define SIZE    (1L << 16)

void test1(double *a, double *b){
  int i;

  for (i = 0; i < SIZE; i++)
    a[i] += b[i];
}

void test2(double * restrict a, double * restrict b){
  int i;

  for (i = 0; i < SIZE; i++)
    a[i] += b[i];
}

void test3(double * restrict a, double * restrict b){
  int i;

  __builtin_assume_aligned(a, 16);
  __builtin_assume_aligned(b, 16);

  for (i = 0; i < SIZE; i++)
    a[i] += b[i];
}

void test4(double * restrict a, double * restrict b){
  int i;

  double *x = __builtin_assume_aligned(a, 16);
  double *y = __builtin_assume_aligned(b, 16);

  for (i = 0; i < SIZE; i++)
    x[i] += y[i];
}

int main(void){
  double *a, *b;

  for(int i = 0; i < SIZE; i++){
    a[i] = 2 * i;
    b[i] = 3 + i;
  } 

  test1(a, b);

  return 0;
}
