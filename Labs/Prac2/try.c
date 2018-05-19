#define _GNU_SOURCE
#include <emmintrin.h>
#include <math.h>
#include <omp.h>
#include <smmintrin.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

void try(const unsigned char * in){
  printf("In 0, 1, 2, 3: %c %c %c %c\n", in[0], in[1], in[2], in[3]);

  //int aux0 = in[0];
  //int aux1 = in[1];
  //int aux2 = in[2];
  //int aux3 = in[3];

  __m128i aux = _mm_set_epi32(in[0], in[1], in[2], in[3]);
  aux = _mm_shuffle_epi32(aux, 0x39);
  aux = _mm_set_epi32(0, _mm_extract_epi32(aux, 0x02), _mm_extract_epi32(aux, 0x01), _mm_extract_epi32(aux, 0x00));

  int aux0 = _mm_extract_epi32(aux, 0x00);
  int aux1 = _mm_extract_epi32(aux, 0x01);
  int aux2 = _mm_extract_epi32(aux, 0x02);
  int aux3 = _mm_extract_epi32(aux, 0x03);

  printf("Int1 int2 int3 int4: %d %d %d %d\n", (int) in[0], (int) in[1], (int) in[2], (int) in[3]);
  printf("M 0, 1, 2, 3: %d %d %d %d\n", aux3, aux2, aux1, aux0);
}

/*static void integral_image6(const unsigned char * in, unsigned int * out){
  unsigned int row_sum = 0;

  for(unsigned int x = 0; x < WIDTH; ++x){
    row_sum += in[x];
    out[x] = row_sum;
  }

  for(unsigned int y = 1; y < HEIGHT; ++y){
    row_sum = 0;

    for(unsigned w = 0; w < WIDTH; w += 1){
      row_sum += in[idx(w, y, WIDTH)];
      out[idx(w, y, WIDTH)] = row_sum + out[idx(w, y - 1, WIDTH)];
    }
  }
}*/

/*static void integral_image_sse(const unsigned char * in, unsigned int * out){

  // Llenamos cada fila con la prefix sum
  for(unsigned int y = 0; y < HEIGHT; y++){
    for(unsigned int x = 0; x < WIDTH; x += 4){
      //__m128i fourints = _mm_lddqu_si128(&in[idx(x, y, WIDTH)]);
      __m128i fourints = _mm_set_epi32(in[idx(x, y, WIDTH)], in[idx(x + 1, y, WIDTH)],
                                       in[idx(x + 2, y, WIDTH)], in[idx(x + 3, y, WIDTH)]);

      __m128i shifted = _mm_shuffle_epi32(fourints, 0x39); //00
      shifted = _mm_set_epi32(0, _mm_extract_epi32(shifted, 0x02), 
                              _mm_extract_epi32(shifted, 0x01), _mm_extract_epi32(shifted, 0x00));
      fourints = _mm_add_epi32(fourints, shifted);

      shifted = _mm_shuffle_epi32(fourints, 0x03);
      shifted = _mm_set_epi32(0, 0, 0, _mm_extract_epi32(shifted, 0x00));
      fourints = _mm_add_epi32(fourints, shifted);

      out[idx(x, y, WIDTH)] = _mm_extract_epi32(fourints, 0x03);
      out[idx(x + 1, y, WIDTH)] = _mm_extract_epi32(fourints, 0x02);
      out[idx(x + 2, y, WIDTH)] = _mm_extract_epi32(fourints, 0x01);
      out[idx(x + 3, y, WIDTH)] = _mm_extract_epi32(fourints, 0x00);
    }
  }

  // Ahora a cada posicion le sumamos el argumentito de arriba
  for(unsigned int y = 1; y < HEIGHT; y++)
    for(unsigned int x = 0; x < WIDTH; x++)
      out[idx(x, y, WIDTH)]  += out[idx(x, y - 1, WIDTH)];
}*/

/*static void integral_image5(const unsigned char * in, unsigned int * out){
  unsigned int row_sum = 0;

  for(unsigned int x = 0; x < WIDTH; ++x){
    row_sum += in[x];
    out[x] = row_sum;
  }

  for(unsigned int i = WIDTH; i < HEIGHT * WIDTH; i += 4){
    row_sum = 0;

    unsigned int w = i % WIDTH;
    unsigned int y = i / WIDTH; 

    row_sum += in[idx(w, y, WIDTH)];
    out[idx(w, y, WIDTH)] = row_sum + out[idx(w, y-1, WIDTH)];

    row_sum += in[idx(w + 1, y, WIDTH)];
    out[idx(w + 1, y, WIDTH)] = row_sum + out[idx(w + 1, y-1, WIDTH)];

    row_sum += in[idx(w + 2, y, WIDTH)];
    out[idx(w + 2, y, WIDTH)] = row_sum + out[idx(w + 2, y-1, WIDTH)];

    row_sum += in[idx(w + 3, y, WIDTH)];
    out[idx(w + 3, y, WIDTH)] = row_sum + out[idx(w + 3, y-1, WIDTH)];
  }
}*/

