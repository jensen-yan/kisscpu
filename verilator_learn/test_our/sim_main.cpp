#include "Vour.h"
#include "verilated.h"
#include <iostream>
int main(int argc, char** argv, char** env) {
	Verilated::commandArgs(argc, argv);
    Vour* top = new Vour;
    while(!Verilated::gotFinish()){
        top->eval();
    }
    std::cout << "cnt is " << (int)top->cnt << std::endl;
    // 必须要进行类型转换才能正确输出top->cnt的值!
    std::cout << "type is " << typeid(top->cnt).name() << std::endl;
    // 类型是h, 奇怪
    delete top;
    exit(0);
}
