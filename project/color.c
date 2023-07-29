#include "color.h"

// ITU-R BT.601-4
// Y' [16...235] 8 bits, Cb' and Cr' [16...240]
// Scale factor 2^8
void *rgbToYcc(pixel **inputPixels, pixel *convertedPixels) {
    // pixel 1
    uint16_t y_temp = 4096 + (66 * inputPixels[0]->x) + (129 * inputPixels[0]->y) +  (25 * inputPixels[0]->z);
    convertedPixels[0].x = (uint8_t)((y_temp + 128) >> 8);

    uint16_t cb_temp = 32768 - (38 * inputPixels[0]->x) - (74 * inputPixels[0]->y) + (112 * inputPixels[0]->z);
    convertedPixels[0].y = (uint8_t)((cb_temp + 128) >> 8);

    uint16_t cr_temp = 32768 + (112 * inputPixels[0]->x) - (94 * inputPixels[0]->y) - (18 * inputPixels[0]->z);
    convertedPixels[0].z = (uint8_t)((cr_temp + 128) >> 8);
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