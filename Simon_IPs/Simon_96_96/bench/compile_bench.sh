cd ../vhd/
./compile_vhd.sh
cd ../bench

rm -r -f ./lib_bench_simon
vlib lib_bench_simon
vmap lib_simon $HOME/Prj_Sys/Simon_IPs/Simon_96_96/bench/lib_bench_simon

vcom +acc -work lib_bench_simon  ./bench_top.vhd