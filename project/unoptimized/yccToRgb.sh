#!/bin/sh
gcc -O3 -mfpu=neon yccToRgb_unopt.c -o yccToRgb.exe -lm

rm cachegrind.out.*
valgrind --tool=cachegrind --branch-sim=yes ./yccToRgb.exe ../outputs/ray_ycc.bmp ../outputs/ray_rgb.bmp 
cg_annotate --auto=yes cachegrind.out.*