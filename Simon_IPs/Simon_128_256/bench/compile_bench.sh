source $HOME/settings/settings_modsim10_2c.sh

cd ../vhd/
./compile_vhd.sh
cd ../bench

vmap lib_simon $HOME/Prj_Sys/Simon_IPs/Simon_128_256/vhd/lib_simon

rm -r -f ./lib_bench_simon
vlib lib_bench_simon
vmap lib_bench_simon $HOME/Prj_Sys/Simon_IPs/Simon_128_256/bench/lib_bench_simon

vcom +acc -work lib_bench_simon  $HOME/Prj_Sys/Simon_IPs/Simon_128_256/bench/bench_top.vhd

