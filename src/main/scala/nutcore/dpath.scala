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
  val br_target        = Wire(UInt(XLEN.W))
  val jmp_target       = Wire(UInt(XLEN.W))
  val jump_reg_target  = Wire(UInt(XLEN.W))
//  val exception_target = Wire(UInt(XLEN.W))

  // PC Register
  // 根据ctl模块传过来的pc_sel 来更改pc
  pc_next := MuxCase(pc_plus4, Array(
    (io.ctl.pc_sel === PC_4)   -> pc_plus4,
    (io.ctl.pc_sel === PC_BR)  -> br_target,
    (io.ctl.pc_sel === PC_J )  -> jmp_target,
    (io.ctl.pc_sel === PC_JR)  -> jump_reg_target
//    (io.ctl.pc_sel === PC_EXC) -> exception_target
  ))

  val pc_reg = RegInit(UInt(XLEN.W), START_ADDR)   // pc是一个reg

  when (!io.ctl.stall)   // 只要不阻塞, 就更新pc
  {
    pc_reg := pc_next
  }

  pc_plus4 := (pc_reg + 4.asUInt(XLEN.W))


  // pc_reg传给imem
//  io.imem.req.bits.addr := pc_reg
//  io.imem.req.valid := true.B
//  val inst = Mux(io.imem.resp.valid, io.imem.resp.bits.data, BUBBLE)
  // 获取此时的inst指令
  // TODO: inst Read
  io.instReadIO.addr := pc_reg
  io.instReadIO.en := true.B
  val inst = Wire(UInt(XLEN.W))
  inst := io.instReadIO.data
  // DEBUG:
  printf(p"inst = $inst \n")
  printf(p"inst addr = $pc_reg \n")
  printf("inst addr = 0x%x \n", pc_reg);
  printf("inst2 = 0x%x \n", inst);

  // Decode, 获取3个寄存器号码
  val rs1_addr = inst(RS1_MSB, RS1_LSB)
  val rs2_addr = inst(RS2_MSB, RS2_LSB)
  val wb_addr  = inst(RD_MSB,  RD_LSB)

  val wb_data = Wire(UInt(XLEN.W))
//  val wb_wen = io.ctl.rf_wen && !io.ctl.exception
  val wb_wen = io.ctl.rf_wen
  // Register File
  val regfile2 = Mem(32, UInt(XLEN.W))

  when (wb_wen && (wb_addr =/= 0.U))
  {
    regfile2(wb_addr) := wb_data
  }

//  BoringUtils.addSource(regfile2, "diffTestRegfile")
  BoringUtils.addSource(VecInit((0 to NUM_REG-1).map(i => regfile2(i.U))), "diffTestRegfile")
  //// DebugModule
  // 会把regfile(addr) 的值传给debug, 并可以写入regfile
