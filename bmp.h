#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

typedef struct header {
    uint16_t signature;
    uint32_t fileSize;
    uint16_t reserved1;
    uint16_t reserved2;
    uint32_t dataOffset;
} header;

typedef struct infoHeader {
    uint32_t size;
    uint32_t width;
    uint32_t height;
    uint16_t planes;
    uint16_t bitsPerPixel;
    uint32_t compression;
    uint32_t imageSize;
    uint32_t xPixelsPerM;
    uint32_t yPixelsPerM;
    uint32_t colorsUsed;
    uint32_t importantColors;
} infoHeader;

typedef struct fileHeader {
    header header;
    infoHeader infoHeader;
} fileHeader;

fileHeader *readFileHeader(FILE *f) {
    // create pointer and allocate size of fileHeader struct
    fileHeader *fh = malloc(sizeof(struct fileHeader));

    // iterate through blocks in bmp file header and read from f
    fread(&fh->header.signature, sizeof(uint16_t), 1, f);
    fread(&fh->header.fileSize, sizeof(uint32_t), 1, f);
    fread(&fh->header.reserved1, sizeof(uint16_t), 1, f);
    fread(&fh->header.reserved2, sizeof(uint16_t), 1, f);
    fread(&fh->header.dataOffset, sizeof(uint32_t), 1, f);
    
    fread(&fh->infoHeader.size, sizeof(uint32_t), 1, f);
    fread(&fh->infoHeader.width, sizeof(uint32_t), 1, f);
    fread(&fh->infoHeader.height, sizeof(uint32_t), 1, f);
    fread(&fh->infoHeader.planes, sizeof(uint16_t), 1, f);
    fread(&fh->infoHeader.bitsPerPixel, sizeof(uint16_t), 1, f);
    fread(&fh->infoHeader.compression, sizeof(uint32_t), 1, f);
    fread(&fh->infoHeader.imageSize, sizeof(uint32_t), 1, f);
    fread(&fh->infoHeader.xPixelsPerM, sizeof(uint32_t), 1, f);
    fread(&fh->infoHeader.yPixelsPerM, sizeof(uint32_t), 1, f);
    fread(&fh->infoHeader.colorsUsed, sizeof(uint32_t), 1, f);
    fread(&fh->infoHeader.importantColors, sizeof(uint32_t), 1, f);

    return fh;
}

void *writeFileHeader(FILE *f, fileHeader *fh) {

    // iterate through blocks in bmp file header and write to f
    fwrite(&fh->header.signature, sizeof(uint16_t), 1, f);
    fwrite(&fh->header.fileSize, sizeof(uint32_t), 1, f);
    fwrite(&fh->header.reserved1, sizeof(uint16_t), 1, f);
    fwrite(&fh->header.reserved2, sizeof(uint16_t), 1, f);
    fwrite(&fh->header.dataOffset, sizeof(uint32_t), 1, f);

    fwrite(&fh->infoHeader.size, sizeof(uint32_t), 1, f);
    fwrite(&fh->infoHeader.width, sizeof(uint32_t), 1, f);
    fwrite(&fh->infoHeader.height, sizeof(uint32_t), 1, f);
    fwrite(&fh->infoHeader.planes, sizeof(uint16_t), 1, f);
    fwrite(&fh->infoHeader.bitsPerPixel, sizeof(uint16_t), 1, f);
    fwrite(&fh->infoHeader.compression, sizeof(uint32_t), 1, f);
    fwrite(&fh->infoHeader.imageSize, sizeof(uint32_t), 1, f);
    fwrite(&fh->infoHeader.xPixelsPerM, sizeof(uint32_t), 1, f);
    fwrite(&fh->infoHeader.yPixelsPerM, sizeof(uint32_t), 1, f);
    fwrite(&fh->infoHeader.colorsUsed, sizeof(uint32_t), 1, f);
    fwrite(&fh->infoHeader.importantColors, sizeof(uint32_t), 1, f);
}

