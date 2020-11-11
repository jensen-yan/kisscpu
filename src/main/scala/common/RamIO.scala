package common

import chisel3._
import constans._

class RamIO extends Bundle {
  val req     = Output(Bool())
  val wr      = Output(Bool())
  val size    = Output(UInt(3.W))
  val addr    = Output(UInt(XLEN.W))
  val wdata   = Output(UInt(XLEN.W))

  val rdata   = Input(UInt(XLEN.W))
  val addr_ok = Input(Bool())
  val data_ok = Input(Bool())

  override def toPrintable: Printable = {
    p"RamIO:" +
      p"  req  : ${req}" +
      p"  wr   : ${wr}" +
      p"  size : ${size}" +
      p"  addr   : 0x${Hexadecimal(addr)}" +
      p"  wdata  : 0x${Hexadecimal(wdata)}" +
      p"  rdata  : 0x${Hexadecimal(rdata)}" +
      p"  addr_ok: ${addr_ok}" +
      p"  data_ok: ${data_ok}\n"
  }

}

