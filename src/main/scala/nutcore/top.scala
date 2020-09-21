package nutcore

import chisel3._
import common._

class topIO extends Bundle{
  val instReadIO = new InstReadIO
  val dataReadIO = new DataReadIO
  val dataWriteIO = new DataWriteIO
}


class top extends Module{
  val io = IO(new topIO)
  val cpath = Module(new cpath)
  val dpath = Module(new dpath)

  // 和外部连接
  io.instReadIO <> dpath.io.instReadIO
  io.dataReadIO <> dpath.io.dataReadIO
  io.dataWriteIO <> dpath.io.dataWriteIO

  // 两个模块连接
  cpath.io.ctl <> dpath.io.ctl
  cpath.io.dat <> dpath.io.dat

}