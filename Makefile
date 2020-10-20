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

#testName ?= add-longlong-riscv64-nutshell
#testName ?= add-riscv64-nutshell
#testName ?= bit-riscv64-nutshell
#testName ?= bubble-sort-riscv64-nutshell
#testName ?= div-riscv64-nutshell
#testName ?= dummy-riscv64-nutshell
#testName ?= fact-riscv64-nutshell
#testName ?= fib-riscv64-nutshell
#testName ?= goldbach-riscv64-nutshell
#testName ?= hello-str-riscv64-nutshell
#testName ?= if-else-riscv64-nutshell
#testName ?= leap-year-riscv64-nutshell
#testName ?= load-store-riscv64-nutshell
#testName ?= matrix-mul-riscv64-nutshell
#testName ?= max-riscv64-nutshell
#testName ?= min3-riscv64-nutshell
#testName ?= mov-c-riscv64-nutshell
#testName ?= movsx-riscv64-nutshell
#testName ?= mul-longlong-riscv64-nutshell
#testName ?= pascal-riscv64-nutshell
#testName ?= prime-riscv64-nutshell
#testName ?= quick-sort-riscv64-nutshell
#testName ?= recursion-riscv64-nutshell
#testName ?= select-sort-riscv64-nutshell
#testName ?= shift-riscv64-nutshell
#testName ?= shuixianhua-riscv64-nutshell
#testName ?= string-riscv64-nutshell  
#testName ?= sub-longlong-riscv64-nutshell  
testName ?= sum-riscv64-nutshell #done
#testName ?= switch-riscv64-nutshell  
#testName ?= to-lower-case-riscv64-nutshell  
#testName ?= unalign-riscv64-nutshell 
#testName ?= wanshu-riscv64-nutshell




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
	make test

dummy:
	$(exe) $(test_dummy)
	# obj_dir/VsimTop /home/yanyue/nutshell_v2/kisscpu/nexus-am/tests/cputest/build/dummy-riscv64-nutshell.bin

test:
	$(exe) $(testDir)/$(testName).bin

# 在verilator文件夹中
# g++ -g -o difftest difftest.cpp ram.cpp -ldl