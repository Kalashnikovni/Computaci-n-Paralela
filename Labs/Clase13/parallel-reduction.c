#include <stdio.h>
#include <omp.h>

int main(void)
{
	unsigned int i = 3;
	#pragma omp parallel reduction(+:i)
	{
		i+=omp_get_thread_num();
	}
	printf("Valor de i: %d\n",i);

	return 0;
}

// gcc-8 -fopenmp parallel-reduction.c && for i in {0..127}; do OMP_NUM_THREADS=4 ./a.out; done | sort | uniq -c
