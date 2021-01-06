package nutcore

import chisel3._
import common.{DataReadIO, DataWriteIO, InstReadIO}
import common.constans._

import nutcore.fetch.Fetch
import nutcore.decode.Decode
import nutcore.exe.Execute
import nutcore.mem.MemLoad
import nutcore.write.Write

class DatToCtlIo extends Bundle() {
  val dec_inst = Output(UInt(XLEN.W))
  val dec_br_eq = Output(Bool())
  val dec_br_lt = Output(Bool())
  val dec_br_ltu = Output(Bool())
}

class DpathIo extends Bundle() {
  val dat = new DatToCtlIo()
  val instReadIO = new InstReadIO()
  val dataReadIO = new DataReadIO()
  val dataWriteIO = new DataWriteIO()
}

class dpath extends Module {
  val io = IO(new DpathIo())
  io := DontCare

  val cpath   = Module(new cpath)

  // 5级流水
  val fetch   = Module(new Fetch)
  val decode  = Module(new Decode)
  val execute = Module(new Execute)
  val mem     = Module(new MemLoad)
  val write   = Module(new Write)

  fetch.io.ds_allowin   := decode.io.ds_allowin
  decode.io.es_allowin  := execute.io.es_allowin
  execute.io.ms_allowin := mem.io.ms_allowin
  mem.io.ws_allowin     := write.io.ws_allowin

  // 后传
  fetch.io.fs_to_ds   <> decode.io.fs_to_ds
  decode.io.ds_to_es  <> execute.io.ds_to_es
  execute.io.es_to_ms <> mem.io.es_to_ms
  mem.io.ms_to_ws     <> write.io.ms_to_ws

  // 前递
  decode.io.ds_to_fs  <> fetch.io.ds_to_fs

  // 数据前递到ds
  decode.io.es_to_ds  <> execute.io.es_to_ds
  decode.io.ms_to_ds  <> mem.io.ms_to_ds
  decode.io.ws_to_ds  <> write.io.ws_to_ds

  // ram
  io.instReadIO       <> fetch.io.instReadIO
  io.dataReadIO       <> execute.io.dataReadIO
  io.dataWriteIO      <> execute.io.dataWriteIO

  decode.io.pc_sel    := cpath.io.ctl.dec_pc_sel
  decode.io.op1_sel   := cpath.io.ctl.op1_sel
  decode.io.op2_sel   := cpath.io.ctl.op2_sel
  decode.io.dat       <> cpath.io.dat
  execute.io.ctl      <> cpath.io.ctl

}
