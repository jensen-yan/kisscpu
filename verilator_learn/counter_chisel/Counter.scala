import chisel3._

class Counter extends Module{
  val io = IO(new Bundle){
    val cnt = Output(UInt(8.W))
  }
  val x = RegInit(0.U(8.W))
  x := x + 1
  cnt := x

}

// 还没有实现