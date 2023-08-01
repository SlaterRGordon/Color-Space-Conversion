#include <math.h>
#define M_PI 3.14159265358979323846
#define MAX(x, y) (((x) > (y)) ? (x) : (y))
#define MIN(x, y) (((x) < (y)) ? (x) : (y))

void *gaussianFilter(pixel *data, pixel *filteredData, int width, int height){
	short int i, j, k, l;
	for(i = 0; i < height; i++) {
		for(j = 0; j < width; j++) {
            int index1 = i * width + j;

            // skip edges
            if (i == 0 || i == height - 1 || j == 0 || j == width - 1) {
                filteredData[index1].x = data[index1].x;
                filteredData[index1].y = data[index1].y;
                filteredData[index1].z = data[index1].z;
                continue;
            }
            
            filteredData[index1].x = ((data[index1 - 1].x * 20) +
                (data[index1].x * 32) +
                (data[index1 + 1].x * 20) +
                (data[index1 + width - 1].x * 32) +
                (data[index1 + width].x * 50) +
                (data[index1 + width + 1].x * 32) +
                (data[index1 + 2*width - 1].x * 20) +
                (data[index1 + 2*width].x * 32) +
                (data[index1 + 2*width + 1].x * 20) + 128) >> 8;

            filteredData[index1].y = ((data[index1 - 1].y * 20) +
                (data[index1].y * 32) +
                (data[index1 + 1].y * 20) +
                (data[index1 + width - 1].y * 32) +
                (data[index1 + width].y * 50) +
                (data[index1 + width + 1].y * 32) +
                (data[index1 + 2*width - 1].y * 20) +
                (data[index1 + 2*width].y * 32) +
                (data[index1 + 2*width + 1].y * 20) + 128) >> 8;

            filteredData[index1].z = ((data[index1 - 1].z * 20) +
                (data[index1].z * 32) +
                (data[index1 + 1].z * 20) +
                (data[index1 + width - 1].z * 32) +
                (data[index1 + width].z * 50) +
                (data[index1 + width + 1].z * 32) +
                (data[index1 + 2*width - 1].z * 20) +
                (data[index1 + 2*width].z * 32) +
                (data[index1 + 2*width + 1].z * 20) + 128) >> 8;
        }
    }
}

// void *gaussianFilter(pixel *data, pixel *filteredData, int width, int height){
//     uint8x8_t kernel1 = vdup_n_u8(20);
//     uint8x8_t kernel2 = vdup_n_u8(32);
//     uint8x8_t kernel3 = vdup_n_u8(20);
//     uint8x8_t kernel4 = vdup_n_u8(32);
//     uint8x8_t kernel5 = vdup_n_u8(50);
//     uint8x8_t kernel6 = vdup_n_u8(32);
//     uint8x8_t kernel7 = vdup_n_u8(20);
//     uint8x8_t kernel8 = vdup_n_u8(32);
//     uint8x8_t kernel9 = vdup_n_u8(20);
    
//     uint16x8_t leftShiftVal = vdupq_n_u16(128);

// 	short int i, j;
// 	for(i = 1; i < height - 1; i++) {
// 		for(j = 8; j < width - 8; j+=8) {
//             int index1 = i * width + j;
//             // printf("index1: %d\n", j);

//             // load data into a NEON vector
//             uint8x8x3_t dataVecR1_8x3 = vld3_u8(&data[index1 - 1].x);
//             uint8x8x3_t dataVecR1I1_8x3 = vld3_u8(&data[index1].x);
//             uint8x8x3_t dataVecR1I2_8x3 = vld3_u8(&data[index1 + 1].x);
//             uint8x8x3_t dataVecR2_8x3 = vld3_u8(&data[index1 + width - 1].x);
//             uint8x8x3_t dataVecR2I1_8x3 = vld3_u8(&data[index1 + width].x);
//             uint8x8x3_t dataVecR2I2_8x3 = vld3_u8(&data[index1 + width + 1].x);
//             uint8x8x3_t dataVecR3_8x3 = vld3_u8(&data[index1 + 2*width - 1].x);
//             uint8x8x3_t dataVecR3I1_8x3 = vld3_u8(&data[index1 + 2*width].x);
//             uint8x8x3_t dataVecR3I2_8x3 = vld3_u8(&data[index1 + 2*width + 1].x);

