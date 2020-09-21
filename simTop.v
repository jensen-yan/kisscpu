module cpath(
  input  [63:0] io_dat_inst,
  input         io_dat_br_eq,
  input         io_dat_br_lt,
  input         io_dat_br_ltu,
  output [2:0]  io_ctl_pc_sel,
  output [1:0]  io_ctl_op1_sel,
  output [1:0]  io_ctl_op2_sel,
  output [3:0]  io_ctl_alu_fun,
  output [1:0]  io_ctl_wb_sel,
  output        io_ctl_rf_wen
);
  wire [63:0] _T = io_dat_inst & 64'h707f; // @[Lookup.scala 31:38]
  wire  _T_1 = 64'h2003 == _T; // @[Lookup.scala 31:38]
  wire  _T_3 = 64'h3 == _T; // @[Lookup.scala 31:38]
  wire  _T_5 = 64'h4003 == _T; // @[Lookup.scala 31:38]
  wire  _T_7 = 64'h1003 == _T; // @[Lookup.scala 31:38]
  wire  _T_9 = 64'h5003 == _T; // @[Lookup.scala 31:38]
  wire  _T_11 = 64'h2023 == _T; // @[Lookup.scala 31:38]
  wire  _T_13 = 64'h23 == _T; // @[Lookup.scala 31:38]
  wire  _T_15 = 64'h1023 == _T; // @[Lookup.scala 31:38]
  wire [63:0] _T_16 = io_dat_inst & 64'h7f; // @[Lookup.scala 31:38]
  wire  _T_17 = 64'h17 == _T_16; // @[Lookup.scala 31:38]
  wire  _T_19 = 64'h37 == _T_16; // @[Lookup.scala 31:38]
  wire  _T_21 = 64'h13 == _T; // @[Lookup.scala 31:38]
  wire  _T_23 = 64'h7013 == _T; // @[Lookup.scala 31:38]
  wire  _T_25 = 64'h6013 == _T; // @[Lookup.scala 31:38]
  wire  _T_27 = 64'h4013 == _T; // @[Lookup.scala 31:38]
  wire  _T_29 = 64'h2013 == _T; // @[Lookup.scala 31:38]
  wire  _T_31 = 64'h3013 == _T; // @[Lookup.scala 31:38]
  wire [63:0] _T_32 = io_dat_inst & 64'hfc00707f; // @[Lookup.scala 31:38]
  wire  _T_33 = 64'h1013 == _T_32; // @[Lookup.scala 31:38]
  wire  _T_35 = 64'h40005013 == _T_32; // @[Lookup.scala 31:38]
  wire  _T_37 = 64'h5013 == _T_32; // @[Lookup.scala 31:38]
  wire [63:0] _T_38 = io_dat_inst & 64'hfe00707f; // @[Lookup.scala 31:38]
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
  wire  _T_75 = 64'h5073 == _T; // @[Lookup.scala 31:38]
  wire  _T_77 = 64'h6073 == _T; // @[Lookup.scala 31:38]
  wire  _T_79 = 64'h7073 == _T; // @[Lookup.scala 31:38]
  wire  _T_81 = 64'h1073 == _T; // @[Lookup.scala 31:38]
  wire  _T_83 = 64'h2073 == _T; // @[Lookup.scala 31:38]
  wire  _T_85 = 64'h3073 == _T; // @[Lookup.scala 31:38]
  wire [3:0] _T_162 = _T_73 ? 4'h6 : 4'h0; // @[Lookup.scala 33:37]
  wire [3:0] _T_163 = _T_71 ? 4'h5 : _T_162; // @[Lookup.scala 33:37]
  wire [3:0] _T_164 = _T_69 ? 4'h4 : _T_163; // @[Lookup.scala 33:37]
  wire [3:0] _T_165 = _T_67 ? 4'h3 : _T_164; // @[Lookup.scala 33:37]
  wire [3:0] _T_166 = _T_65 ? 4'h1 : _T_165; // @[Lookup.scala 33:37]
  wire [3:0] _T_167 = _T_63 ? 4'h2 : _T_166; // @[Lookup.scala 33:37]
  wire [3:0] _T_168 = _T_61 ? 4'h8 : _T_167; // @[Lookup.scala 33:37]
  wire [3:0] _T_169 = _T_59 ? 4'h7 : _T_168; // @[Lookup.scala 33:37]
  wire [3:0] _T_170 = _T_57 ? 4'h0 : _T_169; // @[Lookup.scala 33:37]
  wire [3:0] _T_171 = _T_55 ? 4'h0 : _T_170; // @[Lookup.scala 33:37]
  wire [3:0] _T_172 = _T_53 ? 4'h0 : _T_171; // @[Lookup.scala 33:37]
  wire [3:0] _T_173 = _T_51 ? 4'h0 : _T_172; // @[Lookup.scala 33:37]
  wire [3:0] _T_174 = _T_49 ? 4'h0 : _T_173; // @[Lookup.scala 33:37]
  wire [3:0] _T_175 = _T_47 ? 4'h0 : _T_174; // @[Lookup.scala 33:37]
  wire [3:0] _T_176 = _T_45 ? 4'h0 : _T_175; // @[Lookup.scala 33:37]
  wire [3:0] _T_177 = _T_43 ? 4'h0 : _T_176; // @[Lookup.scala 33:37]
  wire [3:0] _T_178 = _T_41 ? 4'h0 : _T_177; // @[Lookup.scala 33:37]
  wire [3:0] _T_179 = _T_39 ? 4'h0 : _T_178; // @[Lookup.scala 33:37]
  wire [3:0] _T_180 = _T_37 ? 4'h0 : _T_179; // @[Lookup.scala 33:37]
  wire [3:0] _T_181 = _T_35 ? 4'h0 : _T_180; // @[Lookup.scala 33:37]
  wire [3:0] _T_182 = _T_33 ? 4'h0 : _T_181; // @[Lookup.scala 33:37]
  wire [3:0] _T_183 = _T_31 ? 4'h0 : _T_182; // @[Lookup.scala 33:37]
  wire [3:0] _T_184 = _T_29 ? 4'h0 : _T_183; // @[Lookup.scala 33:37]
  wire [3:0] _T_185 = _T_27 ? 4'h0 : _T_184; // @[Lookup.scala 33:37]
  wire [3:0] _T_186 = _T_25 ? 4'h0 : _T_185; // @[Lookup.scala 33:37]
  wire [3:0] _T_187 = _T_23 ? 4'h0 : _T_186; // @[Lookup.scala 33:37]
  wire [3:0] _T_188 = _T_21 ? 4'h0 : _T_187; // @[Lookup.scala 33:37]
  wire [3:0] _T_189 = _T_19 ? 4'h0 : _T_188; // @[Lookup.scala 33:37]
  wire [3:0] _T_190 = _T_17 ? 4'h0 : _T_189; // @[Lookup.scala 33:37]
  wire [3:0] _T_191 = _T_15 ? 4'h0 : _T_190; // @[Lookup.scala 33:37]
  wire [3:0] _T_192 = _T_13 ? 4'h0 : _T_191; // @[Lookup.scala 33:37]
  wire [3:0] _T_193 = _T_11 ? 4'h0 : _T_192; // @[Lookup.scala 33:37]
  wire [3:0] _T_194 = _T_9 ? 4'h0 : _T_193; // @[Lookup.scala 33:37]
  wire [3:0] _T_195 = _T_7 ? 4'h0 : _T_194; // @[Lookup.scala 33:37]
  wire [3:0] _T_196 = _T_5 ? 4'h0 : _T_195; // @[Lookup.scala 33:37]
  wire [3:0] _T_197 = _T_3 ? 4'h0 : _T_196; // @[Lookup.scala 33:37]
  wire [3:0] cs_br_type = _T_1 ? 4'h0 : _T_197; // @[Lookup.scala 33:37]
  wire [1:0] _T_208 = _T_79 ? 2'h2 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] _T_209 = _T_77 ? 2'h2 : _T_208; // @[Lookup.scala 33:37]
  wire [1:0] _T_210 = _T_75 ? 2'h2 : _T_209; // @[Lookup.scala 33:37]
  wire [1:0] _T_211 = _T_73 ? 2'h0 : _T_210; // @[Lookup.scala 33:37]
  wire [1:0] _T_212 = _T_71 ? 2'h0 : _T_211; // @[Lookup.scala 33:37]
  wire [1:0] _T_213 = _T_69 ? 2'h0 : _T_212; // @[Lookup.scala 33:37]
  wire [1:0] _T_214 = _T_67 ? 2'h0 : _T_213; // @[Lookup.scala 33:37]
  wire [1:0] _T_215 = _T_65 ? 2'h0 : _T_214; // @[Lookup.scala 33:37]
  wire [1:0] _T_216 = _T_63 ? 2'h0 : _T_215; // @[Lookup.scala 33:37]
  wire [1:0] _T_217 = _T_61 ? 2'h0 : _T_216; // @[Lookup.scala 33:37]
  wire [1:0] _T_218 = _T_59 ? 2'h0 : _T_217; // @[Lookup.scala 33:37]
  wire [1:0] _T_219 = _T_57 ? 2'h0 : _T_218; // @[Lookup.scala 33:37]
  wire [1:0] _T_220 = _T_55 ? 2'h0 : _T_219; // @[Lookup.scala 33:37]
  wire [1:0] _T_221 = _T_53 ? 2'h0 : _T_220; // @[Lookup.scala 33:37]
  wire [1:0] _T_222 = _T_51 ? 2'h0 : _T_221; // @[Lookup.scala 33:37]
  wire [1:0] _T_223 = _T_49 ? 2'h0 : _T_222; // @[Lookup.scala 33:37]
  wire [1:0] _T_224 = _T_47 ? 2'h0 : _T_223; // @[Lookup.scala 33:37]
  wire [1:0] _T_225 = _T_45 ? 2'h0 : _T_224; // @[Lookup.scala 33:37]
  wire [1:0] _T_226 = _T_43 ? 2'h0 : _T_225; // @[Lookup.scala 33:37]
  wire [1:0] _T_227 = _T_41 ? 2'h0 : _T_226; // @[Lookup.scala 33:37]
  wire [1:0] _T_228 = _T_39 ? 2'h0 : _T_227; // @[Lookup.scala 33:37]
  wire [1:0] _T_229 = _T_37 ? 2'h0 : _T_228; // @[Lookup.scala 33:37]
  wire [1:0] _T_230 = _T_35 ? 2'h0 : _T_229; // @[Lookup.scala 33:37]
  wire [1:0] _T_231 = _T_33 ? 2'h0 : _T_230; // @[Lookup.scala 33:37]
  wire [1:0] _T_232 = _T_31 ? 2'h0 : _T_231; // @[Lookup.scala 33:37]
  wire [1:0] _T_233 = _T_29 ? 2'h0 : _T_232; // @[Lookup.scala 33:37]
  wire [1:0] _T_234 = _T_27 ? 2'h0 : _T_233; // @[Lookup.scala 33:37]
  wire [1:0] _T_235 = _T_25 ? 2'h0 : _T_234; // @[Lookup.scala 33:37]
  wire [1:0] _T_236 = _T_23 ? 2'h0 : _T_235; // @[Lookup.scala 33:37]
  wire [1:0] _T_237 = _T_21 ? 2'h0 : _T_236; // @[Lookup.scala 33:37]
  wire [1:0] _T_238 = _T_19 ? 2'h1 : _T_237; // @[Lookup.scala 33:37]
  wire [1:0] _T_239 = _T_17 ? 2'h1 : _T_238; // @[Lookup.scala 33:37]
  wire [1:0] _T_240 = _T_15 ? 2'h0 : _T_239; // @[Lookup.scala 33:37]
  wire [1:0] _T_241 = _T_13 ? 2'h0 : _T_240; // @[Lookup.scala 33:37]
  wire [1:0] _T_242 = _T_11 ? 2'h0 : _T_241; // @[Lookup.scala 33:37]
  wire [1:0] _T_243 = _T_9 ? 2'h0 : _T_242; // @[Lookup.scala 33:37]
  wire [1:0] _T_244 = _T_7 ? 2'h0 : _T_243; // @[Lookup.scala 33:37]
  wire [1:0] _T_245 = _T_5 ? 2'h0 : _T_244; // @[Lookup.scala 33:37]
  wire [1:0] _T_246 = _T_3 ? 2'h0 : _T_245; // @[Lookup.scala 33:37]
  wire [1:0] _T_266 = _T_61 ? 2'h1 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] _T_267 = _T_59 ? 2'h0 : _T_266; // @[Lookup.scala 33:37]
  wire [1:0] _T_268 = _T_57 ? 2'h0 : _T_267; // @[Lookup.scala 33:37]
  wire [1:0] _T_269 = _T_55 ? 2'h0 : _T_268; // @[Lookup.scala 33:37]
  wire [1:0] _T_270 = _T_53 ? 2'h0 : _T_269; // @[Lookup.scala 33:37]
  wire [1:0] _T_271 = _T_51 ? 2'h0 : _T_270; // @[Lookup.scala 33:37]
  wire [1:0] _T_272 = _T_49 ? 2'h0 : _T_271; // @[Lookup.scala 33:37]
  wire [1:0] _T_273 = _T_47 ? 2'h0 : _T_272; // @[Lookup.scala 33:37]
  wire [1:0] _T_274 = _T_45 ? 2'h0 : _T_273; // @[Lookup.scala 33:37]
  wire [1:0] _T_275 = _T_43 ? 2'h0 : _T_274; // @[Lookup.scala 33:37]
  wire [1:0] _T_276 = _T_41 ? 2'h0 : _T_275; // @[Lookup.scala 33:37]
  wire [1:0] _T_277 = _T_39 ? 2'h0 : _T_276; // @[Lookup.scala 33:37]
  wire [1:0] _T_278 = _T_37 ? 2'h1 : _T_277; // @[Lookup.scala 33:37]
  wire [1:0] _T_279 = _T_35 ? 2'h1 : _T_278; // @[Lookup.scala 33:37]
  wire [1:0] _T_280 = _T_33 ? 2'h1 : _T_279; // @[Lookup.scala 33:37]
  wire [1:0] _T_281 = _T_31 ? 2'h1 : _T_280; // @[Lookup.scala 33:37]
  wire [1:0] _T_282 = _T_29 ? 2'h1 : _T_281; // @[Lookup.scala 33:37]
  wire [1:0] _T_283 = _T_27 ? 2'h1 : _T_282; // @[Lookup.scala 33:37]
  wire [1:0] _T_284 = _T_25 ? 2'h1 : _T_283; // @[Lookup.scala 33:37]
  wire [1:0] _T_285 = _T_23 ? 2'h1 : _T_284; // @[Lookup.scala 33:37]
  wire [1:0] _T_286 = _T_21 ? 2'h1 : _T_285; // @[Lookup.scala 33:37]
  wire [1:0] _T_287 = _T_19 ? 2'h0 : _T_286; // @[Lookup.scala 33:37]
  wire [1:0] _T_288 = _T_17 ? 2'h3 : _T_287; // @[Lookup.scala 33:37]
  wire [1:0] _T_289 = _T_15 ? 2'h2 : _T_288; // @[Lookup.scala 33:37]
  wire [1:0] _T_290 = _T_13 ? 2'h2 : _T_289; // @[Lookup.scala 33:37]
  wire [1:0] _T_291 = _T_11 ? 2'h2 : _T_290; // @[Lookup.scala 33:37]
  wire [1:0] _T_292 = _T_9 ? 2'h1 : _T_291; // @[Lookup.scala 33:37]
  wire [1:0] _T_293 = _T_7 ? 2'h1 : _T_292; // @[Lookup.scala 33:37]
  wire [1:0] _T_294 = _T_5 ? 2'h1 : _T_293; // @[Lookup.scala 33:37]
  wire [1:0] _T_295 = _T_3 ? 2'h1 : _T_294; // @[Lookup.scala 33:37]
  wire [3:0] _T_303 = _T_85 ? 4'hb : 4'h0; // @[Lookup.scala 33:37]
  wire [3:0] _T_304 = _T_83 ? 4'hb : _T_303; // @[Lookup.scala 33:37]
  wire [3:0] _T_305 = _T_81 ? 4'hb : _T_304; // @[Lookup.scala 33:37]
  wire [3:0] _T_306 = _T_79 ? 4'hb : _T_305; // @[Lookup.scala 33:37]
  wire [3:0] _T_307 = _T_77 ? 4'hb : _T_306; // @[Lookup.scala 33:37]
  wire [3:0] _T_308 = _T_75 ? 4'hb : _T_307; // @[Lookup.scala 33:37]
  wire [3:0] _T_309 = _T_73 ? 4'h0 : _T_308; // @[Lookup.scala 33:37]
  wire [3:0] _T_310 = _T_71 ? 4'h0 : _T_309; // @[Lookup.scala 33:37]
  wire [3:0] _T_311 = _T_69 ? 4'h0 : _T_310; // @[Lookup.scala 33:37]
  wire [3:0] _T_312 = _T_67 ? 4'h0 : _T_311; // @[Lookup.scala 33:37]
  wire [3:0] _T_313 = _T_65 ? 4'h0 : _T_312; // @[Lookup.scala 33:37]
  wire [3:0] _T_314 = _T_63 ? 4'h0 : _T_313; // @[Lookup.scala 33:37]
  wire [3:0] _T_315 = _T_61 ? 4'h0 : _T_314; // @[Lookup.scala 33:37]
  wire [3:0] _T_316 = _T_59 ? 4'h0 : _T_315; // @[Lookup.scala 33:37]
  wire [3:0] _T_317 = _T_57 ? 4'h4 : _T_316; // @[Lookup.scala 33:37]
  wire [3:0] _T_318 = _T_55 ? 4'h5 : _T_317; // @[Lookup.scala 33:37]
  wire [3:0] _T_319 = _T_53 ? 4'h8 : _T_318; // @[Lookup.scala 33:37]
  wire [3:0] _T_320 = _T_51 ? 4'h7 : _T_319; // @[Lookup.scala 33:37]
  wire [3:0] _T_321 = _T_49 ? 4'h6 : _T_320; // @[Lookup.scala 33:37]
  wire [3:0] _T_322 = _T_47 ? 4'ha : _T_321; // @[Lookup.scala 33:37]
  wire [3:0] _T_323 = _T_45 ? 4'h9 : _T_322; // @[Lookup.scala 33:37]
  wire [3:0] _T_324 = _T_43 ? 4'h2 : _T_323; // @[Lookup.scala 33:37]
  wire [3:0] _T_325 = _T_41 ? 4'h1 : _T_324; // @[Lookup.scala 33:37]
  wire [3:0] _T_326 = _T_39 ? 4'h3 : _T_325; // @[Lookup.scala 33:37]
  wire [3:0] _T_327 = _T_37 ? 4'h4 : _T_326; // @[Lookup.scala 33:37]
  wire [3:0] _T_328 = _T_35 ? 4'h5 : _T_327; // @[Lookup.scala 33:37]
  wire [3:0] _T_329 = _T_33 ? 4'h3 : _T_328; // @[Lookup.scala 33:37]
  wire [3:0] _T_330 = _T_31 ? 4'ha : _T_329; // @[Lookup.scala 33:37]
  wire [3:0] _T_331 = _T_29 ? 4'h9 : _T_330; // @[Lookup.scala 33:37]
  wire [3:0] _T_332 = _T_27 ? 4'h8 : _T_331; // @[Lookup.scala 33:37]
  wire [3:0] _T_333 = _T_25 ? 4'h7 : _T_332; // @[Lookup.scala 33:37]
  wire [3:0] _T_334 = _T_23 ? 4'h6 : _T_333; // @[Lookup.scala 33:37]
  wire [3:0] _T_335 = _T_21 ? 4'h1 : _T_334; // @[Lookup.scala 33:37]
  wire [3:0] _T_336 = _T_19 ? 4'hb : _T_335; // @[Lookup.scala 33:37]
  wire [3:0] _T_337 = _T_17 ? 4'h1 : _T_336; // @[Lookup.scala 33:37]
  wire [3:0] _T_338 = _T_15 ? 4'h1 : _T_337; // @[Lookup.scala 33:37]
  wire [3:0] _T_339 = _T_13 ? 4'h1 : _T_338; // @[Lookup.scala 33:37]
  wire [3:0] _T_340 = _T_11 ? 4'h1 : _T_339; // @[Lookup.scala 33:37]
  wire [3:0] _T_341 = _T_9 ? 4'h1 : _T_340; // @[Lookup.scala 33:37]
  wire [3:0] _T_342 = _T_7 ? 4'h1 : _T_341; // @[Lookup.scala 33:37]
  wire [3:0] _T_343 = _T_5 ? 4'h1 : _T_342; // @[Lookup.scala 33:37]
  wire [3:0] _T_344 = _T_3 ? 4'h1 : _T_343; // @[Lookup.scala 33:37]
  wire [1:0] _T_352 = _T_85 ? 2'h3 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] _T_353 = _T_83 ? 2'h3 : _T_352; // @[Lookup.scala 33:37]
  wire [1:0] _T_354 = _T_81 ? 2'h3 : _T_353; // @[Lookup.scala 33:37]
  wire [1:0] _T_355 = _T_79 ? 2'h3 : _T_354; // @[Lookup.scala 33:37]
  wire [1:0] _T_356 = _T_77 ? 2'h3 : _T_355; // @[Lookup.scala 33:37]
  wire [1:0] _T_357 = _T_75 ? 2'h3 : _T_356; // @[Lookup.scala 33:37]
  wire [1:0] _T_358 = _T_73 ? 2'h0 : _T_357; // @[Lookup.scala 33:37]
  wire [1:0] _T_359 = _T_71 ? 2'h0 : _T_358; // @[Lookup.scala 33:37]
  wire [1:0] _T_360 = _T_69 ? 2'h0 : _T_359; // @[Lookup.scala 33:37]
  wire [1:0] _T_361 = _T_67 ? 2'h0 : _T_360; // @[Lookup.scala 33:37]
  wire [1:0] _T_362 = _T_65 ? 2'h0 : _T_361; // @[Lookup.scala 33:37]
  wire [1:0] _T_363 = _T_63 ? 2'h0 : _T_362; // @[Lookup.scala 33:37]
  wire [1:0] _T_364 = _T_61 ? 2'h2 : _T_363; // @[Lookup.scala 33:37]
  wire [1:0] _T_365 = _T_59 ? 2'h2 : _T_364; // @[Lookup.scala 33:37]
  wire [1:0] _T_366 = _T_57 ? 2'h0 : _T_365; // @[Lookup.scala 33:37]
  wire [1:0] _T_367 = _T_55 ? 2'h0 : _T_366; // @[Lookup.scala 33:37]
  wire [1:0] _T_368 = _T_53 ? 2'h0 : _T_367; // @[Lookup.scala 33:37]
  wire [1:0] _T_369 = _T_51 ? 2'h0 : _T_368; // @[Lookup.scala 33:37]
  wire [1:0] _T_370 = _T_49 ? 2'h0 : _T_369; // @[Lookup.scala 33:37]
  wire [1:0] _T_371 = _T_47 ? 2'h0 : _T_370; // @[Lookup.scala 33:37]
  wire [1:0] _T_372 = _T_45 ? 2'h0 : _T_371; // @[Lookup.scala 33:37]
  wire [1:0] _T_373 = _T_43 ? 2'h0 : _T_372; // @[Lookup.scala 33:37]
  wire [1:0] _T_374 = _T_41 ? 2'h0 : _T_373; // @[Lookup.scala 33:37]
  wire [1:0] _T_375 = _T_39 ? 2'h0 : _T_374; // @[Lookup.scala 33:37]
  wire [1:0] _T_376 = _T_37 ? 2'h0 : _T_375; // @[Lookup.scala 33:37]
  wire [1:0] _T_377 = _T_35 ? 2'h0 : _T_376; // @[Lookup.scala 33:37]
  wire [1:0] _T_378 = _T_33 ? 2'h0 : _T_377; // @[Lookup.scala 33:37]
  wire [1:0] _T_379 = _T_31 ? 2'h0 : _T_378; // @[Lookup.scala 33:37]
  wire [1:0] _T_380 = _T_29 ? 2'h0 : _T_379; // @[Lookup.scala 33:37]
  wire [1:0] _T_381 = _T_27 ? 2'h0 : _T_380; // @[Lookup.scala 33:37]
  wire [1:0] _T_382 = _T_25 ? 2'h0 : _T_381; // @[Lookup.scala 33:37]
  wire [1:0] _T_383 = _T_23 ? 2'h0 : _T_382; // @[Lookup.scala 33:37]
  wire [1:0] _T_384 = _T_21 ? 2'h0 : _T_383; // @[Lookup.scala 33:37]
  wire [1:0] _T_385 = _T_19 ? 2'h0 : _T_384; // @[Lookup.scala 33:37]
  wire [1:0] _T_386 = _T_17 ? 2'h0 : _T_385; // @[Lookup.scala 33:37]
  wire [1:0] _T_387 = _T_15 ? 2'h0 : _T_386; // @[Lookup.scala 33:37]
  wire [1:0] _T_388 = _T_13 ? 2'h0 : _T_387; // @[Lookup.scala 33:37]
  wire [1:0] _T_389 = _T_11 ? 2'h0 : _T_388; // @[Lookup.scala 33:37]
  wire [1:0] _T_390 = _T_9 ? 2'h1 : _T_389; // @[Lookup.scala 33:37]
  wire [1:0] _T_391 = _T_7 ? 2'h1 : _T_390; // @[Lookup.scala 33:37]
  wire [1:0] _T_392 = _T_5 ? 2'h1 : _T_391; // @[Lookup.scala 33:37]
  wire [1:0] _T_393 = _T_3 ? 2'h1 : _T_392; // @[Lookup.scala 33:37]
  wire  _T_402 = _T_83 | _T_85; // @[Lookup.scala 33:37]
  wire  _T_403 = _T_81 | _T_402; // @[Lookup.scala 33:37]
  wire  _T_404 = _T_79 | _T_403; // @[Lookup.scala 33:37]
  wire  _T_405 = _T_77 | _T_404; // @[Lookup.scala 33:37]
  wire  _T_406 = _T_75 | _T_405; // @[Lookup.scala 33:37]
  wire  _T_407 = _T_73 ? 1'h0 : _T_406; // @[Lookup.scala 33:37]
  wire  _T_408 = _T_71 ? 1'h0 : _T_407; // @[Lookup.scala 33:37]
  wire  _T_409 = _T_69 ? 1'h0 : _T_408; // @[Lookup.scala 33:37]
  wire  _T_410 = _T_67 ? 1'h0 : _T_409; // @[Lookup.scala 33:37]
  wire  _T_411 = _T_65 ? 1'h0 : _T_410; // @[Lookup.scala 33:37]
  wire  _T_412 = _T_63 ? 1'h0 : _T_411; // @[Lookup.scala 33:37]
  wire  _T_413 = _T_61 | _T_412; // @[Lookup.scala 33:37]
  wire  _T_414 = _T_59 | _T_413; // @[Lookup.scala 33:37]
  wire  _T_415 = _T_57 | _T_414; // @[Lookup.scala 33:37]
  wire  _T_416 = _T_55 | _T_415; // @[Lookup.scala 33:37]
  wire  _T_417 = _T_53 | _T_416; // @[Lookup.scala 33:37]
  wire  _T_418 = _T_51 | _T_417; // @[Lookup.scala 33:37]
  wire  _T_419 = _T_49 | _T_418; // @[Lookup.scala 33:37]
  wire  _T_420 = _T_47 | _T_419; // @[Lookup.scala 33:37]
  wire  _T_421 = _T_45 | _T_420; // @[Lookup.scala 33:37]
  wire  _T_422 = _T_43 | _T_421; // @[Lookup.scala 33:37]
  wire  _T_423 = _T_41 | _T_422; // @[Lookup.scala 33:37]
  wire  _T_424 = _T_39 | _T_423; // @[Lookup.scala 33:37]
  wire  _T_425 = _T_37 | _T_424; // @[Lookup.scala 33:37]
  wire  _T_426 = _T_35 | _T_425; // @[Lookup.scala 33:37]
  wire  _T_427 = _T_33 | _T_426; // @[Lookup.scala 33:37]
  wire  _T_428 = _T_31 | _T_427; // @[Lookup.scala 33:37]
  wire  _T_429 = _T_29 | _T_428; // @[Lookup.scala 33:37]
  wire  _T_430 = _T_27 | _T_429; // @[Lookup.scala 33:37]
  wire  _T_431 = _T_25 | _T_430; // @[Lookup.scala 33:37]
  wire  _T_432 = _T_23 | _T_431; // @[Lookup.scala 33:37]
  wire  _T_433 = _T_21 | _T_432; // @[Lookup.scala 33:37]
  wire  _T_434 = _T_19 | _T_433; // @[Lookup.scala 33:37]
  wire  _T_435 = _T_17 | _T_434; // @[Lookup.scala 33:37]
  wire  _T_436 = _T_15 ? 1'h0 : _T_435; // @[Lookup.scala 33:37]
  wire  _T_437 = _T_13 ? 1'h0 : _T_436; // @[Lookup.scala 33:37]
  wire  _T_438 = _T_11 ? 1'h0 : _T_437; // @[Lookup.scala 33:37]
  wire  _T_439 = _T_9 | _T_438; // @[Lookup.scala 33:37]
  wire  _T_440 = _T_7 | _T_439; // @[Lookup.scala 33:37]
  wire  _T_441 = _T_5 | _T_440; // @[Lookup.scala 33:37]
  wire  _T_442 = _T_3 | _T_441; // @[Lookup.scala 33:37]
  wire  _T_639 = cs_br_type == 4'h0; // @[cpath.scala 111:20]
  wire  _T_640 = cs_br_type == 4'h1; // @[cpath.scala 112:22]
  wire  _T_641 = ~io_dat_br_eq; // @[cpath.scala 112:39]
  wire [2:0] _T_642 = _T_641 ? 3'h1 : 3'h0; // @[cpath.scala 112:38]
  wire  _T_643 = cs_br_type == 4'h2; // @[cpath.scala 113:24]
  wire [2:0] _T_644 = io_dat_br_eq ? 3'h1 : 3'h0; // @[cpath.scala 113:40]
  wire  _T_645 = cs_br_type == 4'h3; // @[cpath.scala 114:26]
  wire  _T_646 = ~io_dat_br_lt; // @[cpath.scala 114:43]
  wire [2:0] _T_647 = _T_646 ? 3'h1 : 3'h0; // @[cpath.scala 114:42]
  wire  _T_648 = cs_br_type == 4'h4; // @[cpath.scala 115:28]
  wire  _T_649 = ~io_dat_br_ltu; // @[cpath.scala 115:45]
  wire [2:0] _T_650 = _T_649 ? 3'h1 : 3'h0; // @[cpath.scala 115:44]
  wire  _T_651 = cs_br_type == 4'h5; // @[cpath.scala 116:30]
  wire [2:0] _T_652 = io_dat_br_lt ? 3'h1 : 3'h0; // @[cpath.scala 116:46]
  wire  _T_653 = cs_br_type == 4'h6; // @[cpath.scala 117:32]
  wire [2:0] _T_654 = io_dat_br_ltu ? 3'h1 : 3'h0; // @[cpath.scala 117:48]
  wire  _T_655 = cs_br_type == 4'h7; // @[cpath.scala 118:34]
  wire  _T_656 = cs_br_type == 4'h8; // @[cpath.scala 119:36]
  wire [2:0] _T_657 = _T_656 ? 3'h3 : 3'h0; // @[cpath.scala 119:24]
  wire [2:0] _T_658 = _T_655 ? 3'h2 : _T_657; // @[cpath.scala 118:22]
  wire [2:0] _T_659 = _T_653 ? _T_654 : _T_658; // @[cpath.scala 117:20]
  wire [2:0] _T_660 = _T_651 ? _T_652 : _T_659; // @[cpath.scala 116:18]
  wire [2:0] _T_661 = _T_648 ? _T_650 : _T_660; // @[cpath.scala 115:16]
  wire [2:0] _T_662 = _T_645 ? _T_647 : _T_661; // @[cpath.scala 114:14]
  wire [2:0] _T_663 = _T_643 ? _T_644 : _T_662; // @[cpath.scala 113:12]
  wire [2:0] _T_664 = _T_640 ? _T_642 : _T_663; // @[cpath.scala 112:10]
  assign io_ctl_pc_sel = _T_639 ? 3'h0 : _T_664; // @[cpath.scala 127:19]
  assign io_ctl_op1_sel = _T_1 ? 2'h0 : _T_246; // @[cpath.scala 128:19]
  assign io_ctl_op2_sel = _T_1 ? 2'h1 : _T_295; // @[cpath.scala 129:19]
  assign io_ctl_alu_fun = _T_1 ? 4'h1 : _T_344; // @[cpath.scala 130:19]
  assign io_ctl_wb_sel = _T_1 ? 2'h1 : _T_393; // @[cpath.scala 131:19]
  assign io_ctl_rf_wen = _T_1 | _T_442; // @[cpath.scala 133:19]
