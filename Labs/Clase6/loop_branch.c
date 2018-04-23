void compute0(float a[], const unsigned int N) {
	for (unsigned int i=0; i<N; ++i) {
		if (i==0) {
			a[i] = a[i]/2;
		} else {
			a[i] = a[i-1]/2;
		}
	}
}

void compute1(float a[], const unsigned int N) {
	for (unsigned int i=0; i<N; ++i) {
		if (i==0) {
			a[i] = a[i+1]/2;
		} else if (i==N-1) {
			a[i] = a[i-1]/2;
		} else { // 0<i<N-1
			a[i] = (a[i-1]+a[i+1])/2;
		}
	}
}

void compute2(float a[], const unsigned int N) {
	a[0]=a[1]/2;
	for (unsigned int i=1; i<N-1; ++i) {
		a[i] = (a[i-1]+a[i+1])/2;
	}
	a[N-1]=a[N-2]/2;
}

// gcc-8 -S -O1 loop_branch.c
// No puede hacer nada! Compute3 es a mano.
