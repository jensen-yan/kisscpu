
# src文件
scalaFile = $(shell find ./src/main/scala -name '*.scala')
VerilatorCppFile = $(shell find ./verilator -name '*.cpp')


init:
	export PATH=$HOME/.local/verilator/bin:$PATH

run:
	obj_dir/VsimTop

clean:
	rm -r build
	rm -r obj_dir

verilog:
	sbt "run sim.elaborate"
# -td  输出到build/ 文件中

# 先make verilog, 再 make verilator, 再make run

run-verilator: $(VerilatorCppFile)
	verilator simTop.v --build \
	$(VerilatorCppFile) \
	--cc --exe -LDFLAGS "-ldl" \
	-CFLAGS "-g" --trace

all:
	make init
	make run-verilator
	make run


# 在verilator文件夹中
# g++ -g -o difftest difftest.cpp ram.cpp -ldl