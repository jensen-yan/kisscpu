package common

import chisel3._
import chisel3.util.log2Ceil

object constans extends
  RISCVConstants with
  ScalarOpConstants with
  MemoryOpConstants
{
}


trait RISCVConstants {
  // TODO: 修改
  val XLEN = 64
  val NUM_REG = 32
  val ADDR_W = log2Ceil(XLEN) // 地址宽度 = 5

  val START_ADDR = "h80000000".U

  // abstract out instruction decode magic numbers
  val RD_MSB  = 11
  val RD_LSB  = 7
  val RS1_MSB = 19
  val RS1_LSB = 15
  val RS2_MSB = 24
  val RS2_LSB = 20

  val CSR_ADDR_MSB = 31
  val CSR_ADDR_LSB = 20
}



trait ScalarOpConstants
{
  //************************************
  // Control Signals

  val Y      = true.B
  val N      = false.B

  // PC Select Signal
  val PC_4   = 0.asUInt(3.W)  // PC + 4
  val PC_BR  = 1.asUInt(3.W)  // branch_target
  val PC_J   = 2.asUInt(3.W)  // jump_target
  val PC_JR  = 3.asUInt(3.W)  // jump_reg_target
  val PC_EXC = 4.asUInt(3.W)  // exception

  // Branch Type
  val BR_N   = 0.asUInt(4.W)  // Next
  val BR_NE  = 1.asUInt(4.W)  // Branch on NotEqual
  val BR_EQ  = 2.asUInt(4.W)  // Branch on Equal
  val BR_GE  = 3.asUInt(4.W)  // Branch on Greater/Equal
  val BR_GEU = 4.asUInt(4.W)  // Branch on Greater/Equal Unsigned
  val BR_LT  = 5.asUInt(4.W)  // Branch on Less Than
  val BR_LTU = 6.asUInt(4.W)  // Branch on Less Than Unsigned
  val BR_J   = 7.asUInt(4.W)  // Jump
  val BR_JR  = 8.asUInt(4.W)  // Jump Register

  // RS1 Operand Select Signal
  val OP1_RS1 = 0.asUInt(2.W) // Register Source #1
  val OP1_IMU = 1.asUInt(2.W) // immediate, U-type
  val OP1_IMZ = 2.asUInt(2.W) // Zero-extended rs1 field of inst, for CSRI instructions
  val OP1_X   = 0.asUInt(2.W)

  // RS2 Operand Select Signal
  val OP2_RS2 = 0.asUInt(2.W) // Register Source #2
  val OP2_IMI = 1.asUInt(2.W) // immediate, I-type
  val OP2_IMS = 2.asUInt(2.W) // immediate, S-type
  val OP2_PC  = 3.asUInt(2.W) // PC
  val OP2_X   = 0.asUInt(2.W)

  // Register File Write Enable Signal
  val REN_0   = false.B
  val REN_1   = true.B
  val REN_X   = false.B

  // ALU Operation Signal
  val ALU_ADD = 1.asUInt(4.W)
  val ALU_SUB = 2.asUInt(4.W)
  val ALU_SLL = 3.asUInt(4.W)
  val ALU_SRL = 4.asUInt(4.W)
  val ALU_SRA = 5.asUInt(4.W)
  val ALU_AND = 6.asUInt(4.W)
  val ALU_OR  = 7.asUInt(4.W)
  val ALU_XOR = 8.asUInt(4.W)
  val ALU_SLT = 9.asUInt(4.W)
  val ALU_SLTU= 10.asUInt(4.W)
  val ALU_COPY1= 11.asUInt(4.W)
  val ALU_X   = 0.asUInt(4.W)

  // Writeback Select Signal
  val WB_ALU  = 0.asUInt(2.W)
  val WB_MEM  = 1.asUInt(2.W)
  val WB_PC4  = 2.asUInt(2.W)
  val WB_CSR  = 3.asUInt(2.W)
  val WB_X    = 0.asUInt(2.W)

  // Memory Function Type (Read,Write,Fence) Signal
  val MWR_R   = 0.asUInt(2.W)
  val MWR_W   = 1.asUInt(2.W)
  val MWR_F   = 2.asUInt(2.W)
  val MWR_X   = 0.asUInt(2.W)

  // Memory Enable Signal
  val MEN_0   = false.B
  val MEN_1   = true.B
  val MEN_X   = false.B

  // Memory Mask Type Signal
  val MSK_B   = 0.asUInt(3.W)
  val MSK_BU  = 1.asUInt(3.W)
  val MSK_H   = 2.asUInt(3.W)
  val MSK_HU  = 3.asUInt(3.W)
  val MSK_W   = 4.asUInt(3.W)
  val MSK_X   = 4.asUInt(3.W)


  // Cache Flushes & Sync Primitives
  val M_N      = 0.asUInt(3.W)
  val M_SI     = 1.asUInt(3.W)   // synch instruction stream
  val M_SD     = 2.asUInt(3.W)   // synch data stream
  val M_FA     = 3.asUInt(3.W)   // flush all caches
  val M_FD     = 4.asUInt(3.W)   // flush data cache

  // Memory Functions (read, write, fence)
  val MT_READ  = 0.asUInt(2.W)
  val MT_WRITE = 1.asUInt(2.W)
  val MT_FENCE = 2.asUInt(2.W)

}

trait MemoryOpConstants
{
  val MT_X  = 0.asUInt(3.W)
  val MT_B  = 1.asUInt(3.W)
  val MT_H  = 2.asUInt(3.W)
  val MT_W  = 3.asUInt(3.W)
  val MT_D  = 4.asUInt(3.W)
  val MT_BU = 5.asUInt(3.W)
  val MT_HU = 6.asUInt(3.W)
  val MT_WU = 7.asUInt(3.W)

  val M_X   = "b0".asUInt(1.W)
  val M_XRD = "b0".asUInt(1.W) // int load
val M_XWR = "b1".asUInt(1.W) // int store

  val DPORT = 0
  val IPORT = 1
}

object CSR
{
  // commands
  val SZ = 3.W
  val X = 0.asUInt(SZ)
  val N = 0.asUInt(SZ)
  val W = 1.asUInt(SZ)
  val S = 2.asUInt(SZ)
  val C = 3.asUInt(SZ)
  val I = 4.asUInt(SZ)
  val R = 5.asUInt(SZ)

  val ADDRSZ = 12
  /*
  val firstCtr = CSRs.cycle
  val firstCtrH = CSRs.cycleh
  val firstHPC = CSRs.hpmcounter3
  val firstHPCH = CSRs.hpmcounter3h
  //val firstHPE = CSRs.mhpmevent3
  val firstMHPC = CSRs.mhpmcounter3
  val firstMHPCH = CSRs.mhpmcounter3h
  val firstHPM = 3
  val nCtr = 32
  val nHPM = nCtr - firstHPM
  val hpmWidth = 40
   */
}