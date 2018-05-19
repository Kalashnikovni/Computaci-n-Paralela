#include <stdio.h>
#include <omp.h>

#define Q 7 /* discretización del histograma */
#define N (1<<28) /* largo del vector */

unsigned int a[N] = {1,2,3,4,5}; /* vector de muestras */
unsigned int m[Q] = {0}; /* histograma */

int main(void)
{
	unsigned int i = 0;
	#pragma omp parallel for reduction(+:m)
	for(i=0; i<N; ++i) {
		m[a[i]]++;
	}
	for(i=0; i<Q; ++i)
		printf("m[%d]=%d\n", i, m[i]);

	return 0;
}

// gcc-5 -fopenmp parallel-reduction-array.c && echo "Nunca llega acá"
// gcc-8 -fopenmp parallel-reduction-array.c && perf stat ./a.out
