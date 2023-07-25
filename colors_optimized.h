typedef struct pixel {
    uint8_t x;
    uint8_t y;
    uint8_t z;
} pixel;

void *rgbToYcc(pixel **inputPixels, pixel *convertedPixels, short int num_pixels) {
    for (short int i = 0; i < num_pixels; i++) {
      convertedPixels[i].x = 16 + (((187 * inputPixels[i]->x) + (628 * inputPixels[i]->y) + (63 * inputPixels[i]->z)) >> 10);
      convertedPixels[i].y = 128 + ((-(103 * inputPixels[i]->x) - (347 * inputPixels[i]->y) + (449 * inputPixels[i]->z)) >> 10);
      convertedPixels[i].z = 128 + (((449 * inputPixels[i]->x) - (347 * inputPixels[i]->y) - (40 * inputPixels[i]->z)) >> 10);
    }
}

void *yccToRgb(pixel **inputPixels, pixel *convertedPixels, short int num_pixels) {
    for (short int i = 0; i < num_pixels; i++) {
        int32_t y_conv = (1191 * (inputPixels[i]->x - 16)) >> 10;
        int32_t cb_scale = (inputPixels[i]->y - 128);
        int32_t cr_scale = (inputPixels[i]->z - 128);

        convertedPixels[i].x = y_conv + ((1836 * cr_scale) >> 10);
        convertedPixels[i].y = y_conv - ((218 * cb_scale) >> 10) - ((545 * cr_scale) >> 10);
        convertedPixels[i].z = y_conv + ((2162 * cb_scale) >> 10);
    }
}