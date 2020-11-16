package common

import chisel3._
import chisel3.util.log2Ceil

object constans extends
  commonConstants with
  RISCVConstants with
  PCConstants with
  instConstants with
  brTypeConstants with
  regfileConstants with
  aluFuncConstants with
  memTypeConstants with
  opSelConstants with
  CSRConstants
{
}


trait commonConstants
{
  val Y        = true.B
  val N        = false.B
}

trait RISCVConstants {
   val DEBUG_PRINT = false    // 是否输出调试信息
// val DEBUG_PRINT = true
  val ADD_SOURCE = false   // 是否添加add_source

  val XLEN = 64
  val NUM_REG = 32
  val ADDR_W = log2Ceil(NUM_REG) // 地址宽度 = 5

//  val START_ADDR = "h80000000".U

  val START_ADDR = "h40000000".U


  // TODO: 改成64位了
  val BUBBLE = 0x4033.U(64.W)
}


// This is copied from NutShellChipLink
object AXIConstants {

  val A_ID_W    = 4
  val A_ADDR_W  = 32
  val A_DATA_W  = 64
  val A_STRB_W  = A_DATA_W/8
  val A_SIZE_W  = 3
  val A_BURST_W = 2
  val A_LEN_W   = 8
  val A_RESP_W  = 2
  val A_QOS_W   = 4
  val A_CACHE_W = 4
  val A_LOCK_W  = 1
  val A_PROT_W  = 3
  val A_USER_W  = 1
  val A_LAST_W  = 1

  val AXI_ID = 0
  val AXI_LEN_1 = 0
  val AXI_SIZE_64bit = 3
  val AXI_BURST_FIXED = 0
  val AXI_LOCK_NORMAL = 0
  val AXI_CACHE_DeviceNonBuffer = 0  //TODO: check
  val AXI_PROT = 1  //TODO: check
  val AXI_QOS_NON = 0
  val AXI_USER = 0
}

trait PCConstants {
  val PCSel_w = 2
  val PC_4 = 0.asUInt(PCSel_w.W) // PC + 4
  val PC_BRJMP = 1.asUInt(PCSel_w.W) // brjmp_target
  val PC_JALR = 2.asUInt(PCSel_w.W) // jump_reg_target
  val PC_EXC = 3.asUInt(PCSel_w.W) // exception
}

trait instConstants {
  val RS2_MSB = 24
  val RS2_LSB = 20
  val RS1_MSB = 19
  val RS1_LSB = 15
  val RD_MSB = 11
  val RD_LSB = 7

}

trait brTypeConstants {
  val brType_w = 4
  val BR_N = 0.asUInt(brType_w.W) // Next
  val BR_NE = 1.asUInt(brType_w.W) // Branch on NotEqual
  val BR_EQ = 2.asUInt(brType_w.W) // Branch on Equal
  val BR_GE = 3.asUInt(brType_w.W) // Branch on Greater/Equal
  val BR_GEU = 4.asUInt(brType_w.W) // Branch on Greater/Equal Unsigned
  val BR_LT = 5.asUInt(brType_w.W) // Branch on Less Than
  val BR_LTU = 6.asUInt(brType_w.W) // Branch on Less Than Unsigned
  val BR_J = 7.asUInt(brType_w.W) // Jump
  val BR_JR = 8.asUInt(brType_w.W) // Jump Register

}

trait opSelConstants {
  val op1Sel_w = 2
  val OP1_RS1 = 0.asUInt(op1Sel_w.W) // Register Source #1
  val OP1_RS1W = 1.asUInt(op1Sel_w.W) // Register Source #1 cut for 32 bit
  val OP1_PC = 2.asUInt(op1Sel_w.W) // PC
  val OP1_IMZ = 3.asUInt(op1Sel_w.W) // Zero-extended Immediate from RS1 field, for use by CSRI instructions
  val OP1_X = 0.asUInt(op1Sel_w.W)

  val op2Sel_w = 3
  val OP2_RS2 = 0.asUInt(op2Sel_w.W) // Register Source #2
  val OP2_RS2W = 1.asUInt(op2Sel_w.W) // Register Source #2 cut for 32 bit
  val OP2_ITYPE = 2.asUInt(op2Sel_w.W) // immediate, I-type
  val OP2_STYPE = 3.asUInt(op2Sel_w.W) // immediate, S-type
  val OP2_SBTYPE = 4.asUInt(op2Sel_w.W) // immediate, B
  val OP2_UTYPE = 5.asUInt(op2Sel_w.W) // immediate, U-type
  val OP2_UJTYPE = 6.asUInt(op2Sel_w.W) // immediate, J-type
  val OP2_X = 0.asUInt(op2Sel_w.W)
}

trait regfileConstants {
  // Register Operand Output Enable Signal
  val OEN_0 = false.B
  val OEN_1 = true.B

