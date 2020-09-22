#include "ram.h"
#include "difftest.h"
#include "difftestIO.h"
#include <iostream>
using namespace std;
#include "emulator.h"
#include "stdio.h"

int main(int argc, char** argv){
    CRam* ram = new CRam(NULL);
    init_difftest(0, NULL,ram);
    CEmulator* emulator = new CEmulator(ram);
    // emulator->getDiffTestResult(&emu_reg);
    emulator->step(5);


    return 0;
}