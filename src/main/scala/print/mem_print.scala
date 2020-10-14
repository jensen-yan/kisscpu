package print

import chisel3._

class mem_print extends Module{
  val io = IO(new Bundle() {
    val raddr1 = Input (UInt(6.W))  // 自动推断地址位宽 = 5
    val raddr2 = Input (UInt(6.W))
    val rdata1 = Output(UInt(64.W))
    val rdata2 = Output(UInt(64.W))
    val we     = Input (UInt(1.W))
    val waddr  = Input (UInt(6.W))
    val wdata  = Input (UInt(64.W))
  })

  val myMem = Mem(128, UInt(64.W))	// 异步读, 传地址后立刻能读出数据
//  VecInit((0 to 128-1).map(i => myMem(i.U)))    // VecInit作用到底是什么?

  // 添加写端口(两个写端口咋办?)
  val wen = io.we.asBool()
  val writeAddr = io.waddr
  val dataIn = io.wdata
  when (wen) {
    myMem(writeAddr) := dataIn
  }
  // 加两个读端口
  val raddr1 = io.raddr1
  val raddr2 = io.raddr2
  val re = true.B
  val read_port1 = UInt(64.W)		// 位宽必须相同
  val read_port2 = UInt(64.W)

  // 居然多了一个when(true) 就不对了, 咋回事???

//    io.rdata1 := Mux(raddr1 === 0.U, 0.U, myMem(raddr1))
//    io.rdata2 := Mux(raddr2 === 0.U, 0.U, myMem(raddr2))
  io.rdata1 := myMem(raddr1)
  io.rdata2 := myMem(raddr2)

  printf("ra = %x, sp = %x\n", myMem(1.U), myMem(2.U))
}
