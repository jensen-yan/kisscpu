package nutcore

import chisel3._
import common._
import common.constans._
import AXI._

class topIO extends Bundle{
//  val instReadIO  = new InstReadIO
//  val dataReadIO  = new DataReadIO
//  val dataWriteIO = new DataWriteIO

  val axi_mem = Flipped(new AXI_interface)
  val axi_mmio = Flipped(new AXI_interface)
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



  // cpu转接桥和dpath内部连接
  val CPU_Bridge = Module(new AXI_Bridge(64) )

  CPU_Bridge.io.clock := clock
  CPU_Bridge.io.reset := reset

//  CPU_Bridge.io.InstRamIO <> dpath.io.InstRamIO
//  CPU_Bridge.io.DataRamIO <> dpath.io.DataRamIO
  CPU_Bridge.io.inst_req := dpath.io.InstRamIO.req
  CPU_Bridge.io.inst_wr := 0.U
  CPU_Bridge.io.inst_size := 2.U
  CPU_Bridge.io.inst_addr := dpath.io.InstRamIO.addr
  CPU_Bridge.io.inst_wdata := 0.U
  dpath.io.InstRamIO.rdata := CPU_Bridge.io.inst_rdata
  dpath.io.InstRamIO.addr_ok := CPU_Bridge.io.inst_addr_ok
  dpath.io.InstRamIO.data_ok := CPU_Bridge.io.inst_data_ok

  CPU_Bridge.io.data_req  := dpath.io.DataRamIO.req
  CPU_Bridge.io.data_wr   := dpath.io.DataRamIO.wr
  CPU_Bridge.io.data_size := dpath.io.DataRamIO.size
  CPU_Bridge.io.data_addr := dpath.io.DataRamIO.addr
  CPU_Bridge.io.data_wdata := dpath.io.DataRamIO.wdata

  // MMIO 转接桥
  val MMIO_Bridge = Module(new AXI_Bridge(64))

  MMIO_Bridge.io.clock := clock
  MMIO_Bridge.io.reset := reset

  MMIO_Bridge.io.inst_req := 0.U // do not send any request with inst for now
  MMIO_Bridge.io.inst_wr := 0.U
  MMIO_Bridge.io.inst_size := 2.U
  MMIO_Bridge.io.inst_addr := dpath.io.InstRamIO.addr
  MMIO_Bridge.io.inst_wdata := 0.U
  //inst_data := MMIO_Bridge.io.inst_rdata
  //inst_req_ack := MMIO_Bridge.io.inst_addr_ok
  //inst_valid := MMIO_Bridge.io.inst_data_ok

  MMIO_Bridge.io.data_req  := dpath.io.DataRamIO.req
  MMIO_Bridge.io.data_wr   := dpath.io.DataRamIO.wr
  MMIO_Bridge.io.data_size := dpath.io.DataRamIO.size
  MMIO_Bridge.io.data_addr := dpath.io.DataRamIO.addr
  MMIO_Bridge.io.data_wdata := dpath.io.DataRamIO.wdata

  // MMIO 优先级更高
  when (MMIO_Bridge.io.data_data_ok === 1.U) {
    dpath.io.DataRamIO.rdata := MMIO_Bridge.io.data_rdata
  } .otherwise {
    dpath.io.DataRamIO.rdata := CPU_Bridge.io.data_rdata
  }

  dpath.io.DataRamIO.addr_ok := MMIO_Bridge.io.data_addr_ok | CPU_Bridge.io.data_addr_ok
  dpath.io.DataRamIO.data_ok := MMIO_Bridge.io.data_data_ok | CPU_Bridge.io.data_data_ok

