package print

import chisel3._
import sim.elaborate.args

class print_try extends Module{
  val io = IO(new Bundle() {
    val in = Input(UInt(1.W))
  })
  io := DontCare

  val my = 33.U
  printf(p"my = $my")
}


object elaborate extends App {
  (new stage.ChiselStage).execute(args, Seq(stage.ChiselGeneratorAnnotation(() => new print_try)))
}