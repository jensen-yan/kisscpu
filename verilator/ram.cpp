#include "ram.h"
#include <stdio.h>
#include <string.h>
#include <assert.h>

CRam::CRam(char* imgPath)
{
    m_ramSize = RAMSIZE / sizeof(paddr_t);
    memset(m_Iram, 0, m_ramSize);
    memset(m_Dram, 0, m_ramSize);
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
    int ret = fread(m_Iram, m_imgSize, 1, fp);  // 把指令读入Iram中
    assert(ret && "read img failed");
    fclose(fp);

// #endif



}

CRam::~CRam()
{
}

void* CRam::getImgStart()
{
    return m_Iram;
}
    
int CRam::getImgSize()
{
    return m_imgSize;
}



iaddr_t CRam::InstRead(iaddr_t addr, bool en){
    printf("inst read addr = 0x%016lx \n", addr);
    assert(ADDRSTART <= addr &&
        addr <= ADDRSTART + m_ramSize &&
        "read addr out of range");
    return en ? m_Iram[(addr - ADDRSTART) / sizeof(iaddr_t)] : 0;   // 读Iram
}

paddr_t CRam::DataRead(paddr_t addr, bool en){
    printf("data read addr = 0x%016lx en = %d\n", addr, en);
    if(!en) return 0;
    assert(ADDRSTART <= addr &&
        addr <= ADDRSTART + m_ramSize &&
        "read data addr out of range");
    return en ? m_Dram[(addr - ADDRSTART) / sizeof(paddr_t)] : 0; // 读data_ram
}

// TODO: 加上mask信号
void    CRam::DataWrite(paddr_t addr, paddr_t data, bool en){
    if(!en) return;
    assert(ADDRSTART <= addr &&
        addr <= ADDRSTART + m_ramSize &&
        "write data addr out of range");
    if (en) {
    m_Dram[(addr - ADDRSTART) / sizeof(paddr_t)] = data;
  }
}