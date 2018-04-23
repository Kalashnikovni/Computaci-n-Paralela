/* Instale la libreria via apt: apt install libopenblas-base */
/* Compilar usando: gcc sgemm.c -lopenblas -o sgemm.out -std=c99 -lgomp */

/* Promedio de GFLOPS: 160 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <omp.h>
#include <cblas.h>

#define N 5000
#define STEPS 10

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

    double start = omp_get_wtime();
    for (int i = 0; i < STEPS; ++i) {
        cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,
                    N, N, N,
                    1.0, a, N,
                    b, N,
                    1.0, c, N);
    }
    double elapsed = omp_get_wtime() - start;

    double operations = 2.0 * STEPS * N * N * (N + 1.0);
    double gflops = operations / (1000.0 * 1000.0 * 1000.0 * elapsed);
    printf("%f GFLOPS\n", gflops);

    /* devolver algun resultado para que el compilador no descarte codigo */
    return (int) c[0];
}

