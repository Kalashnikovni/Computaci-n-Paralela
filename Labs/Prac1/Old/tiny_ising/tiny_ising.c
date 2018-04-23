/*
 * Tiny Ising model.
 * Loosely based on  "q-state Potts model metastability
 * study using optimized GPU-based Monte Carlo algorithms",
 * Ezequiel E. Ferrero, Juan Pablo De Francesco, Nicolás Wolovick,
 * Sergio A. Cannas
 * http://arxiv.org/abs/1101.0876
 * 
 * Debugging: Ezequiel Ferrero
 */

#include <assert.h>
#include <limits.h> // UINT_MAX
#include <math.h> // expf()
#include <omp.h> // omp_get_wtime()
#include <stdio.h> // printf()
#include <stdlib.h> // rand()
#include <string.h>
#include <sys/mman.h>
#include <time.h> // time()

#ifndef L
#define L 128 // linear system size
#endif

#ifndef SAMPLES
#define SAMPLES 1 // number of samples
#endif

#ifndef TEMP_MIN
#define TEMP_MIN 0.9f // minimum temperature
#endif

#ifndef TEMP_MAX
#define TEMP_MAX 1.35f // maximum temperature
#endif

#ifndef DELTA_TEMP
#define DELTA_TEMP 0.05f // temperature step
#endif

#ifndef TRAN
#define TRAN 20 // equilibration time
#endif

#ifndef TMAX
#define TMAX 800 // measurement time
#endif

#ifndef DELTA_T
#define DELTA_T 5 // sampling period for energy and magnetization
#endif

// Functions

// Internal definitions and functions
// out vector size, it is +1 since we reach TEMP_
#define NPOINTS (1 + (int) ((TEMP_MAX - TEMP_MIN) / DELTA_TEMP))
#define N (L * L) // system size
#define SEED (time(NULL)) // random seed


// temperature, E, E^2, E^4, M, M^2, M^4
struct statpoint {
	double t;
	double e; double e2; double e4;
	double m; double m2; double m4;
};

// The grid: global array
static int grid[L][L] = {{0}};

// Faster random generator
static unsigned int g_seed;

// Used to seed the generator.
inline void fast_srand(int seed){
    g_seed = seed;
}
 
// fastrand routine returns one integer, similar output value range as C lib.
inline int fastrand(){
    g_seed = (214013*g_seed+2531011);
    return (g_seed>>16)&0x7FFF;
}

/***
 * Functions
 ***/

static void update(const float temp, int grid[L][L]){
    // typewritter update
	for (unsigned int i = 0; i < L; ++i){
	    for (unsigned int j = 0; j < L; ++j){
            int h_before, h_after, delta_E,
                spin_neigh_n, spin_neigh_e,
                spin_neigh_s, spin_neigh_w,
                spin_old = grid[i][j],
                spin_new = (-1) * spin_old;

            // computing h_before
            spin_neigh_n = grid[(i + L - 1) % L][j];
            spin_neigh_e = grid[i][(j + 1) % L];
            spin_neigh_w = grid[i][(j + L - 1) % L];
            spin_neigh_s = grid[(i + 1) % L] [j];
            h_before = (-spin_old) * (spin_neigh_n + spin_neigh_e +
                                       spin_neigh_w + spin_neigh_s);

            // h after taking new spin
            h_after = (-spin_new) * (spin_neigh_n + spin_neigh_e +
                                     spin_neigh_w + spin_neigh_s);

            delta_E = h_after - h_before;
            float p = fastrand() / (float)RAND_MAX;
            if (delta_E <= 0 || p <= expf(-delta_E / temp))
                grid[i][j] = spin_new;
        }
    }
}

static double calculate(int grid[L][L], int *M_max){
    int E = 0, spin,
	    spin_neigh_n, spin_neigh_e, spin_neigh_s, spin_neigh_w;

    for (unsigned int i = 0; i < L; ++i){
        for (unsigned int j = 0; j < L; ++j){
            spin = grid[i][j];
            spin_neigh_n = grid[(i + 1) % L][j];
            spin_neigh_e = grid[i][(j + 1) % L];
            spin_neigh_w = grid[i][(j + L - 1)%L];
            spin_neigh_s = grid[(i + L - 1) % L][j];

            E += spin * (spin_neigh_n + spin_neigh_e + spin_neigh_w + spin_neigh_s);
            *M_max += spin;
        }
    }

    return -((double)E / 2.0);
}

