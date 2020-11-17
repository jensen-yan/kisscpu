package sim

import AXI.{AXI_Bridge, AXI_interface, AXI_lite_interface, AXI_ram}
import chisel3._
import chisel3.util._
import chisel3.util.experimental.BoringUtils
import nutcore._
import common.constans._

class ysyx_yanyue extends Module{
  val io = IO(new Bundle() {
    val mem       = Flipped(new AXI_interface)
    val mmio      = Flipped(new AXI_lite_interface)
    val mtip      = Input(Bool())
    val meip      = Input(Bool())
  })
  io  := DontCare

  val cpath = Module(new cpath)
  val dpath = Module(new dpath)

  cpath.io.ctl <> dpath.io.ctl
  cpath.io.dat <> dpath.io.dat
  dpath.io.mtip   := io.mtip
  dpath.io.meip   := io.meip

  // 把inst和axi桥连接
  val bridge = Module(new AXI_Bridge(64))
  bridge.io.clock       := clock
  bridge.io.reset       := reset
  // inst 接口
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
  // data 接口
  bridge.io.data_req    := dpath.io.DataRamIO.req
  bridge.io.data_wr     := dpath.io.DataRamIO.wr
  bridge.io.data_size   := dpath.io.DataRamIO.size
  bridge.io.data_addr   := dpath.io.DataRamIO.addr
  bridge.io.data_wdata  := dpath.io.DataRamIO.wdata

  dpath.io.DataRamIO.rdata  := bridge.io.data_rdata
  dpath.io.DataRamIO.addr_ok:= bridge.io.data_addr_ok
  dpath.io.DataRamIO.data_ok:= bridge.io.data_data_ok
  if(DEBUG_PRINT){
    printf(p"Data ${dpath.io.DataRamIO}")
  }


  // axi桥 和 io_mem, io_mmio 连接
  val is_mem_raddr  = bridge.io.araddr >= "h8000_0000".U    // 根据地址来区分mmio, mem
  val is_mem_waddr  = bridge.io.awaddr >= "h8000_0000".U

//  val mem = Module(new AXI_ram())
//  mem.io.clock    := clock
//  mem.io.reset    := reset

  //aw
  io.mem.awid    := bridge.io.awid
  io.mem.awaddr  := bridge.io.awaddr
  io.mem.awlen   := bridge.io.awlen
  io.mem.awsize  := bridge.io.awsize
  io.mem.awburst := bridge.io.awburst
  io.mem.awlock  := bridge.io.awlock
  io.mem.awcache := bridge.io.awcache
  io.mem.awprot  := bridge.io.awprot
  io.mem.awqos   := bridge.io.awqos
  io.mem.awuser  := bridge.io.awuser
  io.mem.awvalid := Mux(is_mem_waddr,  bridge.io.awvalid, false.B)

  io.mmio.awaddr := bridge.io.awaddr
  io.mmio.awprot := bridge.io.awprot
  io.mmio.awvalid:= Mux(!is_mem_waddr, bridge.io.awvalid, false.B)

  bridge.io.awready := io.mem.awready | io.mmio.awready

  //w
  io.mem.wdata   := bridge.io.wdata
  io.mem.wstrb   := bridge.io.wstrb
  io.mem.wlast   := bridge.io.wlast
  io.mem.wvalid  := Mux(is_mem_waddr,  bridge.io.wvalid, false.B)

  io.mmio.wdata  := bridge.io.wdata
  io.mmio.wstrb  := bridge.io.wstrb
  io.mmio.wvalid := Mux(!is_mem_waddr, bridge.io.wvalid, false.B)

  bridge.io.wready  := io.mem.wready | io.mmio.wready

  //b
  io.mem.bready  := bridge.io.bready

  io.mmio.bready := bridge.io.bready

  bridge.io.bid     := io.mem.bid
  bridge.io.bresp   := io.mem.bresp   | io.mmio.bresp
  bridge.io.bvalid  := io.mem.bvalid  | io.mmio.bvalid
  bridge.io.buser   := io.mem.buser

  // ar
  io.mem.arid    := bridge.io.arid
  io.mem.araddr  := bridge.io.araddr
  io.mem.arlen   := bridge.io.arlen
  io.mem.arsize  := bridge.io.arsize
  io.mem.arburst := bridge.io.arburst
  io.mem.arlock  := bridge.io.arlock
  io.mem.arcache := bridge.io.arcache
  io.mem.arprot  := bridge.io.arprot
  io.mem.arqos   := bridge.io.arqos
  io.mem.aruser  := bridge.io.aruser
  io.mem.arvalid := Mux(is_mem_raddr,  bridge.io.arvalid, false.B)

  io.mmio.araddr := bridge.io.araddr
  io.mmio.arprot := bridge.io.arprot
  io.mmio.arvalid:= Mux(!is_mem_raddr, bridge.io.arvalid, false.B)

  bridge.io.arready := io.mem.arready | io.mmio.arready

  // r
  io.mem.rready  := bridge.io.rready

  io.mmio.rready := bridge.io.rready

  bridge.io.rid     := io.mem.rid
  bridge.io.rdata   := Mux(is_mem_raddr, io.mem.rdata, io.mmio.rdata)
  bridge.io.rresp   := io.mem.rresp   | io.mmio.rresp
  bridge.io.rlast   := io.mem.rlast
  bridge.io.rvalid  := io.mem.rvalid  | io.mmio.rvalid
  bridge.io.ruser   := io.mem.ruser





  if(DEBUG_PRINT) {
    printf(
      p"AXI_IO:" +
        p"  arvalid: ${bridge.io.arvalid}" +
        p"  arready: ${bridge.io.arready}" +
        p"  rvalid:  ${bridge.io.rvalid}" +
        p"  rready:  ${bridge.io.rready}" +
        p"  bvalid:  ${bridge.io.bvalid}" +
        p"  bready:  ${bridge.io.bready}" +
        p"  wstrb :  ${bridge.io.wstrb}" +
        p"  araddr: 0x${Hexadecimal(bridge.io.araddr)}" +
        p"  wdata : 0x${Hexadecimal(bridge.io.wdata)}" +
        p"  rdata : 0x${Hexadecimal(bridge.io.rdata)} \n"
    )
  }
}

object elaborate_ysyx_yanyue extends App{
  (new stage.ChiselStage).execute(args, Seq(stage.ChiselGeneratorAnnotation(() => new ysyx_yanyue)))
}
