#include "../local-include/intr.h"

static inline make_EHelper(lr) {
  rtl_lm(s, s0, dsrc1, 0, s->width);
  return_on_mem_ex();
  cpu.lr_addr = *dsrc1;
  rtl_sext(s, ddest, s0, s->width);

  print_asm_template3(lr);
}

static inline make_EHelper(sc) {
  // should check overlapping instead of equality
  if (cpu.lr_addr == *dsrc1) {
    rtl_sm(s, dsrc1, 0, dsrc2, s->width);
    return_on_mem_ex();
    rtl_li(s, s0, 0);
  } else {
    rtl_li(s, s0, 1);
  }
  rtl_sr(s, id_dest->reg, s0, 0);

  print_asm_template3(sc);
}

static void inline amo_load(DecodeExecState *s) {
  rtl_lm(s, s0, dsrc1, 0, s->width);
  rtl_sext(s, s0, s0, s->width);
}

static void inline amo_update(DecodeExecState *s) {
  rtl_sm(s, dsrc1, 0, s1, s->width);
  return_on_mem_ex();
  rtl_sr(s, id_dest->reg, s0, 0);
}

static inline make_EHelper(amoswap) {
  amo_load(s);
  return_on_mem_ex();
  rtl_mv(s, s1, dsrc2); // swap
  amo_update(s);
  return_on_mem_ex();
  print_asm_template3(amoswap);
}

static inline make_EHelper(amoadd) {
  amo_load(s);
  return_on_mem_ex();
  rtl_add(s, s1, s0, dsrc2);
  amo_update(s);
  return_on_mem_ex();
  print_asm_template3(amoor);
}

static inline make_EHelper(amoor) {
  amo_load(s);
  return_on_mem_ex();
  rtl_or(s, s1, s0, dsrc2);
  amo_update(s);
  return_on_mem_ex();
  print_asm_template3(amoor);
}

static inline make_EHelper(amoand) {
  amo_load(s);
  return_on_mem_ex();
  rtl_and(s, s1, s0, dsrc2);
  amo_update(s);
  return_on_mem_ex();
  print_asm_template3(amoand);
}

static inline make_EHelper(amomaxu) {
  amo_load(s);
  return_on_mem_ex();
  *s1 = (*s0 > *dsrc2 ? *s0 : *dsrc2);
  amo_update(s);
  return_on_mem_ex();
  print_asm_template3(amomaxu);
}

static inline make_EHelper(amoxor) {
  amo_load(s);
  return_on_mem_ex();
  rtl_xor(s, s1, s0, dsrc2);
  amo_update(s);
  return_on_mem_ex();
  print_asm_template3(amoxor);
}
