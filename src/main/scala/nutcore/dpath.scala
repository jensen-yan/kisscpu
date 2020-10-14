package nutcore

import chisel3._
import chisel3.util._
import chisel3.util.experimental.BoringUtils
import common.constans._
import common.instructions._
import common._

class DatToCtlIo extends Bundle() {
  val dec_inst = Output(UInt(XLEN.W))
  val dec_br_eq = Output(Bool())
  val dec_br_lt = Output(Bool())
  val dec_br_ltu = Output(Bool())
}

class DpathIo extends Bundle() {
  val ctl = Flipped(new CtlToDatIo())
  val dat = new DatToCtlIo()
  val instReadIO = new InstReadIO()
  val dataReadIO = new DataReadIO()
  val dataWriteIO = new DataWriteIO()
}

class dpath extends Module {
  val io = IO(new DpathIo())
  io := DontCare

  //**********************************
  // Pipeline State Registers

  // Instruction Fetch State
  val fs_valid = RegInit(false.B)
  val if_reg_pc = RegInit(UInt(XLEN.W), START_ADDR - 4.U) // TODO: 先不变吧

  // Instruction Decode State
  val ds_valid = RegInit(false.B)
  val dec_reg_inst = RegInit(BUBBLE)
  val dec_reg_pc = RegInit(0.asUInt(XLEN.W))
  val ds_allowin = Wire(Bool())

  // Execute State, 18个
  val es_valid = RegInit(false.B)
  val exe_reg_inst = RegInit(BUBBLE)
  val exe_reg_pc = RegInit(0.asUInt(XLEN.W))
  val exe_reg_wbaddr = Reg(UInt(5.W))
  val exe_reg_rs1_addr = Reg(UInt(5.W))
  val exe_reg_rs2_addr = Reg(UInt(5.W))
  val exe_reg_op1_data = Reg(UInt(XLEN.W))
  val exe_reg_op2_data = Reg(UInt(XLEN.W))
  val exe_reg_rs2_data = Reg(UInt(XLEN.W))
  val exe_reg_ctrl_op2_sel = Reg(UInt())
  val exe_reg_ctrl_alu_fun = Reg(UInt())
  val exe_reg_ctrl_wb_sel = Reg(UInt())
  val exe_reg_ctrl_rf_wen = RegInit(false.B)
  val exe_reg_ctrl_mem_val = RegInit(false.B)
  val exe_reg_ctrl_mem_fcn = RegInit(M_X)
  val exe_reg_ctrl_mem_typ = RegInit(MT_X)
  val exe_reg_ctrl_csr_cmd = RegInit(CSR.N)
  val es_allowin = Wire(Bool())

  // Memory State
  val ms_valid = RegInit(false.B)
  val mem_reg_pc = Reg(UInt(XLEN.W))
  val mem_reg_inst = Reg(UInt(XLEN.W))
  val mem_reg_alu_out = Reg(UInt(XLEN.W))
  val mem_reg_wbaddr = Reg(UInt())
  val mem_reg_rs1_addr = Reg(UInt())
  val mem_reg_rs2_addr = Reg(UInt())
  val mem_reg_op1_data = Reg(UInt(XLEN.W))
  val mem_reg_op2_data = Reg(UInt(XLEN.W))
  val mem_reg_rs2_data = Reg(UInt(XLEN.W))
  val mem_reg_ctrl_rf_wen = RegInit(false.B)
  val mem_reg_ctrl_mem_val = RegInit(false.B)
  val mem_reg_ctrl_mem_fcn = RegInit(M_X)
  val mem_reg_ctrl_mem_typ = RegInit(MT_X)
  val mem_reg_ctrl_wb_sel = Reg(UInt())
  val mem_reg_ctrl_csr_cmd = RegInit(CSR.N)
  val ms_allowin = Wire(Bool())

  // Writeback State
  val ws_valid = RegInit(false.B)
  val wb_reg_pc = Reg(UInt(XLEN.W))
  val wb_reg_wbaddr = Reg(UInt())
  val wb_reg_wbdata = Reg(UInt(XLEN.W))
  val wb_reg_ctrl_rf_wen = RegInit(false.B)
  val ws_allowin = Wire(Bool())


