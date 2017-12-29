rm -r ./lib_synth
vlib lib_synth
vmap lib_synth ./lib_synth
#vcom +acc -work lib_synth  ../vhd/const.vhd
vcom +acc -work lib_synth  ./simon_synth_impl_1/top.vhd

rm -r ./lib_bench
vlib lib_bench
vmap lib_bench ./lib_bench
vcom +acc -work lib_bench ./bench_top_synth.vhd