// Versión base de: CoAD5, p.415

#include <stdlib.h> // calloc()
#include <assert.h>
#include <stdlib.h> // rand()
#include <omp.h> //omp_get_wtime()
#include <stdio.h> // printf()

#ifndef SIZE
#define SIZE 1024
#endif

static
void
dgemm(const int n,
	  double *A, double *B, double *C)
{
	assert(n%4==0); // Puedo desenrollar 4 veces
    for (int i = 0; i < n; ++i) {
		for (int j = 0; j < n; j+=4) {
			double cij0 = C[i + (j+0) * n];	/* cij0 = C[i][j] */
			double cij1 = C[i + (j+1) * n];	/* cij1 = C[i][j+1] */
			double cij2 = C[i + (j+2) * n];	/* cij2 = C[i][j+2] */
			double cij3 = C[i + (j+3) * n];	/* cij3 = C[i][j+3] */
	    	for (int k = 0; k < n; ++k) {
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