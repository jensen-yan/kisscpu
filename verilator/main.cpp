#include "VsimTop.h"
#include "ram.h"
#include "difftest.h"
#include <iostream>
using namespace std;

int main(int argc, char** argv){
    Verilated::commandArgs(argc, argv);
    VsimTop* simtop = new VsimTop("simtop");
    int step = 0;
    int i = 0;

    ram_c* ram = new ram_c(NULL);
    init_difftest(0, NULL,ram);

    // 加rst信号
    simtop->eval();
    simtop->eval();
    simtop->clock = 0;
    simtop->reset = 1;
    for (int i = 0; i < 10; i++) {
      simtop->clock = simtop->clock ? 0 : 1;
      simtop->eval();
    }
    simtop->reset = 0;


    while(!Verilated::gotFinish() && step++ <= 10){
        simtop->clock = simtop->clock ? 0: 1;
        simtop->eval();
        simtop->clock = simtop->clock ? 0: 1;
        simtop->eval();

        simtop->io_topIO_instReadIO_data = 
            ram->InstRead(simtop->io_topIO_instReadIO_addr, simtop->io_topIO_instReadIO_en);
        printf("read inst = 0x%lx \n", simtop->io_topIO_instReadIO_data);
        /*
        simtop->io_topIO_dataReadIO_data =
            ram->DataRead(simtop->io_topIO_dataReadIO_addr, simtop->io_topIO_dataReadIO_en);
        ram->DataWrite( simtop->io_topIO_dataWriteIO_addr,
                        simtop->io_topIO_dataWriteIO_data,
                        simtop->io_topIO_dataWriteIO_en);
        */


        std::cout << "pc is" << (int)simtop->io_diffTestIO_PC << std::endl;
        std::cout << "reg[4] is" << (int)simtop->io_diffTestIO_regfile_4 << std::endl;
        std::cout << "reg[5] is" << (int)simtop->io_diffTestIO_regfile_5 << std::endl;
    }
    std::cout << 5 << endl;;

    delete simtop;
    exit(0);
}