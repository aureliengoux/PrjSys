# Device
        set_global_assignment -name FAMILY "Cyclone II"
        set_global_assignment -name DEVICE EP2C35F672C6
        set_global_assignment -name EDA_DESIGN_ENTRY_SYNTHESIS_TOOL "<None>"

# Pins in Z state if unused
        set_global_assignment -name RESERVE_ALL_UNUSED_PINS_NO_OUTPUT_GND "AS INPUT TRI-STATED"
        set_global_assignment -name RESERVE_ALL_UNUSED_PINS "AS INPUT TRI-STATED"
        set_global_assignment -name RESERVE_ASDO_AFTER_CONFIGURATION "AS OUTPUT DRIVING AN UNSPECIFIED SIGNAL"

        set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 1
        set_global_assignment -name CYCLONEII_RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"
# On the DE2 board all chips are 3.3V ttl
        set_global_assignment -name STRATIX_DEVICE_IO_STANDARD "3.3-V LVTTL"
# Default load assignment. Dummy value because we dont know the real values (10pf)
        set_io_assignment 10 -name OUTPUT_PIN_LOAD -io_standard LVTTL

# cyclone II dual port ram issues
# Possible options are:
# NO_CHANGE     No memory blocks will be modified. The Quartus II
#               software issues an error for memory blocks in un-safe
#               modes.
# PORT_SWAP     Only changes memory blocks that will have no design
# (default)     impact (port swap remapping methods). The Quartus II
#               software issues an error for memory blocks that require
#               read enable emulation, bit multiplexing, or true dual port
#               remapping methods.
# RESTRUCTURE   Remap all memory blocks (port swap, read enable
#               emulation, bit multiplexing, and true dual port remapping
#               methods).
# VERIFIED_SAFE User has verified memory block to be safe. The Quartus II
#               software will issue a warning for memory blocks in unsafe
#               modes.
#
# For extra information:
# Cyclone II FPGA Family : Errata Sheet
# http://www.altera.com/literature/ds/es_cycii.pdf
	set_parameter -name CYCLONEII_SAFE_WRITE VERIFIED_SAFE

