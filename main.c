#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <stdbool.h>
#include "bmp.h" // include bmp file utils
#include "colors.h" // include color conversion utils
#include <time.h>

int main(int argc, char* argv[]) {

    clock_t startTime, endTime;
    double cpuTimeUsed;

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

    // checks if rgb2Ycc or ycc2Rgb
    bool rgb = true;
    if (strcmp(argv[3], "-y2r") == 0)
    {
        rgb = false;
    }

    // read header from image and write to output file
    fileHeader *fh = readFileHeader(fInput);
    writeFileHeader(fOutput, fh);

    int width = fh->infoHeader.width;
    int height = fh->infoHeader.height;

    // move pointer passed file header
    fseek(fInput, fh->header.dataOffset, SEEK_SET);

    // initialize pixel to read into
    rgbPixel *rPixel = malloc(sizeof(rgbPixel));
    yccPixel *yPixel = malloc(sizeof(yccPixel));

    int i = 0;
    int j = 0;
    // iterate through pixels
    // for (int i = 0; i < height; i++) {
    //     for (int j = 0; j < width; j++) {
    for ( i = 0; i < height; i++) {
        for ( j = 0; j < width; j++) {
            if (rgb) {
                fread(rPixel, sizeof(rgbPixel), 1, fInput); // read in pixel
                yccPixel *convertedPixel = rgbToYcc(rPixel);
                fwrite(convertedPixel, sizeof(yccPixel), 1, fOutput); // write pixel to output
            } else {
                fread(yPixel, sizeof(yccPixel), 1, fInput); // read in pixel
                rgbPixel *convertedPixel = yccToRgb(yPixel);
                fwrite(convertedPixel, sizeof(rgbPixel), 1, fOutput); // write pixel to output
            }
        }
    }

    fclose(fInput);
    fclose(fOutput);

    // Calculate the CPU time used in seconds
    cpuTimeUsed = ((double) (endTime - startTime)) / CLOCKS_PER_SEC;
    printf("Program ran for: %f seconds\n", cpuTimeUsed);

    return 0;
}