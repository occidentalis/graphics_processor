set_global_assignment -entity "fp_cos" -library "lib_fp_cos" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "fp_cos" -library "lib_fp_cos" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "fp_cos" -library "lib_fp_cos" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fp_cos" -name SPD_FILE [file join $::quartus(sip_path) "fp_cos.spd"]

set_global_assignment -library "lib_fp_cos" -name MISC_FILE [file join $::quartus(sip_path) "fp_cos_sim/fp_cos_memoryC0_uid144_cosPiXTables_lutmem.hex"]
set_global_assignment -library "lib_fp_cos" -name MISC_FILE [file join $::quartus(sip_path) "fp_cos_sim/fp_cos_memoryC1_uid147_cosPiXTables_lutmem.hex"]
set_global_assignment -library "lib_fp_cos" -name MISC_FILE [file join $::quartus(sip_path) "fp_cos_sim/fp_cos_memoryC2_uid150_cosPiXTables_lutmem.hex"]
set_global_assignment -library "lib_fp_cos" -name MISC_FILE [file join $::quartus(sip_path) "fp_cos_sim/fp_cos.vo"]
