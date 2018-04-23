CC=cc
CFLAGS=-Wall -Wextra -std=c99 -g

LDFLAGS=-lm

all: heat

heat: heat.o
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

.PHONY: clean

clean:
	rm -rf *.o heat