  //******************************************************************************************************
  // Instruction Fetch Stage
  val if_pc_next = Wire(UInt(XLEN.W)) // next_pc
  val dec_brjmp_target = Wire(UInt(XLEN.W))
  val dec_jump_reg_target = Wire(UInt(XLEN.W))
  //  val exception_target    = Wire(UInt(XLEN.W))

  val fs_ready_go = Wire(Bool())
  val fs_allowin = Wire(Bool())
  val to_fs_valid = Wire(Bool())

  // pre-IF
  to_fs_valid := true.B
  val if_pc_plus4 = if_reg_pc + 4.asUInt(XLEN.W) // 还是改成了pc+4 == seq_pc
  // 预取值pc由当前dec指令的类型来选择
  if_pc_next := Mux(io.ctl.dec_pc_sel === PC_4, if_pc_plus4,
    Mux(io.ctl.dec_pc_sel === PC_BRJMP, dec_brjmp_target,
      Mux(io.ctl.dec_pc_sel === PC_JALR, dec_jump_reg_target,
        /*Mux(io.ctl.exe_pc_sel === PC_EXC*/ BUBBLE))) // TODO:

  // IF stage
  fs_ready_go := true.B
  fs_allowin := !fs_valid || fs_ready_go && ds_allowin
  val fs_to_ds_valid = fs_valid && fs_ready_go

  val dec_reflush = io.ctl.dec_pc_sel =/= PC_4    // 如果dec是转移指令, 对下一拍的ds_valid刷新, 当前拍取出的指令= nop

  when(fs_allowin) {
    fs_valid := to_fs_valid
  }

  when(to_fs_valid && fs_allowin) {
    if_reg_pc := if_pc_next
  }
  // 获取此时的inst指令
  // TODO: inst Read
  io.instReadIO.addr := if_pc_next
  io.instReadIO.en := to_fs_valid && fs_allowin   // 握手成功且可以流水才读指令
  val if_inst = Wire(UInt(XLEN.W))
  val if_reg_inst = Reg(UInt(XLEN.W)) // 强行缓存一拍获取的指令
  if_reg_inst := io.instReadIO.data
//    if_inst := if_reg_inst
  if_inst := Mux(dec_reflush, BUBBLE, if_reg_inst) // 如果是跳转指令, 强行改成nop


  //DEBUG: TODO:
  printf("Inst: addr=[%x], en=%d, data=[%x] \n", io.instReadIO.addr, io.instReadIO.en, if_reg_inst);
  printf("IF : valid = %d pc=[%x] inst=[%x] if_pc_next=[%x] pc_sel=[%d] e_bj_pc=[%x]\n", fs_valid, if_reg_pc, if_inst, if_pc_next, io.ctl.dec_pc_sel, dec_brjmp_target)


  //******************************************************************************************************
  // Decode Stage
  val ds_ready_go = true.B
  ds_allowin := !ds_valid || ds_ready_go && es_allowin
  val ds_to_es_valid = ds_valid && ds_ready_go

  when(dec_reflush){
    ds_valid := false.B
  }.elsewhen(ds_allowin) {
    ds_valid := fs_to_ds_valid
  }
  when(fs_to_ds_valid && ds_allowin) {
    // 传递流水线中的reg
    dec_reg_inst := if_inst
    dec_reg_pc := if_reg_pc
  }


  val dec_rs1_addr = dec_reg_inst(19, 15)
  val dec_rs2_addr = dec_reg_inst(24, 20)
  val dec_wbaddr = dec_reg_inst(11, 7)


  // Register File
  val regfile = Module(new regfile())
  regfile.io.raddr1 := dec_rs1_addr
  regfile.io.raddr2 := dec_rs2_addr
  val rf_rs1_data = regfile.io.rdata1
  val rf_rs2_data = regfile.io.rdata2
  regfile.io.waddr := wb_reg_wbaddr // 三个写回级的信号
  regfile.io.wdata := wb_reg_wbdata
  regfile.io.we := wb_reg_ctrl_rf_wen


