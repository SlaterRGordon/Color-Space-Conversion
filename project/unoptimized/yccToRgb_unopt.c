#include "arm_neon.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <stdbool.h>
#include "../bmp.h" // include bmp file utils
#include "../color.h" // include color conversion utils

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

    fh->infoHeader.width = 2 * width;
    fh->infoHeader.height = 2 * height;
    writeFileHeader(fOutput, fh);
    free(fh);

    fseek(fInput, fh->header.dataOffset, SEEK_SET);

    // allocate mem and read image into data
    compressedPixel *data = (compressedPixel *)malloc(width * height * sizeof(compressedPixel));
    if (fread(data, 6 * width, height, fInput) != (size_t)height) {
        fprintf(stderr, "Failed to read image \n");
        exit(1);
    }
    fclose(fInput);

    printf("width: %d, height: %d\n", width, height);

    int newWidth = 2 * width;
    int newHeight = 2 * height;

    pixel *reconstructedData = (pixel *)malloc(newWidth * newHeight * sizeof(pixel));
    register short int i, j;
    for (i = 0; i < newHeight; i+=2) {
        for (j = 0; j < newWidth; j+=2) {
            int sampleIndex = (i/2) * width + (j/2);
            reconstructedData[i * newWidth + j].x = (uint8_t)(1.164 * (data[sampleIndex].x1 - 16)) + (1.596 * (data[sampleIndex].z - 128));
            reconstructedData[i * newWidth + j].y = (uint8_t)(1.164 * (data[sampleIndex].x1 - 16)) + (-0.813 * (data[sampleIndex].z - 128)) + (-0.391 * (data[sampleIndex].y - 128));
            reconstructedData[i * newWidth + j].z = (uint8_t)(1.164 * (data[sampleIndex].x1 - 16)) + (2.018 * (data[sampleIndex].y - 128));

            reconstructedData[i * newWidth + j + 1].x = (uint8_t)(1.164 * (data[sampleIndex].x2 - 16)) + (1.596 * (data[sampleIndex].z - 128));
            reconstructedData[i * newWidth + j + 1].y = (uint8_t)(1.164 * (data[sampleIndex].x2 - 16)) + (-0.813 * (data[sampleIndex].z - 128)) + (-0.391 * (data[sampleIndex].y - 128));
            reconstructedData[i * newWidth + j + 1].z = (uint8_t)(1.164 * (data[sampleIndex].x2 - 16)) + (2.018 * (data[sampleIndex].y - 128));

            reconstructedData[(i + 1) * newWidth + j].x = (uint8_t)(1.164 * (data[sampleIndex].x3 - 16)) + (1.596 * (data[sampleIndex].z - 128));
            reconstructedData[(i + 1) * newWidth + j].y = (uint8_t)(1.164 * (data[sampleIndex].x3 - 16)) + (-0.813 * (data[sampleIndex].z - 128)) + (-0.391 * (data[sampleIndex].y - 128));
            reconstructedData[(i + 1) * newWidth + j].z = (uint8_t)(1.164 * (data[sampleIndex].x3 - 16)) + (2.018 * (data[sampleIndex].y - 128));

            reconstructedData[(i + 1) * newWidth + j + 1].x = (uint8_t)(1.164 * (data[sampleIndex].x4 - 16)) + (1.596 * (data[sampleIndex].z - 128));
            reconstructedData[(i + 1) * newWidth + j + 1].y = (uint8_t)(1.164 * (data[sampleIndex].x4 - 16)) + (-0.813 * (data[sampleIndex].z - 128)) + (-0.391 * (data[sampleIndex].y - 128));
            reconstructedData[(i + 1) * newWidth + j + 1].z = (uint8_t)(1.164 * (data[sampleIndex].x4 - 16)) + (2.018 * (data[sampleIndex].y - 128));
        }
    }
    free(data);

    fwrite(reconstructedData, 3 * newWidth, newHeight, fOutput);
    free(reconstructedData);
    
    fclose(fOutput);

    return 0;
}