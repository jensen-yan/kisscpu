package nutcore

import chisel3._
import chisel3.util._
import chisel3.util.experimental.BoringUtils
import common.constans._
import common.instructions._
import common._

class DatToCtlIo extends Bundle()
{
  val inst   = Output(UInt(XLEN.W))
  val br_eq  = Output(Bool())
  val br_lt  = Output(Bool())
  val br_ltu = Output(Bool())
  val csr_eret = Output(Bool())
}

class DpathIo extends Bundle()
{
  val ctl  = Flipped(new CtlToDatIo())
  val dat  = new DatToCtlIo()
  val instReadIO = new InstReadIO()
  val dataReadIO = new DataReadIO()
  val dataWriteIO = new DataWriteIO()
}

class dpath extends Module
{
  val io = IO(new DpathIo())
  io := DontCare

  // Instruction Fetch
  val pc_next          = Wire(UInt(XLEN.W))
  val pc_plus4         = Wire(UInt(XLEN.W))


  // TODO: 初始-8?
  val pc_reg = RegInit(UInt(XLEN.W), START_ADDR-8.U)   // pc是一个reg
  pc_reg := pc_next
  // TODO: 64位  + 8
  pc_plus4 := (pc_reg + 8.asUInt(XLEN.W))
  pc_next := pc_plus4

  // 获取此时的inst指令
  // TODO: inst Read
  io.instReadIO.addr := pc_reg
  io.instReadIO.en := true.B
  val inst = Wire(UInt(XLEN.W))
  inst := io.instReadIO.data

  // Decode, 获取3个寄存器号码
  val rs1_addr = inst(RS1_MSB, RS1_LSB)
  val rs2_addr = inst(RS2_MSB, RS2_LSB)
  val wb_addr  = inst(RD_MSB,  RD_LSB)

  val wb_data = Wire(UInt(XLEN.W))
  val wb_wen = io.ctl.rf_wen

  // Register File
  val regfile2 = Mem(32, UInt(XLEN.W))

  when (wb_wen && (wb_addr =/= 0.U))
  {
    regfile2(wb_addr) := wb_data
  }
  val rs1_data = Mux((rs1_addr =/= 0.U), regfile2(rs1_addr), 0.asUInt(XLEN.W))
  val rs2_data = Mux((rs2_addr =/= 0.U), regfile2(rs2_addr), 0.asUInt(XLEN.W))
  BoringUtils.addSource(VecInit((0 to NUM_REG-1).map(i => regfile2(i.U))), "diffTestRegfile")


  // immediates
  val imm_i = inst(31, 20)
  val imm_s = Cat(inst(31, 25), inst(11,7))
  val imm_b = Cat(inst(31), inst(7), inst(30,25), inst(11,8))
  val imm_u = inst(31, 12)
  val imm_j = Cat(inst(31), inst(19,12), inst(20), inst(30,21))
  val imm_z = Cat(Fill(27,0.U), inst(19,15))

  // sign-extend immediates
  val imm_i_sext = Cat(Fill(20,imm_i(11)), imm_i)
  val imm_s_sext = Cat(Fill(20,imm_s(11)), imm_s)
  val imm_b_sext = Cat(Fill(19,imm_b(11)), imm_b, 0.U)
//  val imm_u_sext = Cat(imm_u, Fill(12,0.U))
  val imm_j_sext = Cat(Fill(11,imm_j(19)), imm_j, 0.U)

  // 改成64位的
  val imm_u_sext = Cat(Fill(32, imm_u(19)), imm_u, Fill(12,0.U))

/*
  val alu_op1 = MuxCase(0.U, Array(
    (io.ctl.op1_sel === OP1_RS1) -> rs1_data,
    (io.ctl.op1_sel === OP1_IMU) -> imm_u_sext,
    (io.ctl.op1_sel === OP1_IMZ) -> imm_z
  )).asUInt()

 */


  val alu_op1 = imm_u_sext
  printf("imm_u  = [%x] sel=[%d] op1=[%x]\n", imm_u_sext, io.ctl.op1_sel, alu_op1)

  val alu_op2 = MuxCase(0.U, Array(
    (io.ctl.op2_sel === OP2_RS2) -> rs2_data,
    (io.ctl.op2_sel === OP2_PC)  -> pc_reg,
    (io.ctl.op2_sel === OP2_IMI) -> imm_i_sext,
    (io.ctl.op2_sel === OP2_IMS) -> imm_s_sext
  )).asUInt()



  // ALU
  val alu_out   = Wire(UInt(XLEN.W))
  val alu = Module(new alu)
  alu.io.alu_op := io.ctl.alu_fun
  alu.io.src1   := alu_op1
  alu.io.src2   := alu_op2
  alu_out       := alu.io.result

  // TODO: 读取地址是啥?
  // WB Mux 确定写入regfile的值
  wb_data := alu_out
// io.dataReadIO.en := true.B
// io.dataReadIO.addr := alu_out



  // datapath to controlpath outputs
  // 输出给ctl模块的值exception_target
  io.dat.inst   := inst
  io.dat.br_eq  := (rs1_data === rs2_data)
  io.dat.br_lt  := (rs1_data.asSInt() < rs2_data.asSInt())
  io.dat.br_ltu := (rs1_data.asUInt() < rs2_data.asUInt())

  io.dataWriteIO.en := true.B
  io.dataWriteIO.addr := alu_out
  io.dataWriteIO.data := rs2_data.asUInt()


  // Printout
  printf("pc=[%x] W[r%d=%x][%d] Op1=[r%d][%x] Op2=[r%d][%x] inst=[%x] " +
    "op1=[%x] op2=[%x] fun = [%d] out=[%x] addr=[%x] wb_data=[%x] rf[5] = [%x]\n",
    pc_reg,
    wb_addr,
    wb_data,
    wb_wen,
    rs1_addr,
    alu_op1,
    rs2_addr,
    alu_op2,
    inst,
    alu_op1,
    alu_op2,
    io.ctl.alu_fun,
    alu_out,
    wb_addr,
    wb_data,
    regfile2(5))

  BoringUtils.addSource(pc_reg, "diffTestPC")
}