/*static void integral_image4(const unsigned char * in, unsigned int * out){
  unsigned int row_sum = 0;
  unsigned int N = log2(HEIGHT * WIDTH);

  for(unsigned int x = 0; x < WIDTH; ++x){
    row_sum += in[x];
    out[x] = row_sum;
  }

  for(unsigned int y = 1; y < HEIGHT; ++y){
    row_sum = 0;

    for(unsigned w = 0; w < WIDTH; w += 16){
      __m128i load = _mm_set_epi8(in[idx(w, y, WIDTH)], in[idx(w + 1, y, WIDTH)],
                                  in[idx(w + 2, y, WIDTH)], in[idx(w + 3, y, WIDTH)],
                                  in[idx(w + 4, y, WIDTH)], in[idx(w + 5, y, WIDTH)],
                                  in[idx(w + 6, y, WIDTH)], in[idx(w + 7, y, WIDTH)],
                                  in[idx(w + 8, y, WIDTH)], in[idx(w + 9, y, WIDTH)],
                                  in[idx(w + 10, y, WIDTH)], in[idx(w + 11, y, WIDTH)],
                                  in[idx(w + 12, y, WIDTH)], in[idx(w + 13, y, WIDTH)],
                                  in[idx(w + 14, y, WIDTH)], in[idx(w + 15, y, WIDTH)]);

      for(int i = 0; i < 3; i++){
        __m128i shifted = _mm_bsrli_si128(load, pow(2, i));
        load = _mm_add_epi8(load, shifted);
      }
    }
  }
}

__m128i right_shift(__m128i in, int exp){
  
}*/

/*static void integral_image2(const unsigned char * restrict in, unsigned int * restrict out){
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
}*/

int main(void){
  unsigned char * in = malloc(sizeof(unsigned char) * 4);

  in[0] = 'a';
  in[1] = 'b';
  in[2] = 'c';
  in[3] = 'd';
 
  try(in);

  return 0;
}

void integral_image13(const unsigned char * restrict in, unsigned int * restrict out){
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
      outprim[idx(w, y, WIDTH)] = row_sum + outprim[idx(w, y - 1, WIDTH)];
      
      row_sum += inprim[idx(w + 1, y, WIDTH)];
      outprim[idx(w + 1, y, WIDTH)] = row_sum + outprim[idx(w + 1, y - 1, WIDTH)];

      row_sum += inprim[idx(w + 2, y, WIDTH)];
      outprim[idx(w + 2, y, WIDTH)] = row_sum + outprim[idx(w + 2, y - 1, WIDTH)];

      row_sum += inprim[idx(w + 3, y, WIDTH)];
      outprim[idx(w + 3, y, WIDTH)] = row_sum + outprim[idx(w + 3, y - 1, WIDTH)];
    }
  }
}

void integral_image17(const unsigned char * restrict in, unsigned int * restrict out){
  //const unsigned char *inprim = __builtin_assume_aligned(in, 16);
  //unsigned int *outprim = __builtin_assume_aligned(out, 16);

  for(unsigned int x = 0; x < WIDTH; x += 8){
    v8si aux1 = {(unsigned int) in[x], (unsigned int) in[x + 1],
                 (unsigned int) in[x + 2], (unsigned int) in[x + 3],
                 (unsigned int) in[x + 4], (unsigned int) in[x + 5],
                 (unsigned int) in[x + 6], (unsigned int) in[x + 7]};

    const v8si shifted1 = {0, aux1[0], aux1[1], aux1[2],
                           aux1[3], aux1[4], aux1[5], aux1[6]};
    aux1 += shifted1;

    const v8si shifted2 = {0, 0, 0, aux1[0],
                           aux1[1], aux1[2], aux1[3], aux1[4]};
    aux1 += shifted2;

    const v8si shifted3 = {0, 0, 0, 0,
                           0, 0, 0, aux1[0]};
    aux1 += shifted3;

    out[x] = aux1[0];
    out[x + 1] = aux1[1];
    out[x + 2] = aux1[2];
    out[x + 3] = aux1[3];
    out[x + 4] = aux1[4];
    out[x + 5] = aux1[5];
    out[x + 6] = aux1[6];
    out[x + 7] = aux1[7];
  }

  for(unsigned int y = 1; y < HEIGHT; ++y){
    for(unsigned w = 0; w < WIDTH; w += 8){
      
      v8si aux1 = {(unsigned int) in[idx(w, y, WIDTH)], (unsigned int) in[idx(w + 1, y, WIDTH)],
                   (unsigned int) in[idx(w + 2, y, WIDTH)], (unsigned int) in[idx(w + 3, y, WIDTH)],
                   (unsigned int) in[idx(w + 4, y, WIDTH)], (unsigned int) in[idx(w + 5, y, WIDTH)],
                   (unsigned int) in[idx(w + 6, y, WIDTH)], (unsigned int) in[idx(w + 7, y, WIDTH)]};

      const v8si aux2 = {out[idx(w, y - 1, WIDTH)], out[idx(w + 1, y - 1, WIDTH)],
                         out[idx(w + 2, y, WIDTH)], out[idx(w + 3, y - 1, WIDTH)],
                         out[idx(w + 4, y, WIDTH)], out[idx(w + 5, y - 1, WIDTH)],
                         out[idx(w + 6, y, WIDTH)], out[idx(w + 7, y - 1, WIDTH)]};

      aux1 = aux1 + aux2;

      const v8si shifted1 = {0, aux1[0], aux1[1], aux1[2],
                             aux1[3], aux1[4], aux1[5], aux1[6]};
      aux1 += shifted1;

      const v8si shifted2 = {0, 0, 0, aux1[0],
                             aux1[1], aux1[2], aux1[3], aux1[4]};
      aux1 += shifted2;

      const v8si shifted3 = {0, 0, 0, 0,
                             0, 0, 0, aux1[0]};
      aux1 += shifted3;

      out[idx(w, y, WIDTH)] = aux1[0];
      out[idx(w + 1, y, WIDTH)] = aux1[1];
      out[idx(w + 2, y, WIDTH)] = aux1[2];
      out[idx(w + 3, y, WIDTH)] = aux1[3];
      out[idx(w + 4, y, WIDTH)] = aux1[4];
      out[idx(w + 5, y, WIDTH)] = aux1[5];
      out[idx(w + 6, y, WIDTH)] = aux1[6];
      out[idx(w + 7, y, WIDTH)] = aux1[7];
    }
  }
}
