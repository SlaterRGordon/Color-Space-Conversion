#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include "bmp.h" // include bmp file utils

typedef struct rgbPixel {
    unsigned char r;
    unsigned char g;
    unsigned char b;
} rgbPixel;

typedef struct yccPixel {
    unsigned char y;
    unsigned char cb;
    unsigned char cr;
} yccPixel;

yccPixel rgbToYcc(rgbPixel inputPixel) {
    yccPixel outputPixel;

    outputPixel.y = 16 +
        (0.257 * inputPixel.r) + 
        (0.504 * inputPixel.g) + 
        (0.098 * inputPixel.b);
        
    
    outputPixel.cb = 128 +
        (-0.148 * inputPixel.r) + 
        (-0.291 * inputPixel.g) + 
        (0.439 * inputPixel.b);

    outputPixel.cr = 128 +
        (0.439 * inputPixel.r) + 
        (-0.368 * inputPixel.g) + 
        (-0.071 * inputPixel.b);

    return outputPixel;
}

int main(int argc, char* argv[]) {

    // open file in binary read mode
    FILE *fInput;
    if ((fInput = fopen("./test1.bmp", "rb")) == NULL)
    {
        printf("Error opening input file\n");
        exit(1);
    }

    FILE *fOutput;
    if ((fOutput = fopen("output1.bmp", "wb")) == NULL)
    {
        printf("Error opening output file\n");
        exit(1);
    }

    // read header from image and write to output file
    fileHeader *fh = readFileHeader(fInput);
    writeFileHeader(fOutput, fh);

    int width = fh->infoHeader.width;
    int height = fh->infoHeader.height;

    // move pointer passed file header
    printf("\nOffsetting input pointer by: %d\n", fh->header.dataOffset);
    fseek(fInput, fh->header.dataOffset, SEEK_SET);

    // initialize pixel to read into
    rgbPixel *pixel = malloc(sizeof(rgbPixel));

    printf("\nWidth: %d, Height: %d\n", width, height);
    // iterate through pixels
    for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
            fread(pixel, sizeof(rgbPixel), 1, fInput); // read in pixel
            fseek(fInput, sizeof(rgbPixel), SEEK_CUR); // go next pixel
            fwrite(pixel, sizeof(rgbPixel), 1, fOutput); // write pixel to output
            fseek(fOutput, sizeof(rgbPixel), SEEK_CUR);
        }
    }

    fclose(fInput);
    fclose(fOutput);


    return 0;
}