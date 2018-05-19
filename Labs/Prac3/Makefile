CC=clang-5.0
CFLAGS=-Wall -Wextra -std=c99 -g -O3 -march=ivybridge -funroll-loops #-ftree-vectorize #-fopt-info 

LDFLAGS=-lm -lgomp -fopenmp

TARGET=integralimage

all: $(TARGET)

integralimage: integralimage.o
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

.PHONY: clean

clean:
	rm -rf *.o $(TARGET)
