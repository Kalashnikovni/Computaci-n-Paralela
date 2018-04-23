// Instale: aptitude install libmeschach1.2

#define _GNU_SOURCE
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

// Intentamos un poco de loop tiling

// Parameters
static const unsigned int WIDTH  = 1920;
static const unsigned int HEIGHT = 1080;
static const unsigned int FRAMES = 300;

static unsigned int idx(unsigned int x, unsigned int y, unsigned int stride){
    return y * stride + x;
}

// No ayuda mucho hacer unrolling por aca
static void random_fill(unsigned char * matrix){
    srand(time(NULL));
    /*fastrand fr;

    uint32_t prngSeed[8];
    uint16_t *sptr = (uint16_t *) prngSeed;

    for(uint8_t i = 0; i < 8; i ++)
        prngSeed[i] = rand();

    InitFastRand(sptr[0], sptr[1], sptr[2], sptr[3],
                 sptr[4], sptr[5], sptr[6], sptr[7],
                 sptr[8], sptr[9], sptr[10], sptr[11],
                 sptr[12], sptr[13], sptr[14], sptr[15], &fr);*/

    for(unsigned int y = 0; y < HEIGHT; ++y)
        for(unsigned int x = 0; x < WIDTH; ++x){
            //fastRandSSE4(&fr);
            matrix[idx(x, y, WIDTH)] = rand() % (1 << (8 * sizeof(*matrix)));
            //matrix[idx(x + 1, y, WIDTH)] = rand() % (1 << (8 * sizeof(*matrix)));
            //matrix[idx(x + 2, y, WIDTH)] = rand() % (1 << (8 * sizeof(*matrix)));
            //matrix[idx(x + 3, y, WIDTH)] = rand() % (1 << (8 * sizeof(*matrix)));
        }
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
 
static void integral_image(const unsigned char * in, unsigned int *  out){
    unsigned int row_sum = 0;

    for (unsigned int x = 0; x < WIDTH; ++x){
        row_sum += in[idx(x, 0, WIDTH)];
        out[idx(x, 0, WIDTH)] = row_sum;
    }

    // Hice un poquito de unrolling
    /*for(unsigned int y = 1; y < HEIGHT * WIDTH; y += 1024){
        row_sum = 0;
        for(unsigned x = 0; x < BLOCK; x++){
                row_sum += in[idx(x, y, WIDTH)];
                out[idx(x, y, WIDTH)] = row_sum + out[idx(x, y - 1, WIDTH)];
            }*/
    for(unsigned int y = 1; y < HEIGHT; ++y){
        for(unsigned int x = 0; x < WIDTH; ++x){
            row_sum += in[idx(x, y, WIDTH)];
            out[idx(x, y, WIDTH)] = row_sum + out[idx(x, y - 1, WIDTH)];

            /*row_sum += in[idx(x + 1, y, WIDTH)];
            out[idx(x + 1, y, WIDTH)] = row_sum + out[idx(x + 1, y - 1, WIDTH)];

            row_sum += in[idx(x + 2, y, WIDTH)];
            out[idx(x + 2, y, WIDTH)] = row_sum + out[idx(x + 2, y - 1, WIDTH)];

            row_sum += in[idx(x + 3, y, WIDTH)];
            out[idx(x + 3, y, WIDTH)] = row_sum + out[idx(x + 3, y - 1, WIDTH)];
            */
        }
    }
}

int main(){
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
