package sim

import AXI.{AXI_Bridge, AXI_ram}
import chisel3._
import chisel3.util._
import chisel3.util.experimental.BoringUtils
import nutcore._
import common.constans._

class simSoc extends Module{
  val io = IO(new Bundle() {
    val diffTestIO = new diffTestIO
  })
  io  := DontCare

  val cpath = Module(new cpath)
  val dpath = Module(new dpath)

  cpath.io.ctl <> dpath.io.ctl
  cpath.io.dat <> dpath.io.dat

  // 向verilator发送的调试信息
  BoringUtils.addSink(io.diffTestIO.regfile, "diffTestRegfile")
  BoringUtils.addSink(io.diffTestIO.PC, "diffTestPC")
  BoringUtils.addSink(io.diffTestIO.PC_valid, "diffTestPC_valid")
  BoringUtils.addSink(io.diffTestIO.nemu_halt, "diffTestHalt")

  // 把inst和axi桥连接
  val bridge = Module(new AXI_Bridge(64))
  bridge.io.clock       := clock
  bridge.io.reset       := reset

  bridge.io.inst_req    := dpath.io.InstRamIO.req
  bridge.io.inst_wr     := dpath.io.InstRamIO.wr
  bridge.io.inst_size   := dpath.io.InstRamIO.size
  bridge.io.inst_addr   := dpath.io.InstRamIO.addr
  bridge.io.inst_wdata  := dpath.io.InstRamIO.wdata

  dpath.io.InstRamIO.rdata  := bridge.io.inst_rdata
  dpath.io.InstRamIO.addr_ok:= bridge.io.inst_addr_ok
  dpath.io.InstRamIO.data_ok:= bridge.io.inst_data_ok
  if(DEBUG_PRINT){
    printf(p"Inst ${dpath.io.InstRamIO}")
  }

  // axi桥 和 axi_mem 连接
  val ram = Module(new AXI_ram())
  ram.io.clock    := clock
  ram.io.reset    := reset

  ram.io.awid    := bridge.io.awid
  ram.io.awaddr  := bridge.io.awaddr
  ram.io.awlen   := bridge.io.awlen
  ram.io.awsize  := bridge.io.awsize
  ram.io.awburst := bridge.io.awburst
  ram.io.awlock  := bridge.io.awlock
  ram.io.awcache := bridge.io.awcache
  ram.io.awprot  := bridge.io.awprot
  ram.io.awvalid := bridge.io.awvalid
  bridge.io.awready := ram.io.awready
  ram.io.wdata   := bridge.io.wdata
  ram.io.wstrb   := bridge.io.wstrb
  ram.io.wlast   := bridge.io.wlast
  ram.io.wvalid  := bridge.io.wvalid
  bridge.io.wready  := ram.io.wready
  bridge.io.bid     := ram.io.bid
  bridge.io.bresp   := ram.io.bresp
  bridge.io.bvalid  := ram.io.bvalid
  ram.io.bready  := bridge.io.bready
  ram.io.arid    := bridge.io.arid
  ram.io.araddr  := bridge.io.araddr
  ram.io.arlen   := bridge.io.arlen
  ram.io.arsize  := bridge.io.arsize
  ram.io.arburst := bridge.io.arburst
  ram.io.arlock  := bridge.io.arlock
  ram.io.arcache := bridge.io.arcache
  ram.io.arprot  := bridge.io.arprot
  ram.io.arvalid := bridge.io.arvalid
  bridge.io.arready := ram.io.arready
  bridge.io.rid     := ram.io.rid
  bridge.io.rdata   := ram.io.rdata
  bridge.io.rresp   := ram.io.rresp
  bridge.io.rlast   := ram.io.rlast
  bridge.io.rvalid  := ram.io.rvalid
  ram.io.rready  := bridge.io.rready

  printf(
    p"AXI_IO:" +
      p"  arvalid: ${bridge.io.arvalid}" +
      p"  arready: ${bridge.io.arready}" +
      p"  rvalid:  ${bridge.io.rvalid}" +
      p"  rready:  ${bridge.io.rready}" +
      p"  araddr: 0x${Hexadecimal(bridge.io.araddr)}" +
      p"  rdata : 0x${Hexadecimal(bridge.io.rdata)}\n"
  )
}

object elaborate_simCore extends App{
  (new stage.ChiselStage).execute(args, Seq(stage.ChiselGeneratorAnnotation(() => new simSoc)))
}
