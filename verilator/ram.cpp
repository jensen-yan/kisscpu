#include "ram.h"
#include <stdio.h>
#include <string.h>
#include <assert.h>

CRam::CRam(char* imgPath)
{
    m_ramSize = RAMSIZE / sizeof(paddr_t);
    memset(m_ram, 0, m_ramSize);
    /*
#ifdef DEBUG
    m_imgSize = 4;
    m_ram[0] = 0x800002b7;  // lui t0,0x80000
    m_ram[1] = 0x800002b7;  // lui t0,0x80000
    m_ram[2] = 0x0002a023;  // sw  zero,0(t0)
    m_ram[3] = 0x0002a503;  // lw  a0,0(t0)

#else
*/
    assert(imgPath && "No image file");
    FILE *fp = fopen(imgPath, "rb");
    assert(fp && "Cannot open file");

    fseek(fp, 0, SEEK_END);
    m_imgSize = ftell(fp);

    fseek(fp, 0, SEEK_SET);
    int ret = fread(m_ram, m_imgSize, 1, fp);  // 把指令数据都读入ram中
    assert(ret && "read img failed");
    fclose(fp);

// #endif



}

CRam::~CRam()
{
}

void* CRam::getImgStart()
{
    return m_ram;
}
    
int CRam::getImgSize()
{
    return m_imgSize;
}



iaddr_t CRam::InstRead(paddr_t addr, bool en){
    // printf("inst read addr = 0x%016lx en = %d\n", addr, en);
    if(!en) return 0;
    assert(ADDRSTART <= addr &&
        addr <= ADDRSTART + m_ramSize &&
        "read addr out of range");
    return m_ram[(addr - ADDRSTART) / sizeof(paddr_t)] >> ((addr % sizeof(paddr_t)) * 8);   // 读Iram
}

paddr_t CRam::DataRead(paddr_t addr, bool en){
    // printf("data read addr = 0x%016lx en = %d\n", addr, en);
    // paddr_t addr_debug = 0x0000000080000030;
    // printf("data[] = 0x%016lx\n", m_ram[(addr_debug - ADDRSTART) / sizeof(paddr_t)]);
    if(!en) return 0;
    assert(ADDRSTART <= addr &&
        addr <= ADDRSTART + m_ramSize &&
        "read data addr out of range");
    return m_ram[(addr - ADDRSTART) / sizeof(paddr_t)] >> ((addr % sizeof(paddr_t)) * 8); // 读data_ram
    // 根据地址后3位选取确定的数据, lw, lb, lh这些需要
    // TODO: 应该需要在chisel中实现!
}

void    CRam::DataWrite(paddr_t addr, paddr_t data, bool en, mask_t mask){
    if(!en) return;
    assert(ADDRSTART <= addr &&
        addr <= ADDRSTART + m_ramSize &&
        "write data addr out of range");
    if (en) {
        paddr_t data_mask = data;
        paddr_t fullMask = 0;
        paddr_t ff = 0xff;      // 直接用0xff会导致默认转换成32位的! 一定要注意!
        for (size_t i = 0; i < 8; i++)
        {
            if ((mask >> i) & 0x1)
            {
                fullMask = fullMask | (ff << (i*8));
            }
        }
        data_mask = (fullMask & data) | (~fullMask & m_ram[(addr - ADDRSTART) / sizeof(paddr_t)]);
        // 如果lb写入8byte, 其他要保持不变
        m_ram[(addr - ADDRSTART) / sizeof(paddr_t)] = data_mask;
        // printf("mask = %x, fullMask= 0x%016lx, data = 0x%016lx, data_mask = 0x%016lx\n", mask, fullMask, data, data_mask);
  }
}