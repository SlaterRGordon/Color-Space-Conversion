gcc -O3 -mfpu=neon ../rgbToYcc.c -o ../executables/rgbToYcc.exe -lm
perf stat ../executables/rgbToYcc.exe ../images/ray.bmp ../outputs/ray_ycc.bmp