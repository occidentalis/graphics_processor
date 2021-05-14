set_global_assignment -entity "fp_inv" -library "lib_fp_inv" -name IP_TOOL_NAME "altera_fp_functions"
set_global_assignment -entity "fp_inv" -library "lib_fp_inv" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "fp_inv" -library "lib_fp_inv" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fp_inv" -name SPD_FILE [file join $::quartus(sip_path) "fp_inv.spd"]

set_global_assignment -library "lib_fp_inv" -name MISC_FILE [file join $::quartus(sip_path) "fp_inv_sim/fp_inv_memoryC0_uid60_inverseTables_lutmem.hex"]
set_global_assignment -library "lib_fp_inv" -name MISC_FILE [file join $::quartus(sip_path) "fp_inv_sim/fp_inv_memoryC1_uid63_inverseTables_lutmem.hex"]
set_global_assignment -library "lib_fp_inv" -name MISC_FILE [file join $::quartus(sip_path) "fp_inv_sim/fp_inv_memoryC2_uid66_inverseTables_lutmem.hex"]
set_global_assignment -library "lib_fp_inv" -name MISC_FILE [file join $::quartus(sip_path) "fp_inv_sim/fp_inv.vo"]