endmodule
module dpath(
  input         clock,
  input         reset,
  input  [2:0]  io_ctl_pc_sel,
  input  [1:0]  io_ctl_op1_sel,
  input  [1:0]  io_ctl_op2_sel,
  input  [3:0]  io_ctl_alu_fun,
  input  [1:0]  io_ctl_wb_sel,
  input         io_ctl_rf_wen,
  output [63:0] io_dat_inst,
  output        io_dat_br_eq,
  output        io_dat_br_lt,
  output        io_dat_br_ltu,
  output [63:0] io_instReadIO_addr,
  input  [63:0] io_instReadIO_data,
  output [63:0] io_dataReadIO_addr,
  input  [63:0] io_dataReadIO_data,
  output [63:0] io_dataWriteIO_addr,
  output [63:0] io_dataWriteIO_data,
  output [63:0] _T_54_0_0,
  output [63:0] _T_54_0_1,
  output [63:0] _T_54_0_2,
  output [63:0] _T_54_0_3,
  output [63:0] _T_54_0_4,
  output [63:0] _T_54_0_5,
  output [63:0] _T_54_0_6,
  output [63:0] _T_54_0_7,
  output [63:0] _T_54_0_8,
  output [63:0] _T_54_0_9,
  output [63:0] _T_54_0_10,
  output [63:0] _T_54_0_11,
  output [63:0] _T_54_0_12,
  output [63:0] _T_54_0_13,
  output [63:0] _T_54_0_14,
  output [63:0] _T_54_0_15,
  output [63:0] _T_54_0_16,
  output [63:0] _T_54_0_17,
  output [63:0] _T_54_0_18,
  output [63:0] _T_54_0_19,
  output [63:0] _T_54_0_20,
  output [63:0] _T_54_0_21,
  output [63:0] _T_54_0_22,
  output [63:0] _T_54_0_23,
  output [63:0] _T_54_0_24,
  output [63:0] _T_54_0_25,
  output [63:0] _T_54_0_26,
  output [63:0] _T_54_0_27,
  output [63:0] _T_54_0_28,
  output [63:0] _T_54_0_29,
  output [63:0] _T_54_0_30,
  output [63:0] _T_54_0_31,
  output [63:0] pc_reg_0
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] regfile2 [0:31]; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_22_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_22_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_23_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_23_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_24_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_24_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_25_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_25_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_26_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_26_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_27_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_27_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_28_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_28_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_29_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_29_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_30_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_30_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_31_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_31_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_32_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_32_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_33_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_33_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_34_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_34_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_35_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_35_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_36_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_36_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_37_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_37_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_38_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_38_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_39_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_39_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_40_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_40_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_41_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_41_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_42_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_42_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_43_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_43_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_44_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_44_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_45_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_45_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_46_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_46_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_47_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_47_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_48_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_48_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_49_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_49_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_50_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_50_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_51_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_51_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_52_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_52_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_53_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_53_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_56_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_56_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_58_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_58_addr; // @[dpath.scala 86:21]
  wire [63:0] regfile2__T_21_data; // @[dpath.scala 86:21]
  wire [4:0] regfile2__T_21_addr; // @[dpath.scala 86:21]
  wire  regfile2__T_21_mask; // @[dpath.scala 86:21]
  wire  regfile2__T_21_en; // @[dpath.scala 86:21]
  wire  _T = io_ctl_pc_sel == 3'h0; // @[dpath.scala 44:20]
  wire  _T_1 = io_ctl_pc_sel == 3'h1; // @[dpath.scala 45:20]
  wire  _T_2 = io_ctl_pc_sel == 3'h2; // @[dpath.scala 46:20]
  wire  _T_3 = io_ctl_pc_sel == 3'h3; // @[dpath.scala 47:20]
  wire [4:0] rs1_addr = io_instReadIO_data[19:15]; // @[dpath.scala 78:22]
  wire  _T_55 = rs1_addr != 5'h0; // @[dpath.scala 103:32]
  wire [63:0] rs1_data = _T_55 ? regfile2__T_56_data : 64'h0; // @[dpath.scala 103:21]
  wire [11:0] imm_i = io_instReadIO_data[31:20]; // @[dpath.scala 108:19]
  wire [19:0] _T_77 = imm_i[11] ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [31:0] imm_i_sext = {_T_77,imm_i}; // @[Cat.scala 29:58]
  wire [63:0] _GEN_6 = {{32'd0}, imm_i_sext}; // @[dpath.scala 162:41]
  wire [63:0] jump_reg_target = rs1_data + _GEN_6; // @[dpath.scala 162:41]
  reg [63:0] pc_reg; // @[dpath.scala 51:23]
  wire [63:0] pc_plus4 = pc_reg + 64'h4; // @[dpath.scala 58:23]
  wire [19:0] imm_j = {io_instReadIO_data[31],io_instReadIO_data[19:12],io_instReadIO_data[20],io_instReadIO_data[30:21]}; // @[Cat.scala 29:58]
  wire [10:0] _T_88 = imm_j[19] ? 11'h7ff : 11'h0; // @[Bitwise.scala 72:12]
  wire [31:0] imm_j_sext = {_T_88,io_instReadIO_data[31],io_instReadIO_data[19:12],io_instReadIO_data[20],io_instReadIO_data[30:21],1'h0}; // @[Cat.scala 29:58]
  wire [63:0] _GEN_7 = {{32'd0}, imm_j_sext}; // @[dpath.scala 161:29]
  wire [63:0] jmp_target = pc_reg + _GEN_7; // @[dpath.scala 161:29]
  wire [11:0] imm_b = {io_instReadIO_data[31],io_instReadIO_data[7],io_instReadIO_data[30:25],io_instReadIO_data[11:8]}; // @[Cat.scala 29:58]
  wire [18:0] _T_83 = imm_b[11] ? 19'h7ffff : 19'h0; // @[Bitwise.scala 72:12]
  wire [31:0] imm_b_sext = {_T_83,io_instReadIO_data[31],io_instReadIO_data[7],io_instReadIO_data[30:25],io_instReadIO_data[11:8],1'h0}; // @[Cat.scala 29:58]
  wire [63:0] _GEN_8 = {{32'd0}, imm_b_sext}; // @[dpath.scala 160:29]
  wire [63:0] br_target = pc_reg + _GEN_8; // @[dpath.scala 160:29]
  wire  _T_12 = ~reset; // @[dpath.scala 72:9]
  wire [4:0] rs2_addr = io_instReadIO_data[24:20]; // @[dpath.scala 79:22]
  wire [4:0] wb_addr = io_instReadIO_data[11:7]; // @[dpath.scala 80:22]
  wire  _T_19 = wb_addr != 5'h0; // @[dpath.scala 88:28]
  wire  _T_147 = io_ctl_wb_sel == 2'h0; // @[dpath.scala 186:20]
  wire  _T_102 = io_ctl_alu_fun == 4'h1; // @[dpath.scala 144:21]
  wire  _T_90 = io_ctl_op1_sel == 2'h0; // @[dpath.scala 124:21]
  wire  _T_91 = io_ctl_op1_sel == 2'h1; // @[dpath.scala 125:21]
  wire [19:0] imm_u = io_instReadIO_data[31:12]; // @[dpath.scala 111:19]
  wire [31:0] imm_u_sext = {imm_u,12'h0}; // @[Cat.scala 29:58]
  wire  _T_92 = io_ctl_op1_sel == 2'h2; // @[dpath.scala 126:21]
  wire [31:0] imm_z = {27'h0,rs1_addr}; // @[Cat.scala 29:58]
  wire [31:0] _T_93 = _T_92 ? imm_z : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _T_94 = _T_91 ? imm_u_sext : _T_93; // @[Mux.scala 98:16]
  wire [63:0] alu_op1 = _T_90 ? rs1_data : {{32'd0}, _T_94}; // @[Mux.scala 98:16]
  wire  _T_95 = io_ctl_op2_sel == 2'h0; // @[dpath.scala 130:21]
  wire  _T_57 = rs2_addr != 5'h0; // @[dpath.scala 104:32]
  wire [63:0] rs2_data = _T_57 ? regfile2__T_58_data : 64'h0; // @[dpath.scala 104:21]
  wire  _T_96 = io_ctl_op2_sel == 2'h3; // @[dpath.scala 131:21]
  wire  _T_97 = io_ctl_op2_sel == 2'h1; // @[dpath.scala 132:21]
  wire  _T_98 = io_ctl_op2_sel == 2'h2; // @[dpath.scala 133:21]
  wire [11:0] imm_s = {io_instReadIO_data[31:25],wb_addr}; // @[Cat.scala 29:58]
  wire [19:0] _T_80 = imm_s[11] ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [31:0] imm_s_sext = {_T_80,io_instReadIO_data[31:25],wb_addr}; // @[Cat.scala 29:58]
  wire [31:0] _T_99 = _T_98 ? imm_s_sext : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _T_100 = _T_97 ? imm_i_sext : _T_99; // @[Mux.scala 98:16]
  wire [63:0] _T_101 = _T_96 ? pc_reg : {{32'd0}, _T_100}; // @[Mux.scala 98:16]
  wire [63:0] alu_op2 = _T_95 ? rs2_data : _T_101; // @[Mux.scala 98:16]
  wire [63:0] _T_104 = alu_op1 + alu_op2; // @[dpath.scala 144:47]
  wire  _T_105 = io_ctl_alu_fun == 4'h2; // @[dpath.scala 145:21]
  wire [63:0] _T_107 = alu_op1 - alu_op2; // @[dpath.scala 145:47]
  wire  _T_108 = io_ctl_alu_fun == 4'h6; // @[dpath.scala 146:21]
  wire [63:0] _T_109 = alu_op1 & alu_op2; // @[dpath.scala 146:47]
  wire  _T_110 = io_ctl_alu_fun == 4'h7; // @[dpath.scala 147:21]
  wire [63:0] _T_111 = alu_op1 | alu_op2; // @[dpath.scala 147:47]
  wire  _T_112 = io_ctl_alu_fun == 4'h8; // @[dpath.scala 148:21]
  wire [63:0] _T_113 = alu_op1 ^ alu_op2; // @[dpath.scala 148:47]
  wire  _T_114 = io_ctl_alu_fun == 4'h9; // @[dpath.scala 149:21]
  wire [63:0] _T_115 = _T_90 ? rs1_data : {{32'd0}, _T_94}; // @[dpath.scala 149:53]
  wire [63:0] _T_116 = _T_95 ? rs2_data : _T_101; // @[dpath.scala 149:72]
  wire  _T_117 = $signed(_T_115) < $signed(_T_116); // @[dpath.scala 149:56]
  wire  _T_118 = io_ctl_alu_fun == 4'ha; // @[dpath.scala 150:21]
  wire  _T_119 = alu_op1 < alu_op2; // @[dpath.scala 150:47]
  wire  _T_120 = io_ctl_alu_fun == 4'h3; // @[dpath.scala 151:21]
  wire [4:0] alu_shamt = alu_op2[4:0]; // @[dpath.scala 141:26]
  wire [94:0] _GEN_9 = {{31'd0}, alu_op1}; // @[dpath.scala 151:48]
  wire [94:0] _T_121 = _GEN_9 << alu_shamt; // @[dpath.scala 151:48]
  wire  _T_123 = io_ctl_alu_fun == 4'h5; // @[dpath.scala 152:21]
  wire [63:0] _T_126 = $signed(_T_115) >>> alu_shamt; // @[dpath.scala 152:76]
  wire  _T_127 = io_ctl_alu_fun == 4'h4; // @[dpath.scala 153:21]
  wire [63:0] _T_128 = alu_op1 >> alu_shamt; // @[dpath.scala 153:47]
  wire  _T_129 = io_ctl_alu_fun == 4'hb; // @[dpath.scala 154:21]
  wire [63:0] _T_130 = _T_129 ? alu_op1 : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] _T_131 = _T_127 ? _T_128 : _T_130; // @[Mux.scala 98:16]
  wire [63:0] _T_132 = _T_123 ? _T_126 : _T_131; // @[Mux.scala 98:16]
  wire [63:0] _T_133 = _T_120 ? _T_121[63:0] : _T_132; // @[Mux.scala 98:16]
  wire [63:0] _T_134 = _T_118 ? {{63'd0}, _T_119} : _T_133; // @[Mux.scala 98:16]
  wire [63:0] _T_135 = _T_114 ? {{63'd0}, _T_117} : _T_134; // @[Mux.scala 98:16]
  wire [63:0] _T_136 = _T_112 ? _T_113 : _T_135; // @[Mux.scala 98:16]
  wire [63:0] _T_137 = _T_110 ? _T_111 : _T_136; // @[Mux.scala 98:16]
  wire [63:0] _T_138 = _T_108 ? _T_109 : _T_137; // @[Mux.scala 98:16]
  wire [63:0] _T_139 = _T_105 ? _T_107 : _T_138; // @[Mux.scala 98:16]
  wire [63:0] alu_out = _T_102 ? _T_104 : _T_139; // @[Mux.scala 98:16]
  wire  _T_148 = io_ctl_wb_sel == 2'h1; // @[dpath.scala 187:19]
  wire  _T_149 = io_ctl_wb_sel == 2'h2; // @[dpath.scala 188:20]
  wire [63:0] _T_150 = _T_149 ? pc_plus4 : alu_out; // @[Mux.scala 98:16]
  wire [63:0] _T_151 = _T_148 ? io_dataReadIO_data : _T_150; // @[Mux.scala 98:16]
  wire [63:0] wb_data = _T_147 ? alu_out : _T_151; // @[Mux.scala 98:16]
  wire [63:0] _T_154 = _T_55 ? regfile2__T_56_data : 64'h0; // @[dpath.scala 200:36]
  wire [63:0] _T_155 = _T_57 ? regfile2__T_58_data : 64'h0; // @[dpath.scala 200:56]
  wire [63:0] _T_54_0 = regfile2__T_22_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_1 = regfile2__T_23_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_2 = regfile2__T_24_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_3 = regfile2__T_25_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_4 = regfile2__T_26_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_5 = regfile2__T_27_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_6 = regfile2__T_28_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_7 = regfile2__T_29_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_8 = regfile2__T_30_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_9 = regfile2__T_31_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_10 = regfile2__T_32_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_11 = regfile2__T_33_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_12 = regfile2__T_34_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_13 = regfile2__T_35_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_14 = regfile2__T_36_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_15 = regfile2__T_37_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_16 = regfile2__T_38_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_17 = regfile2__T_39_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_18 = regfile2__T_40_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_19 = regfile2__T_41_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_20 = regfile2__T_42_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_21 = regfile2__T_43_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_22 = regfile2__T_44_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_23 = regfile2__T_45_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_24 = regfile2__T_46_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_25 = regfile2__T_47_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_26 = regfile2__T_48_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_27 = regfile2__T_49_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_28 = regfile2__T_50_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_29 = regfile2__T_51_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_30 = regfile2__T_52_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  wire [63:0] _T_54_31 = regfile2__T_53_data; // @[dpath.scala 94:32 dpath.scala 94:32]
  assign regfile2__T_22_addr = 5'h0;
  assign regfile2__T_22_data = regfile2[regfile2__T_22_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_23_addr = 5'h1;
  assign regfile2__T_23_data = regfile2[regfile2__T_23_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_24_addr = 5'h2;
  assign regfile2__T_24_data = regfile2[regfile2__T_24_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_25_addr = 5'h3;
  assign regfile2__T_25_data = regfile2[regfile2__T_25_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_26_addr = 5'h4;
  assign regfile2__T_26_data = regfile2[regfile2__T_26_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_27_addr = 5'h5;
  assign regfile2__T_27_data = regfile2[regfile2__T_27_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_28_addr = 5'h6;
  assign regfile2__T_28_data = regfile2[regfile2__T_28_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_29_addr = 5'h7;
  assign regfile2__T_29_data = regfile2[regfile2__T_29_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_30_addr = 5'h8;
  assign regfile2__T_30_data = regfile2[regfile2__T_30_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_31_addr = 5'h9;
  assign regfile2__T_31_data = regfile2[regfile2__T_31_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_32_addr = 5'ha;
  assign regfile2__T_32_data = regfile2[regfile2__T_32_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_33_addr = 5'hb;
  assign regfile2__T_33_data = regfile2[regfile2__T_33_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_34_addr = 5'hc;
  assign regfile2__T_34_data = regfile2[regfile2__T_34_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_35_addr = 5'hd;
  assign regfile2__T_35_data = regfile2[regfile2__T_35_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_36_addr = 5'he;
  assign regfile2__T_36_data = regfile2[regfile2__T_36_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_37_addr = 5'hf;
  assign regfile2__T_37_data = regfile2[regfile2__T_37_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_38_addr = 5'h10;
  assign regfile2__T_38_data = regfile2[regfile2__T_38_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_39_addr = 5'h11;
  assign regfile2__T_39_data = regfile2[regfile2__T_39_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_40_addr = 5'h12;
  assign regfile2__T_40_data = regfile2[regfile2__T_40_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_41_addr = 5'h13;
  assign regfile2__T_41_data = regfile2[regfile2__T_41_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_42_addr = 5'h14;
  assign regfile2__T_42_data = regfile2[regfile2__T_42_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_43_addr = 5'h15;
  assign regfile2__T_43_data = regfile2[regfile2__T_43_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_44_addr = 5'h16;
  assign regfile2__T_44_data = regfile2[regfile2__T_44_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_45_addr = 5'h17;
  assign regfile2__T_45_data = regfile2[regfile2__T_45_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_46_addr = 5'h18;
  assign regfile2__T_46_data = regfile2[regfile2__T_46_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_47_addr = 5'h19;
  assign regfile2__T_47_data = regfile2[regfile2__T_47_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_48_addr = 5'h1a;
  assign regfile2__T_48_data = regfile2[regfile2__T_48_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_49_addr = 5'h1b;
  assign regfile2__T_49_data = regfile2[regfile2__T_49_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_50_addr = 5'h1c;
  assign regfile2__T_50_data = regfile2[regfile2__T_50_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_51_addr = 5'h1d;
  assign regfile2__T_51_data = regfile2[regfile2__T_51_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_52_addr = 5'h1e;
  assign regfile2__T_52_data = regfile2[regfile2__T_52_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_53_addr = 5'h1f;
  assign regfile2__T_53_data = regfile2[regfile2__T_53_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_56_addr = io_instReadIO_data[19:15];
  assign regfile2__T_56_data = regfile2[regfile2__T_56_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_58_addr = io_instReadIO_data[24:20];
  assign regfile2__T_58_data = regfile2[regfile2__T_58_addr]; // @[dpath.scala 86:21]
  assign regfile2__T_21_data = _T_147 ? alu_out : _T_151;
  assign regfile2__T_21_addr = io_instReadIO_data[11:7];
  assign regfile2__T_21_mask = 1'h1;
  assign regfile2__T_21_en = io_ctl_rf_wen & _T_19;
  assign io_dat_inst = io_instReadIO_data; // @[dpath.scala 198:17]
  assign io_dat_br_eq = rs1_data == rs2_data; // @[dpath.scala 199:17]
  assign io_dat_br_lt = $signed(_T_154) < $signed(_T_155); // @[dpath.scala 200:17]
  assign io_dat_br_ltu = rs1_data < rs2_data; // @[dpath.scala 201:17]
  assign io_instReadIO_addr = pc_reg; // @[dpath.scala 67:22]
  assign io_dataReadIO_addr = _T_102 ? _T_104 : _T_139; // @[dpath.scala 192:21]
  assign io_dataWriteIO_addr = _T_102 ? _T_104 : _T_139; // @[dpath.scala 210:23]
  assign io_dataWriteIO_data = _T_57 ? regfile2__T_58_data : 64'h0; // @[dpath.scala 211:23]
  assign _T_54_0_0 = _T_54_0;
  assign _T_54_0_1 = _T_54_1;
  assign _T_54_0_2 = _T_54_2;
  assign _T_54_0_3 = _T_54_3;
  assign _T_54_0_4 = _T_54_4;
  assign _T_54_0_5 = _T_54_5;
  assign _T_54_0_6 = _T_54_6;
  assign _T_54_0_7 = _T_54_7;
  assign _T_54_0_8 = _T_54_8;
  assign _T_54_0_9 = _T_54_9;
  assign _T_54_0_10 = _T_54_10;
  assign _T_54_0_11 = _T_54_11;
  assign _T_54_0_12 = _T_54_12;
  assign _T_54_0_13 = _T_54_13;
  assign _T_54_0_14 = _T_54_14;
  assign _T_54_0_15 = _T_54_15;
  assign _T_54_0_16 = _T_54_16;
  assign _T_54_0_17 = _T_54_17;
  assign _T_54_0_18 = _T_54_18;
  assign _T_54_0_19 = _T_54_19;
  assign _T_54_0_20 = _T_54_20;
  assign _T_54_0_21 = _T_54_21;
  assign _T_54_0_22 = _T_54_22;
  assign _T_54_0_23 = _T_54_23;
  assign _T_54_0_24 = _T_54_24;
  assign _T_54_0_25 = _T_54_25;
  assign _T_54_0_26 = _T_54_26;
  assign _T_54_0_27 = _T_54_27;
  assign _T_54_0_28 = _T_54_28;
  assign _T_54_0_29 = _T_54_29;
  assign _T_54_0_30 = _T_54_30;
  assign _T_54_0_31 = _T_54_31;
  assign pc_reg_0 = pc_reg;
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
    if(regfile2__T_21_en & regfile2__T_21_mask) begin
      regfile2[regfile2__T_21_addr] <= regfile2__T_21_data; // @[dpath.scala 86:21]
    end
    if (reset) begin
      pc_reg <= 64'h80000000;
    end else if (_T) begin
      pc_reg <= pc_plus4;
    end else if (_T_1) begin
      pc_reg <= br_target;
    end else if (_T_2) begin
      pc_reg <= jmp_target;
    end else if (_T_3) begin
      pc_reg <= jump_reg_target;
    end else begin
      pc_reg <= pc_plus4;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_12) begin
          $fwrite(32'h80000002,"inst = %d \n",io_instReadIO_data); // @[dpath.scala 72:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_12) begin
          $fwrite(32'h80000002,"inst addr = %d \n",pc_reg); // @[dpath.scala 73:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_12) begin
          $fwrite(32'h80000002,"inst addr = 0x%x \n",pc_reg); // @[dpath.scala 74:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_12) begin
          $fwrite(32'h80000002,"inst2 = 0x%x \n",io_instReadIO_data); // @[dpath.scala 75:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_12) begin
          $fwrite(32'h80000002,"pc=[%x] W[r%d=%x][%d] Op1=[r%d][%x] Op2=[r%d][%x] inst=[%x]\n",pc_reg,wb_addr,wb_data,io_ctl_rf_wen,rs1_addr,alu_op1,rs2_addr,alu_op2,io_instReadIO_data); // @[dpath.scala 218:9]
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
  output [63:0] io_dataReadIO_addr,
  input  [63:0] io_dataReadIO_data,
  output [63:0] io_dataWriteIO_addr,
  output [63:0] io_dataWriteIO_data,
  output [63:0] _T_54_0,
  output [63:0] _T_54_1,
  output [63:0] _T_54_2,
  output [63:0] _T_54_3,
  output [63:0] _T_54_4,
  output [63:0] _T_54_5,
  output [63:0] _T_54_6,
  output [63:0] _T_54_7,
  output [63:0] _T_54_8,
  output [63:0] _T_54_9,
  output [63:0] _T_54_10,
  output [63:0] _T_54_11,
  output [63:0] _T_54_12,
  output [63:0] _T_54_13,
  output [63:0] _T_54_14,
  output [63:0] _T_54_15,
  output [63:0] _T_54_16,
  output [63:0] _T_54_17,
  output [63:0] _T_54_18,
  output [63:0] _T_54_19,
  output [63:0] _T_54_20,
  output [63:0] _T_54_21,
  output [63:0] _T_54_22,
  output [63:0] _T_54_23,
  output [63:0] _T_54_24,
  output [63:0] _T_54_25,
  output [63:0] _T_54_26,
  output [63:0] _T_54_27,
  output [63:0] _T_54_28,
  output [63:0] _T_54_29,
  output [63:0] _T_54_30,
  output [63:0] _T_54_31,
  output [63:0] pc_reg
);
  wire [63:0] cpath_io_dat_inst; // @[top.scala 15:21]
  wire  cpath_io_dat_br_eq; // @[top.scala 15:21]
  wire  cpath_io_dat_br_lt; // @[top.scala 15:21]
  wire  cpath_io_dat_br_ltu; // @[top.scala 15:21]
  wire [2:0] cpath_io_ctl_pc_sel; // @[top.scala 15:21]
  wire [1:0] cpath_io_ctl_op1_sel; // @[top.scala 15:21]
  wire [1:0] cpath_io_ctl_op2_sel; // @[top.scala 15:21]
  wire [3:0] cpath_io_ctl_alu_fun; // @[top.scala 15:21]
  wire [1:0] cpath_io_ctl_wb_sel; // @[top.scala 15:21]
  wire  cpath_io_ctl_rf_wen; // @[top.scala 15:21]
  wire  dpath_clock; // @[top.scala 16:21]
  wire  dpath_reset; // @[top.scala 16:21]
  wire [2:0] dpath_io_ctl_pc_sel; // @[top.scala 16:21]
  wire [1:0] dpath_io_ctl_op1_sel; // @[top.scala 16:21]
  wire [1:0] dpath_io_ctl_op2_sel; // @[top.scala 16:21]
  wire [3:0] dpath_io_ctl_alu_fun; // @[top.scala 16:21]
  wire [1:0] dpath_io_ctl_wb_sel; // @[top.scala 16:21]
  wire  dpath_io_ctl_rf_wen; // @[top.scala 16:21]
  wire [63:0] dpath_io_dat_inst; // @[top.scala 16:21]
  wire  dpath_io_dat_br_eq; // @[top.scala 16:21]
  wire  dpath_io_dat_br_lt; // @[top.scala 16:21]
  wire  dpath_io_dat_br_ltu; // @[top.scala 16:21]
  wire [63:0] dpath_io_instReadIO_addr; // @[top.scala 16:21]
  wire [63:0] dpath_io_instReadIO_data; // @[top.scala 16:21]
  wire [63:0] dpath_io_dataReadIO_addr; // @[top.scala 16:21]
  wire [63:0] dpath_io_dataReadIO_data; // @[top.scala 16:21]
  wire [63:0] dpath_io_dataWriteIO_addr; // @[top.scala 16:21]
  wire [63:0] dpath_io_dataWriteIO_data; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_0; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_1; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_2; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_3; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_4; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_5; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_6; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_7; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_8; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_9; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_10; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_11; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_12; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_13; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_14; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_15; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_16; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_17; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_18; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_19; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_20; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_21; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_22; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_23; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_24; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_25; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_26; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_27; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_28; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_29; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_30; // @[top.scala 16:21]
  wire [63:0] dpath__T_54_0_31; // @[top.scala 16:21]
  wire [63:0] dpath_pc_reg_0; // @[top.scala 16:21]
  cpath cpath ( // @[top.scala 15:21]
    .io_dat_inst(cpath_io_dat_inst),
    .io_dat_br_eq(cpath_io_dat_br_eq),
    .io_dat_br_lt(cpath_io_dat_br_lt),
    .io_dat_br_ltu(cpath_io_dat_br_ltu),
    .io_ctl_pc_sel(cpath_io_ctl_pc_sel),
    .io_ctl_op1_sel(cpath_io_ctl_op1_sel),
    .io_ctl_op2_sel(cpath_io_ctl_op2_sel),
    .io_ctl_alu_fun(cpath_io_ctl_alu_fun),
    .io_ctl_wb_sel(cpath_io_ctl_wb_sel),
    .io_ctl_rf_wen(cpath_io_ctl_rf_wen)
  );
  dpath dpath ( // @[top.scala 16:21]
    .clock(dpath_clock),
    .reset(dpath_reset),
    .io_ctl_pc_sel(dpath_io_ctl_pc_sel),
    .io_ctl_op1_sel(dpath_io_ctl_op1_sel),
    .io_ctl_op2_sel(dpath_io_ctl_op2_sel),
    .io_ctl_alu_fun(dpath_io_ctl_alu_fun),
    .io_ctl_wb_sel(dpath_io_ctl_wb_sel),
    .io_ctl_rf_wen(dpath_io_ctl_rf_wen),
    .io_dat_inst(dpath_io_dat_inst),
    .io_dat_br_eq(dpath_io_dat_br_eq),
    .io_dat_br_lt(dpath_io_dat_br_lt),
    .io_dat_br_ltu(dpath_io_dat_br_ltu),
    .io_instReadIO_addr(dpath_io_instReadIO_addr),
    .io_instReadIO_data(dpath_io_instReadIO_data),
    .io_dataReadIO_addr(dpath_io_dataReadIO_addr),
    .io_dataReadIO_data(dpath_io_dataReadIO_data),
    .io_dataWriteIO_addr(dpath_io_dataWriteIO_addr),
    .io_dataWriteIO_data(dpath_io_dataWriteIO_data),
    ._T_54_0_0(dpath__T_54_0_0),
    ._T_54_0_1(dpath__T_54_0_1),
    ._T_54_0_2(dpath__T_54_0_2),
    ._T_54_0_3(dpath__T_54_0_3),
    ._T_54_0_4(dpath__T_54_0_4),
    ._T_54_0_5(dpath__T_54_0_5),
    ._T_54_0_6(dpath__T_54_0_6),
    ._T_54_0_7(dpath__T_54_0_7),
    ._T_54_0_8(dpath__T_54_0_8),
    ._T_54_0_9(dpath__T_54_0_9),
    ._T_54_0_10(dpath__T_54_0_10),
    ._T_54_0_11(dpath__T_54_0_11),
    ._T_54_0_12(dpath__T_54_0_12),
    ._T_54_0_13(dpath__T_54_0_13),
    ._T_54_0_14(dpath__T_54_0_14),
    ._T_54_0_15(dpath__T_54_0_15),
    ._T_54_0_16(dpath__T_54_0_16),
    ._T_54_0_17(dpath__T_54_0_17),
    ._T_54_0_18(dpath__T_54_0_18),
    ._T_54_0_19(dpath__T_54_0_19),
    ._T_54_0_20(dpath__T_54_0_20),
    ._T_54_0_21(dpath__T_54_0_21),
    ._T_54_0_22(dpath__T_54_0_22),
    ._T_54_0_23(dpath__T_54_0_23),
    ._T_54_0_24(dpath__T_54_0_24),
    ._T_54_0_25(dpath__T_54_0_25),
    ._T_54_0_26(dpath__T_54_0_26),
    ._T_54_0_27(dpath__T_54_0_27),
    ._T_54_0_28(dpath__T_54_0_28),
    ._T_54_0_29(dpath__T_54_0_29),
    ._T_54_0_30(dpath__T_54_0_30),
    ._T_54_0_31(dpath__T_54_0_31),
    .pc_reg_0(dpath_pc_reg_0)
  );
  assign io_instReadIO_addr = dpath_io_instReadIO_addr; // @[top.scala 19:17]
  assign io_dataReadIO_addr = dpath_io_dataReadIO_addr; // @[top.scala 20:17]
  assign io_dataWriteIO_addr = dpath_io_dataWriteIO_addr; // @[top.scala 21:18]
  assign io_dataWriteIO_data = dpath_io_dataWriteIO_data; // @[top.scala 21:18]
  assign _T_54_0 = dpath__T_54_0_0;
  assign _T_54_1 = dpath__T_54_0_1;
  assign _T_54_2 = dpath__T_54_0_2;
  assign _T_54_3 = dpath__T_54_0_3;
  assign _T_54_4 = dpath__T_54_0_4;
  assign _T_54_5 = dpath__T_54_0_5;
  assign _T_54_6 = dpath__T_54_0_6;
  assign _T_54_7 = dpath__T_54_0_7;
  assign _T_54_8 = dpath__T_54_0_8;
  assign _T_54_9 = dpath__T_54_0_9;
  assign _T_54_10 = dpath__T_54_0_10;
  assign _T_54_11 = dpath__T_54_0_11;
  assign _T_54_12 = dpath__T_54_0_12;
  assign _T_54_13 = dpath__T_54_0_13;
  assign _T_54_14 = dpath__T_54_0_14;
  assign _T_54_15 = dpath__T_54_0_15;
  assign _T_54_16 = dpath__T_54_0_16;
  assign _T_54_17 = dpath__T_54_0_17;
  assign _T_54_18 = dpath__T_54_0_18;
  assign _T_54_19 = dpath__T_54_0_19;
  assign _T_54_20 = dpath__T_54_0_20;
  assign _T_54_21 = dpath__T_54_0_21;
  assign _T_54_22 = dpath__T_54_0_22;
  assign _T_54_23 = dpath__T_54_0_23;
  assign _T_54_24 = dpath__T_54_0_24;
  assign _T_54_25 = dpath__T_54_0_25;
  assign _T_54_26 = dpath__T_54_0_26;
  assign _T_54_27 = dpath__T_54_0_27;
  assign _T_54_28 = dpath__T_54_0_28;
  assign _T_54_29 = dpath__T_54_0_29;
  assign _T_54_30 = dpath__T_54_0_30;
  assign _T_54_31 = dpath__T_54_0_31;
  assign pc_reg = dpath_pc_reg_0;
  assign cpath_io_dat_inst = dpath_io_dat_inst; // @[top.scala 25:16]
  assign cpath_io_dat_br_eq = dpath_io_dat_br_eq; // @[top.scala 25:16]
  assign cpath_io_dat_br_lt = dpath_io_dat_br_lt; // @[top.scala 25:16]
  assign cpath_io_dat_br_ltu = dpath_io_dat_br_ltu; // @[top.scala 25:16]
  assign dpath_clock = clock;
  assign dpath_reset = reset;
  assign dpath_io_ctl_pc_sel = cpath_io_ctl_pc_sel; // @[top.scala 24:16]
  assign dpath_io_ctl_op1_sel = cpath_io_ctl_op1_sel; // @[top.scala 24:16]
  assign dpath_io_ctl_op2_sel = cpath_io_ctl_op2_sel; // @[top.scala 24:16]
  assign dpath_io_ctl_alu_fun = cpath_io_ctl_alu_fun; // @[top.scala 24:16]
  assign dpath_io_ctl_wb_sel = cpath_io_ctl_wb_sel; // @[top.scala 24:16]
  assign dpath_io_ctl_rf_wen = cpath_io_ctl_rf_wen; // @[top.scala 24:16]
  assign dpath_io_instReadIO_data = io_instReadIO_data; // @[top.scala 19:17]
  assign dpath_io_dataReadIO_data = io_dataReadIO_data; // @[top.scala 20:17]
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
  wire [63:0] mycoretop_io_dataReadIO_addr; // @[simTop.scala 15:25]
  wire [63:0] mycoretop_io_dataReadIO_data; // @[simTop.scala 15:25]
  wire [63:0] mycoretop_io_dataWriteIO_addr; // @[simTop.scala 15:25]
  wire [63:0] mycoretop_io_dataWriteIO_data; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_0; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_1; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_2; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_3; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_4; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_5; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_6; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_7; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_8; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_9; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_10; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_11; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_12; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_13; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_14; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_15; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_16; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_17; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_18; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_19; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_20; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_21; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_22; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_23; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_24; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_25; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_26; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_27; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_28; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_29; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_30; // @[simTop.scala 15:25]
  wire [63:0] mycoretop__T_54_31; // @[simTop.scala 15:25]
  wire [63:0] mycoretop_pc_reg; // @[simTop.scala 15:25]
  top mycoretop ( // @[simTop.scala 15:25]
    .clock(mycoretop_clock),
    .reset(mycoretop_reset),
    .io_instReadIO_addr(mycoretop_io_instReadIO_addr),
    .io_instReadIO_data(mycoretop_io_instReadIO_data),
    .io_dataReadIO_addr(mycoretop_io_dataReadIO_addr),
    .io_dataReadIO_data(mycoretop_io_dataReadIO_data),
    .io_dataWriteIO_addr(mycoretop_io_dataWriteIO_addr),
    .io_dataWriteIO_data(mycoretop_io_dataWriteIO_data),
    ._T_54_0(mycoretop__T_54_0),
    ._T_54_1(mycoretop__T_54_1),
    ._T_54_2(mycoretop__T_54_2),
    ._T_54_3(mycoretop__T_54_3),
    ._T_54_4(mycoretop__T_54_4),
    ._T_54_5(mycoretop__T_54_5),
    ._T_54_6(mycoretop__T_54_6),
    ._T_54_7(mycoretop__T_54_7),
    ._T_54_8(mycoretop__T_54_8),
    ._T_54_9(mycoretop__T_54_9),
    ._T_54_10(mycoretop__T_54_10),
    ._T_54_11(mycoretop__T_54_11),
    ._T_54_12(mycoretop__T_54_12),
    ._T_54_13(mycoretop__T_54_13),
    ._T_54_14(mycoretop__T_54_14),
    ._T_54_15(mycoretop__T_54_15),
    ._T_54_16(mycoretop__T_54_16),
    ._T_54_17(mycoretop__T_54_17),
    ._T_54_18(mycoretop__T_54_18),
    ._T_54_19(mycoretop__T_54_19),
    ._T_54_20(mycoretop__T_54_20),
    ._T_54_21(mycoretop__T_54_21),
    ._T_54_22(mycoretop__T_54_22),
    ._T_54_23(mycoretop__T_54_23),
    ._T_54_24(mycoretop__T_54_24),
    ._T_54_25(mycoretop__T_54_25),
    ._T_54_26(mycoretop__T_54_26),
    ._T_54_27(mycoretop__T_54_27),
    ._T_54_28(mycoretop__T_54_28),
    ._T_54_29(mycoretop__T_54_29),
    ._T_54_30(mycoretop__T_54_30),
    ._T_54_31(mycoretop__T_54_31),
    .pc_reg(mycoretop_pc_reg)
  );
  assign io_diffTestIO_regfile_0 = mycoretop__T_54_0;
  assign io_diffTestIO_regfile_1 = mycoretop__T_54_1;
  assign io_diffTestIO_regfile_2 = mycoretop__T_54_2;
  assign io_diffTestIO_regfile_3 = mycoretop__T_54_3;
  assign io_diffTestIO_regfile_4 = mycoretop__T_54_4;
  assign io_diffTestIO_regfile_5 = mycoretop__T_54_5;
  assign io_diffTestIO_regfile_6 = mycoretop__T_54_6;
  assign io_diffTestIO_regfile_7 = mycoretop__T_54_7;
  assign io_diffTestIO_regfile_8 = mycoretop__T_54_8;
  assign io_diffTestIO_regfile_9 = mycoretop__T_54_9;
  assign io_diffTestIO_regfile_10 = mycoretop__T_54_10;
  assign io_diffTestIO_regfile_11 = mycoretop__T_54_11;
  assign io_diffTestIO_regfile_12 = mycoretop__T_54_12;
  assign io_diffTestIO_regfile_13 = mycoretop__T_54_13;
  assign io_diffTestIO_regfile_14 = mycoretop__T_54_14;
  assign io_diffTestIO_regfile_15 = mycoretop__T_54_15;
  assign io_diffTestIO_regfile_16 = mycoretop__T_54_16;
  assign io_diffTestIO_regfile_17 = mycoretop__T_54_17;
  assign io_diffTestIO_regfile_18 = mycoretop__T_54_18;
  assign io_diffTestIO_regfile_19 = mycoretop__T_54_19;
  assign io_diffTestIO_regfile_20 = mycoretop__T_54_20;
  assign io_diffTestIO_regfile_21 = mycoretop__T_54_21;
  assign io_diffTestIO_regfile_22 = mycoretop__T_54_22;
  assign io_diffTestIO_regfile_23 = mycoretop__T_54_23;
  assign io_diffTestIO_regfile_24 = mycoretop__T_54_24;
  assign io_diffTestIO_regfile_25 = mycoretop__T_54_25;
  assign io_diffTestIO_regfile_26 = mycoretop__T_54_26;
  assign io_diffTestIO_regfile_27 = mycoretop__T_54_27;
  assign io_diffTestIO_regfile_28 = mycoretop__T_54_28;
  assign io_diffTestIO_regfile_29 = mycoretop__T_54_29;
  assign io_diffTestIO_regfile_30 = mycoretop__T_54_30;
  assign io_diffTestIO_regfile_31 = mycoretop__T_54_31;
  assign io_diffTestIO_PC = mycoretop_pc_reg;
  assign io_topIO_instReadIO_addr = mycoretop_io_instReadIO_addr; // @[simTop.scala 20:12]
  assign io_topIO_instReadIO_en = 1'h1; // @[simTop.scala 20:12]
  assign io_topIO_dataReadIO_addr = mycoretop_io_dataReadIO_addr; // @[simTop.scala 20:12]
  assign io_topIO_dataReadIO_en = 1'h1; // @[simTop.scala 20:12]
  assign io_topIO_dataWriteIO_addr = mycoretop_io_dataWriteIO_addr; // @[simTop.scala 20:12]
  assign io_topIO_dataWriteIO_data = mycoretop_io_dataWriteIO_data; // @[simTop.scala 20:12]
  assign io_topIO_dataWriteIO_en = 1'h1; // @[simTop.scala 20:12]
  assign mycoretop_clock = clock;
  assign mycoretop_reset = reset;
  assign mycoretop_io_instReadIO_data = io_topIO_instReadIO_data; // @[simTop.scala 20:12]
  assign mycoretop_io_dataReadIO_data = io_topIO_dataReadIO_data; // @[simTop.scala 20:12]
endmodule
