// Ejemplo para probar common subexpression elimination

int compute (int a, int b, int c, int d, int e){
  d = c * (a + b);
  e = (a + b) / 2;
  return d - e;
}
