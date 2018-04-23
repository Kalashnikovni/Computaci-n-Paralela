// Instale: aptitude install libmeschach1.2

#define _GNU_SOURCE
#include <cblas.h>
#include <math.h>
#include <meschach/matrix.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <omp.h>
#include <time.h>

#include "colormap.h"
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"

// Parameters
static const unsigned int WIDTH  = 1920;
static const unsigned int HEIGHT = 1080;
static const unsigned int FRAMES = 300;

static unsigned int idx(unsigned int x, unsigned int y, unsigned int stride) {
    return y * stride + x;
}


static void random_fill(unsigned char * matrix) {
    /*m_rand(matrix);
    for(unsigned int x = 0; x < HEIGHT; x++)
        for(unsigned int y = 0; y < WIDTH; y++)
        matrix->me[x][y] *= (double)(1 << (8 * sizeof(*matrix)));
    */
    srand(time(NULL));
    for (unsigned int y = 0; y < HEIGHT; ++y) {
        for (unsigned int x = 0; x < WIDTH; ++x) {
            matrix[idx(x, y, WIDTH)] = rand() % (1 << (8 * sizeof(*matrix)));
        }
    }
}


static void write_png(const char * filename, MAT * out) {
    uint8_t * image = malloc(3 * WIDTH * HEIGHT * sizeof(uint8_t));
    float maxval = (float) out->me[WIDTH - 1][HEIGHT - 1];//[idx(WIDTH - 1, HEIGHT - 1, WIDTH)];

    for (unsigned int y = 0; y < HEIGHT; ++y) {
        for (unsigned int x = 0; x < WIDTH; ++x) {
            unsigned int i = idx(x, y, WIDTH);
            colormap_rgb(COLORMAP_INFERNO, out->me[x][y], 0.0f, maxval, &image[3*i], &image[3*i + 1], &image[3*i + 2]);
        }
    }
    stbi_write_png(filename, WIDTH, HEIGHT, 3, image, 3 * WIDTH);

    free(image);
}


static void integral_image(unsigned char * in, unsigned int * out) {
    // La reestructuracion consiste en usar la multiplicacion de matrices
    // para realizar las operaciones realizadas. Para obtener los valores
    // a la izquierda y por debajo se multiplica a la matriz in por dos
    // matrices triangulares (una inferior y la otra superior). Luego,
    // se suman ambos resultados y se resta el valor de la matriz in
    // que sino sera tenido en cuenta dos veces.

    float * aux1 = malloc(WIDTH * WIDTH * sizeof(unsigned int)), 
          * aux2 = malloc(HEIGHT * HEIGHT * sizeof(unsigned int)),
          * intrmdt1 = malloc(HEIGHT * WIDTH * sizeof(unsigned int)), 
          * intrmdt2 = malloc(HEIGHT * WIDTH * sizeof(unsigned int));
        //* sum = m_get(HEIGHT, WIDTH);

    for(unsigned int i = 0; i < WIDTH; i++){
        for(unsigned int j = 0; j < i; j++)
            aux1[idx(i, j, WIDTH)] = 0;
        for(unsigned int j = WIDTH - i; j < WIDTH; j++)
            aux1[idx(i, j, WIDTH)] = 1;
    }

    for(unsigned int i = 0; i < HEIGHT; i++){
        for(unsigned int j = 0; j <= i; j++)
            aux2[idx(i, j, HEIGHT)] = 1;
        for(unsigned int j = HEIGHT - i; j < HEIGHT; j++)
            aux2[idx(i, j, HEIGHT)] = 0;
    }

    cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,
                HEIGHT, WIDTH, WIDTH,
                1.0, in, WIDTH,
                aux2, HEIGHT, 1.0,
                intrmdt1, WIDTH);
    cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,
                HEIGHT, HEIGHT, WIDTH,
                1.0, aux2, HEIGHT,
                in, WIDTH, 1.0,
                intrmdt2, WIDTH);

    /*m_mlt(in, aux1, intrmdt1);
    m_mlt(aux2, in, intrmdt2);
    m_sub(m_add(intrmdt1, intrmdt2, sum), in, out);
    */
}



int main() {
    size_t input_size = WIDTH * HEIGHT * sizeof(unsigned char);
    unsigned char * input  = malloc(input_size);

    size_t result_size = WIDTH * HEIGHT * sizeof(unsigned int);
    unsigned int * result = malloc(result_size);
    memset(result, 0, result_size);

    double ts = omp_get_wtime();
    for (unsigned int frame = 0; frame < FRAMES; ++frame) {
        random_fill(input);
        integral_image(input, result);
    }
    double elapsed = omp_get_wtime() - ts;

    printf("\nTiempo transcurrido: %lf\n\n", elapsed);
    write_png("debug.png", result);

    free(input);
    free(result);

    return 0;
}
