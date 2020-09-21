package common

import chisel3._
import constans._

class DataReadIO extends Bundle {
  val addr = Output(UInt(XLEN.W))
  val data = Input(UInt(XLEN.W))
  val en   = Output(Bool())
}
