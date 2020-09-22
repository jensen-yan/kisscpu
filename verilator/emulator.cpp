#include "emulator.h"
#include "VsimTop.h"
#include "verilated_vcd_c.h"
#include <iostream>
using namespace std;
#include "difftestIO.h"

CEmulator::CEmulator(CRam* input_ram)
{
    m_ram = input_ram;
    // Verilated::commandArgs(argc, argv);
    m_simtop = new VsimTop("m_simtop");

    // 波形
    Verilated::traceEverOn(true);
    m_tfp = new VerilatedVcdC;
    m_simtop->trace(m_tfp, 99);  // Trace 99 levels of hierarchy
    m_tfp->open("/home/yanyue/nutshell_v2/kisscpu/trace/simx.vcd");

    reset_ncycles(10);
}

CEmulator::~CEmulator()
{
    m_simtop->final();
    delete m_simtop;
    delete m_tfp;
}

void CEmulator::step(int i)
{
    for(; i > 0; i--){
        cout << "clock = " << m_cycles << endl;
        m_simtop->clock = m_simtop->clock ? 0: 1;
        m_simtop->eval();
        m_simtop->clock = m_simtop->clock ? 0: 1;
        m_simtop->eval();
        m_cycles++;

        assert(m_tfp);
        m_tfp->dump(m_cycles);

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

        cout << endl;
    }
}

void CEmulator::reset_ncycles(int m_cycles)
{
    for (int i = 0; i < m_cycles; i++)
    {
        m_simtop->reset = 1;
        m_simtop->clock = 0;
        m_simtop->eval();
        m_simtop->clock = 1;
        m_simtop->eval();
    }
    m_simtop->reset = 0;
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
