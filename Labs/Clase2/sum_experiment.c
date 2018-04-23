/* Código de Federico Stasyszyn, 2016 */
#include <stdio.h>

#define N (1L<<28)
#ifndef BLOCK_SIZE
#define BLOCK_SIZE 256
#endif
#define VALUE 1.0f

float a[N/BLOCK_SIZE] = {0.0f};

int main(void)
{
	for (size_t bid=0; bid<N/BLOCK_SIZE; ++bid)
		for (size_t tid=0; tid<BLOCK_SIZE; ++tid)
			a[bid] += VALUE;

	float serial_sum = 0.0f;
	for (size_t i=0; i<N; ++i) {
		serial_sum += VALUE;
	}

	float blocked_sum = 0.0f;
	for (size_t bid=0; bid<N/BLOCK_SIZE; ++bid) {
		blocked_sum += a[bid];
	}

	printf("Serial %f\t Blocked %f\t Real %f\n", serial_sum, blocked_sum, VALUE*(float)N);

	return 0;
}
