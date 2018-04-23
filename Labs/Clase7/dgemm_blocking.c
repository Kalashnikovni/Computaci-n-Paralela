
//   Allen, ADVANCED COMPILING FOR HIGH PERFORMANCE, p.46 

#include <omp.h> // omp_get_wtime()
#include <stdio.h> // printf()

#ifndef SIZE
#define SIZE 1024
#endif

#ifndef BLOCKSIZE
#define BLOCKSIZE 32
#endif

unsigned const N = SIZE;
unsigned const L = BLOCKSIZE;
double A[SIZE][SIZE];
double B[SIZE][SIZE];
double C[SIZE][SIZE];

void main(void)
{
	double start = omp_get_wtime();

	for (int II=0; II<N; II+=L) { //DO II = 1, N, L
		for (int JJ=0; JJ<N; JJ+=L) { //DO JJ = 1, N, L
			//for (int i=II; i<II+L; ++i) { //DO i = II, II+L-1
			//	for (int j=JJ; j<JJ+L; ++j) { //DO j = JJ, JJ+L-1
			//		C[i][j] = 0.0; //C(j,i) = 0.0
			//	}
			//}
			for (int KK=0; KK<N; KK+=L) { //DO KK = 1, N , L
				for (int i=II; i<II+L; ++i) { //DO i = II, II+L-1
					for (int j=JJ; j<JJ+L; ++j) { //DO j = JJ, JJ+L-1
						for (int k=KK; k<KK+L; ++k) { //DO k = KK, KK+L-1
							C[i][j] += A[k][j]*B[i][k]; //C(j,i) = C(j,i) + A(j,k) * B(k,i)
						}
					}
				}
			}
		}
	}

	printf("GFLOPS %lf\n", 2.0*N*N*N/((1<<30)*(omp_get_wtime()-start)));
}