module cpath(
  input  [63:0] io_dat_dec_inst,
  input         io_dat_dec_br_eq,
  input         io_dat_dec_br_lt,
  input         io_dat_dec_br_ltu,
  output [1:0]  io_ctl_dec_pc_sel,
  output [1:0]  io_ctl_op1_sel,
  output [2:0]  io_ctl_op2_sel,
  output [4:0]  io_ctl_alu_fun,
  output [2:0]  io_ctl_wb_sel,
  output        io_ctl_rf_wen,
  output        io_ctl_mem_ren,
  output        io_ctl_mem_wen,
  output [7:0]  io_ctl_mem_mask,
  output [2:0]  io_ctl_mem_ext,
  output        nemu_halt_0
);
  wire [63:0] _T = io_dat_dec_inst & 64'h707f; // @[Lookup.scala 31:38]
  wire  _T_1 = 64'h3 == _T; // @[Lookup.scala 31:38]
  wire  _T_3 = 64'h1003 == _T; // @[Lookup.scala 31:38]
  wire  _T_5 = 64'h2003 == _T; // @[Lookup.scala 31:38]
  wire  _T_7 = 64'h4003 == _T; // @[Lookup.scala 31:38]
  wire  _T_9 = 64'h5003 == _T; // @[Lookup.scala 31:38]
  wire  _T_11 = 64'h6003 == _T; // @[Lookup.scala 31:38]
  wire  _T_13 = 64'h23 == _T; // @[Lookup.scala 31:38]
  wire  _T_15 = 64'h1023 == _T; // @[Lookup.scala 31:38]
  wire  _T_17 = 64'h2023 == _T; // @[Lookup.scala 31:38]
  wire [63:0] _T_18 = io_dat_dec_inst & 64'h7f; // @[Lookup.scala 31:38]
  wire  _T_19 = 64'h37 == _T_18; // @[Lookup.scala 31:38]
  wire  _T_21 = 64'h17 == _T_18; // @[Lookup.scala 31:38]
  wire  _T_23 = 64'h6f == _T_18; // @[Lookup.scala 31:38]
  wire  _T_25 = 64'h67 == _T; // @[Lookup.scala 31:38]
  wire  _T_27 = 64'h63 == _T; // @[Lookup.scala 31:38]
  wire  _T_29 = 64'h1063 == _T; // @[Lookup.scala 31:38]
  wire  _T_31 = 64'h4063 == _T; // @[Lookup.scala 31:38]
  wire  _T_33 = 64'h5063 == _T; // @[Lookup.scala 31:38]
  wire  _T_35 = 64'h6063 == _T; // @[Lookup.scala 31:38]
  wire  _T_37 = 64'h7063 == _T; // @[Lookup.scala 31:38]
  wire  _T_39 = 64'h13 == _T; // @[Lookup.scala 31:38]
  wire  _T_41 = 64'h3013 == _T; // @[Lookup.scala 31:38]
  wire  _T_43 = 64'h4013 == _T; // @[Lookup.scala 31:38]
  wire  _T_45 = 64'h7013 == _T; // @[Lookup.scala 31:38]
  wire [63:0] _T_46 = io_dat_dec_inst & 64'hfe00707f; // @[Lookup.scala 31:38]
  wire  _T_47 = 64'h33 == _T_46; // @[Lookup.scala 31:38]
  wire  _T_49 = 64'h40000033 == _T_46; // @[Lookup.scala 31:38]
  wire  _T_51 = 64'h2033 == _T_46; // @[Lookup.scala 31:38]
  wire  _T_53 = 64'h3033 == _T_46; // @[Lookup.scala 31:38]
  wire  _T_55 = 64'h6033 == _T_46; // @[Lookup.scala 31:38]
  wire  _T_57 = 64'h7033 == _T_46; // @[Lookup.scala 31:38]
  wire  _T_59 = 64'h3003 == _T; // @[Lookup.scala 31:38]
  wire  _T_61 = 64'h3023 == _T; // @[Lookup.scala 31:38]
  wire [63:0] _T_62 = io_dat_dec_inst & 64'hfc00707f; // @[Lookup.scala 31:38]
  wire  _T_63 = 64'h1013 == _T_62; // @[Lookup.scala 31:38]
  wire  _T_65 = 64'h5013 == _T_62; // @[Lookup.scala 31:38]
  wire  _T_67 = 64'h40005013 == _T_62; // @[Lookup.scala 31:38]
  wire  _T_69 = 64'h1b == _T; // @[Lookup.scala 31:38]
  wire  _T_71 = 64'h101b == _T_46; // @[Lookup.scala 31:38]
  wire  _T_73 = 64'h501b == _T_46; // @[Lookup.scala 31:38]
  wire  _T_75 = 64'h4000501b == _T_46; // @[Lookup.scala 31:38]
  wire  _T_77 = 64'h3b == _T_46; // @[Lookup.scala 31:38]
  wire  _T_79 = 64'h4000003b == _T_46; // @[Lookup.scala 31:38]
  wire  _T_81 = 64'h103b == _T_46; // @[Lookup.scala 31:38]
  wire  _T_83 = 64'h503b == _T_46; // @[Lookup.scala 31:38]
  wire  _T_85 = 64'h4000503b == _T_46; // @[Lookup.scala 31:38]
  wire  _T_87 = 64'h2000033 == _T_46; // @[Lookup.scala 31:38]
  wire  _T_89 = 64'h2001033 == _T_46; // @[Lookup.scala 31:38]
  wire  _T_91 = 64'h2002033 == _T_46; // @[Lookup.scala 31:38]
  wire  _T_93 = 64'h2003033 == _T_46; // @[Lookup.scala 31:38]
  wire  _T_95 = 64'h2004033 == _T_46; // @[Lookup.scala 31:38]
  wire  _T_97 = 64'h2005033 == _T_46; // @[Lookup.scala 31:38]
  wire  _T_99 = 64'h2006033 == _T_46; // @[Lookup.scala 31:38]
  wire  _T_101 = 64'h2007033 == _T_46; // @[Lookup.scala 31:38]
  wire  _T_103 = 64'h200003b == _T_46; // @[Lookup.scala 31:38]
  wire  _T_105 = 64'h200403b == _T_46; // @[Lookup.scala 31:38]
  wire  _T_107 = 64'h200503b == _T_46; // @[Lookup.scala 31:38]
  wire  _T_109 = 64'h200603b == _T_46; // @[Lookup.scala 31:38]
  wire  _T_111 = 64'h200703b == _T_46; // @[Lookup.scala 31:38]
  wire [63:0] _T_112 = io_dat_dec_inst & 64'hffffffff; // @[Lookup.scala 31:38]
  wire  _T_113 = 64'h5006b == _T_112; // @[Lookup.scala 31:38]
  wire [3:0] _T_208 = _T_37 ? 4'h4 : 4'h0; // @[Lookup.scala 33:37]
  wire [3:0] _T_209 = _T_35 ? 4'h6 : _T_208; // @[Lookup.scala 33:37]
  wire [3:0] _T_210 = _T_33 ? 4'h3 : _T_209; // @[Lookup.scala 33:37]
  wire [3:0] _T_211 = _T_31 ? 4'h5 : _T_210; // @[Lookup.scala 33:37]
  wire [3:0] _T_212 = _T_29 ? 4'h1 : _T_211; // @[Lookup.scala 33:37]
  wire [3:0] _T_213 = _T_27 ? 4'h2 : _T_212; // @[Lookup.scala 33:37]
  wire [3:0] _T_214 = _T_25 ? 4'h8 : _T_213; // @[Lookup.scala 33:37]
  wire [3:0] _T_215 = _T_23 ? 4'h7 : _T_214; // @[Lookup.scala 33:37]
  wire [3:0] _T_216 = _T_21 ? 4'h0 : _T_215; // @[Lookup.scala 33:37]
  wire [3:0] _T_217 = _T_19 ? 4'h0 : _T_216; // @[Lookup.scala 33:37]
  wire [3:0] _T_218 = _T_17 ? 4'h0 : _T_217; // @[Lookup.scala 33:37]
  wire [3:0] _T_219 = _T_15 ? 4'h0 : _T_218; // @[Lookup.scala 33:37]
  wire [3:0] _T_220 = _T_13 ? 4'h0 : _T_219; // @[Lookup.scala 33:37]
  wire [3:0] _T_221 = _T_11 ? 4'h0 : _T_220; // @[Lookup.scala 33:37]
  wire [3:0] _T_222 = _T_9 ? 4'h0 : _T_221; // @[Lookup.scala 33:37]
  wire [3:0] _T_223 = _T_7 ? 4'h0 : _T_222; // @[Lookup.scala 33:37]
  wire [3:0] _T_224 = _T_5 ? 4'h0 : _T_223; // @[Lookup.scala 33:37]
  wire [3:0] _T_225 = _T_3 ? 4'h0 : _T_224; // @[Lookup.scala 33:37]
  wire [3:0] cs_br_type = _T_1 ? 4'h0 : _T_225; // @[Lookup.scala 33:37]
  wire [1:0] _T_240 = _T_85 ? 2'h1 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] _T_241 = _T_83 ? 2'h1 : _T_240; // @[Lookup.scala 33:37]
  wire [1:0] _T_242 = _T_81 ? 2'h0 : _T_241; // @[Lookup.scala 33:37]
  wire [1:0] _T_243 = _T_79 ? 2'h0 : _T_242; // @[Lookup.scala 33:37]
  wire [1:0] _T_244 = _T_77 ? 2'h0 : _T_243; // @[Lookup.scala 33:37]
  wire [1:0] _T_245 = _T_75 ? 2'h1 : _T_244; // @[Lookup.scala 33:37]
  wire [1:0] _T_246 = _T_73 ? 2'h1 : _T_245; // @[Lookup.scala 33:37]
  wire [1:0] _T_247 = _T_71 ? 2'h0 : _T_246; // @[Lookup.scala 33:37]
  wire [1:0] _T_248 = _T_69 ? 2'h0 : _T_247; // @[Lookup.scala 33:37]
  wire [1:0] _T_249 = _T_67 ? 2'h0 : _T_248; // @[Lookup.scala 33:37]
  wire [1:0] _T_250 = _T_65 ? 2'h0 : _T_249; // @[Lookup.scala 33:37]
  wire [1:0] _T_251 = _T_63 ? 2'h0 : _T_250; // @[Lookup.scala 33:37]
  wire [1:0] _T_252 = _T_61 ? 2'h0 : _T_251; // @[Lookup.scala 33:37]
  wire [1:0] _T_253 = _T_59 ? 2'h0 : _T_252; // @[Lookup.scala 33:37]
  wire [1:0] _T_254 = _T_57 ? 2'h0 : _T_253; // @[Lookup.scala 33:37]
  wire [1:0] _T_255 = _T_55 ? 2'h0 : _T_254; // @[Lookup.scala 33:37]
  wire [1:0] _T_256 = _T_53 ? 2'h0 : _T_255; // @[Lookup.scala 33:37]
  wire [1:0] _T_257 = _T_51 ? 2'h0 : _T_256; // @[Lookup.scala 33:37]
  wire [1:0] _T_258 = _T_49 ? 2'h0 : _T_257; // @[Lookup.scala 33:37]
  wire [1:0] _T_259 = _T_47 ? 2'h0 : _T_258; // @[Lookup.scala 33:37]
  wire [1:0] _T_260 = _T_45 ? 2'h0 : _T_259; // @[Lookup.scala 33:37]
  wire [1:0] _T_261 = _T_43 ? 2'h0 : _T_260; // @[Lookup.scala 33:37]
  wire [1:0] _T_262 = _T_41 ? 2'h0 : _T_261; // @[Lookup.scala 33:37]
  wire [1:0] _T_263 = _T_39 ? 2'h0 : _T_262; // @[Lookup.scala 33:37]
  wire [1:0] _T_264 = _T_37 ? 2'h0 : _T_263; // @[Lookup.scala 33:37]
  wire [1:0] _T_265 = _T_35 ? 2'h0 : _T_264; // @[Lookup.scala 33:37]
  wire [1:0] _T_266 = _T_33 ? 2'h0 : _T_265; // @[Lookup.scala 33:37]
  wire [1:0] _T_267 = _T_31 ? 2'h0 : _T_266; // @[Lookup.scala 33:37]
  wire [1:0] _T_268 = _T_29 ? 2'h0 : _T_267; // @[Lookup.scala 33:37]
  wire [1:0] _T_269 = _T_27 ? 2'h0 : _T_268; // @[Lookup.scala 33:37]
  wire [1:0] _T_270 = _T_25 ? 2'h0 : _T_269; // @[Lookup.scala 33:37]
  wire [1:0] _T_271 = _T_23 ? 2'h0 : _T_270; // @[Lookup.scala 33:37]
  wire [1:0] _T_272 = _T_21 ? 2'h2 : _T_271; // @[Lookup.scala 33:37]
  wire [1:0] _T_273 = _T_19 ? 2'h0 : _T_272; // @[Lookup.scala 33:37]
  wire [1:0] _T_274 = _T_17 ? 2'h0 : _T_273; // @[Lookup.scala 33:37]
  wire [1:0] _T_275 = _T_15 ? 2'h0 : _T_274; // @[Lookup.scala 33:37]
  wire [1:0] _T_276 = _T_13 ? 2'h0 : _T_275; // @[Lookup.scala 33:37]
  wire [1:0] _T_277 = _T_11 ? 2'h0 : _T_276; // @[Lookup.scala 33:37]
  wire [1:0] _T_278 = _T_9 ? 2'h0 : _T_277; // @[Lookup.scala 33:37]
  wire [1:0] _T_279 = _T_7 ? 2'h0 : _T_278; // @[Lookup.scala 33:37]
  wire [1:0] _T_280 = _T_5 ? 2'h0 : _T_279; // @[Lookup.scala 33:37]
  wire [1:0] _T_281 = _T_3 ? 2'h0 : _T_280; // @[Lookup.scala 33:37]
  wire [2:0] _T_301 = _T_75 ? 3'h2 : 3'h0; // @[Lookup.scala 33:37]
  wire [2:0] _T_302 = _T_73 ? 3'h2 : _T_301; // @[Lookup.scala 33:37]
  wire [2:0] _T_303 = _T_71 ? 3'h2 : _T_302; // @[Lookup.scala 33:37]
  wire [2:0] _T_304 = _T_69 ? 3'h2 : _T_303; // @[Lookup.scala 33:37]
  wire [2:0] _T_305 = _T_67 ? 3'h2 : _T_304; // @[Lookup.scala 33:37]
  wire [2:0] _T_306 = _T_65 ? 3'h2 : _T_305; // @[Lookup.scala 33:37]
  wire [2:0] _T_307 = _T_63 ? 3'h2 : _T_306; // @[Lookup.scala 33:37]
  wire [2:0] _T_308 = _T_61 ? 3'h3 : _T_307; // @[Lookup.scala 33:37]
  wire [2:0] _T_309 = _T_59 ? 3'h2 : _T_308; // @[Lookup.scala 33:37]
  wire [2:0] _T_310 = _T_57 ? 3'h0 : _T_309; // @[Lookup.scala 33:37]
  wire [2:0] _T_311 = _T_55 ? 3'h0 : _T_310; // @[Lookup.scala 33:37]
  wire [2:0] _T_312 = _T_53 ? 3'h0 : _T_311; // @[Lookup.scala 33:37]
  wire [2:0] _T_313 = _T_51 ? 3'h0 : _T_312; // @[Lookup.scala 33:37]
  wire [2:0] _T_314 = _T_49 ? 3'h0 : _T_313; // @[Lookup.scala 33:37]
  wire [2:0] _T_315 = _T_47 ? 3'h0 : _T_314; // @[Lookup.scala 33:37]
  wire [2:0] _T_316 = _T_45 ? 3'h2 : _T_315; // @[Lookup.scala 33:37]
  wire [2:0] _T_317 = _T_43 ? 3'h2 : _T_316; // @[Lookup.scala 33:37]
  wire [2:0] _T_318 = _T_41 ? 3'h2 : _T_317; // @[Lookup.scala 33:37]
  wire [2:0] _T_319 = _T_39 ? 3'h2 : _T_318; // @[Lookup.scala 33:37]
  wire [2:0] _T_320 = _T_37 ? 3'h4 : _T_319; // @[Lookup.scala 33:37]
  wire [2:0] _T_321 = _T_35 ? 3'h4 : _T_320; // @[Lookup.scala 33:37]
  wire [2:0] _T_322 = _T_33 ? 3'h4 : _T_321; // @[Lookup.scala 33:37]
  wire [2:0] _T_323 = _T_31 ? 3'h4 : _T_322; // @[Lookup.scala 33:37]
  wire [2:0] _T_324 = _T_29 ? 3'h4 : _T_323; // @[Lookup.scala 33:37]
  wire [2:0] _T_325 = _T_27 ? 3'h4 : _T_324; // @[Lookup.scala 33:37]
  wire [2:0] _T_326 = _T_25 ? 3'h2 : _T_325; // @[Lookup.scala 33:37]
  wire [2:0] _T_327 = _T_23 ? 3'h6 : _T_326; // @[Lookup.scala 33:37]
  wire [2:0] _T_328 = _T_21 ? 3'h5 : _T_327; // @[Lookup.scala 33:37]
  wire [2:0] _T_329 = _T_19 ? 3'h5 : _T_328; // @[Lookup.scala 33:37]
  wire [2:0] _T_330 = _T_17 ? 3'h3 : _T_329; // @[Lookup.scala 33:37]
  wire [2:0] _T_331 = _T_15 ? 3'h3 : _T_330; // @[Lookup.scala 33:37]
  wire [2:0] _T_332 = _T_13 ? 3'h3 : _T_331; // @[Lookup.scala 33:37]
  wire [2:0] _T_333 = _T_11 ? 3'h2 : _T_332; // @[Lookup.scala 33:37]
  wire [2:0] _T_334 = _T_9 ? 3'h2 : _T_333; // @[Lookup.scala 33:37]
  wire [2:0] _T_335 = _T_7 ? 3'h2 : _T_334; // @[Lookup.scala 33:37]
  wire [2:0] _T_336 = _T_5 ? 3'h2 : _T_335; // @[Lookup.scala 33:37]
  wire [2:0] _T_337 = _T_3 ? 3'h2 : _T_336; // @[Lookup.scala 33:37]
  wire  _T_340 = _T_109 | _T_111; // @[Lookup.scala 33:37]
  wire  _T_341 = _T_107 | _T_340; // @[Lookup.scala 33:37]
  wire  _T_342 = _T_105 | _T_341; // @[Lookup.scala 33:37]
  wire  _T_343 = _T_103 | _T_342; // @[Lookup.scala 33:37]
  wire  _T_344 = _T_101 | _T_343; // @[Lookup.scala 33:37]
  wire  _T_345 = _T_99 | _T_344; // @[Lookup.scala 33:37]
  wire  _T_346 = _T_97 | _T_345; // @[Lookup.scala 33:37]
  wire  _T_347 = _T_95 | _T_346; // @[Lookup.scala 33:37]
  wire  _T_348 = _T_93 | _T_347; // @[Lookup.scala 33:37]
  wire  _T_349 = _T_91 | _T_348; // @[Lookup.scala 33:37]
  wire  _T_350 = _T_89 | _T_349; // @[Lookup.scala 33:37]
  wire  _T_351 = _T_87 | _T_350; // @[Lookup.scala 33:37]
  wire  _T_352 = _T_85 | _T_351; // @[Lookup.scala 33:37]
  wire  _T_353 = _T_83 | _T_352; // @[Lookup.scala 33:37]
  wire  _T_354 = _T_81 | _T_353; // @[Lookup.scala 33:37]
  wire  _T_355 = _T_79 | _T_354; // @[Lookup.scala 33:37]
  wire  _T_356 = _T_77 | _T_355; // @[Lookup.scala 33:37]
  wire  _T_357 = _T_75 | _T_356; // @[Lookup.scala 33:37]
  wire  _T_358 = _T_73 | _T_357; // @[Lookup.scala 33:37]
  wire  _T_359 = _T_71 | _T_358; // @[Lookup.scala 33:37]
  wire  _T_360 = _T_69 | _T_359; // @[Lookup.scala 33:37]
  wire  _T_361 = _T_67 | _T_360; // @[Lookup.scala 33:37]
  wire  _T_362 = _T_65 | _T_361; // @[Lookup.scala 33:37]
  wire  _T_363 = _T_63 | _T_362; // @[Lookup.scala 33:37]
  wire [4:0] _T_451 = _T_111 ? 5'h1e : 5'h0; // @[Lookup.scala 33:37]
  wire [4:0] _T_452 = _T_109 ? 5'h1d : _T_451; // @[Lookup.scala 33:37]
  wire [4:0] _T_453 = _T_107 ? 5'h1c : _T_452; // @[Lookup.scala 33:37]
  wire [4:0] _T_454 = _T_105 ? 5'h1b : _T_453; // @[Lookup.scala 33:37]
  wire [4:0] _T_455 = _T_103 ? 5'h1a : _T_454; // @[Lookup.scala 33:37]
  wire [4:0] _T_456 = _T_101 ? 5'h19 : _T_455; // @[Lookup.scala 33:37]
  wire [4:0] _T_457 = _T_99 ? 5'h18 : _T_456; // @[Lookup.scala 33:37]
  wire [4:0] _T_458 = _T_97 ? 5'h17 : _T_457; // @[Lookup.scala 33:37]
  wire [4:0] _T_459 = _T_95 ? 5'h16 : _T_458; // @[Lookup.scala 33:37]
  wire [4:0] _T_460 = _T_93 ? 5'h15 : _T_459; // @[Lookup.scala 33:37]
  wire [4:0] _T_461 = _T_91 ? 5'h14 : _T_460; // @[Lookup.scala 33:37]
  wire [4:0] _T_462 = _T_89 ? 5'h13 : _T_461; // @[Lookup.scala 33:37]
  wire [4:0] _T_463 = _T_87 ? 5'h12 : _T_462; // @[Lookup.scala 33:37]
  wire [4:0] _T_464 = _T_85 ? 5'h5 : _T_463; // @[Lookup.scala 33:37]
  wire [4:0] _T_465 = _T_83 ? 5'h3 : _T_464; // @[Lookup.scala 33:37]
  wire [4:0] _T_466 = _T_81 ? 5'h2 : _T_465; // @[Lookup.scala 33:37]
  wire [4:0] _T_467 = _T_79 ? 5'h1 : _T_466; // @[Lookup.scala 33:37]
  wire [4:0] _T_468 = _T_77 ? 5'h0 : _T_467; // @[Lookup.scala 33:37]
  wire [4:0] _T_469 = _T_75 ? 5'h5 : _T_468; // @[Lookup.scala 33:37]
  wire [4:0] _T_470 = _T_73 ? 5'h3 : _T_469; // @[Lookup.scala 33:37]
  wire [4:0] _T_471 = _T_71 ? 5'h2 : _T_470; // @[Lookup.scala 33:37]
  wire [4:0] _T_472 = _T_69 ? 5'h0 : _T_471; // @[Lookup.scala 33:37]
  wire [4:0] _T_473 = _T_67 ? 5'h4 : _T_472; // @[Lookup.scala 33:37]
  wire [4:0] _T_474 = _T_65 ? 5'h3 : _T_473; // @[Lookup.scala 33:37]
  wire [4:0] _T_475 = _T_63 ? 5'h2 : _T_474; // @[Lookup.scala 33:37]
  wire [4:0] _T_476 = _T_61 ? 5'h0 : _T_475; // @[Lookup.scala 33:37]
  wire [4:0] _T_477 = _T_59 ? 5'h0 : _T_476; // @[Lookup.scala 33:37]
  wire [4:0] _T_478 = _T_57 ? 5'h6 : _T_477; // @[Lookup.scala 33:37]
  wire [4:0] _T_479 = _T_55 ? 5'h7 : _T_478; // @[Lookup.scala 33:37]
  wire [4:0] _T_480 = _T_53 ? 5'ha : _T_479; // @[Lookup.scala 33:37]
  wire [4:0] _T_481 = _T_51 ? 5'h9 : _T_480; // @[Lookup.scala 33:37]
  wire [4:0] _T_482 = _T_49 ? 5'h1 : _T_481; // @[Lookup.scala 33:37]
  wire [4:0] _T_483 = _T_47 ? 5'h0 : _T_482; // @[Lookup.scala 33:37]
  wire [4:0] _T_484 = _T_45 ? 5'h6 : _T_483; // @[Lookup.scala 33:37]
  wire [4:0] _T_485 = _T_43 ? 5'h8 : _T_484; // @[Lookup.scala 33:37]
  wire [4:0] _T_486 = _T_41 ? 5'ha : _T_485; // @[Lookup.scala 33:37]
  wire [4:0] _T_487 = _T_39 ? 5'h0 : _T_486; // @[Lookup.scala 33:37]
  wire [4:0] _T_488 = _T_37 ? 5'h0 : _T_487; // @[Lookup.scala 33:37]
  wire [4:0] _T_489 = _T_35 ? 5'h0 : _T_488; // @[Lookup.scala 33:37]
  wire [4:0] _T_490 = _T_33 ? 5'h0 : _T_489; // @[Lookup.scala 33:37]
  wire [4:0] _T_491 = _T_31 ? 5'h0 : _T_490; // @[Lookup.scala 33:37]
  wire [4:0] _T_492 = _T_29 ? 5'h0 : _T_491; // @[Lookup.scala 33:37]
  wire [4:0] _T_493 = _T_27 ? 5'h0 : _T_492; // @[Lookup.scala 33:37]
  wire [4:0] _T_494 = _T_25 ? 5'h0 : _T_493; // @[Lookup.scala 33:37]
  wire [4:0] _T_495 = _T_23 ? 5'hc : _T_494; // @[Lookup.scala 33:37]
  wire [4:0] _T_496 = _T_21 ? 5'h0 : _T_495; // @[Lookup.scala 33:37]
  wire [4:0] _T_497 = _T_19 ? 5'hc : _T_496; // @[Lookup.scala 33:37]
  wire [4:0] _T_498 = _T_17 ? 5'h0 : _T_497; // @[Lookup.scala 33:37]
  wire [4:0] _T_499 = _T_15 ? 5'h0 : _T_498; // @[Lookup.scala 33:37]
  wire [4:0] _T_500 = _T_13 ? 5'h0 : _T_499; // @[Lookup.scala 33:37]
  wire [4:0] _T_501 = _T_11 ? 5'h0 : _T_500; // @[Lookup.scala 33:37]
  wire [4:0] _T_502 = _T_9 ? 5'h0 : _T_501; // @[Lookup.scala 33:37]
  wire [4:0] _T_503 = _T_7 ? 5'h0 : _T_502; // @[Lookup.scala 33:37]
  wire [4:0] _T_504 = _T_5 ? 5'h0 : _T_503; // @[Lookup.scala 33:37]
  wire [4:0] _T_505 = _T_3 ? 5'h0 : _T_504; // @[Lookup.scala 33:37]
  wire [2:0] _T_520 = _T_85 ? 3'h1 : 3'h0; // @[Lookup.scala 33:37]
  wire [2:0] _T_521 = _T_83 ? 3'h1 : _T_520; // @[Lookup.scala 33:37]
  wire [2:0] _T_522 = _T_81 ? 3'h1 : _T_521; // @[Lookup.scala 33:37]
  wire [2:0] _T_523 = _T_79 ? 3'h1 : _T_522; // @[Lookup.scala 33:37]
  wire [2:0] _T_524 = _T_77 ? 3'h1 : _T_523; // @[Lookup.scala 33:37]
  wire [2:0] _T_525 = _T_75 ? 3'h1 : _T_524; // @[Lookup.scala 33:37]
  wire [2:0] _T_526 = _T_73 ? 3'h1 : _T_525; // @[Lookup.scala 33:37]
  wire [2:0] _T_527 = _T_71 ? 3'h1 : _T_526; // @[Lookup.scala 33:37]
  wire [2:0] _T_528 = _T_69 ? 3'h1 : _T_527; // @[Lookup.scala 33:37]
  wire [2:0] _T_529 = _T_67 ? 3'h0 : _T_528; // @[Lookup.scala 33:37]
  wire [2:0] _T_530 = _T_65 ? 3'h0 : _T_529; // @[Lookup.scala 33:37]
  wire [2:0] _T_531 = _T_63 ? 3'h0 : _T_530; // @[Lookup.scala 33:37]
  wire [2:0] _T_532 = _T_61 ? 3'h0 : _T_531; // @[Lookup.scala 33:37]
  wire [2:0] _T_533 = _T_59 ? 3'h2 : _T_532; // @[Lookup.scala 33:37]
  wire [2:0] _T_534 = _T_57 ? 3'h0 : _T_533; // @[Lookup.scala 33:37]
  wire [2:0] _T_535 = _T_55 ? 3'h0 : _T_534; // @[Lookup.scala 33:37]
  wire [2:0] _T_536 = _T_53 ? 3'h0 : _T_535; // @[Lookup.scala 33:37]
  wire [2:0] _T_537 = _T_51 ? 3'h0 : _T_536; // @[Lookup.scala 33:37]
  wire [2:0] _T_538 = _T_49 ? 3'h0 : _T_537; // @[Lookup.scala 33:37]
  wire [2:0] _T_539 = _T_47 ? 3'h0 : _T_538; // @[Lookup.scala 33:37]
  wire [2:0] _T_540 = _T_45 ? 3'h0 : _T_539; // @[Lookup.scala 33:37]
  wire [2:0] _T_541 = _T_43 ? 3'h0 : _T_540; // @[Lookup.scala 33:37]
  wire [2:0] _T_542 = _T_41 ? 3'h0 : _T_541; // @[Lookup.scala 33:37]
  wire [2:0] _T_543 = _T_39 ? 3'h0 : _T_542; // @[Lookup.scala 33:37]
  wire [2:0] _T_544 = _T_37 ? 3'h0 : _T_543; // @[Lookup.scala 33:37]
  wire [2:0] _T_545 = _T_35 ? 3'h0 : _T_544; // @[Lookup.scala 33:37]
  wire [2:0] _T_546 = _T_33 ? 3'h0 : _T_545; // @[Lookup.scala 33:37]
  wire [2:0] _T_547 = _T_31 ? 3'h0 : _T_546; // @[Lookup.scala 33:37]
  wire [2:0] _T_548 = _T_29 ? 3'h0 : _T_547; // @[Lookup.scala 33:37]
  wire [2:0] _T_549 = _T_27 ? 3'h0 : _T_548; // @[Lookup.scala 33:37]
  wire [2:0] _T_550 = _T_25 ? 3'h3 : _T_549; // @[Lookup.scala 33:37]
  wire [2:0] _T_551 = _T_23 ? 3'h3 : _T_550; // @[Lookup.scala 33:37]
  wire [2:0] _T_552 = _T_21 ? 3'h0 : _T_551; // @[Lookup.scala 33:37]
  wire [2:0] _T_553 = _T_19 ? 3'h0 : _T_552; // @[Lookup.scala 33:37]
  wire [2:0] _T_554 = _T_17 ? 3'h0 : _T_553; // @[Lookup.scala 33:37]
  wire [2:0] _T_555 = _T_15 ? 3'h0 : _T_554; // @[Lookup.scala 33:37]
  wire [2:0] _T_556 = _T_13 ? 3'h0 : _T_555; // @[Lookup.scala 33:37]
  wire [2:0] _T_557 = _T_11 ? 3'h2 : _T_556; // @[Lookup.scala 33:37]
  wire [2:0] _T_558 = _T_9 ? 3'h2 : _T_557; // @[Lookup.scala 33:37]
  wire [2:0] _T_559 = _T_7 ? 3'h2 : _T_558; // @[Lookup.scala 33:37]
  wire [2:0] _T_560 = _T_5 ? 3'h2 : _T_559; // @[Lookup.scala 33:37]
  wire [2:0] _T_561 = _T_3 ? 3'h2 : _T_560; // @[Lookup.scala 33:37]
  wire  _T_588 = _T_61 ? 1'h0 : _T_363; // @[Lookup.scala 33:37]
  wire  _T_589 = _T_59 | _T_588; // @[Lookup.scala 33:37]
  wire  _T_590 = _T_57 | _T_589; // @[Lookup.scala 33:37]
  wire  _T_591 = _T_55 | _T_590; // @[Lookup.scala 33:37]
  wire  _T_592 = _T_53 | _T_591; // @[Lookup.scala 33:37]
  wire  _T_593 = _T_51 | _T_592; // @[Lookup.scala 33:37]
  wire  _T_594 = _T_49 | _T_593; // @[Lookup.scala 33:37]
  wire  _T_595 = _T_47 | _T_594; // @[Lookup.scala 33:37]
  wire  _T_596 = _T_45 | _T_595; // @[Lookup.scala 33:37]
  wire  _T_597 = _T_43 | _T_596; // @[Lookup.scala 33:37]
  wire  _T_598 = _T_41 | _T_597; // @[Lookup.scala 33:37]
  wire  _T_599 = _T_39 | _T_598; // @[Lookup.scala 33:37]
  wire  _T_600 = _T_37 ? 1'h0 : _T_599; // @[Lookup.scala 33:37]
  wire  _T_601 = _T_35 ? 1'h0 : _T_600; // @[Lookup.scala 33:37]
  wire  _T_602 = _T_33 ? 1'h0 : _T_601; // @[Lookup.scala 33:37]
  wire  _T_603 = _T_31 ? 1'h0 : _T_602; // @[Lookup.scala 33:37]
  wire  _T_604 = _T_29 ? 1'h0 : _T_603; // @[Lookup.scala 33:37]
  wire  _T_605 = _T_27 ? 1'h0 : _T_604; // @[Lookup.scala 33:37]
  wire  _T_606 = _T_25 | _T_605; // @[Lookup.scala 33:37]
  wire  _T_607 = _T_23 | _T_606; // @[Lookup.scala 33:37]
  wire  _T_608 = _T_21 | _T_607; // @[Lookup.scala 33:37]
  wire  _T_609 = _T_19 | _T_608; // @[Lookup.scala 33:37]
  wire  _T_610 = _T_17 ? 1'h0 : _T_609; // @[Lookup.scala 33:37]
  wire  _T_611 = _T_15 ? 1'h0 : _T_610; // @[Lookup.scala 33:37]
  wire  _T_612 = _T_13 ? 1'h0 : _T_611; // @[Lookup.scala 33:37]
  wire  _T_613 = _T_11 | _T_612; // @[Lookup.scala 33:37]
  wire  _T_614 = _T_9 | _T_613; // @[Lookup.scala 33:37]
  wire  _T_615 = _T_7 | _T_614; // @[Lookup.scala 33:37]
  wire  _T_616 = _T_5 | _T_615; // @[Lookup.scala 33:37]
  wire  _T_617 = _T_3 | _T_616; // @[Lookup.scala 33:37]
  wire  _T_646 = _T_57 ? 1'h0 : _T_59; // @[Lookup.scala 33:37]
  wire  _T_647 = _T_55 ? 1'h0 : _T_646; // @[Lookup.scala 33:37]
  wire  _T_648 = _T_53 ? 1'h0 : _T_647; // @[Lookup.scala 33:37]
  wire  _T_649 = _T_51 ? 1'h0 : _T_648; // @[Lookup.scala 33:37]
  wire  _T_650 = _T_49 ? 1'h0 : _T_649; // @[Lookup.scala 33:37]
  wire  _T_651 = _T_47 ? 1'h0 : _T_650; // @[Lookup.scala 33:37]
  wire  _T_652 = _T_45 ? 1'h0 : _T_651; // @[Lookup.scala 33:37]
  wire  _T_653 = _T_43 ? 1'h0 : _T_652; // @[Lookup.scala 33:37]
  wire  _T_654 = _T_41 ? 1'h0 : _T_653; // @[Lookup.scala 33:37]
  wire  _T_655 = _T_39 ? 1'h0 : _T_654; // @[Lookup.scala 33:37]
  wire  _T_656 = _T_37 ? 1'h0 : _T_655; // @[Lookup.scala 33:37]
  wire  _T_657 = _T_35 ? 1'h0 : _T_656; // @[Lookup.scala 33:37]
  wire  _T_658 = _T_33 ? 1'h0 : _T_657; // @[Lookup.scala 33:37]
  wire  _T_659 = _T_31 ? 1'h0 : _T_658; // @[Lookup.scala 33:37]
  wire  _T_660 = _T_29 ? 1'h0 : _T_659; // @[Lookup.scala 33:37]
  wire  _T_661 = _T_27 ? 1'h0 : _T_660; // @[Lookup.scala 33:37]
  wire  _T_662 = _T_25 ? 1'h0 : _T_661; // @[Lookup.scala 33:37]
  wire  _T_663 = _T_23 ? 1'h0 : _T_662; // @[Lookup.scala 33:37]
  wire  _T_664 = _T_21 ? 1'h0 : _T_663; // @[Lookup.scala 33:37]
  wire  _T_665 = _T_19 ? 1'h0 : _T_664; // @[Lookup.scala 33:37]
  wire  _T_666 = _T_17 ? 1'h0 : _T_665; // @[Lookup.scala 33:37]
  wire  _T_667 = _T_15 ? 1'h0 : _T_666; // @[Lookup.scala 33:37]
  wire  _T_668 = _T_13 ? 1'h0 : _T_667; // @[Lookup.scala 33:37]
  wire  _T_669 = _T_11 | _T_668; // @[Lookup.scala 33:37]
  wire  _T_670 = _T_9 | _T_669; // @[Lookup.scala 33:37]
  wire  _T_671 = _T_7 | _T_670; // @[Lookup.scala 33:37]
  wire  _T_672 = _T_5 | _T_671; // @[Lookup.scala 33:37]
  wire  _T_673 = _T_3 | _T_672; // @[Lookup.scala 33:37]
  wire  _T_701 = _T_59 ? 1'h0 : _T_61; // @[Lookup.scala 33:37]
  wire  _T_702 = _T_57 ? 1'h0 : _T_701; // @[Lookup.scala 33:37]
  wire  _T_703 = _T_55 ? 1'h0 : _T_702; // @[Lookup.scala 33:37]
  wire  _T_704 = _T_53 ? 1'h0 : _T_703; // @[Lookup.scala 33:37]
  wire  _T_705 = _T_51 ? 1'h0 : _T_704; // @[Lookup.scala 33:37]
  wire  _T_706 = _T_49 ? 1'h0 : _T_705; // @[Lookup.scala 33:37]
  wire  _T_707 = _T_47 ? 1'h0 : _T_706; // @[Lookup.scala 33:37]
  wire  _T_708 = _T_45 ? 1'h0 : _T_707; // @[Lookup.scala 33:37]
  wire  _T_709 = _T_43 ? 1'h0 : _T_708; // @[Lookup.scala 33:37]
  wire  _T_710 = _T_41 ? 1'h0 : _T_709; // @[Lookup.scala 33:37]
  wire  _T_711 = _T_39 ? 1'h0 : _T_710; // @[Lookup.scala 33:37]
  wire  _T_712 = _T_37 ? 1'h0 : _T_711; // @[Lookup.scala 33:37]
  wire  _T_713 = _T_35 ? 1'h0 : _T_712; // @[Lookup.scala 33:37]
  wire  _T_714 = _T_33 ? 1'h0 : _T_713; // @[Lookup.scala 33:37]
  wire  _T_715 = _T_31 ? 1'h0 : _T_714; // @[Lookup.scala 33:37]
  wire  _T_716 = _T_29 ? 1'h0 : _T_715; // @[Lookup.scala 33:37]
  wire  _T_717 = _T_27 ? 1'h0 : _T_716; // @[Lookup.scala 33:37]
  wire  _T_718 = _T_25 ? 1'h0 : _T_717; // @[Lookup.scala 33:37]
  wire  _T_719 = _T_23 ? 1'h0 : _T_718; // @[Lookup.scala 33:37]
  wire  _T_720 = _T_21 ? 1'h0 : _T_719; // @[Lookup.scala 33:37]
  wire  _T_721 = _T_19 ? 1'h0 : _T_720; // @[Lookup.scala 33:37]
  wire  _T_722 = _T_17 | _T_721; // @[Lookup.scala 33:37]
  wire  _T_723 = _T_15 | _T_722; // @[Lookup.scala 33:37]
  wire  _T_724 = _T_13 | _T_723; // @[Lookup.scala 33:37]
  wire  _T_725 = _T_11 ? 1'h0 : _T_724; // @[Lookup.scala 33:37]
  wire  _T_726 = _T_9 ? 1'h0 : _T_725; // @[Lookup.scala 33:37]
  wire  _T_727 = _T_7 ? 1'h0 : _T_726; // @[Lookup.scala 33:37]
  wire  _T_728 = _T_5 ? 1'h0 : _T_727; // @[Lookup.scala 33:37]
  wire  _T_729 = _T_3 ? 1'h0 : _T_728; // @[Lookup.scala 33:37]
  wire [7:0] _T_778 = _T_17 ? 8'hf : 8'hff; // @[Lookup.scala 33:37]
  wire [7:0] _T_779 = _T_15 ? 8'h3 : _T_778; // @[Lookup.scala 33:37]
  wire [7:0] _T_780 = _T_13 ? 8'h1 : _T_779; // @[Lookup.scala 33:37]
  wire [7:0] _T_781 = _T_11 ? 8'hff : _T_780; // @[Lookup.scala 33:37]
  wire [7:0] _T_782 = _T_9 ? 8'hff : _T_781; // @[Lookup.scala 33:37]
  wire [7:0] _T_783 = _T_7 ? 8'hff : _T_782; // @[Lookup.scala 33:37]
  wire [7:0] _T_784 = _T_5 ? 8'hff : _T_783; // @[Lookup.scala 33:37]
  wire [7:0] _T_785 = _T_3 ? 8'hff : _T_784; // @[Lookup.scala 33:37]
  wire [2:0] _T_813 = _T_59 ? 3'h6 : 3'h0; // @[Lookup.scala 33:37]
  wire [2:0] _T_814 = _T_57 ? 3'h0 : _T_813; // @[Lookup.scala 33:37]
  wire [2:0] _T_815 = _T_55 ? 3'h0 : _T_814; // @[Lookup.scala 33:37]
  wire [2:0] _T_816 = _T_53 ? 3'h0 : _T_815; // @[Lookup.scala 33:37]
  wire [2:0] _T_817 = _T_51 ? 3'h0 : _T_816; // @[Lookup.scala 33:37]
  wire [2:0] _T_818 = _T_49 ? 3'h0 : _T_817; // @[Lookup.scala 33:37]
  wire [2:0] _T_819 = _T_47 ? 3'h0 : _T_818; // @[Lookup.scala 33:37]
  wire [2:0] _T_820 = _T_45 ? 3'h0 : _T_819; // @[Lookup.scala 33:37]
  wire [2:0] _T_821 = _T_43 ? 3'h0 : _T_820; // @[Lookup.scala 33:37]
  wire [2:0] _T_822 = _T_41 ? 3'h0 : _T_821; // @[Lookup.scala 33:37]
  wire [2:0] _T_823 = _T_39 ? 3'h0 : _T_822; // @[Lookup.scala 33:37]
  wire [2:0] _T_824 = _T_37 ? 3'h0 : _T_823; // @[Lookup.scala 33:37]
  wire [2:0] _T_825 = _T_35 ? 3'h0 : _T_824; // @[Lookup.scala 33:37]
  wire [2:0] _T_826 = _T_33 ? 3'h0 : _T_825; // @[Lookup.scala 33:37]
  wire [2:0] _T_827 = _T_31 ? 3'h0 : _T_826; // @[Lookup.scala 33:37]
  wire [2:0] _T_828 = _T_29 ? 3'h0 : _T_827; // @[Lookup.scala 33:37]
  wire [2:0] _T_829 = _T_27 ? 3'h0 : _T_828; // @[Lookup.scala 33:37]
  wire [2:0] _T_830 = _T_25 ? 3'h0 : _T_829; // @[Lookup.scala 33:37]
  wire [2:0] _T_831 = _T_23 ? 3'h0 : _T_830; // @[Lookup.scala 33:37]
  wire [2:0] _T_832 = _T_21 ? 3'h0 : _T_831; // @[Lookup.scala 33:37]
  wire [2:0] _T_833 = _T_19 ? 3'h0 : _T_832; // @[Lookup.scala 33:37]
  wire [2:0] _T_834 = _T_17 ? 3'h0 : _T_833; // @[Lookup.scala 33:37]
  wire [2:0] _T_835 = _T_15 ? 3'h0 : _T_834; // @[Lookup.scala 33:37]
  wire [2:0] _T_836 = _T_13 ? 3'h0 : _T_835; // @[Lookup.scala 33:37]
  wire [2:0] _T_837 = _T_11 ? 3'h5 : _T_836; // @[Lookup.scala 33:37]
  wire [2:0] _T_838 = _T_9 ? 3'h3 : _T_837; // @[Lookup.scala 33:37]
  wire [2:0] _T_839 = _T_7 ? 3'h1 : _T_838; // @[Lookup.scala 33:37]
  wire [2:0] _T_840 = _T_5 ? 3'h4 : _T_839; // @[Lookup.scala 33:37]
  wire [2:0] _T_841 = _T_3 ? 3'h2 : _T_840; // @[Lookup.scala 33:37]
  wire  _T_954 = cs_br_type == 4'h0; // @[cpath.scala 117:20]
  wire  _T_955 = cs_br_type == 4'h1; // @[cpath.scala 118:22]
  wire  _T_956 = ~io_dat_dec_br_eq; // @[cpath.scala 118:38]
  wire [1:0] _T_957 = _T_956 ? 2'h1 : 2'h0; // @[cpath.scala 118:37]
  wire  _T_958 = cs_br_type == 4'h2; // @[cpath.scala 119:24]
  wire [1:0] _T_959 = io_dat_dec_br_eq ? 2'h1 : 2'h0; // @[cpath.scala 119:39]
  wire  _T_960 = cs_br_type == 4'h3; // @[cpath.scala 120:26]
  wire  _T_961 = ~io_dat_dec_br_lt; // @[cpath.scala 120:42]
  wire [1:0] _T_962 = _T_961 ? 2'h1 : 2'h0; // @[cpath.scala 120:41]
  wire  _T_963 = cs_br_type == 4'h4; // @[cpath.scala 121:28]
  wire  _T_964 = ~io_dat_dec_br_ltu; // @[cpath.scala 121:44]
  wire [1:0] _T_965 = _T_964 ? 2'h1 : 2'h0; // @[cpath.scala 121:43]
  wire  _T_966 = cs_br_type == 4'h5; // @[cpath.scala 122:30]
  wire [1:0] _T_967 = io_dat_dec_br_lt ? 2'h1 : 2'h0; // @[cpath.scala 122:45]
  wire  _T_968 = cs_br_type == 4'h6; // @[cpath.scala 123:32]
  wire [1:0] _T_969 = io_dat_dec_br_ltu ? 2'h1 : 2'h0; // @[cpath.scala 123:47]
  wire  _T_970 = cs_br_type == 4'h7; // @[cpath.scala 124:34]
  wire  _T_971 = cs_br_type == 4'h8; // @[cpath.scala 125:36]
  wire [1:0] _T_972 = _T_971 ? 2'h2 : 2'h0; // @[cpath.scala 125:24]
  wire [1:0] _T_973 = _T_970 ? 2'h1 : _T_972; // @[cpath.scala 124:22]
  wire [1:0] _T_974 = _T_968 ? _T_969 : _T_973; // @[cpath.scala 123:20]
  wire [1:0] _T_975 = _T_966 ? _T_967 : _T_974; // @[cpath.scala 122:18]
  wire [1:0] _T_976 = _T_963 ? _T_965 : _T_975; // @[cpath.scala 121:16]
  wire [1:0] _T_977 = _T_960 ? _T_962 : _T_976; // @[cpath.scala 120:14]
  wire [1:0] _T_978 = _T_958 ? _T_959 : _T_977; // @[cpath.scala 119:12]
  wire [1:0] _T_979 = _T_955 ? _T_957 : _T_978; // @[cpath.scala 118:10]
  wire  nemu_halt = 64'h5006b == _T_112; // @[cpath.scala 154:35]
  assign io_ctl_dec_pc_sel = _T_954 ? 2'h0 : _T_979; // @[cpath.scala 131:21]
  assign io_ctl_op1_sel = _T_1 ? 2'h0 : _T_281; // @[cpath.scala 133:21]
  assign io_ctl_op2_sel = _T_1 ? 3'h2 : _T_337; // @[cpath.scala 134:21]
  assign io_ctl_alu_fun = _T_1 ? 5'h0 : _T_505; // @[cpath.scala 135:21]
  assign io_ctl_wb_sel = _T_1 ? 3'h2 : _T_561; // @[cpath.scala 136:21]
  assign io_ctl_rf_wen = _T_1 | _T_617; // @[cpath.scala 137:21]
  assign io_ctl_mem_ren = _T_1 | _T_673; // @[cpath.scala 138:21]
  assign io_ctl_mem_wen = _T_1 ? 1'h0 : _T_729; // @[cpath.scala 139:21]
  assign io_ctl_mem_mask = _T_1 ? 8'hff : _T_785; // @[cpath.scala 140:21]
  assign io_ctl_mem_ext = _T_1 ? 3'h0 : _T_841; // @[cpath.scala 141:21]
  assign nemu_halt_0 = _T_113;
