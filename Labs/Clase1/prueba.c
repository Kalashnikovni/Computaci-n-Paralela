// Ejemplo de prueba para chequear las maneras de representar
// el número 0.5

#include <stdio.h> // printf()
#include <math.h>

void
main(void)
{
	float n1 = 2147483595;
    double n2 = pow(2, 32);
	printf("El resultado es: %lf \n", n1 / n2);
}

