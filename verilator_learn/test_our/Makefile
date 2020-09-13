init:
	export PATH=$HOME/.local/verilator/bin:$PATH
all: our.v sim_main.cpp
	verilator -Wall --cc our.v --exe --build sim_main.cpp
run:
	obj_dir/Vour