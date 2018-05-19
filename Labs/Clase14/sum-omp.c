#include <stdio.h>
#include <omp.h>

#define N (1<<28)
float a[N];

int main(int argc, char **argv)
{
	float s = 0.0f;
	#pragma omp parallel for simd reduction(+:s)
	for (size_t i=0; i<N; ++i)
		s += a[i];
	return (int)s;
}

// gcc-8 -O1 -ffast-math -fopenmp sum-omp.c && perf stat -d -r 16 ./a.out
