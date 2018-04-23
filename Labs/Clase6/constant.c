int main(void){
	const int C = 65536;
	int s = 0;
	for (unsigned int i=0; i<C; ++i) {
		s += i;
	}
	return s;
}

// gcc-8 -S -O1 constant.c
// gcc-8 -S -O2 constant.c
// Aumentar la constante ... es sorprendente, no vi límite, ni aumentando a 64 bits
