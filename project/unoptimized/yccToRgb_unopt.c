#include "arm_neon.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <stdbool.h>
#include "bmp.h" // include bmp file utils
#include "color.h" // include color conversion utils
#include "filter.c"

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

    fh->infoHeader.width *= 2;
    fh->infoHeader.height *= 2;
    writeFileHeader(fOutput, fh);
    free(fh);

    fseek(fInput, fh->header.dataOffset, SEEK_SET);

    // allocate mem and read image into data
    pixel *data = (pixel *)malloc(width * height * sizeof(pixel));
    if (fread(data, 3 * width, height, fInput) != (size_t)height) {
        fprintf(stderr, "Failed to read image \n");
        exit(1);
    }
    fclose(fInput);

    int newWidth = 2 * width;
    int newHeight = 2 * height;

    float xRatio = (float)(width) / newWidth;
    float yRatio = (float)(height) / newHeight;

    pixel *reconstructedData = (pixel *)malloc(width * 2 * height * 2 * sizeof(pixel));
    register short int i, j;
    for (i = 0; i < newHeight; i++) {
        for (j = 0; j < newWidth; j++) {
            int srcY = (int)(i * yRatio);
            int srcX = (int)(j * xRatio);

            // Clamp the source coordinates to avoid going out of bounds
            srcY = MAX(0, MIN(srcY, height - 1));
            srcX = MAX(0, MIN(srcX, width - 1));
            
            reconstructedData[i * newWidth + j].x = (uint8_t)(1.164 * (data[srcY * width + srcX].x - 16)) + (1.596 * (data[srcY * width + srcX].z - 128));
            reconstructedData[i * newWidth + j].y = (uint8_t)(1.164 * (data[srcY * width + srcX].x - 16)) + (-0.813 * (data[srcY * width + srcX].z - 128)) + (-0.391 * (data[srcY * width + srcX].y - 128));
            reconstructedData[i * newWidth + j].z = (uint8_t)(1.164 * (data[srcY * width + srcX].x - 16)) + (2.018 * (data[srcY * width + srcX].y - 128));
        }
    }
    free(data);

    fwrite(reconstructedData, 3 * (width*2), (height*2), fOutput);
    free(reconstructedData);
    
    fclose(fOutput);

    return 0;
}