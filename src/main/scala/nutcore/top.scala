package nutcore

import chisel3._
import common._

class topIO extends Bundle{
  val instReadIO  = new InstReadIO
  val dataReadIO  = new DataReadIO
  val dataWriteIO = new DataWriteIO
//  val dataRamIO   = new DataRamIO
}


class top extends Module{
  val io = IO(new topIO)
  val dpath = Module(new dpath)

  // 和外部连接
  io.instReadIO <> dpath.io.instReadIO
  io.dataReadIO <> dpath.io.dataReadIO
  io.dataWriteIO <> dpath.io.dataWriteIO

}