  // Register File Write Enable Signal reg可以些
  val REN_0 = false.B
  val REN_1 = true.B

  // Writeback Select Signal
  val wbSel_w = 3
  val WB_ALU = 0.asUInt(wbSel_w.W)
  val WB_ALUW = 1.asUInt(wbSel_w.W)
  val WB_MEM = 2.asUInt(wbSel_w.W)
  val WB_PC4 = 3.asUInt(wbSel_w.W)
  val WB_CSR = 4.asUInt(wbSel_w.W)
  val WB_X = 0.asUInt(wbSel_w.W)
}

trait aluFuncConstants {
  val aluFunc_w = 5
  val ALU_ADD = 0.asUInt(aluFunc_w.W)
  val ALU_SUB = 1.asUInt(aluFunc_w.W)
  val ALU_SLL = 2.asUInt(aluFunc_w.W)
  val ALU_SRL = 3.asUInt(aluFunc_w.W)
  val ALU_SRA = 4.asUInt(aluFunc_w.W)
  val ALU_SRAW = 5.asUInt(aluFunc_w.W)
  val ALU_AND = 6.asUInt(aluFunc_w.W)
  val ALU_OR = 7.asUInt(aluFunc_w.W)
  val ALU_XOR = 8.asUInt(aluFunc_w.W)
  val ALU_SLT = 9.asUInt(aluFunc_w.W)
  val ALU_SLTU = 10.asUInt(aluFunc_w.W)
  val ALU_COPY_1 = 11.asUInt(aluFunc_w.W)
  val ALU_COPY_2 = 12.asUInt(aluFunc_w.W)
  // M
  val ALU_MUL    = 18.asUInt(aluFunc_w.W)
  val ALU_MULH   = 19.asUInt(aluFunc_w.W)
  val ALU_MULHSU = 20.asUInt(aluFunc_w.W)
  val ALU_MULHU  = 21.asUInt(aluFunc_w.W)
  val ALU_DIV    = 22.asUInt(aluFunc_w.W)
  val ALU_DIVU   = 23.asUInt(aluFunc_w.W)
  val ALU_REM    = 24.asUInt(aluFunc_w.W)
  val ALU_REMU   = 25.asUInt(aluFunc_w.W)
  val ALU_MULW   = 26.asUInt(aluFunc_w.W)
  val ALU_DIVW   = 27.asUInt(aluFunc_w.W)
  val ALU_DIVUW  = 28.asUInt(aluFunc_w.W)
  val ALU_REMW   = 29.asUInt(aluFunc_w.W)
  val ALU_REMUW  = 30.asUInt(aluFunc_w.W)

  val ALU_X = 0.asUInt(aluFunc_w.W)
}

trait memTypeConstants {
  // Memory Read Signal
  val MRD_0 = false.B
  val MRD_1 = true.B
  val MRD_X = false.B

  // Memory Write Signal
  val MWR_0 = false.B
  val MWR_1 = true.B
  val MWR_X = false.B

  // Memory Mask Type Signal
  val memMask_w = 8
  val MSK_B = Integer.parseInt("1", 2).asUInt(memMask_w.W)
  val MSK_H = Integer.parseInt("11", 2).asUInt(memMask_w.W)
  val MSK_W = Integer.parseInt("1111", 2).asUInt(memMask_w.W)
  val MSK_D = Integer.parseInt("11111111", 2).asUInt(memMask_w.W)
  val MSK_X = Integer.parseInt("11111111", 2).asUInt(memMask_w.W) //TODO: How to be compatibale with 32bit machine?

  val memExt_w = 3
  val EXT_BS = 0.asUInt(memExt_w.W)
  val EXT_BU = 1.asUInt(memExt_w.W)
  val EXT_HS = 2.asUInt(memExt_w.W)
  val EXT_HU = 3.asUInt(memExt_w.W)
  val EXT_WS = 4.asUInt(memExt_w.W)
  val EXT_WU = 5.asUInt(memExt_w.W)
  val EXT_D = 6.asUInt(memExt_w.W)
  val EXT_X = 0.asUInt(memExt_w.W)
}



trait CSRConstants {
  val MSTATUS = 0x300.U
  val MISA = 0x301.U
  val MIE = 0x304.U
  val MTVEC = 0x305.U
  val MSCRATCH = 0x340.U
  val MEPC = 0x341.U
  val MCAUSE = 0x342.U
  val MTVAL = 0x343.U
  val MIP = 0x344.U
  val MVENDORID = 0xf11.U
  val MARCHID = 0xf12.U
  val MIMPID = 0xf13.U
  val MHARTID = 0xf14.U

  // custom encoding
  val MTIMELO = 0x7c0.U
  val MTIMEHI = 0x7c1.U
  val MTIMECMPLO = 0x7c2.U
  val MTIMECMPHI = 0x7c3.U
}