#!/bin/sh
gcc -O3 -mfpu=neon rgbToYcc.c -o rgbToYcc.exe -lm

rm callgrind.out.*
valgrind --tool=callgrind ./rgbToYcc.exe ./images/ray.bmp ./outputs/ray.bmp 
cg_annotate --auto=yes callgrind.out.*