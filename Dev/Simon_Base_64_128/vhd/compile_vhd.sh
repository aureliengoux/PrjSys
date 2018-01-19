rm -r -f ./lib_simon

vlib lib_simon
vmap lib_simon $SIMON_WORKSPACE/Simon_Base_64_128/vhd/lib_simon
vcom +acc -work lib_simon  ./const.vhd
vcom +acc -work lib_simon  ./round.vhd
#vcom +acc -work lib_simon  ./counter.vhd
vcom +acc -work lib_simon  ./fsm.vhd
vcom +acc -work lib_simon  ./top.vhd




