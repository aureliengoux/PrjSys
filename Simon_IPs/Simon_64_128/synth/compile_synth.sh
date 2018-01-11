source $HOME/settings/settings_modsim10_2c.sh
source $HOME/settings/settings_precision2014a_64b.sh

vmap simprim  ${XILINX}/vhdl/lib/${SIMPRIMVER}/simprim
vmap unisim  ${XILINX}/vhdl/lib/${SIMPRIMVER}/unisim
vmap XilinxCoreLib  ${XILINX}/vhdl/lib/${SIMPRIMVER}/xilinxcorelib

rm -r -f ./lib_synth
vlib lib_synth
vmap lib_synth $HOME/Prj_Sys/Simon_IPs/Simon_64_128/synth/lib_synth
vcom +acc -work lib_synth  ../vhd/const.vhd
vcom +acc -work lib_synth  ./ synth_simon_counter_process_impl_1/Simon.vhd

rm -r -f ./lib_bench
vlib lib_bench
vmap lib_bench $HOME/Prj_Sys/Simon_IPs/Simon_64_128/bench/lib_bench
vcom +acc -work lib_bench ./bench_top_synth.vhd
