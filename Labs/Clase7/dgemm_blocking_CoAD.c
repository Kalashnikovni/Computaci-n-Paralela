// CoAD5, p.415

#include <stdlib.h> // calloc()
#include <assert.h>
#include <omp.h> //omp_get_wtime()
#include <stdio.h> // printf()

#ifndef SIZE
#define SIZE 1024
#endif

#ifndef BLOCKSIZE
#define BLOCKSIZE 32
#endif

static
void
do_block(const int n,
	     const int si, const int sj, const int sk,
	     double *A, double *B, double *C)
{
    for (int i = si; i < si + BLOCKSIZE; ++i) {
		for (int j = sj; j < sj + BLOCKSIZE; ++j) {
	    	double cij = C[i + j * n];	/* cij = C[i][j] */
	    	for (int k = sk; k < sk + BLOCKSIZE; ++k) {
				cij += A[i + k * n] * B[k + j * n];	/* cij+=A[i][k]*B[k][j] */
	    	}
	    	C[i + j * n] = cij;	/* C[i][j] = cij */
		}
	}
}

static
void
dgemm(const int n,
	  double *A, double *B, double *C)
{
    for (int sj = 0; sj < n; sj += BLOCKSIZE)
		for (int si = 0; si < n; si += BLOCKSIZE)
	    	for (int sk = 0; sk < n; sk += BLOCKSIZE)
				do_block(n, si, sj, sk, A, B, C);
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

	double start = omp_get_wtime();
	dgemm(N, a, b, c);
	printf("%lf GFLOPS\n", ((long)2*N*N*N)/((1<<30)*(omp_get_wtime()-start)));
}