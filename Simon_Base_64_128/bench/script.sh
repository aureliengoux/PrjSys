cd ../vhd/
./script
cd ../bench

rm -r -f ./lib_bench_simon
vlib lib_bench_simon
vmap lib_bench_simon $HOME/Prj_Sys/Simon_Base_64_128/bench/lib_bench_simon

vcom +acc -work lib_bench_simon  $HOME/Prj_Sys/Simon_Base_64_128/bench/bench_top.vhd

