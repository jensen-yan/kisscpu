run:
	obj_dir/VsimTop

clean:
	sbt "clean"
	rm -r build

verilog:
	sbt "run -td build/generated-src"
# -td  输出到build/ 文件中

# 先make verilog, 再 make verilator, 再make run

verilator:
	verilator build/generated-src/simTop.v --build verilator/main.cpp --cc --exe

