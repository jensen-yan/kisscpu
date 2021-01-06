package nutcore.exe

import chisel3._
import chisel3.util._
import common.{DataReadIO, DataWriteIO}
import common.constans._
import nutcore.{CtlToDatIo, Ds_to_es, Es_to_ds, Es_to_ms, alu}

class ExecuteIO extends Bundle{
  val ms_allowin  = Input(Bool())
  val es_allowin  = Output(Bool())

  val ds_to_es    = Flipped(new Ds_to_es)
  val es_to_ms    = new Es_to_ms
  // 前递到ds
  val es_to_ds    = new Es_to_ds

  val dataReadIO  = new DataReadIO
  val dataWriteIO = new DataWriteIO
  val ctl         = Flipped(new CtlToDatIo)
}

class Execute extends Module{
  val io = IO(new ExecuteIO)

  // Execute State, 18个
  val es_valid = RegInit(false.B)
  val exe_reg_inst = RegInit(BUBBLE)
  val exe_reg_pc = RegInit(0.asUInt(XLEN.W))
  val exe_reg_wbaddr = Reg(UInt(5.W))
  val exe_reg_rs1_addr = Reg(UInt(5.W))
  val exe_reg_rs2_addr = Reg(UInt(5.W))
  val exe_reg_op1_data = Reg(UInt(XLEN.W))
  val exe_reg_op2_data = Reg(UInt(XLEN.W))
  val exe_reg_rs2_data = Reg(UInt(XLEN.W))
  val exe_reg_ctrl_op2_sel = Reg(UInt())
  val exe_reg_ctrl_alu_fun = Reg(UInt())
  val exe_reg_ctrl_wb_sel = Reg(UInt())
  val exe_reg_ctrl_rf_wen = RegInit(false.B)
  val exe_reg_ctrl_mem_ren = RegInit(false.B)
  val exe_reg_ctrl_mem_wen = RegInit(false.B)
  val exe_reg_ctrl_mem_mask = RegInit(MSK_X)
  val exe_reg_ctrl_mem_ext = RegInit(EXT_X)

  //bus
  val ds_to_es_valid  = io.ds_to_es.ds_to_es_valid

  //******************************************************************************************************
  // Execute Stage
  val es_ready_go = true.B
  io.es_allowin := !es_valid || es_ready_go && io.ms_allowin
  val es_to_ms_valid = es_valid && es_ready_go
  when(io.es_allowin) {
    es_valid := ds_to_es_valid
  }
  when(ds_to_es_valid && io.es_allowin) {
    // 传递流水线reg
    exe_reg_pc       := io.ds_to_es.dec_reg_pc
    exe_reg_rs1_addr := io.ds_to_es.dec_rs1_addr
    exe_reg_rs2_addr := io.ds_to_es.dec_rs2_addr
    exe_reg_op1_data := io.ds_to_es.dec_op1_data
    exe_reg_op2_data := io.ds_to_es.dec_op2_data
    exe_reg_rs2_data := io.ds_to_es.dec_rs2_data
    exe_reg_inst     := io.ds_to_es.dec_reg_inst
    exe_reg_wbaddr   := io.ds_to_es.dec_wbaddr

    // TODO: ctrl 传过来的信号等价于dec传过来的吧
    exe_reg_ctrl_op2_sel  := io.ctl.op2_sel
    exe_reg_ctrl_alu_fun  := io.ctl.alu_fun
    exe_reg_ctrl_wb_sel   := io.ctl.wb_sel
    exe_reg_ctrl_rf_wen   := io.ctl.rf_wen
    exe_reg_ctrl_mem_ren  := io.ctl.mem_ren
    exe_reg_ctrl_mem_wen  := io.ctl.mem_wen
    exe_reg_ctrl_mem_mask := io.ctl.mem_mask
    exe_reg_ctrl_mem_ext  := io.ctl.mem_ext
  }


  val exe_alu_op1 = exe_reg_op1_data.asUInt()
  val exe_alu_op2 = exe_reg_op2_data.asUInt()

  // ALU
  val alu = Module(new alu)
  alu.io.alu_op := exe_reg_ctrl_alu_fun // 这里应该用decode缓存一次的func!
  alu.io.src1 := exe_alu_op1
  alu.io.src2 := exe_alu_op2
  //  exe_alu_out := alu.io.result

  val exe_pc_plus4 = (exe_reg_pc + 4.U) (XLEN - 1, 0)

