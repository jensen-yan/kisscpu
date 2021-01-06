package nutcore.mem

import chisel3._
import chisel3.util._
import common.constans._
import nutcore.{Es_to_ms, Ms_to_ds, Ms_to_ws}

class MemIO extends Bundle{
  val ws_allowin    = Input(Bool())
  val ms_allowin    = Output(Bool())

  val es_to_ms      = Flipped(new Es_to_ms)
  val ms_to_ws      = new Ms_to_ws
  // 前递到ds
  val ms_to_ds      = new Ms_to_ds
}

class MemLoad extends Module{
  val io = IO(new MemIO)

  // Memory State
  val ms_valid = RegInit(false.B)
  val mem_reg_pc = Reg(UInt(XLEN.W))
  val mem_reg_inst = Reg(UInt(XLEN.W))
  val mem_reg_alu_out = Reg(UInt(XLEN.W))
  val mem_reg_wbaddr = Reg(UInt())
  val mem_reg_op1_data = Reg(UInt(XLEN.W))
  val mem_reg_op2_data = Reg(UInt(XLEN.W))
  val mem_reg_rs2_data = Reg(UInt(XLEN.W))
  val mem_reg_ctrl_rf_wen = RegInit(false.B)
  val mem_reg_ctrl_mem_mask = RegInit(MSK_X)
  val mem_reg_ctrl_mem_ext = RegInit(EXT_X)
  val mem_reg_ctrl_wb_sel = Reg(UInt())
  val mem_reg_dram_data = RegInit(0.asUInt(XLEN.W))   // 强行缓存一拍的dram读取值

  // es_to_ms_bus
  val es_to_ms_valid  = io.es_to_ms.es_to_ms_valid

  //******************************************************************************************************
  // Memory Stage
  val ms_ready_go = true.B
  io.ms_allowin := !ms_valid || ms_ready_go && io.ws_allowin
  val ms_to_ws_valid = ms_valid && ms_ready_go
  when(io.ms_allowin) {
    ms_valid := es_to_ms_valid
  }
  when(es_to_ms_valid && io.ms_allowin) {
    mem_reg_pc            := io.es_to_ms.exe_reg_pc
    mem_reg_inst          := io.es_to_ms.exe_reg_inst
    mem_reg_alu_out       := io.es_to_ms.exe_alu_out
    mem_reg_wbaddr        := io.es_to_ms.exe_reg_wbaddr
    mem_reg_op1_data      := io.es_to_ms.exe_reg_op1_data
    mem_reg_op2_data      := io.es_to_ms.exe_reg_op2_data
    mem_reg_rs2_data      := io.es_to_ms.exe_reg_rs2_data

    mem_reg_ctrl_rf_wen   := io.es_to_ms.exe_reg_ctrl_rf_wen
    mem_reg_ctrl_mem_mask := io.es_to_ms.exe_reg_ctrl_mem_mask
    mem_reg_ctrl_mem_ext  := io.es_to_ms.exe_reg_ctrl_mem_ext
    mem_reg_ctrl_wb_sel   := io.es_to_ms.exe_reg_ctrl_wb_sel
  }

  mem_reg_dram_data := io.es_to_ms.mem_rdata

  // load的值根据指令不同, 读取的值不同
  val maskedReadData = MuxCase(mem_reg_dram_data, Array(
    (mem_reg_ctrl_mem_ext === EXT_BS) -> Cat(Fill(56, mem_reg_dram_data( 7)), mem_reg_dram_data(7,0)),
    (mem_reg_ctrl_mem_ext === EXT_BU) -> Cat(Fill(56, 0.U                  ), mem_reg_dram_data(7,0)),
    (mem_reg_ctrl_mem_ext === EXT_HS) -> Cat(Fill(48, mem_reg_dram_data(15)), mem_reg_dram_data(15,0)),
    (mem_reg_ctrl_mem_ext === EXT_HU) -> Cat(Fill(48, 0.U                  ), mem_reg_dram_data(15,0)),
    (mem_reg_ctrl_mem_ext === EXT_WS) -> Cat(Fill(32, mem_reg_dram_data(31)), mem_reg_dram_data(31,0)),
    (mem_reg_ctrl_mem_ext === EXT_WU) -> Cat(Fill(32, 0.U                  ), mem_reg_dram_data(31,0)),
    (mem_reg_ctrl_mem_ext === EXT_D ) ->                                       mem_reg_dram_data
  ))

  // WB Mux
  val mem_wbdata = MuxCase(mem_reg_alu_out, Array(
    //    (mem_reg_ctrl_wb_sel === WB_ALU) -> mem_reg_alu_out,
    //    (mem_reg_ctrl_wb_sel === WB_ALUW)-> Cat(Fill(32, mem_reg_alu_out(31)), mem_reg_alu_out(31,0)),
    //    (mem_reg_ctrl_wb_sel === WB_PC4) -> mem_reg_alu_out,
    (mem_reg_ctrl_wb_sel === WB_MEM) -> maskedReadData
  ))

  if(DEBUG_PRINT){
    printf("MEM: valid = %d pc=[%x] inst=[%x] wb_sel=[%d] wbdata=[%x]\n", ms_valid, mem_reg_pc, mem_reg_inst, mem_reg_ctrl_wb_sel, mem_wbdata)
  }


  // 前递
  io.ms_to_ds.ms_valid    := ms_valid
  io.ms_to_ds.mem_reg_wbaddr  := mem_reg_wbaddr
  io.ms_to_ds.mem_wbdata      := mem_wbdata
  io.ms_to_ds.mem_reg_ctrl_rf_wen := mem_reg_ctrl_rf_wen
  // 后传
  io.ms_to_ws.ms_to_ws_valid        := ms_to_ws_valid
  io.ms_to_ws.mem_reg_pc            := mem_reg_pc
  io.ms_to_ws.mem_reg_wbaddr        := mem_reg_wbaddr
  io.ms_to_ws.mem_wbdata            := mem_wbdata
  io.ms_to_ws.mem_reg_ctrl_rf_wen   := mem_reg_ctrl_rf_wen

}
