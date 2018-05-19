#include <stdio.h>

#define N (1<<28)
float a[N];

int main(int argc, char **argv)
{
	float s = 0.0f;
	// please paralellize, vectorize, unroll this!
	for (size_t i=0; i<N; ++i)
		s += a[i];
	return (int)s;
}

// gcc-8 -O1 -ftree-vectorize -ffast-math -ftree-parallelize-loops=2 sum.c && perf stat -d -r 16 ./a.out
