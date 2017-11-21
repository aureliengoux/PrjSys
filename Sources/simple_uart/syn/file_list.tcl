#-------------------------------------------------------------------------------
#  Returns Filetype as expected by quartus based on the file extension
#-------------------------------------------------------------------------------

proc filetype { filename } {
  return [ \
    switch -regexp $filename {
      ^.*\.bdf$ { format "BDF_FILE"             }
      ^.*\.vhdl$ -
      ^.*\.vhd$ { format "VHDL_FILE"            }
      ^.*\.sv$  { format "SYSTEMVERILOG_FILE"   }
      ^.*\.v$   -
      ^.*\.vo$  { format "VERILOG_FILE"         }
      ^.*\.vqm$ { format "VQM_FILE"             }
      ^.*\.vwf$ { format "VECTOR_WAVEFORM_FILE" }
      default   { format "VHDL_FILE"            }
    }
  ]
}

proc addToProject { filename } {
    set filetype [ filetype $filename ]
    set_global_assignment -name $filetype "$filename"
}

set TOP_PATH ../../
set SRC_PATH ${TOP_PATH}/simple_uart/src
set APP_PATH ${TOP_PATH}/simon/src

set_global_assignment -name SEARCH_PATH ${APP_PATH}

# Target specific
addToProject  ${SRC_PATH}/de2_top.sv
addToProject  ${SRC_PATH}/pll_50_24.v
# Generic
addToProject  ${SRC_PATH}/top.sv
addToProject  ${SRC_PATH}/uart_interface.v
addToProject  ${SRC_PATH}/uart.v
# Appli
addToProject  ${APP_PATH}/simon_pkg.sv
addToProject  ${APP_PATH}/zgen.sv
addToProject  ${APP_PATH}/simon_ks.sv
addToProject  ${APP_PATH}/simon_ctrl.sv
addToProject  ${APP_PATH}/simon_dp.sv
addToProject  ${APP_PATH}/simon_ks.sv
addToProject  ${APP_PATH}/simon.sv

# ---- Top level entity
set_global_assignment -name FOCUS_ENTITY_NAME  de2_top
