package sim

import chisel3._
import chisel3.util._
import chisel3.util.experimental.BoringUtils
import nutcore._

class simTop extends Module{
  val io = IO(new Bundle{
    val diffTestIO = new diffTestIO
    val topIO = new topIO
  })
  io := DontCare    // 不会被使用

  val mycoretop = Module(new top())
//  chisel3.assert(io.diffTestIO.regfile(5) === 12.U, "试试")
  BoringUtils.addSink(io.diffTestIO.regfile, "diffTestRegfile")
  BoringUtils.addSink(io.diffTestIO.PC, "diffTestPC")
  // printf("rf5 = %d", io.diffTestIO.regfile(5))
  io.topIO <> mycoretop.io

}

object elaborate extends App {
  (new stage.ChiselStage).execute(args, Seq(stage.ChiselGeneratorAnnotation(() => new simTop)))
}