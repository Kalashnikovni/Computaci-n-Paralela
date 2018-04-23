
#define N 128
int a[N];

int main(void){
	for (unsigned int i=0; i<N/2; ++i) {
		int four = a[i]*4;
		int six = a[i]*6;
		a[i] = four;
		a[N-i] = six;
	}
}

// gcc-8 -S -O1 mixed.c
// Induction variable simplification, common subexpression, register allocation
// gcc-8 -S -O2 mixed.c
// Instruction scheduling con constantes arregladas