//  io.ddpath.rdata := regfile(io.ddpath.addr)
//  when(io.ddpath.validreq){
//    regfile(io.ddpath.addr) := io.ddpath.wdata
//  }
  ///

  val rs1_data = Mux((rs1_addr =/= 0.U), regfile2(rs1_addr), 0.asUInt(XLEN.W))
  val rs2_data = Mux((rs2_addr =/= 0.U), regfile2(rs2_addr), 0.asUInt(XLEN.W))


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
  val imm_u_sext = Cat(imm_u, Fill(12,0.U))
  val imm_j_sext = Cat(Fill(11,imm_j(19)), imm_j, 0.U)


  val alu_op1 = MuxCase(0.U, Array(
    (io.ctl.op1_sel === OP1_RS1) -> rs1_data,
    (io.ctl.op1_sel === OP1_IMU) -> imm_u_sext,
    (io.ctl.op1_sel === OP1_IMZ) -> imm_z
  )).asUInt()

  val alu_op2 = MuxCase(0.U, Array(
    (io.ctl.op2_sel === OP2_RS2) -> rs2_data,
    (io.ctl.op2_sel === OP2_PC)  -> pc_reg,
    (io.ctl.op2_sel === OP2_IMI) -> imm_i_sext,
    (io.ctl.op2_sel === OP2_IMS) -> imm_s_sext
  )).asUInt()



  // ALU
  val alu_out   = Wire(UInt(XLEN.W))

  val alu_shamt = alu_op2(4,0).asUInt()

  alu_out := MuxCase(0.U, Array(
    (io.ctl.alu_fun === ALU_ADD)  -> (alu_op1 + alu_op2).asUInt(),
    (io.ctl.alu_fun === ALU_SUB)  -> (alu_op1 - alu_op2).asUInt(),
    (io.ctl.alu_fun === ALU_AND)  -> (alu_op1 & alu_op2).asUInt(),
    (io.ctl.alu_fun === ALU_OR)   -> (alu_op1 | alu_op2).asUInt(),
    (io.ctl.alu_fun === ALU_XOR)  -> (alu_op1 ^ alu_op2).asUInt(),
    (io.ctl.alu_fun === ALU_SLT)  -> (alu_op1.asSInt() < alu_op2.asSInt()).asUInt(),
    (io.ctl.alu_fun === ALU_SLTU) -> (alu_op1 < alu_op2).asUInt(),
    (io.ctl.alu_fun === ALU_SLL)  -> ((alu_op1 << alu_shamt)(XLEN-1, 0)).asUInt(),
    (io.ctl.alu_fun === ALU_SRA)  -> (alu_op1.asSInt() >> alu_shamt).asUInt(),
    (io.ctl.alu_fun === ALU_SRL)  -> (alu_op1 >> alu_shamt).asUInt(),
    (io.ctl.alu_fun === ALU_COPY1)-> alu_op1
  ))

  // debug

  // Branch/Jump Target Calculation
  br_target       := pc_reg + imm_b_sext
  jmp_target      := pc_reg + imm_j_sext
  jump_reg_target := (rs1_data.asUInt() + imm_i_sext.asUInt())

  /*
  // Control Status Registers
  val csr = Module(new CSRFile())
  csr.io := DontCare
  csr.io.decode.csr := inst(CSR_ADDR_MSB,CSR_ADDR_LSB)
  csr.io.rw.cmd   := io.ctl.csr_cmd
  csr.io.rw.wdata := alu_out

  csr.io.retire    := !(io.ctl.stall || io.ctl.exception)
  csr.io.exception := io.ctl.exception
  csr.io.pc        := pc_reg
  exception_target := csr.io.evec

  io.dat.csr_eret := csr.io.eret

  // Add your own uarch counters here!
  csr.io.counters.foreach(_.inc := false.B)

*/
  // TODO: 读取地址是啥?
  // WB Mux 确定写入regfile的值
  wb_data := MuxCase(alu_out, Array(
    (io.ctl.wb_sel === WB_ALU) -> alu_out,
   (io.ctl.wb_sel === WB_MEM) -> io.dataReadIO.data,
    (io.ctl.wb_sel === WB_PC4) -> pc_plus4
//    (io.ctl.wb_sel === WB_CSR) -> csr.io.rw.rdata
  ))
 io.dataReadIO.en := true.B
 io.dataReadIO.addr := alu_out



  // datapath to controlpath outputs
  // 输出给ctl模块的值exception_target
  io.dat.inst   := inst
  io.dat.br_eq  := (rs1_data === rs2_data)
  io.dat.br_lt  := (rs1_data.asSInt() < rs2_data.asSInt())
  io.dat.br_ltu := (rs1_data.asUInt() < rs2_data.asUInt())

/*
  // datapath to data memory outputs
  io.dmem.req.bits.addr  := alu_out
  io.dmem.req.bits.data := rs2_data.asUInt()

 */
  io.dataWriteIO.en := true.B
  io.dataWriteIO.addr := alu_out
  io.dataWriteIO.data := rs2_data.asUInt()


  // Printout
  // 可以直接输出各种信息!
  // pass output through the spike-dasm binary (found in riscv-tools) to turn
  // the DASM(%x) into a disassembly string.
  printf("pc=[%x] W[r%d=%x][%d] Op1=[r%d][%x] Op2=[r%d][%x] inst=[%x]\n",
//    csr.io.time(31,0),
//    csr.io.retire,
    pc_reg,
    wb_addr,
    wb_data,
    wb_wen,
    rs1_addr,
    alu_op1,
    rs2_addr,
    alu_op2,
    inst)
  /*
    Mux(io.ctl.stall, Str("S"), Str(" ")),
    MuxLookup(io.ctl.pc_sel, Str("?"), Seq(
      PC_BR -> Str("B"),
      PC_J -> Str("J"),
      PC_JR -> Str("R"),
      PC_EXC -> Str("E"),
      PC_4 -> Str(" "))),
    Mux(csr.io.exception, Str("X"), Str(" ")),
    inst)

   */

/*
  if (PRINT_COMMIT_LOG)
  {
    when (!io.ctl.stall)
    {
      // use "sed" to parse out "@@@" from the other printf code above.
      val rd = inst(RD_MSB,RD_LSB)
      when (io.ctl.rf_wen && rd =/= 0.U)
      {
        printf("@@@ 0x%x (0x%x) x%d 0x%x\n", pc_reg, inst, rd, Cat(Fill(32,wb_data(31)),wb_data))
      }
        .otherwise
        {
          printf("@@@ 0x%x (0x%x)\n", pc_reg, inst)
        }
    }
  }

   */

  BoringUtils.addSource(pc_reg, "diffTestPC")
}