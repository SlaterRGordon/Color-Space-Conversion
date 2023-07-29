#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <stdbool.h>
#include "bmp.h" // include bmp file utils
#include "color.c" // include color conversion utils
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

    fh->infoHeader.width /= 2;
    fh->infoHeader.height /= 2;
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

    pixel *filteredData = (pixel *)malloc(width * height * sizeof(pixel));
    gaussianFilter(data, filteredData, width, height);
    free(data);

    pixel *sampledData = (pixel *)malloc((width/2) * (height/2) * sizeof(pixel));
    for (int i = 0; i < height; i+=2) {
        for (int j = 0; j < width; j+=2) {
            pixel *inputPixels[1];
            pixel *averagePixel = (pixel *)malloc(sizeof(pixel));
            averagePixel->x = (filteredData[i * width + j].x);
            averagePixel->y = (filteredData[i * width + j].y + 
                filteredData[i * width + j + 1].y + 
                filteredData[(i + 1) * width + j].y + 
                filteredData[(i + 1) * width + j + 1].y) / 4;
            averagePixel->z = (filteredData[i * width + j].z + 
                filteredData[i * width + j + 1].z + 
                filteredData[(i + 1) * width + j].z + 
                filteredData[(i + 1) * width + j + 1].z) / 4;

            inputPixels[0] = averagePixel;
            
            pixel *convertedPixels = (pixel *)malloc(sizeof(pixel) * 1);
            rgbToYcc(inputPixels, convertedPixels);

            sampledData[(i/2) * width/2 + (j/2)] = convertedPixels[0];
            free(convertedPixels); 
        }
    }
    free(filteredData);

    fwrite(sampledData, 3 * (width/2), (height/2), fOutput);
    free(sampledData);
    
    fclose(fOutput);

    return 0;
}