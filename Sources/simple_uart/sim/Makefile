SIMON_DEP = zgen simon_ks simon_dp simon_ctrl simon
SIMPLE_UART_DEP = top uart_interface uart
TBENCH = tb_uart_simple
TB_DEP =
DEP_  = $(patsubst %,.%.done,$(SIMON_DEP))
DEP_ += $(patsubst %,.%.done,$(SIMPLE_UART_DEP))
DEP_ += $(patsubst %,.%.done,$(TBENCH))
DEP_ += $(patsubst %,.%.done,$(TB_DEP))


SURAT_SRC_PATH =  ../src
SIMON_SRC_PATH =  ../../Simon/src
SIMON_TB_PATH  =  ../../Simon/sim

# Where to look for the rtl
vpath %.v  $(SURAT_SRC_PATH) $(SIMON_SRC_PATH)
vpath %.sv $(SURAT_SRC_PATH) $(SIMON_SRC_PATH) $(SIMON_TB_PATH)

.PHONY: all clean comp run run_gui

VSIM_CMD = @vsim
VSIM_OPT = -quiet -sv_lib $(SIMON_TB_PATH)/ref_model/simon_dpi
VLOG_CMD = @vlog +acc -nologo

all:run

work:
	vlib work

.%.done:%.v | work
	$(VLOG_CMD)  +incdir+$$(dirname $<) $<
	@touch $@

.%.done:%.sv | work
	$(VLOG_CMD)  +incdir+$$(dirname $<) $<
	@touch $@

comp: $(DEP_)

run_sim: comp  | $(SIMON_TB_PATH)/ref_model/simon_dpi.so
	$(VSIM_CMD) $(VSIM_OPT) $(TBENCH)

run: VSIM_OPT += -c -do 'run -all'
run: run_sim

run_gui: run_sim


clean:
	rm -rf work
	rm -f transcript
	rm -f vsim.wlf
	rm -rf .*.done

# Simon's modules depends on a package that have to be compiled first
$(patsubst %,.%.done,$(SIMON_DEP)):.simon_pkg.done
$(patsubst %,.%.done,$(TBENCH)):.simon_tb_pkg.done