endmodule
module regfile(
  input         clock,
  input         reset,
  input  [4:0]  io_raddr1,
  input  [4:0]  io_raddr2,
  output [63:0] io_rdata1,
  output [63:0] io_rdata2,
  input         io_we,
  input  [4:0]  io_waddr,
  input  [63:0] io_wdata,
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
  output [63:0] _T_41_0_31
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [63:0] rf [0:31]; // @[regfile.scala 20:15]
  wire [63:0] rf__T_1_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_1_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_4_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_4_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_9_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_9_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_10_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_10_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_11_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_11_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_12_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_12_addr; // @[regfile.scala 20:15]
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
  wire [63:0] rf__T_42_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_42_addr; // @[regfile.scala 20:15]
  wire [63:0] rf__T_8_data; // @[regfile.scala 20:15]
  wire [4:0] rf__T_8_addr; // @[regfile.scala 20:15]
  wire  rf__T_8_mask; // @[regfile.scala 20:15]
  wire  rf__T_8_en; // @[regfile.scala 20:15]
  wire  _T = io_raddr1 == 5'h0; // @[regfile.scala 23:30]
  wire  _T_3 = io_raddr2 == 5'h0; // @[regfile.scala 24:30]
  wire  _T_6 = io_waddr != 5'h0; // @[regfile.scala 26:27]
  wire  _T_44 = ~reset; // @[regfile.scala 31:11]
  wire [63:0] _T_41_0 = rf__T_9_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_1 = rf__T_10_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_2 = rf__T_11_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_3 = rf__T_12_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_4 = rf__T_13_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_5 = rf__T_14_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_6 = rf__T_15_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_7 = rf__T_16_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_8 = rf__T_17_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_9 = rf__T_18_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_10 = rf__T_19_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_11 = rf__T_20_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_12 = rf__T_21_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_13 = rf__T_22_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_14 = rf__T_23_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_15 = rf__T_24_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_16 = rf__T_25_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_17 = rf__T_26_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_18 = rf__T_27_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_19 = rf__T_28_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_20 = rf__T_29_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_21 = rf__T_30_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_22 = rf__T_31_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_23 = rf__T_32_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_24 = rf__T_33_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_25 = rf__T_34_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_26 = rf__T_35_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_27 = rf__T_36_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_28 = rf__T_37_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_29 = rf__T_38_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_30 = rf__T_39_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  wire [63:0] _T_41_31 = rf__T_40_data; // @[regfile.scala 29:32 regfile.scala 29:32]
  assign rf__T_1_addr = io_raddr1;
  assign rf__T_1_data = rf[rf__T_1_addr]; // @[regfile.scala 20:15]
  assign rf__T_4_addr = io_raddr2;
  assign rf__T_4_data = rf[rf__T_4_addr]; // @[regfile.scala 20:15]
  assign rf__T_9_addr = 5'h0;
  assign rf__T_9_data = rf[rf__T_9_addr]; // @[regfile.scala 20:15]
  assign rf__T_10_addr = 5'h1;
  assign rf__T_10_data = rf[rf__T_10_addr]; // @[regfile.scala 20:15]
  assign rf__T_11_addr = 5'h2;
  assign rf__T_11_data = rf[rf__T_11_addr]; // @[regfile.scala 20:15]
  assign rf__T_12_addr = 5'h3;
  assign rf__T_12_data = rf[rf__T_12_addr]; // @[regfile.scala 20:15]
  assign rf__T_13_addr = 5'h4;
  assign rf__T_13_data = rf[rf__T_13_addr]; // @[regfile.scala 20:15]
  assign rf__T_14_addr = 5'h5;
  assign rf__T_14_data = rf[rf__T_14_addr]; // @[regfile.scala 20:15]
  assign rf__T_15_addr = 5'h6;
  assign rf__T_15_data = rf[rf__T_15_addr]; // @[regfile.scala 20:15]
  assign rf__T_16_addr = 5'h7;
  assign rf__T_16_data = rf[rf__T_16_addr]; // @[regfile.scala 20:15]
  assign rf__T_17_addr = 5'h8;
  assign rf__T_17_data = rf[rf__T_17_addr]; // @[regfile.scala 20:15]
  assign rf__T_18_addr = 5'h9;
  assign rf__T_18_data = rf[rf__T_18_addr]; // @[regfile.scala 20:15]
  assign rf__T_19_addr = 5'ha;
  assign rf__T_19_data = rf[rf__T_19_addr]; // @[regfile.scala 20:15]
  assign rf__T_20_addr = 5'hb;
  assign rf__T_20_data = rf[rf__T_20_addr]; // @[regfile.scala 20:15]
  assign rf__T_21_addr = 5'hc;
  assign rf__T_21_data = rf[rf__T_21_addr]; // @[regfile.scala 20:15]
  assign rf__T_22_addr = 5'hd;
  assign rf__T_22_data = rf[rf__T_22_addr]; // @[regfile.scala 20:15]
  assign rf__T_23_addr = 5'he;
  assign rf__T_23_data = rf[rf__T_23_addr]; // @[regfile.scala 20:15]
  assign rf__T_24_addr = 5'hf;
  assign rf__T_24_data = rf[rf__T_24_addr]; // @[regfile.scala 20:15]
  assign rf__T_25_addr = 5'h10;
  assign rf__T_25_data = rf[rf__T_25_addr]; // @[regfile.scala 20:15]
  assign rf__T_26_addr = 5'h11;
  assign rf__T_26_data = rf[rf__T_26_addr]; // @[regfile.scala 20:15]
  assign rf__T_27_addr = 5'h12;
  assign rf__T_27_data = rf[rf__T_27_addr]; // @[regfile.scala 20:15]
  assign rf__T_28_addr = 5'h13;
  assign rf__T_28_data = rf[rf__T_28_addr]; // @[regfile.scala 20:15]
  assign rf__T_29_addr = 5'h14;
  assign rf__T_29_data = rf[rf__T_29_addr]; // @[regfile.scala 20:15]
  assign rf__T_30_addr = 5'h15;
  assign rf__T_30_data = rf[rf__T_30_addr]; // @[regfile.scala 20:15]
  assign rf__T_31_addr = 5'h16;
  assign rf__T_31_data = rf[rf__T_31_addr]; // @[regfile.scala 20:15]
  assign rf__T_32_addr = 5'h17;
  assign rf__T_32_data = rf[rf__T_32_addr]; // @[regfile.scala 20:15]
  assign rf__T_33_addr = 5'h18;
  assign rf__T_33_data = rf[rf__T_33_addr]; // @[regfile.scala 20:15]
  assign rf__T_34_addr = 5'h19;
  assign rf__T_34_data = rf[rf__T_34_addr]; // @[regfile.scala 20:15]
  assign rf__T_35_addr = 5'h1a;
  assign rf__T_35_data = rf[rf__T_35_addr]; // @[regfile.scala 20:15]
  assign rf__T_36_addr = 5'h1b;
  assign rf__T_36_data = rf[rf__T_36_addr]; // @[regfile.scala 20:15]
  assign rf__T_37_addr = 5'h1c;
  assign rf__T_37_data = rf[rf__T_37_addr]; // @[regfile.scala 20:15]
  assign rf__T_38_addr = 5'h1d;
  assign rf__T_38_data = rf[rf__T_38_addr]; // @[regfile.scala 20:15]
  assign rf__T_39_addr = 5'h1e;
  assign rf__T_39_data = rf[rf__T_39_addr]; // @[regfile.scala 20:15]
  assign rf__T_40_addr = 5'h1f;
  assign rf__T_40_data = rf[rf__T_40_addr]; // @[regfile.scala 20:15]
  assign rf__T_42_addr = 5'hf;
  assign rf__T_42_data = rf[rf__T_42_addr]; // @[regfile.scala 20:15]
  assign rf__T_8_data = io_wdata;
  assign rf__T_8_addr = io_waddr;
  assign rf__T_8_mask = 1'h1;
  assign rf__T_8_en = io_we & _T_6;
  assign io_rdata1 = _T ? 64'h0 : rf__T_1_data; // @[regfile.scala 23:13]
  assign io_rdata2 = _T_3 ? 64'h0 : rf__T_4_data; // @[regfile.scala 24:13]
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
    if(rf__T_8_en & rf__T_8_mask) begin
      rf[rf__T_8_addr] <= rf__T_8_data; // @[regfile.scala 20:15]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_44) begin
          $fwrite(32'h80000002,"RF: a5 = [%x] rdata1(%d)=[%x] rdata2(%d)=[%x] wdata(%d)=[%x] we=%d\n",rf__T_42_data,io_raddr1,io_rdata1,io_raddr2,io_rdata2,io_waddr,io_wdata,io_we); // @[regfile.scala 31:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module Multiplier(
  input         clock,
  input         reset,
  input         io_start,
  input  [63:0] io_a,
  input  [63:0] io_b,
  input  [4:0]  io_op,
  output        io_stall_req,
  output [63:0] io_mult_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [127:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] last_a; // @[Multiplier.scala 218:23]
  reg [63:0] last_b; // @[Multiplier.scala 219:23]
  reg [4:0] last_op; // @[Multiplier.scala 220:24]
  wire  _T = io_op == 5'h12; // @[Multiplier.scala 228:23]
  wire  _T_1 = io_op == 5'h13; // @[Multiplier.scala 228:43]
  wire  _T_2 = _T | _T_1; // @[Multiplier.scala 228:34]
  wire  _T_3 = io_op == 5'h14; // @[Multiplier.scala 228:64]
  wire  _T_4 = _T_2 | _T_3; // @[Multiplier.scala 228:55]
  wire  _T_5 = io_op == 5'h15; // @[Multiplier.scala 228:87]
  wire  _T_6 = _T_4 | _T_5; // @[Multiplier.scala 228:78]
  wire  _T_7 = io_op == 5'h1a; // @[Multiplier.scala 228:109]
  wire  is_mult = _T_6 | _T_7; // @[Multiplier.scala 228:100]
  reg [127:0] res; // @[Multiplier.scala 229:20]
  reg [6:0] mult_cnt; // @[Multiplier.scala 230:25]
  reg [6:0] div_cnt; // @[Multiplier.scala 231:24]
  wire  sign_a = io_a[63]; // @[Multiplier.scala 232:20]
  wire  sign_wa = io_a[31]; // @[Multiplier.scala 233:21]
  wire [63:0] _T_10 = {32'h0,io_a[31:0]}; // @[Cat.scala 29:58]
  wire [63:0] _T_12 = ~io_a; // @[Multiplier.scala 237:40]
  wire [63:0] _T_14 = _T_12 + 64'h1; // @[Multiplier.scala 237:47]
  wire [63:0] _T_15 = sign_a ? _T_14 : io_a; // @[Multiplier.scala 237:21]
  wire [31:0] _T_36 = sign_wa ? _T_14[31:0] : io_a[31:0]; // @[Multiplier.scala 243:40]
  wire [63:0] _T_37 = {32'h0,_T_36}; // @[Cat.scala 29:58]
  wire  _T_58 = 5'h12 == io_op; // @[Mux.scala 80:60]
  wire [63:0] _T_59 = _T_58 ? io_a : _T_10; // @[Mux.scala 80:57]
  wire  _T_60 = 5'h13 == io_op; // @[Mux.scala 80:60]
  wire [63:0] _T_61 = _T_60 ? _T_15 : _T_59; // @[Mux.scala 80:57]
  wire  _T_62 = 5'h14 == io_op; // @[Mux.scala 80:60]
  wire [63:0] _T_63 = _T_62 ? _T_15 : _T_61; // @[Mux.scala 80:57]
  wire  _T_64 = 5'h15 == io_op; // @[Mux.scala 80:60]
  wire [63:0] _T_65 = _T_64 ? io_a : _T_63; // @[Mux.scala 80:57]
  wire  _T_66 = 5'h1a == io_op; // @[Mux.scala 80:60]
  wire [63:0] _T_67 = _T_66 ? _T_10 : _T_65; // @[Mux.scala 80:57]
  wire  _T_68 = 5'h16 == io_op; // @[Mux.scala 80:60]
  wire [63:0] _T_69 = _T_68 ? _T_15 : _T_67; // @[Mux.scala 80:57]
  wire  _T_70 = 5'h17 == io_op; // @[Mux.scala 80:60]
  wire [63:0] _T_71 = _T_70 ? io_a : _T_69; // @[Mux.scala 80:57]
  wire  _T_72 = 5'h1b == io_op; // @[Mux.scala 80:60]
  wire [63:0] _T_73 = _T_72 ? _T_37 : _T_71; // @[Mux.scala 80:57]
  wire  _T_74 = 5'h1c == io_op; // @[Mux.scala 80:60]
  wire [63:0] _T_75 = _T_74 ? _T_10 : _T_73; // @[Mux.scala 80:57]
  wire  _T_76 = 5'h18 == io_op; // @[Mux.scala 80:60]
  wire [63:0] _T_77 = _T_76 ? _T_15 : _T_75; // @[Mux.scala 80:57]
  wire  _T_78 = 5'h19 == io_op; // @[Mux.scala 80:60]
  wire [63:0] _T_79 = _T_78 ? io_a : _T_77; // @[Mux.scala 80:57]
  wire  _T_80 = 5'h1d == io_op; // @[Mux.scala 80:60]
  wire [63:0] _T_81 = _T_80 ? _T_37 : _T_79; // @[Mux.scala 80:57]
  wire  _T_82 = 5'h1e == io_op; // @[Mux.scala 80:60]
  wire [63:0] abs_a = _T_82 ? _T_10 : _T_81; // @[Mux.scala 80:57]
  wire  sign_b = io_b[63]; // @[Multiplier.scala 254:20]
  wire  sign_wb = io_b[31]; // @[Multiplier.scala 255:21]
  wire [63:0] _T_85 = {32'h0,io_b[31:0]}; // @[Cat.scala 29:58]
  wire [63:0] _T_87 = ~io_b; // @[Multiplier.scala 259:40]
  wire [63:0] _T_89 = _T_87 + 64'h1; // @[Multiplier.scala 259:47]
  wire [63:0] _T_90 = sign_b ? _T_89 : io_b; // @[Multiplier.scala 259:21]
  wire [31:0] _T_106 = sign_wb ? _T_89[31:0] : io_b[31:0]; // @[Multiplier.scala 265:40]
  wire [63:0] _T_107 = {32'h0,_T_106}; // @[Cat.scala 29:58]
  wire [63:0] _T_129 = _T_58 ? io_b : _T_85; // @[Mux.scala 80:57]
  wire [63:0] _T_131 = _T_60 ? _T_90 : _T_129; // @[Mux.scala 80:57]
  wire [63:0] _T_133 = _T_62 ? io_b : _T_131; // @[Mux.scala 80:57]
  wire [63:0] _T_135 = _T_64 ? io_b : _T_133; // @[Mux.scala 80:57]
  wire [63:0] _T_137 = _T_66 ? _T_85 : _T_135; // @[Mux.scala 80:57]
  wire [63:0] _T_139 = _T_68 ? _T_90 : _T_137; // @[Mux.scala 80:57]
  wire [63:0] _T_141 = _T_70 ? io_b : _T_139; // @[Mux.scala 80:57]
  wire [63:0] _T_143 = _T_72 ? _T_107 : _T_141; // @[Mux.scala 80:57]
  wire [63:0] _T_145 = _T_74 ? _T_85 : _T_143; // @[Mux.scala 80:57]
  wire [63:0] _T_147 = _T_76 ? _T_90 : _T_145; // @[Mux.scala 80:57]
  wire [63:0] _T_149 = _T_78 ? io_b : _T_147; // @[Mux.scala 80:57]
  wire [63:0] _T_151 = _T_80 ? _T_107 : _T_149; // @[Mux.scala 80:57]
  wire [63:0] abs_b = _T_82 ? _T_85 : _T_151; // @[Mux.scala 80:57]
  wire  _T_153 = sign_a == sign_b; // @[Multiplier.scala 273:27]
  wire [127:0] _T_154 = ~res; // @[Multiplier.scala 273:46]
  wire [127:0] _T_156 = _T_154 + 128'h1; // @[Multiplier.scala 273:52]
  wire [127:0] res_ss = _T_153 ? res : _T_156; // @[Multiplier.scala 273:19]
  wire  _T_157 = ~sign_a; // @[Multiplier.scala 274:27]
  wire [127:0] res_su = _T_157 ? res : _T_156; // @[Multiplier.scala 274:19]
  wire [63:0] _T_164 = ~res[63:0]; // @[Multiplier.scala 275:61]
  wire [63:0] _T_166 = _T_164 + 64'h1; // @[Multiplier.scala 275:80]
  wire [63:0] res_divs = _T_153 ? res[63:0] : _T_166; // @[Multiplier.scala 275:21]
  wire [63:0] _T_170 = ~res[127:64]; // @[Multiplier.scala 276:65]
  wire [63:0] _T_172 = _T_170 + 64'h1; // @[Multiplier.scala 276:91]
  wire [63:0] res_rems = _T_157 ? res[127:64] : _T_172; // @[Multiplier.scala 276:21]
  wire  _T_173 = sign_wa == sign_wb; // @[Multiplier.scala 277:31]
  wire [31:0] _T_176 = ~res[31:0]; // @[Multiplier.scala 277:58]
  wire [31:0] _T_178 = _T_176 + 32'h1; // @[Multiplier.scala 277:71]
  wire [31:0] res_divsw = _T_173 ? res[31:0] : _T_178; // @[Multiplier.scala 277:22]
  wire [31:0] _T_182 = ~res[95:64]; // @[Multiplier.scala 278:63]
  wire [31:0] _T_184 = _T_182 + 32'h1; // @[Multiplier.scala 278:86]
  wire [31:0] res_remsw = _T_157 ? res[95:64] : _T_184; // @[Multiplier.scala 278:22]
  reg  last_stall_req; // @[Multiplier.scala 279:31]
  wire [6:0] _T_186 = mult_cnt + 7'h1; // @[Multiplier.scala 288:30]
  wire  _T_187 = ~last_stall_req; // @[Multiplier.scala 293:14]
  wire [127:0] _T_189 = {64'h0,abs_b}; // @[Cat.scala 29:58]
  wire [63:0] _T_206 = res[0] ? abs_a : 64'h0; // @[Multiplier.scala 322:39]
  wire [64:0] _T_207 = {1'h0,_T_206}; // @[Cat.scala 29:58]
  wire [64:0] _T_209 = {1'h0,res[127:64]}; // @[Cat.scala 29:58]
  wire [64:0] _T_211 = _T_207 + _T_209; // @[Multiplier.scala 322:69]
  wire  _T_289 = res[127:64] >= abs_b; // @[Multiplier.scala 335:46]
  wire [63:0] _T_292 = res[127:64] - abs_b; // @[Multiplier.scala 335:80]
  wire [63:0] _T_294 = _T_289 ? _T_292 : res[127:64]; // @[Multiplier.scala 335:21]
  wire [64:0] front_val = is_mult ? _T_211 : {{1'd0}, _T_294}; // @[Multiplier.scala 321:17]
  wire [127:0] _T_214 = {front_val[63:0],res[63:0]}; // @[Cat.scala 29:58]
  wire [127:0] _T_300 = {front_val[62:0],res[63:0],_T_289}; // @[Cat.scala 29:58]
  wire [127:0] step_result = is_mult ? _T_214 : _T_300; // @[Multiplier.scala 321:17]
  wire [127:0] _T_192 = {front_val[64],step_result[127:1]}; // @[Cat.scala 29:58]
  wire [6:0] _T_194 = div_cnt + 7'h1; // @[Multiplier.scala 301:28]
  wire [127:0] _T_198 = {63'h0,abs_a,1'h0}; // @[Cat.scala 29:58]
  wire  _T_199 = div_cnt == 7'h40; // @[Multiplier.scala 308:28]
  wire [127:0] _T_204 = {front_val[63],step_result[127:65],step_result[63:0]}; // @[Cat.scala 29:58]
  wire  _T_215 = mult_cnt != 7'h41; // @[Multiplier.scala 324:43]
  wire  _T_217 = io_a == last_a; // @[Multiplier.scala 215:7]
  wire  _T_218 = io_b == last_b; // @[Multiplier.scala 215:19]
  wire  _T_219 = _T_217 & _T_218; // @[Multiplier.scala 215:14]
  wire  _T_220 = last_op == 5'h15; // @[Multiplier.scala 203:19]
  wire  _T_221 = last_op == 5'h13; // @[Multiplier.scala 203:46]
  wire  _T_222 = _T_220 | _T_221; // @[Multiplier.scala 203:32]
  wire  _T_223 = last_op == 5'h14; // @[Multiplier.scala 203:72]
  wire  _T_224 = _T_222 | _T_223; // @[Multiplier.scala 203:58]
  wire  _T_226 = _T_224 & _T; // @[Multiplier.scala 203:87]
  wire  _T_227 = last_op == 5'h16; // @[Multiplier.scala 204:19]
  wire  _T_228 = io_op == 5'h18; // @[Multiplier.scala 204:36]
  wire  _T_229 = _T_227 & _T_228; // @[Multiplier.scala 204:30]
  wire  _T_230 = _T_226 | _T_229; // @[Multiplier.scala 203:105]
  wire  _T_231 = last_op == 5'h17; // @[Multiplier.scala 205:19]
  wire  _T_232 = io_op == 5'h19; // @[Multiplier.scala 205:37]
  wire  _T_233 = _T_231 & _T_232; // @[Multiplier.scala 205:31]
  wire  _T_234 = _T_230 | _T_233; // @[Multiplier.scala 204:48]
  wire  _T_235 = last_op == 5'h1c; // @[Multiplier.scala 206:19]
  wire  _T_236 = io_op == 5'h1e; // @[Multiplier.scala 206:38]
  wire  _T_237 = _T_235 & _T_236; // @[Multiplier.scala 206:32]
  wire  _T_238 = _T_234 | _T_237; // @[Multiplier.scala 205:50]
  wire  _T_239 = last_op == 5'h1b; // @[Multiplier.scala 207:19]
  wire  _T_240 = io_op == 5'h1d; // @[Multiplier.scala 207:37]
  wire  _T_241 = _T_239 & _T_240; // @[Multiplier.scala 207:31]
  wire  _T_242 = _T_238 | _T_241; // @[Multiplier.scala 206:52]
  wire  _T_243 = io_op == 5'h16; // @[Multiplier.scala 208:11]
  wire  _T_244 = last_op == 5'h18; // @[Multiplier.scala 208:36]
  wire  _T_245 = _T_243 & _T_244; // @[Multiplier.scala 208:22]
  wire  _T_246 = _T_242 | _T_245; // @[Multiplier.scala 207:50]
  wire  _T_247 = io_op == 5'h17; // @[Multiplier.scala 209:11]
  wire  _T_248 = last_op == 5'h19; // @[Multiplier.scala 209:37]
  wire  _T_249 = _T_247 & _T_248; // @[Multiplier.scala 209:23]
  wire  _T_250 = _T_246 | _T_249; // @[Multiplier.scala 208:48]
  wire  _T_251 = io_op == 5'h1c; // @[Multiplier.scala 210:11]
  wire  _T_252 = last_op == 5'h1e; // @[Multiplier.scala 210:38]
  wire  _T_253 = _T_251 & _T_252; // @[Multiplier.scala 210:24]
  wire  _T_254 = _T_250 | _T_253; // @[Multiplier.scala 209:50]
  wire  _T_255 = io_op == 5'h1b; // @[Multiplier.scala 211:11]
  wire  _T_256 = last_op == 5'h1d; // @[Multiplier.scala 211:37]
  wire  _T_257 = _T_255 & _T_256; // @[Multiplier.scala 211:23]
  wire  _T_258 = _T_254 | _T_257; // @[Multiplier.scala 210:52]
  wire  _T_259 = _T_219 & _T_258; // @[Multiplier.scala 215:26]
  wire  _T_260 = ~_T_259; // @[Multiplier.scala 324:83]
  wire  _T_261 = _T_187 & _T_260; // @[Multiplier.scala 324:80]
  wire  _T_262 = _T_215 | _T_261; // @[Multiplier.scala 324:60]
  wire  _T_263 = io_start & _T_262; // @[Multiplier.scala 324:30]
  wire [31:0] _T_266 = res[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_268 = {_T_266,res[31:0]}; // @[Cat.scala 29:58]
  wire [63:0] _T_279 = _T_58 ? res[63:0] : _T_268; // @[Mux.scala 80:57]
  wire [63:0] _T_281 = _T_60 ? res_ss[127:64] : _T_279; // @[Mux.scala 80:57]
  wire [63:0] _T_283 = _T_62 ? res_su[127:64] : _T_281; // @[Mux.scala 80:57]
  wire [63:0] _T_285 = _T_64 ? res[127:64] : _T_283; // @[Mux.scala 80:57]
  wire [63:0] _T_287 = _T_66 ? _T_268 : _T_285; // @[Mux.scala 80:57]
  wire  _T_301 = div_cnt != 7'h41; // @[Multiplier.scala 337:42]
  wire  _T_348 = _T_301 | _T_261; // @[Multiplier.scala 337:59]
  wire  _T_349 = io_start & _T_348; // @[Multiplier.scala 337:30]
  wire  _T_350 = |io_b; // @[Multiplier.scala 340:28]
  wire [63:0] _T_352 = _T_350 ? res_divs : 64'hffffffffffffffff; // @[Multiplier.scala 340:22]
  wire [63:0] _T_356 = _T_350 ? res[63:0] : 64'hffffffffffffffff; // @[Multiplier.scala 341:23]
  wire  _T_358 = |io_b[31:0]; // @[Multiplier.scala 342:36]
  wire [31:0] _T_361 = res_divsw[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_362 = {_T_361,res_divsw}; // @[Cat.scala 29:58]
  wire [63:0] _T_364 = _T_358 ? _T_362 : 64'hffffffffffffffff; // @[Multiplier.scala 342:23]
  wire [63:0] _T_373 = _T_358 ? _T_268 : 64'hffffffffffffffff; // @[Multiplier.scala 343:24]
  wire [63:0] _T_375 = _T_350 ? res_rems : io_a; // @[Multiplier.scala 344:22]
  wire [63:0] _T_378 = _T_350 ? res[127:64] : io_a; // @[Multiplier.scala 345:23]
  wire [31:0] _T_383 = res_remsw[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_384 = {_T_383,res_remsw}; // @[Cat.scala 29:58]
  wire [63:0] _T_385 = _T_358 ? _T_384 : io_a; // @[Multiplier.scala 346:23]
  wire [31:0] _T_390 = res[95] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_392 = {_T_390,res[95:64]}; // @[Cat.scala 29:58]
  wire [63:0] _T_393 = _T_358 ? _T_392 : io_a; // @[Multiplier.scala 347:24]
  wire [63:0] _T_395 = _T_68 ? _T_352 : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _T_397 = _T_70 ? _T_356 : _T_395; // @[Mux.scala 80:57]
  wire [63:0] _T_399 = _T_72 ? _T_364 : _T_397; // @[Mux.scala 80:57]
  wire [63:0] _T_401 = _T_74 ? _T_373 : _T_399; // @[Mux.scala 80:57]
  wire [63:0] _T_403 = _T_76 ? _T_375 : _T_401; // @[Mux.scala 80:57]
  wire [63:0] _T_405 = _T_78 ? _T_378 : _T_403; // @[Mux.scala 80:57]
  wire [63:0] _T_407 = _T_80 ? _T_385 : _T_405; // @[Mux.scala 80:57]
  wire [63:0] _T_409 = _T_82 ? _T_393 : _T_407; // @[Mux.scala 80:57]
  assign io_stall_req = is_mult ? _T_263 : _T_349; // @[Multiplier.scala 324:18 Multiplier.scala 337:18]
  assign io_mult_out = is_mult ? _T_287 : _T_409; // @[Multiplier.scala 325:17 Multiplier.scala 338:17]
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
  last_a = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  last_b = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  last_op = _RAND_2[4:0];
  _RAND_3 = {4{`RANDOM}};
  res = _RAND_3[127:0];
  _RAND_4 = {1{`RANDOM}};
  mult_cnt = _RAND_4[6:0];
  _RAND_5 = {1{`RANDOM}};
  div_cnt = _RAND_5[6:0];
  _RAND_6 = {1{`RANDOM}};
  last_stall_req = _RAND_6[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      last_a <= 64'h0;
    end else if (io_start) begin
      last_a <= io_a;
    end
    if (reset) begin
      last_b <= 64'h0;
    end else if (io_start) begin
      last_b <= io_b;
    end
    if (reset) begin
      last_op <= 5'h0;
    end else if (io_start) begin
      last_op <= io_op;
    end
    if (reset) begin
      res <= 128'h0;
    end else if (io_start) begin
      if (is_mult) begin
        if (io_stall_req) begin
          if (_T_187) begin
            res <= _T_189;
          end else begin
            res <= _T_192;
          end
        end
      end else if (io_stall_req) begin
        if (_T_187) begin
          res <= _T_198;
        end else if (_T_199) begin
          res <= _T_204;
        end else if (is_mult) begin
          res <= _T_214;
        end else begin
          res <= _T_300;
        end
      end
    end
    if (reset) begin
      mult_cnt <= 7'h0;
    end else if (io_start) begin
      if (is_mult) begin
        if (io_stall_req) begin
          mult_cnt <= _T_186;
        end else begin
          mult_cnt <= 7'h0;
        end
      end
    end
    if (reset) begin
      div_cnt <= 7'h0;
    end else if (io_start) begin
      if (!(is_mult)) begin
        if (io_stall_req) begin
          div_cnt <= _T_194;
        end else begin
          div_cnt <= 7'h0;
        end
      end
    end
    if (reset) begin
      last_stall_req <= 1'h0;
    end else begin
      last_stall_req <= io_stall_req;
    end
  end
endmodule
module alu(
  input         clock,
  input         reset,
  input  [4:0]  io_alu_op,
  input  [63:0] io_src1,
  input  [63:0] io_src2,
  output [63:0] io_result,
  output        io_stall
);
  wire  multiplier_clock; // @[alu.scala 23:26]
  wire  multiplier_reset; // @[alu.scala 23:26]
  wire  multiplier_io_start; // @[alu.scala 23:26]
  wire [63:0] multiplier_io_a; // @[alu.scala 23:26]
  wire [63:0] multiplier_io_b; // @[alu.scala 23:26]
  wire [4:0] multiplier_io_op; // @[alu.scala 23:26]
  wire  multiplier_io_stall_req; // @[alu.scala 23:26]
  wire [63:0] multiplier_io_mult_out; // @[alu.scala 23:26]
  wire  _T = io_alu_op == 5'h12; // @[alu.scala 18:28]
  wire  _T_1 = io_alu_op == 5'h13; // @[alu.scala 18:53]
  wire  _T_2 = _T | _T_1; // @[alu.scala 18:40]
  wire  _T_3 = io_alu_op == 5'h14; // @[alu.scala 18:79]
  wire  _T_4 = _T_2 | _T_3; // @[alu.scala 18:66]
  wire  _T_5 = io_alu_op == 5'h15; // @[alu.scala 19:15]
  wire  _T_6 = _T_4 | _T_5; // @[alu.scala 18:94]
  wire  _T_7 = io_alu_op == 5'h16; // @[alu.scala 19:42]
  wire  _T_8 = _T_6 | _T_7; // @[alu.scala 19:29]
  wire  _T_9 = io_alu_op == 5'h17; // @[alu.scala 19:67]
  wire  _T_10 = _T_8 | _T_9; // @[alu.scala 19:54]
  wire  _T_11 = io_alu_op == 5'h18; // @[alu.scala 20:15]
  wire  _T_12 = _T_10 | _T_11; // @[alu.scala 19:80]
  wire  _T_13 = io_alu_op == 5'h19; // @[alu.scala 20:40]
  wire  _T_14 = _T_12 | _T_13; // @[alu.scala 20:27]
  wire  _T_15 = io_alu_op == 5'h1a; // @[alu.scala 20:66]
  wire  _T_16 = _T_14 | _T_15; // @[alu.scala 20:53]
  wire  _T_17 = io_alu_op == 5'h1b; // @[alu.scala 21:15]
  wire  _T_18 = _T_16 | _T_17; // @[alu.scala 20:79]
  wire  _T_19 = io_alu_op == 5'h1c; // @[alu.scala 21:41]
  wire  _T_20 = _T_18 | _T_19; // @[alu.scala 21:28]
  wire  _T_21 = io_alu_op == 5'h1d; // @[alu.scala 21:68]
  wire  _T_22 = _T_20 | _T_21; // @[alu.scala 21:55]
  wire  _T_23 = io_alu_op == 5'h1e; // @[alu.scala 22:15]
  wire  isMulDiv = _T_22 | _T_23; // @[alu.scala 21:81]
  wire [5:0] shamt = io_src2[5:0]; // @[alu.scala 33:22]
  wire  _T_25 = io_alu_op == 5'h0; // @[alu.scala 38:9]
  wire [63:0] _T_27 = io_src1 + io_src2; // @[alu.scala 38:31]
  wire  _T_28 = io_alu_op == 5'h1; // @[alu.scala 39:9]
  wire [63:0] _T_30 = io_src1 - io_src2; // @[alu.scala 39:31]
  wire  _T_31 = io_alu_op == 5'h6; // @[alu.scala 40:9]
  wire [63:0] _T_32 = io_src1 & io_src2; // @[alu.scala 40:31]
  wire  _T_33 = io_alu_op == 5'h7; // @[alu.scala 41:9]
  wire [63:0] _T_34 = io_src1 | io_src2; // @[alu.scala 41:31]
  wire  _T_35 = io_alu_op == 5'h8; // @[alu.scala 42:9]
  wire [63:0] _T_36 = io_src1 ^ io_src2; // @[alu.scala 42:31]
  wire  _T_37 = io_alu_op == 5'h9; // @[alu.scala 43:9]
  wire  _T_40 = $signed(io_src1) < $signed(io_src2); // @[alu.scala 43:40]
  wire  _T_41 = io_alu_op == 5'ha; // @[alu.scala 44:9]
  wire  _T_42 = io_src1 < io_src2; // @[alu.scala 44:31]
  wire  _T_43 = io_alu_op == 5'h2; // @[alu.scala 45:9]
  wire [126:0] _GEN_0 = {{63'd0}, io_src1}; // @[alu.scala 45:31]
  wire [126:0] _T_44 = _GEN_0 << shamt; // @[alu.scala 45:31]
  wire  _T_46 = io_alu_op == 5'h4; // @[alu.scala 46:9]
  wire [63:0] _T_49 = $signed(io_src1) >>> shamt; // @[alu.scala 46:56]
  wire  _T_50 = io_alu_op == 5'h5; // @[alu.scala 47:9]
  wire [31:0] _T_53 = io_src1[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_55 = io_src1[31:0]; // @[alu.scala 47:67]
  wire [31:0] _T_57 = $signed(_T_55) >>> shamt; // @[alu.scala 47:86]
  wire [63:0] _T_58 = {_T_53,_T_57}; // @[Cat.scala 29:58]
  wire  _T_59 = io_alu_op == 5'h3; // @[alu.scala 48:9]
  wire [63:0] _T_60 = io_src1 >> shamt; // @[alu.scala 48:31]
  wire  _T_61 = io_alu_op == 5'hb; // @[alu.scala 49:9]
  wire  _T_62 = io_alu_op == 5'hc; // @[alu.scala 50:9]
  wire [63:0] _T_63 = isMulDiv ? multiplier_io_mult_out : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] _T_64 = _T_62 ? io_src2 : _T_63; // @[Mux.scala 98:16]
  wire [63:0] _T_65 = _T_61 ? io_src1 : _T_64; // @[Mux.scala 98:16]
  wire [63:0] _T_66 = _T_59 ? _T_60 : _T_65; // @[Mux.scala 98:16]
  wire [63:0] _T_67 = _T_50 ? _T_58 : _T_66; // @[Mux.scala 98:16]
  wire [63:0] _T_68 = _T_46 ? _T_49 : _T_67; // @[Mux.scala 98:16]
  wire [63:0] _T_69 = _T_43 ? _T_44[63:0] : _T_68; // @[Mux.scala 98:16]
  wire [63:0] _T_70 = _T_41 ? {{63'd0}, _T_42} : _T_69; // @[Mux.scala 98:16]
  wire [63:0] _T_71 = _T_37 ? {{63'd0}, _T_40} : _T_70; // @[Mux.scala 98:16]
  wire [63:0] _T_72 = _T_35 ? _T_36 : _T_71; // @[Mux.scala 98:16]
  wire [63:0] _T_73 = _T_33 ? _T_34 : _T_72; // @[Mux.scala 98:16]
  wire [63:0] _T_74 = _T_31 ? _T_32 : _T_73; // @[Mux.scala 98:16]
  wire [63:0] _T_75 = _T_28 ? _T_30 : _T_74; // @[Mux.scala 98:16]
  wire  _T_78 = ~reset; // @[alu.scala 54:11]
  Multiplier multiplier ( // @[alu.scala 23:26]
    .clock(multiplier_clock),
    .reset(multiplier_reset),
    .io_start(multiplier_io_start),
    .io_a(multiplier_io_a),
    .io_b(multiplier_io_b),
    .io_op(multiplier_io_op),
    .io_stall_req(multiplier_io_stall_req),
    .io_mult_out(multiplier_io_mult_out)
  );
  assign io_result = _T_25 ? _T_27 : _T_75; // @[alu.scala 37:13]
  assign io_stall = isMulDiv & multiplier_io_stall_req; // @[alu.scala 28:23]
  assign multiplier_clock = clock;
  assign multiplier_reset = reset;
  assign multiplier_io_start = _T_22 | _T_23; // @[alu.scala 24:23]
  assign multiplier_io_a = io_src1; // @[alu.scala 25:23]
  assign multiplier_io_b = io_src2; // @[alu.scala 26:23]
  assign multiplier_io_op = io_alu_op; // @[alu.scala 27:23]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_78) begin
          $fwrite(32'h80000002,"ALU: func = %d, src1=[%x] src2=[%x] result=[%x] ismul = %d stall = %d\n",io_alu_op,io_src1,io_src2,io_result,isMulDiv,io_stall); // @[alu.scala 54:11]
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
  input  [1:0]  io_ctl_dec_pc_sel,
  input  [1:0]  io_ctl_op1_sel,
  input  [2:0]  io_ctl_op2_sel,
  input  [4:0]  io_ctl_alu_fun,
  input  [2:0]  io_ctl_wb_sel,
  input         io_ctl_rf_wen,
  input         io_ctl_mem_ren,
  input         io_ctl_mem_wen,
  input  [7:0]  io_ctl_mem_mask,
  input  [2:0]  io_ctl_mem_ext,
  output [63:0] io_dat_dec_inst,
  output        io_dat_dec_br_eq,
  output        io_dat_dec_br_lt,
  output        io_dat_dec_br_ltu,
  output        io_InstRamIO_req,
  output [63:0] io_InstRamIO_addr,
  input  [63:0] io_InstRamIO_rdata,
  input         io_InstRamIO_addr_ok,
  input         io_InstRamIO_data_ok,
  output        io_DataRamIO_req,
  output        io_DataRamIO_wr,
  output [2:0]  io_DataRamIO_size,
  output [63:0] io_DataRamIO_addr,
  output [63:0] io_DataRamIO_wdata,
  input  [63:0] io_DataRamIO_rdata,
  input         io_DataRamIO_addr_ok,
  input         io_DataRamIO_data_ok,
  output        ws_valid_0,
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
  output [63:0] wb_reg_pc_0
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [63:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [63:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [63:0] _RAND_41;
  reg [63:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [63:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [63:0] _RAND_46;
`endif // RANDOMIZE_REG_INIT
  wire  regfile_clock; // @[dpath.scala 211:23]
  wire  regfile_reset; // @[dpath.scala 211:23]
  wire [4:0] regfile_io_raddr1; // @[dpath.scala 211:23]
  wire [4:0] regfile_io_raddr2; // @[dpath.scala 211:23]
  wire [63:0] regfile_io_rdata1; // @[dpath.scala 211:23]
  wire [63:0] regfile_io_rdata2; // @[dpath.scala 211:23]
  wire  regfile_io_we; // @[dpath.scala 211:23]
  wire [4:0] regfile_io_waddr; // @[dpath.scala 211:23]
  wire [63:0] regfile_io_wdata; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_0; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_1; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_2; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_3; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_4; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_5; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_6; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_7; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_8; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_9; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_10; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_11; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_12; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_13; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_14; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_15; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_16; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_17; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_18; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_19; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_20; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_21; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_22; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_23; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_24; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_25; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_26; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_27; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_28; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_29; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_30; // @[dpath.scala 211:23]
  wire [63:0] regfile__T_41_0_31; // @[dpath.scala 211:23]
  wire  alu_clock; // @[dpath.scala 292:19]
  wire  alu_reset; // @[dpath.scala 292:19]
  wire [4:0] alu_io_alu_op; // @[dpath.scala 292:19]
  wire [63:0] alu_io_src1; // @[dpath.scala 292:19]
  wire [63:0] alu_io_src2; // @[dpath.scala 292:19]
  wire [63:0] alu_io_result; // @[dpath.scala 292:19]
  wire  alu_io_stall; // @[dpath.scala 292:19]
  reg  fs_valid; // @[dpath.scala 37:25]
  wire [31:0] _T_1 = 32'h80000000 - 32'h4; // @[dpath.scala 38:52]
  reg [63:0] if_reg_pc; // @[dpath.scala 38:26]
  reg  ds_valid; // @[dpath.scala 41:25]
  reg [63:0] dec_reg_inst; // @[dpath.scala 42:29]
  reg [63:0] dec_reg_pc; // @[dpath.scala 43:27]
  reg  es_valid; // @[dpath.scala 47:25]
  reg [63:0] exe_reg_inst; // @[dpath.scala 48:29]
  reg [63:0] exe_reg_pc; // @[dpath.scala 49:27]
  reg [4:0] exe_reg_wbaddr; // @[dpath.scala 50:27]
  reg [4:0] exe_reg_rs1_addr; // @[dpath.scala 51:29]
  reg [4:0] exe_reg_rs2_addr; // @[dpath.scala 52:29]
  reg [63:0] exe_alu_op1; // @[dpath.scala 53:29]
  reg [63:0] exe_alu_op2; // @[dpath.scala 54:29]
  reg [63:0] exe_reg_rs2_data; // @[dpath.scala 55:29]
  reg [4:0] exe_reg_ctrl_alu_fun; // @[dpath.scala 57:33]
  reg [2:0] exe_reg_ctrl_wb_sel; // @[dpath.scala 58:32]
  reg  exe_reg_ctrl_rf_wen; // @[dpath.scala 59:36]
  reg  exe_reg_ctrl_mem_ren; // @[dpath.scala 60:37]
  reg  exe_reg_ctrl_mem_wen; // @[dpath.scala 61:37]
  reg [7:0] exe_reg_ctrl_mem_mask; // @[dpath.scala 62:38]
  reg [2:0] exe_reg_ctrl_mem_ext; // @[dpath.scala 63:37]
  reg  ms_valid; // @[dpath.scala 67:25]
  reg [63:0] mem_reg_pc; // @[dpath.scala 68:23]
  reg [63:0] mem_reg_inst; // @[dpath.scala 69:25]
  reg [63:0] mem_reg_alu_out; // @[dpath.scala 70:28]
  reg [4:0] mem_reg_wbaddr; // @[dpath.scala 71:27]
  reg [4:0] mem_reg_rs1_addr; // @[dpath.scala 72:29]
  reg [4:0] mem_reg_rs2_addr; // @[dpath.scala 73:29]
  reg [63:0] mem_reg_op1_data; // @[dpath.scala 74:29]
  reg [63:0] mem_reg_op2_data; // @[dpath.scala 75:29]
  reg  mem_reg_ctrl_rf_wen; // @[dpath.scala 77:36]
  reg [2:0] mem_reg_ctrl_mem_ext; // @[dpath.scala 79:37]
  reg [2:0] mem_reg_ctrl_wb_sel; // @[dpath.scala 80:32]
  reg [63:0] mem_reg_dram_data; // @[dpath.scala 82:34]
  reg  ws_valid; // @[dpath.scala 85:25]
  reg [63:0] wb_reg_pc; // @[dpath.scala 86:22]
  reg [4:0] wb_reg_wbaddr; // @[dpath.scala 87:26]
  reg [63:0] wb_reg_wbdata; // @[dpath.scala 88:26]
  reg  wb_reg_ctrl_rf_wen; // @[dpath.scala 89:35]
  wire [63:0] if_pc_plus4 = if_reg_pc + 64'h4; // @[dpath.scala 110:31]
  wire  _T_4 = io_ctl_dec_pc_sel == 2'h0; // @[dpath.scala 112:39]
  wire  _T_5 = io_ctl_dec_pc_sel == 2'h1; // @[dpath.scala 113:27]
  wire  _T_6 = io_ctl_dec_pc_sel == 2'h2; // @[dpath.scala 114:29]
  wire [4:0] dec_rs1_addr = dec_reg_inst[19:15]; // @[dpath.scala 205:34]
  wire  _T_78 = exe_reg_wbaddr == dec_rs1_addr; // @[dpath.scala 253:34]
  wire  _T_79 = es_valid & _T_78; // @[dpath.scala 253:15]
  wire  _T_80 = dec_rs1_addr != 5'h0; // @[dpath.scala 253:69]
  wire  _T_81 = _T_79 & _T_80; // @[dpath.scala 253:52]
  wire  _T_82 = _T_81 & exe_reg_ctrl_rf_wen; // @[dpath.scala 253:78]
  wire  _T_83 = io_ctl_op1_sel == 2'h0; // @[dpath.scala 253:120]
  wire  _T_84 = _T_82 & _T_83; // @[dpath.scala 253:101]
  wire  _T_175 = exe_reg_ctrl_wb_sel == 3'h0; // @[dpath.scala 337:26]
  wire  _T_176 = exe_reg_ctrl_wb_sel == 3'h1; // @[dpath.scala 338:26]
  wire [31:0] _T_179 = alu_io_result[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_181 = {_T_179,alu_io_result[31:0]}; // @[Cat.scala 29:58]
  wire  _T_182 = exe_reg_ctrl_wb_sel == 3'h3; // @[dpath.scala 339:26]
  wire [63:0] exe_pc_plus4 = exe_reg_pc + 64'h4; // @[dpath.scala 333:34]
  wire [63:0] _T_183 = _T_182 ? exe_pc_plus4 : alu_io_result; // @[Mux.scala 98:16]
  wire [63:0] _T_184 = _T_176 ? _T_181 : _T_183; // @[Mux.scala 98:16]
  wire [63:0] exe_alu_out = _T_175 ? alu_io_result : _T_184; // @[Mux.scala 98:16]
  wire  _T_85 = mem_reg_wbaddr == dec_rs1_addr; // @[dpath.scala 254:34]
  wire  _T_86 = ms_valid & _T_85; // @[dpath.scala 254:15]
  wire  _T_88 = _T_86 & _T_80; // @[dpath.scala 254:52]
  wire  _T_89 = _T_88 & mem_reg_ctrl_rf_wen; // @[dpath.scala 254:78]
  wire  _T_91 = _T_89 & _T_83; // @[dpath.scala 254:101]
  wire  _T_264 = mem_reg_ctrl_wb_sel == 3'h2; // @[dpath.scala 419:26]
  wire  _T_227 = mem_reg_ctrl_mem_ext == 3'h0; // @[dpath.scala 405:27]
  wire [55:0] _T_230 = mem_reg_dram_data[7] ? 56'hffffffffffffff : 56'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_232 = {_T_230,mem_reg_dram_data[7:0]}; // @[Cat.scala 29:58]
  wire  _T_233 = mem_reg_ctrl_mem_ext == 3'h1; // @[dpath.scala 406:27]
  wire [63:0] _T_236 = {56'h0,mem_reg_dram_data[7:0]}; // @[Cat.scala 29:58]
  wire  _T_237 = mem_reg_ctrl_mem_ext == 3'h2; // @[dpath.scala 407:27]
  wire [47:0] _T_240 = mem_reg_dram_data[15] ? 48'hffffffffffff : 48'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_242 = {_T_240,mem_reg_dram_data[15:0]}; // @[Cat.scala 29:58]
  wire  _T_243 = mem_reg_ctrl_mem_ext == 3'h3; // @[dpath.scala 408:27]
  wire [63:0] _T_246 = {48'h0,mem_reg_dram_data[15:0]}; // @[Cat.scala 29:58]
  wire  _T_247 = mem_reg_ctrl_mem_ext == 3'h4; // @[dpath.scala 409:27]
  wire [31:0] _T_250 = mem_reg_dram_data[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_252 = {_T_250,mem_reg_dram_data[31:0]}; // @[Cat.scala 29:58]
  wire  _T_253 = mem_reg_ctrl_mem_ext == 3'h5; // @[dpath.scala 410:27]
  wire [63:0] _T_256 = {32'h0,mem_reg_dram_data[31:0]}; // @[Cat.scala 29:58]
  wire [63:0] _T_259 = _T_253 ? _T_256 : mem_reg_dram_data; // @[Mux.scala 98:16]
  wire [63:0] _T_260 = _T_247 ? _T_252 : _T_259; // @[Mux.scala 98:16]
  wire [63:0] _T_261 = _T_243 ? _T_246 : _T_260; // @[Mux.scala 98:16]
  wire [63:0] _T_262 = _T_237 ? _T_242 : _T_261; // @[Mux.scala 98:16]
  wire [63:0] _T_263 = _T_233 ? _T_236 : _T_262; // @[Mux.scala 98:16]
  wire [63:0] maskedReadData = _T_227 ? _T_232 : _T_263; // @[Mux.scala 98:16]
  wire [63:0] mem_wbdata = _T_264 ? maskedReadData : mem_reg_alu_out; // @[Mux.scala 98:16]
  wire  _T_92 = wb_reg_wbaddr == dec_rs1_addr; // @[dpath.scala 255:34]
  wire  _T_93 = ws_valid & _T_92; // @[dpath.scala 255:15]
  wire  _T_95 = _T_93 & _T_80; // @[dpath.scala 255:52]
  wire  _T_96 = _T_95 & wb_reg_ctrl_rf_wen; // @[dpath.scala 255:78]
  wire  _T_98 = _T_96 & _T_83; // @[dpath.scala 255:101]
  wire  _T_69 = io_ctl_op1_sel == 2'h1; // @[dpath.scala 247:21]
  wire [63:0] _T_72 = {32'h0,regfile_io_rdata1[31:0]}; // @[Cat.scala 29:58]
  wire  _T_73 = io_ctl_op1_sel == 2'h3; // @[dpath.scala 248:21]
  wire [31:0] imm_z = {27'h0,dec_rs1_addr}; // @[Cat.scala 29:58]
  wire  _T_74 = io_ctl_op1_sel == 2'h2; // @[dpath.scala 249:21]
  wire [63:0] _T_75 = _T_74 ? dec_reg_pc : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] _T_76 = _T_73 ? {{32'd0}, imm_z} : _T_75; // @[Mux.scala 98:16]
  wire [63:0] _T_77 = _T_69 ? _T_72 : _T_76; // @[Mux.scala 98:16]
  wire [63:0] dec_alu_op1 = _T_83 ? regfile_io_rdata1 : _T_77; // @[Mux.scala 98:16]
  wire [63:0] _T_99 = _T_98 ? wb_reg_wbdata : dec_alu_op1; // @[Mux.scala 98:16]
  wire [63:0] _T_100 = _T_91 ? mem_wbdata : _T_99; // @[Mux.scala 98:16]
  wire [63:0] dec_op1_data = _T_84 ? exe_alu_out : _T_100; // @[Mux.scala 98:16]
  wire [4:0] dec_rs2_addr = dec_reg_inst[24:20]; // @[dpath.scala 206:34]
  wire  _T_118 = exe_reg_wbaddr == dec_rs2_addr; // @[dpath.scala 269:34]
  wire  _T_119 = es_valid & _T_118; // @[dpath.scala 269:15]
  wire  _T_120 = dec_rs2_addr != 5'h0; // @[dpath.scala 269:69]
  wire  _T_121 = _T_119 & _T_120; // @[dpath.scala 269:52]
  wire  _T_122 = _T_121 & exe_reg_ctrl_rf_wen; // @[dpath.scala 269:78]
  wire  _T_123 = io_ctl_op2_sel == 3'h0; // @[dpath.scala 269:120]
  wire  _T_124 = _T_122 & _T_123; // @[dpath.scala 269:101]
  wire  _T_125 = mem_reg_wbaddr == dec_rs2_addr; // @[dpath.scala 270:34]
  wire  _T_126 = ms_valid & _T_125; // @[dpath.scala 270:15]
  wire  _T_128 = _T_126 & _T_120; // @[dpath.scala 270:52]
  wire  _T_129 = _T_128 & mem_reg_ctrl_rf_wen; // @[dpath.scala 270:78]
  wire  _T_131 = _T_129 & _T_123; // @[dpath.scala 270:101]
  wire  _T_132 = wb_reg_wbaddr == dec_rs2_addr; // @[dpath.scala 271:33]
  wire  _T_133 = ws_valid & _T_132; // @[dpath.scala 271:15]
  wire  _T_135 = _T_133 & _T_120; // @[dpath.scala 271:51]
  wire  _T_136 = _T_135 & wb_reg_ctrl_rf_wen; // @[dpath.scala 271:77]
  wire  _T_138 = _T_136 & _T_123; // @[dpath.scala 271:99]
  wire  _T_103 = io_ctl_op2_sel == 3'h1; // @[dpath.scala 260:21]
  wire [63:0] _T_106 = {32'h0,regfile_io_rdata2[31:0]}; // @[Cat.scala 29:58]
  wire  _T_107 = io_ctl_op2_sel == 3'h2; // @[dpath.scala 261:21]
  wire [11:0] imm_itype = dec_reg_inst[31:20]; // @[dpath.scala 222:31]
  wire [51:0] _T_51 = imm_itype[11] ? 52'hfffffffffffff : 52'h0; // @[Bitwise.scala 72:12]
  wire [63:0] imm_itype_sext = {_T_51,imm_itype}; // @[Cat.scala 29:58]
  wire  _T_108 = io_ctl_op2_sel == 3'h3; // @[dpath.scala 262:21]
  wire [11:0] imm_stype = {dec_reg_inst[31:25],dec_reg_inst[11:7]}; // @[Cat.scala 29:58]
  wire [51:0] _T_54 = imm_stype[11] ? 52'hfffffffffffff : 52'h0; // @[Bitwise.scala 72:12]
  wire [63:0] imm_stype_sext = {_T_54,dec_reg_inst[31:25],dec_reg_inst[11:7]}; // @[Cat.scala 29:58]
  wire  _T_109 = io_ctl_op2_sel == 3'h4; // @[dpath.scala 263:21]
  wire [11:0] imm_sbtype = {dec_reg_inst[31],dec_reg_inst[7],dec_reg_inst[30:25],dec_reg_inst[11:8]}; // @[Cat.scala 29:58]
  wire [50:0] _T_57 = imm_sbtype[11] ? 51'h7ffffffffffff : 51'h0; // @[Bitwise.scala 72:12]
  wire [63:0] imm_sbtype_sext = {_T_57,dec_reg_inst[31],dec_reg_inst[7],dec_reg_inst[30:25],dec_reg_inst[11:8],1'h0}; // @[Cat.scala 29:58]
  wire  _T_110 = io_ctl_op2_sel == 3'h5; // @[dpath.scala 264:21]
  wire [19:0] imm_utype = dec_reg_inst[31:12]; // @[dpath.scala 225:31]
  wire [31:0] _T_61 = imm_utype[19] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] imm_utype_sext = {_T_61,imm_utype,12'h0}; // @[Cat.scala 29:58]
  wire  _T_111 = io_ctl_op2_sel == 3'h6; // @[dpath.scala 265:21]
  wire [19:0] imm_ujtype = {dec_reg_inst[31],dec_reg_inst[19:12],dec_reg_inst[20],dec_reg_inst[30:21]}; // @[Cat.scala 29:58]
  wire [42:0] _T_66 = imm_ujtype[19] ? 43'h7ffffffffff : 43'h0; // @[Bitwise.scala 72:12]
  wire [63:0] imm_ujtype_sext = {_T_66,dec_reg_inst[31],dec_reg_inst[19:12],dec_reg_inst[20],dec_reg_inst[30:21],1'h0}; // @[Cat.scala 29:58]
  wire [63:0] _T_112 = _T_111 ? imm_ujtype_sext : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] _T_113 = _T_110 ? imm_utype_sext : _T_112; // @[Mux.scala 98:16]
  wire [63:0] _T_114 = _T_109 ? imm_sbtype_sext : _T_113; // @[Mux.scala 98:16]
  wire [63:0] _T_115 = _T_108 ? imm_stype_sext : _T_114; // @[Mux.scala 98:16]
  wire [63:0] _T_116 = _T_107 ? imm_itype_sext : _T_115; // @[Mux.scala 98:16]
  wire [63:0] _T_117 = _T_103 ? _T_106 : _T_116; // @[Mux.scala 98:16]
  wire [63:0] dec_alu_op2 = _T_123 ? regfile_io_rdata2 : _T_117; // @[Mux.scala 98:16]
  wire [63:0] _T_139 = _T_138 ? wb_reg_wbdata : dec_alu_op2; // @[Mux.scala 98:16]
  wire [63:0] _T_140 = _T_131 ? mem_wbdata : _T_139; // @[Mux.scala 98:16]
  wire [63:0] brjmp_offset = _T_124 ? exe_alu_out : _T_140; // @[Mux.scala 98:16]
  wire [63:0] dec_jump_reg_target = dec_op1_data + brjmp_offset; // @[dpath.scala 284:40]
  wire [63:0] _T_7 = _T_6 ? dec_jump_reg_target : 64'h4033; // @[dpath.scala 114:10]
  wire [63:0] dec_brjmp_target = dec_reg_pc + brjmp_offset; // @[dpath.scala 283:34]
  wire [63:0] _T_8 = _T_5 ? dec_brjmp_target : _T_7; // @[dpath.scala 113:8]
  wire [63:0] if_pc_next = _T_4 ? if_pc_plus4 : _T_8; // @[dpath.scala 112:20]
  reg  inst_fetching; // @[dpath.scala 131:30]
  wire  _T_10 = io_InstRamIO_req & io_InstRamIO_addr_ok; // @[dpath.scala 132:25]
  wire  _GEN_0 = io_InstRamIO_data_ok ? 1'h0 : inst_fetching; // @[dpath.scala 134:35]
  wire  _GEN_1 = _T_10 | _GEN_0; // @[dpath.scala 132:49]
  wire  _T_12 = ~fs_valid; // @[dpath.scala 148:17]
  wire  _T_26 = ~ds_valid; // @[dpath.scala 189:17]
  wire  _T_25 = es_valid & exe_reg_ctrl_mem_ren; // @[dpath.scala 188:32]
  wire  ds_ready_go = ~_T_25; // @[dpath.scala 188:21]
  wire  _T_169 = ~es_valid; // @[dpath.scala 297:17]
  wire  _T_167 = ~io_DataRamIO_data_ok; // @[dpath.scala 294:35]
  wire  exe_load_store = exe_reg_ctrl_mem_ren | exe_reg_ctrl_mem_wen; // @[dpath.scala 293:46]
  wire  _T_168 = _T_167 & exe_load_store; // @[dpath.scala 294:57]
  wire  es_stall = alu_io_stall | _T_168; // @[dpath.scala 294:31]
  wire  es_ready_go = ~es_stall; // @[dpath.scala 296:21]
  wire  es_allowin = _T_169 | es_ready_go; // @[dpath.scala 297:27]
  wire  _T_27 = ds_ready_go & es_allowin; // @[dpath.scala 189:42]
  wire  ds_allowin = _T_26 | _T_27; // @[dpath.scala 189:27]
  wire  _T_13 = io_InstRamIO_data_ok & ds_allowin; // @[dpath.scala 148:42]
  wire  fs_allowin = _T_12 | _T_13; // @[dpath.scala 148:27]
  wire  fs_to_ds_valid = fs_valid & io_InstRamIO_data_ok; // @[dpath.scala 149:33]
  wire  dec_reflush = io_ctl_dec_pc_sel != 2'h0; // @[dpath.scala 151:39]
  wire  _T_15 = io_InstRamIO_addr_ok & fs_allowin; // @[dpath.scala 157:20]
  wire [31:0] inst_tmp = if_reg_pc[2] ? io_InstRamIO_rdata[63:32] : io_InstRamIO_rdata[31:0]; // @[dpath.scala 164:22]
  wire [31:0] if_reg_inst = io_InstRamIO_data_ok ? inst_tmp : 32'h0; // @[dpath.scala 175:27]
  wire  _T_24 = ~reset; // @[dpath.scala 183:11]
  wire  ds_to_es_valid = ds_valid & ds_ready_go; // @[dpath.scala 190:33]
  wire  _T_29 = dec_reflush & ds_to_es_valid; // @[dpath.scala 193:20]
  wire  _T_30 = _T_29 & ds_allowin; // @[dpath.scala 193:38]
  wire  _T_31 = fs_to_ds_valid & ds_allowin; // @[dpath.scala 198:23]
  wire [63:0] if_inst = {{32'd0}, if_reg_inst}; // @[dpath.scala 174:21 dpath.scala 179:11]
  wire [63:0] _T_157 = _T_136 ? wb_reg_wbdata : regfile_io_rdata2; // @[Mux.scala 98:16]
  wire [63:0] _T_158 = _T_129 ? mem_wbdata : _T_157; // @[Mux.scala 98:16]
  wire [63:0] dec_rs2_data = _T_122 ? exe_alu_out : _T_158; // @[Mux.scala 98:16]
  wire  es_to_ms_valid = es_valid & es_ready_go; // @[dpath.scala 298:33]
  wire  _T_172 = ds_to_es_valid & es_allowin; // @[dpath.scala 302:23]
  wire  _T_186 = exe_reg_ctrl_mem_mask == 8'h1; // @[dpath.scala 345:28]
  wire [63:0] _T_190 = {exe_reg_rs2_data[7:0],exe_reg_rs2_data[7:0],exe_reg_rs2_data[7:0],exe_reg_rs2_data[7:0],exe_reg_rs2_data[7:0],exe_reg_rs2_data[7:0],exe_reg_rs2_data[7:0],exe_reg_rs2_data[7:0]}; // @[Cat.scala 29:58]
  wire  _T_191 = exe_reg_ctrl_mem_mask == 8'h3; // @[dpath.scala 346:28]
  wire [63:0] _T_194 = {exe_reg_rs2_data[15:0],exe_reg_rs2_data[15:0],exe_reg_rs2_data[15:0],exe_reg_rs2_data[15:0]}; // @[Cat.scala 29:58]
  wire  _T_195 = exe_reg_ctrl_mem_mask == 8'hf; // @[dpath.scala 347:28]
  wire [63:0] _T_197 = {exe_reg_rs2_data[31:0],exe_reg_rs2_data[31:0]}; // @[Cat.scala 29:58]
  wire [63:0] _T_200 = _T_195 ? _T_197 : exe_reg_rs2_data; // @[Mux.scala 98:16]
  wire [63:0] _T_201 = _T_191 ? _T_194 : _T_200; // @[Mux.scala 98:16]
  reg  data_fetching; // @[dpath.scala 355:30]
  wire  _T_205 = io_DataRamIO_req & io_DataRamIO_addr_ok; // @[dpath.scala 356:25]
  wire  _GEN_28 = io_DataRamIO_data_ok ? 1'h0 : data_fetching; // @[dpath.scala 358:35]
  wire  _GEN_29 = _T_205 | _GEN_28; // @[dpath.scala 356:49]
  wire  _T_206 = ~data_fetching; // @[dpath.scala 361:24]
  wire  _T_208 = _T_206 & es_valid; // @[dpath.scala 361:53]
  wire [1:0] _T_216 = _T_195 ? 2'h2 : 2'h3; // @[Mux.scala 98:16]
  wire [1:0] _T_217 = _T_191 ? 2'h1 : _T_216; // @[Mux.scala 98:16]
  wire [1:0] _T_218 = _T_186 ? 2'h0 : _T_217; // @[Mux.scala 98:16]
  wire [5:0] offset = {exe_alu_out[2:0], 3'h0}; // @[dpath.scala 372:33]
  wire [63:0] _T_220 = io_DataRamIO_rdata >> offset; // @[dpath.scala 373:46]
  reg [63:0] _T_271; // @[dpath.scala 439:79]
  wire [63:0] _T_275 = _T_84 ? exe_alu_out : _T_100; // @[dpath.scala 447:43]
  wire [63:0] _T_276 = _T_122 ? exe_alu_out : _T_158; // @[dpath.scala 447:67]
  reg [63:0] wb_reg_inst; // @[dpath.scala 493:28]
  reg [4:0] _T_279; // @[dpath.scala 501:14]
  reg [63:0] _T_280; // @[dpath.scala 502:14]
  reg [4:0] _T_281; // @[dpath.scala 503:14]
  reg [63:0] _T_282; // @[dpath.scala 504:14]
  regfile regfile ( // @[dpath.scala 211:23]
    .clock(regfile_clock),
    .reset(regfile_reset),
    .io_raddr1(regfile_io_raddr1),
    .io_raddr2(regfile_io_raddr2),
    .io_rdata1(regfile_io_rdata1),
    .io_rdata2(regfile_io_rdata2),
    .io_we(regfile_io_we),
    .io_waddr(regfile_io_waddr),
    .io_wdata(regfile_io_wdata),
    ._T_41_0_0(regfile__T_41_0_0),
    ._T_41_0_1(regfile__T_41_0_1),
    ._T_41_0_2(regfile__T_41_0_2),
    ._T_41_0_3(regfile__T_41_0_3),
    ._T_41_0_4(regfile__T_41_0_4),
    ._T_41_0_5(regfile__T_41_0_5),
    ._T_41_0_6(regfile__T_41_0_6),
    ._T_41_0_7(regfile__T_41_0_7),
    ._T_41_0_8(regfile__T_41_0_8),
    ._T_41_0_9(regfile__T_41_0_9),
    ._T_41_0_10(regfile__T_41_0_10),
    ._T_41_0_11(regfile__T_41_0_11),
    ._T_41_0_12(regfile__T_41_0_12),
    ._T_41_0_13(regfile__T_41_0_13),
    ._T_41_0_14(regfile__T_41_0_14),
    ._T_41_0_15(regfile__T_41_0_15),
    ._T_41_0_16(regfile__T_41_0_16),
    ._T_41_0_17(regfile__T_41_0_17),
    ._T_41_0_18(regfile__T_41_0_18),
    ._T_41_0_19(regfile__T_41_0_19),
    ._T_41_0_20(regfile__T_41_0_20),
    ._T_41_0_21(regfile__T_41_0_21),
    ._T_41_0_22(regfile__T_41_0_22),
    ._T_41_0_23(regfile__T_41_0_23),
    ._T_41_0_24(regfile__T_41_0_24),
    ._T_41_0_25(regfile__T_41_0_25),
    ._T_41_0_26(regfile__T_41_0_26),
    ._T_41_0_27(regfile__T_41_0_27),
    ._T_41_0_28(regfile__T_41_0_28),
    ._T_41_0_29(regfile__T_41_0_29),
    ._T_41_0_30(regfile__T_41_0_30),
    ._T_41_0_31(regfile__T_41_0_31)
  );
  alu alu ( // @[dpath.scala 292:19]
    .clock(alu_clock),
    .reset(alu_reset),
    .io_alu_op(alu_io_alu_op),
    .io_src1(alu_io_src1),
    .io_src2(alu_io_src2),
    .io_result(alu_io_result),
    .io_stall(alu_io_stall)
  );
  assign io_dat_dec_inst = dec_reg_inst; // @[dpath.scala 445:19]
  assign io_dat_dec_br_eq = dec_op1_data == dec_rs2_data; // @[dpath.scala 446:20]
  assign io_dat_dec_br_lt = $signed(_T_275) < $signed(_T_276); // @[dpath.scala 447:20]
  assign io_dat_dec_br_ltu = dec_op1_data < dec_rs2_data; // @[dpath.scala 448:21]
  assign io_InstRamIO_req = ~inst_fetching; // @[dpath.scala 137:21]
  assign io_InstRamIO_addr = _T_4 ? if_pc_plus4 : _T_8; // @[dpath.scala 140:21]
  assign io_DataRamIO_req = _T_208 & exe_load_store; // @[dpath.scala 361:21]
  assign io_DataRamIO_wr = exe_reg_ctrl_mem_wen; // @[dpath.scala 362:21]
  assign io_DataRamIO_size = {{1'd0}, _T_218}; // @[dpath.scala 363:21]
  assign io_DataRamIO_addr = _T_175 ? alu_io_result : _T_184; // @[dpath.scala 369:21]
  assign io_DataRamIO_wdata = _T_186 ? _T_190 : _T_201; // @[dpath.scala 370:21]
  assign ws_valid_0 = ws_valid;
  assign _T_41_0_0 = regfile__T_41_0_0;
  assign _T_41_0_1 = regfile__T_41_0_1;
  assign _T_41_0_2 = regfile__T_41_0_2;
  assign _T_41_0_3 = regfile__T_41_0_3;
  assign _T_41_0_4 = regfile__T_41_0_4;
  assign _T_41_0_5 = regfile__T_41_0_5;
  assign _T_41_0_6 = regfile__T_41_0_6;
  assign _T_41_0_7 = regfile__T_41_0_7;
  assign _T_41_0_8 = regfile__T_41_0_8;
  assign _T_41_0_9 = regfile__T_41_0_9;
  assign _T_41_0_10 = regfile__T_41_0_10;
  assign _T_41_0_11 = regfile__T_41_0_11;
  assign _T_41_0_12 = regfile__T_41_0_12;
  assign _T_41_0_13 = regfile__T_41_0_13;
  assign _T_41_0_14 = regfile__T_41_0_14;
  assign _T_41_0_15 = regfile__T_41_0_15;
  assign _T_41_0_16 = regfile__T_41_0_16;
  assign _T_41_0_17 = regfile__T_41_0_17;
  assign _T_41_0_18 = regfile__T_41_0_18;
  assign _T_41_0_19 = regfile__T_41_0_19;
  assign _T_41_0_20 = regfile__T_41_0_20;
  assign _T_41_0_21 = regfile__T_41_0_21;
  assign _T_41_0_22 = regfile__T_41_0_22;
  assign _T_41_0_23 = regfile__T_41_0_23;
  assign _T_41_0_24 = regfile__T_41_0_24;
  assign _T_41_0_25 = regfile__T_41_0_25;
  assign _T_41_0_26 = regfile__T_41_0_26;
  assign _T_41_0_27 = regfile__T_41_0_27;
  assign _T_41_0_28 = regfile__T_41_0_28;
  assign _T_41_0_29 = regfile__T_41_0_29;
  assign _T_41_0_30 = regfile__T_41_0_30;
  assign _T_41_0_31 = regfile__T_41_0_31;
  assign wb_reg_pc_0 = wb_reg_pc;
  assign regfile_clock = clock;
  assign regfile_reset = reset;
  assign regfile_io_raddr1 = dec_reg_inst[19:15]; // @[dpath.scala 212:21]
  assign regfile_io_raddr2 = dec_reg_inst[24:20]; // @[dpath.scala 213:21]
  assign regfile_io_we = wb_reg_ctrl_rf_wen & ws_valid; // @[dpath.scala 218:17]
  assign regfile_io_waddr = wb_reg_wbaddr; // @[dpath.scala 216:20]
  assign regfile_io_wdata = wb_reg_wbdata; // @[dpath.scala 217:20]
  assign alu_clock = clock;
  assign alu_reset = reset;
  assign alu_io_alu_op = exe_reg_ctrl_alu_fun; // @[dpath.scala 328:17]
  assign alu_io_src1 = exe_alu_op1; // @[dpath.scala 329:15]
  assign alu_io_src2 = exe_alu_op2; // @[dpath.scala 330:15]
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
  _RAND_0 = {1{`RANDOM}};
  fs_valid = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  if_reg_pc = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  ds_valid = _RAND_2[0:0];
  _RAND_3 = {2{`RANDOM}};
  dec_reg_inst = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  dec_reg_pc = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  es_valid = _RAND_5[0:0];
  _RAND_6 = {2{`RANDOM}};
  exe_reg_inst = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  exe_reg_pc = _RAND_7[63:0];
  _RAND_8 = {1{`RANDOM}};
  exe_reg_wbaddr = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  exe_reg_rs1_addr = _RAND_9[4:0];
  _RAND_10 = {1{`RANDOM}};
  exe_reg_rs2_addr = _RAND_10[4:0];
  _RAND_11 = {2{`RANDOM}};
  exe_alu_op1 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  exe_alu_op2 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  exe_reg_rs2_data = _RAND_13[63:0];
  _RAND_14 = {1{`RANDOM}};
  exe_reg_ctrl_alu_fun = _RAND_14[4:0];
  _RAND_15 = {1{`RANDOM}};
  exe_reg_ctrl_wb_sel = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  exe_reg_ctrl_rf_wen = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  exe_reg_ctrl_mem_ren = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  exe_reg_ctrl_mem_wen = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  exe_reg_ctrl_mem_mask = _RAND_19[7:0];
  _RAND_20 = {1{`RANDOM}};
  exe_reg_ctrl_mem_ext = _RAND_20[2:0];
  _RAND_21 = {1{`RANDOM}};
  ms_valid = _RAND_21[0:0];
  _RAND_22 = {2{`RANDOM}};
  mem_reg_pc = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  mem_reg_inst = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  mem_reg_alu_out = _RAND_24[63:0];
  _RAND_25 = {1{`RANDOM}};
  mem_reg_wbaddr = _RAND_25[4:0];
  _RAND_26 = {1{`RANDOM}};
  mem_reg_rs1_addr = _RAND_26[4:0];
  _RAND_27 = {1{`RANDOM}};
  mem_reg_rs2_addr = _RAND_27[4:0];
  _RAND_28 = {2{`RANDOM}};
  mem_reg_op1_data = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  mem_reg_op2_data = _RAND_29[63:0];
  _RAND_30 = {1{`RANDOM}};
  mem_reg_ctrl_rf_wen = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  mem_reg_ctrl_mem_ext = _RAND_31[2:0];
  _RAND_32 = {1{`RANDOM}};
  mem_reg_ctrl_wb_sel = _RAND_32[2:0];
  _RAND_33 = {2{`RANDOM}};
  mem_reg_dram_data = _RAND_33[63:0];
  _RAND_34 = {1{`RANDOM}};
  ws_valid = _RAND_34[0:0];
  _RAND_35 = {2{`RANDOM}};
  wb_reg_pc = _RAND_35[63:0];
  _RAND_36 = {1{`RANDOM}};
  wb_reg_wbaddr = _RAND_36[4:0];
  _RAND_37 = {2{`RANDOM}};
  wb_reg_wbdata = _RAND_37[63:0];
  _RAND_38 = {1{`RANDOM}};
  wb_reg_ctrl_rf_wen = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  inst_fetching = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  data_fetching = _RAND_40[0:0];
  _RAND_41 = {2{`RANDOM}};
  _T_271 = _RAND_41[63:0];
  _RAND_42 = {2{`RANDOM}};
  wb_reg_inst = _RAND_42[63:0];
  _RAND_43 = {1{`RANDOM}};
  _T_279 = _RAND_43[4:0];
  _RAND_44 = {2{`RANDOM}};
  _T_280 = _RAND_44[63:0];
  _RAND_45 = {1{`RANDOM}};
  _T_281 = _RAND_45[4:0];
  _RAND_46 = {2{`RANDOM}};
  _T_282 = _RAND_46[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      fs_valid <= 1'h0;
    end else if (fs_allowin) begin
      fs_valid <= io_InstRamIO_addr_ok;
    end
    if (reset) begin
      if_reg_pc <= {{32'd0}, _T_1};
    end else if (_T_15) begin
      if (_T_4) begin
        if_reg_pc <= if_pc_plus4;
      end else if (_T_5) begin
        if_reg_pc <= dec_brjmp_target;
      end else if (_T_6) begin
        if_reg_pc <= dec_jump_reg_target;
      end else begin
        if_reg_pc <= 64'h4033;
      end
    end
    if (reset) begin
      ds_valid <= 1'h0;
    end else if (_T_30) begin
      ds_valid <= 1'h0;
    end else if (ds_allowin) begin
      ds_valid <= fs_to_ds_valid;
    end
    if (reset) begin
      dec_reg_inst <= 64'h4033;
    end else if (_T_31) begin
      dec_reg_inst <= if_inst;
    end
    if (reset) begin
      dec_reg_pc <= 64'h0;
    end else if (_T_31) begin
      dec_reg_pc <= if_reg_pc;
    end
    if (reset) begin
      es_valid <= 1'h0;
    end else if (es_allowin) begin
      es_valid <= ds_to_es_valid;
    end
    if (reset) begin
      exe_reg_inst <= 64'h4033;
    end else if (_T_172) begin
      exe_reg_inst <= dec_reg_inst;
    end
    if (reset) begin
      exe_reg_pc <= 64'h0;
    end else if (_T_172) begin
      exe_reg_pc <= dec_reg_pc;
    end
    if (_T_172) begin
      exe_reg_wbaddr <= dec_reg_inst[11:7];
    end
    if (_T_172) begin
      exe_reg_rs1_addr <= dec_rs1_addr;
    end
    if (_T_172) begin
      exe_reg_rs2_addr <= dec_rs2_addr;
    end
    if (_T_172) begin
      if (_T_84) begin
        if (_T_175) begin
          exe_alu_op1 <= alu_io_result;
        end else if (_T_176) begin
          exe_alu_op1 <= _T_181;
        end else if (_T_182) begin
          exe_alu_op1 <= exe_pc_plus4;
        end else begin
          exe_alu_op1 <= alu_io_result;
        end
      end else if (_T_91) begin
        if (_T_264) begin
          if (_T_227) begin
            exe_alu_op1 <= _T_232;
          end else if (_T_233) begin
            exe_alu_op1 <= _T_236;
          end else if (_T_237) begin
            exe_alu_op1 <= _T_242;
          end else if (_T_243) begin
            exe_alu_op1 <= _T_246;
          end else if (_T_247) begin
            exe_alu_op1 <= _T_252;
          end else if (_T_253) begin
            exe_alu_op1 <= _T_256;
          end else begin
            exe_alu_op1 <= mem_reg_dram_data;
          end
        end else begin
          exe_alu_op1 <= mem_reg_alu_out;
        end
      end else if (_T_98) begin
        exe_alu_op1 <= wb_reg_wbdata;
      end else if (_T_83) begin
        exe_alu_op1 <= regfile_io_rdata1;
      end else if (_T_69) begin
        exe_alu_op1 <= _T_72;
      end else if (_T_73) begin
        exe_alu_op1 <= {{32'd0}, imm_z};
      end else if (_T_74) begin
        exe_alu_op1 <= dec_reg_pc;
      end else begin
        exe_alu_op1 <= 64'h0;
      end
    end
    if (_T_172) begin
      if (_T_124) begin
        if (_T_175) begin
          exe_alu_op2 <= alu_io_result;
        end else if (_T_176) begin
          exe_alu_op2 <= _T_181;
        end else if (_T_182) begin
          exe_alu_op2 <= exe_pc_plus4;
        end else begin
          exe_alu_op2 <= alu_io_result;
        end
      end else if (_T_131) begin
        if (_T_264) begin
          if (_T_227) begin
            exe_alu_op2 <= _T_232;
          end else if (_T_233) begin
            exe_alu_op2 <= _T_236;
          end else if (_T_237) begin
            exe_alu_op2 <= _T_242;
          end else if (_T_243) begin
            exe_alu_op2 <= _T_246;
          end else if (_T_247) begin
            exe_alu_op2 <= _T_252;
          end else if (_T_253) begin
            exe_alu_op2 <= _T_256;
          end else begin
            exe_alu_op2 <= mem_reg_dram_data;
          end
        end else begin
          exe_alu_op2 <= mem_reg_alu_out;
        end
      end else if (_T_138) begin
        exe_alu_op2 <= wb_reg_wbdata;
      end else if (_T_123) begin
        exe_alu_op2 <= regfile_io_rdata2;
      end else if (_T_103) begin
        exe_alu_op2 <= _T_106;
      end else if (_T_107) begin
        exe_alu_op2 <= imm_itype_sext;
      end else if (_T_108) begin
        exe_alu_op2 <= imm_stype_sext;
      end else if (_T_109) begin
        exe_alu_op2 <= imm_sbtype_sext;
      end else if (_T_110) begin
        exe_alu_op2 <= imm_utype_sext;
      end else if (_T_111) begin
        exe_alu_op2 <= imm_ujtype_sext;
      end else begin
        exe_alu_op2 <= 64'h0;
      end
    end
    if (_T_172) begin
      if (_T_122) begin
        if (_T_175) begin
          exe_reg_rs2_data <= alu_io_result;
        end else if (_T_176) begin
          exe_reg_rs2_data <= _T_181;
        end else if (_T_182) begin
          exe_reg_rs2_data <= exe_pc_plus4;
        end else begin
          exe_reg_rs2_data <= alu_io_result;
        end
      end else if (_T_129) begin
        if (_T_264) begin
          if (_T_227) begin
            exe_reg_rs2_data <= _T_232;
          end else if (_T_233) begin
            exe_reg_rs2_data <= _T_236;
          end else if (_T_237) begin
            exe_reg_rs2_data <= _T_242;
          end else if (_T_243) begin
            exe_reg_rs2_data <= _T_246;
          end else if (_T_247) begin
            exe_reg_rs2_data <= _T_252;
          end else if (_T_253) begin
            exe_reg_rs2_data <= _T_256;
          end else begin
            exe_reg_rs2_data <= mem_reg_dram_data;
          end
        end else begin
          exe_reg_rs2_data <= mem_reg_alu_out;
        end
      end else if (_T_136) begin
        exe_reg_rs2_data <= wb_reg_wbdata;
      end else begin
        exe_reg_rs2_data <= regfile_io_rdata2;
      end
    end
    if (_T_172) begin
      exe_reg_ctrl_alu_fun <= io_ctl_alu_fun;
    end
    if (_T_172) begin
      exe_reg_ctrl_wb_sel <= io_ctl_wb_sel;
    end
    if (reset) begin
      exe_reg_ctrl_rf_wen <= 1'h0;
    end else if (_T_172) begin
      exe_reg_ctrl_rf_wen <= io_ctl_rf_wen;
    end
    if (reset) begin
      exe_reg_ctrl_mem_ren <= 1'h0;
    end else if (_T_172) begin
      exe_reg_ctrl_mem_ren <= io_ctl_mem_ren;
    end
    if (reset) begin
      exe_reg_ctrl_mem_wen <= 1'h0;
    end else if (_T_172) begin
      exe_reg_ctrl_mem_wen <= io_ctl_mem_wen;
    end
    if (reset) begin
      exe_reg_ctrl_mem_mask <= 8'hff;
    end else if (_T_172) begin
      exe_reg_ctrl_mem_mask <= io_ctl_mem_mask;
    end
    if (reset) begin
      exe_reg_ctrl_mem_ext <= 3'h0;
    end else if (_T_172) begin
      exe_reg_ctrl_mem_ext <= io_ctl_mem_ext;
    end
    if (reset) begin
      ms_valid <= 1'h0;
    end else begin
      ms_valid <= es_to_ms_valid;
    end
    if (es_to_ms_valid) begin
      mem_reg_pc <= exe_reg_pc;
    end
    if (es_to_ms_valid) begin
      mem_reg_inst <= exe_reg_inst;
    end
    if (es_to_ms_valid) begin
      if (_T_175) begin
        mem_reg_alu_out <= alu_io_result;
      end else if (_T_176) begin
        mem_reg_alu_out <= _T_181;
      end else if (_T_182) begin
        mem_reg_alu_out <= exe_pc_plus4;
      end else begin
        mem_reg_alu_out <= alu_io_result;
      end
    end
    if (es_to_ms_valid) begin
      mem_reg_wbaddr <= exe_reg_wbaddr;
    end
    if (es_to_ms_valid) begin
      mem_reg_rs1_addr <= exe_reg_rs1_addr;
    end
    if (es_to_ms_valid) begin
      mem_reg_rs2_addr <= exe_reg_rs2_addr;
    end
    if (es_to_ms_valid) begin
      mem_reg_op1_data <= exe_alu_op1;
    end
    if (es_to_ms_valid) begin
      mem_reg_op2_data <= exe_alu_op2;
    end
    if (reset) begin
      mem_reg_ctrl_rf_wen <= 1'h0;
    end else if (es_to_ms_valid) begin
      mem_reg_ctrl_rf_wen <= exe_reg_ctrl_rf_wen;
    end
    if (reset) begin
      mem_reg_ctrl_mem_ext <= 3'h0;
    end else if (es_to_ms_valid) begin
      mem_reg_ctrl_mem_ext <= exe_reg_ctrl_mem_ext;
    end
    if (es_to_ms_valid) begin
      mem_reg_ctrl_wb_sel <= exe_reg_ctrl_wb_sel;
    end
    if (reset) begin
      mem_reg_dram_data <= 64'h0;
    end else begin
      mem_reg_dram_data <= _T_220;
    end
    if (reset) begin
      ws_valid <= 1'h0;
    end else begin
      ws_valid <= ms_valid;
    end
    if (ms_valid) begin
      wb_reg_pc <= mem_reg_pc;
    end
    if (ms_valid) begin
      wb_reg_wbaddr <= mem_reg_wbaddr;
    end
    if (ms_valid) begin
      if (_T_264) begin
        if (_T_227) begin
          wb_reg_wbdata <= _T_232;
        end else if (_T_233) begin
          wb_reg_wbdata <= _T_236;
        end else if (_T_237) begin
          wb_reg_wbdata <= _T_242;
        end else if (_T_243) begin
          wb_reg_wbdata <= _T_246;
        end else if (_T_247) begin
          wb_reg_wbdata <= _T_252;
        end else if (_T_253) begin
          wb_reg_wbdata <= _T_256;
        end else begin
          wb_reg_wbdata <= mem_reg_dram_data;
        end
      end else begin
        wb_reg_wbdata <= mem_reg_alu_out;
      end
    end
    if (reset) begin
      wb_reg_ctrl_rf_wen <= 1'h0;
    end else if (ms_valid) begin
      wb_reg_ctrl_rf_wen <= mem_reg_ctrl_rf_wen;
    end
    if (reset) begin
      inst_fetching <= 1'h0;
    end else begin
      inst_fetching <= _GEN_1;
    end
    if (reset) begin
      data_fetching <= 1'h0;
    end else begin
      data_fetching <= _GEN_29;
    end
    _T_271 <= mem_reg_inst;
    wb_reg_inst <= mem_reg_inst;
    _T_279 <= mem_reg_rs1_addr;
    _T_280 <= mem_reg_op1_data;
    _T_281 <= mem_reg_rs2_addr;
    _T_282 <= mem_reg_op2_data;
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_24) begin
          $fwrite(32'h80000002,"IF : valid = %d pc=[%x] inst=[%x] if_pc_next=[%x] pc_sel=[%d] e_bj_pc=[%x]\n",fs_valid,if_reg_pc,if_inst,if_pc_next,io_ctl_dec_pc_sel,dec_brjmp_target); // @[dpath.scala 183:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_24) begin
          $fwrite(32'h80000002,"DEC: valid = %d pc=[%x] inst=[%x] alu1=[%x] op1=[%x] alu2=[%x] op2=[%x] bj_target = [%x]\n",ds_valid,dec_reg_pc,dec_reg_inst,dec_alu_op1,dec_op1_data,dec_alu_op2,brjmp_offset,dec_brjmp_target); // @[dpath.scala 287:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_24) begin
          $fwrite(32'h80000002,"EXE: valid = %d pc=[%x] inst=[%x] rdata = [%x]\n",es_valid,exe_reg_pc,exe_reg_inst,mem_reg_dram_data); // @[dpath.scala 377:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_24) begin
          $fwrite(32'h80000002,"MEM: valid = %d pc=[%x] inst=[%x] wb_sel=[%d] wbdata=[%x]\n",ms_valid,mem_reg_pc,mem_reg_inst,mem_reg_ctrl_wb_sel,mem_wbdata); // @[dpath.scala 422:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_24) begin
          $fwrite(32'h80000002,"WB : valid = %d pc=[%x] inst=[%x]\n",ws_valid,wb_reg_pc,_T_271); // @[dpath.scala 439:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_24) begin
          $fwrite(32'h80000002,"pc=[%x] W[r%d=%x][%d] Op1=[r%d][%x] Op2=[r%d][%x] inst=[%x]\n\n",wb_reg_pc,wb_reg_wbaddr,wb_reg_wbdata,wb_reg_ctrl_rf_wen,_T_279,_T_280,_T_281,_T_282,wb_reg_inst); // @[dpath.scala 496:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module simSoc(
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
  output        io_diffTestIO_PC_valid,
  output        io_diffTestIO_nemu_halt
);
  wire [63:0] cpath_io_dat_dec_inst; // @[simSoc.scala 16:21]
  wire  cpath_io_dat_dec_br_eq; // @[simSoc.scala 16:21]
  wire  cpath_io_dat_dec_br_lt; // @[simSoc.scala 16:21]
  wire  cpath_io_dat_dec_br_ltu; // @[simSoc.scala 16:21]
  wire [1:0] cpath_io_ctl_dec_pc_sel; // @[simSoc.scala 16:21]
  wire [1:0] cpath_io_ctl_op1_sel; // @[simSoc.scala 16:21]
  wire [2:0] cpath_io_ctl_op2_sel; // @[simSoc.scala 16:21]
  wire [4:0] cpath_io_ctl_alu_fun; // @[simSoc.scala 16:21]
  wire [2:0] cpath_io_ctl_wb_sel; // @[simSoc.scala 16:21]
  wire  cpath_io_ctl_rf_wen; // @[simSoc.scala 16:21]
  wire  cpath_io_ctl_mem_ren; // @[simSoc.scala 16:21]
  wire  cpath_io_ctl_mem_wen; // @[simSoc.scala 16:21]
  wire [7:0] cpath_io_ctl_mem_mask; // @[simSoc.scala 16:21]
  wire [2:0] cpath_io_ctl_mem_ext; // @[simSoc.scala 16:21]
  wire  cpath_nemu_halt_0; // @[simSoc.scala 16:21]
  wire  dpath_clock; // @[simSoc.scala 17:21]
  wire  dpath_reset; // @[simSoc.scala 17:21]
  wire [1:0] dpath_io_ctl_dec_pc_sel; // @[simSoc.scala 17:21]
  wire [1:0] dpath_io_ctl_op1_sel; // @[simSoc.scala 17:21]
  wire [2:0] dpath_io_ctl_op2_sel; // @[simSoc.scala 17:21]
  wire [4:0] dpath_io_ctl_alu_fun; // @[simSoc.scala 17:21]
  wire [2:0] dpath_io_ctl_wb_sel; // @[simSoc.scala 17:21]
  wire  dpath_io_ctl_rf_wen; // @[simSoc.scala 17:21]
  wire  dpath_io_ctl_mem_ren; // @[simSoc.scala 17:21]
  wire  dpath_io_ctl_mem_wen; // @[simSoc.scala 17:21]
  wire [7:0] dpath_io_ctl_mem_mask; // @[simSoc.scala 17:21]
  wire [2:0] dpath_io_ctl_mem_ext; // @[simSoc.scala 17:21]
  wire [63:0] dpath_io_dat_dec_inst; // @[simSoc.scala 17:21]
  wire  dpath_io_dat_dec_br_eq; // @[simSoc.scala 17:21]
  wire  dpath_io_dat_dec_br_lt; // @[simSoc.scala 17:21]
  wire  dpath_io_dat_dec_br_ltu; // @[simSoc.scala 17:21]
  wire  dpath_io_InstRamIO_req; // @[simSoc.scala 17:21]
  wire [63:0] dpath_io_InstRamIO_addr; // @[simSoc.scala 17:21]
  wire [63:0] dpath_io_InstRamIO_rdata; // @[simSoc.scala 17:21]
  wire  dpath_io_InstRamIO_addr_ok; // @[simSoc.scala 17:21]
  wire  dpath_io_InstRamIO_data_ok; // @[simSoc.scala 17:21]
  wire  dpath_io_DataRamIO_req; // @[simSoc.scala 17:21]
  wire  dpath_io_DataRamIO_wr; // @[simSoc.scala 17:21]
  wire [2:0] dpath_io_DataRamIO_size; // @[simSoc.scala 17:21]
  wire [63:0] dpath_io_DataRamIO_addr; // @[simSoc.scala 17:21]
  wire [63:0] dpath_io_DataRamIO_wdata; // @[simSoc.scala 17:21]
  wire [63:0] dpath_io_DataRamIO_rdata; // @[simSoc.scala 17:21]
  wire  dpath_io_DataRamIO_addr_ok; // @[simSoc.scala 17:21]
  wire  dpath_io_DataRamIO_data_ok; // @[simSoc.scala 17:21]
  wire  dpath_ws_valid_0; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_0; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_1; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_2; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_3; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_4; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_5; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_6; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_7; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_8; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_9; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_10; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_11; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_12; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_13; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_14; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_15; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_16; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_17; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_18; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_19; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_20; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_21; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_22; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_23; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_24; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_25; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_26; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_27; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_28; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_29; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_30; // @[simSoc.scala 17:21]
  wire [63:0] dpath__T_41_0_31; // @[simSoc.scala 17:21]
  wire [63:0] dpath_wb_reg_pc_0; // @[simSoc.scala 17:21]
  wire [3:0] bridge_awid; // @[simSoc.scala 29:22]
  wire [63:0] bridge_awaddr; // @[simSoc.scala 29:22]
  wire [7:0] bridge_awlen; // @[simSoc.scala 29:22]
  wire [2:0] bridge_awsize; // @[simSoc.scala 29:22]
  wire [1:0] bridge_awburst; // @[simSoc.scala 29:22]
  wire  bridge_awlock; // @[simSoc.scala 29:22]
  wire [3:0] bridge_awcache; // @[simSoc.scala 29:22]
  wire [2:0] bridge_awprot; // @[simSoc.scala 29:22]
  wire  bridge_awvalid; // @[simSoc.scala 29:22]
  wire  bridge_awready; // @[simSoc.scala 29:22]
  wire [3:0] bridge_wid; // @[simSoc.scala 29:22]
  wire [63:0] bridge_wdata; // @[simSoc.scala 29:22]
  wire [7:0] bridge_wstrb; // @[simSoc.scala 29:22]
  wire  bridge_wlast; // @[simSoc.scala 29:22]
  wire  bridge_wvalid; // @[simSoc.scala 29:22]
  wire  bridge_wready; // @[simSoc.scala 29:22]
  wire [3:0] bridge_bid; // @[simSoc.scala 29:22]
  wire [1:0] bridge_bresp; // @[simSoc.scala 29:22]
  wire  bridge_bvalid; // @[simSoc.scala 29:22]
  wire  bridge_bready; // @[simSoc.scala 29:22]
  wire [3:0] bridge_arid; // @[simSoc.scala 29:22]
  wire [63:0] bridge_araddr; // @[simSoc.scala 29:22]
  wire [7:0] bridge_arlen; // @[simSoc.scala 29:22]
  wire [2:0] bridge_arsize; // @[simSoc.scala 29:22]
  wire [1:0] bridge_arburst; // @[simSoc.scala 29:22]
  wire  bridge_arlock; // @[simSoc.scala 29:22]
  wire [3:0] bridge_arcache; // @[simSoc.scala 29:22]
  wire [2:0] bridge_arprot; // @[simSoc.scala 29:22]
  wire  bridge_arvalid; // @[simSoc.scala 29:22]
  wire  bridge_arready; // @[simSoc.scala 29:22]
  wire [3:0] bridge_rid; // @[simSoc.scala 29:22]
  wire [63:0] bridge_rdata; // @[simSoc.scala 29:22]
  wire [1:0] bridge_rresp; // @[simSoc.scala 29:22]
  wire  bridge_rlast; // @[simSoc.scala 29:22]
  wire  bridge_rvalid; // @[simSoc.scala 29:22]
  wire  bridge_rready; // @[simSoc.scala 29:22]
  wire  bridge_clock; // @[simSoc.scala 29:22]
  wire  bridge_reset; // @[simSoc.scala 29:22]
  wire  bridge_inst_req; // @[simSoc.scala 29:22]
  wire  bridge_inst_wr; // @[simSoc.scala 29:22]
  wire [2:0] bridge_inst_size; // @[simSoc.scala 29:22]
  wire [63:0] bridge_inst_addr; // @[simSoc.scala 29:22]
  wire [63:0] bridge_inst_wdata; // @[simSoc.scala 29:22]
  wire [63:0] bridge_inst_rdata; // @[simSoc.scala 29:22]
  wire  bridge_inst_addr_ok; // @[simSoc.scala 29:22]
  wire  bridge_inst_data_ok; // @[simSoc.scala 29:22]
  wire  bridge_data_req; // @[simSoc.scala 29:22]
  wire  bridge_data_wr; // @[simSoc.scala 29:22]
  wire [2:0] bridge_data_size; // @[simSoc.scala 29:22]
  wire [63:0] bridge_data_addr; // @[simSoc.scala 29:22]
  wire [63:0] bridge_data_wdata; // @[simSoc.scala 29:22]
  wire [63:0] bridge_data_rdata; // @[simSoc.scala 29:22]
  wire  bridge_data_addr_ok; // @[simSoc.scala 29:22]
  wire  bridge_data_data_ok; // @[simSoc.scala 29:22]
  wire [3:0] ram_awid; // @[simSoc.scala 59:19]
  wire [63:0] ram_awaddr; // @[simSoc.scala 59:19]
  wire [7:0] ram_awlen; // @[simSoc.scala 59:19]
  wire [2:0] ram_awsize; // @[simSoc.scala 59:19]
  wire [1:0] ram_awburst; // @[simSoc.scala 59:19]
  wire  ram_awlock; // @[simSoc.scala 59:19]
  wire [3:0] ram_awcache; // @[simSoc.scala 59:19]
  wire [2:0] ram_awprot; // @[simSoc.scala 59:19]
  wire  ram_awvalid; // @[simSoc.scala 59:19]
  wire  ram_awready; // @[simSoc.scala 59:19]
  wire [3:0] ram_wid; // @[simSoc.scala 59:19]
  wire [63:0] ram_wdata; // @[simSoc.scala 59:19]
  wire [7:0] ram_wstrb; // @[simSoc.scala 59:19]
  wire  ram_wlast; // @[simSoc.scala 59:19]
  wire  ram_wvalid; // @[simSoc.scala 59:19]
  wire  ram_wready; // @[simSoc.scala 59:19]
  wire [3:0] ram_bid; // @[simSoc.scala 59:19]
  wire [1:0] ram_bresp; // @[simSoc.scala 59:19]
  wire  ram_bvalid; // @[simSoc.scala 59:19]
  wire  ram_bready; // @[simSoc.scala 59:19]
  wire [3:0] ram_arid; // @[simSoc.scala 59:19]
  wire [63:0] ram_araddr; // @[simSoc.scala 59:19]
  wire [7:0] ram_arlen; // @[simSoc.scala 59:19]
  wire [2:0] ram_arsize; // @[simSoc.scala 59:19]
  wire [1:0] ram_arburst; // @[simSoc.scala 59:19]
  wire  ram_arlock; // @[simSoc.scala 59:19]
  wire [3:0] ram_arcache; // @[simSoc.scala 59:19]
  wire [2:0] ram_arprot; // @[simSoc.scala 59:19]
  wire  ram_arvalid; // @[simSoc.scala 59:19]
  wire  ram_arready; // @[simSoc.scala 59:19]
  wire [3:0] ram_rid; // @[simSoc.scala 59:19]
  wire [63:0] ram_rdata; // @[simSoc.scala 59:19]
  wire [1:0] ram_rresp; // @[simSoc.scala 59:19]
  wire  ram_rlast; // @[simSoc.scala 59:19]
  wire  ram_rvalid; // @[simSoc.scala 59:19]
  wire  ram_rready; // @[simSoc.scala 59:19]
  wire  ram_clock; // @[simSoc.scala 59:19]
  wire  ram_reset; // @[simSoc.scala 59:19]
  wire  _T_1 = ~reset; // @[simSoc.scala 43:11]
  cpath cpath ( // @[simSoc.scala 16:21]
    .io_dat_dec_inst(cpath_io_dat_dec_inst),
    .io_dat_dec_br_eq(cpath_io_dat_dec_br_eq),
    .io_dat_dec_br_lt(cpath_io_dat_dec_br_lt),
    .io_dat_dec_br_ltu(cpath_io_dat_dec_br_ltu),
    .io_ctl_dec_pc_sel(cpath_io_ctl_dec_pc_sel),
    .io_ctl_op1_sel(cpath_io_ctl_op1_sel),
    .io_ctl_op2_sel(cpath_io_ctl_op2_sel),
    .io_ctl_alu_fun(cpath_io_ctl_alu_fun),
    .io_ctl_wb_sel(cpath_io_ctl_wb_sel),
    .io_ctl_rf_wen(cpath_io_ctl_rf_wen),
    .io_ctl_mem_ren(cpath_io_ctl_mem_ren),
    .io_ctl_mem_wen(cpath_io_ctl_mem_wen),
    .io_ctl_mem_mask(cpath_io_ctl_mem_mask),
    .io_ctl_mem_ext(cpath_io_ctl_mem_ext),
    .nemu_halt_0(cpath_nemu_halt_0)
  );
  dpath dpath ( // @[simSoc.scala 17:21]
    .clock(dpath_clock),
    .reset(dpath_reset),
    .io_ctl_dec_pc_sel(dpath_io_ctl_dec_pc_sel),
    .io_ctl_op1_sel(dpath_io_ctl_op1_sel),
    .io_ctl_op2_sel(dpath_io_ctl_op2_sel),
    .io_ctl_alu_fun(dpath_io_ctl_alu_fun),
    .io_ctl_wb_sel(dpath_io_ctl_wb_sel),
    .io_ctl_rf_wen(dpath_io_ctl_rf_wen),
    .io_ctl_mem_ren(dpath_io_ctl_mem_ren),
    .io_ctl_mem_wen(dpath_io_ctl_mem_wen),
    .io_ctl_mem_mask(dpath_io_ctl_mem_mask),
    .io_ctl_mem_ext(dpath_io_ctl_mem_ext),
    .io_dat_dec_inst(dpath_io_dat_dec_inst),
    .io_dat_dec_br_eq(dpath_io_dat_dec_br_eq),
    .io_dat_dec_br_lt(dpath_io_dat_dec_br_lt),
    .io_dat_dec_br_ltu(dpath_io_dat_dec_br_ltu),
    .io_InstRamIO_req(dpath_io_InstRamIO_req),
    .io_InstRamIO_addr(dpath_io_InstRamIO_addr),
    .io_InstRamIO_rdata(dpath_io_InstRamIO_rdata),
    .io_InstRamIO_addr_ok(dpath_io_InstRamIO_addr_ok),
    .io_InstRamIO_data_ok(dpath_io_InstRamIO_data_ok),
    .io_DataRamIO_req(dpath_io_DataRamIO_req),
    .io_DataRamIO_wr(dpath_io_DataRamIO_wr),
    .io_DataRamIO_size(dpath_io_DataRamIO_size),
    .io_DataRamIO_addr(dpath_io_DataRamIO_addr),
    .io_DataRamIO_wdata(dpath_io_DataRamIO_wdata),
    .io_DataRamIO_rdata(dpath_io_DataRamIO_rdata),
    .io_DataRamIO_addr_ok(dpath_io_DataRamIO_addr_ok),
    .io_DataRamIO_data_ok(dpath_io_DataRamIO_data_ok),
    .ws_valid_0(dpath_ws_valid_0),
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
    .wb_reg_pc_0(dpath_wb_reg_pc_0)
  );
  AXI_Bridge bridge ( // @[simSoc.scala 29:22]
    .awid(bridge_awid),
    .awaddr(bridge_awaddr),
    .awlen(bridge_awlen),
    .awsize(bridge_awsize),
    .awburst(bridge_awburst),
    .awlock(bridge_awlock),
    .awcache(bridge_awcache),
    .awprot(bridge_awprot),
    .awvalid(bridge_awvalid),
    .awready(bridge_awready),
    .wid(bridge_wid),
    .wdata(bridge_wdata),
    .wstrb(bridge_wstrb),
    .wlast(bridge_wlast),
    .wvalid(bridge_wvalid),
    .wready(bridge_wready),
    .bid(bridge_bid),
    .bresp(bridge_bresp),
    .bvalid(bridge_bvalid),
    .bready(bridge_bready),
    .arid(bridge_arid),
    .araddr(bridge_araddr),
    .arlen(bridge_arlen),
    .arsize(bridge_arsize),
    .arburst(bridge_arburst),
    .arlock(bridge_arlock),
    .arcache(bridge_arcache),
    .arprot(bridge_arprot),
    .arvalid(bridge_arvalid),
    .arready(bridge_arready),
    .rid(bridge_rid),
    .rdata(bridge_rdata),
    .rresp(bridge_rresp),
    .rlast(bridge_rlast),
    .rvalid(bridge_rvalid),
    .rready(bridge_rready),
    .clock(bridge_clock),
    .reset(bridge_reset),
    .inst_req(bridge_inst_req),
    .inst_wr(bridge_inst_wr),
    .inst_size(bridge_inst_size),
    .inst_addr(bridge_inst_addr),
    .inst_wdata(bridge_inst_wdata),
    .inst_rdata(bridge_inst_rdata),
    .inst_addr_ok(bridge_inst_addr_ok),
    .inst_data_ok(bridge_inst_data_ok),
    .data_req(bridge_data_req),
    .data_wr(bridge_data_wr),
    .data_size(bridge_data_size),
    .data_addr(bridge_data_addr),
    .data_wdata(bridge_data_wdata),
    .data_rdata(bridge_data_rdata),
    .data_addr_ok(bridge_data_addr_ok),
    .data_data_ok(bridge_data_data_ok)
  );
  AXI_ram ram ( // @[simSoc.scala 59:19]
    .awid(ram_awid),
    .awaddr(ram_awaddr),
    .awlen(ram_awlen),
    .awsize(ram_awsize),
    .awburst(ram_awburst),
    .awlock(ram_awlock),
    .awcache(ram_awcache),
    .awprot(ram_awprot),
    .awvalid(ram_awvalid),
    .awready(ram_awready),
    .wid(ram_wid),
    .wdata(ram_wdata),
    .wstrb(ram_wstrb),
    .wlast(ram_wlast),
    .wvalid(ram_wvalid),
    .wready(ram_wready),
    .bid(ram_bid),
    .bresp(ram_bresp),
    .bvalid(ram_bvalid),
    .bready(ram_bready),
    .arid(ram_arid),
    .araddr(ram_araddr),
    .arlen(ram_arlen),
    .arsize(ram_arsize),
    .arburst(ram_arburst),
    .arlock(ram_arlock),
    .arcache(ram_arcache),
    .arprot(ram_arprot),
    .arvalid(ram_arvalid),
    .arready(ram_arready),
    .rid(ram_rid),
    .rdata(ram_rdata),
    .rresp(ram_rresp),
    .rlast(ram_rlast),
    .rvalid(ram_rvalid),
    .rready(ram_rready),
    .clock(ram_clock),
    .reset(ram_reset)
  );
  assign io_diffTestIO_regfile_0 = dpath__T_41_0_0;
  assign io_diffTestIO_regfile_1 = dpath__T_41_0_1;
  assign io_diffTestIO_regfile_2 = dpath__T_41_0_2;
  assign io_diffTestIO_regfile_3 = dpath__T_41_0_3;
  assign io_diffTestIO_regfile_4 = dpath__T_41_0_4;
  assign io_diffTestIO_regfile_5 = dpath__T_41_0_5;
  assign io_diffTestIO_regfile_6 = dpath__T_41_0_6;
  assign io_diffTestIO_regfile_7 = dpath__T_41_0_7;
  assign io_diffTestIO_regfile_8 = dpath__T_41_0_8;
  assign io_diffTestIO_regfile_9 = dpath__T_41_0_9;
  assign io_diffTestIO_regfile_10 = dpath__T_41_0_10;
  assign io_diffTestIO_regfile_11 = dpath__T_41_0_11;
  assign io_diffTestIO_regfile_12 = dpath__T_41_0_12;
  assign io_diffTestIO_regfile_13 = dpath__T_41_0_13;
  assign io_diffTestIO_regfile_14 = dpath__T_41_0_14;
  assign io_diffTestIO_regfile_15 = dpath__T_41_0_15;
  assign io_diffTestIO_regfile_16 = dpath__T_41_0_16;
  assign io_diffTestIO_regfile_17 = dpath__T_41_0_17;
  assign io_diffTestIO_regfile_18 = dpath__T_41_0_18;
  assign io_diffTestIO_regfile_19 = dpath__T_41_0_19;
  assign io_diffTestIO_regfile_20 = dpath__T_41_0_20;
  assign io_diffTestIO_regfile_21 = dpath__T_41_0_21;
  assign io_diffTestIO_regfile_22 = dpath__T_41_0_22;
  assign io_diffTestIO_regfile_23 = dpath__T_41_0_23;
  assign io_diffTestIO_regfile_24 = dpath__T_41_0_24;
  assign io_diffTestIO_regfile_25 = dpath__T_41_0_25;
  assign io_diffTestIO_regfile_26 = dpath__T_41_0_26;
  assign io_diffTestIO_regfile_27 = dpath__T_41_0_27;
  assign io_diffTestIO_regfile_28 = dpath__T_41_0_28;
  assign io_diffTestIO_regfile_29 = dpath__T_41_0_29;
  assign io_diffTestIO_regfile_30 = dpath__T_41_0_30;
  assign io_diffTestIO_regfile_31 = dpath__T_41_0_31;
  assign io_diffTestIO_PC = dpath_wb_reg_pc_0;
  assign io_diffTestIO_PC_valid = dpath_ws_valid_0;
  assign io_diffTestIO_nemu_halt = cpath_nemu_halt_0;
  assign cpath_io_dat_dec_inst = dpath_io_dat_dec_inst; // @[simSoc.scala 20:16]
  assign cpath_io_dat_dec_br_eq = dpath_io_dat_dec_br_eq; // @[simSoc.scala 20:16]
  assign cpath_io_dat_dec_br_lt = dpath_io_dat_dec_br_lt; // @[simSoc.scala 20:16]
  assign cpath_io_dat_dec_br_ltu = dpath_io_dat_dec_br_ltu; // @[simSoc.scala 20:16]
  assign dpath_clock = clock;
  assign dpath_reset = reset;
  assign dpath_io_ctl_dec_pc_sel = cpath_io_ctl_dec_pc_sel; // @[simSoc.scala 19:16]
  assign dpath_io_ctl_op1_sel = cpath_io_ctl_op1_sel; // @[simSoc.scala 19:16]
  assign dpath_io_ctl_op2_sel = cpath_io_ctl_op2_sel; // @[simSoc.scala 19:16]
  assign dpath_io_ctl_alu_fun = cpath_io_ctl_alu_fun; // @[simSoc.scala 19:16]
  assign dpath_io_ctl_wb_sel = cpath_io_ctl_wb_sel; // @[simSoc.scala 19:16]
  assign dpath_io_ctl_rf_wen = cpath_io_ctl_rf_wen; // @[simSoc.scala 19:16]
  assign dpath_io_ctl_mem_ren = cpath_io_ctl_mem_ren; // @[simSoc.scala 19:16]
  assign dpath_io_ctl_mem_wen = cpath_io_ctl_mem_wen; // @[simSoc.scala 19:16]
  assign dpath_io_ctl_mem_mask = cpath_io_ctl_mem_mask; // @[simSoc.scala 19:16]
  assign dpath_io_ctl_mem_ext = cpath_io_ctl_mem_ext; // @[simSoc.scala 19:16]
  assign dpath_io_InstRamIO_rdata = bridge_inst_rdata; // @[simSoc.scala 39:29]
  assign dpath_io_InstRamIO_addr_ok = bridge_inst_addr_ok; // @[simSoc.scala 40:29]
  assign dpath_io_InstRamIO_data_ok = bridge_inst_data_ok; // @[simSoc.scala 41:29]
  assign dpath_io_DataRamIO_rdata = bridge_data_rdata; // @[simSoc.scala 52:29]
  assign dpath_io_DataRamIO_addr_ok = bridge_data_addr_ok; // @[simSoc.scala 53:29]
  assign dpath_io_DataRamIO_data_ok = bridge_data_data_ok; // @[simSoc.scala 54:29]
  assign bridge_awready = ram_awready; // @[simSoc.scala 72:21]
  assign bridge_wready = ram_wready; // @[simSoc.scala 77:21]
  assign bridge_bid = ram_bid; // @[simSoc.scala 78:21]
  assign bridge_bresp = ram_bresp; // @[simSoc.scala 79:21]
  assign bridge_bvalid = ram_bvalid; // @[simSoc.scala 80:21]
  assign bridge_arready = ram_arready; // @[simSoc.scala 91:21]
  assign bridge_rid = ram_rid; // @[simSoc.scala 92:21]
  assign bridge_rdata = ram_rdata; // @[simSoc.scala 93:21]
  assign bridge_rresp = ram_rresp; // @[simSoc.scala 94:21]
  assign bridge_rlast = ram_rlast; // @[simSoc.scala 95:21]
  assign bridge_rvalid = ram_rvalid; // @[simSoc.scala 96:21]
  assign bridge_clock = clock; // @[simSoc.scala 30:25]
  assign bridge_reset = reset; // @[simSoc.scala 31:25]
  assign bridge_inst_req = dpath_io_InstRamIO_req; // @[simSoc.scala 33:25]
  assign bridge_inst_wr = 1'h0; // @[simSoc.scala 34:25]
  assign bridge_inst_size = 3'h2; // @[simSoc.scala 35:25]
  assign bridge_inst_addr = dpath_io_InstRamIO_addr; // @[simSoc.scala 36:25]
  assign bridge_inst_wdata = 64'h0; // @[simSoc.scala 37:25]
  assign bridge_data_req = dpath_io_DataRamIO_req; // @[simSoc.scala 46:25]
  assign bridge_data_wr = dpath_io_DataRamIO_wr; // @[simSoc.scala 47:25]
  assign bridge_data_size = dpath_io_DataRamIO_size; // @[simSoc.scala 48:25]
  assign bridge_data_addr = dpath_io_DataRamIO_addr; // @[simSoc.scala 49:25]
  assign bridge_data_wdata = dpath_io_DataRamIO_wdata; // @[simSoc.scala 50:25]
  assign ram_awid = bridge_awid; // @[simSoc.scala 63:18]
  assign ram_awaddr = bridge_awaddr; // @[simSoc.scala 64:18]
  assign ram_awlen = bridge_awlen; // @[simSoc.scala 65:18]
  assign ram_awsize = bridge_awsize; // @[simSoc.scala 66:18]
  assign ram_awburst = bridge_awburst; // @[simSoc.scala 67:18]
  assign ram_awlock = bridge_awlock; // @[simSoc.scala 68:18]
  assign ram_awcache = bridge_awcache; // @[simSoc.scala 69:18]
  assign ram_awprot = bridge_awprot; // @[simSoc.scala 70:18]
  assign ram_awvalid = bridge_awvalid; // @[simSoc.scala 71:18]
  assign ram_wid = 4'h0;
  assign ram_wdata = bridge_wdata; // @[simSoc.scala 73:18]
  assign ram_wstrb = bridge_wstrb; // @[simSoc.scala 74:18]
  assign ram_wlast = bridge_wlast; // @[simSoc.scala 75:18]
  assign ram_wvalid = bridge_wvalid; // @[simSoc.scala 76:18]
  assign ram_bready = bridge_bready; // @[simSoc.scala 81:18]
  assign ram_arid = bridge_arid; // @[simSoc.scala 82:18]
  assign ram_araddr = bridge_araddr; // @[simSoc.scala 83:18]
  assign ram_arlen = bridge_arlen; // @[simSoc.scala 84:18]
  assign ram_arsize = bridge_arsize; // @[simSoc.scala 85:18]
  assign ram_arburst = bridge_arburst; // @[simSoc.scala 86:18]
  assign ram_arlock = bridge_arlock; // @[simSoc.scala 87:18]
  assign ram_arcache = bridge_arcache; // @[simSoc.scala 88:18]
  assign ram_arprot = bridge_arprot; // @[simSoc.scala 89:18]
  assign ram_arvalid = bridge_arvalid; // @[simSoc.scala 90:18]
  assign ram_rready = bridge_rready; // @[simSoc.scala 97:18]
  assign ram_clock = clock; // @[simSoc.scala 60:19]
  assign ram_reset = reset; // @[simSoc.scala 61:19]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1) begin
          $fwrite(32'h80000002,"Inst RamIO:  req  : %d  wr   : %d  size : %d  addr   : 0x%x  wdata  : 0x%x  rdata  : 0x%x  addr_ok: %d  data_ok: %d\n",dpath_io_InstRamIO_req,1'h0,3'h2,dpath_io_InstRamIO_addr,64'h0,dpath_io_InstRamIO_rdata,dpath_io_InstRamIO_addr_ok,dpath_io_InstRamIO_data_ok); // @[simSoc.scala 43:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1) begin
          $fwrite(32'h80000002,"Data RamIO:  req  : %d  wr   : %d  size : %d  addr   : 0x%x  wdata  : 0x%x  rdata  : 0x%x  addr_ok: %d  data_ok: %d\n",dpath_io_DataRamIO_req,dpath_io_DataRamIO_wr,dpath_io_DataRamIO_size,dpath_io_DataRamIO_addr,dpath_io_DataRamIO_wdata,dpath_io_DataRamIO_rdata,dpath_io_DataRamIO_addr_ok,dpath_io_DataRamIO_data_ok); // @[simSoc.scala 56:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1) begin
          $fwrite(32'h80000002,"AXI_IO:  arvalid: %d  arready: %d  rvalid:  %d  rready:  %d  bvalid:  %d  bready:  %d  wstrb :  %d  araddr: 0x%x  wdata : 0x%x  rdata : 0x%x \n",bridge_arvalid,bridge_arready,bridge_rvalid,bridge_rready,bridge_bvalid,bridge_bready,bridge_wstrb,bridge_araddr,bridge_wdata,bridge_rdata); // @[simSoc.scala 99:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
