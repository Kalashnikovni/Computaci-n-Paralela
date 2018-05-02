// Ejemplo para probar la macro _MM_SHUFFLE

#include <stdio.h>
#include <xmmintrin.h>

int main(void){
  __m128 a, b;

  a[0] = 1.0f;
  a[1] = 2.0f;
  a[2] = 3.0f;
  a[3] = 4.0f;

  b = _mm_shuffle_ps(a, a, _MM_SHUFFLE(3, 2, 1, 1));
  printf("Resultado: %f %f %f %f\n", b[0], b[1], b[2], b[3]);
  
  return 0;
}
