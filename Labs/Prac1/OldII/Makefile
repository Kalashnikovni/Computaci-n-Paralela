CC=cc
CFLAGS=-Wall -Wextra -std=c99 -g

LDFLAGS=-lm

TARGET=integralimage

all: $(TARGET)

integralimage: integralimage.o
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

.PHONY: clean

clean:
	rm -rf *.o $(TARGET)
