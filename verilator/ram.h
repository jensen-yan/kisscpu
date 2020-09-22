#ifndef __RAM_H__
#define __RAM_H__

#include "common.h"

class CRam
{
private:
    // 巨大的RAM数组(存储指令), 每个元素64位
    paddr_t m_ram[RAMSIZE / sizeof(paddr_t)];
    int m_ramSize;
    int m_imgSize;

public:
    CRam(char* imgPath);
    ~CRam();
    void *getImgStart();
    int getImgSize();

    // 指令, 数据读写功能
    paddr_t InstRead(paddr_t addr, bool en);
    paddr_t DataRead(paddr_t addr, bool en);
    void    DataWrite(paddr_t addr, paddr_t data, bool en);
};


#endif