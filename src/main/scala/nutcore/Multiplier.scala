package nutcore

import scala.language.reflectiveCalls

import chisel3._
import chisel3.util._

// This file is copied from https://github.com/phantom-v/phvntom

trait phvntomParams {
  val xlen          = 64
  val bitWidth      = log2Ceil(xlen)
  val regNum        = 32
  val regWidth      = log2Ceil(regNum)
  val diffTest      = true
  val pipeTrace     = false
  val rtThread      = true
  val only_M        = false
  val validVABits   = 39
  val hasL2Cache    = true
  val bpuEntryBits  = 8
  val historyBits   = 4 // TODO >= 4
  val predictorBits = 2 // TODO Do NOT Modify
  val cachiLine     = 4
  val cachiBlock    = 64
  val traceBPU      = false

  val True  = true.B
  val False = false.B

  val startAddr = "h80000000".U

  // io.pcSelect
  val pcPlus4  = 0.U(2.W)
  val pcBranch = 1.U(2.W)
  val pcJump   = 2.U(2.W)
  val pcEPC    = 3.U(2.W)
  val pcSelectBits = pcPlus4.getWidth

  // ImmExt.io.instType
  val instXXX = 0.U(4.W)
  val IType   = 1.U(4.W)
  val SType   = 2.U(4.W)
  val BType   = 3.U(4.W)
  val UType   = 4.U(4.W)
  val JType   = 5.U(4.W)
  val ZType   = 6.U(4.W) // Zicsr
  val MType   = 7.U(4.W)
  val AType   = 8.U(4.W)
  val Illegal = 9.U(4.W)
  val instBits = instXXX.getWidth

  // BrCond.io.brType
  val brXXX    = 0.U(3.W)
  val beqType  = 1.U(3.W)
  val bneType  = 2.U(3.W)
  val bltType  = 3.U(3.W)
  val bgeType  = 4.U(3.W)
  val bltuType = 5.U(3.W)
  val bgeuType = 6.U(3.W)
  val brBits = brXXX.getWidth

  // io.ASelect
  val AXXX = 0.U(2.W)
  val APC  = 1.U(2.W)
  val ARS1 = 2.U(2.W)
  val ASelectBits = AXXX.getWidth


  // io.BSelect
  val BXXX = 0.U(2.W)
  val BIMM = 1.U(2.W)
  val BRS2 = 2.U(2.W)
  val BSelectBits = BXXX.getWidth

  // ALU.io.aluType
  val aluXXX      =  0.U(5.W)
  val aluADD      =  1.U(5.W)
  val aluSUB      =  2.U(5.W)
  val aluSLL      =  3.U(5.W)
  val aluSLT      =  4.U(5.W)
  val aluSLTU     =  5.U(5.W)
  val aluXOR      =  6.U(5.W)
  val aluSRL      =  7.U(5.W)
  val aluSRA      =  8.U(5.W)
  val aluOR       =  9.U(5.W)
  val aluAND      = 10.U(5.W)
  val aluCPA      = 11.U(5.W)
  val aluCPB      = 12.U(5.W)
  val aluADDW     = 13.U(5.W)
  val aluSUBW     = 14.U(5.W)
  val aluSLLW     = 15.U(5.W)
  val aluSRLW     = 16.U(5.W)
  val aluSRAW     = 17.U(5.W)
  val aluMUL      = 18.U(5.W)
  val aluMULH     = 19.U(5.W)
  val aluMULHSU   = 20.U(5.W)
  val aluMULHU    = 21.U(5.W)
  val aluDIV      = 22.U(5.W)
  val aluDIVU     = 23.U(5.W)
  val aluREM      = 24.U(5.W)
  val aluREMU     = 25.U(5.W)
  val aluMULW     = 26.U(5.W)
  val aluDIVW     = 27.U(5.W)
  val aluDIVUW    = 28.U(5.W)
  val aluREMW     = 29.U(5.W)
  val aluREMUW    = 30.U(5.W)
  val aluBits = aluXXX.getWidth

  // io.memType
  val memXXX    = 0.U(3.W)
  val memByte   = 1.U(3.W)
  val memHalf   = 2.U(3.W)
  val memWord   = 3.U(3.W)
  val memDouble = 4.U(3.W)
  val memByteU  = 5.U(3.W)
  val memHalfU  = 6.U(3.W)
  val memWordU  = 7.U(3.W)
  val memBits   = memXXX.getWidth

