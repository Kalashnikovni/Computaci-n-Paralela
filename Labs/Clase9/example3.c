// Ejemplo para probar _mm_blend_ps
// Instalar multilib para la version de gcc que se usa
// Ej: gcc-7-mutilib

#include <stdio.h>
#include <smmintrin.h>

int main(void){
  __m128 a, b;

  a[0] = 1.0f;
  a[1] = 2.0f;
  a[2] = 3.0f;
  a[3] = 4.0f;

  b[0] = 5.0f;
  b[1] = 6.0f;
  b[2] = 7.0f;
  b[3] = 8.0f;

  // El enterito del blend es 0 <= i <= 15 porque con eso
  // me alcanza para todas las posibles combinaciones
  b = _mm_blend_ps(a, b, 8);
  printf("Resultado: %f %f %f %f\n", b[0], b[1], b[2], b[3]);
  
  return 0;
}
