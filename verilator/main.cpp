#include "ram.h"
#include "difftest.h"
#include "difftestIO.h"
#include <iostream>
using namespace std;
#include "emulator.h"
#include "stdio.h"

long sc_time = 0;
double sc_time_stamp(){
    return sc_time;
}

int main(int argc, char** argv){
    CRam* ram = new CRam(argv[1]);
    init_difftest(0, NULL,ram);
    CEmulator* emulator = new CEmulator(ram, &sc_time);
    // difftest_step(emulator);

    // difftest_step(emulator);
    // difftest_step(emulator);
    // reg_t reg[DIFFTEST_NR_REG];
    // emulator->read_emu_regs(reg);
    // emulator->step(20);


    return 0;
}