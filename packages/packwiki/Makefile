compile:
	vlog -sv package_ex.sv
	vlog -sv package_mod1.sv
 
simulate:
	vsim mod1 -l package_mod1.log -c -do "run;exit;" 

all:
	make compile && make simulate
