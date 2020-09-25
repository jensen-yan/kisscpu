#ifndef __RAM_H__
#define __RAM_H__

#include "common.h"
/**
* 使用数组模拟的RAM类
*/
class CRam
{
private:
    /** 巨大的RAM数组(存储指令), 每个元素64位 */
    paddr_t m_ram[RAMSIZE / sizeof(paddr_t)];
    int m_ramSize;  ///< ram的大小, 单位为64byte
    int m_imgSize;  ///< ram内存储img的大小

public:
    /**
     * @brief Construct a new CRam object
     * 
     * @param imgPath 输入img文件的地址路径
     */
    CRam(char* imgPath);
    /**
     * @brief Destroy the CRam object
     * 
     */
    ~CRam();
    /**
     * @brief Get the Img Start object 获取img的起始地址
     * 
     * @return void*  返回img起始地址
     */
    void *getImgStart();
    /**
     * @brief Get the Img Size object 获取img大小
     * 
     * @return int 返回img大小
     */
    int getImgSize();

    // 指令, 数据读写功能
    /**
     * @brief 指令读
     * 
     * @param addr 指令地址
     * @param en enable
     * @return paddr_t 返回具体指令
     */
    paddr_t InstRead(paddr_t addr, bool en);
    /**
     * @brief 数据读
     * 
     * @param addr 数据地址
     * @param en 
     * @return paddr_t 返回具体数据
     */
    paddr_t DataRead(paddr_t addr, bool en);
    /**
     * @brief 数据写
     * 
     * @param addr 
     * @param data 
     * @param en 
     */
    void    DataWrite(paddr_t addr, paddr_t data, bool en);
};


#endif