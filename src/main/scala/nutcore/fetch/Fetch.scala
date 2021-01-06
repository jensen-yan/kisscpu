package nutcore.fetch

import chisel3._
import common.InstReadIO
import common.constans._
import nutcore.{Ds_to_fs, Fs_to_ds}

class FetchIO extends Bundle{
  val ds_allowin = Input(Bool())

  val ds_to_fs   = Flipped(new Ds_to_fs())  // 转移指令信息前递
  val fs_to_ds   = new Fs_to_ds

  val instReadIO = new InstReadIO

}

class Fetch extends Module{
  val io = IO(new FetchIO)

  // Instruction Fetch State
  val fs_valid = RegInit(false.B)
  val if_reg_pc = RegInit(UInt(XLEN.W), START_ADDR - 4.U) // TODO: 先不变吧


  //******************************************************************************************************
  // Instruction Fetch Stage
  val if_pc_next = Wire(UInt(XLEN.W)) // next_pc

  // bus
  val dec_brjmp_target    = io.ds_to_fs.dec_brjmp_target
  val dec_jump_reg_target = io.ds_to_fs.dec_jump_reg_target

  val fs_ready_go = Wire(Bool())
  val fs_allowin = Wire(Bool())
  val to_fs_valid = Wire(Bool())

  // pre-IF
  to_fs_valid := true.B

  val if_pc_plus4 = if_reg_pc + 4.asUInt(XLEN.W) // 还是改成了pc+4 == seq_pc

  val dec_pc_sel = io.ds_to_fs.dec_pc_sel
  // 预取值pc由当前dec指令的类型来选择
  if_pc_next := Mux(dec_pc_sel === PC_4,     if_pc_plus4,
                Mux(dec_pc_sel === PC_BRJMP, dec_brjmp_target,
                Mux(dec_pc_sel === PC_JALR,  dec_jump_reg_target,
                /*Mux(io.ctl.exe_pc_sel === PC_EXC*/ BUBBLE))) // TODO:

  // 获取此时的inst指令, 本质在预取阶段做的!
  io.instReadIO.addr  := if_pc_next
  io.instReadIO.en    := to_fs_valid && fs_allowin   // 握手成功且可以流水才读指令
  val if_inst = Wire(UInt(XLEN.W))    // 缓存后的指令
  val if_reg_inst = Reg(UInt(XLEN.W)) // 强行缓存一拍获取的指令
  when(io.instReadIO.en){
    if_reg_inst := io.instReadIO.data   // 只有需要更新才更新!
  }



  // IF stage
  fs_ready_go := true.B
  fs_allowin := !fs_valid || fs_ready_go && io.ds_allowin
  val fs_to_ds_valid = fs_valid && fs_ready_go

  val dec_reflush = dec_pc_sel =/= PC_4    // 如果dec是转移指令, 对下一拍的ds_valid刷新, 当前拍取出的指令= nop

  when(fs_allowin) {
    fs_valid := to_fs_valid
  }

  when(to_fs_valid && fs_allowin) {
    if_reg_pc := if_pc_next
  }

  //    if_inst := if_reg_inst
  if_inst := Mux(dec_reflush, BUBBLE, if_reg_inst) // 如果是跳转指令, 强行改成nop


  //DEBUG:
  //  printf("Inst: addr=[%x], en=%d, data=[%x] \n", io.instReadIO.addr, io.instReadIO.en, if_reg_inst);
  if(DEBUG_PRINT) {
    printf("IF : valid = %d pc=[%x] inst=[%x] if_pc_next=[%x] en=%d e_bj_pc=[%x]\n", fs_valid, if_reg_pc, if_inst, if_pc_next, io.instReadIO.en, dec_brjmp_target)
  }

  //out bus
  io.fs_to_ds.if_inst     := if_inst
  io.fs_to_ds.if_reg_pc   := if_reg_pc
  io.fs_to_ds.dec_reflush := dec_reflush
  io.fs_to_ds.fs_to_ds_valid := fs_to_ds_valid

}
