package nutcore.decode

import chisel3._
import chisel3.util._
import common.constans._
import nutcore.{DatToCtlIo, Ds_to_es, Ds_to_fs, Es_to_ds, Fs_to_ds, Ms_to_ds, Ws_to_ds}

class DecodeIO extends Bundle{
  val es_allowin  = Input(Bool())
  val ds_allowin  = Output(Bool())

  val fs_to_ds    = Flipped(new Fs_to_ds)
  val ds_to_es    = new Ds_to_es
  // 数据前递
  val es_to_ds    = Flipped(new Es_to_ds)
  val ms_to_ds    = Flipped(new Ms_to_ds)
  val ws_to_ds    = Flipped(new Ws_to_ds)

  val ds_to_fs    = new Ds_to_fs

  // ctr
  val pc_sel      = Input(UInt(PCSel_w.W))
  val op1_sel     = Input(UInt(op1Sel_w.W))
  val op2_sel     = Input(UInt(op2Sel_w.W))

  val dat         = new DatToCtlIo
}

class Decode extends Module{
  val io = IO(new DecodeIO)


  // Instruction Decode State
  val ds_valid = RegInit(false.B)
  val ds_reg_inst = RegInit(BUBBLE)
  val ds_reg_pc = RegInit(0.asUInt(XLEN.W))


  // bus
  val if_inst         = io.fs_to_ds.if_inst
  val if_reg_pc       = io.fs_to_ds.if_reg_pc
  val fs_kill         = io.fs_to_ds.fs_kill
  val fs_to_ds_valid  = io.fs_to_ds.fs_to_ds_valid

  // 数据相关前递
  val es_valid              = io.es_to_ds.es_valid
  val exe_reg_wbaddr        = io.es_to_ds.exe_reg_wbaddr
  val exe_alu_out           = io.es_to_ds.exe_alu_out
  val exe_reg_ctrl_rf_wen   = io.es_to_ds.exe_reg_ctrl_rf_wen
  val exe_reg_ctrl_mem_ren  = io.es_to_ds.exe_reg_ctrl_mem_ren

  val ms_valid              = io.ms_to_ds.ms_valid
  val mem_reg_wbaddr        = io.ms_to_ds.mem_reg_wbaddr
  val mem_wbdata            = io.ms_to_ds.mem_wbdata
  val mem_reg_ctrl_rf_wen   = io.ms_to_ds.mem_reg_ctrl_rf_wen

  val ws_valid              = io.ws_to_ds.ws_valid
  val wb_reg_wbaddr         = io.ws_to_ds.wb_reg_wbaddr
  val wb_reg_wbdata         = io.ws_to_ds.wb_reg_wbdata
  val wb_reg_ctrl_rf_wen    = io.ws_to_ds.wb_reg_ctrl_rf_wen
  //******************************************************************************************************
  // Decode Stage
  val ds_ready_go = !(es_valid && exe_reg_ctrl_mem_ren)      // load 在exe, 要阻塞一下

  io.ds_allowin := !ds_valid || ds_ready_go && io.es_allowin
  val ds_to_es_valid = ds_valid && ds_ready_go

  // TODO: 之后可能还要改这里! 这样强行让ds刷新好奇怪, 如果当前是转移指令, 就让下一拍指令无效
  when(fs_kill && ds_ready_go){
    ds_valid := false.B   // 如果exe有load指令, 还要等下一拍才刷新
  }.elsewhen(io.ds_allowin) {
    ds_valid := fs_to_ds_valid
  }
  when(fs_to_ds_valid && io.ds_allowin) {
    // 传递流水线中的reg
    ds_reg_inst := if_inst
    ds_reg_pc := if_reg_pc
  }


  val dec_rs1_addr = ds_reg_inst(19, 15)
  val dec_rs2_addr = ds_reg_inst(24, 20)
  val dec_wbaddr   = ds_reg_inst(11, 7)


  // Register File
  val regfile = Module(new regfile())
  regfile.io.raddr1 := dec_rs1_addr
  regfile.io.raddr2 := dec_rs2_addr
  val rf_rs1_data = regfile.io.rdata1
  val rf_rs2_data = regfile.io.rdata2
  regfile.io.waddr := wb_reg_wbaddr // 三个写回级的信号
  regfile.io.wdata := wb_reg_wbdata
  regfile.io.we    := wb_reg_ctrl_rf_wen


  // immediates
  val imm_itype = ds_reg_inst(31, 20)
  val imm_stype = Cat(ds_reg_inst(31, 25), ds_reg_inst(11, 7))
  val imm_sbtype = Cat(ds_reg_inst(31), ds_reg_inst(7), ds_reg_inst(30, 25), ds_reg_inst(11, 8))
  val imm_utype = ds_reg_inst(31, 12)
  val imm_ujtype = Cat(ds_reg_inst(31), ds_reg_inst(19, 12), ds_reg_inst(20), ds_reg_inst(30, 21))

  val imm_z = Cat(Fill(27, 0.U), ds_reg_inst(19, 15))

  // sign-extend immediates
  val imm_itype_sext = Cat(Fill(52, imm_itype(11)), imm_itype)
  val imm_stype_sext = Cat(Fill(52, imm_stype(11)), imm_stype)
  val imm_sbtype_sext = Cat(Fill(51, imm_sbtype(11)), imm_sbtype, 0.U)
  val imm_utype_sext = Cat(Fill(32, imm_utype(19)), imm_utype, Fill(12, 0.U))
  val imm_ujtype_sext = Cat(Fill(43, imm_ujtype(19)), imm_ujtype, 0.U)

