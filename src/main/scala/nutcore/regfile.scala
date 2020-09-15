package nutcore

import chisel3._
import chisel3.util._
import chisel3.util.experimental.BoringUtils

import common.constans._


class regfile extends Module{
  val io = IO(new Bundle() {
    /*
    val raddr1 = Input (UInt(5.W))  // 自动推断地址位宽 = 5
    val raddr2 = Input (UInt(5.W))
    val rdata1 = Output(UInt(32.W))
    val rdata2 = Output(UInt(32.W))
    val we     = Input (UInt(1.W))
    val waddr  = Input (UInt(5.W))
    val wdata  = Input (UInt(32.W))
    val out = Output(UInt(8.W))*/
  })
  val rf = Mem(NUM_REG, UInt(XLEN.W))    // 32个32位宽的regfile
  
  // 读
//  io.rdata1 = Mux(io.raddr1 === 0.U, 0, rf(io.rdata1))
//  io.rdata2 = Mux(io.raddr2 === 0.U, 0, rf(io.rdata2))
  // 写
//  when(io.we && io.waddr =/= 0){
//    rf(io.wdata) := io.wdata
//  }
 rf(5) := 12.U    // 给5号寄存器来个值
// 给32个初始化成0
  BoringUtils.addSource(VecInit((0 until NUM_REG).map(i => rf(i.U))), "diffTestRegFile")
//  def read(addr: UInt) : UInt = Mux(addr === 0.U, 0.U, rf(addr))
//  def write(addr: UInt, data : UInt) = {rf(addr) := data(63, 0)}
}
