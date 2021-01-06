package memory

import chisel3._
import chisel3.util.experimental.loadMemoryFromFile
import common.constans._

class MemIO extends Bundle{
  val addr = Input(UInt(Inst_len.W))
  val en    = Input(Bool())
  val data  = Output(UInt(Inst_len.W))
}

class Mem extends Module{
  val io = IO(new MemIO)

  val memory = Mem(100, UInt(Inst_len.W)) // 存100个32位的pc
  when(io.en){
    io.data := memory(io.addr)
  }

  io.data := memory(io.addr)

  loadMemoryFromFile(memory, "/home/yanyue/nutshell_v2/kisscpu/src/main/scala/mem/mem1.hex.txt")
//  loadMemoryFromFile(memory, "mem1.hex.txt")

//  printf("data = %x\n", io.data)

}