package common

import chisel3._
import constans._

class RamIO extends Bundle {
  val req     = Output(Bool())
  val wr      = Output(Bool())
  val size    = Output(UInt(2.W))
  val addr    = Output(UInt(XLEN.W))
  val wdata   = Output(UInt(XLEN.W))

  val rdata   = Input(UInt(XLEN.W))
  val addr_ok = Input(Bool())
  val data_ok = Input(Bool())
}

