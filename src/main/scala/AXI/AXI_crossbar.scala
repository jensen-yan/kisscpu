package AXI

import chisel3._
import chisel3.util._

class Crossbar_interface extends Bundle {
    private val S_COUNT = 3
    private val M_COUNT = 2
    private val S_ID_WIDTH = 8
    private val M_ID_WIDTH = S_ID_WIDTH + 2 // actually log2(S_COUNT)
    private val ADDR_WIDTH = 64
    private val AWUSER_WIDTH = 1
    private val DATA_WIDTH = 64
    private val STRB_WIDTH = (DATA_WIDTH/8)
    private val WUSER_WIDTH = 1
    private val BUSER_WIDTH = 1
    private val ARUSER_WIDTH = 1
    private val RUSER_WIDTH = 1
    
    // slave -> to CPU Core
    val s_axi_awid = Input(UInt((S_COUNT * S_ID_WIDTH).W))
    val s_axi_awaddr = Input(UInt((S_COUNT * ADDR_WIDTH).W))
    val s_axi_awlen = Input(UInt((S_COUNT * 8).W))
    val s_axi_awsize = Input(UInt((S_COUNT * 3).W))
    val s_axi_awburst = Input(UInt((S_COUNT * 2).W))
    val s_axi_awlock = Input(UInt(S_COUNT.W))
    val s_axi_awcache = Input(UInt((S_COUNT * 4).W))
    val s_axi_awprot = Input(UInt((S_COUNT * 3).W))
    val s_axi_awqos = Input(UInt((S_COUNT * 4).W))
    val s_axi_awuser = Input(UInt((S_COUNT * AWUSER_WIDTH).W))
    val s_axi_awvalid = Input(UInt((S_COUNT).W))
    val s_axi_awready = Output(UInt((S_COUNT).W))
    val s_axi_wdata = Input(UInt((S_COUNT * DATA_WIDTH).W))
    val s_axi_wstrb = Input(UInt((S_COUNT * STRB_WIDTH).W))
    val s_axi_wlast = Input(UInt((S_COUNT).W))
    val s_axi_wuser = Input(UInt((S_COUNT * WUSER_WIDTH).W))
    val s_axi_wvalid = Input(UInt((S_COUNT).W))
    val s_axi_wready = Output(UInt((S_COUNT).W))
    val s_axi_bid = Output(UInt((S_COUNT * S_ID_WIDTH).W))
    val s_axi_bresp = Output(UInt((S_COUNT * 2).W))
    val s_axi_buser = Output(UInt((S_COUNT * BUSER_WIDTH).W))
    val s_axi_bvalid = Output(UInt((S_COUNT).W))
    val s_axi_bready = Input(UInt((S_COUNT).W))
    val s_axi_arid = Input(UInt((S_COUNT * S_ID_WIDTH).W))
    val s_axi_araddr = Input(UInt((S_COUNT * ADDR_WIDTH).W))
    val s_axi_arlen = Input(UInt((S_COUNT * 8).W))
    val s_axi_arsize = Input(UInt((S_COUNT * 3).W))
    val s_axi_arburst = Input(UInt((S_COUNT * 2).W))
    val s_axi_arlock = Input(UInt((S_COUNT).W))
    val s_axi_arcache = Input(UInt((S_COUNT * 4).W))
    val s_axi_arprot = Input(UInt((S_COUNT * 3).W))
    val s_axi_arqos = Input(UInt((S_COUNT * 4).W))
    val s_axi_aruser = Input(UInt((S_COUNT * ARUSER_WIDTH).W))
    val s_axi_arvalid = Input(UInt((S_COUNT).W))
    val s_axi_arready = Output(UInt((S_COUNT).W))
    val s_axi_rid = Output(UInt((S_COUNT * S_ID_WIDTH).W))
    val s_axi_rdata = Output(UInt((S_COUNT * DATA_WIDTH).W))
    val s_axi_rresp = Output(UInt((S_COUNT * 2).W))
    val s_axi_rlast = Output(UInt((S_COUNT).W))
    val s_axi_ruser = Output(UInt((S_COUNT * RUSER_WIDTH).W))
    val s_axi_rvalid = Output(UInt((S_COUNT).W))
    val s_axi_rready = Input(UInt(S_COUNT.W))
    
