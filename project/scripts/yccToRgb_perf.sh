gcc -O3 -mfpu=neon ../yccToRgb.c -o ../executables/yccToRgb.exe -lm
perf stat true ../executables/yccToRgb.exe