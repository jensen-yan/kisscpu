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

/*
void CEmulator::getDiffTestResult(void* reg)
{
  reg[ 0] = m_simtop->io_diffTestIO_regfile_0;
  reg[ 1] = m_simtop->io_diffTestIO_regfile_1;
  reg[ 2] = m_simtop->io_diffTestIO_regfile_2;
  reg[ 3] = m_simtop->io_diffTestIO_regfile_3;
  reg[ 4] = m_simtop->io_diffTestIO_regfile_4;
  reg[ 5] = m_simtop->io_diffTestIO_regfile_5;
  reg[ 6] = m_simtop->io_diffTestIO_regfile_6;
  reg[ 7] = m_simtop->io_diffTestIO_regfile_7;
  reg[ 8] = m_simtop->io_diffTestIO_regfile_8;
  reg[ 9] = m_simtop->io_diffTestIO_regfile_9;
  reg[10] = m_simtop->io_diffTestIO_regfile_10;
  reg[11] = m_simtop->io_diffTestIO_regfile_11;
  reg[12] = m_simtop->io_diffTestIO_regfile_12;
  reg[13] = m_simtop->io_diffTestIO_regfile_13;
  reg[14] = m_simtop->io_diffTestIO_regfile_14;
  reg[15] = m_simtop->io_diffTestIO_regfile_15;
  reg[16] = m_simtop->io_diffTestIO_regfile_16;
  reg[17] = m_simtop->io_diffTestIO_regfile_17;
  reg[18] = m_simtop->io_diffTestIO_regfile_18;
  reg[19] = m_simtop->io_diffTestIO_regfile_19;
  reg[20] = m_simtop->io_diffTestIO_regfile_20;
  reg[21] = m_simtop->io_diffTestIO_regfile_21;
  reg[22] = m_simtop->io_diffTestIO_regfile_22;
  reg[23] = m_simtop->io_diffTestIO_regfile_23;
  reg[24] = m_simtop->io_diffTestIO_regfile_24;
  reg[25] = m_simtop->io_diffTestIO_regfile_25;
  reg[26] = m_simtop->io_diffTestIO_regfile_26;
  reg[27] = m_simtop->io_diffTestIO_regfile_27;
  reg[28] = m_simtop->io_diffTestIO_regfile_28;
  reg[29] = m_simtop->io_diffTestIO_regfile_29;
  reg[30] = m_simtop->io_diffTestIO_regfile_30;
  reg[31] = m_simtop->io_diffTestIO_regfile_31;
  reg[38] = m_simtop->io_diffTestIO_PC;
}
*/