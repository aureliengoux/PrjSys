###################################################################################
# Mentor Graphics Corporation
#
###################################################################################

#################
# Attributes
#################
set_attribute -name no_enable_dff -value "TRUE" -instance counter_map_modgen_counter_count_reg_q(5) -design gatelevel 
set_attribute -name no_enable_dff -value "TRUE" -instance counter_map_modgen_counter_count_reg_q(4) -design gatelevel 
set_attribute -name no_enable_dff -value "TRUE" -instance counter_map_modgen_counter_count_reg_q(3) -design gatelevel 
set_attribute -name no_enable_dff -value "TRUE" -instance counter_map_modgen_counter_count_reg_q(2) -design gatelevel 
set_attribute -name no_enable_dff -value "TRUE" -instance counter_map_modgen_counter_count_reg_q(1) -design gatelevel 
set_attribute -name no_enable_dff -value "TRUE" -instance counter_map_modgen_counter_count_reg_q(0) -design gatelevel 
set_attribute -name PART -value "3s200ft256-5" -type string /work/top/rtl_top -design gatelevel 

##################
# Clocks
##################
create_clock { clk } -domain ClockDomain0 -name clk -period 20.000000 -waveform { 0.000000 10.000000 } -design gatelevel 
