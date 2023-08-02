gcc -O3 -mfpu=neon ../yccToRgb.c -o ../executables/yccToRgb.exe -lm
../executables/yccToRgb.exe ../outputs/ray_ycc.bmp ../outputs/ray_rgb.bmp