CC=gcc-7
CFLAGS=-Wall -Wextra -march=ivybridge -std=c99 -g -O2 -msse4 -funroll-loops 

LDFLAGS=-lm -lgomp

TARGET=integralimage

all: $(TARGET)

integralimage: integralimage.o
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

.PHONY: clean

clean:
	rm -rf *.o $(TARGET)