  // 为了保证exe 前递到dec的信号正确, 需要提前判断
  val exe_alu_out = Wire(UInt(XLEN.W))
  exe_alu_out := MuxCase(alu.io.result, Array(
    (exe_reg_ctrl_wb_sel === WB_ALU) -> alu.io.result,
    (exe_reg_ctrl_wb_sel === WB_ALUW)-> Cat(Fill(32, alu.io.result(31)), alu.io.result(31,0)),
    (exe_reg_ctrl_wb_sel === WB_PC4) -> exe_pc_plus4   // 不用管mem
  ))

  // datapath to data memory outputs 在执行级!
  val memWriteData = MuxCase(exe_reg_rs2_data, Array(
    (exe_reg_ctrl_mem_mask === MSK_B)  -> Fill(8, exe_reg_rs2_data( 7,0)),
    (exe_reg_ctrl_mem_mask === MSK_H)  -> Fill(4, exe_reg_rs2_data(15,0)),
    (exe_reg_ctrl_mem_mask === MSK_W)  -> Fill(2, exe_reg_rs2_data(31,0)),
    (exe_reg_ctrl_mem_mask === MSK_D)  ->         exe_reg_rs2_data,
  ))    // 对于lb, 扩展8次来写入
  val memWriteMask = Wire(UInt(8.W))
  memWriteMask := (exe_reg_ctrl_mem_mask << exe_alu_out(2,0))(7,0)      // 类似strb信号, 根据地址后3位来确定写入位置

  io.dataWriteIO.en := es_valid && exe_reg_ctrl_mem_wen   // 当前es有效且为 store指令
  io.dataWriteIO.addr := exe_alu_out.asUInt()   // 写地址为执行级alu结果
  io.dataWriteIO.data := memWriteData       // 写值为rs2的值(包括前递信号), 例如sw, 不是写入op2!
  io.dataWriteIO.mask := memWriteMask    // TODO: 删除多余的信号
  printf("dataStore:addr = [%x] en=%d data = [%x] mask = %b\n ", io.dataWriteIO.addr, io.dataWriteIO.en, io.dataWriteIO.data, io.dataWriteIO.mask)


  // TODO: dataRead, dataWrite 的en, addr 应该是同一个值! 要简化一下
  io.dataReadIO.en    := es_valid && exe_reg_ctrl_mem_ren  // 或者为1也行
  io.dataReadIO.addr  := exe_alu_out.asUInt()

  printf("dataRead: addr = [%x] en = %d data = [%x]\n", io.dataReadIO.addr, io.dataReadIO.en, io.dataReadIO.data);



  printf("EXE: valid = %d pc=[%x] inst=[%x] \n", es_valid, exe_reg_pc, exe_reg_inst)


  // to ms bus
  io.es_to_ms.es_to_ms_valid        := es_to_ms_valid
  io.es_to_ms.exe_reg_pc            := exe_reg_pc
  io.es_to_ms.exe_reg_inst          := exe_reg_inst
  io.es_to_ms.exe_alu_out           := exe_alu_out
  io.es_to_ms.exe_reg_wbaddr        := exe_reg_wbaddr
  io.es_to_ms.exe_reg_rs1_addr      := exe_reg_rs1_addr
  io.es_to_ms.exe_reg_rs2_addr      := exe_reg_rs2_addr
  io.es_to_ms.exe_reg_op1_data      := exe_reg_op1_data
  io.es_to_ms.exe_reg_op2_data      := exe_reg_op2_data
  io.es_to_ms.exe_reg_rs2_data      := exe_reg_rs2_data
  io.es_to_ms.exe_reg_ctrl_rf_wen   := exe_reg_ctrl_rf_wen
  io.es_to_ms.exe_reg_ctrl_mem_mask := exe_reg_ctrl_mem_mask
  io.es_to_ms.exe_reg_ctrl_mem_ext  := exe_reg_ctrl_mem_ext
  io.es_to_ms.exe_reg_ctrl_wb_sel   := exe_reg_ctrl_wb_sel
  io.es_to_ms.mem_rdata             := io.dataReadIO.data   // 注意, 实际上等下一拍才能读出

  // to ds bus
  io.es_to_ds.es_valid              := es_valid
  io.es_to_ds.exe_reg_ctrl_mem_ren  := exe_reg_ctrl_mem_ren
  io.es_to_ds.exe_reg_wbaddr        := exe_reg_wbaddr
  io.es_to_ds.exe_alu_out           := exe_alu_out
  io.es_to_ds.exe_reg_ctrl_rf_wen   := exe_reg_ctrl_rf_wen
}
