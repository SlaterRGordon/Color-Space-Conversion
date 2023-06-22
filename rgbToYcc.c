#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include "bmp.h" // include bmp file utils
#include "colors.h" // include color conversion utils

int main(int argc, char* argv[]) {

    // open file in binary read mode
    FILE *fInput;
    if ((fInput = fopen("./images/shapes.bmp", "rb")) == NULL)
    {
        printf("Error opening input file\n");
        exit(1);
    }

    FILE *fOutput;
    if ((fOutput = fopen("./outputs/output.bmp", "wb")) == NULL)
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
    fseek(fInput, fh->header.dataOffset, SEEK_SET);

    // initialize pixel to read into
    rgbPixel *pixel = malloc(sizeof(rgbPixel));

    // iterate through pixels
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            fread(pixel, sizeof(rgbPixel), 1, fInput); // read in pixel
            yccPixel *convertedPixel = rgbToYcc(pixel);
            fwrite(convertedPixel, sizeof(yccPixel), 1, fOutput); // write pixel to output
        }
    }

    fclose(fInput);
    fclose(fOutput);

    return 0;
}