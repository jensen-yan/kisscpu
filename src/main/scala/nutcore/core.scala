package nutcore

import chisel3._

class core extends Module{
  val io = IO(new Bundle{})

  val regfile = Module(new regfile())
}