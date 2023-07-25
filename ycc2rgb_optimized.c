#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <stdbool.h>
#include "bmp.h" // include bmp file utils
#include "colors_optimized.h" // include color conversion utils

void cache_oblivious(pixel *data, int width, int height, 
    int new_width, int new_height, int start_x, int start_y){
    
    if (new_width == 2 && new_height == 2) {
        pixel *pixelArray[4];
        pixelArray[0] = &data[(start_y * width) + start_x];
        pixelArray[1] = &data[(start_y * width) + (start_x + 1)];
        pixelArray[2] = &data[((start_y + 1) * width) + start_x];
        pixelArray[3] = &data[((start_y + 1) * width) + (start_x + 1)];

        pixel *convertedPixels = (pixel *)malloc(sizeof(pixel) * 4);
        yccToRgb(pixelArray, convertedPixels, 4);

        data[(start_y * width) + start_x] = convertedPixels[0];
        data[(start_y * width) + (start_x + 1)] = convertedPixels[1];
        data[((start_y + 1) * width) + start_x] = convertedPixels[2];
        data[((start_y + 1) * width) + (start_x + 1)] = convertedPixels[3];

        free(convertedPixels);

        return;
    }  else if (new_width == 2 && new_height == 1) {
        pixel *pixelArray[4];
        pixelArray[0] = &data[(start_y * width) + start_x];
        pixelArray[1] = &data[(start_y * width) + (start_x + 1)];

        pixel *convertedPixels = (pixel *)malloc(sizeof(pixel) * 2);
        yccToRgb(pixelArray, convertedPixels, 2);

        data[(start_y * width) + start_x] = convertedPixels[0];
        data[(start_y * width) + (start_x + 1)] = convertedPixels[1];

        free(convertedPixels);

        return;
    }  else if (new_width == 1 && new_height == 2) {
        pixel *pixelArray[4];
        pixelArray[0] = &data[(start_y * width) + start_x];
        pixelArray[1] = &data[((start_y + 1) * width) + start_x];

        pixel *convertedPixels = (pixel *)malloc(sizeof(pixel) * 2);
        yccToRgb(pixelArray, convertedPixels, 2);

        data[(start_y * width) + start_x] = convertedPixels[0];
        data[((start_y + 1) * width) + start_x] = convertedPixels[1];

        free(convertedPixels);

        return;
    } else if (new_width == 1 && new_height == 1) {
        pixel *pixelArray[4];
        pixelArray[0] = &data[(start_y * width) + start_x];

        pixel *convertedPixels = (pixel *)malloc(sizeof(pixel) * 1);
        yccToRgb(pixelArray, convertedPixels, 1);

        data[(start_y * width) + start_x] = convertedPixels[0];

        free(convertedPixels);

        return;
    }

    if (new_width < new_height) { // splitting horizontally
        int half_height = new_height / 2;
        cache_oblivious(data, width, height, new_width, half_height, 
            start_x, start_y);
        cache_oblivious(data, width, height, new_width, (new_height - half_height), 
            start_x, start_y + half_height);
    } else { // splitting vertically
        int half_width = new_width / 2;
        cache_oblivious(data, width, height, half_width, new_height, 
            start_x, start_y);
        cache_oblivious(data, width, height, (new_width - half_width), new_height, 
            start_x + half_width, start_y);
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
    pixel *data = (pixel *)malloc(width * height * sizeof(pixel));
    pixel *outputData = (pixel *)malloc(width * height * sizeof(pixel));
    if (fread(data, 3 * width, height, fInput) != (size_t)height) {
        fprintf(stderr, "Failed to read image \n");
        exit(1);
    }

    cache_oblivious(data, width, height, width, height, 0, 0);

    fwrite(outputData, 3 * width, height, fOutput);

    free(data);
    free(outputData);

    fclose(fInput);
    fclose(fOutput);

    return 0;
}