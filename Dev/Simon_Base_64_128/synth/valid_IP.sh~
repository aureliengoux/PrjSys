rm -r -f Simon_impl_1
rm -r -f lib_bench
rm -r -f lib_synth
rm -f Simon.psp
rm -f modelsim.ini
rm -f transcript
precision -shell -file autoSynth.tcl
chmod +x compile_synth.sh
./compile_synth.sh
vsim -c -do test.tcl
