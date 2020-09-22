#include "ram.h"
#include "VsimTop.h"
#include "difftestIO.h"


class CEmulator
{
private:
    int m_cycles = 0;
    CRam *m_ram;
    VsimTop* m_simtop;
    VerilatedVcdC* m_tfp;
public:
    CEmulator(CRam* input_ram);
    ~CEmulator();
    void step(int i);
    void reset_ncycles(int cycles);
    // void getDiffTestResult(void* reg);
};


