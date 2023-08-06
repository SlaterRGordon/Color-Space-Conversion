gcc rgbToYcc_unopt.c -o rgbToYcc_unopt.exe
perf stat ./rgbToYcc_unopt.exe ../images/ray.bmp ../outputs/ray_ycc.bmp