  // immediates
  val imm_itype = dec_reg_inst(31, 20)
  val imm_stype = Cat(dec_reg_inst(31, 25), dec_reg_inst(11, 7))
  val imm_sbtype = Cat(dec_reg_inst(31), dec_reg_inst(7), dec_reg_inst(30, 25), dec_reg_inst(11, 8))
  val imm_utype = dec_reg_inst(31, 12)
  val imm_ujtype = Cat(dec_reg_inst(31), dec_reg_inst(19, 12), dec_reg_inst(20), dec_reg_inst(30, 21))

  val imm_z = Cat(Fill(27, 0.U), dec_reg_inst(19, 15))

  // sign-extend immediates
  val imm_itype_sext = Cat(Fill(52, imm_itype(11)), imm_itype)
  val imm_stype_sext = Cat(Fill(52, imm_stype(11)), imm_stype)
  val imm_sbtype_sext = Cat(Fill(51, imm_sbtype(11)), imm_sbtype, 0.U)
  val imm_utype_sext = Cat(Fill(32, imm_utype(19)), imm_utype, Fill(12, 0.U))
  val imm_ujtype_sext = Cat(Fill(43, imm_ujtype(19)), imm_ujtype, 0.U)

  // Bypass Muxes
  val exe_alu_out = Wire(UInt(XLEN.W))
  val mem_wbdata = Wire(UInt(XLEN.W))

  val dec_op1_data = Wire(UInt(XLEN.W)) // op1 ,op2 是传递给alu使用的
  val dec_op2_data = Wire(UInt(XLEN.W))
  val dec_rs2_data = Wire(UInt(XLEN.W)) // rs2 是regfile读出的值


  dec_op1_data := MuxCase(rf_rs1_data, Array(
    ((io.ctl.op1_sel === OP1_IMZ)) -> imm_z,
    ((io.ctl.op1_sel === OP1_PC)) -> dec_reg_pc,
    (es_valid && (exe_reg_wbaddr === dec_rs1_addr) && (dec_rs1_addr =/= 0.U) && exe_reg_ctrl_rf_wen) -> exe_alu_out,
    (ms_valid && (mem_reg_wbaddr === dec_rs1_addr) && (dec_rs1_addr =/= 0.U) && mem_reg_ctrl_rf_wen) -> mem_wbdata,
    (ws_valid && (wb_reg_wbaddr === dec_rs1_addr) && (dec_rs1_addr =/= 0.U) && wb_reg_ctrl_rf_wen) -> wb_reg_wbdata
  )) // 且那一级别需要有效
  // 确保当前拍指令有效才行啊, 加valid, 且源地址有效, 是OP1_rs1(默认了)
  val dec_alu_op2 = MuxCase(0.U, Array(
    (io.ctl.op2_sel === OP2_RS2) -> rf_rs2_data,
    (io.ctl.op2_sel === OP2_ITYPE) -> imm_itype_sext,
    (io.ctl.op2_sel === OP2_STYPE) -> imm_stype_sext,
    (io.ctl.op2_sel === OP2_SBTYPE) -> imm_sbtype_sext,
    (io.ctl.op2_sel === OP2_UTYPE) -> imm_utype_sext,
    (io.ctl.op2_sel === OP2_UJTYPE) -> imm_ujtype_sext
  )).asUInt()

  dec_op2_data := MuxCase(dec_alu_op2, Array(
    (es_valid && (exe_reg_wbaddr === dec_rs2_addr) && (dec_rs2_addr =/= 0.U) && exe_reg_ctrl_rf_wen && (io.ctl.op2_sel === OP2_RS2)) -> exe_alu_out,
    (ms_valid && (mem_reg_wbaddr === dec_rs2_addr) && (dec_rs2_addr =/= 0.U) && mem_reg_ctrl_rf_wen && (io.ctl.op2_sel === OP2_RS2)) -> mem_wbdata,
    (ws_valid && (wb_reg_wbaddr === dec_rs2_addr) && (dec_rs2_addr =/= 0.U) && wb_reg_ctrl_rf_wen && (io.ctl.op2_sel === OP2_RS2)) -> wb_reg_wbdata
  ))

