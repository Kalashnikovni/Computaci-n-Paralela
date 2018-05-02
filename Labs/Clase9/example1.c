// Ejemplo para ver algo de SIMD - SSE3

#define N (1 << 27)

float a[N], b[N], c[N];

int main(void){
  for(unsigned int i = 0; i < N; i++)
    a[i] = b[i] * c[i];
}
