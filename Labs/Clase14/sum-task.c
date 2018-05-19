#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

#define N (1<<28)
#define THRESHOLD (1<<20)
float a[N];

float sum(float * const restrict ptr, const size_t n) {
	float s0 = 0.0f, s1 = 0.0f;
	if (n<THRESHOLD) {
		float s = 0.0f;
		// please vectorize, unroll this
		for (size_t i=0; i<n; ++i)
			s += ptr[i];
		return s;
	}
	#pragma omp task shared(s0)
	s0 = sum(ptr, n/2);
	#pragma omp task shared(s1)
	s1 = sum(ptr+n/2, n/2);
	#pragma omp taskwait
	return s0+s1;
}

int main(int argc, char **argv)
{
	#pragma omp parallel
	{
	#pragma omp single
	printf("%d\n", sum(a,N)); // Lost Ina Seaof Parentheses
	}
}

// gcc-8 -fopenmp -O1 -ftree-vectorize -ffast-math sum-task.c && perf stat -d -r 16 ./a.out
