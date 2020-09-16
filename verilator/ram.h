#ifndef __RAM_H__
#define __RAM_H__

#include "common.h"

class ram_c
{
private:
    // 巨大的RAM数组, 每个元素64位
    paddr_t ram[RAMSIZE / sizeof(paddr_t)];
    paddr_t dram[RAMSIZE / sizeof(paddr_t)];     // 数据ram
    int ramSize;
    int imgSize;

public:
    ram_c(char* imgPath);
    ~ram_c();
    void *getImgStart();
    int getImgSize();

    // 指令, 数据读写功能
    paddr_t InstRead(paddr_t addr, bool en);
    paddr_t DataRead(paddr_t addr, bool en);
    void    DataWrite(paddr_t addr, paddr_t data, bool en, mask_t mask);
};


#endif