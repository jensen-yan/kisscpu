package nutcore

import chisel3._
import chisel3.util._
import common.constans._

class alu extends Module{
  val io = IO(new Bundle{
    val alu_op  = Input(UInt(aluFunc_w.W))
    val src1    = Input(UInt(XLEN.W))
    val src2    = Input(UInt(XLEN.W))
    val result  = Output(UInt(XLEN.W))

//    val stall   = Output(Bool())
  })

  /*
  // Multiplier
  val isMulDiv = io.alu_op === ALU_MUL || io.alu_op === ALU_MULH || io.alu_op === ALU_MULHSU ||
    io.alu_op === ALU_MULHU || io.alu_op === ALU_DIV || io.alu_op === ALU_DIVU ||
    io.alu_op === ALU_REM || io.alu_op === ALU_REMU || io.alu_op === ALU_MULW ||
    io.alu_op === ALU_DIVW || io.alu_op === ALU_DIVUW || io.alu_op === ALU_REMW ||
    io.alu_op === ALU_REMUW
  val multiplier = Module(new Multiplier)
  multiplier.io.start := isMulDiv
  multiplier.io.a     := io.src1
  multiplier.io.b     := io.src2
  multiplier.io.op    := io.alu_op
  io.stall            := isMulDiv && multiplier.io.stall_req
*/
  val op = io.alu_op
  var src1 = io.src1
  val src2 = io.src2
  val shamt = io.src2(5,0).asUInt()   // 移位, 取低5位,
  // TODO: 64位 取低6位

  // 只实现了12个
  io.result := MuxCase(0.U, Array(
    (op === ALU_ADD) -> (src1 + src2).asUInt(),
    (op === ALU_SUB) -> (src1 - src2).asUInt(),
    (op === ALU_AND) -> (src1 & src2).asUInt(),
    (op === ALU_OR ) -> (src1 | src2).asUInt(),
    (op === ALU_XOR) -> (src1 ^ src2).asUInt(),
    (op === ALU_SLT) -> (src1.asSInt() <  src2.asSInt()).asUInt(),
    (op === ALU_SLTU)-> (src1 < src2).asUInt(),
    (op === ALU_SLL) -> (src1 << shamt)(XLEN-1, 0).asUInt(),
    (op === ALU_SRA) -> (src1.asSInt() >> shamt).asUInt(),
    (op === ALU_SRAW)-> Cat(Fill(32, src1(31)), (src1(31,0).asSInt() >> shamt).asUInt()),
    (op === ALU_SRL) -> (src1 >> shamt).asUInt(),
    (op === ALU_COPY_1)-> src1,
    (op === ALU_COPY_2)-> src2
//    (isMulDiv)         -> multiplier.io.mult_out
  ))
  if(DEBUG_PRINT) {
    printf("ALU: func = %d, src1=[%x] src2=[%x] result=[%x]\n", op, src1, src2, io.result);
  }
}
