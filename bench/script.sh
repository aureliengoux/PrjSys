cd ../vhd/
./script
cd ../bench

rm -r $HOME/Projet_sys_complexe/bench/lib_bench_simon
vlib lib_bench_simon
vmap lib_bench_simon $HOME/Projet_sys_complexe/bench/lib_bench_simon
vcom +acc -work lib_bench_simon  $HOME/Projet_sys_complexe/vhd/const.vhd
vcom +acc -work lib_bench_simon  $HOME/Projet_sys_complexe/bench/bench_top.vhd
vcom +acc -work lib_bench_simon  $HOME/Projet_sys_complexe/bench/bench_counter.vhd
