#include "arm_neon.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <stdbool.h>
#include <math.h>
#include "bmp.h" // include bmp file utils
#include "color.h" // include color conversion utils

#define MAX(x, y) (((x) > (y)) ? (x) : (y))
#define MIN(x, y) (((x) < (y)) ? (x) : (y))

// Bilinear interpolation function
float bilinear_interp(float x, float y, float Q11, float Q12, float Q21, float Q22) {
    float R1 = (Q21 - Q11) * y + Q11;
    float R2 = (Q22 - Q12) * y + Q12;
    return (R2 - R1) * x + R1;
}

// Function to interpolate a matrix of Cr or Cb values
void interpolate_matrix(compressedPixel* data, pixel* interpolated_data, int width, int height) {
    float x_scale = 0.5;
    float y_scale = 0.5;
    int new_width = width * 2;
    int new_height = height * 2;

    int k = 0;
    for (int y = 0; y < new_height; y+=2) {
        for (int x = 0; x < new_width; x+=2) {
            float x0_original = x * x_scale;
            int x0 = floorf(x0_original);
            float x1_original = (x + 1) * x_scale;
            int x1 = floorf(x1_original);
            float x2_original = (x + 2) * x_scale;
            int x2 = floorf(x2_original);

            float y0_original = y * y_scale;
            int y0 = floorf(y0_original);
            float y1_original = (y + 1) * y_scale;
            int y1 = floorf(y1_original);
            float y2_original = (y + 2) * y_scale;
            int y2 = floorf(y2_original);

            if (x2 >= width) x2 = width - 1;
            if (y2 >= height) y2 = height - 1;

            compressedPixel Q11 = data[y0 * width + x0];
            compressedPixel Q12 = data[y1 * width + x0];
            compressedPixel Q13 = data[y2 * width + x0];
            compressedPixel Q21 = data[y0 * width + x1];
            compressedPixel Q22 = data[y1 * width + x1];
            compressedPixel Q23 = data[y2 * width + x1];
            compressedPixel Q31 = data[y0 * width + x2];
            compressedPixel Q32 = data[y1 * width + x2];
            compressedPixel Q33 = data[y2 * width + x2];

            float interpolated_y0 = bilinear_interp(x0_original - x0, y0_original - y0, Q11.y, Q12.y, Q21.y, Q22.y);
            float interpolated_z0 = bilinear_interp(x0_original - x0, y0_original - y0, Q11.z, Q12.z, Q21.z, Q22.z);

            float interpolated_y1 = bilinear_interp(x1_original - x1, y0_original - y0, Q12.y, Q13.y, Q22.y, Q23.y);
            float interpolated_z1 = bilinear_interp(x1_original - x1, y0_original - y0, Q12.z, Q13.z, Q22.z, Q23.z);

            float interpolated_y2 = bilinear_interp(x0_original - x0, y1_original - y1, Q21.y, Q22.y, Q31.y, Q32.y);
            float interpolated_z2 = bilinear_interp(x0_original - x0, y1_original - y1, Q21.z, Q22.z, Q31.z, Q32.z);

            float interpolated_y3 = bilinear_interp(x1_original - x1, y1_original - y1, Q22.y, Q23.y, Q32.y, Q33.y);
            float interpolated_z3 = bilinear_interp(x1_original - x1, y1_original - y1, Q22.z, Q23.z, Q32.z, Q33.z);

            int sampleIndex = (y/2) * width + (x/2);
            uint16_t r_temp1 = (74 * (data[sampleIndex].x1 - 16)) + (102 * (interpolated_z0 - 128));
            uint16_t r_temp2 = (74 * (data[sampleIndex].x2 - 16)) + (102 * (interpolated_z1 - 128));
            uint16_t r_temp3 = (74 * (data[sampleIndex].x3 - 16)) + (102 * (interpolated_z2 - 128));
            uint16_t r_temp4 = (74 * (data[sampleIndex].x4 - 16)) + (102 * (interpolated_z3 - 128));

            uint16_t g_temp1 = (74 * (data[sampleIndex].x1 - 16)) - (52 * (interpolated_z0 - 128)) - (25 * (interpolated_y0 - 128));
            uint16_t g_temp2 = (74 * (data[sampleIndex].x2 - 16)) - (52 * (interpolated_z1 - 128)) - (25 * (interpolated_y1 - 128));
            uint16_t g_temp3 = (74 * (data[sampleIndex].x3 - 16)) - (52 * (interpolated_z2 - 128)) - (25 * (interpolated_y2 - 128));
            uint16_t g_temp4 = (74 * (data[sampleIndex].x4 - 16)) - (52 * (interpolated_z3 - 128)) - (25 * (interpolated_y3 - 128));

            uint16_t b_temp1 = (74 * (data[sampleIndex].x1 - 16)) + (129 * (interpolated_y0 - 128));
            uint16_t b_temp2 = (74 * (data[sampleIndex].x2 - 16)) + (129 * (interpolated_y1 - 128));
            uint16_t b_temp3 = (74 * (data[sampleIndex].x3 - 16)) + (129 * (interpolated_y2 - 128));
            uint16_t b_temp4 = (74 * (data[sampleIndex].x4 - 16)) + (129 * (interpolated_y3 - 128));

            interpolated_data[y * new_width + x].x = MIN((uint8_t)((r_temp1 + 32) >> 6), 255);
            interpolated_data[y * new_width + x].y = MIN((uint8_t)((g_temp1 + 32) >> 6), 255);
            interpolated_data[y * new_width + x].z = MIN((uint8_t)((b_temp1 + 32) >> 6), 255);

            interpolated_data[y * new_width + x + 1].x = MIN((uint8_t)((r_temp2 + 32) >> 6), 255);
            interpolated_data[y * new_width + x + 1].y = MIN((uint8_t)((g_temp2 + 32) >> 6), 255);
            interpolated_data[y * new_width + x + 1].z = MIN((uint8_t)((b_temp2 + 32) >> 6), 255);

            interpolated_data[(y + 1) * new_width + x].x = MIN((uint8_t)((r_temp3 + 32) >> 6), 255);
            interpolated_data[(y + 1) * new_width + x].y = MIN((uint8_t)((g_temp3 + 32) >> 6), 255);
            interpolated_data[(y + 1) * new_width + x].z = MIN((uint8_t)((b_temp3 + 32) >> 6), 255);

            interpolated_data[(y + 1) * new_width + x + 1].x = MIN((uint8_t)((r_temp4 + 32) >> 6), 255);
            interpolated_data[(y + 1) * new_width + x + 1].y = MIN((uint8_t)((g_temp4 + 32) >> 6), 255);
            interpolated_data[(y + 1) * new_width + x + 1].z = MIN((uint8_t)((b_temp4 + 32) >> 6), 255);
        }
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
    interpolate_matrix(data, reconstructedData, width, height);
    // register short int i, j;
    // for (i = 0; i < newHeight; i+=2) {
    //     for (j = 0; j < newWidth; j+=2) {
    //         int sampleIndex = (i/2) * width + (j/2);
    //         reconstructedData[i * newWidth + j].x = (uint8_t)(1.164 * (data[sampleIndex].x1 - 16)) + (1.596 * (data[sampleIndex].z - 128));
    //         reconstructedData[i * newWidth + j].y = (uint8_t)(1.164 * (data[sampleIndex].x1 - 16)) + (-0.813 * (data[sampleIndex].z - 128)) + (-0.391 * (data[sampleIndex].y - 128));
    //         reconstructedData[i * newWidth + j].z = (uint8_t)(1.164 * (data[sampleIndex].x1 - 16)) + (2.018 * (data[sampleIndex].y - 128));

    //         reconstructedData[i * newWidth + j + 1].x = (uint8_t)(1.164 * (data[sampleIndex].x2 - 16)) + (1.596 * (data[sampleIndex].z - 128));
    //         reconstructedData[i * newWidth + j + 1].y = (uint8_t)(1.164 * (data[sampleIndex].x2 - 16)) + (-0.813 * (data[sampleIndex].z - 128)) + (-0.391 * (data[sampleIndex].y - 128));
    //         reconstructedData[i * newWidth + j + 1].z = (uint8_t)(1.164 * (data[sampleIndex].x2 - 16)) + (2.018 * (data[sampleIndex].y - 128));

    //         reconstructedData[(i + 1) * newWidth + j].x = (uint8_t)(1.164 * (data[sampleIndex].x3 - 16)) + (1.596 * (data[sampleIndex].z - 128));
    //         reconstructedData[(i + 1) * newWidth + j].y = (uint8_t)(1.164 * (data[sampleIndex].x3 - 16)) + (-0.813 * (data[sampleIndex].z - 128)) + (-0.391 * (data[sampleIndex].y - 128));
    //         reconstructedData[(i + 1) * newWidth + j].z = (uint8_t)(1.164 * (data[sampleIndex].x3 - 16)) + (2.018 * (data[sampleIndex].y - 128));

    //         reconstructedData[(i + 1) * newWidth + j + 1].x = (uint8_t)(1.164 * (data[sampleIndex].x4 - 16)) + (1.596 * (data[sampleIndex].z - 128));
    //         reconstructedData[(i + 1) * newWidth + j + 1].y = (uint8_t)(1.164 * (data[sampleIndex].x4 - 16)) + (-0.813 * (data[sampleIndex].z - 128)) + (-0.391 * (data[sampleIndex].y - 128));
    //         reconstructedData[(i + 1) * newWidth + j + 1].z = (uint8_t)(1.164 * (data[sampleIndex].x4 - 16)) + (2.018 * (data[sampleIndex].y - 128));
    //     }
    // }
    free(data);

    fwrite(reconstructedData, 3 * newWidth, newHeight, fOutput);
    free(reconstructedData);
    
    fclose(fOutput);

    return 0;
}