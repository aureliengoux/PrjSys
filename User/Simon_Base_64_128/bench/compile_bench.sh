cd ../vhd/
 chmod +x compile_vhd.sh
./compile_vhd.sh
cd ../bench

vmap lib_simon $SIMON_WORKSPACE/Simon_Base_64_128/vhd/lib_simon

rm -r -f ./lib_bench_simon
vlib lib_bench_simon
vmap lib_bench_simon $SIMON_WORKSPACE/Simon_Base_64_128/bench/lib_bench_simon

vcom +acc -work lib_bench_simon  $SIMON_WORKSPACE/Simon_Base_64_128/bench/bench_top.vhd

