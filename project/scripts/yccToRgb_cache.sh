#!/bin/sh
gcc -O3 -mfpu=neon ../yccToRgb.c -o ../executables/yccToRgb.exe -lm

rm cachegrind.out.*
valgrind --tool=cachegrind --branch-sim=yes ../executables/yccToRgb.exe ../outputs/ray_ycc.bmp ../outputs/ray_rgb.bmp 
cg_annotate --auto=yes cachegrind.out.*