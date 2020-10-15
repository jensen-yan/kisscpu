set args /home/yanyue/nutshell_v2/kisscpu/nexus-am/tests/cputest/build/dummy-riscv64-nutshell.bin
b CEmulator::execute_cycles
b difftest_step(CEmulator*, int)  
r
