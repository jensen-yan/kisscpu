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
    // difftest_step(emulator, 20);
    // emulator->step(40);
    int success = emulator->execute_cycles(30000);
    if(success){
        printf("\033[1;32m Test Pass!!! Congratulation!!!\033[0m \n");
    }

    return 0;
}