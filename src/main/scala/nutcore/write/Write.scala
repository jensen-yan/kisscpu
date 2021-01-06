package nutcore.write

import chisel3._
import chisel3.util.experimental.BoringUtils
import common.constans.{XLEN, DEBUG_PRINT}
import nutcore.{Ms_to_ws, Ws_to_ds}

class WriteIO extends Bundle{
  val ws_allowin  = Output(Bool())

  val ms_to_ws    = Flipped(new Ms_to_ws)
  val ws_to_ds    = new Ws_to_ds
}

class Write extends Module{
  val io = IO(new WriteIO)

  // Writeback State
  val ws_valid = RegInit(false.B)
  val wb_reg_pc = Reg(UInt(XLEN.W))
  val wb_reg_wbaddr = Reg(UInt())
  val wb_reg_wbdata = Reg(UInt(XLEN.W))
  val wb_reg_ctrl_rf_wen = RegInit(false.B)

  val ms_to_ws_valid = io.ms_to_ws.ms_to_ws_valid
  //******************************************************************************************************
  // Writeback Stage
  val ws_ready_go = true.B
  io.ws_allowin := !ws_valid || ws_ready_go
  when(io.ws_allowin) {
    ws_valid := ms_to_ws_valid
  }
  when(ms_to_ws_valid && io.ws_allowin) {
    wb_reg_pc     := io.ms_to_ws.mem_reg_pc
    wb_reg_wbaddr := io.ms_to_ws.mem_reg_wbaddr
    wb_reg_wbdata := io.ms_to_ws.mem_wbdata
    wb_reg_ctrl_rf_wen := io.ms_to_ws.mem_reg_ctrl_rf_wen
  }

  if(DEBUG_PRINT){
    printf("WB : valid = %d pc=[%x]\n", ws_valid, wb_reg_pc)
  }

  // 前递
  io.ws_to_ds.ws_valid            := ws_valid
  io.ws_to_ds.wb_reg_wbaddr       := wb_reg_wbaddr
  io.ws_to_ds.wb_reg_wbdata       := wb_reg_wbdata
  io.ws_to_ds.wb_reg_ctrl_rf_wen  := wb_reg_ctrl_rf_wen

  BoringUtils.addSource(wb_reg_pc, "diffTestPC")
  BoringUtils.addSource(ws_valid, "diffTestPC_valid")   // 表示这是一条有效的PC, 参加比对
}
