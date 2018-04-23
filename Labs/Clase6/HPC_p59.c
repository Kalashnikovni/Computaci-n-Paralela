// Ejemplo para probar la optimizacion de sacar expresiones
// invariantes fuera de los loops

int compute(float *a, float *b, float c, float d, float e, float *g, int k, int n){
  for(int i = 1; i < n; i++){
    a[i] = b[i] + c * d;
    e = g [i];
  }
}

// Compilar usando: gcc -O(1,2,3) -S -std=c99
