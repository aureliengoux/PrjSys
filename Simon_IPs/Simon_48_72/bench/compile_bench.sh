cd ../vhd/
./script
cd ../bench

rm -r ./lib_bench_simon
vlib lib_bench_simon
vmap lib_bench_simon ./lib_bench_simon

vcom +acc -work lib_bench_simon  ./bench_top.vhd