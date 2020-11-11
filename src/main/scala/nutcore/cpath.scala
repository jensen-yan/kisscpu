package nutcore

import chisel3._
import chisel3.util._
import chisel3.util.experimental.BoringUtils
import common.constans._
import common.instructions._
// ctl -> dat 的输出数据
class CtlToDatIo extends Bundle()
{
  val dec_pc_sel = Output(UInt(PCSel_w.W))
  val br_type    = Output(UInt(brType_w.W))
  val op1_sel    = Output(UInt(op1Sel_w.W))
  val op2_sel    = Output(UInt(op2Sel_w.W))
  val alu_fun    = Output(UInt(aluFunc_w.W))
  val wb_sel     = Output(UInt(wbSel_w.W))
  val rf_wen     = Output(Bool())   // 要写回regfile
  val mem_ren    = Output(Bool())
  val mem_wen    = Output(Bool())
  val mem_mask   = Output(UInt(memMask_w.W))
  val mem_ext    = Output(UInt(memExt_w.W))
}

class cpathIO extends Bundle{
  val dat = Flipped(new DatToCtlIo())
  val ctl = new CtlToDatIo()

}

class cpath extends Module{
  val io = IO(new cpathIO())
  io := DontCare

  // 一个大的译码表  译码级的inst -> 各个信号, 第一行是默认行, 可以看作一个大的MuxCase
  // TODO: csrCmd is a foo one for now.
  val csignals = ListLookup(io.dat.dec_inst,
    List(N, BR_N  , OP1_X  , OP2_X     , OEN_0, OEN_0, ALU_X     , WB_X  , REN_0, MRD_0, MWR_0, MSK_X , EXT_X,    N, N),
    Array(     /* val  |  BR   |   op1   |    op2    |  R1  |  R2  |    ALU    |   wb   | rf   | mem  | mem  | mask |extend| csr | fence.i */
               /* inst | type  |   sel   |    sel    |  oen |  oen |    fcn    |   sel  | wen  |  rd  |  wr  | type | type | cmd |         */
      LB     -> List(Y, BR_N  , OP1_RS1 , OP2_ITYPE , OEN_1, OEN_0, ALU_ADD   , WB_MEM , REN_1, MRD_1, MWR_0, MSK_X, EXT_BS,    N, N),
      LH     -> List(Y, BR_N  , OP1_RS1 , OP2_ITYPE , OEN_1, OEN_0, ALU_ADD   , WB_MEM , REN_1, MRD_1, MWR_0, MSK_X, EXT_HS,    N, N),
      LW     -> List(Y, BR_N  , OP1_RS1 , OP2_ITYPE , OEN_1, OEN_0, ALU_ADD   , WB_MEM , REN_1, MRD_1, MWR_0, MSK_X, EXT_WS,    N, N),
      LBU    -> List(Y, BR_N  , OP1_RS1 , OP2_ITYPE , OEN_1, OEN_0, ALU_ADD   , WB_MEM , REN_1, MRD_1, MWR_0, MSK_X, EXT_BU,    N, N),
      LHU    -> List(Y, BR_N  , OP1_RS1 , OP2_ITYPE , OEN_1, OEN_0, ALU_ADD   , WB_MEM , REN_1, MRD_1, MWR_0, MSK_X, EXT_HU,    N, N),
      LWU    -> List(Y, BR_N  , OP1_RS1 , OP2_ITYPE , OEN_1, OEN_0, ALU_ADD   , WB_MEM , REN_1, MRD_1, MWR_0, MSK_X, EXT_WU,    N, N),
      SB     -> List(Y, BR_N  , OP1_RS1 , OP2_STYPE , OEN_1, OEN_1, ALU_ADD   , WB_X   , REN_0, MRD_0, MWR_1, MSK_B, EXT_X ,    N, N),
      SH     -> List(Y, BR_N  , OP1_RS1 , OP2_STYPE , OEN_1, OEN_1, ALU_ADD   , WB_X   , REN_0, MRD_0, MWR_1, MSK_H, EXT_X ,    N, N),
      SW     -> List(Y, BR_N  , OP1_RS1 , OP2_STYPE , OEN_1, OEN_1, ALU_ADD   , WB_X   , REN_0, MRD_0, MWR_1, MSK_W, EXT_X ,    N, N),
      LUI    -> List(Y, BR_N  , OP1_X   , OP2_UTYPE , OEN_0, OEN_0, ALU_COPY_2, WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      AUIPC  -> List(Y, BR_N  , OP1_PC  , OP2_UTYPE , OEN_0, OEN_0, ALU_ADD   , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),

      JAL    -> List(Y, BR_J  , OP1_X   , OP2_UJTYPE, OEN_0, OEN_0, ALU_COPY_2, WB_PC4 , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      JALR   -> List(Y, BR_JR , OP1_RS1 , OP2_ITYPE , OEN_1, OEN_0, ALU_ADD   , WB_PC4 , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      BEQ    -> List(Y, BR_EQ , OP1_RS1 , OP2_SBTYPE, OEN_1, OEN_1, ALU_X     , WB_X   , REN_0, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      BNE    -> List(Y, BR_NE , OP1_RS1 , OP2_SBTYPE, OEN_1, OEN_1, ALU_X     , WB_X   , REN_0, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      BLT    -> List(Y, BR_LT , OP1_RS1 , OP2_SBTYPE, OEN_1, OEN_1, ALU_X     , WB_X   , REN_0, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      BGE    -> List(Y, BR_GE , OP1_RS1 , OP2_SBTYPE, OEN_1, OEN_1, ALU_X     , WB_X   , REN_0, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      BLTU   -> List(Y, BR_LTU, OP1_RS1 , OP2_SBTYPE, OEN_1, OEN_1, ALU_X     , WB_X   , REN_0, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      BGEU   -> List(Y, BR_GEU, OP1_RS1 , OP2_SBTYPE, OEN_1, OEN_1, ALU_X     , WB_X   , REN_0, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),

      ADDI   -> List(Y, BR_N  , OP1_RS1 , OP2_ITYPE , OEN_1, OEN_0, ALU_ADD   , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      SLTIU  -> List(Y, BR_N  , OP1_RS1 , OP2_ITYPE , OEN_1, OEN_0, ALU_SLTU  , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      XORI   -> List(Y, BR_N  , OP1_RS1 , OP2_ITYPE , OEN_1, OEN_0, ALU_XOR   , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      ANDI   -> List(Y, BR_N  , OP1_RS1 , OP2_ITYPE , OEN_1, OEN_0, ALU_AND   , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      ADD    -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_ADD   , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      SUB    -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_SUB   , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      SLT    -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_SLT   , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      SLTU   -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_SLTU  , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      //XOR    -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_XOR   , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      OR     -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_OR    , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      AND    -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_AND   , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),

      LD     -> List(Y, BR_N  , OP1_RS1 , OP2_ITYPE , OEN_1, OEN_0, ALU_ADD   , WB_MEM , REN_1, MRD_1, MWR_0, MSK_X, EXT_D ,    N, N),
      SD     -> List(Y, BR_N  , OP1_RS1 , OP2_STYPE , OEN_1, OEN_1, ALU_ADD   , WB_X   , REN_0, MRD_0, MWR_1, MSK_D, EXT_X ,    N, N),
      SLLI   -> List(Y, BR_N  , OP1_RS1 , OP2_ITYPE , OEN_1, OEN_0, ALU_SLL   , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      SRLI   -> List(Y, BR_N  , OP1_RS1 , OP2_ITYPE , OEN_1, OEN_0, ALU_SRL   , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      SRAI   -> List(Y, BR_N  , OP1_RS1 , OP2_ITYPE , OEN_1, OEN_0, ALU_SRA   , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      ADDIW  -> List(Y, BR_N  , OP1_RS1 , OP2_ITYPE , OEN_1, OEN_0, ALU_ADD   , WB_ALUW, REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),  //TODO check whether have overflow expection problem
      SLLIW  -> List(Y, BR_N  , OP1_RS1 , OP2_ITYPE , OEN_1, OEN_0, ALU_SLL   , WB_ALUW, REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      SRLIW  -> List(Y, BR_N  , OP1_RS1W, OP2_ITYPE , OEN_1, OEN_0, ALU_SRL   , WB_ALUW, REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      SRAIW  -> List(Y, BR_N  , OP1_RS1W, OP2_ITYPE , OEN_1, OEN_0, ALU_SRAW  , WB_ALUW, REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      ADDW   -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_ADD   , WB_ALUW, REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      SUBW   -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_SUB   , WB_ALUW, REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      SLLW   -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_SLL   , WB_ALUW, REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      SRLW   -> List(Y, BR_N  , OP1_RS1W, OP2_RS2   , OEN_1, OEN_1, ALU_SRL   , WB_ALUW, REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      SRAW   -> List(Y, BR_N  , OP1_RS1W, OP2_RS2   , OEN_1, OEN_1, ALU_SRAW  , WB_ALUW, REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),

      // M
      MUL    -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_MUL   , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      MULH   -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_MULH  , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      MULHSU -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_MULHSU, WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      MULHU  -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_MULHU , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      DIV    -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_DIV   , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      DIVU   -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_DIVU  , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      REM    -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_REM   , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      REMU   -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_REMU  , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      MULW   -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_MULW  , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      DIVW   -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_DIVW  , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      DIVUW  -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_DIVUW , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      REMW   -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_REMW  , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),
      REMUW  -> List(Y, BR_N  , OP1_RS1 , OP2_RS2   , OEN_1, OEN_1, ALU_REMUW , WB_ALU , REN_1, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N),


      NEMUHALT->List(Y, BR_N  , OP1_X   , OP2_X     , OEN_0, OEN_0, ALU_X     , WB_X   , REN_0, MRD_0, MWR_0, MSK_X, EXT_X ,    N, N)  //For AMCPUTest
    ))

  // Put these control signals into variables
  // 把查到的c signals 数组拆分成好几个信号
  val (cs_val_inst: Bool) :: cs_br_type :: cs_op1_sel :: cs_op2_sel :: (cs_rs1_oen: Bool) :: (cs_rs2_oen: Bool) :: cs0 = csignals
  val cs_alu_fun :: cs_wb_sel :: (cs_rf_wen: Bool) :: (cs_mem_ren: Bool) :: (cs_mem_wen: Bool) :: cs_mem_mask :: cs_mem_ext :: cs_csr_cmd :: (cs_fencei: Bool) :: Nil = cs0

  // Branch Logic
  // 根据跳转类型决定pc_sel 信号线, pc_4. pc_br, pc_j, pc_jr, pc_exc
  // TODO: 译码得到的cs_br_type, 等下一拍传到执行级, 再去选择pc?
  // 直接在译码得到的cs_br_type, 就来决定pc_sel!
  val ctrl_dec_pc_sel = Mux(false.B         , PC_EXC,
    Mux(cs_br_type === BR_N  , PC_4,
      Mux(cs_br_type === BR_NE , Mux(!io.dat.dec_br_eq,  PC_BRJMP, PC_4),
        Mux(cs_br_type === BR_EQ , Mux( io.dat.dec_br_eq,  PC_BRJMP, PC_4),
          Mux(cs_br_type === BR_GE , Mux(!io.dat.dec_br_lt,  PC_BRJMP, PC_4),
            Mux(cs_br_type === BR_GEU, Mux(!io.dat.dec_br_ltu, PC_BRJMP, PC_4),
              Mux(cs_br_type === BR_LT , Mux( io.dat.dec_br_lt,  PC_BRJMP, PC_4),
                Mux(cs_br_type === BR_LTU, Mux( io.dat.dec_br_ltu, PC_BRJMP, PC_4),
                  Mux(cs_br_type === BR_J  , PC_BRJMP,
                    Mux(cs_br_type === BR_JR , PC_JALR,
                      PC_4
                    ))))))))))


  // Set the data-path control signals
  io.ctl.dec_pc_sel := ctrl_dec_pc_sel
  io.ctl.br_type    := cs_br_type   // 这些传递给译码级使用
  io.ctl.op1_sel    := cs_op1_sel
  io.ctl.op2_sel    := cs_op2_sel
  io.ctl.alu_fun    := cs_alu_fun
  io.ctl.wb_sel     := cs_wb_sel
  io.ctl.rf_wen     := cs_rf_wen
  io.ctl.mem_ren    := cs_mem_ren
  io.ctl.mem_wen    := cs_mem_wen
  io.ctl.mem_mask   := cs_mem_mask
  io.ctl.mem_ext    := cs_mem_ext
/*
  printf("inst=[%x] br_d=[%d] pc_sel=[%d] op1=[%d] op2=[%d] alu_f=[%d] wb_sel=[%d] rf_wen=[%d] mem_ren=%d\n",
    io.dat.dec_inst,
    cs_br_type,
    ctrl_dec_pc_sel,
    cs_op1_sel,
    cs_op2_sel,
    cs_alu_fun,
    cs_wb_sel,
    cs_rf_wen,
    cs_mem_ren)*/

  val nemu_halt = io.dat.dec_inst === NEMUHALT
  BoringUtils.addSource(nemu_halt, "diffTestHalt")
}
