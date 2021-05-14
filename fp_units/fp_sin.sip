set_global_assignment -entity "fp_sin" -library "lib_fp_sin" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "fp_sin" -library "lib_fp_sin" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "fp_sin" -library "lib_fp_sin" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fp_sin" -name SPD_FILE [file join $::quartus(sip_path) "fp_sin.spd"]

set_global_assignment -library "lib_fp_sin" -name MISC_FILE [file join $::quartus(sip_path) "fp_sin_sim/fp_sin_memoryC0_uid155_sinPiXTables_lutmem.hex"]
set_global_assignment -library "lib_fp_sin" -name MISC_FILE [file join $::quartus(sip_path) "fp_sin_sim/fp_sin_memoryC1_uid158_sinPiXTables_lutmem.hex"]
set_global_assignment -library "lib_fp_sin" -name MISC_FILE [file join $::quartus(sip_path) "fp_sin_sim/fp_sin_memoryC2_uid161_sinPiXTables_lutmem.hex"]
set_global_assignment -library "lib_fp_sin" -name MISC_FILE [file join $::quartus(sip_path) "fp_sin_sim/fp_sin.vo"]
