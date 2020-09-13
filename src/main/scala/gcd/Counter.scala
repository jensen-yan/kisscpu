package gcd

import chisel3._

/*
class Counter extends Module{
  val io = IO(new Bundle){
    val cnt = Output(UInt(8.W))
  }
  val x = RegInit(0.U(8.W))
  x := x + 1
  cnt := x

}*/

class Counter(width: Int) extends Module { 
  val io = IO(new Bundle {
    val in = Input(UInt(width.W))
    val out = Output(UInt(width.W))
  })
  io.out := io.in
}