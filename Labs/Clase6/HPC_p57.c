#include <stdio.h>

int main(void) {
	int i,k;
	i = k = 1;
	i += 257;
	k += 263;
	return i;
}

// gcc -S -O1 HPC_p57.c