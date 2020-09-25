module cpath(
  input         clock,
  input         reset,
  input  [63:0] io_dat_dec_inst,
  output [1:0]  io_ctl_op1_sel,
  output [2:0]  io_ctl_op2_sel,
  output [3:0]  io_ctl_alu_fun,
  output        io_ctl_rf_wen
);
  wire [63:0] _T = io_dat_dec_inst & 64'h707f; // @[Lookup.scala 31:38]
  wire  _T_1 = 64'h2003 == _T; // @[Lookup.scala 31:38]
  wire  _T_3 = 64'h3 == _T; // @[Lookup.scala 31:38]
  wire  _T_5 = 64'h4003 == _T; // @[Lookup.scala 31:38]
  wire  _T_7 = 64'h1003 == _T; // @[Lookup.scala 31:38]
  wire  _T_9 = 64'h5003 == _T; // @[Lookup.scala 31:38]
  wire  _T_11 = 64'h2023 == _T; // @[Lookup.scala 31:38]
  wire  _T_13 = 64'h23 == _T; // @[Lookup.scala 31:38]
  wire  _T_15 = 64'h1023 == _T; // @[Lookup.scala 31:38]
  wire [63:0] _T_16 = io_dat_dec_inst & 64'h7f; // @[Lookup.scala 31:38]
  wire  _T_17 = 64'h17 == _T_16; // @[Lookup.scala 31:38]
  wire  _T_19 = 64'h37 == _T_16; // @[Lookup.scala 31:38]
  wire  _T_21 = 64'h13 == _T; // @[Lookup.scala 31:38]
  wire  _T_23 = 64'h7013 == _T; // @[Lookup.scala 31:38]
  wire  _T_25 = 64'h6013 == _T; // @[Lookup.scala 31:38]
  wire  _T_27 = 64'h4013 == _T; // @[Lookup.scala 31:38]
  wire  _T_29 = 64'h2013 == _T; // @[Lookup.scala 31:38]
  wire  _T_31 = 64'h3013 == _T; // @[Lookup.scala 31:38]
  wire [63:0] _T_32 = io_dat_dec_inst & 64'hfc00707f; // @[Lookup.scala 31:38]
  wire  _T_33 = 64'h1013 == _T_32; // @[Lookup.scala 31:38]
  wire  _T_35 = 64'h40005013 == _T_32; // @[Lookup.scala 31:38]
  wire  _T_37 = 64'h5013 == _T_32; // @[Lookup.scala 31:38]
  wire [63:0] _T_38 = io_dat_dec_inst & 64'hfe00707f; // @[Lookup.scala 31:38]
  wire  _T_39 = 64'h1033 == _T_38; // @[Lookup.scala 31:38]
  wire  _T_41 = 64'h33 == _T_38; // @[Lookup.scala 31:38]
  wire  _T_43 = 64'h40000033 == _T_38; // @[Lookup.scala 31:38]
  wire  _T_45 = 64'h2033 == _T_38; // @[Lookup.scala 31:38]
  wire  _T_47 = 64'h3033 == _T_38; // @[Lookup.scala 31:38]
  wire  _T_49 = 64'h7033 == _T_38; // @[Lookup.scala 31:38]
  wire  _T_51 = 64'h6033 == _T_38; // @[Lookup.scala 31:38]
  wire  _T_53 = 64'h4033 == _T_38; // @[Lookup.scala 31:38]
  wire  _T_55 = 64'h40005033 == _T_38; // @[Lookup.scala 31:38]
  wire  _T_57 = 64'h5033 == _T_38; // @[Lookup.scala 31:38]
  wire  _T_59 = 64'h6f == _T_16; // @[Lookup.scala 31:38]
  wire  _T_61 = 64'h67 == _T; // @[Lookup.scala 31:38]
  wire  _T_63 = 64'h63 == _T; // @[Lookup.scala 31:38]
  wire  _T_65 = 64'h1063 == _T; // @[Lookup.scala 31:38]
  wire  _T_67 = 64'h5063 == _T; // @[Lookup.scala 31:38]
  wire  _T_69 = 64'h7063 == _T; // @[Lookup.scala 31:38]
  wire  _T_71 = 64'h4063 == _T; // @[Lookup.scala 31:38]
  wire  _T_73 = 64'h6063 == _T; // @[Lookup.scala 31:38]
  wire [1:0] _T_174 = _T_17 ? 2'h1 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] _T_175 = _T_15 ? 2'h0 : _T_174; // @[Lookup.scala 33:37]
  wire [1:0] _T_176 = _T_13 ? 2'h0 : _T_175; // @[Lookup.scala 33:37]
  wire [1:0] _T_177 = _T_11 ? 2'h0 : _T_176; // @[Lookup.scala 33:37]
  wire [1:0] _T_178 = _T_9 ? 2'h0 : _T_177; // @[Lookup.scala 33:37]
  wire [1:0] _T_179 = _T_7 ? 2'h0 : _T_178; // @[Lookup.scala 33:37]
  wire [1:0] _T_180 = _T_5 ? 2'h0 : _T_179; // @[Lookup.scala 33:37]
  wire [1:0] _T_181 = _T_3 ? 2'h0 : _T_180; // @[Lookup.scala 33:37]
  wire [1:0] cs_op1_sel = _T_1 ? 2'h0 : _T_181; // @[Lookup.scala 33:37]
  wire [2:0] _T_182 = _T_73 ? 3'h3 : 3'h0; // @[Lookup.scala 33:37]
  wire [2:0] _T_183 = _T_71 ? 3'h3 : _T_182; // @[Lookup.scala 33:37]
  wire [2:0] _T_184 = _T_69 ? 3'h3 : _T_183; // @[Lookup.scala 33:37]
  wire [2:0] _T_185 = _T_67 ? 3'h3 : _T_184; // @[Lookup.scala 33:37]
  wire [2:0] _T_186 = _T_65 ? 3'h3 : _T_185; // @[Lookup.scala 33:37]
  wire [2:0] _T_187 = _T_63 ? 3'h3 : _T_186; // @[Lookup.scala 33:37]
  wire [2:0] _T_188 = _T_61 ? 3'h1 : _T_187; // @[Lookup.scala 33:37]
  wire [2:0] _T_189 = _T_59 ? 3'h5 : _T_188; // @[Lookup.scala 33:37]
  wire [2:0] _T_190 = _T_57 ? 3'h0 : _T_189; // @[Lookup.scala 33:37]
  wire [2:0] _T_191 = _T_55 ? 3'h0 : _T_190; // @[Lookup.scala 33:37]
  wire [2:0] _T_192 = _T_53 ? 3'h0 : _T_191; // @[Lookup.scala 33:37]
  wire [2:0] _T_193 = _T_51 ? 3'h0 : _T_192; // @[Lookup.scala 33:37]
  wire [2:0] _T_194 = _T_49 ? 3'h0 : _T_193; // @[Lookup.scala 33:37]
  wire [2:0] _T_195 = _T_47 ? 3'h0 : _T_194; // @[Lookup.scala 33:37]
  wire [2:0] _T_196 = _T_45 ? 3'h0 : _T_195; // @[Lookup.scala 33:37]
  wire [2:0] _T_197 = _T_43 ? 3'h0 : _T_196; // @[Lookup.scala 33:37]
  wire [2:0] _T_198 = _T_41 ? 3'h0 : _T_197; // @[Lookup.scala 33:37]
  wire [2:0] _T_199 = _T_39 ? 3'h0 : _T_198; // @[Lookup.scala 33:37]
  wire [2:0] _T_200 = _T_37 ? 3'h1 : _T_199; // @[Lookup.scala 33:37]
  wire [2:0] _T_201 = _T_35 ? 3'h1 : _T_200; // @[Lookup.scala 33:37]
  wire [2:0] _T_202 = _T_33 ? 3'h1 : _T_201; // @[Lookup.scala 33:37]
  wire [2:0] _T_203 = _T_31 ? 3'h1 : _T_202; // @[Lookup.scala 33:37]
  wire [2:0] _T_204 = _T_29 ? 3'h1 : _T_203; // @[Lookup.scala 33:37]
  wire [2:0] _T_205 = _T_27 ? 3'h1 : _T_204; // @[Lookup.scala 33:37]
  wire [2:0] _T_206 = _T_25 ? 3'h1 : _T_205; // @[Lookup.scala 33:37]
  wire [2:0] _T_207 = _T_23 ? 3'h1 : _T_206; // @[Lookup.scala 33:37]
  wire [2:0] _T_208 = _T_21 ? 3'h1 : _T_207; // @[Lookup.scala 33:37]
  wire [2:0] _T_209 = _T_19 ? 3'h4 : _T_208; // @[Lookup.scala 33:37]
  wire [2:0] _T_210 = _T_17 ? 3'h4 : _T_209; // @[Lookup.scala 33:37]
  wire [2:0] _T_211 = _T_15 ? 3'h2 : _T_210; // @[Lookup.scala 33:37]
  wire [2:0] _T_212 = _T_13 ? 3'h2 : _T_211; // @[Lookup.scala 33:37]
  wire [2:0] _T_213 = _T_11 ? 3'h2 : _T_212; // @[Lookup.scala 33:37]
  wire [2:0] _T_214 = _T_9 ? 3'h1 : _T_213; // @[Lookup.scala 33:37]
  wire [2:0] _T_215 = _T_7 ? 3'h1 : _T_214; // @[Lookup.scala 33:37]
  wire [2:0] _T_216 = _T_5 ? 3'h1 : _T_215; // @[Lookup.scala 33:37]
  wire [2:0] _T_217 = _T_3 ? 3'h1 : _T_216; // @[Lookup.scala 33:37]
  wire [2:0] cs_op2_sel = _T_1 ? 3'h1 : _T_217; // @[Lookup.scala 33:37]
  wire [3:0] _T_298 = _T_57 ? 4'h3 : 4'h0; // @[Lookup.scala 33:37]
  wire [3:0] _T_299 = _T_55 ? 4'h4 : _T_298; // @[Lookup.scala 33:37]
  wire [3:0] _T_300 = _T_53 ? 4'h7 : _T_299; // @[Lookup.scala 33:37]
  wire [3:0] _T_301 = _T_51 ? 4'h6 : _T_300; // @[Lookup.scala 33:37]
  wire [3:0] _T_302 = _T_49 ? 4'h5 : _T_301; // @[Lookup.scala 33:37]
  wire [3:0] _T_303 = _T_47 ? 4'h9 : _T_302; // @[Lookup.scala 33:37]
  wire [3:0] _T_304 = _T_45 ? 4'h8 : _T_303; // @[Lookup.scala 33:37]
  wire [3:0] _T_305 = _T_43 ? 4'h1 : _T_304; // @[Lookup.scala 33:37]
  wire [3:0] _T_306 = _T_41 ? 4'h0 : _T_305; // @[Lookup.scala 33:37]
  wire [3:0] _T_307 = _T_39 ? 4'h2 : _T_306; // @[Lookup.scala 33:37]
  wire [3:0] _T_308 = _T_37 ? 4'h3 : _T_307; // @[Lookup.scala 33:37]
  wire [3:0] _T_309 = _T_35 ? 4'h4 : _T_308; // @[Lookup.scala 33:37]
  wire [3:0] _T_310 = _T_33 ? 4'h2 : _T_309; // @[Lookup.scala 33:37]
  wire [3:0] _T_311 = _T_31 ? 4'h9 : _T_310; // @[Lookup.scala 33:37]
  wire [3:0] _T_312 = _T_29 ? 4'h8 : _T_311; // @[Lookup.scala 33:37]
  wire [3:0] _T_313 = _T_27 ? 4'h7 : _T_312; // @[Lookup.scala 33:37]
  wire [3:0] _T_314 = _T_25 ? 4'h6 : _T_313; // @[Lookup.scala 33:37]
  wire [3:0] _T_315 = _T_23 ? 4'h5 : _T_314; // @[Lookup.scala 33:37]
  wire [3:0] _T_316 = _T_21 ? 4'h0 : _T_315; // @[Lookup.scala 33:37]
  wire [3:0] _T_317 = _T_19 ? 4'hb : _T_316; // @[Lookup.scala 33:37]
  wire [3:0] _T_318 = _T_17 ? 4'h0 : _T_317; // @[Lookup.scala 33:37]
  wire [3:0] _T_319 = _T_15 ? 4'h0 : _T_318; // @[Lookup.scala 33:37]
  wire [3:0] _T_320 = _T_13 ? 4'h0 : _T_319; // @[Lookup.scala 33:37]
  wire [3:0] _T_321 = _T_11 ? 4'h0 : _T_320; // @[Lookup.scala 33:37]
  wire [3:0] _T_322 = _T_9 ? 4'h0 : _T_321; // @[Lookup.scala 33:37]
  wire [3:0] _T_323 = _T_7 ? 4'h0 : _T_322; // @[Lookup.scala 33:37]
  wire [3:0] _T_324 = _T_5 ? 4'h0 : _T_323; // @[Lookup.scala 33:37]
  wire [3:0] _T_325 = _T_3 ? 4'h0 : _T_324; // @[Lookup.scala 33:37]
  wire [3:0] cs0_0 = _T_1 ? 4'h0 : _T_325; // @[Lookup.scala 33:37]
  wire [1:0] _T_332 = _T_61 ? 2'h2 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] _T_333 = _T_59 ? 2'h2 : _T_332; // @[Lookup.scala 33:37]
  wire [1:0] _T_334 = _T_57 ? 2'h0 : _T_333; // @[Lookup.scala 33:37]
  wire [1:0] _T_335 = _T_55 ? 2'h0 : _T_334; // @[Lookup.scala 33:37]
  wire [1:0] _T_336 = _T_53 ? 2'h0 : _T_335; // @[Lookup.scala 33:37]
  wire [1:0] _T_337 = _T_51 ? 2'h0 : _T_336; // @[Lookup.scala 33:37]
  wire [1:0] _T_338 = _T_49 ? 2'h0 : _T_337; // @[Lookup.scala 33:37]
  wire [1:0] _T_339 = _T_47 ? 2'h0 : _T_338; // @[Lookup.scala 33:37]
  wire [1:0] _T_340 = _T_45 ? 2'h0 : _T_339; // @[Lookup.scala 33:37]
  wire [1:0] _T_341 = _T_43 ? 2'h0 : _T_340; // @[Lookup.scala 33:37]
  wire [1:0] _T_342 = _T_41 ? 2'h0 : _T_341; // @[Lookup.scala 33:37]
  wire [1:0] _T_343 = _T_39 ? 2'h0 : _T_342; // @[Lookup.scala 33:37]
  wire [1:0] _T_344 = _T_37 ? 2'h0 : _T_343; // @[Lookup.scala 33:37]
  wire [1:0] _T_345 = _T_35 ? 2'h0 : _T_344; // @[Lookup.scala 33:37]
  wire [1:0] _T_346 = _T_33 ? 2'h0 : _T_345; // @[Lookup.scala 33:37]
  wire [1:0] _T_347 = _T_31 ? 2'h0 : _T_346; // @[Lookup.scala 33:37]
  wire [1:0] _T_348 = _T_29 ? 2'h0 : _T_347; // @[Lookup.scala 33:37]
  wire [1:0] _T_349 = _T_27 ? 2'h0 : _T_348; // @[Lookup.scala 33:37]
  wire [1:0] _T_350 = _T_25 ? 2'h0 : _T_349; // @[Lookup.scala 33:37]
  wire [1:0] _T_351 = _T_23 ? 2'h0 : _T_350; // @[Lookup.scala 33:37]
  wire [1:0] _T_352 = _T_21 ? 2'h0 : _T_351; // @[Lookup.scala 33:37]
  wire [1:0] _T_353 = _T_19 ? 2'h0 : _T_352; // @[Lookup.scala 33:37]
  wire [1:0] _T_354 = _T_17 ? 2'h0 : _T_353; // @[Lookup.scala 33:37]
  wire [1:0] _T_355 = _T_15 ? 2'h0 : _T_354; // @[Lookup.scala 33:37]
  wire [1:0] _T_356 = _T_13 ? 2'h0 : _T_355; // @[Lookup.scala 33:37]
  wire [1:0] _T_357 = _T_11 ? 2'h0 : _T_356; // @[Lookup.scala 33:37]
  wire [1:0] _T_358 = _T_9 ? 2'h1 : _T_357; // @[Lookup.scala 33:37]
  wire [1:0] _T_359 = _T_7 ? 2'h1 : _T_358; // @[Lookup.scala 33:37]
  wire [1:0] _T_360 = _T_5 ? 2'h1 : _T_359; // @[Lookup.scala 33:37]
  wire [1:0] _T_361 = _T_3 ? 2'h1 : _T_360; // @[Lookup.scala 33:37]
  wire [1:0] cs0_1 = _T_1 ? 2'h1 : _T_361; // @[Lookup.scala 33:37]
  wire  _T_369 = _T_59 | _T_61; // @[Lookup.scala 33:37]
  wire  _T_370 = _T_57 | _T_369; // @[Lookup.scala 33:37]
  wire  _T_371 = _T_55 | _T_370; // @[Lookup.scala 33:37]
  wire  _T_372 = _T_53 | _T_371; // @[Lookup.scala 33:37]
  wire  _T_373 = _T_51 | _T_372; // @[Lookup.scala 33:37]
  wire  _T_374 = _T_49 | _T_373; // @[Lookup.scala 33:37]
  wire  _T_375 = _T_47 | _T_374; // @[Lookup.scala 33:37]
  wire  _T_376 = _T_45 | _T_375; // @[Lookup.scala 33:37]
  wire  _T_377 = _T_43 | _T_376; // @[Lookup.scala 33:37]
  wire  _T_378 = _T_41 | _T_377; // @[Lookup.scala 33:37]
  wire  _T_379 = _T_39 | _T_378; // @[Lookup.scala 33:37]
  wire  _T_380 = _T_37 | _T_379; // @[Lookup.scala 33:37]
  wire  _T_381 = _T_35 | _T_380; // @[Lookup.scala 33:37]
  wire  _T_382 = _T_33 | _T_381; // @[Lookup.scala 33:37]
  wire  _T_383 = _T_31 | _T_382; // @[Lookup.scala 33:37]
  wire  _T_384 = _T_29 | _T_383; // @[Lookup.scala 33:37]
  wire  _T_385 = _T_27 | _T_384; // @[Lookup.scala 33:37]
  wire  _T_386 = _T_25 | _T_385; // @[Lookup.scala 33:37]
  wire  _T_387 = _T_23 | _T_386; // @[Lookup.scala 33:37]
  wire  _T_388 = _T_21 | _T_387; // @[Lookup.scala 33:37]
  wire  _T_389 = _T_19 | _T_388; // @[Lookup.scala 33:37]
  wire  _T_390 = _T_17 | _T_389; // @[Lookup.scala 33:37]
  wire  _T_391 = _T_15 ? 1'h0 : _T_390; // @[Lookup.scala 33:37]
  wire  _T_392 = _T_13 ? 1'h0 : _T_391; // @[Lookup.scala 33:37]
  wire  _T_393 = _T_11 ? 1'h0 : _T_392; // @[Lookup.scala 33:37]
  wire  _T_394 = _T_9 | _T_393; // @[Lookup.scala 33:37]
  wire  _T_395 = _T_7 | _T_394; // @[Lookup.scala 33:37]
  wire  _T_396 = _T_5 | _T_395; // @[Lookup.scala 33:37]
  wire  _T_397 = _T_3 | _T_396; // @[Lookup.scala 33:37]
  wire  cs0_2 = _T_1 | _T_397; // @[Lookup.scala 33:37]
  wire  _T_579 = ~reset; // @[cpath.scala 103:9]
  assign io_ctl_op1_sel = _T_1 ? 2'h0 : _T_181; // @[cpath.scala 97:21]
  assign io_ctl_op2_sel = _T_1 ? 3'h1 : _T_217; // @[cpath.scala 98:21]
  assign io_ctl_alu_fun = _T_1 ? 4'h0 : _T_325; // @[cpath.scala 99:21]
  assign io_ctl_rf_wen = _T_1 | _T_397; // @[cpath.scala 101:21]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_579) begin
          $fwrite(32'h80000002,"stall=[%d] pc_sel=[%d] op1=[%d] op2=[%d] alu=[%d] wb=[%d] rf_wen=[%d]\n",1'h0,2'h0,cs_op1_sel,cs_op2_sel,cs0_0,cs0_1,cs0_2); // @[cpath.scala 103:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module regfile(
  input         clock,
  input  [5:0]  io_raddr1,
  input  [5:0]  io_raddr2,
  output [63:0] io_rdata1,
  output [63:0] io_rdata2,
  input         io_we,
  input  [5:0]  io_waddr,
  input  [63:0] io_wdata,
  output [63:0] _T_45_0_0,
  output [63:0] _T_45_0_1,
  output [63:0] _T_45_0_2,
  output [63:0] _T_45_0_3,
  output [63:0] _T_45_0_4,
  output [63:0] _T_45_0_5,
  output [63:0] _T_45_0_6,
  output [63:0] _T_45_0_7,
  output [63:0] _T_45_0_8,
  output [63:0] _T_45_0_9,
  output [63:0] _T_45_0_10,
  output [63:0] _T_45_0_11,
  output [63:0] _T_45_0_12,
  output [63:0] _T_45_0_13,
  output [63:0] _T_45_0_14,
  output [63:0] _T_45_0_15,
  output [63:0] _T_45_0_16,
  output [63:0] _T_45_0_17,
  output [63:0] _T_45_0_18,
  output [63:0] _T_45_0_19,
  output [63:0] _T_45_0_20,
  output [63:0] _T_45_0_21,
  output [63:0] _T_45_0_22,
  output [63:0] _T_45_0_23,
  output [63:0] _T_45_0_24,
  output [63:0] _T_45_0_25,
  output [63:0] _T_45_0_26,
  output [63:0] _T_45_0_27,
  output [63:0] _T_45_0_28,
  output [63:0] _T_45_0_29,
  output [63:0] _T_45_0_30,
  output [63:0] _T_45_0_31
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [63:0] rf [0:31]; // @[regfile.scala 20:15]
  wire [63:0] rf__T_2_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_2_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_6_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_6_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_13_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_13_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_14_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_14_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_15_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_15_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_16_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_16_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_17_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_17_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_18_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_18_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_19_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_19_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_20_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_20_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_21_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_21_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_22_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_22_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_23_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_23_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_24_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_24_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_25_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_25_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_26_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_26_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_27_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_27_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_28_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_28_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_29_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_29_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_30_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_30_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_31_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_31_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_32_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_32_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_33_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_33_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_34_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_34_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_35_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_35_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_36_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_36_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_37_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_37_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_38_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_38_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_39_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_39_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_40_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_40_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_41_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_41_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_42_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_42_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_43_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_43_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_44_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_44_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_12_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_12_addr; // @[regfile.scala 20:15]
  wire  rf__T_12_mask; // @[regfile.scala 20:15]
  wire  rf__T_12_en; // @[regfile.scala 20:15]
  wire  _T = io_raddr1 == 6'h0; // @[regfile.scala 23:30]
  wire  _T_4 = io_raddr2 == 6'h0; // @[regfile.scala 24:30]
  wire  _T_9 = io_waddr != 6'h0; // @[regfile.scala 26:35]
  wire [63:0] _T_45_0 = rf__T_13_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_1 = rf__T_14_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_2 = rf__T_15_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_3 = rf__T_16_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_4 = rf__T_17_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_5 = rf__T_18_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_6 = rf__T_19_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_7 = rf__T_20_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_8 = rf__T_21_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_9 = rf__T_22_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_10 = rf__T_23_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_11 = rf__T_24_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_12 = rf__T_25_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_13 = rf__T_26_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_14 = rf__T_27_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_15 = rf__T_28_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_16 = rf__T_29_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_17 = rf__T_30_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_18 = rf__T_31_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_19 = rf__T_32_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_20 = rf__T_33_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_21 = rf__T_34_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_22 = rf__T_35_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_23 = rf__T_36_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_24 = rf__T_37_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_25 = rf__T_38_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_26 = rf__T_39_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_27 = rf__T_40_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_28 = rf__T_41_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_29 = rf__T_42_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_30 = rf__T_43_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  wire [63:0] _T_45_31 = rf__T_44_data; // @[regfile.scala 30:32 regfile.scala 30:32]
  assign rf__T_2_addr = io_raddr1[4:0];
  assign rf__T_2_data = rf[rf__T_2_addr]; // @[regfile.scala 20:15]
  assign rf__T_6_addr = io_raddr2[4:0];
  assign rf__T_6_data = rf[rf__T_6_addr]; // @[regfile.scala 20:15]
  assign rf__T_13_addr = 5'h0;
  assign rf__T_13_data = rf[rf__T_13_addr]; // @[regfile.scala 20:15]
  assign rf__T_14_addr = 5'h1;
  assign rf__T_14_data = rf[rf__T_14_addr]; // @[regfile.scala 20:15]
  assign rf__T_15_addr = 5'h2;
  assign rf__T_15_data = rf[rf__T_15_addr]; // @[regfile.scala 20:15]
  assign rf__T_16_addr = 5'h3;
  assign rf__T_16_data = rf[rf__T_16_addr]; // @[regfile.scala 20:15]
  assign rf__T_17_addr = 5'h4;
  assign rf__T_17_data = rf[rf__T_17_addr]; // @[regfile.scala 20:15]
  assign rf__T_18_addr = 5'h5;
  assign rf__T_18_data = rf[rf__T_18_addr]; // @[regfile.scala 20:15]
  assign rf__T_19_addr = 5'h6;
  assign rf__T_19_data = rf[rf__T_19_addr]; // @[regfile.scala 20:15]
  assign rf__T_20_addr = 5'h7;
  assign rf__T_20_data = rf[rf__T_20_addr]; // @[regfile.scala 20:15]
  assign rf__T_21_addr = 5'h8;
  assign rf__T_21_data = rf[rf__T_21_addr]; // @[regfile.scala 20:15]
  assign rf__T_22_addr = 5'h9;
  assign rf__T_22_data = rf[rf__T_22_addr]; // @[regfile.scala 20:15]
  assign rf__T_23_addr = 5'ha;
  assign rf__T_23_data = rf[rf__T_23_addr]; // @[regfile.scala 20:15]
  assign rf__T_24_addr = 5'hb;
  assign rf__T_24_data = rf[rf__T_24_addr]; // @[regfile.scala 20:15]
  assign rf__T_25_addr = 5'hc;
  assign rf__T_25_data = rf[rf__T_25_addr]; // @[regfile.scala 20:15]
  assign rf__T_26_addr = 5'hd;
  assign rf__T_26_data = rf[rf__T_26_addr]; // @[regfile.scala 20:15]
  assign rf__T_27_addr = 5'he;
  assign rf__T_27_data = rf[rf__T_27_addr]; // @[regfile.scala 20:15]
  assign rf__T_28_addr = 5'hf;
  assign rf__T_28_data = rf[rf__T_28_addr]; // @[regfile.scala 20:15]
  assign rf__T_29_addr = 5'h10;
  assign rf__T_29_data = rf[rf__T_29_addr]; // @[regfile.scala 20:15]
  assign rf__T_30_addr = 5'h11;
  assign rf__T_30_data = rf[rf__T_30_addr]; // @[regfile.scala 20:15]
  assign rf__T_31_addr = 5'h12;
  assign rf__T_31_data = rf[rf__T_31_addr]; // @[regfile.scala 20:15]
  assign rf__T_32_addr = 5'h13;
  assign rf__T_32_data = rf[rf__T_32_addr]; // @[regfile.scala 20:15]
  assign rf__T_33_addr = 5'h14;
  assign rf__T_33_data = rf[rf__T_33_addr]; // @[regfile.scala 20:15]
  assign rf__T_34_addr = 5'h15;
  assign rf__T_34_data = rf[rf__T_34_addr]; // @[regfile.scala 20:15]
  assign rf__T_35_addr = 5'h16;
  assign rf__T_35_data = rf[rf__T_35_addr]; // @[regfile.scala 20:15]
  assign rf__T_36_addr = 5'h17;
  assign rf__T_36_data = rf[rf__T_36_addr]; // @[regfile.scala 20:15]
  assign rf__T_37_addr = 5'h18;
  assign rf__T_37_data = rf[rf__T_37_addr]; // @[regfile.scala 20:15]
  assign rf__T_38_addr = 5'h19;
  assign rf__T_38_data = rf[rf__T_38_addr]; // @[regfile.scala 20:15]
  assign rf__T_39_addr = 5'h1a;
  assign rf__T_39_data = rf[rf__T_39_addr]; // @[regfile.scala 20:15]
  assign rf__T_40_addr = 5'h1b;
  assign rf__T_40_data = rf[rf__T_40_addr]; // @[regfile.scala 20:15]
  assign rf__T_41_addr = 5'h1c;
  assign rf__T_41_data = rf[rf__T_41_addr]; // @[regfile.scala 20:15]
  assign rf__T_42_addr = 5'h1d;
  assign rf__T_42_data = rf[rf__T_42_addr]; // @[regfile.scala 20:15]
  assign rf__T_43_addr = 5'h1e;
  assign rf__T_43_data = rf[rf__T_43_addr]; // @[regfile.scala 20:15]
  assign rf__T_44_addr = 5'h1f;
  assign rf__T_44_data = rf[rf__T_44_addr]; // @[regfile.scala 20:15]
  assign rf__T_12_data = io_wdata;
  assign rf__T_12_addr = io_wdata[4:0];
  assign rf__T_12_mask = 1'h1;
  assign rf__T_12_en = io_we & _T_9;
  assign io_rdata1 = _T ? 64'h0 : rf__T_2_data; // @[regfile.scala 23:13]
  assign io_rdata2 = _T_4 ? 64'h0 : rf__T_6_data; // @[regfile.scala 24:13]
  assign _T_45_0_0 = _T_45_0;
  assign _T_45_0_1 = _T_45_1;
  assign _T_45_0_2 = _T_45_2;
  assign _T_45_0_3 = _T_45_3;
  assign _T_45_0_4 = _T_45_4;
  assign _T_45_0_5 = _T_45_5;
  assign _T_45_0_6 = _T_45_6;
  assign _T_45_0_7 = _T_45_7;
  assign _T_45_0_8 = _T_45_8;
  assign _T_45_0_9 = _T_45_9;
  assign _T_45_0_10 = _T_45_10;
  assign _T_45_0_11 = _T_45_11;
  assign _T_45_0_12 = _T_45_12;
  assign _T_45_0_13 = _T_45_13;
  assign _T_45_0_14 = _T_45_14;
  assign _T_45_0_15 = _T_45_15;
  assign _T_45_0_16 = _T_45_16;
  assign _T_45_0_17 = _T_45_17;
  assign _T_45_0_18 = _T_45_18;
  assign _T_45_0_19 = _T_45_19;
  assign _T_45_0_20 = _T_45_20;
  assign _T_45_0_21 = _T_45_21;
  assign _T_45_0_22 = _T_45_22;
  assign _T_45_0_23 = _T_45_23;
  assign _T_45_0_24 = _T_45_24;
  assign _T_45_0_25 = _T_45_25;
  assign _T_45_0_26 = _T_45_26;
  assign _T_45_0_27 = _T_45_27;
  assign _T_45_0_28 = _T_45_28;
  assign _T_45_0_29 = _T_45_29;
  assign _T_45_0_30 = _T_45_30;
  assign _T_45_0_31 = _T_45_31;
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
    rf[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(rf__T_12_en & rf__T_12_mask) begin
      rf[rf__T_12_addr] <= rf__T_12_data; // @[regfile.scala 20:15]
    end
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
  wire [5:0] shamt = io_src2[5:0]; // @[alu.scala 18:22]
  wire  _T = io_alu_op == 4'h0; // @[alu.scala 23:9]
  wire [63:0] _T_2 = io_src1 + io_src2; // @[alu.scala 23:31]
  wire  _T_3 = io_alu_op == 4'h1; // @[alu.scala 24:9]
  wire [63:0] _T_5 = io_src1 - io_src2; // @[alu.scala 24:31]
  wire  _T_6 = io_alu_op == 4'h5; // @[alu.scala 25:9]
  wire [63:0] _T_7 = io_src1 & io_src2; // @[alu.scala 25:31]
  wire  _T_8 = io_alu_op == 4'h6; // @[alu.scala 26:9]
  wire [63:0] _T_9 = io_src1 | io_src2; // @[alu.scala 26:31]
  wire  _T_10 = io_alu_op == 4'h7; // @[alu.scala 27:9]
  wire [63:0] _T_11 = io_src1 ^ io_src2; // @[alu.scala 27:31]
  wire  _T_12 = io_alu_op == 4'h8; // @[alu.scala 28:9]
  wire  _T_15 = $signed(io_src1) < $signed(io_src2); // @[alu.scala 28:40]
  wire  _T_16 = io_alu_op == 4'h9; // @[alu.scala 29:9]
  wire  _T_17 = io_src1 < io_src2; // @[alu.scala 29:31]
  wire  _T_18 = io_alu_op == 4'h2; // @[alu.scala 30:9]
  wire [126:0] _GEN_0 = {{63'd0}, io_src1}; // @[alu.scala 30:31]
  wire [126:0] _T_19 = _GEN_0 << shamt; // @[alu.scala 30:31]
  wire  _T_21 = io_alu_op == 4'h4; // @[alu.scala 31:9]
  wire [63:0] _T_24 = $signed(io_src1) >>> shamt; // @[alu.scala 31:56]
  wire  _T_25 = io_alu_op == 4'h3; // @[alu.scala 32:9]
  wire [63:0] _T_26 = io_src1 >> shamt; // @[alu.scala 32:31]
  wire  _T_27 = io_alu_op == 4'ha; // @[alu.scala 33:9]
  wire  _T_28 = io_alu_op == 4'hb; // @[alu.scala 34:9]
  wire [63:0] _T_29 = _T_28 ? io_src2 : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] _T_30 = _T_27 ? io_src1 : _T_29; // @[Mux.scala 98:16]
  wire [63:0] _T_31 = _T_25 ? _T_26 : _T_30; // @[Mux.scala 98:16]
  wire [63:0] _T_32 = _T_21 ? _T_24 : _T_31; // @[Mux.scala 98:16]
  wire [63:0] _T_33 = _T_18 ? _T_19[63:0] : _T_32; // @[Mux.scala 98:16]
  wire [63:0] _T_34 = _T_16 ? {{63'd0}, _T_17} : _T_33; // @[Mux.scala 98:16]
  wire [63:0] _T_35 = _T_12 ? {{63'd0}, _T_15} : _T_34; // @[Mux.scala 98:16]
  wire [63:0] _T_36 = _T_10 ? _T_11 : _T_35; // @[Mux.scala 98:16]
  wire [63:0] _T_37 = _T_8 ? _T_9 : _T_36; // @[Mux.scala 98:16]
  wire [63:0] _T_38 = _T_6 ? _T_7 : _T_37; // @[Mux.scala 98:16]
  wire [63:0] _T_39 = _T_3 ? _T_5 : _T_38; // @[Mux.scala 98:16]
  wire  _T_42 = ~reset; // @[alu.scala 37:9]
  assign io_result = _T ? _T_2 : _T_39; // @[alu.scala 22:13]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_42) begin
          $fwrite(32'h80000002,"alu debug: func = %d, src1=[%x] src2=[%x] result=[%x]\n",io_alu_op,io_src1,io_src2,io_result); // @[alu.scala 37:9]
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
  input  [2:0]  io_ctl_op2_sel,
  input  [3:0]  io_ctl_alu_fun,
  input         io_ctl_rf_wen,
  output [63:0] io_dat_dec_inst,
  output [63:0] io_instReadIO_addr,
  input  [63:0] io_instReadIO_data,
  output [63:0] io_dataWriteIO_addr,
  output [63:0] io_dataWriteIO_data,
  output [63:0] _T_45_0_0,
  output [63:0] _T_45_0_1,
  output [63:0] _T_45_0_2,
  output [63:0] _T_45_0_3,
  output [63:0] _T_45_0_4,
  output [63:0] _T_45_0_5,
  output [63:0] _T_45_0_6,
  output [63:0] _T_45_0_7,
  output [63:0] _T_45_0_8,
  output [63:0] _T_45_0_9,
  output [63:0] _T_45_0_10,
  output [63:0] _T_45_0_11,
  output [63:0] _T_45_0_12,
  output [63:0] _T_45_0_13,
  output [63:0] _T_45_0_14,
  output [63:0] _T_45_0_15,
  output [63:0] _T_45_0_16,
  output [63:0] _T_45_0_17,
  output [63:0] _T_45_0_18,
  output [63:0] _T_45_0_19,
  output [63:0] _T_45_0_20,
  output [63:0] _T_45_0_21,
  output [63:0] _T_45_0_22,
  output [63:0] _T_45_0_23,
  output [63:0] _T_45_0_24,
  output [63:0] _T_45_0_25,
  output [63:0] _T_45_0_26,
  output [63:0] _T_45_0_27,
  output [63:0] _T_45_0_28,
  output [63:0] _T_45_0_29,
  output [63:0] _T_45_0_30,
  output [63:0] _T_45_0_31,
  output [63:0] _T_77_0
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [63:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [63:0] _RAND_31;
  reg [63:0] _RAND_32;
`endif // RANDOMIZE_REG_INIT
  wire  regfile_clock; // @[dpath.scala 130:23]
  wire [5:0] regfile_io_raddr1; // @[dpath.scala 130:23]
  wire [5:0] regfile_io_raddr2; // @[dpath.scala 130:23]
  wire [63:0] regfile_io_rdata1; // @[dpath.scala 130:23]
  wire [63:0] regfile_io_rdata2; // @[dpath.scala 130:23]
  wire  regfile_io_we; // @[dpath.scala 130:23]
  wire [5:0] regfile_io_waddr; // @[dpath.scala 130:23]
  wire [63:0] regfile_io_wdata; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_0; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_1; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_2; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_3; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_4; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_5; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_6; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_7; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_8; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_9; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_10; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_11; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_12; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_13; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_14; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_15; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_16; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_17; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_18; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_19; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_20; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_21; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_22; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_23; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_24; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_25; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_26; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_27; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_28; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_29; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_30; // @[dpath.scala 130:23]
  wire [63:0] regfile__T_45_0_31; // @[dpath.scala 130:23]
  wire  alu_clock; // @[dpath.scala 221:19]
  wire  alu_reset; // @[dpath.scala 221:19]
  wire [3:0] alu_io_alu_op; // @[dpath.scala 221:19]
  wire [63:0] alu_io_src1; // @[dpath.scala 221:19]
  wire [63:0] alu_io_src2; // @[dpath.scala 221:19]
  wire [63:0] alu_io_result; // @[dpath.scala 221:19]
  reg [63:0] if_reg_pc; // @[dpath.scala 37:38]
  reg [63:0] dec_reg_inst; // @[dpath.scala 41:38]
  reg [63:0] dec_reg_pc; // @[dpath.scala 42:38]
  reg [63:0] exe_reg_inst; // @[dpath.scala 46:38]
  reg [63:0] exe_reg_pc; // @[dpath.scala 47:38]
  reg [4:0] exe_reg_wbaddr; // @[dpath.scala 48:34]
  reg [4:0] exe_reg_rs1_addr; // @[dpath.scala 49:34]
  reg [4:0] exe_reg_rs2_addr; // @[dpath.scala 50:34]
  reg [63:0] exe_alu_op1; // @[dpath.scala 51:34]
  reg [63:0] brjmp_offset; // @[dpath.scala 52:34]
  reg [63:0] exe_reg_rs2_data; // @[dpath.scala 53:34]
  reg [3:0] exe_reg_ctrl_alu_fun; // @[dpath.scala 56:34]
  reg  exe_reg_ctrl_rf_wen; // @[dpath.scala 58:38]
  reg [63:0] mem_reg_pc; // @[dpath.scala 66:34]
  reg [63:0] mem_reg_inst; // @[dpath.scala 67:34]
  reg [63:0] mem_reg_alu_out; // @[dpath.scala 68:34]
  reg [4:0] mem_reg_wbaddr; // @[dpath.scala 69:34]
  reg [4:0] mem_reg_rs1_addr; // @[dpath.scala 70:34]
  reg [4:0] mem_reg_rs2_addr; // @[dpath.scala 71:34]
  reg [63:0] mem_reg_op1_data; // @[dpath.scala 72:34]
  reg [63:0] mem_reg_op2_data; // @[dpath.scala 73:34]
  reg [63:0] mem_reg_rs2_data; // @[dpath.scala 74:34]
  reg  mem_reg_ctrl_rf_wen; // @[dpath.scala 75:38]
  reg [4:0] wb_reg_wbaddr; // @[dpath.scala 84:34]
  reg [63:0] wb_reg_wbdata; // @[dpath.scala 85:34]
  reg  wb_reg_ctrl_rf_wen; // @[dpath.scala 86:38]
  wire [63:0] if_pc_plus4 = if_reg_pc + 64'h8; // @[dpath.scala 98:32]
  wire [4:0] dec_rs1_addr = dec_reg_inst[19:15]; // @[dpath.scala 124:34]
  wire [4:0] dec_rs2_addr = dec_reg_inst[24:20]; // @[dpath.scala 125:34]
  wire [4:0] dec_wbaddr = dec_reg_inst[11:7]; // @[dpath.scala 126:34]
  wire [11:0] imm_itype = dec_reg_inst[31:20]; // @[dpath.scala 141:32]
  wire [11:0] imm_stype = {dec_reg_inst[31:25],dec_wbaddr}; // @[Cat.scala 29:58]
  wire [11:0] imm_sbtype = {dec_reg_inst[31],dec_reg_inst[7],dec_reg_inst[30:25],dec_reg_inst[11:8]}; // @[Cat.scala 29:58]
  wire [19:0] imm_utype = dec_reg_inst[31:12]; // @[dpath.scala 144:32]
  wire [19:0] imm_ujtype = {dec_reg_inst[31],dec_reg_inst[19:12],dec_reg_inst[20],dec_reg_inst[30:21]}; // @[Cat.scala 29:58]
  wire [31:0] imm_z = {27'h0,dec_rs1_addr}; // @[Cat.scala 29:58]
  wire [51:0] _T_25 = imm_itype[11] ? 52'hfffffffffffff : 52'h0; // @[Bitwise.scala 72:12]
  wire [63:0] imm_itype_sext = {_T_25,imm_itype}; // @[Cat.scala 29:58]
  wire [51:0] _T_28 = imm_stype[11] ? 52'hfffffffffffff : 52'h0; // @[Bitwise.scala 72:12]
  wire [63:0] imm_stype_sext = {_T_28,dec_reg_inst[31:25],dec_wbaddr}; // @[Cat.scala 29:58]
  wire [50:0] _T_31 = imm_sbtype[11] ? 51'h7ffffffffffff : 51'h0; // @[Bitwise.scala 72:12]
  wire [63:0] imm_sbtype_sext = {_T_31,dec_reg_inst[31],dec_reg_inst[7],dec_reg_inst[30:25],dec_reg_inst[11:8],1'h0}; // @[Cat.scala 29:58]
  wire [31:0] _T_35 = imm_utype[19] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] imm_utype_sext = {_T_35,imm_utype,12'h0}; // @[Cat.scala 29:58]
  wire [42:0] _T_40 = imm_ujtype[19] ? 43'h7ffffffffff : 43'h0; // @[Bitwise.scala 72:12]
  wire [63:0] imm_ujtype_sext = {_T_40,dec_reg_inst[31],dec_reg_inst[19:12],dec_reg_inst[20],dec_reg_inst[30:21],1'h0}; // @[Cat.scala 29:58]
  wire  _T_42 = io_ctl_op2_sel == 3'h0; // @[dpath.scala 162:21]
  wire  _T_43 = io_ctl_op2_sel == 3'h1; // @[dpath.scala 163:21]
  wire  _T_44 = io_ctl_op2_sel == 3'h2; // @[dpath.scala 164:21]
  wire  _T_45 = io_ctl_op2_sel == 3'h3; // @[dpath.scala 165:21]
  wire  _T_46 = io_ctl_op2_sel == 3'h4; // @[dpath.scala 166:21]
  wire  _T_47 = io_ctl_op2_sel == 3'h5; // @[dpath.scala 167:21]
  wire  _T_53 = io_ctl_op1_sel == 2'h2; // @[dpath.scala 183:22]
  wire  _T_54 = io_ctl_op1_sel == 2'h1; // @[dpath.scala 184:22]
  reg [63:0] wb_reg_inst; // @[dpath.scala 299:30]
  reg [63:0] _T_70; // @[dpath.scala 302:12]
  reg [4:0] _T_71; // @[dpath.scala 306:12]
  reg [63:0] _T_72; // @[dpath.scala 307:12]
  reg [4:0] _T_73; // @[dpath.scala 308:12]
  reg [63:0] _T_74; // @[dpath.scala 309:12]
  wire  _T_76 = ~reset; // @[dpath.scala 301:11]
  reg [63:0] _T_77; // @[dpath.scala 314:34]
  regfile regfile ( // @[dpath.scala 130:23]
    .clock(regfile_clock),
    .io_raddr1(regfile_io_raddr1),
    .io_raddr2(regfile_io_raddr2),
    .io_rdata1(regfile_io_rdata1),
    .io_rdata2(regfile_io_rdata2),
    .io_we(regfile_io_we),
    .io_waddr(regfile_io_waddr),
    .io_wdata(regfile_io_wdata),
    ._T_45_0_0(regfile__T_45_0_0),
    ._T_45_0_1(regfile__T_45_0_1),
    ._T_45_0_2(regfile__T_45_0_2),
    ._T_45_0_3(regfile__T_45_0_3),
    ._T_45_0_4(regfile__T_45_0_4),
    ._T_45_0_5(regfile__T_45_0_5),
    ._T_45_0_6(regfile__T_45_0_6),
    ._T_45_0_7(regfile__T_45_0_7),
    ._T_45_0_8(regfile__T_45_0_8),
    ._T_45_0_9(regfile__T_45_0_9),
    ._T_45_0_10(regfile__T_45_0_10),
    ._T_45_0_11(regfile__T_45_0_11),
    ._T_45_0_12(regfile__T_45_0_12),
    ._T_45_0_13(regfile__T_45_0_13),
    ._T_45_0_14(regfile__T_45_0_14),
    ._T_45_0_15(regfile__T_45_0_15),
    ._T_45_0_16(regfile__T_45_0_16),
    ._T_45_0_17(regfile__T_45_0_17),
    ._T_45_0_18(regfile__T_45_0_18),
    ._T_45_0_19(regfile__T_45_0_19),
    ._T_45_0_20(regfile__T_45_0_20),
    ._T_45_0_21(regfile__T_45_0_21),
    ._T_45_0_22(regfile__T_45_0_22),
    ._T_45_0_23(regfile__T_45_0_23),
    ._T_45_0_24(regfile__T_45_0_24),
    ._T_45_0_25(regfile__T_45_0_25),
    ._T_45_0_26(regfile__T_45_0_26),
    ._T_45_0_27(regfile__T_45_0_27),
    ._T_45_0_28(regfile__T_45_0_28),
    ._T_45_0_29(regfile__T_45_0_29),
    ._T_45_0_30(regfile__T_45_0_30),
    ._T_45_0_31(regfile__T_45_0_31)
  );
  alu alu ( // @[dpath.scala 221:19]
    .clock(alu_clock),
    .reset(alu_reset),
    .io_alu_op(alu_io_alu_op),
    .io_src1(alu_io_src1),
    .io_src2(alu_io_src2),
    .io_result(alu_io_result)
  );
  assign io_dat_dec_inst = dec_reg_inst; // @[dpath.scala 280:22]
  assign io_instReadIO_addr = if_reg_pc; // @[dpath.scala 109:22]
  assign io_dataWriteIO_addr = mem_reg_alu_out; // @[dpath.scala 288:25]
  assign io_dataWriteIO_data = mem_reg_rs2_data; // @[dpath.scala 289:25]
  assign _T_45_0_0 = regfile__T_45_0_0;
  assign _T_45_0_1 = regfile__T_45_0_1;
  assign _T_45_0_2 = regfile__T_45_0_2;
  assign _T_45_0_3 = regfile__T_45_0_3;
  assign _T_45_0_4 = regfile__T_45_0_4;
  assign _T_45_0_5 = regfile__T_45_0_5;
  assign _T_45_0_6 = regfile__T_45_0_6;
  assign _T_45_0_7 = regfile__T_45_0_7;
  assign _T_45_0_8 = regfile__T_45_0_8;
  assign _T_45_0_9 = regfile__T_45_0_9;
  assign _T_45_0_10 = regfile__T_45_0_10;
  assign _T_45_0_11 = regfile__T_45_0_11;
  assign _T_45_0_12 = regfile__T_45_0_12;
  assign _T_45_0_13 = regfile__T_45_0_13;
  assign _T_45_0_14 = regfile__T_45_0_14;
  assign _T_45_0_15 = regfile__T_45_0_15;
  assign _T_45_0_16 = regfile__T_45_0_16;
  assign _T_45_0_17 = regfile__T_45_0_17;
  assign _T_45_0_18 = regfile__T_45_0_18;
  assign _T_45_0_19 = regfile__T_45_0_19;
  assign _T_45_0_20 = regfile__T_45_0_20;
  assign _T_45_0_21 = regfile__T_45_0_21;
  assign _T_45_0_22 = regfile__T_45_0_22;
  assign _T_45_0_23 = regfile__T_45_0_23;
  assign _T_45_0_24 = regfile__T_45_0_24;
  assign _T_45_0_25 = regfile__T_45_0_25;
  assign _T_45_0_26 = regfile__T_45_0_26;
  assign _T_45_0_27 = regfile__T_45_0_27;
  assign _T_45_0_28 = regfile__T_45_0_28;
  assign _T_45_0_29 = regfile__T_45_0_29;
  assign _T_45_0_30 = regfile__T_45_0_30;
  assign _T_45_0_31 = regfile__T_45_0_31;
  assign _T_77_0 = _T_77;
  assign regfile_clock = clock;
  assign regfile_io_raddr1 = {{1'd0}, dec_rs1_addr}; // @[dpath.scala 131:21]
  assign regfile_io_raddr2 = {{1'd0}, dec_rs2_addr}; // @[dpath.scala 132:21]
  assign regfile_io_we = wb_reg_ctrl_rf_wen; // @[dpath.scala 137:20]
  assign regfile_io_waddr = {{1'd0}, wb_reg_wbaddr}; // @[dpath.scala 135:20]
  assign regfile_io_wdata = wb_reg_wbdata; // @[dpath.scala 136:20]
  assign alu_clock = clock;
  assign alu_reset = reset;
  assign alu_io_alu_op = exe_reg_ctrl_alu_fun; // @[dpath.scala 222:17]
  assign alu_io_src1 = exe_alu_op1; // @[dpath.scala 223:17]
  assign alu_io_src2 = brjmp_offset; // @[dpath.scala 224:17]
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
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  if_reg_pc = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  dec_reg_inst = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  dec_reg_pc = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  exe_reg_inst = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  exe_reg_pc = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  exe_reg_wbaddr = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  exe_reg_rs1_addr = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  exe_reg_rs2_addr = _RAND_7[4:0];
  _RAND_8 = {2{`RANDOM}};
  exe_alu_op1 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  brjmp_offset = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  exe_reg_rs2_data = _RAND_10[63:0];
  _RAND_11 = {1{`RANDOM}};
  exe_reg_ctrl_alu_fun = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  exe_reg_ctrl_rf_wen = _RAND_12[0:0];
  _RAND_13 = {2{`RANDOM}};
  mem_reg_pc = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  mem_reg_inst = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  mem_reg_alu_out = _RAND_15[63:0];
  _RAND_16 = {1{`RANDOM}};
  mem_reg_wbaddr = _RAND_16[4:0];
  _RAND_17 = {1{`RANDOM}};
  mem_reg_rs1_addr = _RAND_17[4:0];
  _RAND_18 = {1{`RANDOM}};
  mem_reg_rs2_addr = _RAND_18[4:0];
  _RAND_19 = {2{`RANDOM}};
  mem_reg_op1_data = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  mem_reg_op2_data = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  mem_reg_rs2_data = _RAND_21[63:0];
  _RAND_22 = {1{`RANDOM}};
  mem_reg_ctrl_rf_wen = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  wb_reg_wbaddr = _RAND_23[4:0];
  _RAND_24 = {2{`RANDOM}};
  wb_reg_wbdata = _RAND_24[63:0];
  _RAND_25 = {1{`RANDOM}};
  wb_reg_ctrl_rf_wen = _RAND_25[0:0];
  _RAND_26 = {2{`RANDOM}};
  wb_reg_inst = _RAND_26[63:0];
  _RAND_27 = {2{`RANDOM}};
  _T_70 = _RAND_27[63:0];
  _RAND_28 = {1{`RANDOM}};
  _T_71 = _RAND_28[4:0];
  _RAND_29 = {2{`RANDOM}};
  _T_72 = _RAND_29[63:0];
  _RAND_30 = {1{`RANDOM}};
  _T_73 = _RAND_30[4:0];
  _RAND_31 = {2{`RANDOM}};
  _T_74 = _RAND_31[63:0];
  _RAND_32 = {2{`RANDOM}};
  _T_77 = _RAND_32[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      if_reg_pc <= 64'h80000000;
    end else begin
      if_reg_pc <= if_pc_plus4;
    end
    if (reset) begin
      dec_reg_inst <= 64'h4033;
    end else begin
      dec_reg_inst <= io_instReadIO_data;
    end
    if (reset) begin
      dec_reg_pc <= 64'h0;
    end else begin
      dec_reg_pc <= if_reg_pc;
    end
    if (reset) begin
      exe_reg_inst <= 64'h4033;
    end else begin
      exe_reg_inst <= dec_reg_inst;
    end
    if (reset) begin
      exe_reg_pc <= 64'h0;
    end else begin
      exe_reg_pc <= dec_reg_pc;
    end
    exe_reg_wbaddr <= dec_reg_inst[11:7];
    exe_reg_rs1_addr <= dec_reg_inst[19:15];
    exe_reg_rs2_addr <= dec_reg_inst[24:20];
    if (_T_53) begin
      exe_alu_op1 <= {{32'd0}, imm_z};
    end else if (_T_54) begin
      exe_alu_op1 <= dec_reg_pc;
    end else begin
      exe_alu_op1 <= regfile_io_rdata1;
    end
    if (_T_42) begin
      brjmp_offset <= regfile_io_rdata2;
    end else if (_T_43) begin
      brjmp_offset <= imm_itype_sext;
    end else if (_T_44) begin
      brjmp_offset <= imm_stype_sext;
    end else if (_T_45) begin
      brjmp_offset <= imm_sbtype_sext;
    end else if (_T_46) begin
      brjmp_offset <= imm_utype_sext;
    end else if (_T_47) begin
      brjmp_offset <= imm_ujtype_sext;
    end else begin
      brjmp_offset <= 64'h0;
    end
    exe_reg_rs2_data <= regfile_io_rdata2;
    exe_reg_ctrl_alu_fun <= io_ctl_alu_fun;
    if (reset) begin
      exe_reg_ctrl_rf_wen <= 1'h0;
    end else begin
      exe_reg_ctrl_rf_wen <= io_ctl_rf_wen;
    end
    mem_reg_pc <= exe_reg_pc;
    mem_reg_inst <= exe_reg_inst;
    mem_reg_alu_out <= alu_io_result;
    mem_reg_wbaddr <= exe_reg_wbaddr;
    mem_reg_rs1_addr <= exe_reg_rs1_addr;
    mem_reg_rs2_addr <= exe_reg_rs2_addr;
    mem_reg_op1_data <= exe_alu_op1;
    mem_reg_op2_data <= brjmp_offset;
    mem_reg_rs2_data <= exe_reg_rs2_data;
    if (reset) begin
      mem_reg_ctrl_rf_wen <= 1'h0;
    end else begin
      mem_reg_ctrl_rf_wen <= exe_reg_ctrl_rf_wen;
    end
    wb_reg_wbaddr <= mem_reg_wbaddr;
    wb_reg_wbdata <= mem_reg_alu_out;
    if (reset) begin
      wb_reg_ctrl_rf_wen <= 1'h0;
    end else begin
      wb_reg_ctrl_rf_wen <= mem_reg_ctrl_rf_wen;
    end
    wb_reg_inst <= mem_reg_inst;
    _T_70 <= mem_reg_pc;
    _T_71 <= mem_reg_rs1_addr;
    _T_72 <= mem_reg_op1_data;
    _T_73 <= mem_reg_rs2_addr;
    _T_74 <= mem_reg_op2_data;
    _T_77 <= mem_reg_pc;
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_76) begin
          $fwrite(32'h80000002,"pc=[%x] W[r%d=%x][%d] Op1=[r%d][%x] Op2=[r%d][%x] inst=[%x] DASM(%x)\n",_T_70,wb_reg_wbaddr,wb_reg_wbdata,wb_reg_ctrl_rf_wen,_T_71,_T_72,_T_73,_T_74,wb_reg_inst,wb_reg_inst); // @[dpath.scala 301:11]
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
  output [63:0] _T_45_0,
  output [63:0] _T_45_1,
  output [63:0] _T_45_2,
  output [63:0] _T_45_3,
  output [63:0] _T_45_4,
  output [63:0] _T_45_5,
  output [63:0] _T_45_6,
  output [63:0] _T_45_7,
  output [63:0] _T_45_8,
  output [63:0] _T_45_9,
  output [63:0] _T_45_10,
  output [63:0] _T_45_11,
  output [63:0] _T_45_12,
  output [63:0] _T_45_13,
  output [63:0] _T_45_14,
  output [63:0] _T_45_15,
  output [63:0] _T_45_16,
  output [63:0] _T_45_17,
  output [63:0] _T_45_18,
  output [63:0] _T_45_19,
  output [63:0] _T_45_20,
  output [63:0] _T_45_21,
  output [63:0] _T_45_22,
  output [63:0] _T_45_23,
  output [63:0] _T_45_24,
  output [63:0] _T_45_25,
  output [63:0] _T_45_26,
  output [63:0] _T_45_27,
  output [63:0] _T_45_28,
  output [63:0] _T_45_29,
  output [63:0] _T_45_30,
  output [63:0] _T_45_31,
  output [63:0] _T_77
);
  wire  cpath_clock; // @[top.scala 15:21]
  wire  cpath_reset; // @[top.scala 15:21]
  wire [63:0] cpath_io_dat_dec_inst; // @[top.scala 15:21]
  wire [1:0] cpath_io_ctl_op1_sel; // @[top.scala 15:21]
  wire [2:0] cpath_io_ctl_op2_sel; // @[top.scala 15:21]
  wire [3:0] cpath_io_ctl_alu_fun; // @[top.scala 15:21]
  wire  cpath_io_ctl_rf_wen; // @[top.scala 15:21]
  wire  dpath_clock; // @[top.scala 16:21]
  wire  dpath_reset; // @[top.scala 16:21]
  wire [1:0] dpath_io_ctl_op1_sel; // @[top.scala 16:21]
  wire [2:0] dpath_io_ctl_op2_sel; // @[top.scala 16:21]
  wire [3:0] dpath_io_ctl_alu_fun; // @[top.scala 16:21]
  wire  dpath_io_ctl_rf_wen; // @[top.scala 16:21]
  wire [63:0] dpath_io_dat_dec_inst; // @[top.scala 16:21]
  wire [63:0] dpath_io_instReadIO_addr; // @[top.scala 16:21]
  wire [63:0] dpath_io_instReadIO_data; // @[top.scala 16:21]
  wire [63:0] dpath_io_dataWriteIO_addr; // @[top.scala 16:21]
  wire [63:0] dpath_io_dataWriteIO_data; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_0; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_1; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_2; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_3; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_4; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_5; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_6; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_7; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_8; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_9; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_10; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_11; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_12; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_13; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_14; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_15; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_16; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_17; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_18; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_19; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_20; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_21; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_22; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_23; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_24; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_25; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_26; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_27; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_28; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_29; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_30; // @[top.scala 16:21]
  wire [63:0] dpath__T_45_0_31; // @[top.scala 16:21]
  wire [63:0] dpath__T_77_0; // @[top.scala 16:21]
  cpath cpath ( // @[top.scala 15:21]
    .clock(cpath_clock),
    .reset(cpath_reset),
    .io_dat_dec_inst(cpath_io_dat_dec_inst),
    .io_ctl_op1_sel(cpath_io_ctl_op1_sel),
    .io_ctl_op2_sel(cpath_io_ctl_op2_sel),
    .io_ctl_alu_fun(cpath_io_ctl_alu_fun),
    .io_ctl_rf_wen(cpath_io_ctl_rf_wen)
  );
  dpath dpath ( // @[top.scala 16:21]
    .clock(dpath_clock),
    .reset(dpath_reset),
    .io_ctl_op1_sel(dpath_io_ctl_op1_sel),
    .io_ctl_op2_sel(dpath_io_ctl_op2_sel),
    .io_ctl_alu_fun(dpath_io_ctl_alu_fun),
    .io_ctl_rf_wen(dpath_io_ctl_rf_wen),
    .io_dat_dec_inst(dpath_io_dat_dec_inst),
    .io_instReadIO_addr(dpath_io_instReadIO_addr),
    .io_instReadIO_data(dpath_io_instReadIO_data),
    .io_dataWriteIO_addr(dpath_io_dataWriteIO_addr),
    .io_dataWriteIO_data(dpath_io_dataWriteIO_data),
    ._T_45_0_0(dpath__T_45_0_0),
    ._T_45_0_1(dpath__T_45_0_1),
    ._T_45_0_2(dpath__T_45_0_2),
    ._T_45_0_3(dpath__T_45_0_3),
    ._T_45_0_4(dpath__T_45_0_4),
    ._T_45_0_5(dpath__T_45_0_5),
    ._T_45_0_6(dpath__T_45_0_6),
    ._T_45_0_7(dpath__T_45_0_7),
    ._T_45_0_8(dpath__T_45_0_8),
    ._T_45_0_9(dpath__T_45_0_9),
    ._T_45_0_10(dpath__T_45_0_10),
    ._T_45_0_11(dpath__T_45_0_11),
    ._T_45_0_12(dpath__T_45_0_12),
    ._T_45_0_13(dpath__T_45_0_13),
    ._T_45_0_14(dpath__T_45_0_14),
    ._T_45_0_15(dpath__T_45_0_15),
    ._T_45_0_16(dpath__T_45_0_16),
    ._T_45_0_17(dpath__T_45_0_17),
    ._T_45_0_18(dpath__T_45_0_18),
    ._T_45_0_19(dpath__T_45_0_19),
    ._T_45_0_20(dpath__T_45_0_20),
    ._T_45_0_21(dpath__T_45_0_21),
    ._T_45_0_22(dpath__T_45_0_22),
    ._T_45_0_23(dpath__T_45_0_23),
    ._T_45_0_24(dpath__T_45_0_24),
    ._T_45_0_25(dpath__T_45_0_25),
    ._T_45_0_26(dpath__T_45_0_26),
    ._T_45_0_27(dpath__T_45_0_27),
    ._T_45_0_28(dpath__T_45_0_28),
    ._T_45_0_29(dpath__T_45_0_29),
    ._T_45_0_30(dpath__T_45_0_30),
    ._T_45_0_31(dpath__T_45_0_31),
    ._T_77_0(dpath__T_77_0)
  );
  assign io_instReadIO_addr = dpath_io_instReadIO_addr; // @[top.scala 19:17]
  assign io_dataWriteIO_addr = dpath_io_dataWriteIO_addr; // @[top.scala 21:18]
  assign io_dataWriteIO_data = dpath_io_dataWriteIO_data; // @[top.scala 21:18]
  assign _T_45_0 = dpath__T_45_0_0;
  assign _T_45_1 = dpath__T_45_0_1;
  assign _T_45_2 = dpath__T_45_0_2;
  assign _T_45_3 = dpath__T_45_0_3;
  assign _T_45_4 = dpath__T_45_0_4;
  assign _T_45_5 = dpath__T_45_0_5;
  assign _T_45_6 = dpath__T_45_0_6;
  assign _T_45_7 = dpath__T_45_0_7;
  assign _T_45_8 = dpath__T_45_0_8;
  assign _T_45_9 = dpath__T_45_0_9;
  assign _T_45_10 = dpath__T_45_0_10;
  assign _T_45_11 = dpath__T_45_0_11;
  assign _T_45_12 = dpath__T_45_0_12;
  assign _T_45_13 = dpath__T_45_0_13;
  assign _T_45_14 = dpath__T_45_0_14;
  assign _T_45_15 = dpath__T_45_0_15;
  assign _T_45_16 = dpath__T_45_0_16;
  assign _T_45_17 = dpath__T_45_0_17;
  assign _T_45_18 = dpath__T_45_0_18;
  assign _T_45_19 = dpath__T_45_0_19;
  assign _T_45_20 = dpath__T_45_0_20;
  assign _T_45_21 = dpath__T_45_0_21;
  assign _T_45_22 = dpath__T_45_0_22;
  assign _T_45_23 = dpath__T_45_0_23;
  assign _T_45_24 = dpath__T_45_0_24;
  assign _T_45_25 = dpath__T_45_0_25;
  assign _T_45_26 = dpath__T_45_0_26;
  assign _T_45_27 = dpath__T_45_0_27;
  assign _T_45_28 = dpath__T_45_0_28;
  assign _T_45_29 = dpath__T_45_0_29;
  assign _T_45_30 = dpath__T_45_0_30;
  assign _T_45_31 = dpath__T_45_0_31;
  assign _T_77 = dpath__T_77_0;
  assign cpath_clock = clock;
  assign cpath_reset = reset;
  assign cpath_io_dat_dec_inst = dpath_io_dat_dec_inst; // @[top.scala 25:16]
  assign dpath_clock = clock;
  assign dpath_reset = reset;
  assign dpath_io_ctl_op1_sel = cpath_io_ctl_op1_sel; // @[top.scala 24:16]
  assign dpath_io_ctl_op2_sel = cpath_io_ctl_op2_sel; // @[top.scala 24:16]
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
  wire [63:0] mycoretop__T_45_0; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_1; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_2; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_3; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_4; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_5; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_6; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_7; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_8; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_9; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_10; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_11; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_12; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_13; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_14; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_15; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_16; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_17; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_18; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_19; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_20; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_21; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_22; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_23; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_24; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_25; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_26; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_27; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_28; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_29; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_30; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_45_31; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_77; // @[simTop.scala 15:25]
  top mycoretop ( // @[simTop.scala 15:25]
    .clock(mycoretop_clock),
    .reset(mycoretop_reset),
    .io_instReadIO_addr(mycoretop_io_instReadIO_addr),
    .io_instReadIO_data(mycoretop_io_instReadIO_data),
    .io_dataWriteIO_addr(mycoretop_io_dataWriteIO_addr),
    .io_dataWriteIO_data(mycoretop_io_dataWriteIO_data),
    ._T_45_0(mycoretop__T_45_0),
    ._T_45_1(mycoretop__T_45_1),
    ._T_45_2(mycoretop__T_45_2),
    ._T_45_3(mycoretop__T_45_3),
    ._T_45_4(mycoretop__T_45_4),
    ._T_45_5(mycoretop__T_45_5),
    ._T_45_6(mycoretop__T_45_6),
    ._T_45_7(mycoretop__T_45_7),
    ._T_45_8(mycoretop__T_45_8),
    ._T_45_9(mycoretop__T_45_9),
    ._T_45_10(mycoretop__T_45_10),
    ._T_45_11(mycoretop__T_45_11),
    ._T_45_12(mycoretop__T_45_12),
    ._T_45_13(mycoretop__T_45_13),
    ._T_45_14(mycoretop__T_45_14),
    ._T_45_15(mycoretop__T_45_15),
    ._T_45_16(mycoretop__T_45_16),
    ._T_45_17(mycoretop__T_45_17),
    ._T_45_18(mycoretop__T_45_18),
    ._T_45_19(mycoretop__T_45_19),
    ._T_45_20(mycoretop__T_45_20),
    ._T_45_21(mycoretop__T_45_21),
    ._T_45_22(mycoretop__T_45_22),
    ._T_45_23(mycoretop__T_45_23),
    ._T_45_24(mycoretop__T_45_24),
    ._T_45_25(mycoretop__T_45_25),
    ._T_45_26(mycoretop__T_45_26),
    ._T_45_27(mycoretop__T_45_27),
    ._T_45_28(mycoretop__T_45_28),
    ._T_45_29(mycoretop__T_45_29),
    ._T_45_30(mycoretop__T_45_30),
    ._T_45_31(mycoretop__T_45_31),
    ._T_77(mycoretop__T_77)
  );
  assign io_diffTestIO_regfile_0 = mycoretop__T_45_0;
  assign io_diffTestIO_regfile_1 = mycoretop__T_45_1;
  assign io_diffTestIO_regfile_2 = mycoretop__T_45_2;
  assign io_diffTestIO_regfile_3 = mycoretop__T_45_3;
  assign io_diffTestIO_regfile_4 = mycoretop__T_45_4;
  assign io_diffTestIO_regfile_5 = mycoretop__T_45_5;
  assign io_diffTestIO_regfile_6 = mycoretop__T_45_6;
  assign io_diffTestIO_regfile_7 = mycoretop__T_45_7;
  assign io_diffTestIO_regfile_8 = mycoretop__T_45_8;
  assign io_diffTestIO_regfile_9 = mycoretop__T_45_9;
  assign io_diffTestIO_regfile_10 = mycoretop__T_45_10;
  assign io_diffTestIO_regfile_11 = mycoretop__T_45_11;
  assign io_diffTestIO_regfile_12 = mycoretop__T_45_12;
  assign io_diffTestIO_regfile_13 = mycoretop__T_45_13;
  assign io_diffTestIO_regfile_14 = mycoretop__T_45_14;
  assign io_diffTestIO_regfile_15 = mycoretop__T_45_15;
  assign io_diffTestIO_regfile_16 = mycoretop__T_45_16;
  assign io_diffTestIO_regfile_17 = mycoretop__T_45_17;
  assign io_diffTestIO_regfile_18 = mycoretop__T_45_18;
  assign io_diffTestIO_regfile_19 = mycoretop__T_45_19;
  assign io_diffTestIO_regfile_20 = mycoretop__T_45_20;
  assign io_diffTestIO_regfile_21 = mycoretop__T_45_21;
  assign io_diffTestIO_regfile_22 = mycoretop__T_45_22;
  assign io_diffTestIO_regfile_23 = mycoretop__T_45_23;
  assign io_diffTestIO_regfile_24 = mycoretop__T_45_24;
  assign io_diffTestIO_regfile_25 = mycoretop__T_45_25;
  assign io_diffTestIO_regfile_26 = mycoretop__T_45_26;
  assign io_diffTestIO_regfile_27 = mycoretop__T_45_27;
  assign io_diffTestIO_regfile_28 = mycoretop__T_45_28;
  assign io_diffTestIO_regfile_29 = mycoretop__T_45_29;
  assign io_diffTestIO_regfile_30 = mycoretop__T_45_30;
  assign io_diffTestIO_regfile_31 = mycoretop__T_45_31;
  assign io_diffTestIO_PC = mycoretop__T_77;
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