//             uint16x8_t resultX = vmlal_u8(
//                 vmlal_u8(
//                     vmlal_u8(
//                         vmlal_u8(
//                             vmlal_u8(
//                                 vmlal_u8(
//                                     vmlal_u8(
//                                         vmlal_u8(
//                                             vmull_u8(dataVecR3I2_8x3.val[0], kernel9), 
//                                             dataVecR3I1_8x3.val[0], kernel8
//                                         ), 
//                                         dataVecR3_8x3.val[0], kernel7
//                                     ),
//                                     dataVecR2I2_8x3.val[0], kernel6
//                                 ),
//                                 dataVecR2I1_8x3.val[0], kernel5
//                             ), 
//                             dataVecR2_8x3.val[0], kernel4
//                         ),
//                         dataVecR1I2_8x3.val[0], kernel3
//                     ), 
//                     dataVecR1I1_8x3.val[0], kernel2
//                 ),
//                 dataVecR1_8x3.val[0], kernel1
//             );

//             uint16x8_t resultY = vmlal_u8(
//                 vmlal_u8(
//                     vmlal_u8(
//                         vmlal_u8(
//                             vmlal_u8(
//                                 vmlal_u8(
//                                     vmlal_u8(
//                                         vmlal_u8(
//                                             vmull_u8(dataVecR3I2_8x3.val[1], kernel9), 
//                                             dataVecR3I1_8x3.val[1], kernel8
//                                         ), 
//                                         dataVecR3_8x3.val[1], kernel7
//                                     ),
//                                     dataVecR2I2_8x3.val[1], kernel6
//                                 ),
//                                 dataVecR2I1_8x3.val[1], kernel5
//                             ), 
//                             dataVecR2_8x3.val[1], kernel4
//                         ),
//                         dataVecR1I2_8x3.val[1], kernel3
//                     ), 
//                     dataVecR1I1_8x3.val[1], kernel2
//                 ),
//                 dataVecR1_8x3.val[1], kernel1
//             );

//             uint16x8_t resultZ = vmlal_u8(
//                 vmlal_u8(
//                     vmlal_u8(
//                         vmlal_u8(
//                             vmlal_u8(
//                                 vmlal_u8(
//                                     vmlal_u8(
//                                         vmlal_u8(
//                                             vmull_u8(dataVecR3I2_8x3.val[2], kernel9), 
//                                             dataVecR3I1_8x3.val[2], kernel8
//                                         ), 
//                                         dataVecR3_8x3.val[2], kernel7
//                                     ),
//                                     dataVecR2I2_8x3.val[2], kernel6
//                                 ),
//                                 dataVecR2I1_8x3.val[2], kernel5
//                             ), 
//                             dataVecR2_8x3.val[2], kernel4
//                         ),
//                         dataVecR1I2_8x3.val[2], kernel3
//                     ), 
//                     dataVecR1I1_8x3.val[2], kernel2
//                 ),
//                 dataVecR1_8x3.val[2], kernel1
//             );

//             // Create a uint8x8x3_t structure to store the results
//             uint8x8x3_t resultData;

//             // Store the resultX, resultY, and resultZ vectors into the structure
//             resultData.val[0] = vshrn_n_u16(vaddq_u16(resultX, leftShiftVal), 8);
//             resultData.val[1] = vshrn_n_u16(vaddq_u16(resultY, leftShiftVal), 8);
//             resultData.val[2] = vshrn_n_u16(vaddq_u16(resultZ, leftShiftVal), 8);

//             // Store the resultData structure into the 'filteredData' array at the specified index
//             vst3_u8((uint8_t*)&filteredData[index1], resultData);
//         }
//     }

//     // Handle edge cases    
//     for (int w = 0; w < width; w++) {
//         for (int x = 0; x < 8; x++) {
//             filteredData[w * width + x].x = data[w * width + x].x;
//             filteredData[w * width + x].y = data[w * width + x].y;
//             filteredData[w * width + x].z = data[w * width + x].z;

//             filteredData[w * width + (width - (1 + x))].x = data[w * width + (width - (1 + x))].x;
//             filteredData[w * width + (width - (1 + x))].y = data[w * width + (width - (1 + x))].y;
//             filteredData[w * width + (width - (1 + x))].z = data[w * width + (width - (1 + x))].z;
//         }

//         filteredData[w].x = data[w].x;
//         filteredData[w].y = data[w].y;
//         filteredData[w].z = data[w].z;

//         filteredData[(height - 1) * width + w].x = data[(height - 1) * width + w].x;
//         filteredData[(height - 1) * width + w].y = data[(height - 1) * width + w].y;
//         filteredData[(height - 1) * width + w].z = data[(height - 1) * width + w].z;
//     }
// }

float BiCubicWeightCoeff(float x, float a)
{
    if (x <= 1.0f)
    {
        return (1.0f - ((a + 3.0f) - (a + 2.0f) * x) * x * x);
    }
    else if (x < 2.0f)
    {
        return ((-4.0f + (8.0f - (5.0f - x) * x) * x) * a);
    }
    return 0.0f;
}