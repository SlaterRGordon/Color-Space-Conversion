#include <math.h>
#define M_PI 3.14159265358979323846

void *gaussianFilter(pixel *data, pixel *filteredData, int width, int height){
    uint8x8_t kernel1 = vdup_n_u8(38);
    uint8x8_t kernel2 = vdup_n_u8(171);
    uint8x8_t kernel3 = vdup_n_u8(8);
    uint8x8_t kernel4 = vdup_n_u8(38);
    
    uint16x8_t leftShiftVal = vdupq_n_u16(128);

	short int i, j;
	for(i = 0; i < height; i++) {
		for(j = 0; j < width; j+=8) {
            int index1 = i * width + j;
            // printf("index1: %d\n", j);

            // load data into a NEON vector
            uint8x8x3_t dataVecR1_8x3 = vld3_u8(&data[index1].x);
            uint8x8x3_t dataVecR1I1_8x3 = vld3_u8(&data[index1 + 1].x);
            uint8x8x3_t dataVecR2_8x3 = vld3_u8(&data[index1 + width].x);
            uint8x8x3_t dataVecR2I1_8x3 = vld3_u8(&data[index1 + width + 1].x);

            uint16x8_t resultX = vmlal_u8(
                vmlal_u8(
                    vmlal_u8(
                        vmull_u8(dataVecR2I1_8x3.val[0], kernel4), 
                        dataVecR2_8x3.val[0], kernel3
                    ), 
                    dataVecR1I1_8x3.val[0], kernel2
                ),
                dataVecR1_8x3.val[0], kernel1
            );
            uint16x8_t resultY = vmlal_u8(
                vmlal_u8(
                    vmlal_u8(
                        vmull_u8(dataVecR2I1_8x3.val[1], kernel4), 
                        dataVecR2_8x3.val[1], 
                        kernel3
                    ), 
                    dataVecR1I1_8x3.val[1], 
                    kernel2
                ),
                dataVecR1_8x3.val[1], kernel1
            );
            uint16x8_t resultZ = vmlal_u8(
                vmlal_u8(
                    vmlal_u8(
                        vmull_u8(dataVecR2I1_8x3.val[2], kernel4), 
                        dataVecR2_8x3.val[2], 
                        kernel3
                    ), 
                    dataVecR1I1_8x3.val[2], 
                    kernel2
                ),
                dataVecR1_8x3.val[2], 
                kernel1
            );

            // Create a uint8x8x3_t structure to store the results
            uint8x8x3_t resultData;

            // Store the resultX, resultY, and resultZ vectors into the structure
            resultData.val[0] = vshrn_n_u16(vaddq_u16(resultX, leftShiftVal), 8);
            resultData.val[1] = vshrn_n_u16(vaddq_u16(resultY, leftShiftVal), 8);
            resultData.val[2] = vshrn_n_u16(vaddq_u16(resultZ, leftShiftVal), 8);

            // Store the resultData structure into the 'filteredData' array at the specified index
            vst3_u8((uint8_t*)&filteredData[index1], resultData);
        }
    }
}