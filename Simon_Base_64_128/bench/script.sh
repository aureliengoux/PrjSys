#cd ../vhd/
#./script
#cd ../bench

#rm -r $HOME/Projet_sys_complexe/bench/lib_bench_simon
#vlib lib_bench_simon
#vmap lib_bench_simon $HOME/Projet_sys_complexe/bench/lib_bench_simon

#vcom +acc -work lib_bench_simon  $HOME/Projet_sys_complexe/vhd/const.vhd
#vcom +acc -work lib_bench_simon  $HOME/Projet_sys_complexe/bench/bench_top.vhd
#vcom +acc -work lib_bench_simon  $HOME/Projet_sys_complexe/vhd/const_32_64.vhd

#vcom +acc -work lib_bench_simon  $HOME/Projet_sys_complexe/bench/bench_top_32_64.vhd
#vcom +acc -work lib_bench_simon  $HOME/Projet_sys_complexe/bench/bench_counter.vhd


cd ../vhd/
./script
cd ../bench

rm -r ./lib_bench_simon
vlib lib_bench_simon
vmap lib_bench_simon ./lib_bench_simon

vcom +acc -work lib_bench_simon  ./bench_top.vhd

#vcom +acc -work lib_bench_simon ../vhd/const.vhd
#vcom +acc -work lib_bench_simon  ./bench_top.vhd
#vcom +acc -work lib_bench_simon  ../vhd/const_32_64.vhd

#vcom +acc -work lib_bench_simon  ./bench_top_32_64.vhd
#vcom +acc -work lib_bench_simon  ./bench_counter.vhd
