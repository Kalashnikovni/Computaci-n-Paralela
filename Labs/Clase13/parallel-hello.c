#include <stdio.h>
#include <omp.h>

int main(void)
{
	#pragma omp parallel
	{
		printf("Thread %d: Hello Waldo!\n", omp_get_thread_num());
	}

	return 0;
}

// gcc-8 -fopenmp parallel-hello.c && OMP_NUM_THREADS=5 ./a.out
