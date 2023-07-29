#!/bin/sh
gcc -O3 rgbToYcc.c -o rgbToYcc.o -lm

rm cachegrind.out.*
valgrind --tool=cachegrind ./rgbToYcc.o ./images/ray ./outputs/ray.bmp 
cg_annotate --auto=yes cachegrind.out.*