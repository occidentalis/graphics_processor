set_global_assignment -entity "int_to_fp" -library "lib_int_to_fp" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "int_to_fp" -library "lib_int_to_fp" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "int_to_fp" -library "lib_int_to_fp" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_int_to_fp" -name SPD_FILE [file join $::quartus(sip_path) "int_to_fp.spd"]

set_global_assignment -library "lib_int_to_fp" -name MISC_FILE [file join $::quartus(sip_path) "int_to_fp_sim/int_to_fp.vo"]
