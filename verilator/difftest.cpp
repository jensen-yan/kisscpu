// #include "VsimTop.h"
#include <iostream>
#include "common.h"
#include <dlfcn.h>
#include <assert.h>
using namespace std;
#include "ram.h"

const char* dllPath = "./nemu_so/riscv64-nemu-interpreter-so";
// 等待获取的6个函数指针
void (*ref_difftest_memcpy_from_dut)(paddr_t dest, void *src, size_t n) = NULL;
void (*ref_difftest_getregs)(void *c) = NULL;
void (*ref_difftest_setregs)(const void *c) = NULL;
void (*ref_difftest_exec)(uint64_t n) = NULL;
void (*ref_difftest_raise_intr)(uint64_t NO) = NULL;
void (*ref_isa_reg_display)(void) = NULL;

void init_difftest(reg_t *reg, char* imgPath){
    void *handle;
    handle = dlopen(dllPath, RTLD_LAZY | RTLD_DEEPBIND);
    assert(handle);
    // 获取6个函数
    ref_difftest_memcpy_from_dut = (void (*)(paddr_t dest, void *src, size_t n))dlsym(handle, "difftest_memcpy_from_dut");
    assert(ref_difftest_memcpy_from_dut);

    ref_difftest_getregs = (void (*)(void *))dlsym(handle, "difftest_getregs");
    assert(ref_difftest_getregs);
  
    ref_difftest_setregs = (void (*)(const void *))dlsym(handle, "difftest_setregs");
    assert(ref_difftest_setregs);
  
    ref_difftest_exec = (void (*)(uint64_t))dlsym(handle, "difftest_exec");
    assert(ref_difftest_exec);
  
    ref_difftest_raise_intr = (void (*)(uint64_t))dlsym(handle, "difftest_raise_intr");
    assert(ref_difftest_raise_intr);
  
    ref_isa_reg_display = (void (*)(void))dlsym(handle, "isa_reg_display");
    assert(ref_isa_reg_display);
  
    void (*ref_difftest_init)(void) = (void (*)(void))dlsym(handle, "difftest_init");
    assert(ref_difftest_init);

    ref_difftest_init();
    ref_isa_reg_display();
    

    // 添加img
    ram_c* ram = new ram_c(imgPath);
    ref_difftest_memcpy_from_dut(ADDRSTART, ram->getImgStart(), ram->getImgSize());
    printf("img size = %d\n",ram->getImgSize());

    // test memread, write
    paddr_t inst = ram->InstRead(ADDRSTART+8, true);
    printf("inst = 0x%016lx \n", inst);
    paddr_t data = 0x000000000002a025;
    ram->DataWrite(ADDRSTART, data, true, 0);
    paddr_t data2 = ram->DataRead(ADDRSTART, true);
    printf("data = 0x%016lx \n", data2);

    // test
    /*
    reg_t ref_r[DIFFTEST_NR_REG];
    ref_difftest_getregs(&ref_r);       // test getregs
    for (size_t i = 0; i < DIFFTEST_NR_REG; i++)
    {
        printf("reg[%d] = 0x%016lx \n", i, ref_r[i]);
    }
    ref_r[4] = 0x0000000000000444;
    ref_difftest_setregs(ref_r);        // test setregs
    ref_isa_reg_display();
    ref_difftest_exec(1);               // test exec
    ref_isa_reg_display();  
    ref_difftest_exec(1);               // test exec
    ref_isa_reg_display(); 
    ref_difftest_exec(1);               // test exec
    ref_isa_reg_display(); 
    ref_difftest_exec(1);               // test exec
    ref_isa_reg_display(); */
}

int main(){
    printf("start\n");
    init_difftest(0, NULL);
    printf("end\n");
    return 0;
}