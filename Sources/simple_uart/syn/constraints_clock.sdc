#--------------------------------------------------------------
# Time Information
#--------------------------------------------------------------

set_time_format -unit ns -decimal_places 1 


#--------------------------------------------------------------
# Create Clocks
#--------------------------------------------------------------

# L'horloge externe à 50Mhz
create_clock -name {CLOCK_50MHz} -period 20.0 -waveform { 0.0 10.0 } [get_ports {clock_50}]

#--------------------------------------------------------------
# Create Generated Clocks
#--------------------------------------------------------------
# Générer automatoquement les contraintes pour les sorties des pll
derive_pll_clocks -create_base_clocks

# -----------------------------------------------------------------
# Cut timing paths
# -----------------------------------------------------------------
#
# The timing for the I/Os in this design is arbitrary, so cut all
# paths to the I/Os, even the ones that are used in the design,
# i.e., the LEDs, switches, and hex displays.
#

# Les entrées manuelles
set_false_path -from [get_ports key*] -to *
set_false_path -from [get_ports sw*] -to *

# Les afficheurs
set_false_path -from * -to [get_ports {led*}]
set_false_path -from * -to [get_ports {hex*}]

# le port série n'est pas critique
set_false_path -from [get_ports uart_rxd] -to [get_registers *r0_uart_rxd]
set_false_path -from [get_registers *uart_txd] -to [get_ports uart_txd]
