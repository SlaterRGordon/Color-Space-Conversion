#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <stdbool.h>
#include "../bmp.h" // include bmp file utils
#include "color_unopt.c" // include color conversion utils

int main(int argc, char* argv[]) {
    if (argc > 4) {
        printf("Error wrong arguments\n");
        exit(1);
    }

    // open file in binary read mode
    FILE *fInput;
    if ((fInput = fopen(argv[1], "rb")) == NULL)
    {
        printf("Error opening input file\n");
        exit(1);
    }

    FILE *fOutput;
    if ((fOutput = fopen(argv[2], "wb")) == NULL)
    {
        printf("Error opening output file\n");
        exit(1);
    }

    // read header from image and write to output file
    fileHeader *fh = readFileHeader(fInput);
    int width = fh->infoHeader.width;
    int height = fh->infoHeader.height;

    writeFileHeader(fOutput, fh);
    free(fh);

    printf("Data offset: %d\n", fh->header.dataOffset);

    fseek(fInput, fh->header.dataOffset, SEEK_SET);

    // allocate mem and read image into data
    pixel *data = (pixel *)malloc(width * height * sizeof(pixel));
    if (fread(data, 3 * width, height, fInput) != (size_t)height) {
        fprintf(stderr, "Failed to read image \n");
        exit(1);
    }
    fclose(fInput);

    printf("width: %d, height: %d\n", width, height);

    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            pixel *inputPixel;
            inputPixel = &data[i * width + j];
            pixel *convertedPixel = rgbToYcc(inputPixel);

            data[i * width + j] = convertedPixel[0];
        }
    }

    printf("Writing to file\n");
    fwrite(data, 3 * (width), (height), fOutput);
    free(data);
    
    fclose(fOutput);

    return 0;
}