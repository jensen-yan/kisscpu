#ifndef __DIFFTESTIO_H__
#define __DIFFTESTIO_H__

#include "common.h"

typedef struct diffTestIO_t
{
  paddr_t regfile[NUM_REG];
  paddr_t PC;  //PC must follow regFile continuously in address space
  paddr_t empty[6];
} diffTestIO;

#endif