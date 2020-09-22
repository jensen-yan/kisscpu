module cpath(
  input         clock,
  input         reset,
  input  [63:0] io_dat_inst,
  output [1:0]  io_ctl_op1_sel,
  output [3:0]  io_ctl_alu_fun,
  output        io_ctl_rf_wen
);
  wire [63:0] _T = io_dat_inst & 64'h7f; // @[Lookup.scala 31:38]
  wire  cs0_2 = 64'h37 == _T; // @[Lookup.scala 31:38]
  wire [1:0] cs_op1_sel = cs0_2 ? 2'h1 : 2'h0; // @[Lookup.scala 33:37]
  wire [3:0] cs0_0 = cs0_2 ? 4'hb : 4'h0; // @[Lookup.scala 33:37]
  wire  _T_3 = ~reset; // @[cpath.scala 62:9]
  assign io_ctl_op1_sel = cs0_2 ? 2'h1 : 2'h0; // @[cpath.scala 56:19]
  assign io_ctl_alu_fun = cs0_2 ? 4'hb : 4'h0; // @[cpath.scala 58:19]
  assign io_ctl_rf_wen = 64'h37 == _T; // @[cpath.scala 60:19]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_3) begin
          $fwrite(32'h80000002,"stall=[%d] pc_sel=[%d] op1=[%d] op2=[%d] alu=[%d] wb=[%d] rf_wen=[%d]\n",1'h0,3'h0,cs_op1_sel,2'h0,cs0_0,2'h0,cs0_2); // @[cpath.scala 62:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module alu(
  input         clock,
  input         reset,
  input  [3:0]  io_alu_op,
  input  [63:0] io_src1,
  input  [63:0] io_src2,
  output [63:0] io_result
);
  wire [4:0] shamt = io_src2[4:0]; // @[alu.scala 18:22]
  wire  _T = io_alu_op == 4'h1; // @[alu.scala 23:9]
  wire [63:0] _T_2 = io_src1 + io_src2; // @[alu.scala 23:31]
  wire  _T_3 = io_alu_op == 4'h2; // @[alu.scala 24:9]
  wire [63:0] _T_5 = io_src1 - io_src2; // @[alu.scala 24:31]
  wire  _T_6 = io_alu_op == 4'h6; // @[alu.scala 25:9]
  wire [63:0] _T_7 = io_src1 & io_src2; // @[alu.scala 25:31]
  wire  _T_8 = io_alu_op == 4'h7; // @[alu.scala 26:9]
  wire [63:0] _T_9 = io_src1 | io_src2; // @[alu.scala 26:31]
  wire  _T_10 = io_alu_op == 4'h8; // @[alu.scala 27:9]
  wire [63:0] _T_11 = io_src1 ^ io_src2; // @[alu.scala 27:31]
  wire  _T_12 = io_alu_op == 4'h9; // @[alu.scala 28:9]
  wire  _T_15 = $signed(io_src1) < $signed(io_src2); // @[alu.scala 28:40]
  wire  _T_16 = io_alu_op == 4'ha; // @[alu.scala 29:9]
  wire  _T_17 = io_src1 < io_src2; // @[alu.scala 29:31]
  wire  _T_18 = io_alu_op == 4'h3; // @[alu.scala 30:9]
  wire [94:0] _GEN_0 = {{31'd0}, io_src1}; // @[alu.scala 30:31]
  wire [94:0] _T_19 = _GEN_0 << shamt; // @[alu.scala 30:31]
  wire  _T_21 = io_alu_op == 4'h5; // @[alu.scala 31:9]
  wire [63:0] _T_24 = $signed(io_src1) >>> shamt; // @[alu.scala 31:56]
  wire  _T_25 = io_alu_op == 4'h4; // @[alu.scala 32:9]
  wire [63:0] _T_26 = io_src1 >> shamt; // @[alu.scala 32:31]
  wire  _T_27 = io_alu_op == 4'hb; // @[alu.scala 33:9]
  wire [63:0] _T_28 = _T_27 ? io_src1 : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] _T_29 = _T_25 ? _T_26 : _T_28; // @[Mux.scala 98:16]
  wire [63:0] _T_30 = _T_21 ? _T_24 : _T_29; // @[Mux.scala 98:16]
  wire [63:0] _T_31 = _T_18 ? _T_19[63:0] : _T_30; // @[Mux.scala 98:16]
  wire [63:0] _T_32 = _T_16 ? {{63'd0}, _T_17} : _T_31; // @[Mux.scala 98:16]
  wire [63:0] _T_33 = _T_12 ? {{63'd0}, _T_15} : _T_32; // @[Mux.scala 98:16]
  wire [63:0] _T_34 = _T_10 ? _T_11 : _T_33; // @[Mux.scala 98:16]
  wire [63:0] _T_35 = _T_8 ? _T_9 : _T_34; // @[Mux.scala 98:16]
  wire [63:0] _T_36 = _T_6 ? _T_7 : _T_35; // @[Mux.scala 98:16]
  wire [63:0] _T_37 = _T_3 ? _T_5 : _T_36; // @[Mux.scala 98:16]
  wire  _T_40 = ~reset; // @[alu.scala 36:9]
  assign io_result = _T ? _T_2 : _T_37; // @[alu.scala 22:13]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_40) begin
          $fwrite(32'h80000002,"alu debug: func = %d, src1=[%x] src2=[%x] result=[%x]\n",io_alu_op,io_src1,io_src2,io_result); // @[alu.scala 36:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module dpath(
  input         clock,
  input         reset,
  input  [1:0]  io_ctl_op1_sel,
  input  [3:0]  io_ctl_alu_fun,
  input         io_ctl_rf_wen,
  output [63:0] io_dat_inst,
  output [63:0] io_instReadIO_addr,
  input  [63:0] io_instReadIO_data,
  output [63:0] io_dataWriteIO_addr,
  output [63:0] io_dataWriteIO_data,
  output [63:0] _T_41_0_0,
  output [63:0] _T_41_0_1,
  output [63:0] _T_41_0_2,
  output [63:0] _T_41_0_3,
  output [63:0] _T_41_0_4,
  output [63:0] _T_41_0_5,
  output [63:0] _T_41_0_6,
  output [63:0] _T_41_0_7,
  output [63:0] _T_41_0_8,
  output [63:0] _T_41_0_9,
  output [63:0] _T_41_0_10,
  output [63:0] _T_41_0_11,
  output [63:0] _T_41_0_12,
  output [63:0] _T_41_0_13,
  output [63:0] _T_41_0_14,
  output [63:0] _T_41_0_15,
  output [63:0] _T_41_0_16,
  output [63:0] _T_41_0_17,
  output [63:0] _T_41_0_18,
  output [63:0] _T_41_0_19,
  output [63:0] _T_41_0_20,
  output [63:0] _T_41_0_21,
  output [63:0] _T_41_0_22,
  output [63:0] _T_41_0_23,
  output [63:0] _T_41_0_24,
  output [63:0] _T_41_0_25,
  output [63:0] _T_41_0_26,
  output [63:0] _T_41_0_27,
  output [63:0] _T_41_0_28,
  output [63:0] _T_41_0_29,
  output [63:0] _T_41_0_30,
  output [63:0] _T_41_0_31,
  output [63:0] pc_reg_0
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] regfile2 [0:31]; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_6_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_6_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_8_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_8_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_9_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_9_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_10_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_10_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_11_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_11_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_12_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_12_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_13_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_13_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_14_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_14_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_15_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_15_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_16_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_16_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_17_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_17_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_18_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_18_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_19_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_19_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_20_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_20_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_21_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_21_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_22_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_22_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_23_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_23_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_24_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_24_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_25_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_25_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_26_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_26_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_27_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_27_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_28_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_28_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_29_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_29_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_30_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_30_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_31_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_31_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_32_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_32_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_33_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_33_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_34_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_34_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_35_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_35_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_36_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_36_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_37_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_37_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_38_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_38_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_39_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_39_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_40_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_40_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_93_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_93_addr; // @[dpath.scala 61:21]
  wire [63:0] regfile2__T_4_data; // @[dpath.scala 61:21]
  wire [4:0] regfile2__T_4_addr; // @[dpath.scala 61:21]
  wire  regfile2__T_4_mask; // @[dpath.scala 61:21]
  wire  regfile2__T_4_en; // @[dpath.scala 61:21]
  wire  alu_clock; // @[dpath.scala 114:19]
  wire  alu_reset; // @[dpath.scala 114:19]
  wire [3:0] alu_io_alu_op; // @[dpath.scala 114:19]
  wire [63:0] alu_io_src1; // @[dpath.scala 114:19]
  wire [63:0] alu_io_src2; // @[dpath.scala 114:19]
  wire [63:0] alu_io_result; // @[dpath.scala 114:19]
  reg [63:0] pc_reg; // @[dpath.scala 39:23]
  wire [63:0] pc_plus4 = pc_reg + 64'h8; // @[dpath.scala 42:23]
  wire [4:0] rs1_addr = io_instReadIO_data[19:15]; // @[dpath.scala 53:22]
  wire [4:0] rs2_addr = io_instReadIO_data[24:20]; // @[dpath.scala 54:22]
  wire [4:0] wb_addr = io_instReadIO_data[11:7]; // @[dpath.scala 55:22]
  wire  _T_2 = wb_addr != 5'h0; // @[dpath.scala 63:28]
  wire [63:0] alu_out = alu_io_result; // @[dpath.scala 113:23 dpath.scala 118:17]
  wire  _T_7 = rs2_addr != 5'h0; // @[dpath.scala 68:32]
  wire [63:0] rs2_data = _T_7 ? regfile2__T_8_data : 64'h0; // @[dpath.scala 68:21]
  wire [19:0] imm_u = io_instReadIO_data[31:12]; // @[dpath.scala 76:19]
  wire [31:0] _T_74 = imm_u[19] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [51:0] _T_76 = {_T_74,imm_u}; // @[Cat.scala 29:58]
  wire [63:0] alu_op1 = {_T_74,imm_u,12'h0}; // @[Cat.scala 29:58]
  wire  _T_78 = ~reset; // @[dpath.scala 101:9]
  wire [63:0] _T_41_0 = regfile2__T_9_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_1 = regfile2__T_10_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_2 = regfile2__T_11_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_3 = regfile2__T_12_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_4 = regfile2__T_13_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_5 = regfile2__T_14_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_6 = regfile2__T_15_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_7 = regfile2__T_16_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_8 = regfile2__T_17_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_9 = regfile2__T_18_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_10 = regfile2__T_19_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_11 = regfile2__T_20_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_12 = regfile2__T_21_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_13 = regfile2__T_22_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_14 = regfile2__T_23_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_15 = regfile2__T_24_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_16 = regfile2__T_25_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_17 = regfile2__T_26_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_18 = regfile2__T_27_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_19 = regfile2__T_28_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_20 = regfile2__T_29_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_21 = regfile2__T_30_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_22 = regfile2__T_31_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_23 = regfile2__T_32_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_24 = regfile2__T_33_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_25 = regfile2__T_34_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_26 = regfile2__T_35_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_27 = regfile2__T_36_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_28 = regfile2__T_37_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_29 = regfile2__T_38_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_30 = regfile2__T_39_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  wire [63:0] _T_41_31 = regfile2__T_40_data; // @[dpath.scala 69:32 dpath.scala 69:32]
  alu alu ( // @[dpath.scala 114:19]
    .clock(alu_clock),
    .reset(alu_reset),
    .io_alu_op(alu_io_alu_op),
    .io_src1(alu_io_src1),
    .io_src2(alu_io_src2),
    .io_result(alu_io_result)
  );
  assign regfile2__T_6_addr = io_instReadIO_data[19:15];
  assign regfile2__T_6_data = regfile2[regfile2__T_6_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_8_addr = io_instReadIO_data[24:20];
  assign regfile2__T_8_data = regfile2[regfile2__T_8_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_9_addr = 5'h0;
  assign regfile2__T_9_data = regfile2[regfile2__T_9_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_10_addr = 5'h1;
  assign regfile2__T_10_data = regfile2[regfile2__T_10_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_11_addr = 5'h2;
  assign regfile2__T_11_data = regfile2[regfile2__T_11_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_12_addr = 5'h3;
  assign regfile2__T_12_data = regfile2[regfile2__T_12_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_13_addr = 5'h4;
  assign regfile2__T_13_data = regfile2[regfile2__T_13_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_14_addr = 5'h5;
  assign regfile2__T_14_data = regfile2[regfile2__T_14_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_15_addr = 5'h6;
  assign regfile2__T_15_data = regfile2[regfile2__T_15_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_16_addr = 5'h7;
  assign regfile2__T_16_data = regfile2[regfile2__T_16_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_17_addr = 5'h8;
  assign regfile2__T_17_data = regfile2[regfile2__T_17_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_18_addr = 5'h9;
  assign regfile2__T_18_data = regfile2[regfile2__T_18_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_19_addr = 5'ha;
  assign regfile2__T_19_data = regfile2[regfile2__T_19_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_20_addr = 5'hb;
  assign regfile2__T_20_data = regfile2[regfile2__T_20_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_21_addr = 5'hc;
  assign regfile2__T_21_data = regfile2[regfile2__T_21_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_22_addr = 5'hd;
  assign regfile2__T_22_data = regfile2[regfile2__T_22_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_23_addr = 5'he;
  assign regfile2__T_23_data = regfile2[regfile2__T_23_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_24_addr = 5'hf;
  assign regfile2__T_24_data = regfile2[regfile2__T_24_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_25_addr = 5'h10;
  assign regfile2__T_25_data = regfile2[regfile2__T_25_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_26_addr = 5'h11;
  assign regfile2__T_26_data = regfile2[regfile2__T_26_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_27_addr = 5'h12;
  assign regfile2__T_27_data = regfile2[regfile2__T_27_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_28_addr = 5'h13;
  assign regfile2__T_28_data = regfile2[regfile2__T_28_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_29_addr = 5'h14;
  assign regfile2__T_29_data = regfile2[regfile2__T_29_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_30_addr = 5'h15;
  assign regfile2__T_30_data = regfile2[regfile2__T_30_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_31_addr = 5'h16;
  assign regfile2__T_31_data = regfile2[regfile2__T_31_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_32_addr = 5'h17;
  assign regfile2__T_32_data = regfile2[regfile2__T_32_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_33_addr = 5'h18;
  assign regfile2__T_33_data = regfile2[regfile2__T_33_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_34_addr = 5'h19;
  assign regfile2__T_34_data = regfile2[regfile2__T_34_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_35_addr = 5'h1a;
  assign regfile2__T_35_data = regfile2[regfile2__T_35_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_36_addr = 5'h1b;
  assign regfile2__T_36_data = regfile2[regfile2__T_36_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_37_addr = 5'h1c;
  assign regfile2__T_37_data = regfile2[regfile2__T_37_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_38_addr = 5'h1d;
  assign regfile2__T_38_data = regfile2[regfile2__T_38_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_39_addr = 5'h1e;
  assign regfile2__T_39_data = regfile2[regfile2__T_39_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_40_addr = 5'h1f;
  assign regfile2__T_40_data = regfile2[regfile2__T_40_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_93_addr = 5'h5;
  assign regfile2__T_93_data = regfile2[regfile2__T_93_addr]; // @[dpath.scala 61:21]
  assign regfile2__T_4_data = alu_io_result;
  assign regfile2__T_4_addr = io_instReadIO_data[11:7];
  assign regfile2__T_4_mask = 1'h1;
  assign regfile2__T_4_en = io_ctl_rf_wen & _T_2;
  assign io_dat_inst = io_instReadIO_data; // @[dpath.scala 149:17]
  assign io_instReadIO_addr = pc_reg; // @[dpath.scala 47:22]
  assign io_dataWriteIO_addr = alu_io_result; // @[dpath.scala 155:23]
  assign io_dataWriteIO_data = _T_7 ? regfile2__T_8_data : 64'h0; // @[dpath.scala 156:23]
  assign _T_41_0_0 = _T_41_0;
  assign _T_41_0_1 = _T_41_1;
  assign _T_41_0_2 = _T_41_2;
  assign _T_41_0_3 = _T_41_3;
  assign _T_41_0_4 = _T_41_4;
  assign _T_41_0_5 = _T_41_5;
  assign _T_41_0_6 = _T_41_6;
  assign _T_41_0_7 = _T_41_7;
  assign _T_41_0_8 = _T_41_8;
  assign _T_41_0_9 = _T_41_9;
  assign _T_41_0_10 = _T_41_10;
  assign _T_41_0_11 = _T_41_11;
  assign _T_41_0_12 = _T_41_12;
  assign _T_41_0_13 = _T_41_13;
  assign _T_41_0_14 = _T_41_14;
  assign _T_41_0_15 = _T_41_15;
  assign _T_41_0_16 = _T_41_16;
  assign _T_41_0_17 = _T_41_17;
  assign _T_41_0_18 = _T_41_18;
  assign _T_41_0_19 = _T_41_19;
  assign _T_41_0_20 = _T_41_20;
  assign _T_41_0_21 = _T_41_21;
  assign _T_41_0_22 = _T_41_22;
  assign _T_41_0_23 = _T_41_23;
  assign _T_41_0_24 = _T_41_24;
  assign _T_41_0_25 = _T_41_25;
  assign _T_41_0_26 = _T_41_26;
  assign _T_41_0_27 = _T_41_27;
  assign _T_41_0_28 = _T_41_28;
  assign _T_41_0_29 = _T_41_29;
  assign _T_41_0_30 = _T_41_30;
  assign _T_41_0_31 = _T_41_31;
  assign pc_reg_0 = pc_reg;
  assign alu_clock = clock;
  assign alu_reset = reset;
  assign alu_io_alu_op = io_ctl_alu_fun; // @[dpath.scala 115:17]
  assign alu_io_src1 = {_T_76,12'h0}; // @[dpath.scala 116:17]
  assign alu_io_src2 = _T_7 ? regfile2__T_8_data : 64'h0; // @[dpath.scala 117:17]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    regfile2[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {2{`RANDOM}};
  pc_reg = _RAND_1[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(regfile2__T_4_en & regfile2__T_4_mask) begin
      regfile2[regfile2__T_4_addr] <= regfile2__T_4_data; // @[dpath.scala 61:21]
    end
    if (reset) begin
      pc_reg <= 64'h80000000;
    end else begin
      pc_reg <= pc_plus4;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_78) begin
          $fwrite(32'h80000002,"imm_u  = [%x] sel=[%d] op1=[%x]\n",alu_op1,io_ctl_op1_sel,alu_op1); // @[dpath.scala 101:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_78) begin
          $fwrite(32'h80000002,"alu2 debug: func = %d, src1=[%x] src2=[%x] result=[%x]\n",io_ctl_alu_fun,alu_op1,rs2_data,alu_out); // @[dpath.scala 119:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_78) begin
          $fwrite(32'h80000002,"pc=[%x] W[r%d=%x][%d] Op1=[r%d][%x] Op2=[r%d][%x] inst=[%x] op1=[%x] op2=[%x] fun = [%d] out=[%x] addr=[%x] wb_data=[%x] rf[5] = [%x]\n",pc_reg,wb_addr,alu_out,io_ctl_rf_wen,rs1_addr,alu_op1,rs2_addr,rs2_data,io_instReadIO_data,alu_op1,rs2_data,io_ctl_alu_fun,alu_out,wb_addr,alu_out,regfile2__T_93_data); // @[dpath.scala 160:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module top(
  input         clock,
  input         reset,
  output [63:0] io_instReadIO_addr,
  input  [63:0] io_instReadIO_data,
  output [63:0] io_dataWriteIO_addr,
  output [63:0] io_dataWriteIO_data,
  output [63:0] _T_41_0,
  output [63:0] _T_41_1,
  output [63:0] _T_41_2,
  output [63:0] _T_41_3,
  output [63:0] _T_41_4,
  output [63:0] _T_41_5,
  output [63:0] _T_41_6,
  output [63:0] _T_41_7,
  output [63:0] _T_41_8,
  output [63:0] _T_41_9,
  output [63:0] _T_41_10,
  output [63:0] _T_41_11,
  output [63:0] _T_41_12,
  output [63:0] _T_41_13,
  output [63:0] _T_41_14,
  output [63:0] _T_41_15,
  output [63:0] _T_41_16,
  output [63:0] _T_41_17,
  output [63:0] _T_41_18,
  output [63:0] _T_41_19,
  output [63:0] _T_41_20,
  output [63:0] _T_41_21,
  output [63:0] _T_41_22,
  output [63:0] _T_41_23,
  output [63:0] _T_41_24,
  output [63:0] _T_41_25,
  output [63:0] _T_41_26,
  output [63:0] _T_41_27,
  output [63:0] _T_41_28,
  output [63:0] _T_41_29,
  output [63:0] _T_41_30,
  output [63:0] _T_41_31,
  output [63:0] pc_reg
);
  wire  cpath_clock; // @[top.scala 15:21]
  wire  cpath_reset; // @[top.scala 15:21]
  wire [63:0] cpath_io_dat_inst; // @[top.scala 15:21]
  wire [1:0] cpath_io_ctl_op1_sel; // @[top.scala 15:21]
  wire [3:0] cpath_io_ctl_alu_fun; // @[top.scala 15:21]
  wire  cpath_io_ctl_rf_wen; // @[top.scala 15:21]
  wire  dpath_clock; // @[top.scala 16:21]
  wire  dpath_reset; // @[top.scala 16:21]
  wire [1:0] dpath_io_ctl_op1_sel; // @[top.scala 16:21]
  wire [3:0] dpath_io_ctl_alu_fun; // @[top.scala 16:21]
  wire  dpath_io_ctl_rf_wen; // @[top.scala 16:21]
  wire [63:0] dpath_io_dat_inst; // @[top.scala 16:21]
  wire [63:0] dpath_io_instReadIO_addr; // @[top.scala 16:21]
  wire [63:0] dpath_io_instReadIO_data; // @[top.scala 16:21]
  wire [63:0] dpath_io_dataWriteIO_addr; // @[top.scala 16:21]
  wire [63:0] dpath_io_dataWriteIO_data; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_0; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_1; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_2; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_3; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_4; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_5; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_6; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_7; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_8; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_9; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_10; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_11; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_12; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_13; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_14; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_15; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_16; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_17; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_18; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_19; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_20; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_21; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_22; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_23; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_24; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_25; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_26; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_27; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_28; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_29; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_30; // @[top.scala 16:21]
  wire [63:0] dpath__T_41_0_31; // @[top.scala 16:21]
  wire [63:0] dpath_pc_reg_0; // @[top.scala 16:21]
  cpath cpath ( // @[top.scala 15:21]
    .clock(cpath_clock),
    .reset(cpath_reset),
    .io_dat_inst(cpath_io_dat_inst),
    .io_ctl_op1_sel(cpath_io_ctl_op1_sel),
    .io_ctl_alu_fun(cpath_io_ctl_alu_fun),
    .io_ctl_rf_wen(cpath_io_ctl_rf_wen)
  );
  dpath dpath ( // @[top.scala 16:21]
    .clock(dpath_clock),
    .reset(dpath_reset),
    .io_ctl_op1_sel(dpath_io_ctl_op1_sel),
    .io_ctl_alu_fun(dpath_io_ctl_alu_fun),
    .io_ctl_rf_wen(dpath_io_ctl_rf_wen),
    .io_dat_inst(dpath_io_dat_inst),
    .io_instReadIO_addr(dpath_io_instReadIO_addr),
    .io_instReadIO_data(dpath_io_instReadIO_data),
    .io_dataWriteIO_addr(dpath_io_dataWriteIO_addr),
    .io_dataWriteIO_data(dpath_io_dataWriteIO_data),
    ._T_41_0_0(dpath__T_41_0_0),
    ._T_41_0_1(dpath__T_41_0_1),
    ._T_41_0_2(dpath__T_41_0_2),
    ._T_41_0_3(dpath__T_41_0_3),
    ._T_41_0_4(dpath__T_41_0_4),
    ._T_41_0_5(dpath__T_41_0_5),
    ._T_41_0_6(dpath__T_41_0_6),
    ._T_41_0_7(dpath__T_41_0_7),
    ._T_41_0_8(dpath__T_41_0_8),
    ._T_41_0_9(dpath__T_41_0_9),
    ._T_41_0_10(dpath__T_41_0_10),
    ._T_41_0_11(dpath__T_41_0_11),
    ._T_41_0_12(dpath__T_41_0_12),
    ._T_41_0_13(dpath__T_41_0_13),
    ._T_41_0_14(dpath__T_41_0_14),
    ._T_41_0_15(dpath__T_41_0_15),
    ._T_41_0_16(dpath__T_41_0_16),
    ._T_41_0_17(dpath__T_41_0_17),
    ._T_41_0_18(dpath__T_41_0_18),
    ._T_41_0_19(dpath__T_41_0_19),
    ._T_41_0_20(dpath__T_41_0_20),
    ._T_41_0_21(dpath__T_41_0_21),
    ._T_41_0_22(dpath__T_41_0_22),
    ._T_41_0_23(dpath__T_41_0_23),
    ._T_41_0_24(dpath__T_41_0_24),
    ._T_41_0_25(dpath__T_41_0_25),
    ._T_41_0_26(dpath__T_41_0_26),
    ._T_41_0_27(dpath__T_41_0_27),
    ._T_41_0_28(dpath__T_41_0_28),
    ._T_41_0_29(dpath__T_41_0_29),
    ._T_41_0_30(dpath__T_41_0_30),
    ._T_41_0_31(dpath__T_41_0_31),
    .pc_reg_0(dpath_pc_reg_0)
  );
  assign io_instReadIO_addr = dpath_io_instReadIO_addr; // @[top.scala 19:17]
  assign io_dataWriteIO_addr = dpath_io_dataWriteIO_addr; // @[top.scala 21:18]
  assign io_dataWriteIO_data = dpath_io_dataWriteIO_data; // @[top.scala 21:18]
  assign _T_41_0 = dpath__T_41_0_0;
  assign _T_41_1 = dpath__T_41_0_1;
  assign _T_41_2 = dpath__T_41_0_2;
  assign _T_41_3 = dpath__T_41_0_3;
  assign _T_41_4 = dpath__T_41_0_4;
  assign _T_41_5 = dpath__T_41_0_5;
  assign _T_41_6 = dpath__T_41_0_6;
  assign _T_41_7 = dpath__T_41_0_7;
  assign _T_41_8 = dpath__T_41_0_8;
  assign _T_41_9 = dpath__T_41_0_9;
  assign _T_41_10 = dpath__T_41_0_10;
  assign _T_41_11 = dpath__T_41_0_11;
  assign _T_41_12 = dpath__T_41_0_12;
  assign _T_41_13 = dpath__T_41_0_13;
  assign _T_41_14 = dpath__T_41_0_14;
  assign _T_41_15 = dpath__T_41_0_15;
  assign _T_41_16 = dpath__T_41_0_16;
  assign _T_41_17 = dpath__T_41_0_17;
  assign _T_41_18 = dpath__T_41_0_18;
  assign _T_41_19 = dpath__T_41_0_19;
  assign _T_41_20 = dpath__T_41_0_20;
  assign _T_41_21 = dpath__T_41_0_21;
  assign _T_41_22 = dpath__T_41_0_22;
  assign _T_41_23 = dpath__T_41_0_23;
  assign _T_41_24 = dpath__T_41_0_24;
  assign _T_41_25 = dpath__T_41_0_25;
  assign _T_41_26 = dpath__T_41_0_26;
  assign _T_41_27 = dpath__T_41_0_27;
  assign _T_41_28 = dpath__T_41_0_28;
  assign _T_41_29 = dpath__T_41_0_29;
  assign _T_41_30 = dpath__T_41_0_30;
  assign _T_41_31 = dpath__T_41_0_31;
  assign pc_reg = dpath_pc_reg_0;
  assign cpath_clock = clock;
  assign cpath_reset = reset;
  assign cpath_io_dat_inst = dpath_io_dat_inst; // @[top.scala 25:16]
  assign dpath_clock = clock;
  assign dpath_reset = reset;
  assign dpath_io_ctl_op1_sel = cpath_io_ctl_op1_sel; // @[top.scala 24:16]
  assign dpath_io_ctl_alu_fun = cpath_io_ctl_alu_fun; // @[top.scala 24:16]
  assign dpath_io_ctl_rf_wen = cpath_io_ctl_rf_wen; // @[top.scala 24:16]
  assign dpath_io_instReadIO_data = io_instReadIO_data; // @[top.scala 19:17]
endmodule
module simTop(
  input         clock,
  input         reset,
  output [63:0] io_diffTestIO_regfile_0,
  output [63:0] io_diffTestIO_regfile_1,
  output [63:0] io_diffTestIO_regfile_2,
  output [63:0] io_diffTestIO_regfile_3,
  output [63:0] io_diffTestIO_regfile_4,
  output [63:0] io_diffTestIO_regfile_5,
  output [63:0] io_diffTestIO_regfile_6,
  output [63:0] io_diffTestIO_regfile_7,
  output [63:0] io_diffTestIO_regfile_8,
  output [63:0] io_diffTestIO_regfile_9,
  output [63:0] io_diffTestIO_regfile_10,
  output [63:0] io_diffTestIO_regfile_11,
  output [63:0] io_diffTestIO_regfile_12,
  output [63:0] io_diffTestIO_regfile_13,
  output [63:0] io_diffTestIO_regfile_14,
  output [63:0] io_diffTestIO_regfile_15,
  output [63:0] io_diffTestIO_regfile_16,
  output [63:0] io_diffTestIO_regfile_17,
  output [63:0] io_diffTestIO_regfile_18,
  output [63:0] io_diffTestIO_regfile_19,
  output [63:0] io_diffTestIO_regfile_20,
  output [63:0] io_diffTestIO_regfile_21,
  output [63:0] io_diffTestIO_regfile_22,
  output [63:0] io_diffTestIO_regfile_23,
  output [63:0] io_diffTestIO_regfile_24,
  output [63:0] io_diffTestIO_regfile_25,
  output [63:0] io_diffTestIO_regfile_26,
  output [63:0] io_diffTestIO_regfile_27,
  output [63:0] io_diffTestIO_regfile_28,
  output [63:0] io_diffTestIO_regfile_29,
  output [63:0] io_diffTestIO_regfile_30,
  output [63:0] io_diffTestIO_regfile_31,
  output [63:0] io_diffTestIO_PC,
  output [63:0] io_topIO_instReadIO_addr,
  input  [63:0] io_topIO_instReadIO_data,
  output        io_topIO_instReadIO_en,
  output [63:0] io_topIO_dataReadIO_addr,
  input  [63:0] io_topIO_dataReadIO_data,
  output        io_topIO_dataReadIO_en,
  output [63:0] io_topIO_dataWriteIO_addr,
  output [63:0] io_topIO_dataWriteIO_data,
  output        io_topIO_dataWriteIO_en
);
  wire  mycoretop_clock; // @[simTop.scala 15:25]
  wire  mycoretop_reset; // @[simTop.scala 15:25]
  wire [63:0] mycoretop_io_instReadIO_addr; // @[simTop.scala 15:25]
  wire [63:0] mycoretop_io_instReadIO_data; // @[simTop.scala 15:25]
  wire [63:0] mycoretop_io_dataWriteIO_addr; // @[simTop.scala 15:25]
  wire [63:0] mycoretop_io_dataWriteIO_data; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_0; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_1; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_2; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_3; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_4; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_5; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_6; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_7; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_8; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_9; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_10; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_11; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_12; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_13; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_14; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_15; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_16; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_17; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_18; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_19; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_20; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_21; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_22; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_23; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_24; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_25; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_26; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_27; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_28; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_29; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_30; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_41_31; // @[simTop.scala 15:25]
  wire [63:0] mycoretop_pc_reg; // @[simTop.scala 15:25]
  top mycoretop ( // @[simTop.scala 15:25]
    .clock(mycoretop_clock),
    .reset(mycoretop_reset),
    .io_instReadIO_addr(mycoretop_io_instReadIO_addr),
    .io_instReadIO_data(mycoretop_io_instReadIO_data),
    .io_dataWriteIO_addr(mycoretop_io_dataWriteIO_addr),
    .io_dataWriteIO_data(mycoretop_io_dataWriteIO_data),
    ._T_41_0(mycoretop__T_41_0),
    ._T_41_1(mycoretop__T_41_1),
    ._T_41_2(mycoretop__T_41_2),
    ._T_41_3(mycoretop__T_41_3),
    ._T_41_4(mycoretop__T_41_4),
    ._T_41_5(mycoretop__T_41_5),
    ._T_41_6(mycoretop__T_41_6),
    ._T_41_7(mycoretop__T_41_7),
    ._T_41_8(mycoretop__T_41_8),
    ._T_41_9(mycoretop__T_41_9),
    ._T_41_10(mycoretop__T_41_10),
    ._T_41_11(mycoretop__T_41_11),
    ._T_41_12(mycoretop__T_41_12),
    ._T_41_13(mycoretop__T_41_13),
    ._T_41_14(mycoretop__T_41_14),
    ._T_41_15(mycoretop__T_41_15),
    ._T_41_16(mycoretop__T_41_16),
    ._T_41_17(mycoretop__T_41_17),
    ._T_41_18(mycoretop__T_41_18),
    ._T_41_19(mycoretop__T_41_19),
    ._T_41_20(mycoretop__T_41_20),
    ._T_41_21(mycoretop__T_41_21),
    ._T_41_22(mycoretop__T_41_22),
    ._T_41_23(mycoretop__T_41_23),
    ._T_41_24(mycoretop__T_41_24),
    ._T_41_25(mycoretop__T_41_25),
    ._T_41_26(mycoretop__T_41_26),
    ._T_41_27(mycoretop__T_41_27),
    ._T_41_28(mycoretop__T_41_28),
    ._T_41_29(mycoretop__T_41_29),
    ._T_41_30(mycoretop__T_41_30),
    ._T_41_31(mycoretop__T_41_31),
    .pc_reg(mycoretop_pc_reg)
  );
  assign io_diffTestIO_regfile_0 = mycoretop__T_41_0;
  assign io_diffTestIO_regfile_1 = mycoretop__T_41_1;
  assign io_diffTestIO_regfile_2 = mycoretop__T_41_2;
  assign io_diffTestIO_regfile_3 = mycoretop__T_41_3;
  assign io_diffTestIO_regfile_4 = mycoretop__T_41_4;
  assign io_diffTestIO_regfile_5 = mycoretop__T_41_5;
  assign io_diffTestIO_regfile_6 = mycoretop__T_41_6;
  assign io_diffTestIO_regfile_7 = mycoretop__T_41_7;
  assign io_diffTestIO_regfile_8 = mycoretop__T_41_8;
  assign io_diffTestIO_regfile_9 = mycoretop__T_41_9;
  assign io_diffTestIO_regfile_10 = mycoretop__T_41_10;
  assign io_diffTestIO_regfile_11 = mycoretop__T_41_11;
  assign io_diffTestIO_regfile_12 = mycoretop__T_41_12;
  assign io_diffTestIO_regfile_13 = mycoretop__T_41_13;
  assign io_diffTestIO_regfile_14 = mycoretop__T_41_14;
  assign io_diffTestIO_regfile_15 = mycoretop__T_41_15;
  assign io_diffTestIO_regfile_16 = mycoretop__T_41_16;
  assign io_diffTestIO_regfile_17 = mycoretop__T_41_17;
  assign io_diffTestIO_regfile_18 = mycoretop__T_41_18;
  assign io_diffTestIO_regfile_19 = mycoretop__T_41_19;
  assign io_diffTestIO_regfile_20 = mycoretop__T_41_20;
  assign io_diffTestIO_regfile_21 = mycoretop__T_41_21;
  assign io_diffTestIO_regfile_22 = mycoretop__T_41_22;
  assign io_diffTestIO_regfile_23 = mycoretop__T_41_23;
  assign io_diffTestIO_regfile_24 = mycoretop__T_41_24;
  assign io_diffTestIO_regfile_25 = mycoretop__T_41_25;
  assign io_diffTestIO_regfile_26 = mycoretop__T_41_26;
  assign io_diffTestIO_regfile_27 = mycoretop__T_41_27;
  assign io_diffTestIO_regfile_28 = mycoretop__T_41_28;
  assign io_diffTestIO_regfile_29 = mycoretop__T_41_29;
  assign io_diffTestIO_regfile_30 = mycoretop__T_41_30;
  assign io_diffTestIO_regfile_31 = mycoretop__T_41_31;
  assign io_diffTestIO_PC = mycoretop_pc_reg;
  assign io_topIO_instReadIO_addr = mycoretop_io_instReadIO_addr; // @[simTop.scala 20:12]
  assign io_topIO_instReadIO_en = 1'h1; // @[simTop.scala 20:12]
  assign io_topIO_dataReadIO_addr = 64'h0; // @[simTop.scala 20:12]
  assign io_topIO_dataReadIO_en = 1'h0; // @[simTop.scala 20:12]
  assign io_topIO_dataWriteIO_addr = mycoretop_io_dataWriteIO_addr; // @[simTop.scala 20:12]
  assign io_topIO_dataWriteIO_data = mycoretop_io_dataWriteIO_data; // @[simTop.scala 20:12]
  assign io_topIO_dataWriteIO_en = 1'h1; // @[simTop.scala 20:12]
  assign mycoretop_clock = clock;
  assign mycoretop_reset = reset;
  assign mycoretop_io_instReadIO_data = io_topIO_instReadIO_data; // @[simTop.scala 20:12]
endmodule