static void cycle(int grid[L][L], const double min, const double max, const double step, const unsigned int calc_step, struct statpoint stats[]){
    unsigned int index = 0;
    int modifier = 0;
    double temp = 0.0;

    assert((0 < step && min <= max) || (step < 0 && max <= min));
    modifier = (0 < step) ? 1 : -1;

    for (index = 0, temp = min; modifier * temp <= modifier * max; ++index, temp += step){
        // equilibrium phase
        for (unsigned int j = 0; j < TRAN; ++j) 
            update(temp, grid);

        // measurement phase
        unsigned int measurements = 0;
        double e = 0.0, e2 = 0.0, e4 = 0.0, m = 0.0, m2 = 0.0, m4 = 0.0;

        for (unsigned int j = 0; j < TMAX; ++j)
            update(temp, grid);

        for(unsigned int j = TMAX - 1; j > TMAX - calc_step - 1; j--){
            if(j % calc_step == 0){
                double energy = 0.0, mag = 0.0;
                int M_max = 0;
                energy = calculate(grid, &M_max);
                mag = abs(M_max) / (float)N;
                e  += energy;
                e2 += energy * energy;
                e4 += e2 * energy * energy;
                m  += mag;
                m2 += mag * mag;
                m4 += m2 * mag * mag;
                ++measurements;
            }
        }

        assert(index < NPOINTS);
        stats[index].t = temp;
        stats[index].e += e / measurements;
        stats[index].e2 += e2 / measurements;
        stats[index].e4 += e4 / measurements;
        stats[index].m += m / measurements;
        stats[index].m2 += m2 / measurements;
        stats[index].m4 += m4 / measurements;
    }
}

static void sample(int grid[L][L], struct statpoint stat[]){
    // clear the grid
    for (unsigned int i = 0; i < L; ++i)
        for (unsigned int j = 0; j < L; ++j)
            grid[i][j] = 1;

    // temperature increasing cycle
    cycle(grid, TEMP_MIN, TEMP_MAX, DELTA_TEMP, DELTA_T, stat);
}

int main(void){
    // the stats
    struct statpoint stat[NPOINTS];
    unsigned int sz = 7 * NPOINTS * sizeof(double);
 
    memset(stat, 0.0, sz);

    double start = 0.0, elapsed = 0.0;

    // parameter checking
    assert(TEMP_MIN <= TEMP_MAX);
    assert(0 < DELTA_T && DELTA_T < TMAX); // at least one calculate()
    assert(TMAX % DELTA_T == 0); // take equidistant calculate()
    assert((L * L / 2) * 4L < UINT_MAX); // max energy, that is all spins are the same, fits into a ulong

    // print header
    printf("# L: %i\n", L);
    printf("# Number of Samples: %i\n", SAMPLES);
    printf("# Minimum Temperature: %f\n", TEMP_MIN);
    printf("# Maximum Temperature: %f\n", TEMP_MAX);
    printf("# Temperature Step: %.12f\n", DELTA_TEMP);
    printf("# Equilibration Time: %i\n", TRAN);
    printf("# Measurement Time: %i\n", TMAX);
    printf("# Data Acquiring Step: %i\n", DELTA_T);
    printf("# Number of Points: %i\n", NPOINTS);

    // configure RNG
    srand(SEED);

    // start timer
    start = omp_get_wtime();

    for (unsigned int i = 0; i < SAMPLES; ++i)
        sample(grid, stat);

    // stop timer
    elapsed = omp_get_wtime() - start;
    printf("# Total Simulation Time (sec): %lf\n", elapsed);
    printf("# Temp\tE\tE^2\tE^4\tM\tM^2\tM^4\n");

    for (unsigned int i = 0; i < NPOINTS; ++i){
        printf ("%lf\t%.10lf\t%.10lf\t%.10lf\t%.10lf\t%.10lf\t%.10lf\n",
        stat[i].t,
        stat[i].e / ((double) N * SAMPLES),
        stat[i].e2 / ((double) N * N * SAMPLES),
        stat[i].e4 / ((double) N * N * N * N * SAMPLES),
        stat[i].m / SAMPLES,
        stat[i].m2 / SAMPLES,
        stat[i].m4 / SAMPLES);
    }

    return 0;
}
