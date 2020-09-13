#include "Vour.h"
#include <iostream>
using namespace std;

int main(int argc, char** argv){
    Verilated::commandArgs(argc, argv);
    Vour* top;
    top = new Vour("top");
    int step = 0;
    top->rst = 1;
    int i = 0;
    while(!Verilated::gotFinish() && step++ <= 10){
        top->clk = top->clk ? 0: 1;
        top->rst = 0;
        top->eval();
        std::cout << "reg cnt is" << (int)top->cnt << std::endl;
    }
    std::cout << "cnt2 is" << (int)top->cnt2 << std::endl;
    std::cout << "reg cnt is" << (int)top->cnt << std::endl;
    std::cout << 5 << endl;;
    delete top;
    exit(0);
}