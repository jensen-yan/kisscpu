package sim

import chisel3._
import chisel3.util._
import chisel3.util.experimental.BoringUtils
import nutcore._

class simTop extends Module{
  val io = IO(new Bundle{
    val diffTestIO = new diffTestIO
  })
  io := DontCare    // 不会被使用

  val mycore = Module(new core())
//  chisel3.assert(io.diffTestIO.regfile(5) === 12.U, "试试")
  BoringUtils.addSink(io.diffTestIO.regfile, "diffTestRegFile")
  // printf("rf5 = %d", io.diffTestIO.regfile(5))
}

object elaborate extends App {
  (new stage.ChiselStage).execute(args, Seq(stage.ChiselGeneratorAnnotation(() => new simTop)))
}