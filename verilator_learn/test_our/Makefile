init:
	export PATH=$HOME/.local/verilator/bin:$PATH
all: our.v sim_main.cpp
	verilator -Wall --cc our.v --exe --build sim_main.cpp
# --cc 输出c++文件; --exe 创建可执行文件; --build 后面添加需要的c++文件
run:
	obj_dir/Vour