gcc -O3 -mfpu=neon ../rgbToYcc.c -o ../executables/rgbToYcc.exe -lm
perf stat true ../executables/rgbToYcc.exe