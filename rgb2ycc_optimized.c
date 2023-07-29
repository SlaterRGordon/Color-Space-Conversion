#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <stdbool.h>
#include "bmp.h" // include bmp file utils
#include "colors_optimized.h" // include color conversion utils

void cache_oblivious(pixel *data, int width, int height, 
    int new_width, int new_height, int start_x, int start_y){

    // stop before function call overhead becomes too much
    if (new_height <= 64 && new_width <= 64) {
        int i, j;
        for (i = 0; i + 1 < new_height; i+=2) {
            for (j = 0; j + 1 < new_width; j+=2) {
                pixel *pixelArray[4];
                pixelArray[0] = &data[((start_y + i) * width) + (start_x + j)];
                pixelArray[1] = &data[((start_y + i) * width) + ((start_x + j) + 1)];
                pixelArray[2] = &data[(((start_y + i) + 1) * width) + (start_x + j)];
                pixelArray[3] = &data[(((start_y + i) + 1) * width) + ((start_x + j) + 1)];

                pixel *convertedPixels = (pixel *)malloc(sizeof(pixel) * 4);
                rgbToYcc(pixelArray, convertedPixels, 4);

                data[((start_y + i) * width) + (start_x + j)] = convertedPixels[0];
                data[((start_y + i) * width) + ((start_x + j) + 1)] = convertedPixels[1];
                data[(((start_y + i) + 1) * width) + (start_x + j)] = convertedPixels[2];
                data[(((start_y + i) + 1) * width) + ((start_x + j) + 1)] = convertedPixels[3];

                free(convertedPixels); 
            }
            if (j + 1 == new_width) {
                pixel *pixelArray[2];
                pixelArray[0] = &data[((start_y + i) * width) + (start_x + j)];
                pixelArray[1] = &data[(((start_y + i) + 1) * width) + (start_x + j)];

                pixel *convertedPixels = (pixel *)malloc(sizeof(pixel) * 2);
                rgbToYcc(pixelArray, convertedPixels, 2);

                data[((start_y + i) * width) + (start_x + j)] = convertedPixels[0];
                data[(((start_y + i) + 1) * width) + (start_x + j)] = convertedPixels[1];

                free(convertedPixels); 
            }
        }
        if (i + 1 == new_height) {
            for (j = 0; j < new_width; j++) {
                pixel *pixelArray[1];
                pixelArray[0] = &data[((start_y + i) * width) + (start_x + j)];

                pixel *convertedPixels = (pixel *)malloc(sizeof(pixel) * 1);
                rgbToYcc(pixelArray, convertedPixels, 1);

                data[((start_y + i) * width) + (start_x + j)] = convertedPixels[0];

                free(convertedPixels); 
            }
        }

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

    // cache_oblivious(data, width, height, width, height, 0, 0);

    int i, j;
    for (i = 0; i < height; i+=4) {
        for (j = 0; j < width; j+=4) {
            pixel *pixelArray[16];
            pixelArray[0] = &data[i * width + j];
            pixelArray[1] = &data[i * width + j + 1];
            pixelArray[2] = &data[i * width + j + 2];
            pixelArray[3] = &data[i * width + j + 3];
            pixelArray[4] = &data[(i + 1) * width + j];
            pixelArray[5] = &data[(i + 1) * width + j + 1];
            pixelArray[6] = &data[(i + 1) * width + j + 2];
            pixelArray[7] = &data[(i + 1) * width + j + 3];
            pixelArray[8] = &data[(i + 2) * width + j];
            pixelArray[9] = &data[(i + 2) * width + j + 1];
            pixelArray[10] = &data[(i + 2) * width + j + 2];
            pixelArray[11] = &data[(i + 2) * width + j + 3];
            pixelArray[12] = &data[(i + 3) * width + j];
            pixelArray[13] = &data[(i + 3) * width + j + 1];
            pixelArray[14] = &data[(i + 3) * width + j + 2];
            pixelArray[15] = &data[(i + 4) * width + j + 3];

            pixel *convertedPixels = (pixel *)malloc(sizeof(pixel) * 16);
            rgbToYcc(pixelArray, convertedPixels, 16);

            data[i * width + j] = convertedPixels[0];
            data[i * width + j + 1] = convertedPixels[1];
            data[i * width + j + 2] = convertedPixels[2];
            data[i * width + j + 3] = convertedPixels[3];
            data[(i + 1) * width + j] = convertedPixels[4];
            data[(i + 1) * width + j + 1]  = convertedPixels[5];
            data[(i + 1) * width + j + 2] = convertedPixels[6];
            data[(i + 1) * width + j + 3]  = convertedPixels[7];
            data[(i + 2) * width + j] = convertedPixels[8];
            data[(i + 2) * width + j + 1]  = convertedPixels[9];
            data[(i + 2) * width + j + 2] = convertedPixels[10];
            data[(i + 2) * width + j + 3]  = convertedPixels[11];
            data[(i + 3) * width + j] = convertedPixels[12];
            data[(i + 3) * width + j + 1]  = convertedPixels[13];
            data[(i + 3) * width + j + 2] = convertedPixels[14];
            data[(i + 3) * width + j + 3]  = convertedPixels[15];

            free(convertedPixels); 
        }
    }

    fwrite(data, 3 * width, height, fOutput);
    fclose(fOutput);

    return 0;
}