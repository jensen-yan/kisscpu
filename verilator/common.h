#ifndef __COMMON_H__
#define __COMMON_H__

#include "constants.h"
#define DEBUG
// TODO:
#define __RV64__
// #define __RV32__

typedef unsigned int uint32_t;
typedef unsigned long int uint64_t;


#ifdef __RV32__
typedef uint32_t reg_t;
typedef uint32_t paddr_t;  
#else
typedef uint64_t reg_t;
typedef uint64_t paddr_t;  
#endif

// 0~31: GPRs
enum {
  DIFFTEST_THIS_PC = 32,
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


#define ADDRSTART 0x80000000
#define RAMSIZE (128 * 1024 * 1024)

#endif