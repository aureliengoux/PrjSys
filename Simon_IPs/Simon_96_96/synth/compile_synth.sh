rm -r -f ./lib_synth

vlib lib_synth
vmap lib_synth $HOME/Prj_Sys/Simon_IPs/Simon_96_96/synth/lib_synth
#vcom +acc -work lib_synth  ../vhd/const.vhd
vcom +acc -work lib_synth  ./simon_synth_impl_1/top.vhd

rm -r ./lib_bench_synth
vlib lib_bench_synth
vmap lib_bench_synth $HOME/Prj_Sys/Simon_IPs/Simon_96_96/synth/lib_bench_synth
vcom +acc -work lib_bench_synth ./bench_top_synth.vhd