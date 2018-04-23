// Ejemplo de simplificacion por variables inductivas

int fill(float *a, int n){
  for(int i = 1; i < n; i++)
   a[i] = 4 * i + n;
}
