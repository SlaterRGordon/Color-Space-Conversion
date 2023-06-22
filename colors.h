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