#include <stdio.h>
#include <omp.h>

int main(void)
{
	#pragma omp parallel sections num_threads(4)
	{
		#pragma omp section
		{
		printf("1st lexical section, tid %d\n", omp_get_thread_num());
		}
		#pragma omp section
		{
		printf("2nd lexical section, tid %d\n", omp_get_thread_num());
		}
	}

	return 0;
}

// gcc-8 -fopenmp parallel-sections.c && ./a.out