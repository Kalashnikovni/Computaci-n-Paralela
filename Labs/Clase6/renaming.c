
void reuso(float x, float y, float z, float *u, float *v, float *w) {
	float a = 99999999;
	a = x + y + z;
	*u = a;
	a = y * z;
	*v = a;
	a = x * z;
	*w = a;
}

// Normal
// gcc-8 -S -O1 renaming.c
// Más libertad para el planificador
// gcc-8 -S -O2 renaming.c
