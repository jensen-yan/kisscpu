package nutcore

import chisel3._

/*
class coreIO extends Module{
  val imem =

}

 */

class core extends Module{
  val io = IO(new Bundle{})

  val regfile = Module(new regfile())
}