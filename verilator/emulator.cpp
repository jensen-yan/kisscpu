#include "emulator.h"
#include "verilated_vcd_c.h"
#include <iostream>
using namespace std;
#include "difftestIO.h"

CEmulator::CEmulator(CRam* input_ram, long* input_time)
{
    m_ram = input_ram;
    m_sc_time = input_time;
    // Verilated::commandArgs(argc, argv);
    // m_simtop = new VsimTop("m_simtop");
    m_simtop = new VsimSoc("m_simsoc");

    if(vcdTrace){   // 波形
        Verilated::traceEverOn(true);	// Verilator must compute traced signals
        VL_PRINTF("Enabling waves...\n");
        m_tfp = new VerilatedVcdC;
        m_simtop->trace(m_tfp, 99);	// Trace 99 levels of hierarchy
        m_tfp->open("vlt_dump.vcd");	// Open the dump file
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

void CEmulator::execute_cycles(int n)
{
    while (n-- >0)
    {
        single_cycle();

        // difftest
        if(m_simtop->io_diffTestIO_PC_valid){
            extern int difftest_step(CEmulator* emu);
            int ret = difftest_step(this);
            assert(ret>=0);
            if(m_simtop->io_diffTestIO_nemu_halt){
                printf("Test Pased!\n");
                return;
            }
        }
    }
    
}

void CEmulator::reset_ncycles(int m_cycles)
{
    m_simtop->reset = 1;
    for (size_t i = 0; i < m_cycles; i++)
    {
        m_simtop->clock = 0;
        m_simtop->eval();
        m_simtop->clock = 1;
        m_simtop->eval();       // clock 从0 到1 , eval会打印
    }
    m_simtop->reset = 0;
}

void CEmulator::single_cycle()
{
    // if(m_cycles % 1000000 == 0)
        printf("cycle = %d \n", m_cycles);
    m_simtop->clock = 0;
    m_simtop->eval();

    // evalRam();      // 访问内存

    m_simtop->clock = 1;
    m_simtop->eval();
    if(vcdTrace) m_tfp->dump(m_cycles);
    m_cycles++;
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
/*
void CEmulator::evalRam(){
    m_simtop->io_topIO_instReadIO_data = 
            m_ram->InstRead(m_simtop->io_topIO_instReadIO_addr, m_simtop->io_topIO_instReadIO_en);
    // printf("read inst = 0x%lx \n", m_simtop->io_topIO_instReadIO_data);

    m_simtop->io_topIO_dataReadIO_data =
        m_ram->DataRead(m_simtop->io_topIO_dataReadIO_addr, m_simtop->io_topIO_dataReadIO_en);
    m_ram->DataWrite( m_simtop->io_topIO_dataWriteIO_addr,
                    m_simtop->io_topIO_dataWriteIO_data,
                    m_simtop->io_topIO_dataWriteIO_en,
                    m_simtop->io_topIO_dataWriteIO_mask);
}
*/