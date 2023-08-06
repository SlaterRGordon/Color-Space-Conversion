gcc -O3 -mfpu=neon ../rgbToYcc.c -o ../executables/rgbToYcc.exe ../executables/rgbToYcc.exe -lm
../executables/rgbToYcc.exe ../images/ray.bmp ../outputs/ray_ycc.bmp