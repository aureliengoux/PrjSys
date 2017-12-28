export PROJ = Simon

# End of SOURCE_FILES
.PHONY : all clean

all:
	precision -file synthesis.tcl

clean:
	@rm -rf $(PROJ)
	@rm -fr *.log *.psp impl*
	@rm -fr *_temp_*
