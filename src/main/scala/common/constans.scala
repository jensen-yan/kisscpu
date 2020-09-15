package common

import chisel3._
import chisel3.util.log2Ceil

object constans extends RISCVConstants
{

}

trait RISCVConstants
{
  val XLEN    = 32
  val NUM_REG = 32
  val ADDR_W  = log2Ceil(XLEN)    // 地址宽度 = 5

  // alu op, 共计12 + 1 个
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
}