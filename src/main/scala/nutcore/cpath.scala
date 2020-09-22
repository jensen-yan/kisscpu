package nutcore

import chisel3._
import chisel3.util._
import common.CSR
import common.constans._
import common.instructions._
import common.CSR._

// ctl -> dat 的输出数据
class CtlToDatIo extends Bundle()
{
  val stall     = Output(Bool())
  val pc_sel    = Output(UInt(PC_4.getWidth.W))
  val op1_sel   = Output(UInt(OP1_X.getWidth.W))
  val op2_sel   = Output(UInt(OP2_X.getWidth.W))
  val alu_fun   = Output(UInt(ALU_X.getWidth.W))
  val wb_sel    = Output(UInt(WB_X.getWidth.W))
  val rf_wen    = Output(Bool())
}

class cpathIO extends Bundle{
  val dat = Flipped(new DatToCtlIo())
  val ctl = new CtlToDatIo()

}

class cpath extends Module{
  val io = IO(new cpathIO())
  io := DontCare

  // 一个大的译码表  inst -> 各个信号, 第一行是默认行, 可以看作一个大的MuxCase
  val csignals =
    ListLookup(io.dat.inst,
      List(Y, BR_N  , OP1_X  ,  OP2_X  , ALU_X   , WB_X   , REN_0, MEN_0, M_X  , MT_X,  CSR.N),
      Array(       /* val  |  BR  |  op1   |   op2     |  ALU    |  wb  | rf   | mem  | mem  | mask |  csr  */
        /* inst | type |   sel  |    sel    |   fcn   |  sel | wen  |  en  |  wr  | type |  cmd  */
        LUI     -> List(Y, BR_N  , OP1_IMU, OP2_X   , ALU_COPY1, WB_ALU, REN_1, MEN_0, M_X ,  MT_X,  CSR.N),
))

  // Put these control signals into variables
  // 把查到的c signals 数组拆分成好几个信号
  val (cs_val_inst: Bool) :: cs_br_type         :: cs_op1_sel            :: cs_op2_sel :: cs0 = csignals
  val cs_alu_fun          :: cs_wb_sel          :: (cs_rf_wen: Bool)     ::               cs1 = cs0
  val (cs_mem_en: Bool)   :: cs_mem_fcn         :: cs_msk_sel            :: cs_csr_cmd :: Nil = cs1

  // Branch Logic
  // 根据跳转类型决定pc_sel 信号线, pc_4. pc_br, pc_j, pc_jr, pc_exc
  val ctrl_pc_sel = PC_4

  val stall = false.B

  // Set the data-path control signals
  io.ctl.stall    := stall
  io.ctl.pc_sel   := ctrl_pc_sel
  io.ctl.op1_sel  := cs_op1_sel
  io.ctl.op2_sel  := cs_op2_sel
  io.ctl.alu_fun  := cs_alu_fun
  io.ctl.wb_sel   := cs_wb_sel
  io.ctl.rf_wen   := cs_rf_wen

  printf("stall=[%d] pc_sel=[%d] op1=[%d] op2=[%d] alu=[%d] wb=[%d] rf_wen=[%d]\n",
    stall,
    ctrl_pc_sel,
    cs_op1_sel,
    cs_op2_sel,
    cs_alu_fun,
    cs_wb_sel,
    cs_rf_wen)

}
