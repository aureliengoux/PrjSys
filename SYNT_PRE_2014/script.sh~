rm -r $HOME/Projet_sys_complexe/SYNT_PRE_2014/lib_synth
vlib lib_synth
vmap lib_synth $HOME//Projet_sys_complexe/SYNT_PRE_2014/lib_synth
vcom +acc -work lib_synth  $HOME/Projet_sys_complexe/vhd/const.vhd
vcom +acc -work lib_synth  $HOME/Projet_sys_complexe/SYNT_PRE_2014/simon_synth_impl_1/top.vhd

rm -r $HOME/Projet_sys_complexe/SYNT_PRE_2014/lib_bench
vlib lib_bench
vmap lib_bench $HOME//Projet_sys_complexe/SYNT_PRE_2014/lib_bench
vcom +acc -work lib_bench $HOME/Projet_sys_complexe/SYNT_PRE_2014/bench_top_synth.vhd
