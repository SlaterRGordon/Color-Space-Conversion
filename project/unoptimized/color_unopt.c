#include "../color.h"

// ITU-R BT.601-4
// Y' [16...235] 8 bits, Cb' and Cr' [16...240]
// Scale factor 2^8
pixel *rgbToYcc(pixel *inputPixel) {
    pixel *outputPixel = malloc(sizeof(pixel));
    
    outputPixel->x = 16 +
        (0.257 * inputPixel->x) + 
        (0.504 * inputPixel->y) + 
        (0.098 * inputPixel->z);
        
    
    outputPixel->y = 128 +
        (-0.148 * inputPixel->x) + 
        (-0.291 * inputPixel->y) + 
        (0.439 * inputPixel->z);

    outputPixel->z = 128 +
        (0.439 * inputPixel->x) + 
        (-0.368 * inputPixel->y) + 
        (-0.071 * inputPixel->z);

    return outputPixel;
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