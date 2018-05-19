#define _GNU_SOURCE

#include <emmintrin.h>
#include <math.h>
#include <omp.h>
#include <smmintrin.h>
#include "sserand.h"
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#include "colormap.h"
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"

// Intento de vectorizar un poco
typedef int v8si __attribute__ ((vector_size (32)));

// Parameters
static const unsigned int WIDTH  = 2920;
static const unsigned int HEIGHT = 2080;
static const unsigned int FRAMES = 300;

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

  #pragma omp for
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

  for(unsigned int y = 0; y < HEIGHT * WIDTH; ++y){
    unsigned int i = idx(y % WIDTH, y / WIDTH, WIDTH);
    //           cm                val     min   max     fr           fg               fb
    colormap_rgb(COLORMAP_INFERNO, out[i], 0.0f, maxval, &image[3*i], &image[3*i + 1], &image[3*i + 2]);
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

  #pragma omp for ordered collapse(2) private(row_sum)
  for(unsigned int y = 1; y < HEIGHT; ++y){
    row_sum = 0;

    for(unsigned w = 0; w < WIDTH; w += 4){
      row_sum += in[idx(w, y, WIDTH)];
      //#pragma omp ordered
      #pragma omp atomic
      out[idx(w, y, WIDTH)] = row_sum + out[idx(w, y-1, WIDTH)];

      row_sum += in[idx(w + 1, y, WIDTH)];
      //#pragma omp ordered
      #pragma omp atomic
      out[idx(w + 1, y, WIDTH)] = row_sum + out[idx(w + 1, y-1, WIDTH)];

      row_sum += in[idx(w + 2, y, WIDTH)];
      //#pragma omp ordered
      #pragma omp atomic
      out[idx(w + 2, y, WIDTH)] = row_sum + out[idx(w + 2, y-1, WIDTH)];

      row_sum += in[idx(w + 3, y, WIDTH)];
      //#pragma omp ordered
      #pragma omp atomic
      out[idx(w + 3, y, WIDTH)] = row_sum + out[idx(w + 3, y-1, WIDTH)];
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
  for(unsigned int frame = 0; frame < FRAMES; frame++){
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

// Usando CLANG:
// Con O3, integral_image, con y sin vectorize ~ 81''
// Con O2, integral_image, sin vectorize ~ 81''
// Con O2, integral_image, con vectorize ~ 81'' 
// Con O2, integral_image6, con vectorize ~ 82''
// Con O2, integral_image6, sin vectorize ~ 82''
// Con O3, integral_image6, sin vectorize ~ 82''

/***********************************************************************************************/

// Usando GCC:
//
