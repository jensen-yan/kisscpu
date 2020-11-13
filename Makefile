PWD := $(shell pwd)

# src文件
scalaFile = $(shell find $(PWD)/src/main/scala -name '*.scala')
VerilatorCppFile = $(shell find $(PWD)/verilator -name '*.cpp')
verilatorDir = $(PWD)/build/generated-cpp

# 可执行文件
# exe = $(PWD)/obj_dir/VsimTop
exe = $(PWD)/obj_dir/VsimSoc

# 测试文件
testDir = $(PWD)/nexus-am/tests/cputest/build
test_dummy = $(testDir)/dummy-riscv64-nutshell.bin
teat_allName = $(shell find testDir/ -name "*.bin")

# testName ?= add-longlong-riscv64-nutshell.bin		#done
# testName ?= add-riscv64-nutshell.bin				#done
# testName ?= bit-riscv64-nutshell.bin				#done
# testName ?= bubble-sort-riscv64-nutshell.bin		#done
# testName ?= dummy-riscv64-nutshell.bin			#done
# testName ?= fib-riscv64-nutshell.bin				#done
# testName ?= if-else-riscv64-nutshell.bin			#done
# testName ?= load-store-riscv64-nutshell.bin		#done
# testName ?= max-riscv64-nutshell.bin				#done
# testName ?= min3-riscv64-nutshell.bin				#done 
# testName ?= mov-c-riscv64-nutshell.bin			#done
# testName ?= movsx-riscv64-nutshell.bin			#done 1481 / 1037
# testName ?= pascal-riscv64-nutshell.bin			#done
# testName ?= quick-sort-riscv64-nutshell.bin		#done 4176 / 3183
# testName ?= select-sort-riscv64-nutshell.bin		#done 4174 / 2860
# testName ?= shift-riscv64-nutshell.bin			#done 462  / 329 
# testName ?= string-riscv64-nutshell.bin			#done
# testName ?= sub-longlong-riscv64-nutshell.bin		#done 1140 / 795
testName ?= sum-riscv64-nutshell.bin				#done
# testName ?= switch-riscv64-nutshell.bin			#done
# testName ?= to-lower-case-riscv64-nutshell.bin	#done
# testName ?= unalign-riscv64-nutshell.bin			#done

# 乘除法相关
# testName ?= div-riscv64-nutshell.bin				#done 	14154 / 874
# testName ?= fact-riscv64-nutshell.bin				#done
# testName ?= goldbach-riscv64-nutshell.bin			#done 	12841 / 1568
# testName ?= hello-str-riscv64-nutshell.bin		#done  	4623 / 2636
# testName ?= leap-year-riscv64-nutshell.bin		#done 	10718 / 1825
# testName ?= matrix-mul-riscv64-nutshell.bin		#done	77507 / 8966
# testName ?= mul-longlong-riscv64-nutshell.bin		#done 	974 / 239
# testName ?= prime-riscv64-nutshell.bin			#done 	88172 / 5215
# testName ?= recursion-riscv64-nutshell.bin		#done
# testName ?= shuixianhua-riscv64-nutshell.bin		#done	266251 / 6740
# testName ?= wanshu-riscv64-nutshell.bin			#done	29867 / 2685 ?? 差这么多?

# 3个apps
microbench 	= $(PWD)/nexus-am/apps/microbench/build/microbench-riscv64-nutshell.bin
coremark	= $(PWD)/nexus-am/apps/coremark/build/coremark-riscv64-nutshell.bin
dhrystone	= $(PWD)/nexus-am/apps/dhrystone/build/dhrystone-riscv64-nutshell.bin

# rt-thread
rtthread  	= $(PWD)/../RT-Thread/bsp/riscv64/rtthread.bin
# rtthread  	= $(PWD)/../riscv64_rtt/rtthread.bin


init:
	export PATH=$HOME/.local/verilator/bin:$PATH

run:
	obj_dir/VsimTop

clean:
	rm -r obj_dir

verilog:
	sbt "runMain sim.elaborate"
# -td  输出到build/ 文件中

verilog2:
	sbt "runMain sim.elaborate_simCore"


run-verilator: $(VerilatorCppFile) 
	verilator simTop.v \
	--trace \
	$(VerilatorCppFile) \
	--cc --exe -LDFLAGS "-ldl" \
	-CFLAGS "-g"
	make -C obj_dir -f VsimTop.mk

# -Wno-WIDTH -Wno-CASEINCOMPLETE \

run-verilator2: $(VerilatorCppFile) 
	verilator simSoc.v AXIRAM.v AXI_Bridge.v \
	--trace \
	-Wno-WIDTH -Wno-CASEINCOMPLETE \
	$(VerilatorCppFile) \
	--cc --exe -LDFLAGS "-ldl" \
	-CFLAGS "-g" --build
	# make -C obj_dir -f VsimSoc.mk

build:
	make run-verilator

all:
	make verilog
	make clean
	make run-verilator
	make test

# 测试axi总线
all2:
	make verilog2
	make clean
	make run-verilator2
	make test

dummy:
	$(exe) $(test_dummy)
	# obj_dir/VsimTop /home/yanyue/nutshell_v2/kisscpu/nexus-am/tests/cputest/build/dummy-riscv64-nutshell.bin

test:
	$(exe) $(testDir)/$(testName)

microbench:
	$(exe) $(microbench)

coremark:
	$(exe) $(coremark)

dhrystone:
	$(exe) $(dhrystone)

rtthread:
	$(exe) $(rtthread)

# 在verilator文件夹中
# g++ -g -o difftest difftest.cpp ram.cpp -ldl