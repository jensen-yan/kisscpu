package sim

import chisel3._
import chisel3.util._

import common.constans._

class diffTestIO extends Bundle{
  val regfile = Output(Vec(NUM_REG, UInt(XLEN.W)))
  val PC      = Output(UInt(XLEN.W))
  val PC_valid = Output(Bool())
  val nemu_halt= Output(Bool())
}