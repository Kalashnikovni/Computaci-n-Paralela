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
		for (int j = sj; j < sj + BLOCKSIZE; j+=4) {
			double cij0 = C[i + (j+0) * n];	/* cij0 = C[i][j] */
			double cij1 = C[i + (j+1) * n];	/* cij1 = C[i][j+1] */
			double cij2 = C[i + (j+2) * n];	/* cij2 = C[i][j+2] */
			double cij3 = C[i + (j+3) * n];	/* cij3 = C[i][j+3] */
	    	for (int k = sk; k < sk + BLOCKSIZE; ++k) {
				cij0 += A[i + k * n] * B[k+0 + (j+0) * n];
				cij1 += A[i + k * n] * B[k+0 + (j+1) * n];
				cij2 += A[i + k * n] * B[k+0 + (j+2) * n];
				cij3 += A[i + k * n] * B[k+0 + (j+3) * n];
	    	}
			C[i + (j+0) * n] = cij0;	/* C[i][j] = cij0 */
			C[i + (j+1) * n] = cij1;	/* C[i][j] = cij0 */
			C[i + (j+2) * n] = cij2;	/* C[i][j] = cij0 */
			C[i + (j+3) * n] = cij3;	/* C[i][j] = cij0 */
		}
	}
}

static
void
dgemm(const int n,
	  double *A, double *B, double *C)
{
	assert(n%BLOCKSIZE==0);
	assert(BLOCKSIZE%4==0);
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