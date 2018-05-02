#define _GNU_SOURCE
#include <math.h>
#include <omp.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// Parameters
static const unsigned int WIDTH  = 1920;
static const unsigned int HEIGHT = 1080;
static const unsigned int FRAMES = 3000;

static unsigned int idx(unsigned int x, unsigned int y, unsigned int stride){
  return y * stride + x;
}

static void integral_image(const unsigned char * in, unsigned int * out){
  unsigned int row_sum = 0;

  for(unsigned int x = 0; x < WIDTH; ++x){
    row_sum += in[x];
    out[x] = row_sum;
  }

  for(unsigned int y = 1; y < HEIGHT; ++y){
    row_sum = 0;

    for(unsigned w = 0; w < WIDTH; w += 4){
      row_sum += in[idx(w, y, WIDTH)];
      out[idx(w, y, WIDTH)] = row_sum + out[idx(w, y-1, WIDTH)];

      row_sum += in[idx(w + 1, y, WIDTH)];
      out[idx(w + 1, y, WIDTH)] = row_sum + out[idx(w + 1, y-1, WIDTH)];

      row_sum += in[idx(w + 2, y, WIDTH)];
      out[idx(w + 2, y, WIDTH)] = row_sum + out[idx(w + 2, y-1, WIDTH)];

      row_sum += in[idx(w + 3, y, WIDTH)];
      out[idx(w + 3, y, WIDTH)] = row_sum + out[idx(w + 3, y-1, WIDTH)];
    }
  }
}

static void integral_image2(const unsigned char * restrict in, unsigned int * restrict out){
  unsigned int row_sum = 0;
  const unsigned char *inprim = __builtin_assume_aligned(in, 16);
  unsigned int *outprim = __builtin_assume_aligned(out, 16);

  for(unsigned int x = 0; x < WIDTH; ++x){
    row_sum += inprim[x];
    outprim[x] = row_sum;
  }

  for(unsigned int y = 1; y < HEIGHT; ++y){
    row_sum = 0;

    for(unsigned w = 0; w < WIDTH; w += 4){
      row_sum += inprim[idx(w, y, WIDTH)];
      outprim[idx(w, y, WIDTH)] = row_sum + outprim[idx(w, y-1, WIDTH)];

      row_sum += inprim[idx(w + 1, y, WIDTH)];
      outprim[idx(w + 1, y, WIDTH)] = row_sum + outprim[idx(w + 1, y-1, WIDTH)];

      row_sum += inprim[idx(w + 2, y, WIDTH)];
      outprim[idx(w + 2, y, WIDTH)] = row_sum + outprim[idx(w + 2, y-1, WIDTH)];

      row_sum += inprim[idx(w + 3, y, WIDTH)];
      outprim[idx(w + 3, y, WIDTH)] = row_sum + outprim[idx(w + 3, y-1, WIDTH)];
    }
  }
}

static void integral_image3(const unsigned char * restrict in, unsigned int * restrict out){
  unsigned int row_sum = 0;
  const unsigned char *inprim = __builtin_assume_aligned(in, 16);
  unsigned int *outprim = __builtin_assume_aligned(out, 16);

  for(unsigned int x = 0; x < WIDTH; ++x){
    row_sum += inprim[x];
    outprim[x] = row_sum;
  }

  for(unsigned int y = 1; y < WIDTH * HEIGHT; ++y){
    row_sum = 0;

    const unsigned int w = y % WIDTH; 
    const unsigned int z = y / WIDTH + 1;
    //for(unsigned w = 0; w < WIDTH; w += 4){
      row_sum += inprim[idx(w, z, WIDTH)];
      outprim[idx(w, z, WIDTH)] = row_sum + outprim[idx(w, z - 1, WIDTH)];

      row_sum += inprim[idx(w + 1, z, WIDTH)];
      outprim[idx(w + 1, z, WIDTH)] = row_sum + outprim[idx(w + 1, z - 1, WIDTH)];

      row_sum += inprim[idx(w + 2, z, WIDTH)];
      out[idx(w + 2, z, WIDTH)] = row_sum + outprim[idx(w + 2, z - 1, WIDTH)];

      row_sum += inprim[idx(w + 3, z, WIDTH)];
      outprim[idx(w + 3, z, WIDTH)] = row_sum + outprim[idx(w + 3, z - 1, WIDTH)];
    //}
  }
}
