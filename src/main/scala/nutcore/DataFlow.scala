package nutcore

import chisel3._
import common.constans.{PCSel_w, XLEN, memExt_w, memMask_w, wbSel_w}

// 向后传递
class Fs_to_ds extends Bundle{
  val if_inst         = Output(UInt(XLEN.W))
  val if_reg_pc       = Output(UInt(XLEN.W))
  val fs_kill     = Output(Bool())
  val fs_to_ds_valid  = Output(Bool())
}

class Ds_to_es extends Bundle{
  val ds_to_es_valid  = Output(Bool())
  val dec_reg_pc      = Output(UInt(XLEN.W))
  val dec_reg_inst    = Output(UInt(XLEN.W))
  val dec_wbaddr      = Output(UInt(5.W))
  val dec_op1_data    = Output(UInt(XLEN.W))
  val dec_op2_data    = Output(UInt(XLEN.W))
  val dec_rs2_data    = Output(UInt(XLEN.W))
}

class Es_to_ms extends Bundle{
  val es_to_ms_valid        = Output(Bool())
  val exe_reg_pc            = Output(UInt(XLEN.W))
  val exe_reg_inst          = Output(UInt(XLEN.W))
  val exe_alu_out           = Output(UInt(XLEN.W))
  val exe_reg_wbaddr        = Output(UInt(5.W))
  val exe_reg_op1_data      = Output(UInt(XLEN.W))
  val exe_reg_op2_data      = Output(UInt(XLEN.W))
  val exe_reg_rs2_data      = Output(UInt(XLEN.W))
  val exe_reg_ctrl_rf_wen   = Output(Bool())
  val exe_reg_ctrl_mem_mask = Output(UInt(memMask_w.W))
  val exe_reg_ctrl_mem_ext  = Output(UInt(memExt_w.W))
  val exe_reg_ctrl_wb_sel   = Output(UInt(wbSel_w.W))
  val mem_rdata             = Output(UInt(XLEN.W))
}

class Ms_to_ws extends Bundle{
  val ms_to_ws_valid        = Output(Bool())
  val mem_reg_pc            = Output(UInt(XLEN.W))
  val mem_reg_wbaddr        = Output(UInt(5.W))
  val mem_wbdata            = Output(UInt(XLEN.W))
  val mem_reg_ctrl_rf_wen   = Output(Bool())
}

// 向前传递
class Ds_to_fs extends Bundle{
  val dec_pc_sel          = Output(UInt(PCSel_w.W))
  val dec_brjmp_target    = Output(UInt(XLEN.W))
  val dec_jump_target = Output(UInt(XLEN.W))
}

class Es_to_ds extends Bundle{
  val es_valid              = Output(Bool())
  val exe_reg_ctrl_mem_ren  = Output(Bool())
  val exe_reg_wbaddr        = Output(UInt(5.W))
  val exe_alu_out           = Output(UInt(XLEN.W))
  val exe_reg_ctrl_rf_wen   = Output(Bool())
}

class Ms_to_ds extends Bundle{
  val ms_valid        = Output(Bool())
  val mem_reg_wbaddr  = Output(UInt(5.W))
  val mem_wbdata      = Output(UInt(XLEN.W))
  val mem_reg_ctrl_rf_wen = Output(Bool())
}

class Ws_to_ds extends Bundle{
  val ws_valid        = Output(Bool())
  val wb_reg_wbaddr   = Output(UInt(5.W))
  val wb_reg_wbdata   = Output(UInt(XLEN.W))
  val wb_reg_ctrl_rf_wen = Output(Bool())
}