    // master -> to AXI RAM and MMIO
    val m_axi_awid = Output(UInt((M_COUNT * M_ID_WIDTH).W))
    val m_axi_awaddr = Output(UInt((M_COUNT * ADDR_WIDTH).W))
    val m_axi_awlen = Output(UInt((M_COUNT * 8).W))
    val m_axi_awsize = Output(UInt((M_COUNT * 3).W))
    val m_axi_awburst = Output(UInt((M_COUNT * 2).W))
    val m_axi_awlock = Output(UInt(M_COUNT.W))
    val m_axi_awcache = Output(UInt((M_COUNT * 4).W))
    val m_axi_awprot = Output(UInt((M_COUNT * 3).W))
    val m_axi_awqos = Output(UInt((M_COUNT * 4).W))
    val m_axi_awregion = Output(UInt((M_COUNT * 4).W))
    val m_axi_awuser = Output(UInt((M_COUNT * AWUSER_WIDTH).W))
    val m_axi_awvalid = Output(UInt((M_COUNT).W))
    val m_axi_awready = Input(UInt((M_COUNT).W))
    val m_axi_wdata = Output(UInt((M_COUNT * DATA_WIDTH).W))
    val m_axi_wstrb = Output(UInt((M_COUNT * STRB_WIDTH).W))
    val m_axi_wlast = Output(UInt((M_COUNT).W))
    val m_axi_wuser = Output(UInt((M_COUNT * WUSER_WIDTH).W))
    val m_axi_wvalid = Output(UInt((M_COUNT).W))
    val m_axi_wready = Input(UInt((M_COUNT).W))
    val m_axi_bid = Input(UInt((M_COUNT * M_ID_WIDTH).W))
    val m_axi_bresp = Input(UInt((M_COUNT * 2).W))
    val m_axi_buser = Input(UInt((M_COUNT * BUSER_WIDTH).W))
    val m_axi_bvalid = Input(UInt((M_COUNT).W))
    val m_axi_bready = Output(UInt((M_COUNT).W))
    val m_axi_arid = Output(UInt((M_COUNT * M_ID_WIDTH).W))
    val m_axi_araddr = Output(UInt((M_COUNT * ADDR_WIDTH).W))
    val m_axi_arlen = Output(UInt((M_COUNT * 8).W))
    val m_axi_arsize = Output(UInt((M_COUNT * 3).W))
    val m_axi_arburst = Output(UInt((M_COUNT * 2).W))
    val m_axi_arlock = Output(UInt((M_COUNT).W))
    val m_axi_arcache = Output(UInt((M_COUNT * 4).W))
    val m_axi_arprot = Output(UInt((M_COUNT * 3).W))
    val m_axi_arqos = Output(UInt((M_COUNT * 4).W))
    val m_axi_arregion = Output(UInt((M_COUNT * 4).W))
    val m_axi_aruser = Output(UInt((M_COUNT * ARUSER_WIDTH).W))
    val m_axi_arvalid = Output(UInt((M_COUNT).W))
    val m_axi_arready = Input(UInt((M_COUNT).W))
    val m_axi_rid = Input(UInt((M_COUNT * M_ID_WIDTH).W))
    val m_axi_rdata = Input(UInt((M_COUNT * DATA_WIDTH).W))
    val m_axi_rresp = Input(UInt((M_COUNT * 2).W))
    val m_axi_rlast = Input(UInt((M_COUNT).W))
    val m_axi_ruser = Input(UInt((M_COUNT * RUSER_WIDTH).W))
    val m_axi_rvalid = Input(UInt((M_COUNT).W))
    val m_axi_rready = Output(UInt(M_COUNT.W))
    
}

class axi_crossbar extends BlackBox with HasBlackBoxResource {
    val io = IO(new Crossbar_interface {
        val clock = Input(Clock())
        val reset = Input(Reset())
    })
    setResource("/axi_crossbar.v")
}
