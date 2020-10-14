#include "emulator.h"
#include "VsimTop.h"
#include "verilated_vcd_c.h"
#include <iostream>
using namespace std;
#include "difftestIO.h"

CEmulator::CEmulator(CRam* input_ram, long* input_time)
{
    m_ram = input_ram;
    m_sc_time = input_time;
    // Verilated::commandArgs(argc, argv);
    m_simtop = new VsimTop("m_simtop");

    if(vcdTrace){   // 波形
        Verilated::traceEverOn(true);
        m_tfp = new VerilatedVcdC;
        m_simtop->trace(m_tfp, 99);  // Trace 99 levels of hierarchy
        // m_tfp->open("/home/yanyue/nutshell_v2/kisscpu/build/trace/simvcd.vcd");
        m_tfp->open("build/trace/myVCD.vcd");
    }
    
    reset_ncycles(10);
}

CEmulator::~CEmulator()
{
    m_simtop->final();
    m_tfp->close();
    delete m_simtop;
    delete m_tfp;
}

void CEmulator::step(int i)
{
    for(; i > 0; i--){
        int max_step = 10;      // 最多走10次无效指令
      while(!m_simtop->io_diffTestIO_PC_valid && max_step-- > 0){      // 在PC_valid==0情况下, 不断走直到指令有效
        cout << "clock = " << m_cycles << endl;
        m_cycles++;
        m_simtop->clock = 1;
        evalRam();      // 模拟下一拍才能拿到指令
        m_simtop->eval();
        (*m_sc_time)++;
        if(vcdTrace) {m_tfp->dump((double)*m_sc_time);}

        m_simtop->clock = 0;
        m_simtop->eval();
        (*m_sc_time)++;
        if(vcdTrace) {m_tfp->dump((double)*m_sc_time);}
        
        cout << endl;
      }
        // 真正走一步
        cout << "clock = " << m_cycles << endl;
        m_cycles++;
        m_simtop->clock = 1;
        evalRam();      // 模拟下一拍才能拿到指令
        m_simtop->eval();
        (*m_sc_time)++;
        if(vcdTrace) {m_tfp->dump((double)*m_sc_time);}

        m_simtop->clock = 0;
        m_simtop->eval();
        (*m_sc_time)++;
        if(vcdTrace) {m_tfp->dump((double)*m_sc_time);}

        cout << endl;
    }
}

void CEmulator::reset_ncycles(int m_cycles)
{
    m_simtop->clock = 0;
    m_simtop->reset = 1;
    m_simtop->eval();
    for (int i = 0; i < m_cycles; i++)
    {
        m_simtop->clock = m_simtop->clock ? 0 : 1;
        m_simtop->eval();
        (*m_sc_time)++;
        if(vcdTrace) {m_tfp->dump((double)*m_sc_time);}
    }
    m_simtop->reset = 0;
    m_simtop->clock = 0;
    m_simtop->eval();
}


void CEmulator::read_emu_regs(reg_t* r)
{
#define macro(x) r[x] = m_simtop->io_diffTestIO_regfile_##x
    macro(0); macro(1); macro(2); macro(3); macro(4); macro(5); macro(6); macro(7);
    macro(8); macro(9); macro(10); macro(11); macro(12); macro(13); macro(14); macro(15);
    macro(16); macro(17); macro(18); macro(19); macro(20); macro(21); macro(22); macro(23);
    macro(24); macro(25); macro(26); macro(27); macro(28); macro(29); macro(30); macro(31);
    r[DIFFTEST_THIS_PC] = m_simtop->io_diffTestIO_PC;

}

double CEmulator::sc_time_stamp () {       // Called by $time in Verilog
    return m_cycles;           // converts to double, to match
    // what SystemC does
}

void CEmulator::evalRam(){
    m_simtop->io_topIO_instReadIO_data = 
            m_ram->InstRead(m_simtop->io_topIO_instReadIO_addr, m_simtop->io_topIO_instReadIO_en);
    // printf("read inst = 0x%lx \n", m_simtop->io_topIO_instReadIO_data);
    /*
    m_simtop->io_topIO_dataReadIO_data =
        m_ram->DataRead(m_simtop->io_topIO_dataReadIO_addr, m_simtop->io_topIO_dataReadIO_en);
    m_ram->DataWrite( m_simtop->io_topIO_dataWriteIO_addr,
                    m_simtop->io_topIO_dataWriteIO_data,
                    m_simtop->io_topIO_dataWriteIO_en);
    */
}