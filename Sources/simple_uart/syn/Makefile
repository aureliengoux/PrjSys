export PROJ = DE2_TOP
BIT_FILE    =  ${PROJ}.sof

.PHONY: all clean program


all:
	quartus_sh -t syn_DE2_quartus.tcl

program:${BIT_FILE}
	@quartus_pgm -c USB-Blaster  -m JTAG -oP\;${BIT_FILE}

clean:
	rm -rf ${PROJ}*
	rm -rf db
	rm -rf incremental_db*
