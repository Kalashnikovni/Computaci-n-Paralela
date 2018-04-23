// Compilar con: gcc -lm -lgomp heat.c

#define _GNU_SOURCE
#include <math.h>
#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <time.h>

#include "colormap.h"
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"

// Simulation parameters
static const unsigned int N = 1500;

static const float SOURCE_TEMP = 5000.0f;
static const float BOUNDARY_TEMP = 2500.0f;

static const float MIN_DELTA = 0.05f;
static const unsigned int MAX_ITERATIONS = 10000;


static unsigned int idx(unsigned int x, unsigned int y, unsigned int stride) {
    return y * stride + x;
}


static void init(unsigned int source_x, unsigned int source_y, float * matrix) {
    // init
    memset(matrix, 0, N * N * sizeof(float));

    // place source
    matrix[idx(source_x, source_y, N)] = SOURCE_TEMP;

    // fill borders
    for (unsigned int x = 0; x < N; ++x) {
        matrix[idx(x, 0,   N)] = BOUNDARY_TEMP;
        matrix[idx(x, N-1, N)] = BOUNDARY_TEMP;
    }
    for (unsigned int y = 0; y < N; ++y) {
        matrix[idx(0,   y, N)] = BOUNDARY_TEMP;
        matrix[idx(N-1, y, N)] = BOUNDARY_TEMP;
    }
}

// Flops: 4 * (N - 2) * (N - 2)
static void step(unsigned int source_x, unsigned int source_y, const float * current, float * next) {
    unsigned int index = idx(source_x, source_y, N);
    int aux = next[index];
    for (unsigned int y = 1; y < N-1; ++y) {
        for (unsigned int x = 1; x < N-1; ++x) {
            /* Comentado para optimizar */
            /* if ((y == source_y) && (x == source_x)) {
                continue;
            } */
            next[idx(x, y, N)] = (current[idx(x, y-1, N)] +
                                  current[idx(x-1, y, N)] +
                                  current[idx(x+1, y, N)] +
                                  current[idx(x, y+1, N)]) / 4.0f;
        }
    }
    next[index] = aux;
}

// Flops: 3 * (N - 2) * (N - 2)
static float diff(const float * current, const float * next) {
    float maxdiff = 0.0f;
    for (unsigned int y = 1; y < N-1; ++y) {
        for (unsigned int x = 1; x < N-1; ++x) {
            maxdiff = fmaxf(maxdiff, fabsf(next[idx(x, y, N)] - current[idx(x, y, N)]));
        }
    }

    return maxdiff;
}


void write_png(float * current) {
    uint8_t * image = malloc(3 * N * N * sizeof(uint8_t));
    float maxval = fmaxf(SOURCE_TEMP, BOUNDARY_TEMP);

    for (unsigned int y = 0; y < N; ++y) {
        for (unsigned int x = 0; x < N; ++x) {
            unsigned int i = idx(x, y, N);
            colormap_rgb(COLORMAP_INFERNO, current[i], 0.0f, maxval, &image[3*i], &image[3*i + 1], &image[3*i + 2]);
        }
    }
    stbi_write_png("heat.png", N, N, 3, image, 3 * N);

    free(image);
}


int main() {
    size_t array_size = N * N * sizeof(float);

    float * current = malloc(array_size);
    float * next = malloc(array_size);

    srand(time(NULL));
    unsigned int source_x = rand() % (N-2) + 1;
    unsigned int source_y = rand() % (N-2) + 1;
    printf("Heat source at (%u, %u)\n", source_x, source_y);

    init(source_x, source_y, current);
    memcpy(next, current, array_size);

    double ts = omp_get_wtime();

    float t_diff = SOURCE_TEMP;
    for (unsigned int it = 0; (it < MAX_ITERATIONS) && (t_diff > MIN_DELTA); ++it) {
        step(source_x, source_y, current, next);
        t_diff = diff(current, next);
        printf("%u: %f\n", it, t_diff);

        float * swap = current;
        current = next;
        next = swap;
    }

    double elapsed = omp_get_wtime() - ts;
    unsigned int flops = 4 * (N - 2) * (N - 2) * 3 * (N - 2) * (N - 2); 

    write_png(current);

    free(current);
    free(next);

    printf("%f GFLOPS\n", flops / (elapsed * 1000.0 * 1000.0 * 1000.0));
    printf("Tiempo consumido en el loop: %lf\n", elapsed);

    return 0;
}
