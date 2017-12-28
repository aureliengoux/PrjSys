set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top

set_global_assignment -name PARTITION_NETLIST_TYPE POST_SYNTH -section_id "pll_50_24:pll_i"
set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id "pll_50_24:pll_i"

set_global_assignment -name PARTITION_NETLIST_TYPE POST_SYNTH -section_id "top:top_i"
set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id "top:top_i"


set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top
set_instance_assignment -name PARTITION_HIERARCHY pll1_part  -to "pll_50_24:pll_i" -section_id "pll_50_24:pll_i"
set_instance_assignment -name PARTITION_HIERARCHY top_part   -to "top:top_i" -section_id "top:top_i"
