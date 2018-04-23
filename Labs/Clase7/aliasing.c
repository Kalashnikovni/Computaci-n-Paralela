void updatePtrs(int * restrict ptrA, int * restrict ptrB, int * restrict val) {
	*ptrA += *val;
	*ptrB += *val;
}


struct node {
	struct node *next, *prev;
};

void foo(struct node *n) {
	n->next->prev->next=n;
	n->next->next->prev=n;
}


// gcc -std=c99 -O3 -S aliasing.c
// vi aliasing.s
// Agregar restrict luego del puntero, compilar y mirar.

// http://en.wikipedia.org/wiki/Restrict
// Felix von Leitner, "Source Code Optimization", 2009.
