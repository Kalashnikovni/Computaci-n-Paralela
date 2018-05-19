#include <emmintrin.h>
#include <stdio.h>

static void transpose4x4_SSE(unsigned int *A, unsigned int *B, const int lda, const int ldb) {
    __m128i row1 = _mm_load_si128(&A[0*lda]);
    __m128i row2 = _mm_load_si128(&A[1*lda]);
    __m128i row3 = _mm_load_si128(&A[2*lda]);
    __m128i row4 = _mm_load_si128(&A[3*lda]);
     _MM_TRANSPOSE4_SI128(row1, row2, row3, row4);
     _mm_store_si128(&B[0*ldb], row1);
     _mm_store_si128(&B[1*ldb], row2);
     _mm_store_si128(&B[2*ldb], row3);
     _mm_store_si128(&B[3*ldb], row4);
}

_MM_TRANSPOSE4_SI128(__m128i row1, __m128i row2, __m128i row3, __m128i row4){
  __m128i t1 = _mm_unpacklo_epi32(row1, row2);
  __m128i t2 = _mm_unpacklo_epi32(row3, row4);
  __m128i t3 = _mm_unpackhi_epi32(row1, row2);
  __m128i t4 = _mm_unpackhi_epi32(row3, row4);

  row1[0] = t1[0];
  row1[1] = t1[1];
  row1[2] = t3[0];
  row1[3] = t3[1];

  row2[0] = t3[0];
  row2[1] = t3[1];
  row2[2] = t1[0];
  row2[3] = t1[1];

  row3[0] = t2[0];
  row3[1] = t2[1];
  row3[2] = t4[0];
  row3[3] = t4[1];

  row4[0] = t4[0];
  row4[1] = t4[1];
  row4[2] = t2[0];
  row4[3] = t2[1];
}

void transpose_block_SSE4x4(unsigned int *A, unsigned int *B, const int n, const int m, const int lda, const int ldb, const int block_size) {
    #pragma omp parallel for
    for(int i=0; i<n; i+=block_size) {
        for(int j=0; j<m; j+=block_size) {
            int max_i2 = i+block_size < n ? i + block_size : n;
            int max_j2 = j+block_size < m ? j + block_size : m;
            for(int i2=i; i2<max_i2 - 1; i2+=4) {
                for(int j2=j; j2<max_j2 - 1; j2+=4) {
                    printf("Index 1, index 2, j2, i2: %d %d %d %d\n", i2*lda+j2, j2*ldb+i2, j2, i2);
                    transpose4x4_SSE(&A[i2*lda +j2], &B[j2*ldb + i2], lda, ldb);
                }
            }
        }
    }
}
