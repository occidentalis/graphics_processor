set_global_assignment -entity "fp_to_int" -library "lib_fp_to_int" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "fp_to_int" -library "lib_fp_to_int" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "fp_to_int" -library "lib_fp_to_int" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fp_to_int" -name SPD_FILE [file join $::quartus(sip_path) "fp_to_int.spd"]

set_global_assignment -library "lib_fp_to_int" -name MISC_FILE [file join $::quartus(sip_path) "fp_to_int_sim/fp_to_int.vo"]
