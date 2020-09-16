#ifndef __RAM_H__
#define __RAM_H__

#include "common.h"

class ram_c
{
private:
    // 巨大的RAM数组
    paddr_t ram[RAMSIZE / sizeof(paddr_t)];
    int ramSize;
    int imgSize;
public:
    ram_c(char* imgPath);
    ~ram_c();
    void *getImgStart();
    int getImgSize();
};


#endif