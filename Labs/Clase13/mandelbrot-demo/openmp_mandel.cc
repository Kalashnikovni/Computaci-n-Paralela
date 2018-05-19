#include <SDL.h>
#include <signal.h>
#include <complex>
#include <cstdio>
#include <omp.h>
#include <sched.h>

typedef std::complex<double> complex;

static SDL_Surface* surface;

static int MandelbrotCalculate(complex c, int maxiter)
{
    // iterates z = z² + c until |z| >= 2 or maxiter is reached,
    // returns the number of iterations.
    int n=0;
    complex z = c;
    for(; n<maxiter; ++n)
    {
        double zr2 = z.real() * z.real(),
               zi2 = z.imag() * z.imag();
        if(zr2 + zi2 >= 4.0) break;
        z = complex( zr2-zi2, 2*z.real()*z.imag() ) + c;
    }
    return n;
}

////
#undef Name
#define Name RenderMandel_Dynamic_With_ChunkSize_4
#define I 1
  #include "render.inc"
  #pragma omp parallel for schedule(dynamic,4) private(private_pixcount)
#undef I
#define I 2
  #include "render.inc"
#undef I
#define I 3
  #include "render.inc"
#undef I
////
#undef Name
#define Name RenderMandel_Static
#define I 1
  #include "render.inc"
  #pragma omp parallel for schedule(static) private(private_pixcount)
#undef I
#define I 2
  #include "render.inc"
#undef I
#define I 3
  #include "render.inc"
#undef I
////
#undef Name
#define Name RenderMandel_Static_With_ChunkSize_60
#define I 1
  #include "render.inc"
  #pragma omp parallel for schedule(static,60) private(private_pixcount)
#undef I
#define I 2
  #include "render.inc"
#undef I
#define I 3
  #include "render.inc"
#undef I
////
#undef Name
#define Name RenderMandel_Guided_With_ChunkSize_4
#define I 1
  #include "render.inc"
  #pragma omp parallel for schedule(guided,4) private(private_pixcount)
#undef I
#define I 2
  #include "render.inc"
#undef I
#define I 3
  #include "render.inc"
#undef I


////
#undef Name
#define Name RenderMandel_Dynamic_Ordered
#define I 1
  #include "render.inc"
  #pragma omp parallel for schedule(dynamic) ordered private(private_pixcount)
#undef I
#define I 2
  #include "render.inc"
  #pragma omp ordered
#undef I
#define I 3
  #include "render.inc"
#undef I
////
#undef Name
#define Name RenderMandel_Static_Ordered
#define I 1
  #include "render.inc"
  #pragma omp parallel for schedule(static) ordered private(private_pixcount)
#undef I
#define I 2
  #include "render.inc"
  #pragma omp ordered
#undef I
#define I 3
  #include "render.inc"
#undef I
////
#undef Name
#define Name RenderMandel_Guided_Ordered
#define I 1
  #include "render.inc"
  #pragma omp parallel for schedule(guided) ordered private(private_pixcount)
#undef I
#define I 2
  #include "render.inc"
  #pragma omp ordered
#undef I
#define I 3
  #include "render.inc"
#undef I

static const struct Renderer
{
    const char* name;
    void (*func)(int w,int h);
} Renderers[] =
{
    #define D(n) { #n, n },
    D(RenderMandel_Dynamic_With_ChunkSize_4)
    D(RenderMandel_Static)
    D(RenderMandel_Static_With_ChunkSize_60)
    D(RenderMandel_Guided_With_ChunkSize_4)
    D(RenderMandel_Dynamic_Ordered)
    D(RenderMandel_Static_Ordered)
    D(RenderMandel_Guided_Ordered)
};

int main(int argc, const char* const* argv)
{
    if(argc != 2)
    {
        std::printf(
            "Usage: openmp_mandel <algorithm_number>\n"
            "\n"
            "Algorithms:\n");
        for(int n=0; n<7; ++n)
            printf(" %d: %s\n", n, Renderers[n].name);
        printf("\n");
        return 0;
    }
    const int width = 300, height = 200;
    
    int n = atoi(argv[1]);
    if(n < 0 || n >= 7)
    {
        std::fprintf(stderr, "Error: Invalid algorithm number\n");
        return -1;
    }
    
    omp_set_num_threads(3);

    SDL_Init(SDL_INIT_VIDEO);
    SDL_InitSubSystem(SDL_INIT_VIDEO);
    surface = SDL_SetVideoMode(width,height, 24, 0);
    SDL_WM_SetCaption("OpenMP test",0);
    
    signal(SIGINT, SIG_DFL);
    signal(SIGTERM, SIG_DFL);
    
    Renderers[n].func(width, height);

    return 0;
}
