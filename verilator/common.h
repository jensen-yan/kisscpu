/**
 * @file common.h
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.1
 * @date 2020-09-23
 * 
 * @copyright Copyright (c) 2020
 * 
 */
#ifndef __COMMON_H__
#define __COMMON_H__

#include "constants.h"
// #define DEBUG
// TODO:
#define __RV64__
// #define __RV32__

#define vcdTrace true

typedef unsigned char uint8_t;
typedef unsigned int uint32_t;
typedef unsigned long int uint64_t;


#ifdef __RV32__
typedef uint32_t reg_t;
typedef uint32_t paddr_t;  
#else
typedef uint64_t reg_t;
typedef uint64_t paddr_t;   // 对数据地址取64位, 数据也是64位
#endif

typedef uint32_t iaddr_t;   // 对指令地址取32位
typedef uint8_t  mask_t;    

/**
 * @brief 枚举的不同变量
 * 
 */
//! 0~31: GPRs
enum {
  DIFFTEST_THIS_PC = 32,  ///< pc放在32号处
#ifndef __RV32__
  DIFFTEST_MSTATUS,
  DIFFTEST_MCAUSE,
  DIFFTEST_MEPC,
  DIFFTEST_SSTATUS,
  DIFFTEST_SCAUSE,
  DIFFTEST_SEPC,
#endif
  DIFFTEST_NR_REG
};
// 64位下 DIFFTEST_NR_REG = 39, 32位 = 33

// typedef reg_t ref_reg[DIFFTEST_NR_REG] emu_reg;
// reg_t ref_reg[DIFFTEST_NR_REG];   // 用于验证的reg集合
// reg_t emu_reg[DIFFTEST_NR_REG];   // 仿真得到的reg集合


#define ADDRSTART 0x80000000
#define RAMSIZE (128 * 1024 * 1024)


#endif