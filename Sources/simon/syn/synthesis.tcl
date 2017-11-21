## Get files from env
set PROJ $env(PROJ)

# Define a project
new_project -name $PROJ -folder . -createimpl_name $PROJ -force

source "global.tcl"

## Add design files
add_input_file -format SystemVerilog -work work {../src/simon_pkg.sv}
add_input_file -format SystemVerilog -work work {../src/simon.sv}
add_input_file -format SystemVerilog -work work {../src/simon_ctrl.sv}
add_input_file -format SystemVerilog -work work {../src/simon_dp.sv}
add_input_file -format SystemVerilog -work work {../src/simon_ks.sv}
add_input_file -format SystemVerilog -work work {../src/zgen.sv}

## Set TOP LEVEL module
setup_design -design simon

# Compile/Synthesize
compile
synthesize

# Save project and exit
save_impl
save_project

# if you run this script in batch
# close_project
# exit -f