  // io.wbEnable
  val wenXXX  = 0.U(3.W)
  val wenReg  = 1.U(3.W)
  val wenMem  = 2.U(3.W)
  val wenCSRW = 3.U(3.W)
  val wenCSRS = 4.U(3.W)
  val wenCSRC = 5.U(3.W)
  val wenRes  = 6.U(3.W)
  val wenBits = wenXXX.getWidth

  // io.wbSelect
  val wbXXX = 0.U(3.W)
  val wbALU = 1.U(3.W)
  val wbMEM = 2.U(3.W)
  val wbPC  = 3.U(3.W)
  val wbCSR = 4.U(3.W)
  val wbCond = 5.U(3.W)
  val wbBits = wbXXX.getWidth

  // io.amoSelect
  val amoXXX  = 0.U(4.W)
  val amoSWAP = 1.U(4.W)
  val amoADD  = 2.U(4.W)
  val amoAND  = 3.U(4.W)
  val amoOR   = 4.U(4.W)
  val amoXOR  = 6.U(4.W)
  val amoMAX  = 7.U(4.W)
  val amoMAXU = 8.U(4.W)
  val amoMIN  = 9.U(4.W)
  val amoMINU = 10.U(4.W)
  val amoBits = amoXXX.getWidth

  val fwdXXX    = 3.U(2.W)
  val fwdMem1   = 0.U(2.W)
  val fwdMem2   = 1.U(2.W)
  val fwdWb     = 2.U(2.W)
  val fwdBits   = fwdXXX.getWidth

  val flushXXX  = "b00".U(2.W)
  val flushI    = "b01".U(2.W)
  val flushTLB  = "b10".U(2.W)
  val flushAll  = "b11".U(2.W)
  val flushBits = flushXXX.getWidth

  // sign extend or unsigned extend
  val unsignedExt = 0.U(1.W)
  val signedExt = 1.U(1.W)
  val extBits = unsignedExt.getWidth

  // Following is From riscv-sodor:
  // The Bubble Instruction (Machine generated NOP)
  // Insert (XOR x0,x0,x0) which is different from software compiler
  // generated NOPs which are (ADDI x0, x0, 0).
  // Reasoning for this is to let visualizers and stat-trackers differentiate
  // between software NOPs and machine-generated Bubbles in the pipeline.
  val BUBBLE  = "b00000000000000000100000000110011".U(32.W)  // 0x000004033

  val TRMT    = "b00000000000100000000000001110011".U(32.W)  // ebreak
  
}

class MultiplierIO extends Bundle with phvntomParams {
  val start = Input(Bool())
  val a = Input(UInt(xlen.W))
  val b = Input(UInt(xlen.W))
  val op = Input(UInt(aluBits.W))
  val stall_req = Output(Bool())
  val mult_out = Output(UInt(xlen.W))
}

class Multiplier extends Module with phvntomParams {
  val io = IO(new Bundle{
    val start = Input(Bool())
    val a = Input(UInt(xlen.W))
    val b = Input(UInt(xlen.W))
    val op = Input(UInt(aluBits.W))
    val stall_req = Output(Bool())
    val mult_out = Output(UInt(xlen.W))
    
  })

  def resemble_op(op: UInt, op_history: UInt): Bool = {
    (((op_history === aluMULHU || op_history === aluMULH || op_history === aluMULHSU) && op === aluMUL) ||
      (op_history === aluDIV && op === aluREM) ||
      (op_history === aluDIVU && op === aluREMU) ||
      (op_history === aluDIVUW && op === aluREMUW) ||
      (op_history === aluDIVW && op === aluREMW) ||
      (op === aluDIV && op_history === aluREM) ||
      (op === aluDIVU && op_history === aluREMU) ||
      (op === aluDIVUW && op_history === aluREMUW) ||
      (op === aluDIVW && op_history === aluREMW))
  }

  def check_history_same(a: UInt, b: UInt, op: UInt, ha: UInt, hb: UInt, hop: UInt): Bool = {
    a === ha && b === hb && resemble_op(op, hop)
  }

