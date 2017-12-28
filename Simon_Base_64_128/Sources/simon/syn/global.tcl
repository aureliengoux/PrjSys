## Setup Technology Environement
# Which FPGA
setup_design -manufacturer Altera -family "Cyclone II" -part EP2C35F672C -speed 6
# What frequency in MHz
setup_design -frequency=100
# set input and output delays
setup_design -input_delay="1"
setup_design -output_delay="1"
# Do we add IO buffers
setup_design -addio=false
# generate netlists in verilog and edif
setup_design -verilog=true -edif=true
# For Quartus new Timing ANALYSIS tool (timeQuest)
setup_design -timequest_sdc
# For post syn back annotated netlist (ba)
setup_place_and_route -flow "Quartus II Modular" -command "Integrated Place and Route" -ba_format Verilog

