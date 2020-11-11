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
    val we     = Input (Bool())
    val waddr  = Input (UInt(ADDR_W.W))
    val wdata  = Input (UInt(XLEN.W))
  })
  val rf = Mem(NUM_REG, UInt(XLEN.W))    // 32个64位宽的regfile
  
  // 读
  io.rdata1 := Mux(io.raddr1 === 0.U, 0.U(XLEN.W), rf(io.raddr1))
  io.rdata2 := Mux(io.raddr2 === 0.U, 0.U(XLEN.W), rf(io.raddr2))
  // 写
  when(io.we && (io.waddr =/= 0.U)){
    rf(io.waddr) := io.wdata
  }
  BoringUtils.addSource(VecInit((0 to NUM_REG-1).map(i => rf(i.U))), "diffTestRegfile") // VecInit把32个rf输出包装成一个Vec输出!
  if(DEBUG_PRINT) {
    printf("RF: sp = [%x] rdata1(%d)=[%x] rdata2(%d)=[%x] wdata(%d)=[%x] we=%d\n", rf(2), io.raddr1, io.rdata1, io.raddr2, io.rdata2, io.waddr, io.wdata, io.we)
  }

}
