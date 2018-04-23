// Versión base de: CoAD5, p.415

#include <stdlib.h> // calloc()
#include <assert.h>
#include <stdlib.h> // rand()
#include <omp.h> // omp_get_wtime()
#include <stdio.h> // printf()

#ifndef SIZE
#define SIZE 1024
#endif

static
void
dgemm(const int n,
	  double *A, double *B, double *C)
{
    for (int i = 0; i < n; ++i) {
		for (int j = 0; j < n; ++j) {
	    	double cij = C[i + j * n];	/* cij = C[i][j] */
	    	for (int k = 0; k < n; ++k) {
				cij += A[i + k * n] * B[k + j * n];	/* cij+=A[i][k]*B[k][j] */
	    	}
	    	C[i + j * n] = cij;	/* C[i][j] = cij */
		}
	}
}

int
main(int argc, char **argv)
{
	const int N = SIZE;
	double *a = NULL, *b = NULL, *c = NULL;
	a = calloc(N*N, sizeof(double));
	b = calloc(N*N, sizeof(double));
	c = calloc(N*N, sizeof(double));
	assert(a!=NULL && b!=NULL && c!=NULL);
	for (int i=0; i<N*N; ++i) {
			a[i] = (double)rand()/RAND_MAX;
			b[i] = (double)rand()/RAND_MAX;
	}

	double start = omp_get_wtime();
	dgemm(N, a, b, c);
	printf("%lf GFLOPS\n", (long)2*N*N*N/((1<<30)*(omp_get_wtime()-start)));
}
