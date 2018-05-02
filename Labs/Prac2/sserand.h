// Generacion aún más veloz de números aleatorios

#ifndef FASTRAND_H_INCLUDED
#define FASTRAND_H_INCLUDED

#include <stdint.h>
#include <xmmintrin.h>
#include <emmintrin.h>
#include <smmintrin.h>

typedef struct fastrand_t{
    uint32_t a[4];
    uint32_t b[4];
    uint32_t mask[4];
    uint32_t m1[4];
    uint32_t m2[4];
    uint32_t res[4];
} fastrand;

static void InitFastRand(uint16_t a1, uint16_t c1,
                         uint16_t b1, uint16_t d1,
                         uint16_t a2, uint16_t d2,
                         uint16_t b2, uint16_t c2,
                         uint16_t a3, uint16_t d3,
                         uint16_t b3, uint16_t c3,
                         uint16_t a4, uint16_t d4,
                         uint16_t b4, uint16_t c4,
                         fastrand *f){
    uint8_t i;

    for(i = 0; i < 4; i++){
        f -> mask[i] = 0xFFFF;  
        f -> m1[i] = 0x4650;
        f -> m2[i] = 0x78B7;
    }

    f -> a[0] = ((uint32_t) c1 << 16) | a1;
    f -> a[1] = ((uint32_t) c1 << 16) | a2;
    f -> a[2] = ((uint32_t) c1 << 16) | a3;
    f -> a[3] = ((uint32_t) c1 << 16) | a4;
    f -> b[0] = ((uint32_t) c1 << 16) | b1;
    f -> b[1] = ((uint32_t) c1 << 16) | b2;
    f -> b[2] = ((uint32_t) c1 << 16) | b3;
    f -> b[3] = ((uint32_t) c1 << 16) | b4;
}

static inline void fastRandSSE4(fastrand *f){
    __m128i a = _mm_load_si128((const __m128i *) f -> a);
    __m128i b = _mm_load_si128((const __m128i *) f -> b);

    const __m128i mask = _mm_load_si128((const __m128i *) f -> mask);
    const __m128i m1 = _mm_load_si128((const __m128i *) f -> m1);
    const __m128i m2 = _mm_load_si128((const __m128i *) f -> m2);

    __m128i amask = _mm_and_si128(a, mask);
    __m128i ashift = _mm_srli_epi32(a, 0x10);
    __m128i amul = _mm_mullo_epi32(amask, m1);
    __m128i anew = _mm_add_epi32(amul, ashift);
    _mm_store_si128((__m128 *) f -> a, anew);

    __m128i bmask = _mm_and_si128(b, mask);
    __m128i bshift = _mm_srli_epi32(b, 0x10);
    __m128i bmul = _mm_mullo_epi32(bmask, m2);
    __m128i bnew = _mm_add_epi32(bmul, bshift);
    _mm_store_si128((__m128i *) f -> b, bnew);

    __m128i bmasknew = _mm_and_si128(bnew, mask);
    __m128i ashiftnew = _mm_slli_epi32(anew, 0x10);
    __m128i res = _mm_add_epi32(ashiftnew, bmasknew);
    _mm_store_si128((__m128i *) f -> res, res);
}

#endif