  // AXI 和转接桥连接
  io.axi_mem.awid := CPU_Bridge.io.awid
  io.axi_mem.awaddr := CPU_Bridge.io.awaddr
  io.axi_mem.awlen := CPU_Bridge.io.awlen
  io.axi_mem.awsize := CPU_Bridge.io.awsize
  io.axi_mem.awburst := CPU_Bridge.io.awburst
  io.axi_mem.awlock := CPU_Bridge.io.awlock
  io.axi_mem.awcache := CPU_Bridge.io.awcache
  io.axi_mem.awprot := CPU_Bridge.io.awprot
  io.axi_mem.awvalid := CPU_Bridge.io.awvalid
  CPU_Bridge.io.awready := io.axi_mem.awready
  io.axi_mem.wdata := CPU_Bridge.io.wdata
  io.axi_mem.wstrb := CPU_Bridge.io.wstrb
  io.axi_mem.wlast := CPU_Bridge.io.wlast
  io.axi_mem.wvalid := CPU_Bridge.io.wvalid
  CPU_Bridge.io.wready := io.axi_mem.wready
  CPU_Bridge.io.bid := io.axi_mem.bid
  CPU_Bridge.io.bresp := io.axi_mem.bresp
  CPU_Bridge.io.bvalid := io.axi_mem.bvalid
  io.axi_mem.bready := CPU_Bridge.io.bready
  io.axi_mem.arid := CPU_Bridge.io.arid
  io.axi_mem.araddr := CPU_Bridge.io.araddr
  io.axi_mem.arlen := CPU_Bridge.io.arlen
  io.axi_mem.arsize := CPU_Bridge.io.arsize
  io.axi_mem.arburst := CPU_Bridge.io.arburst
  io.axi_mem.arlock := CPU_Bridge.io.arlock
  io.axi_mem.arcache := CPU_Bridge.io.arcache
  io.axi_mem.arprot := CPU_Bridge.io.arcache
  io.axi_mem.arvalid := CPU_Bridge.io.arvalid
  CPU_Bridge.io.arready := io.axi_mem.arready
  CPU_Bridge.io.rid := io.axi_mem.rid
  CPU_Bridge.io.rdata := io.axi_mem.rdata
  CPU_Bridge.io.rresp := io.axi_mem.rresp
  CPU_Bridge.io.rlast := io.axi_mem.rlast
  CPU_Bridge.io.rvalid := io.axi_mem.rvalid
  io.axi_mem.rready := CPU_Bridge.io.rready

  io.axi_mmio.awid := MMIO_Bridge.io.awid
  io.axi_mmio.awaddr := MMIO_Bridge.io.awaddr
  io.axi_mmio.awlen := MMIO_Bridge.io.awlen
  io.axi_mmio.awsize := MMIO_Bridge.io.awsize
  io.axi_mmio.awburst := MMIO_Bridge.io.awburst
  io.axi_mmio.awlock := MMIO_Bridge.io.awlock
  io.axi_mmio.awcache := MMIO_Bridge.io.awcache
  io.axi_mmio.awprot := MMIO_Bridge.io.awprot
  io.axi_mmio.awvalid := MMIO_Bridge.io.awvalid
  MMIO_Bridge.io.awready := io.axi_mmio.awready
  io.axi_mmio.wdata := MMIO_Bridge.io.wdata
  io.axi_mmio.wstrb := MMIO_Bridge.io.wstrb
  io.axi_mmio.wlast := MMIO_Bridge.io.wlast
  io.axi_mmio.wvalid := MMIO_Bridge.io.wvalid
  MMIO_Bridge.io.wready := io.axi_mmio.wready
  MMIO_Bridge.io.bid := io.axi_mmio.bid
  MMIO_Bridge.io.bresp := io.axi_mmio.bresp
  MMIO_Bridge.io.bvalid := io.axi_mmio.bvalid
  io.axi_mmio.bready := MMIO_Bridge.io.bready
  io.axi_mmio.arid := MMIO_Bridge.io.arid
  io.axi_mmio.araddr := MMIO_Bridge.io.araddr
  io.axi_mmio.arlen := MMIO_Bridge.io.arlen
  io.axi_mmio.arsize := MMIO_Bridge.io.arsize
  io.axi_mmio.arburst := MMIO_Bridge.io.arburst
  io.axi_mmio.arlock := MMIO_Bridge.io.arlock
  io.axi_mmio.arcache := MMIO_Bridge.io.arcache
  io.axi_mmio.arprot := MMIO_Bridge.io.arcache
  io.axi_mmio.arvalid := MMIO_Bridge.io.arvalid
  MMIO_Bridge.io.arready := io.axi_mmio.arready
  MMIO_Bridge.io.rid := io.axi_mmio.rid
  MMIO_Bridge.io.rdata := io.axi_mmio.rdata
  MMIO_Bridge.io.rresp := io.axi_mmio.rresp
  MMIO_Bridge.io.rlast := io.axi_mmio.rlast
  MMIO_Bridge.io.rvalid := io.axi_mmio.rvalid
  io.axi_mmio.rready := MMIO_Bridge.io.rready

}

object CPU_Core extends App {
  (new stage.ChiselStage).execute(args, Seq(stage.ChiselGeneratorAnnotation(() => new CPU_Core)))
}