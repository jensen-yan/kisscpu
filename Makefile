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
 testName ?= select-sort-riscv64-nutshell.bin		#done 4174 / 2860
# testName ?= shift-riscv64-nutshell.bin			#done 462  / 329 
# testName ?= string-riscv64-nutshell.bin			#done
# testName ?= sub-longlong-riscv64-nutshell.bin		#done 1140 / 795
# testName ?= sum-riscv64-nutshell.bin				#done
# testName ?= switch-riscv64-nutshell.bin			#done
# testName ?= to-lower-case-riscv64-nutshell.bin	#done
# testName ?= unalign-riscv64-nutshell.bin			#done

# 乘除法相关
# testName ?= div-riscv64-nutshell				#skip
# testName ?= fact-riscv64-nutshell				#skip
# testName ?= goldbach-riscv64-nutshell
# testName ?= hello-str-riscv64-nutshell
# testName ?= leap-year-riscv64-nutshell
# testName ?= matrix-mul-riscv64-nutshell
# testName ?= mul-longlong-riscv64-nutshell
# testName ?= prime-riscv64-nutshell
# testName ?= recursion-riscv64-nutshell
# testName ?= shuixianhua-riscv64-nutshell
# testName ?= wanshu-riscv64-nutshell			#skip


init:
	export PATH=$HOME/.local/verilator/bin:$PATH

run:
	obj_dir/VsimTop

clean:
	rm -f -r obj_dir
	rm -f *.json *.fir *.v *.vcd

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
	make clean
	make verilog
	make run-verilator
	make test

dummy:
	$(exe) $(test_dummy)
	# obj_dir/VsimTop /home/yanyue/nutshell_v2/kisscpu/nexus-am/tests/cputest/build/dummy-riscv64-nutshell.bin

test:
	$(exe) $(testDir)/$(testName)

# 在verilator文件夹中
# g++ -g -o difftest difftest.cpp ram.cpp -ldl