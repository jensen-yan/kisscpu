package common

import chisel3._
import constans._

class DataWriteIO extends Bundle {
  val addr = Output(UInt(XLEN.W))
  val data = Output(UInt(XLEN.W))
  val en   = Output(Bool())
  val mask = Output(UInt((XLEN/8).W))
}
