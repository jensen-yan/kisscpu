package common

import chisel3.util.log2Ceil

object constans extends RISCVConstants
{

}

trait RISCVConstants
{
  val XLEN    = 32
  val NUM_REG = 32
  val ADDR_W  = log2Ceil(XLEN)    // 地址宽度 = 5

}