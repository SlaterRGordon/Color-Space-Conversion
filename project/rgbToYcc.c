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
    register short int i, j;
    for (i = 0; i < height; i+=2) {
        for (j = 0; j < width; j+=2) {
            sampledData[(i/2) * width/2 + (j/2)].x = (uint8_t)((4096 + 
                (66 * (filteredData[i * width + j].x) + 
                (129 * filteredData[i * width + j].y) +  
                (25 * filteredData[i * width + j].z)) + 128) >> 8);

            sampledData[(i/2) * width/2 + (j/2)].y = ((uint8_t)(((32768 - 
                (38 * filteredData[i * width + j].x) - 
                (74 * filteredData[i * width + j].y) + 
                (112 * filteredData[i * width + j].z)) + 128) >> 8) + 
                (uint8_t)(((32768 - 
                (38 * filteredData[i * width + j + 1].x) - 
                (74 * filteredData[i * width + j + 1].y) + 
                (112 * filteredData[i * width + j + 1].z)) + 128) >> 8) + 
                (uint8_t)(((32768 - 
                (38 * filteredData[(i + 1) * width + j].x) - 
                (74 * filteredData[(i + 1) * width + j].y) + 
                (112 * filteredData[(i + 1) * width + j].z)) + 128) >> 8) + 
                (uint8_t)(((32768 - 
                (38 * filteredData[(i + 1) * width + j + 1].x) - 
                (74 * filteredData[(i + 1) * width + j + 1].y) + 
                (112 * filteredData[(i + 1) * width + j + 1].z)) + 128) >> 8)) >> 2;

            sampledData[(i/2) * width/2 + (j/2)].z = ((uint8_t)(((32768 + 
                (112 * filteredData[i * width + j].x) - 
                (94 * filteredData[i * width + j].y) - 
                (18 * filteredData[i * width + j].z)) + 128) >> 8) + 
                (uint8_t)(((32768 + 
                (112 * filteredData[i * width + j + 1].x) - 
                (94 * filteredData[i * width + j + 1].y) - 
                (18 * filteredData[i * width + j + 1].z)) + 128) >> 8) + 
                (uint8_t)(((32768 + 
                (112 * filteredData[(i + 1) * width + j].x) - 
                (94 * filteredData[(i + 1) * width + j].y) - 
                (18 * filteredData[(i + 1) * width + j].z)) + 128) >> 8) + 
                (uint8_t)(((32768 + 
                (112 * filteredData[(i + 1) * width + j + 1].x) - 
                (94 * filteredData[(i + 1) * width + j + 1].y) - 
                (18 * filteredData[(i + 1) * width + j + 1].z)) + 128) >> 8)) >> 2;
        }
    }
    free(filteredData);

    fwrite(sampledData, 3 * (width/2), (height/2), fOutput);
    free(sampledData);
    
    fclose(fOutput);

    return 0;
}