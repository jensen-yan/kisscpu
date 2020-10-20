package nutcore

import chisel3.iotesters.PeekPokeTester
import common.constans._

class alu_test(c: alu) extends PeekPokeTester(c){
  // 对10个操作验证一下
  // sub: 3+2 = 5

  for(i <- 0 until 17){
    // 先写入, 再读出进行验证
    // rf(i) = i, 在expect
    poke(c.io.alu_op, ALU_SRAW)
    poke(c.io.src1, -8)
    poke(c.io.src2, 1)
    expect(c.io.result, i/2)
  }

}


object alu_test_gen extends App{
  chisel3.iotesters.Driver.execute(args, () => new alu)(c => new alu_test(c))
}