  // Bypass Muxes
  val dec_op1_data = Wire(UInt(XLEN.W)) // op1 ,op2 是传递给alu使用的
  val dec_op2_data = Wire(UInt(XLEN.W))
  val dec_rs2_data = Wire(UInt(XLEN.W)) // rs2 是regfile读出的值, 有什么作用?

  val dec_alu_op1 = MuxCase(0.U, Array(
    (io.op1_sel === OP1_RS1)    -> rf_rs1_data,
    (io.op1_sel === OP1_RS1W)   -> Cat(Fill(32, 0.U), rf_rs1_data(31,0)),
    (io.op1_sel === OP1_IMZ)    -> imm_z,
    (io.op1_sel === OP1_PC)     -> ds_reg_pc,
  )).asUInt()

  val dec_alu_op2 = MuxCase(0.U, Array(
    (io.op2_sel === OP2_RS2)    -> rf_rs2_data,
    (io.op2_sel === OP2_RS2W)   -> Cat(Fill(32, 0.U), rf_rs2_data(31,0)),
    (io.op2_sel === OP2_ITYPE)  -> imm_itype_sext,
    (io.op2_sel === OP2_STYPE)  -> imm_stype_sext,
    (io.op2_sel === OP2_SBTYPE) -> imm_sbtype_sext,
    (io.op2_sel === OP2_UTYPE)  -> imm_utype_sext,
    (io.op2_sel === OP2_UJTYPE) -> imm_ujtype_sext
  )).asUInt()

  dec_op1_data := MuxCase(dec_alu_op1, Array(
    (es_valid && (exe_reg_wbaddr === dec_rs1_addr) && (dec_rs1_addr =/= 0.U) && exe_reg_ctrl_rf_wen) -> exe_alu_out,
    (ms_valid && (mem_reg_wbaddr === dec_rs1_addr) && (dec_rs1_addr =/= 0.U) && mem_reg_ctrl_rf_wen) -> mem_wbdata,
    (ws_valid && (wb_reg_wbaddr  === dec_rs1_addr) && (dec_rs1_addr =/= 0.U) && wb_reg_ctrl_rf_wen)  -> wb_reg_wbdata
  )) // 且那一级别需要有效
  // 确保当前拍指令有效才行啊, 加valid, 且源地址有效, 是OP1_rs1(默认了)

  dec_op2_data := MuxCase(dec_alu_op2, Array(
    (es_valid && (exe_reg_wbaddr === dec_rs2_addr) && (dec_rs2_addr =/= 0.U) && exe_reg_ctrl_rf_wen && (io.op2_sel === OP2_RS2)) -> exe_alu_out,
    (ms_valid && (mem_reg_wbaddr === dec_rs2_addr) && (dec_rs2_addr =/= 0.U) && mem_reg_ctrl_rf_wen && (io.op2_sel === OP2_RS2)) -> mem_wbdata,
    (ws_valid && (wb_reg_wbaddr  === dec_rs2_addr) && (dec_rs2_addr =/= 0.U) && wb_reg_ctrl_rf_wen  && (io.op2_sel === OP2_RS2)) -> wb_reg_wbdata
  ))

  dec_rs2_data := MuxCase(rf_rs2_data, Array(
    (es_valid && (exe_reg_wbaddr === dec_rs2_addr) && (dec_rs2_addr =/= 0.U) && exe_reg_ctrl_rf_wen) -> exe_alu_out,
    (ms_valid && (mem_reg_wbaddr === dec_rs2_addr) && (dec_rs2_addr =/= 0.U) && mem_reg_ctrl_rf_wen) -> mem_wbdata,
    (ws_valid && (wb_reg_wbaddr  === dec_rs2_addr) && (dec_rs2_addr =/= 0.U) && wb_reg_ctrl_rf_wen)  -> wb_reg_wbdata
  ))

  if(DEBUG_PRINT){
    printf("DEC: valid = %d pc=[%x] inst=[%x] alu1=[%x] op1=[%x] alu2=[%x] op2=[%x]\n", ds_valid, ds_reg_pc, ds_reg_inst, dec_alu_op1, dec_op1_data, dec_alu_op2, dec_op2_data)
  }

  // datapath to controlpath outputs
  io.dat.dec_inst   := ds_reg_inst // dec 的指令
  io.dat.dec_br_eq  := (dec_op1_data === dec_rs2_data) // 在译码级就判断了
  io.dat.dec_br_lt  := (dec_op1_data.asSInt() < dec_rs2_data.asSInt())
  io.dat.dec_br_ltu := (dec_op1_data.asUInt() < dec_rs2_data.asUInt())

  // 前递
  io.ds_to_fs.dec_pc_sel      := io.pc_sel
  io.ds_to_fs.dec_brjmp_target:= ds_reg_pc + dec_op2_data
  io.ds_to_fs.dec_jump_target := (dec_op1_data + dec_op2_data) (XLEN - 1, 0)
  // 后传
  io.ds_to_es.ds_to_es_valid  := ds_to_es_valid
  io.ds_to_es.dec_reg_pc      := ds_reg_pc
  io.ds_to_es.dec_reg_inst    := ds_reg_inst
  io.ds_to_es.dec_wbaddr      := dec_wbaddr
  io.ds_to_es.dec_op1_data    := dec_op1_data
  io.ds_to_es.dec_op2_data    := dec_op2_data
  io.ds_to_es.dec_rs2_data    := dec_rs2_data
}
