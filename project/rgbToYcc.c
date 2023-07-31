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
    uint16x8_t leftShiftVal = vdupq_n_u16(128);

    register short int i, j;
    for (i = 0; i < height; i+=2) {
        for (j = 0; j < width; j+=8) {
            int sampleIndex = (i/2) * width/2 + (j/2);
            int index1 = i * width + j;

            uint8x8x3_t dataVecR1_8x3 = vld3_u8(&filteredData[index1].x);
            uint8x8x3_t dataVecR1I1_8x3 = vld3_u8(&filteredData[index1 + 1].x);
            uint8x8x3_t dataVecR2_8x3 = vld3_u8(&filteredData[index1 + width].x);
            uint8x8x3_t dataVecR2I1_8x3 = vld3_u8(&filteredData[index1 + width + 1].x);
            
            uint8x8_t resultX = vshrn_n_u16(
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
            // uint8_t xVal = (uint8_t)((4096 + 
            //     (66 * (filteredData[index1].x) + 
            //     (129 * filteredData[index1].y) +  
            //     (25 * filteredData[index1].z)) + 128) >> 8);

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
            // uint8_t xVal = ((uint8_t)(((32768 - 
            //     (38 * filteredData[index1].x) - 
            //     (74 * filteredData[index1].y) + 
            //     (112 * filteredData[index1].z)) + 128) >> 8) + 
            //     (uint8_t)(((32768 - 
            //     (38 * filteredData[index1 + 1].x) - 
            //     (74 * filteredData[index1 + 1].y) + 
            //     (112 * filteredData[index1 + 1].z)) + 128) >> 8) + 
            //     (uint8_t)(((32768 - 
            //     (38 * filteredData[index1 + width].x) - 
            //     (74 * filteredData[index1 + width].y) + 
            //     (112 * filteredData[index1 + width].z)) + 128) >> 8) + 
            //     (uint8_t)(((32768 - 
            //     (38 * filteredData[index1 + width + 1].x) - 
            //     (74 * filteredData[index1 + width + 1].y) + 
            //     (112 * filteredData[index1 + width + 1].z)) + 128) >> 8)) >> 2;


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

            sampledData[sampleIndex].x = resultX[0];
            sampledData[sampleIndex].y = resultY[0];
            sampledData[sampleIndex].z = resultZ[0];

            sampledData[sampleIndex+1].x = resultX[2];
            sampledData[sampleIndex+1].y = resultY[2];
            sampledData[sampleIndex+1].z = resultZ[2];

            sampledData[sampleIndex+2].x = resultX[4];
            sampledData[sampleIndex+2].y = resultY[4];
            sampledData[sampleIndex+2].z = resultZ[4];

            sampledData[sampleIndex+3].x = resultX[6];
            sampledData[sampleIndex+3].y = resultY[6];
            sampledData[sampleIndex+3].z = resultZ[6];

        }
    }
    free(filteredData);

    fwrite(sampledData, 3 * (width/2), (height/2), fOutput);
    free(sampledData);
    
    fclose(fOutput);

    return 0;
}