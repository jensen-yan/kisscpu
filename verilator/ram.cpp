#include "ram.h"
#include <stdio.h>
#include <string.h>
#include <assert.h>

ram_c::ram_c(char* imgPath)
{
    ramSize = RAMSIZE / sizeof(paddr_t);
    memset(ram, 0, ramSize);
#ifdef DEBUG
    imgSize = 4;
    ram[0] = 0x800002b7;  // lui t0,0x80000
    ram[1] = 0x0002a023;  // sw  zero,0(t0)
    ram[2] = 0x0002a503;  // lw  a0,0(t0)
    

#else
    assert(imgPath && "No image file");
    FILE *fp = fopen(imgPath, "rb");
    assert(fp && "Cannot open file");

    fseek(fp, 0, SEEK_END);
    imgSize = ftell(fp);

    fseek(fp, 0, SEEK_SET);
    int ret = fread(ram, imgSize, 1, fp);
    assert(ret && "read img failed");
    fclose(fp);

#endif



}

ram_c::~ram_c()
{
}

void* ram_c::getImgStart()
{
    return &ram[0];
}
    
int ram_c::getImgSize()
{
    return imgSize;
}