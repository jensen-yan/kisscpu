PWD := $(shell pwd)

# src文件
scalaFile = $(shell find $(PWD)/src/main/scala -name '*.scala')
VerilatorCppFile = $(shell find $(PWD)/verilator -name '*.cpp')
verilatorDir = $(PWD)/build/generated-cpp

# 可执行文件
exe = $(PWD)/obj_dir/VsimTop

# 测试文件
testDir = $(PWD)/nexus-am//tests/cputest/build
test_dummy = $(testDir)/dummy-riscv64-nutshell.bin

init:
	export PATH=$HOME/.local/verilator/bin:$PATH

run:
	obj_dir/VsimTop

clean:
	rm -r obj_dir

verilog:
	sbt "runMain sim.elaborate"
# -td  输出到build/ 文件中


run-verilator: $(VerilatorCppFile) 
	verilator simTop.v \
	--trace \
	$(VerilatorCppFile) \
	--cc --exe -LDFLAGS "-ldl" \
	-CFLAGS "-g"
	make -C obj_dir -f VsimTop.mk

build:
	make run-verilator

all:
	make verilog
	make clean
	make run-verilator
	make dummy

dummy:
	$(exe) $(test_dummy)
	# obj_dir/VsimTop /home/yanyue/nutshell_v2/kisscpu/nexus-am/tests/cputest/build/dummy-riscv64-nutshell.bin

# 在verilator文件夹中
# g++ -g -o difftest difftest.cpp ram.cpp -ldl