  dec_rs2_data := MuxCase(rf_rs2_data, Array(
    (es_valid && (exe_reg_wbaddr === dec_rs2_addr) && (dec_rs2_addr =/= 0.U) && exe_reg_ctrl_rf_wen) -> exe_alu_out,
    (ms_valid && (mem_reg_wbaddr === dec_rs2_addr) && (dec_rs2_addr =/= 0.U) && mem_reg_ctrl_rf_wen) -> mem_wbdata,
    (ws_valid && (wb_reg_wbaddr === dec_rs2_addr) && (dec_rs2_addr =/= 0.U) && wb_reg_ctrl_rf_wen) -> wb_reg_wbdata
  ))


  // Branch/Jump Target Calculation
  val brjmp_offset = dec_op2_data
  dec_brjmp_target := dec_reg_pc + brjmp_offset
  dec_jump_reg_target := (dec_op1_data + dec_op2_data) (XLEN - 1, 0)


  printf("DEC: valid = %d pc=[%x] inst=[%x] op2=[%x] bj_target = [%x]\n", ds_valid, dec_reg_pc, dec_reg_inst, dec_alu_op2, dec_brjmp_target)


  //******************************************************************************************************
  // Execute Stage
  val es_ready_go = true.B
  es_allowin := !es_valid || es_ready_go && ms_allowin
  val es_to_ms_valid = es_valid && es_ready_go
  when(es_allowin) {
    es_valid := ds_to_es_valid
  }
  when(ds_to_es_valid && es_allowin) {
    // 传递流水线reg
    exe_reg_pc := dec_reg_pc
    exe_reg_rs1_addr := dec_rs1_addr
    exe_reg_rs2_addr := dec_rs2_addr
    exe_reg_op1_data := dec_op1_data
    exe_reg_op2_data := dec_op2_data
    exe_reg_rs2_data := dec_rs2_data
    exe_reg_inst := dec_reg_inst
    exe_reg_wbaddr := dec_wbaddr

    // TODO: ctrl 传过来的信号等价于dec传过来的吧
    exe_reg_ctrl_op2_sel := io.ctl.op2_sel
    exe_reg_ctrl_alu_fun := io.ctl.alu_fun
    exe_reg_ctrl_wb_sel := io.ctl.wb_sel
    exe_reg_ctrl_rf_wen := io.ctl.rf_wen
    exe_reg_ctrl_mem_val := io.ctl.mem_val
    exe_reg_ctrl_mem_fcn := io.ctl.mem_fcn
    exe_reg_ctrl_mem_typ := io.ctl.mem_typ
  }


  val exe_alu_op1 = exe_reg_op1_data.asUInt()
  val exe_alu_op2 = exe_reg_op2_data.asUInt()

  // ALU
  val alu = Module(new alu)
  alu.io.alu_op := exe_reg_ctrl_alu_fun // 这里应该用decode缓存一次的func!
  alu.io.src1 := exe_alu_op1
  alu.io.src2 := exe_alu_op2
  exe_alu_out := alu.io.result
  //  val exe_adder_out = (exe_alu_op1 + exe_alu_op2)(XLEN-1,0)

  val exe_pc_plus4 = (exe_reg_pc + 4.U) (XLEN - 1, 0)


  printf("EXE: valid = %d pc=[%x] inst=[%x] \n", es_valid, exe_reg_pc, exe_reg_inst)

