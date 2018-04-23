// COaD5, Fig. 2.30

#include <omp.h> // omp_get_wtime()
#include <string.h> // memset()
#include <stdio.h> // printf()

#define SIZE (1<<27)
int a[SIZE]; // 512 MiB de memoria

void
clear1(int array[], int size)
{
	int i;
	for (i = 0; i < size; i += 1)
		array[i] = 0;
}

void
clear2(int *array, int size)
{
	int *p;
	for (p = &array[0]; p < &array[size]; p = p + 1)
		*p = 0;
}

void
clear3(int *array, int size)
{
	memset(array, '\0', size*sizeof(array[0]));
}

void
main(void)
{
	double t = omp_get_wtime();
	clear1(a, SIZE);
	printf("clear1: %lf\n", omp_get_wtime()-t);
	t = omp_get_wtime();
	clear2(a, SIZE);
	printf("clear2: %lf\n", omp_get_wtime()-t);
	t = omp_get_wtime();
	clear3(a, SIZE);
	printf("clear3: %lf\n", omp_get_wtime()-t);
}

// Fases de Compilación
// gcc -save-temps clear.c -lgomp
// ls -lt

/*******************************************/
// Preprocesador (cpp)
// gcc -E clear.c > clear.i

// Compilador (cc1)
// gcc -S clear.i

// Ensamblador (as)
// gcc -c clear.s

// Linker (collect2/ld)
// gcc clear.o
/*******************************************/

// Ver todas las etapas intermadias
// gcc -v clear.c -lgomp

// Generación de todo lo intermedio
// gcc -save-temps -fdump-tree-all -fdump-rtl-all -fdump-ipa-all  clear.c -lgomp
// ls -lt

// Tiempos
// gcc -O0 clear.c -lgomp && ./a.out
// ...
// gcc -O3 clear.c -lgomp && ./a.out
// Script:
// for i in {0..3}; do gcc -O$i clear.c -lgomp && ./a.out; echo; done

// Mirando el código intermedio
// gcc -c -O0 -fdump-tree-gimple clear.c
// ...
// gcc -c -O3 -fdump-tree-gimple clear.c

// Mirando el assembler
// gcc -S -O0 clear.c
// ...
// gcc -S -O3 clear.c

// Otro compilador
// for i in {0..3}; do clang -O$i clear.c -lgomp && ./a.out; done 

// En diferentes variaciones de x86_64, ARMv7 y ARMv8.
// Con diferentes compiladores.
