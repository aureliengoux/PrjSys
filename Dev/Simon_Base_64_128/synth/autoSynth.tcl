new_project -name Simon -folder $::env(SIMON_WORKSPACE)/Simon_IPs/Simon_Base_64_128/synth -createimpl_name Simon_impl_1
add_input_file {../vhd/const.vhd ../vhd/fsm.vhd ../vhd/round.vhd ../vhd/top.vhd}
setup_design -manufacturer Xilinx -family SPARTAN3 -part 3s200ft256 -speed -5 ; setup_design -frequency 50 -max_fanout=10000
setup_design -encoding=onehot ; setup_design -vhdl=true -vendor_constraint_file=false
compile
synthesize
save_project
quit
