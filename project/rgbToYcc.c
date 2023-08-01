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

    fh->infoHeader.width /= 2;
    fh->infoHeader.height /= 2;

    writeFileHeader(fOutput, fh);
    fseek(fInput, fh->header.dataOffset, SEEK_SET);

    // allocate mem and read image into data
    pixel *data = (pixel *)malloc(width * height * sizeof(pixel));
    if (fread(data, 3 * width, height, fInput) != (size_t)height) {
        fprintf(stderr, "Failed to read image \n");
        exit(1);
    }
    fclose(fInput);

    // pixel *filteredData = (pixel *)malloc(width * height * sizeof(pixel));
    // gaussianFilter(data, filteredData, width, height);
    // free(data);

    compressedPixel *compressedData = (compressedPixel *)malloc((width/2) * (height/2) * sizeof(compressedPixel));
    uint16x8_t leftShiftVal = vdupq_n_u16(128);

    register short int i, j;
    for (i = 0; i < height; i+=2) {
        for (j = 0; j < width; j+=8) {
            int sampleIndex = (i/2) * width/2 + (j/2);
            int index1 = i * width + j;

            uint8x8x3_t dataVecR1_8x3 = vld3_u8(&data[index1].x);
            uint8x8x3_t dataVecR1I1_8x3 = vld3_u8(&data[index1 + 1].x);
            uint8x8x3_t dataVecR2_8x3 = vld3_u8(&data[index1 + width].x);
            uint8x8x3_t dataVecR2I1_8x3 = vld3_u8(&data[index1 + width + 1].x);
            
            uint8x8_t resultX1 = vshrn_n_u16(
                vaddq_u16(
                    vmlal_u8(
                        vmlal_u8(
                            vmull_u8(dataVecR1_8x3.val[2], vdup_n_u8(25)), 
                            dataVecR1_8x3.val[1], vdup_n_u8(129)
                        ), 
                        dataVecR1_8x3.val[0], vdup_n_u8(66)
                    ), 
                    vdupq_n_u16(4096)
                ), 
                8
            );

            uint8x8_t resultX2 = vshrn_n_u16(
                vaddq_u16(
                    vmlal_u8(
                        vmlal_u8(
                            vmull_u8(dataVecR2_8x3.val[2], vdup_n_u8(25)), 
                            dataVecR2_8x3.val[1], vdup_n_u8(129)
                        ), 
                        dataVecR2_8x3.val[0], vdup_n_u8(66)
                    ), 
                    vdupq_n_u16(4096)
                ), 
                8
            );

            uint8x8_t resultY = vshrn_n_u16(
                vaddq_u16(
                    vaddq_u16(
                        vaddq_u16(
                            vshrq_n_u16(
                                vmlal_u8(
                                    vmlsl_u8(
                                        vsubq_u16(vdupq_n_u16(32896), vmull_u8(dataVecR1_8x3.val[0], vdup_n_u8(38))), 
                                        dataVecR1_8x3.val[1], vdup_n_u8(74)
                                    ), 
                                    dataVecR1_8x3.val[2], vdup_n_u8(112)
                                ),
                                8
                            ),
                            vshrq_n_u16(
                                vmlal_u8(
                                    vmlsl_u8(
                                        vsubq_u16(vdupq_n_u16(32896), vmull_u8(dataVecR1I1_8x3.val[0], vdup_n_u8(38))), 
                                        dataVecR1I1_8x3.val[1], vdup_n_u8(74)
                                    ), 
                                    dataVecR1I1_8x3.val[2], vdup_n_u8(112)
                                ),
                                8
                            )
                        ),
                        vshrq_n_u16(
                            vmlal_u8(
                                vmlsl_u8(
                                    vsubq_u16(vdupq_n_u16(32896), vmull_u8(dataVecR2_8x3.val[0], vdup_n_u8(38))), 
                                    dataVecR2_8x3.val[1], vdup_n_u8(74)
                                ), 
                                dataVecR2_8x3.val[2], vdup_n_u8(112)
                            ),
                            8
                        )
                    ),
                    vshrq_n_u16(
                        vmlal_u8(
                            vmlsl_u8(
                                vsubq_u16(vdupq_n_u16(32896), vmull_u8(dataVecR2I1_8x3.val[0], vdup_n_u8(38))), 
                                dataVecR2I1_8x3.val[1], vdup_n_u8(74)
                            ), 
                            dataVecR2I1_8x3.val[2], vdup_n_u8(112)
                        ),
                        8
                    )
                ),
                2
            );

            uint8x8_t resultZ = vshrn_n_u16(
                vaddq_u16(
                    vaddq_u16(
                        vaddq_u16(
                            vshrq_n_u16(
                                vmlsl_u8(
                                    vmlsl_u8(
                                        vaddq_u16(vdupq_n_u16(32896), vmull_u8(dataVecR1_8x3.val[0], vdup_n_u8(112))), 
                                        dataVecR1_8x3.val[1], vdup_n_u8(94)
                                    ), 
                                    dataVecR1_8x3.val[2], vdup_n_u8(18)
                                ),
                                8
                            ),
                            vshrq_n_u16(
                                vmlsl_u8(
                                    vmlsl_u8(
                                        vaddq_u16(vdupq_n_u16(32896), vmull_u8(dataVecR1I1_8x3.val[0], vdup_n_u8(112))), 
                                        dataVecR1I1_8x3.val[1], vdup_n_u8(94)
                                    ), 
                                    dataVecR1I1_8x3.val[2], vdup_n_u8(18)
                                ),
                                8
                            )
                        ),
                        vshrq_n_u16(
                            vmlsl_u8(
                                vmlsl_u8(
                                    vaddq_u16(vdupq_n_u16(32896), vmull_u8(dataVecR2_8x3.val[0], vdup_n_u8(112))), 
                                    dataVecR2_8x3.val[1], vdup_n_u8(94)
                                ), 
                                dataVecR2_8x3.val[2], vdup_n_u8(18)
                            ), 
                            8
                        )
                    ),
                    vshrq_n_u16(
                        vmlsl_u8(
                            vmlsl_u8(
                                vaddq_u16(vdupq_n_u16(32896), vmull_u8(dataVecR2I1_8x3.val[0], vdup_n_u8(112))), 
                                dataVecR2I1_8x3.val[1], vdup_n_u8(94)
                            ), 
                            dataVecR2I1_8x3.val[2], vdup_n_u8(18)
                        ),
                        8
                    )
                ),2);
            
            compressedData[sampleIndex] = (compressedPixel) {
                .x1 = resultX1[0],
                .x2 = resultX1[1],
                .x3 = resultX2[0],
                .x4 = resultX2[1],
                .y = resultY[0],
                .z = resultZ[0]
            };
            compressedData[sampleIndex + 1] = (compressedPixel) {
                .x1 = resultX1[2],
                .x2 = resultX1[3],
                .x3 = resultX2[2],
                .x4 = resultX2[3],
                .y = resultY[2],
                .z = resultZ[2]
            };
            compressedData[sampleIndex + 2] = (compressedPixel) {
                .x1 = resultX1[4],
                .x2 = resultX1[5],
                .x3 = resultX2[4],
                .x4 = resultX2[5],
                .y = resultY[4],
                .z = resultZ[4]
            };
            compressedData[sampleIndex + 3] = (compressedPixel) {
                .x1 = resultX1[6],
                .x2 = resultX1[7],
                .x3 = resultX2[6],
                .x4 = resultX2[7],
                .y = resultY[6],
                .z = resultZ[6]
            };
        }
    }
    free(data);
    fwrite(compressedData, 6 * (width/2), (height/2), fOutput);
    free(compressedData);
    
    fclose(fOutput);

    return 0;
}