  //******************************************************************************************************
  // Memory Stage
  val ms_ready_go = true.B
  ms_allowin := !ms_valid || ms_ready_go && ws_allowin
  val ms_to_ws_valid = ms_valid && ms_ready_go
  when(ms_allowin) {
    ms_valid := es_to_ms_valid
  }
  when(es_to_ms_valid && ms_allowin) {
    mem_reg_pc := exe_reg_pc
    mem_reg_inst := exe_reg_inst
    mem_reg_alu_out := Mux((exe_reg_ctrl_wb_sel === WB_PC4), exe_pc_plus4, exe_alu_out) // 特别判断一下!
    mem_reg_wbaddr := exe_reg_wbaddr
    mem_reg_rs1_addr := exe_reg_rs1_addr
    mem_reg_rs2_addr := exe_reg_rs2_addr
    mem_reg_op1_data := exe_reg_op1_data
    mem_reg_op2_data := exe_reg_op2_data
    mem_reg_rs2_data := exe_reg_rs2_data
    mem_reg_ctrl_rf_wen := exe_reg_ctrl_rf_wen
    mem_reg_ctrl_mem_val := exe_reg_ctrl_mem_val
    mem_reg_ctrl_mem_fcn := exe_reg_ctrl_mem_fcn
    mem_reg_ctrl_mem_typ := exe_reg_ctrl_mem_typ
    mem_reg_ctrl_wb_sel := exe_reg_ctrl_wb_sel
    mem_reg_ctrl_csr_cmd := exe_reg_ctrl_csr_cmd
  }

  // WB Mux
  mem_wbdata := MuxCase(mem_reg_alu_out, Array(
    (mem_reg_ctrl_wb_sel === WB_ALU) -> mem_reg_alu_out,
    (mem_reg_ctrl_wb_sel === WB_PC4) -> mem_reg_alu_out
    //    (mem_reg_ctrl_wb_sel === WB_MEM) -> io.dmem.resp.bits.data
  ))

  printf("MEM: valid = %d pc=[%x] inst=[%x] wb_sel=[%d] wbdata=[%x]\n", ms_valid, mem_reg_pc, mem_reg_inst, mem_reg_ctrl_wb_sel, mem_wbdata)

  //******************************************************************************************************
  // Writeback Stage
  val ws_ready_go = true.B
  ws_allowin := !ws_valid || ws_ready_go
  when(ws_allowin) {
    ws_valid := ms_to_ws_valid
  }
  when(ms_to_ws_valid && ws_allowin) {
    wb_reg_pc     := mem_reg_pc
    wb_reg_wbaddr := mem_reg_wbaddr
    wb_reg_wbdata := mem_wbdata
    wb_reg_ctrl_rf_wen := mem_reg_ctrl_rf_wen
  }


  printf("WB : valid = %d pc=[%x] inst=[%x]\n", ws_valid, wb_reg_pc, RegNext(mem_reg_inst))

  //******************************************************************************************************
  // External Signals

  // datapath to controlpath outputs
  io.dat.dec_inst := dec_reg_inst // dec 的指令
  io.dat.dec_br_eq := (dec_op1_data === dec_rs2_data) // 在译码级就判断了
  io.dat.dec_br_lt := (dec_op1_data.asSInt() < dec_rs2_data.asSInt())
  io.dat.dec_br_ltu := (dec_op1_data.asUInt() < dec_rs2_data.asUInt())

  // datapath to data memory outputs
  io.dataWriteIO.en := true.B
  io.dataWriteIO.addr := mem_reg_alu_out.asUInt()
  io.dataWriteIO.data := mem_reg_rs2_data // TODO: 为何写入mem的rf的第二个读取值?


  // TODO: 读取地址是啥?
  // WB Mux 确定写入regfile的值
  // io.dataReadIO.en := true.B
  // io.dataReadIO.addr := alu_out


  // Printout
  val wb_reg_inst = RegNext(mem_reg_inst)

  printf("pc=[%x] W[r%d=%x][%d] Op1=[r%d][%x] Op2=[r%d][%x] inst=[%x]\n",
    wb_reg_pc,
    wb_reg_wbaddr,
    wb_reg_wbdata,
    wb_reg_ctrl_rf_wen,
    RegNext(mem_reg_rs1_addr),
    RegNext(mem_reg_op1_data),
    RegNext(mem_reg_rs2_addr),
    RegNext(mem_reg_op2_data),
    wb_reg_inst)


  BoringUtils.addSource(wb_reg_pc, "diffTestPC")
  BoringUtils.addSource(ws_valid, "diffTestPC_valid")   // 表示这是一条有效的PC, 参加比对
}