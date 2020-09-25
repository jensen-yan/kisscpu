package nutcore

import chisel3._
import chisel3.util._
import chisel3.util.experimental.BoringUtils

import common.constans._


class regfile extends Module{
  val io = IO(new Bundle() {
    val raddr1 = Input (UInt(ADDR_W.W))  // 自动推断地址位宽 = 5
    val raddr2 = Input (UInt(ADDR_W.W))
    val rdata1 = Output(UInt(XLEN.W))
    val rdata2 = Output(UInt(XLEN.W))
    val we     = Input (UInt(1.W))
    val waddr  = Input (UInt(ADDR_W.W))
    val wdata  = Input (UInt(XLEN.W))
  })
  val rf = Mem(NUM_REG, UInt(XLEN.W))    // 32个32位宽的regfile
  
  // 读
  io.rdata1 := Mux(io.raddr1 === 0.U, 0.U(XLEN.W), rf(io.raddr1))
  io.rdata2 := Mux(io.raddr2 === 0.U, 0.U(XLEN.W), rf(io.raddr2))
  // 写
  when(io.we.toBool() && io.waddr =/= 0.U){
    rf(io.wdata) := io.wdata
  }
  // VecInit((0 until NUM_REG).map(i => rf(i.U)))
  BoringUtils.addSource(VecInit((0 to NUM_REG-1).map(i => rf(i.U))), "diffTestRegfile")
//  def read(addr: UInt) : UInt = Mux(addr === 0.U, 0.U, rf(addr))
//  def write(addr: UInt, data : UInt) = {rf(addr) := data(63, 0)}
}
