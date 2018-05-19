#include <stdio.h>
#include <omp.h>

int main(int argc, char **argv)
{
	#pragma omp parallel num_threads(argc) if(2<argc)
	{
		printf("Thread: %d: Hello Waldo!\n", omp_get_thread_num());
	}

	return 0;
}

// gcc-8 -fopenmp parallel-hello-clauses-threads.c