// Instale: aptitude install libmeschach1.2

#define _GNU_SOURCE
#include <cblas.h>
#include <math.h>
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

// For fast randomize
static unsigned int g_seed;

static unsigned int idx(unsigned int x, unsigned int y, unsigned int stride){
    return y * stride + x;
}

static void random_fill(unsigned char * matrix){
    srand(time(NULL));
    for (unsigned int y = 0; y < HEIGHT; ++y){
        for (unsigned int x = 0; x < WIDTH; ++x){
            matrix[idx(x, y, WIDTH)] = fastrand() % (1 << (8 * sizeof(*matrix)));
        }
    }
}

//Used to seed the generator.
inline void fast_srand(int seed){
    g_seed = seed;
}
 
//fastrand routine returns one integer, similar output value range as C lib.
inline int fastrand(){
    g_seed = (214013*g_seed+2531011);
    return (g_seed>>16)&0x7FFF;
}

static void write_png(const char * filename, const unsigned int * out){
    uint8_t * image = malloc(3 * WIDTH * HEIGHT * sizeof(uint8_t));
    float maxval = (float) out[idx(WIDTH - 1, HEIGHT - 1, WIDTH)];

    for (unsigned int y = 0; y < HEIGHT; ++y){
        for (unsigned int x = 0; x < WIDTH; ++x){
            unsigned int i = idx(x, y, WIDTH);
            colormap_rgb(COLORMAP_INFERNO, out[i], 0.0f, maxval, &image[3*i], &image[3*i + 1], &image[3*i + 2]);
        }
    }

    stbi_write_png(filename, WIDTH, HEIGHT, 3, image, 3 * WIDTH);

    free(image);
}
 
static void integral_image(const unsigned char * in, unsigned int * out,
                           unsigned int * restrict upTriangMatrix1,
                           unsigned int * restrict upTriangMatrix2){
    float * aux = malloc(HEIGHT * WIDTH * sizeof(float));

    for(unsigned int y = 0; y < HEIGHT; y++)
        for(unsigned int x = 0; x < WIDTH; x++)
            aux[idx(x, y, WIDTH)] = in[idx(x, y, WIDTH)];

    cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,
                // a = m * k
                // b = k * n
                HEIGHT, WIDTH, HEIGHT,
                1.0, upTriangMatrix1, HEIGHT,
                aux, WIDTH,
                -1.0, aux, WIDTH);

    cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans,
                HEIGHT, WIDTH, WIDTH,
                1.0, aux, WIDTH,
                upTriangMatrix2, WIDTH,
                1.0, aux, WIDTH);

    for(unsigned int x = 0; x < WIDTH * HEIGHT; x++)
        out[x] = aux[x];
}

int main(){
    size_t input_size = WIDTH * HEIGHT * sizeof(unsigned char);
    unsigned char * input  = malloc(input_size);

    size_t result_size = WIDTH * HEIGHT * sizeof(unsigned int);
    unsigned int * result = malloc(result_size);
    memset(result, 0, result_size);

    // Matrices auxiliares, para calcular integral image
    unsigned int * restrict upTriangMatrix1 = malloc(HEIGHT * HEIGHT * sizeof(unsigned int));
    unsigned int * restrict upTriangMatrix2 = malloc(WIDTH * WIDTH * sizeof(unsigned int));

    for(unsigned int y = 0; y < HEIGHT; y++)
        for(unsigned int x = 0; x < HEIGHT; x++)
            if(x > y)
                upTriangMatrix1[idx(x, y, HEIGHT)] = 0;
            else
                upTriangMatrix1[idx(x, y, HEIGHT)] = 1;

    for(unsigned int y = 0; y < WIDTH; y++)
        for(unsigned int x = 0; x < WIDTH; x++)
            if(y > x)
                upTriangMatrix2[idx(x, y, WIDTH)] = 0;
            else
                upTriangMatrix2[idx(x, y, WIDTH)] = 1;

    double ts = omp_get_wtime();
    for (unsigned int frame = 0; frame < FRAMES; ++frame) {
        random_fill(input);
        integral_image(input, result, upTriangMatrix1, upTriangMatrix2);
    }
    double elapsed = omp_get_wtime() - ts;

    printf("\nTiempo transcurrido: %lf\n\n", elapsed);
    write_png("debug.png", result);

    free(input);
    free(result);

    return 0;
}
