#include "Vour.h"
#include "verilated.h"
#include <iostream>
int main(int argc, char** argv, char** env) {
	Verilated::commandArgs(argc, argv);
    Vour* top = new Vour;       // 之所以是Vour, 是our.v的顶层!
    while(!Verilated::gotFinish()){
        top->eval();
    }
    std::cout << "cnt is " << (int)top->io_diffTestIO_regfile_0 << std::endl;
    // 必须要进行类型转换才能正确输出top->cnt的值!
    delete top;
    exit(0);
}
