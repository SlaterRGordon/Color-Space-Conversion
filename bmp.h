#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

typedef struct header {
    unsigned short signature;
    unsigned long fileSize;
    unsigned long reserved;
    unsigned long dataOffset;
} header;

typedef struct infoHeader {
    unsigned long size;
    unsigned long width;
    unsigned long height;
    unsigned short planes;
    unsigned long bitsPerPixel;
    unsigned long compression;
    unsigned long imageSize;
    unsigned long xPixelsPerM;
    unsigned long yPixelsPerM;
    unsigned long colorsUsed;
    unsigned long importantColors;
} infoHeader;

// typedef struct colorTable {
//     unsigned char red;
//     unsigned char green;
//     unsigned char blue;
//     unsigned char reserved;
// } colorTable;

typedef struct fileHeader {
    header header;
    infoHeader infoHeader;
    // colorTable colorTable;
} fileHeader;

fileHeader *readFileHeader(FILE *f) {
    // create pointer and allocate size of fileHeader struct
    fileHeader *fh = malloc(sizeof(struct fileHeader));

    // iterate through blocks in bmp file header and read from f
    fread(&fh->header.signature, sizeof(unsigned short), 1, f);
    fread(&fh->header.fileSize, sizeof(unsigned long), 1, f);
    fread(&fh->header.reserved, sizeof(unsigned long), 1, f);
    fread(&fh->header.dataOffset, sizeof(unsigned long), 1, f);
    fread(&fh->infoHeader.size, sizeof(unsigned long), 1, f);
    fread(&fh->infoHeader.width, sizeof(unsigned long), 1, f);
    fread(&fh->infoHeader.height, sizeof(unsigned long), 1, f);
    fread(&fh->infoHeader.planes, sizeof(unsigned short), 1, f);
    fread(&fh->infoHeader.bitsPerPixel, sizeof(unsigned long), 1, f);
    fread(&fh->infoHeader.compression, sizeof(unsigned long), 1, f);
    fread(&fh->infoHeader.imageSize, sizeof(unsigned long), 1, f);
    fread(&fh->infoHeader.xPixelsPerM, sizeof(unsigned long), 1, f);
    fread(&fh->infoHeader.yPixelsPerM, sizeof(unsigned long), 1, f);
    fread(&fh->infoHeader.colorsUsed, sizeof(unsigned long), 1, f);
    fread(&fh->infoHeader.importantColors, sizeof(unsigned long), 1, f);
    // fread(&fh->colorTable.red, sizeof(unsigned char), 1, f);
    // fread(&fh->colorTable.green, sizeof(unsigned char), 1, f);
    // fread(&fh->colorTable.blue, sizeof(unsigned char), 1, f);
    // fread(&fh->colorTable.reserved, sizeof(unsigned char), 1, f);

    return fh;
}

void *writeFileHeader(FILE *f, fileHeader *fh) {

    // iterate through blocks in bmp file header and write to f
    fwrite(&fh->header.signature, sizeof(unsigned short), 1, f);
    fwrite(&fh->header.fileSize, sizeof(unsigned long), 1, f);
    fwrite(&fh->header.reserved, sizeof(unsigned long), 1, f);
    fwrite(&fh->header.dataOffset, sizeof(unsigned long), 1, f);
    fwrite(&fh->infoHeader.size, sizeof(unsigned long), 1, f);
    fwrite(&fh->infoHeader.width, sizeof(unsigned long), 1, f);
    fwrite(&fh->infoHeader.height, sizeof(unsigned long), 1, f);
    fwrite(&fh->infoHeader.planes, sizeof(unsigned short), 1, f);
    fwrite(&fh->infoHeader.bitsPerPixel, sizeof(unsigned long), 1, f);
    fwrite(&fh->infoHeader.compression, sizeof(unsigned long), 1, f);
    fwrite(&fh->infoHeader.imageSize, sizeof(unsigned long), 1, f);
    fwrite(&fh->infoHeader.xPixelsPerM, sizeof(unsigned long), 1, f);
    fwrite(&fh->infoHeader.yPixelsPerM, sizeof(unsigned long), 1, f);
    fwrite(&fh->infoHeader.colorsUsed, sizeof(unsigned long), 1, f);
    fwrite(&fh->infoHeader.importantColors, sizeof(unsigned long), 1, f);
    // fwrite(&fh->colorTable.red, sizeof(unsigned char), 1, f);
    // fwrite(&fh->colorTable.green, sizeof(unsigned char), 1, f);
    // fwrite(&fh->colorTable.blue, sizeof(unsigned char), 1, f);
    // fwrite(&fh->colorTable.reserved, sizeof(unsigned char), 1, f);
}

