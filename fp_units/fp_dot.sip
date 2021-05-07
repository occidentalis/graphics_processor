set_global_assignment -entity "fp_dot" -library "lib_fp_dot" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "fp_dot" -library "lib_fp_dot" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "fp_dot" -library "lib_fp_dot" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fp_dot" -name SPD_FILE [file join $::quartus(sip_path) "fp_dot.spd"]

set_global_assignment -library "lib_fp_dot" -name MISC_FILE [file join $::quartus(sip_path) "fp_dot_sim/fp_dot.vo"]