  val last_a = RegInit(UInt(xlen.W), 0.U)
  val last_b = RegInit(UInt(xlen.W), 0.U)
  val last_op = RegInit(UInt(aluBits.W), aluXXX)

  when(io.start) {
    last_a := io.a
    last_b := io.b
    last_op := io.op
  }

  val is_mult = io.op === aluMUL || io.op === aluMULH || io.op === aluMULHSU || io.op === aluMULHU || io.op === aluMULW
  val res = RegInit(UInt(128.W), 0.U)
  val mult_cnt = RegInit(UInt(log2Ceil(xlen + 1).W), 0.U)
  val div_cnt = RegInit(UInt(log2Ceil(xlen + 1).W), 0.U)
  val sign_a = io.a(xlen - 1)
  val sign_wa = io.a(31)
  val abs_a = MuxLookup(io.op, Cat(Fill(32, 0.U), io.a(31, 0)),
    Seq(
      aluMUL -> io.a,
      aluMULH -> Mux(io.a(xlen - 1), ((~io.a) + 1.U), io.a),
      aluMULHSU -> Mux(io.a(xlen - 1), ((~io.a) + 1.U), io.a),
      aluMULHU -> io.a,
      aluMULW -> Cat(Fill(32, 0.U), io.a(31, 0)),
      aluDIV -> Mux(io.a(xlen - 1), ((~io.a) + 1.U), io.a),
      aluDIVU -> io.a,
      aluDIVW -> Cat(Fill(32, 0.U), Mux(io.a(31), ((~io.a) + 1.U)(31, 0), io.a(31, 0))),
      aluDIVUW -> Cat(Fill(32, 0.U), io.a(31, 0)),
      aluREM -> Mux(io.a(xlen - 1), ((~io.a) + 1.U), io.a),
      aluREMU -> io.a,
      aluREMW -> Cat(Fill(32, 0.U), Mux(io.a(31), ((~io.a) + 1.U)(31, 0), io.a(31, 0))),
      aluREMUW -> Cat(Fill(32, 0.U), io.a(31, 0))
    )
  )

//  printf("MUL a:%x, b:%x, out:%x, op:%x, start:%x, stall_req:%x, cnt:%x\n", io.a, io.b, io.mult_out, io.op, io.start, io.stall_req, mult_cnt)

  val sign_b = io.b(xlen - 1)
  val sign_wb = io.b(31)
  val abs_b = MuxLookup(io.op, Cat(Fill(32, 0.U), io.b(31, 0)),
    Seq(
      aluMUL -> io.b,
      aluMULH -> Mux(io.b(xlen - 1), ((~io.b) + 1.U), io.b),
      aluMULHSU -> io.b,
      aluMULHU -> io.b,
      aluMULW -> Cat(Fill(32, 0.U), io.b(31, 0)),
      aluDIV -> Mux(io.b(xlen - 1), ((~io.b) + 1.U), io.b),
      aluDIVU -> io.b,
      aluDIVW -> Cat(Fill(32, 0.U), Mux(io.b(31), ((~io.b) + 1.U)(31, 0), io.b(31, 0))),
      aluDIVUW -> Cat(Fill(32, 0.U), io.b(31, 0)),
      aluREM -> Mux(io.b(xlen - 1), ((~io.b) + 1.U), io.b),
      aluREMU -> io.b,
      aluREMW -> Cat(Fill(32, 0.U), Mux(io.b(31), ((~io.b) + 1.U)(31, 0), io.b(31, 0))),
      aluREMUW -> Cat(Fill(32, 0.U), io.b(31, 0))
    )
  )
  val res_ss = Mux(sign_a === sign_b, res, ((~res) + 1.U))
  val res_su = Mux(sign_a === 0.U, res, ((~res) + 1.U))
  val res_divs = Mux(sign_a === sign_b, res(xlen - 1, 0), ((~res(xlen - 1, 0)) + 1.U))
  val res_rems = Mux(sign_a === 0.U, res(2 * xlen - 1, xlen), ((~res(2 * xlen - 1, xlen)) + 1.U))
  val res_divsw = Mux(sign_wa === sign_wb, res(31, 0), ((~res(31, 0)) + 1.U))
  val res_remsw = Mux(sign_a === 0.U, res(xlen + 31, xlen), ((~res(xlen + 31, xlen)) + 1.U))
  val last_stall_req = RegInit(Bool(), false.B)
  val step_result = WireInit(UInt((2 * xlen).W), 0.U)
  val front_val = WireInit(UInt((xlen + 1).W), 0.U)

