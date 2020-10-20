package common

import chisel3._
import constans._

class DataRamIO extends Bundle {
  val valid = Output(Bool())
  val addr  = Output(UInt(XLEN.W))
  val typ   = Output(Bool())
  val mask  = Output(UInt((XLEN/8).W))
  val wdata = Output(UInt(XLEN.W))
  val rdata = Input( UInt(XLEN.W))
}

