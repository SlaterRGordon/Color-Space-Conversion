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

yccPixel *rgbToYcc(rgbPixel *inputPixel) {
    yccPixel *outputPixel = malloc(sizeof(yccPixel));

    outputPixel->y = 16 +
        (0.257 * inputPixel->r) + 
        (0.504 * inputPixel->g) + 
        (0.098 * inputPixel->b);
        
    
    outputPixel->cb = 128 +
        (-0.148 * inputPixel->r) + 
        (-0.291 * inputPixel->g) + 
        (0.439 * inputPixel->b);

    outputPixel->cr = 128 +
        (0.439 * inputPixel->r) + 
        (-0.368 * inputPixel->g) + 
        (-0.071 * inputPixel->b);

    return outputPixel;
}

rgbPixel *yccToRgb(yccPixel *inputPixel) {
    rgbPixel *outputPixel = malloc(sizeof(rgbPixel));

    outputPixel->r =
        (1.164 * (inputPixel->y - 16)) + 
        (0 * (inputPixel->cb - 128)) + 
        (1.596 * (inputPixel->cr - 128));
        
    
    outputPixel->g =
        (1.164 * (inputPixel->y - 16)) + 
        (-0.392 * (inputPixel->cb - 128)) + 
        (-0.813 * (inputPixel->cr - 128));

    outputPixel->b =
        (1.164 * (inputPixel->y - 16)) + 
        (2.017 * (inputPixel->cb - 128)) + 
        (0 * (inputPixel->cr - 128));

    return outputPixel;
}