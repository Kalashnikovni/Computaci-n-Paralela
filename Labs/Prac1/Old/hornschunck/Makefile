CC=gcc-7
CFLAGS= -Wall -Wextra -O3 
LDLIBS=-lpng -ljpeg -ltiff -lm -lgomp

all: horn_schunck_classic

horn_schunck_classic: horn_schunck_classic.c iio.o
	$(CC) $(CFLAGS) -o horn_schunck_classic horn_schunck_classic.c iio.o $(LDLIBS)

iio.o: iio.c
	$(CC) $(CFLAGS) -DNDEBUG -D_GNU_SOURCE -c iio.c $(LDLIBS)

clean:
	rm -f iio.o horn_schunck_classic flow.flo
     
  
