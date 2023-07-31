#!/bin/sh
gcc rgbToYcc_unopt.c -o rgbToYcc_unopt.exe

rm callgrind.out.*
valgrind --tool=callgrind ./rgbToYcc_unopt.exe ../images/ray.bmp ../outputs/ray2.bmp 
cg_annotate --auto=yes callgrind.out.*