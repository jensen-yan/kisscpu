package nutcore

import chisel3._
import chisel3.util._
import common.constans._

class alu extends Module{
  val io = IO(new Bundle{
    val alu_op  = Input(UInt(4.W))
    val src1    = Input(UInt(XLEN.W))
    val src2    = Input(UInt(XLEN.W))
    val result  = Output(UInt(XLEN.W))
  })

  val op = io.alu_op
  var src1 = io.src1
  val src2 = io.src2
  val shamt = io.src2(4,0).asUInt()   // 移位, 取低5位,
  // TODO: 64位 取低6位

  // 只实现了10个
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
    (op === ALU_SRL) -> (src1 >> shamt).asUInt(),
    (op === ALU_COPY1)-> src1
  ))

  printf("alu debug: func = %d, src1=[%x] src2=[%x] result=[%x]\n", op, src1, src2, io.result);

}
