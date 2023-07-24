typedef struct rgbPixel {
    uint8_t r;
    uint8_t g;
    uint8_t b;
} rgbPixel;

typedef struct yccPixel {
    uint8_t y;
    uint8_t cb;
    uint8_t cr;
} yccPixel;

// double clamp(int x) {
//   const int t = x < 0 ? 0 : x;
//   return t > 255 ? 255 : t;
// }

void *rgbToYcc(rgbPixel **inputPixels, yccPixel *convertedPixels) {
    for (int i = 0; i < 4; i++) {
      convertedPixels[i].y = 16 + (((187 * inputPixels[i]->r) + (628 * inputPixels[i]->g) + (63 * inputPixels[i]->b)) >> 10);
      convertedPixels[i].cb = 128 + ((-(103 * inputPixels[i]->r) - (347 * inputPixels[i]->g) + (449 * inputPixels[i]->b)) >> 10);
      convertedPixels[i].cr = 128 + (((449 * inputPixels[i]->r) - (347 * inputPixels[i]->g) - (40 * inputPixels[i]->b)) >> 10);
    }
}

rgbPixel *yccToRgb(yccPixel *inputPixel) {
    rgbPixel *outputPixel = malloc(sizeof(rgbPixel));

    const int y_conv = (1191 * (inputPixel->y - 16)) >> 10;
    const int cb_scale = (inputPixel->cb - 128);
    const int cr_scale = (inputPixel->cr - 128);

    outputPixel->r = y_conv + ((1836 * cr_scale) >> 10);
    outputPixel->g = y_conv - ((218 * cb_scale) >> 10) - ((545 * cr_scale) >> 10);
    outputPixel->b = y_conv + ((2162 * cb_scale) >> 10);

    return outputPixel;
}