set_global_assignment -entity "fp_sqr" -library "lib_fp_sqr" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "fp_sqr" -library "lib_fp_sqr" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "fp_sqr" -library "lib_fp_sqr" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fp_sqr" -name SPD_FILE [file join $::quartus(sip_path) "fp_sqr.spd"]

set_global_assignment -library "lib_fp_sqr" -name MISC_FILE [file join $::quartus(sip_path) "fp_sqr_sim/fp_sqr_memoryC0_uid62_sqrtTables_lutmem.hex"]
set_global_assignment -library "lib_fp_sqr" -name MISC_FILE [file join $::quartus(sip_path) "fp_sqr_sim/fp_sqr_memoryC1_uid65_sqrtTables_lutmem.hex"]
set_global_assignment -library "lib_fp_sqr" -name MISC_FILE [file join $::quartus(sip_path) "fp_sqr_sim/fp_sqr_memoryC2_uid68_sqrtTables_lutmem.hex"]
set_global_assignment -library "lib_fp_sqr" -name MISC_FILE [file join $::quartus(sip_path) "fp_sqr_sim/fp_sqr.vo"]
