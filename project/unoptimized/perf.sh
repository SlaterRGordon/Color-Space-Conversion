gcc rgbToYcc_unopt.c -o rgbToYcc_unopt.exe
perf stat true ./rgbToYcc_unopt.exe