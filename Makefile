PWD := $(shell pwd)

TOP = simTop
BUILD_DIR = ./build
TOP_V = $(BUILD_DIR)/verilog/$(TOP).v

# src文件
scalaFile 		= $(shell find $(PWD)/src/main/scala -name '*.scala')
verilatorCppFile =$(shell find $(PWD)/verilator -name '*.cpp')
verilatorDir 	= $(PWD)/build/generated-cpp
verilogFile 	= $(PWD)/build/verilog/simTop.v

#verilator 参数
verilatorParams = 	--trace \
                  	--cc --exe -LDFLAGS "-ldl" \
                  	-CFLAGS "-g" \
                  	-Mdir build/verilator

# 可执行文件
exe = $(PWD)/build/verilator/VsimTop

# 测试文件
testDir = $(PWD)/nexus-am/tests/cputest/build
test_dummy = $(testDir)/dummy-riscv64-nutshell.bin
teat_allName = $(shell find testDir/ -name "*.bin")

# 单个测试
one = add-longlong
# 简单测试
simpleName = add-longlong add bit bubble-sort dummy fib if-else load-store max min3 mov-c movsx pascal \
			 quick-sort select-sort shift string sub-longlong sum switch to-lower-case unalign
# 乘除法测试
mulFileName = div fact goldbach hello leap-year matrix-mul mul-longlong prime recursion shuixianhua wanshu

.DEFAULT_GOAL = all
.PHONY: clean verilog run-verilator all dummy testOne testSimple

clean:
	rm -f -r build
	rm -f *.json *.fir *.v *.vcd

verilog:
	sbt "runMain sim.elaborate -td build/verilog"

run-verilator: $(verilatorCppFile) $(verilogFile)
	verilator  $(verilogFile) $(verilatorCppFile) $(verilatorParams)
	make -C build/verilator -f VsimTop.mk

all:
	make clean
	make verilog
	make run-verilator
	make testOne

dummy:
	$(exe) $(test_dummy)
	# obj_dir/VsimTop /home/yanyue/nutshell_v2/kisscpu/nexus-am/tests/cputest/build/dummy-riscv64-nutshell.bin

testOne:
	@echo "testing $(one)"
	$(exe) $(testDir)/$(one)-riscv64-nutshell.bin

testSimple:
	$(foreach var, $(simpleName), \
		echo $(var); \
		$(exe) $(testDir)/$(var)-riscv64-nutshell.bin;)
