
# Load Quartus II Tcl Project package
package require ::quartus::project
package require ::quartus::flow

set proj_name  $env(PROJ)

# always redo assignment to eventually add new sources
set make_assignment   1

# Only open if not already open
if {[project_exists DE2_TOP]} {
	project_open -revision DE2_TOP DE2_TOP
} else {
	project_new -revision DE2_TOP DE2_TOP
	set make_assignment   1
}

if {$make_assignment} {
# pin assignments
        source "pins_assignement.tcl"
# clock assignments
        source "clock_assignement.tcl"
# device specific assignement
        source "device_assignement.tcl"
# Compilation
        set_global_assignment -name AUTO_ENABLE_SMART_COMPILE ON
        set_global_assignment -name SMART_RECOMPILE ON
        set_global_assignment -name INCREMENTAL_COMPILATION INCREMENTAL_SYNTHESIS
        set_global_assignment -name INCREMENTAL_COMPILATION FULL_INCREMENTAL_COMPILATION
# files list
        source "file_list.tcl"
# Project specific assignment
        source "project_assignment.tcl"
# Commit assignments
        export_assignments
}
	#run quartus flow
	execute_flow -compile

	# Close project
	project_close

	exit
