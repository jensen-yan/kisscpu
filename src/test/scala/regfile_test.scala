package nutcore

import chisel3.iotesters.PeekPokeTester

class regfile_test(c: regfile) extends PeekPokeTester(c){

  for(i <- 0 until 32){
    // 先写入, 再读出进行验证
    // rf(i) = i, 在expect
    poke(c.io.we, 1)
    poke(c.io.waddr, i)
    poke(c.io.wdata, i)
    step(1)
  }
  // 读出验证 rf(i) === i
  for(i <- 0 until 32){
    poke(c.io.raddr1, i)
    expect(c.io.rdata1, i)
  }

}


object regfile_test_gen extends App{
  chisel3.iotesters.Driver.execute(args, () => new regfile)(c => new regfile_test(c))
}