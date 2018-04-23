// int square(int i) {
// static inline int square(int i) {
static int square(int i) {
	int result = 0;
	result =  i*i;
	return result;
}

int main(void){
	const int C = 131072;
	int s = 0;
	for (unsigned int i=0; i<C; ++i) {
		s += square(i);
	}
	return s;
}

// gcc-8 -S -O1 inlining.c
