#include "ram.h"
#include <stdio.h>
#include <string.h>
#include <assert.h>

CRam::CRam(char* imgPath)
{
    m_ramSize = RAMSIZE / sizeof(paddr_t);
    memset(m_ram, 0, m_ramSize);
    // memset(dram, 0, m_ramSize);
#ifdef DEBUG
    m_imgSize = 4;
    m_ram[0] = 0x800002b7;  // lui t0,0x80000
    m_ram[1] = 0x800002b7;  // lui t0,0x80000
    m_ram[2] = 0x0002a023;  // sw  zero,0(t0)
    m_ram[3] = 0x0002a503;  // lw  a0,0(t0)
    

#else
    assert(imgPath && "No image file");
    FILE *fp = fopen(imgPath, "rb");
    assert(fp && "Cannot open file");

    fseek(fp, 0, SEEK_END);
    m_imgSize = ftell(fp);

    fseek(fp, 0, SEEK_SET);
    int ret = fread(m_ram, m_imgSize, 1, fp);
    assert(ret && "read img failed");
    fclose(fp);

#endif



}

CRam::~CRam()
{
}

void* CRam::getImgStart()
{
    return &m_ram[0];
}
    
int CRam::getImgSize()
{
    return m_imgSize;
}



paddr_t CRam::InstRead(paddr_t addr, bool en){
    // printf("addr = 0x%016lx \n", addr);
    assert(ADDRSTART <= addr &&
        addr <= ADDRSTART + m_ramSize &&
        "read addr out of range");
    return en ? m_ram[(addr - ADDRSTART) / sizeof(paddr_t)] : 0;
}

paddr_t CRam::DataRead(paddr_t addr, bool en){
    printf("data addr = 0x%016lx \n", addr);
    assert(ADDRSTART <= addr &&
        addr <= ADDRSTART + m_ramSize &&
        "read data addr out of range");
    return en ? m_ram[(addr - ADDRSTART) / sizeof(paddr_t)] : 0; // 读data_ram
}

// TODO: 加上mask信号
void    CRam::DataWrite(paddr_t addr, paddr_t data, bool en){
    assert(ADDRSTART <= addr &&
        addr <= ADDRSTART + m_ramSize &&
        "write data addr out of range");
    if (en) {
    m_ram[(addr - ADDRSTART) / sizeof(paddr_t)] = data;
  }
}