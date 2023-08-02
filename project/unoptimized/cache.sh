#!/bin/sh
gcc rgbToYcc_unopt.c -o rgbToYcc_unopt.exe

rm cachegrind.out.*
valgrind --tool=cachegrind --branch-sim=yes ./rgbToYcc_unopt.exe ../images/ray.bmp ../outputs/ray_unopt.bmp 
cg_annotate --auto=yes cachegrind.out.*