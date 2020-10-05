#include <isa.h>
#include <memory/paddr.h>
#include <memory/vaddr.h>

static word_t vaddr_read_cross_page(vaddr_t addr, int type, int len) {
  return 0;
}

static void vaddr_write_cross_page(vaddr_t addr, word_t data, int len) {
}

word_t vaddr_mmu_read(vaddr_t addr, int len, int type) {
  paddr_t pg_base = isa_mmu_translate(addr, type, len);
  int ret = pg_base & PAGE_MASK;
  if (ret == MEM_RET_OK) {
    addr = pg_base | (addr & PAGE_MASK);
    return paddr_read(addr, len);
  } else if (len != 1 && ret == MEM_RET_CROSS_PAGE) {
    return vaddr_read_cross_page(addr, type, len);
  }
  return 0;
}

void vaddr_mmu_write(vaddr_t addr, word_t data, int len) {
  paddr_t pg_base = isa_mmu_translate(addr, MEM_TYPE_WRITE, len);
  int ret = pg_base & PAGE_MASK;
  if (ret == MEM_RET_OK) {
    addr = pg_base | (addr & PAGE_MASK);
    paddr_write(addr, data, len);
  } else if (len != 1 && ret == MEM_RET_CROSS_PAGE) {
    vaddr_write_cross_page(addr, data, len);
  }
}