  last_stall_req := io.stall_req

  when(io.start) {
    when(is_mult) {
      when (io.stall_req) {
        mult_cnt := mult_cnt + 1.U
      }.otherwise {
        mult_cnt := 0.U
      }
      when(io.stall_req) {
        when(!last_stall_req) {
          res := Cat(Fill(xlen, 0.U), abs_b)
        }.otherwise {
          res := Cat(front_val(xlen), step_result(2 * xlen - 1, 1))
        }
      }
    }.otherwise {
      when (io.stall_req) {
        div_cnt := div_cnt + 1.U
      }.otherwise {
        div_cnt := 0.U
      }
      when(io.stall_req) {
        when(!last_stall_req) {
          res := Cat(Fill(xlen - 1, 0.U), abs_a, Fill(1, 0.U))
        }.elsewhen(div_cnt === xlen.U) {
          res := Cat(front_val(xlen - 1), step_result(2 * xlen - 1, xlen + 1), step_result(xlen - 1, 0))
        }.otherwise {
          res := step_result
        }
      }

    }
  }

  // TODO a more advanced multiplication algorithm needs implementing, 65 cycles are too long
  // TODO additionally, div_cnt and mult_cnt are separated because I want to accelerate MULT

  when(is_mult) {
    front_val := Cat(Fill(1, 0.U), Mux(res(0), abs_a, 0.U(xlen.W))) + Cat(Fill(1, 0.U), res(2 * xlen - 1, xlen))
    step_result := Cat(front_val(xlen - 1, 0), res(xlen - 1, 0))
    io.stall_req := io.start && (mult_cnt =/= (xlen + 1).U || (!last_stall_req && !check_history_same(io.a, io.b, io.op, last_a, last_b, last_op)))
    io.mult_out := MuxLookup(io.op, Cat(Fill(32, res(31)), res(31, 0)),
      Seq(
        aluMUL -> res(xlen - 1, 0),
        aluMULH -> res_ss(2 * xlen - 1, xlen),
        aluMULHSU -> res_su(2 * xlen - 1, xlen),
        aluMULHU -> res(2 * xlen - 1, xlen),
        aluMULW -> Cat(Fill(32, res(31)), res(31, 0))
      )
    )
  }.otherwise {
    front_val := Mux(res(2 * xlen - 1, xlen) >= abs_b, res(2 * xlen - 1, xlen) - abs_b, res(2 * xlen - 1, xlen))
    step_result := Cat(front_val(xlen - 2, 0), res(xlen - 1, 0), (res(2 * xlen - 1, xlen) >= abs_b).asUInt)
    io.stall_req := io.start && (div_cnt =/= (xlen + 1).U || (!last_stall_req && !check_history_same(io.a, io.b, io.op, last_a, last_b, last_op)))
    io.mult_out := MuxLookup(io.op, 0.U,
      Seq(
        aluDIV -> Mux(io.b.orR, res_divs, Fill(xlen, 1.U)),
        aluDIVU -> Mux(io.b.orR, res(xlen - 1, 0), Fill(xlen, 1.U)),
        aluDIVW -> Mux(io.b(31, 0).orR, Cat(Fill(32, res_divsw(31)), res_divsw), Fill(xlen, 1.U)),
        aluDIVUW -> Mux(io.b(31, 0).orR, Cat(Fill(32, res(31)), res(31, 0)), Fill(xlen, 1.U)),
        aluREM -> Mux(io.b.orR, res_rems, io.a),
        aluREMU -> Mux(io.b.orR, res(2 * xlen - 1, xlen), io.a),
        aluREMW -> Mux(io.b(31, 0).orR, Cat(Fill(32, res_remsw(31)), res_remsw), io.a),
        aluREMUW -> Mux(io.b(31, 0).orR, Cat(Fill(32, res(xlen + 31)), res(xlen + 31, xlen)), io.a)
      )
    )
  }

}