#if I==1
void Name(int width, int height)
{
    width /= 4; height /= 4;
    const int num_pixels = width*height;
    const complex center(-.7, 0), span(2.7, -(4/3.0)*2.7*height/width);
    const complex begin = center-span/2.0, end = center+span/2.0;
    const int maxiter = 100000;
    
    unsigned private_pixcount = 0;
#endif
// insert 1
#if I==2
    for(int pix=0; pix<num_pixels; ++pix)
    {
        const int x = pix%width, y = pix/width;
        
        complex c(begin.real() + x * span.real() / (width +1.0),
                  begin.imag() + y * span.imag() / (height+1.0));
        
        int n = MandelbrotCalculate(c, maxiter);
        if(n == maxiter) n = 0;
        
#endif
// insert 2
#if I==3
        {
          unsigned color = 0x0000FF;
          if(n > 0)
          {
              color = 0x50 + (n % 100) * 0xA0 / 100;
          }
          color <<= omp_get_thread_num() * 8;
          
          for(unsigned yw=0; yw<4; ++yw)
              for(unsigned xw=0; xw<4; ++xw)
              {
                  unsigned char* target = (unsigned char*)surface->pixels;
                  target += ((x*4+xw) + (y*4+yw)*(width*4)) * 3;
                  target[0] = (color>>16);
                  target[1] = (color>>8);
                  target[2] = (color>>0);
              }
          
          if(++private_pixcount >= 8)
          {
            #pragma omp critical(sdlflip)
                SDL_Flip(surface);
            private_pixcount = 0;
            sched_yield();
          }
        }
    }
  #pragma omp critical(sdlflip)
    SDL_Flip(surface);
}
#endif
