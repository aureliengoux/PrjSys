rm -r -f ./lib_simon

vlib lib_simon
vmap lib_simon $HOME/Prj_Sys/Simon_IPs/Simon_48_72/vhd/lib_simon
vcom +acc -work lib_simon  ./const.vhd
vcom +acc -work lib_simon  ./round.vhd
vcom +acc -work lib_simon  ./counter.vhd
vcom +acc -work lib_simon  ./top.vhd



