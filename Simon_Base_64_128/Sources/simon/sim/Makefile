DESIGN_MOD = zgen simon_ks simon_dp simon_ctrl simon simon_tb
DESIGN_MOD_ = $(patsubst %,.%.done,$(DESIGN_MOD))

TBENCH  = simon_tb 

VSIM_CMD = @vsim
VSIM_OPT = -quiet -sv_lib ref_model/simon_dpi
VLOG_CMD = @vlog +acc -nologo

vpath %.sv ../src
vpath %.v  ../src

.PHONY: all clean simon simon_gui run_sim

all:simon

work:
	vlib work

.%.done:%.v | work
	$(VLOG_CMD)  +incdir+$$(dirname $<) $<
	@touch $@

.%.done:%.sv | work
	$(VLOG_CMD)  +incdir+$$(dirname $<) $<
	@touch $@

simon: VSIM_OPT += -c -do 'run -all'
simon: run_sim

simon_gui: run_sim

run_sim: $(DESIGN_MOD_) | ref_model/simon_dpi.so
	$(VSIM_CMD) $(VSIM_OPT) $(TBENCH)


clean:
	rm -rf work
	rm -f transcript
	rm -f vsim.wlf
	rm -rf .*.done

# The DPI reference lib
ref_model/simon_dpi.so:
	make -C ref_model


# package dependencies to guarantee compilation order
.zgen.done .simon_dp.done .simon_ctrl.done .simon.done : .simon_pkg.done
.simon_tb.done : .simon_tb_pkg.done  .simon_pkg.done
