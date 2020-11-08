package nutcore

import chisel3._
import common._
import common.constans._
import AXI._

class topIO extends Bundle{
//  val instReadIO  = new InstReadIO
//  val dataReadIO  = new DataReadIO
//  val dataWriteIO = new DataWriteIO

  val AXI_IO = Flipped(new AXI_interface)
}


class CPU_Core extends Module{
  val io = IO(new topIO)
  val cpath = Module(new cpath)
  val dpath = Module(new dpath)

  // 和外部连接
//  io.instReadIO <> dpath.io.instReadIO
//  io.dataReadIO <> dpath.io.dataReadIO
//  io.dataWriteIO <> dpath.io.dataWriteIO

  // cpath, dpath两个模块连接
  cpath.io.ctl <> dpath.io.ctl
  cpath.io.dat <> dpath.io.dat



  // 转接桥和dpath内部连接
  val CPU_Bridge = Module(new AXI_Bridge )

  CPU_Bridge.io.clock := clock
  CPU_Bridge.io.reset := reset

  CPU_Bridge.io.InstRamIO <> dpath.io.InstRamIO
  CPU_Bridge.io.DataRamIO <> dpath.io.DataRamIO

  // AXI 和转接桥连接
  io.AXI_IO <> CPU_Bridge.io.AXI_IO

}

object CPU_Core extends App {
  chisel3.Driver.execute(args, () => new CPU_Core)
}