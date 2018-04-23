// This program is free software: you can use, modify and/or redistribute it
// under the terms of the simplified BSD License. You should have received a
// copy of this license along this program. If not, see
// <http://www.opensource.org/licenses/bsd-license.html>.
//
// Copyright 2012, Enric Meinhardt Llopis <enric.meinhardt@cmla.ens-cachan.fr>
// All rights reserved.

#include <math.h>
#include <omp.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

// this function is like "malloc", but it returns always a valid pointer
static void *xmalloc(size_t size){
    void *new = malloc(size);
    if(!new)
        exit(fprintf(stderr, "out of memory\n"));
    return new;
}

// the type of the "getpixel" function
typedef float (*extension_operator_float)(float*, int, int, int, int);

// getpixel, with neumann boundary conditions
static float extend_float_image_constant(float *x, int w, int h, int i, int j){
    if(i < 0) i = 0;
    if(j < 0) j = 0;
    if(i >= w) i = w - 1;
    if(j >= h) j = h - 1;
    return x[j * w + i];
}

// compute the gradient and temporal derivative of the input image pair
static void compute_input_derivatives(float *Ex, float *Ey, float *Et, float *a, float *b, int w, int h){
    extension_operator_float p = extend_float_image_constant;
    
    for(int j = 0; j < h; j++)
        for(int i = 0; i < w; i++){
            Ey[j * w + i] = 
                (1.0 / 4) * (p(a, w, h, i, j + 1) - p(a, w, h, i, j) +
                             p(a, w, h, i + 1, j + 1) - p(a, w, h, i + 1, j) +
                             p(b, w, h, i, j + 1) - p(b, w, h, i, j) +
                             p(b, w, h, i + 1, j + 1) - p(b, w, h, i + 1, j));

            Ex[j * w + i] = 
                (1.0 / 4) * (p(a, w, h, i + 1, j) - p(a, w, h, i, j) +
                             p(a, w, h, i + 1, j + 1) - p(a, w, h, i, j + 1) +
                             p(b, w, h, i + 1, j) - p(b, w, h, i, j) +
                             p(b, w, h, i + 1, j + 1) - p(b, w, h, i, j + 1));

            Et[j * w + i] = 
                (1.0 / 4) * (p(b, w, h, i, j) - p(a, w, h, i, j) +
                             p(b, w, h, i + 1, j) - p(a, w, h, i + 1, j) +
                             p(b, w, h, i, j + 1) - p(a, w, h, i, j + 1) +
                             p(b, w, h, i + 1, j + 1) - p(a, w, h, i + 1, j + 1));
        }
}

// compute a local average of a function "u"
static void compute_bar(float *ubar, float *u, int w, int h){
    float aux1, aux2, aux3;
    extension_operator_float p = extend_float_image_constant;

    for(int j = 0; j < h; j++)
        for(int i = 0; i < w; i = i + 3){
            aux1 = p(u, w, h, i, j - 1) +
                   p(u, w, h, i, j + 1);
            aux2 = p(u, w, h, i + 1, j - 1) +
                   p(u, w, h, i + 1, j + 1);
            aux3 = p(u, w, h, i + 2, j - 1) +
                   p(u, w, h, i + 2, j + 1); 

            ubar[j * w + i] = 
                (1.0 / 6) * (p(u, w, h, i - 1, j) + p(u, w, h, i + 1, j) +
                             aux1) +
                (1.0 / 12) * (p(u, w, h, i - 1, j - 1) + p(u, w, h, i - 1, j + 1) + 
                              aux2);

            ubar[j * w + i + 1] = 
                (1.0 / 6) * (p(u, w, h, i, j) + p(u, w, h, i + 2, j) + aux2) +
                (1.0 / 12) * (aux1 + aux3);

            ubar[j * w + i + 2] = 
                (1.0 / 6) * (p(u, w, h, i - 1, j) + p(u, w, h, i + 3, j) +
                             aux3) +
                (1.0 / 12) * (2 * aux2);
        }
}

// compute a sigle iteration of the classical Horn-Schunck method
static void hs_iteration(float *u, float *v, float *Ex, float *Ey, float *Et, int w, int h, float alpha){
    unsigned int sz = w * h * sizeof(float);
    float *ubar = xmalloc(sz);
    float *vbar = xmalloc(sz);

    compute_bar(ubar, u, w, h);
    compute_bar(vbar, v, w, h);

    for(int i = 0; i < w * h; i++){
        float t = Ex[i] * ubar[i] + Ey[i] * vbar[i] + Et[i];
        t /= alpha * alpha + Ex[i] * Ex[i] + Ey[i] * Ey[i];
        u[i] = ubar[i] - Ex[i] * t;
        v[i] = vbar[i] - Ey[i] * t;
    }

    free(ubar);
    free(vbar);
}

// run n iterations of the classical Horn-Schunck method
void hs(float *u, float *v, float *a, float *b, int w, int h, int n, float alpha){
    unsigned int sz = w * h * sizeof(float);
    float *gx = xmalloc(sz);
    float *gy = xmalloc(sz);
    float *gt = xmalloc(sz);

    compute_input_derivatives(gx, gy, gt, a, b, w, h);

    memset(u, 0, w * h * sizeof(float));
    memset(v, 0, w * h * sizeof(float));
    //for(int i = 0; i < w * h; i++)
    //    u[i] = v[i] = 0;
    for(int i = 0; i < n; i++)
        hs_iteration(u, v, gx, gy, gt, w, h, alpha);

    free(gx);
    free(gy);
    free(gt);
}


#ifndef OMIT_MAIN
#include "iio.h"

// main function for testing the Horn-Schunck method from the command line
int main(int argc, char *argv[]){
    if (argc < 6)
        return fprintf(stderr,"usage:\n\t%s niter alpha a b f\n",*argv);
    //                                        0 1     2     3 4 5
    char *filename_a = argv[3], *filename_b = argv[4], *filename_f = argv[5];
    int niter = atoi(argv[1]), w, h, ww, hh;
    float alpha = atof(argv[2]),
          *a = iio_read_image_float(filename_a, &w, &h),
          *b = iio_read_image_float(filename_b, &ww, &hh);

    if (w != ww || h != hh)
        return fprintf(stderr, "input images size mismatch\n");

    float *u = xmalloc(2 * w * h * sizeof(float)), *v = u + w * h;

    double start = omp_get_wtime();
    hs(u, v, a, b, w, h, niter, alpha);
    double elapsed = omp_get_wtime() - start;

    printf("\nElapsed time: %lf\n", elapsed);

    iio_save_image_float_split(filename_f, u, w, h, 2);
    return EXIT_SUCCESS;
}
#endif//OMIT_MAIN
