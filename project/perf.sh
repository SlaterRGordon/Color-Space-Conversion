gcc -O3 -mfpu=neon rgbToYcc.c -o rgbToYcc.exe -lm
perf stat true ./rgbToYcc.exe