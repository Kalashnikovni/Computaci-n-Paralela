void reset_or_slash2(float a[], const unsigned int N, const int first) {
	for (unsigned int i=0; i<N; ++i) {
		if (first==1) {
			a[i] = 0;
		} else {
			a[i] = a[i]/2;
		}
	}
}

// gcc-8 -S -O1 loop_unswitch.c
// gcc-8 -S -O1 -funswitch-loops loop_unswitch.c
