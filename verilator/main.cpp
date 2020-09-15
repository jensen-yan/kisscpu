#include "VsimTop.h"
#include <iostream>
using namespace std;

int main(int argc, char** argv){
    Verilated::commandArgs(argc, argv);
    VsimTop* top;
    top = new VsimTop("simtop");
    int step = 0;
    int i = 0;
    while(!Verilated::gotFinish() && step++ <= 10){
        top->clock = top->clock ? 0: 1;
        top->eval();
        std::cout << "reg cnt is" << (int)top->io_diffTestIO_regfile_0 << std::endl;
    }
    std::cout << 5 << endl;;

    delete top;
    exit(0);
}