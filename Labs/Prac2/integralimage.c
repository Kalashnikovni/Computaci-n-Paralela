#define _GNU_SOURCE
#include <math.h>
#include <omp.h>
#include "sserand.h"
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#include "colormap.h"
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"

// Parameters
static const unsigned int WIDTH  = 1920;
static const unsigned int HEIGHT = 1080;
static const unsigned int FRAMES = 30000;

static unsigned int idx(unsigned int x, unsigned int y, unsigned int stride){
  return y * stride + x;
}

static void random_fill(unsigned char * restrict matrix){
  srand(time(NULL));
    
  fastrand fr;

  uint32_t prngSeed[8];
  uint16_t *sptr = (uint16_t *) prngSeed;

  for(uint8_t i = 0; i < 8; i ++)
    prngSeed[i] = rand();

  InitFastRand(sptr[0], sptr[1], sptr[2], sptr[3],
               sptr[4], sptr[5], sptr[6], sptr[7],
               sptr[8], sptr[9], sptr[10], sptr[11],
               sptr[12], sptr[13], sptr[14], sptr[15], &fr);

  for(unsigned int y = 0; y < HEIGHT; ++y){
    for(unsigned int x = 0; x < WIDTH; x += 4){
      fastRandSSE4(&fr);
      matrix[idx(x, y, WIDTH)] = fr.res[0];
      matrix[idx(x + 1, y, WIDTH)] = fr.res[1];
      matrix[idx(x + 2, y, WIDTH)] = fr.res[2];
      matrix[idx(x + 3, y, WIDTH)] = fr.res[3];
    }
  }
}

static void write_png(const char * filename, const unsigned int * out){
  uint8_t * image = malloc(3 * WIDTH * HEIGHT * sizeof(uint8_t));
  double maxval = (double) out[idx(WIDTH - 1, HEIGHT - 1, WIDTH)];

  for(unsigned int y = 0; y < HEIGHT; ++y){
    for(unsigned int x = 0; x < WIDTH; ++x){
      unsigned int i = idx(x, y, WIDTH);
      //           cm                val     min   max     fr           fg               fb
      colormap_rgb(COLORMAP_INFERNO, out[i], 0.0f, maxval, &image[3*i], &image[3*i + 1], &image[3*i + 2]);
    }
  }

  stbi_write_png(filename, WIDTH, HEIGHT, 3, image, 3 * WIDTH);

  free(image);
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

static void integral_image4(const unsigned char * in, unsigned int * out){
  unsigned int row_sum = 0;
  unsigned int N = log2(HEIGHT * WIDTH);

  for(unsigned int x = 0; x < WIDTH; ++x){
    row_sum += in[x];
    out[x] = row_sum;
  }

  for(unsigned int y = 1; y < HEIGHT; ++y){
    row_sum = 0;

    for(unsigned w = 0; w < WIDTH; w += 16){
      __m128i aux = _mm_set_epi8(in[idx(w, y, WIDTH)], in[idx(w + 1, y, WIDTH)],
                                 in[idx(w + 2, y, WIDTH)], in[idx(w + 3, y, WIDTH)],
                                 in[idx(w + 4, y, WIDTH)], in[idx(w + 5, y, WIDTH)],
                                 in[idx(w + 6, y, WIDTH)], in[idx(w + 7, y, WIDTH)],
                                 in[idx(w + 8, y, WIDTH)], in[idx(w + 9, y, WIDTH)],
                                 in[idx(w + 10, y, WIDTH)], in[idx(w + 11, y, WIDTH)],
                                 in[idx(w + 12, y, WIDTH)], in[idx(w + 13, y, WIDTH)],
                                 in[idx(w + 14, y, WIDTH)], in[idx(w + 15, y, WIDTH)]);
      /*row_sum += in[idx(w, y, WIDTH)];
      out[idx(w, y, WIDTH)] = row_sum + out[idx(w, y-1, WIDTH)];

      row_sum += in[idx(w + 1, y, WIDTH)];
      out[idx(w + 1, y, WIDTH)] = row_sum + out[idx(w + 1, y-1, WIDTH)];

      row_sum += in[idx(w + 2, y, WIDTH)];
      out[idx(w + 2, y, WIDTH)] = row_sum + out[idx(w + 2, y-1, WIDTH)];

      row_sum += in[idx(w + 3, y, WIDTH)];
      out[idx(w + 3, y, WIDTH)] = row_sum + out[idx(w + 3, y-1, WIDTH)];
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

  printf("Size of unsigned int: %d\n", sizeof(unsigned char));

  double ts = omp_get_wtime();
  for(unsigned int frame = 0; frame < FRAMES; ++frame){
    random_fill(input);
    integral_image2(input, result);
  }
  double elapsed = omp_get_wtime() - ts;

  printf("\nTiempo transcurrido: %lf\n\n", elapsed);
  write_png("debug.png", result);

  free(input);
  free(result);

  return 0;
}
