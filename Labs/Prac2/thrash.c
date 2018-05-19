#include <emmintrin.h>
#include <math.h>
#include <pmmintrin.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <wchar.h>

#define HEIGHT 1024
#define WIDTH 2048

static unsigned int idx(unsigned int x, unsigned int y, unsigned int stride){
  return y * stride + x;
}

void integral_image_sse(const unsigned char * in, unsigned int * out){

  // Llenamos cada fila con la prefix sum
  for(unsigned int y = 0; y < HEIGHT; ++y){
    for(unsigned int x = 0; x < WIDTH; x += 4){
      //__m128i fourints = _mm_lddqu_si128(&in[idx(x, y, WIDTH)]);
      __m128i fourints = _mm_loadu_si128(&in[idx(x, y, WIDTH)]);

      __m128i shifted = _mm_srai_epi32(fourints, 0x01);
      fourints = _mm_add_epi32(fourints, shifted);

      shifted = _mm_srai_epi32(fourints, 0x02);
      fourints = _mm_add_epi32(fourints, shifted);

      out[idx(x, y, WIDTH)] = fourints[0];
      out[idx(x + 1, y, WIDTH)] = fourints[1];
      out[idx(x + 2, y, WIDTH)] = fourints[2];
      out[idx(x + 3, y, WIDTH)] = fourints[3];
    }
  }

  // Ahora a cada posicion le sumamos el argumentito de arriba
  for(unsigned int y = 1; y < HEIGHT; ++y)
    for(unsigned int x = 0; x < WIDTH; ++x)
      out[idx(x, y, WIDTH)]  += out[idx(x, y - 1, WIDTH)];
}

void integral_image(const unsigned char * restrict in, unsigned int * restrict out){
  unsigned int row_sum = 0;
  unsigned char *newin = __builtin_assume_aligned(in, 16);
  unsigned char *newout = __builtin_assume_aligned(out, 16);

  for(unsigned int x = 0; x < WIDTH; ++x){
    row_sum += newin[x];
    newout[x] = row_sum;
  }

  for(unsigned int y = 1; y < HEIGHT; ++y){
    row_sum = 0;
    
    for(unsigned w = 0; w < WIDTH; w += 4){
      const unsigned int i1 = idx(w, y, WIDTH);
      const unsigned int old1 = idx(w, y - 1, WIDTH);
      const unsigned int i2 = idx(w + 1, y, WIDTH);
      const unsigned int old2 = idx(w, y - 1, WIDTH);
      const unsigned int i3 = idx(w + 2, y, WIDTH);
      const unsigned int old3 = idx(w + 2, y - 1, WIDTH);
      const unsigned int i4 = idx(w + 3, y, WIDTH);
      const unsigned int old4 = idx(w + 3, y - 1, WIDTH);

      row_sum += newin[i1];
      newout[i1] = row_sum + newout[old1];

      row_sum += newin[i2];
      newout[i2] = row_sum + newout[old2];

      row_sum += newin[i3];
      newout[i3] = row_sum + newout[old3];

      row_sum += newin[i4];
      newout[i4] = row_sum + newout[old4];
    }
  }
}

// Primero probemos con un tamaño que sea 2**n, despues lo generalizo
// Quiero vectorizar, LULZ
/*void integral_image2(const unsigned char * restrict in, unsigned int * restrict out){
  //unsigned int row_sum = 0;
  unsigned char *newin = __builtin_assume_aligned(in, 8);
  unsigned char *newout = __builtin_assume_aligned(out, 8);

  // Primero necesito saber el "n"
  int n = log2(HEIGHT * WIDTH);

  for(unsigned int i = 0; i < n; ++i)
    for(int y = 0; y < HEIGHT; ++y)
      for(int x = 0; x < WIDTH; ++x){
        int aux = pow(2, i);
        out[idx(x, y, WIDTH)] = (unsigned int) in[idx(x, y, WIDTH)] +
                                (unsigned int) in[x - aux < 0 ? 0 : idx(x - aux, y, WIDTH)]; 
      }

  
        printf("Llegue primi\n");
  // Transponemos la matriz a todo vuelo (supuestamente)!
  transpose_block_SSE4x4(out, out, HEIGHT, WIDTH, WIDTH, WIDTH, 16);

  // Volvemos a hacer prefix sum
  for(unsigned int i = 0; i < n; ++i)
    for(int y = 0; y < HEIGHT; ++y)
      for(int x = 0; x < WIDTH; ++x){
        printf("Llegue primi\n");
        out[idx(x, y, WIDTH)] = out[idx(x, y, WIDTH)] +
                                out[x - pow(2, i) < 0 ? 0 : idx(x - pow(2, i), y, WIDTH)]; 
        printf("Llegue\n");}

  // Repetimos la chachara de antes
  transpose_block_SSE4x4(out, out, HEIGHT, WIDTH, WIDTH, WIDTH, 16);
}*/

int main(void){
  unsigned char in[HEIGHT * WIDTH] = {0};
  unsigned int * out = malloc(sizeof(unsigned int) * WIDTH * HEIGHT);

  integral_image_sse(in, out);

  return 0;
}

