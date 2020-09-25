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

  // TODO: 改成64位了
  val BUBBLE  = 0x4033.U(64.W)
}



trait ScalarOpConstants
{

  //************************************
  // Control Signals
  val Y        = true.B
  val N        = false.B

  // PC Select Signal
  val PC_4     = 0.asUInt(2.W)  // PC + 4
val PC_BRJMP = 1.asUInt(2.W)  // brjmp_target
val PC_JALR  = 2.asUInt(2.W)  // jump_reg_target
val PC_EXC   = 3.asUInt(2.W)  // exception

  // Branch Type
  val BR_N     = 0.asUInt(4.W)  // Next
val BR_NE    = 1.asUInt(4.W)  // Branch on NotEqual
val BR_EQ    = 2.asUInt(4.W)  // Branch on Equal
val BR_GE    = 3.asUInt(4.W)  // Branch on Greater/Equal
val BR_GEU   = 4.asUInt(4.W)  // Branch on Greater/Equal Unsigned
val BR_LT    = 5.asUInt(4.W)  // Branch on Less Than
val BR_LTU   = 6.asUInt(4.W)  // Branch on Less Than Unsigned
val BR_J     = 7.asUInt(4.W)  // Jump
val BR_JR    = 8.asUInt(4.W)  // Jump Register

  // RS1 Operand Select Signal
  val OP1_RS1   = 0.asUInt(2.W) // Register Source #1
val OP1_PC    = 1.asUInt(2.W) // PC
val OP1_IMZ   = 2.asUInt(2.W) // Zero-extended Immediate from RS1 field, for use by CSRI instructions
val OP1_X     = 0.asUInt(2.W)

  // RS2 Operand Select Signal
  val OP2_RS2    = 0.asUInt(3.W) // Register Source #2
val OP2_ITYPE  = 1.asUInt(3.W) // immediate, I-type
val OP2_STYPE  = 2.asUInt(3.W) // immediate, S-type
val OP2_SBTYPE = 3.asUInt(3.W) // immediate, B
val OP2_UTYPE  = 4.asUInt(3.W) // immediate, U-type
val OP2_UJTYPE = 5.asUInt(3.W) // immediate, J-type
val OP2_X      = 0.asUInt(3.W)

  // Register Operand Output Enable Signal
  val OEN_0   = false.B
  val OEN_1   = true.B

  // Register File Write Enable Signal
  val REN_0   = false.B
  val REN_1   = true.B

  // ALU Operation Signal
  val ALU_ADD    = 0.asUInt(4.W)
  val ALU_SUB    = 1.asUInt(4.W)
  val ALU_SLL    = 2.asUInt(4.W)
  val ALU_SRL    = 3.asUInt(4.W)
  val ALU_SRA    = 4.asUInt(4.W)
  val ALU_AND    = 5.asUInt(4.W)
  val ALU_OR     = 6.asUInt(4.W)
  val ALU_XOR    = 7.asUInt(4.W)
  val ALU_SLT    = 8.asUInt(4.W)
  val ALU_SLTU   = 9.asUInt(4.W)
  val ALU_COPY_1 = 10.asUInt(4.W)
  val ALU_COPY_2 = 11.asUInt(4.W)
  val ALU_X      = 0.asUInt(4.W)

  // Writeback Select Signal
  val WB_ALU  = 0.asUInt(2.W)
  val WB_MEM  = 1.asUInt(2.W)
  val WB_PC4  = 2.asUInt(2.W)
  val WB_CSR  = 3.asUInt(2.W)
  val WB_X    = 0.asUInt(2.W)

  // Memory Write Signal
  val MWR_0   = false.B
  val MWR_1   = true.B
  val MWR_X   = false.B

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