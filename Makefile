
# src文件
scalaFile = $(shell find ./src/main/scala -name '*.scala')
VerilatorCppFile = $(shell find ./verilator -name '*.cpp')


init:
	export PATH=$HOME/.local/verilator/bin:$PATH

run:
	obj_dir/VsimTop

clean:
	rm -r obj_dir

verilog:
	sbt "runMain sim.elaborate"
# -td  输出到build/ 文件中

# 先make verilog, 再 make verilator, 再make run
# obj_dir/verilated_vcd_c.cpp

run-verilator: $(VerilatorCppFile)
	verilator simTop.v \
	$(VerilatorCppFile)  \
	--cc --exe -LDFLAGS "-ldl" \
	-CFLAGS "-g" --trace
	make -C obj_dir -f VsimTop.mk

build:
	make run-verilator

all:
	make verilog
	make clean
	make run-verilator
	make dummy

dummy:
	obj_dir/VsimTop /home/yanyue/nutshell_v2/kisscpu/nexus-am/tests/cputest/build/dummy-riscv64-nutshell.bin

# 在verilator文件夹中
# g++ -g -o difftest difftest.cpp ram.cpp -ldl