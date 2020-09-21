init:
	export PATH=$HOME/.local/verilator/bin:$PATH

run:
	obj_dir/VsimTop

clean:
	sbt "clean"
	rm -r build

verilog:
	sbt "run sim.elaborate"
# -td  输出到build/ 文件中

# 先make verilog, 再 make verilator, 再make run

run-verilator:
	verilator simTop.v --build \
	verilator/main.cpp verilator/ram.cpp verilator/difftest.cpp \
	--cc --exe -LDFLAGS "-ldl" \
	-CFLAGS "-g"

all:
	make init
	make run-verilator
	make run


# 在verilator文件夹中
# g++ -g -o difftest difftest.cpp ram.cpp -ldl