#!/bin/bash
for i in {0..8}
	do echo " "
	for j in {0..8}
	do echo -n $i $j" "
	gcc-8 -O3 -DX=$i -DY=$j mtxtransp2.c
	perf stat -r 8 -x " " -e cycles ./a.out 2>&1 | cut -d " " -f 1
	done
done
