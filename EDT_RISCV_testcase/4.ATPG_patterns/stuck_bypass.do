set_context patterns -scan

set_tsdb_output_directory ../tsdb_outdir

read_cell_library ../library/tessent/dft_sim.tcelllib

## Reads in the scan inserted netlist/design
read_design picorv32 -design_id gate

set_current_design picorv32

## Specify a different name than what was used during scan insertion with add_scan_mode command
set_current_mode edt_stuck 

report_dft_signals

## Automation for pattern generation using the EDT IP mapping flow 
## Automates dofile based scan description and testproc files
if {$env(SCAN_TOOL) == "Tessent_Scan"} {
    ## Extract the internal mode specified during scan insertion to run ATPG
    import_scan_mode mode1
} else {
    ## Using tcd core mapping flow
    set edt_instance [get_instances -of_icl_instances [get_icl_instances -filter tessent_instrument_type==mentor::edt]]
    add_core_instances -instances $edt_instance 
    ## optional to add bypass just here use this line isntead of above:
    ## add_core_instances -instances $edt_instance -parameter_values {edt_bypass on}

    ## Add the OCC inserted
    set occ_instances [get_instances -of_icl_instances [get_icl_instances -filter tessent_instrument_type==mentor::occ]]
    add_core_instances -instances $occ_instances
    ## Include dofile created when 3rd party tools used for scan insertion

    ## Other pin constraints - fix for Async set/reset during scan insertion
    add_input_constraints ltest_en -C1

    ## Set attribute to ensure scan reset signal is forced off in the load_unload procedure created by the tool
    set_attribute_value scan_reset -name constraint_value_during_load_unload -value 0
}
    
## this turns on bypass for the specified instance
set_core_instance_parameters -instance picorv32_rtl1_tessent_edt_c1_inst -parameter_values {edt_bypass on}

## optionally can use this one for all edt instruments (bypass all edt stuff)
## set_core_instance_parameters -instrument_type edt -parameter_values {edt_bypass on}

set_system_mode analysis
report_clocks
report_input_constraints

add_fault -all
report_statistics -detail
create_patterns
report_statistics -detail

## Added this for bypass test case
report_scan_volume 

## Stores TCD, flat_model, fault list and patDB format files in the TSDB directory
write_tsdb_data -replace

##Writing out patterns for simulation
write_patterns patterns/picorv32_bypass_stuck_parallel.v -verilog -parallel -replace -parameter_list {SIM_KEEP_PATH 1}
set_pattern_filtering -sample_per_type 2
write_patterns patterns/picorv32_bypass_stuck_serial.v -verilog -serial -replace -parameter_list {SIM_KEEP_PATH 1}

exit

