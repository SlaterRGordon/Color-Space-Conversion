#include <math.h>
#define M_PI 3.14159265358979323846

double *createFilterKernel()
{
    // initialising standard deviation to 1.0
    double sigma = 1.0;
    double r, s = 2.0 * sigma * sigma;
 
    // sum is for normalization
    double sum = 0.0;
    double *kernel = (double *)malloc(4 * sizeof(double));
    // generating 4x4 kernel
    for (short int i = 2; i != 0; i--) {
        for (short int j = 2; j != 0; j--) {
            r = sqrt(i * i + j * j);
            kernel[i * 2 - j] = (exp(-(r * r) / s)) / (M_PI * s);
            sum += (exp(-(r * r) / s)) / (M_PI * s);
        }
    }
    
    // normalising the Kernel
    for (short int i = 2; i != 0; i--) {
        for (short int j = 2; j != 0; j--) {
            kernel[i * 2 - j] /= sum;
        }
    }

    return kernel;
}

void *gaussianFilter(pixel *data, pixel *filteredData, int width, int height){
    double *kernel = (double *)malloc(4 * sizeof(double));
    kernel = createFilterKernel();

	short int i, j;
	for(i = 0; i < height; i++) {
		for(j = 0; j < width; j++) {
            filteredData[i * width + j].x = data[i * width + j].x * kernel[0] +
                data[i * width + j + 1].x * kernel[1] +
                data[(i + 1) * width + j].x * kernel[2] +
                data[(i + 1) * width + j + 1].x * kernel[3];
            
            filteredData[i * width + j].y = data[i * width + j].y * kernel[0] +
                data[i * width + j + 1].y * kernel[1] +
                data[(i + 1) * width + j].y * kernel[2] +
                data[(i + 1) * width + j + 1].y * kernel[3];

            filteredData[i * width + j].z = data[i * width + j].z * kernel[0] + 
                data[i * width + j + 1].z * kernel[1] + 
                data[(i + 1) * width + j].z * kernel[2] + 
                data[(i + 1) * width + j + 1].z * kernel[3];
        }
    }

    free(kernel);
}