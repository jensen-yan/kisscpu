package memory

import chisel3._
import chisel3.iotesters.PeekPokeTester
import memory.Mem


class MemTest(c: Mem) extends PeekPokeTester(c){
  private val mem = c
  for(i <- 0 to 20){
    val addr = i
    val data = rnd.nextInt(10000)
    // read
    poke(mem.io.addr, addr)
    step(1)
    val rdata = peek(mem.io.data)
    println("data = " + rdata.toString(16))
  }

}

object MemTestGen extends App{
  iotesters.Driver.execute(args, () => new Mem){
    c => new MemTest(c)
  }
}
