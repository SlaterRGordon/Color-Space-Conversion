#!/bin/sh
gcc -O3 rgbToYcc_unopt.c -o rgbToYcc_unopt.o -lm

rm cachegrind.out.*
valgrind --tool=cachegrind ./rgbToYcc_unopt.o ../images/ray.bmp ../outputs/ray2.bmp 
cg_annotate --auto=yes cachegrind.out.*