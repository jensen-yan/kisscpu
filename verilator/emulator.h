#ifndef __EMULATOR_H__
#define __EMULATOR_H__

#include "ram.h"
#include "VsimTop.h"
#include "difftestIO.h"

/**
 * @brief 运行kisscpu的模拟器
 * 
 */
class CEmulator
{
private:
    /**
     * @brief 当前时钟
     * 
     */
    int m_cycles = 0;
    long* m_sc_time;
    /**
     * @brief 模拟器运行需要的ram指针
     * 
     */
    CRam *m_ram;
    /**
     * @brief verilator生成的顶层指针
     * 
     */
    VsimTop* m_simtop;
    /**
     * @brief 波形指针
     * 
     */
    VerilatedVcdC* m_tfp;
    /**
     * @brief reset n个时钟
     * 
     * @param cycles n次
     */
    void reset_ncycles(int cycles);

    void evalRam();
public:
    /**
     * @brief Construct a new CEmulator object
     * 
     * @param input_ram 输入ram
     */
    CEmulator(CRam* input_ram, long* input_time);
    ~CEmulator();
    /**
     * @brief 模拟器运行几步
     * 
     * @param i 执行步数
     */
    void step(int i);
    /**
     * @brief 读取DUT的所有reg到r中
     * 
     * @param r 存放kisscpu的reg信息
     */
    void read_emu_regs(reg_t* r);    
    double sc_time_stamp ();
};

#endif
