/* Compilar usando: gcc lab0.c -std=c99 -lgomp */
/* -march: produce codigo especifico para el CPU con el cual se trabaja */
/* -Oi: optimiza a nivel i; mayor i, mejor es la optimizacion */

/****************************************************************************/
/* Estos son algunos resultados observados: *********************************/
/* -Ofast -march=native -msse3: 10.3 GFLOPS *********************************/
/* sin optimizaciones: 0.42 GFLOPS ******************************************/
/* -O2: 3 GFLOPS ************************************************************/
/****************************************************************************/


#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <omp.h>

#define N 1000
#define STEPS 10

/* Inicializa los valores de la matriz a un valor predeterminado */
void init(float * m) {
    for (int y = 0; y < N; ++y) {
        for (int x = 0; x < N; x++) {
            m[y * N + x] = 1.0f;
        }
    }
}

int main(int argc, char ** argv) {

    int matsize = N * N * sizeof(float);

    /* alojar matrices */
    float *a = malloc(matsize);
    float *b = malloc(matsize);
    float *c = malloc(matsize);

    /* inicializar valores */
    init(a);
    init(b);
    init(c);

    /* TODO: cronometrar */
    double start = omp_get_wtime();
    for (int i = 0; i < STEPS; ++i) {
        for (int y = 0; y < N; ++y) {
            for (int k = 0; k < N; ++k) {
                for (int x = 0; x < N; ++x) {
                    c[y * N + x] += a[y * N + k] * b[k * N + x];
                    //printf("Iteracion i, y, k, x: %d %d %d %d\n", i, y, k, x);
                }
            }
        }
    }

    /* TODO: tiempo transcurrido */
    double elapsed = omp_get_wtime() - start;
    double operations = 2.0 * STEPS * N * N * (N + 1.0);
    double gflops = operations / (1000.0 * 1000.0 * 1000.0 * elapsed);
    /* Operaciones de coma flotante por segundo */
    printf("%f GFLOPS\n", gflops);

    /* devolver algun resultado para que el compilador no descarte codigo */
    return (int) c[0];
}

