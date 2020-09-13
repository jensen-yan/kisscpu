#include "Vour.h"
#include "verilated.h"
int main(int argc, char** argv, char** env) {
	Verilated::commandArgs(argc, argv);
    Vour* top = new Vour;
    while(!Verilated::gotFinish()){
        top->eval();
    }
    delete top;
    exit(0);
}
