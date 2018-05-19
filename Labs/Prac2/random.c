#include <emmintrin.h>
#include <smmintrin.h>
#include <stdio.h>

int main(void){
  unsigned char * input = malloc(16 * sizeof(unsigned char));
  unsigned int * res = malloc(4 * sizeof(unsigned int));

  __m128i sse;

  input[0] = 0x00;
  input[1] = 0x01;
  input[2] = 0x02;
  input[3] = 0xFF;
  input[4] = 0x04;
  input[5] = 0x05;
  input[6] = 0x06;
  input[7] = 0x00;
  input[8] = 0x08;
  input[9] = 0x09;
  input[10] = 0x0A;
  input[11] = 0x00;
  input[12] = 0x0C;
  input[13] = 0x0D;
  input[14] = 0x0E;
  input[15] = 0x0F;

  sse = _mm_set_epi8(input[0], input[1], input[2], input[3], input[4], input[5], input[6], input[7],
                     input[8], input[9], input[10], input[11], input[12], input[13], input[14], input[15]);

  res[0] = _mm_extract_epi8(sse, 0x0F);
  res[1] = _mm_extract_epi8(sse, 0x0C);
  res[2] = _mm_extract_epi8(sse, 0x08);
  res[3] = _mm_extract_epi8(sse, 0x04);

  printf("Res1: %u\n", res[0]);
  printf("Res2: %u\n", res[1]);
  printf("Res3: %u\n", res[2]);
  printf("Res4: %u\n", res[3]);

  return 0;
}
