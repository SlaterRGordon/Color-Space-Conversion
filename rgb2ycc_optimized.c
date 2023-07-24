#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <stdbool.h>
#include "bmp.h" // include bmp file utils
#include "colors_optimized.h" // include color conversion utils

void cache_oblivious(rgbPixel *inputData, yccPixel *outputData, int width, int height, 
    int new_width, int new_height, int start_x, int start_y){
    
    if (new_width <= 2 && new_height <= 2) {
        rgbPixel *pixelArray[4];
        pixelArray[0] = &inputData[(start_y * width) + start_x];
        pixelArray[1] = &inputData[(start_y * width) + (start_x + 1)];
        pixelArray[2] = &inputData[((start_y + 1) * width) + start_x];
        pixelArray[3] = &inputData[((start_y + 1) * width) + (start_x + 1)];

        yccPixel *convertedPixels = (yccPixel *)malloc(sizeof(yccPixel) * 4);
        rgbToYcc(pixelArray, convertedPixels);

        outputData[(start_y * width) + start_x] = convertedPixels[0];
        outputData[(start_y * width) + (start_x + 1)] = convertedPixels[1];
        outputData[((start_y + 1) * width) + start_x] = convertedPixels[2];
        outputData[((start_y + 1) * width) + (start_x + 1)] = convertedPixels[3];

        free(convertedPixels);

        return;
    }

    int half_width = (new_width + 1) / 2;
    int half_height = (new_height + 1) / 2;
    if (new_width < new_height) { // splitting horizontally
        cache_oblivious(inputData, outputData, width, height, new_width, half_height, 
            start_x, start_y);
        cache_oblivious(inputData, outputData, width, height, new_width, half_height, 
            start_x, start_y + (new_height - half_height));
    } else { // splitting vertically
        cache_oblivious(inputData, outputData, width, height, half_width, new_height, 
            start_x, start_y);
        cache_oblivious(inputData, outputData, width, height, half_width, new_height, 
            start_x + (new_width - half_width), start_y);
    }
}

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
    writeFileHeader(fOutput, fh);
    free(fh);

    int width = fh->infoHeader.width;
    int height = fh->infoHeader.height;

    // move pointer passed file header
    fseek(fInput, fh->header.dataOffset, SEEK_SET);

    // allocate mem and read image into data
    rgbPixel *data = (rgbPixel *)malloc(width * height * sizeof(rgbPixel));
    yccPixel *outputData = (yccPixel *)malloc(width * height * sizeof(yccPixel));
    if (fread(data, 3 * width, height, fInput) != (size_t)height) {
        fprintf(stderr, "Failed to read image \n");
        exit(1);
    }

    cache_oblivious(data, outputData, width, height, width, height, 0, 0);

    fwrite(outputData, 3 * width, height, fOutput);

    free(data);
    free(outputData);

    fclose(fInput);
    fclose(fOutput);

    return 0;
}