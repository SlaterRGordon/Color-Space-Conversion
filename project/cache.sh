#!/bin/sh
gcc -O3 -mfpu=neon rgbToYcc.c -o rgbToYcc.exe -lm

rm cachegrind.out.*
valgrind --tool=cachegrind --branch-sim=yes ./rgbToYcc.exe ./images/ray.bmp ./outputs/ray_ycc.bmp 
cg_annotate --auto=yes cachegrind.out.*