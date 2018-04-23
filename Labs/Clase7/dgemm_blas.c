#include <stdlib.h> // calloc()
#include <assert.h>
#include <omp.h> // omp_get_wtime()
#include <stdio.h> // printf()
#include <cblas.h> // cblas_dgemm()

#ifndef SIZE
#define SIZE 1024
#endif

int
main(int argc, char **argv)
{
	const int N = SIZE;
	double *a = NULL, *b = NULL, *c = NULL;
	a = calloc(N*N, sizeof(double));
	b = calloc(N*N, sizeof(double));
	c = calloc(N*N, sizeof(double));
	assert(a!=NULL && b!=NULL && c!=NULL);

	double start = omp_get_wtime();
	cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, N, N, N, 1.0, a, N, b, N, 0.0, c, N);
	printf("%lf GFLOPS\n", ((long)2*N*N*N)/((1<<30)*(omp_get_wtime()-start)));
}

// apt-get install libatlas-base-dev
// gcc -O1 -std=c99 dgemm_blas.c -lgomp -lcblas
