package test

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.util.experimental.BoringUtils
//import sim.elaborate.args
//import sim.simTop


class Constant extends Module {
  val io = IO(new Bundle{})
  val x = Wire(UInt(6.W))
  x := 42.U
  BoringUtils.addSource(x, "uniqueId")
}
class Expect extends Module {
  val io = IO(new Bundle{})
  val y = Wire(UInt(6.W))
  y := 0.U
  // This assertion will fail unless we bore!
  chisel3.assert(y === 43.U, "y should be 42 in module Expect")
  BoringUtils.addSink(y, "uniqueId")
}
class Top extends Module {
  val io = IO(new Bundle{})
  val constant = Module(new Constant)
  val expect = Module(new Expect)
}

object Run extends App {
  (new ChiselStage).execute(
    args,
    Seq(ChiselGeneratorAnnotation(() => new Top ))
  )
}