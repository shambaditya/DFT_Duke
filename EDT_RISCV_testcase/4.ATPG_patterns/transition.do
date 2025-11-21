set_context patterns -scan

set_tsdb_output_directory ../tsdb_outdir

read_cell_library ../library/tessent/dft_sim.tcelllib

## Reads in the scan inserted netlist/design
read_design picorv32 -design_id gate -verbose

set_current_design picorv32

## Specify a different name than what was used during scan insertion with add_scan_mode command
set_current_mode edt_transition 

report_dft_signals

## Automation for pattern generation using the EDT IP mapping flow
## Automates dofile based scan description and testproc files

if {$env(SCAN_TOOL) == "Tessent_Scan"} {
   ## Extract the internal mode specified during scan insertion to run ATPG
   import_scan_mode mode1 -fast_capture_mode on
} else {
   ## Using tcd core mapping flow
   add_clocks clk -period 3 ns

   ## Add the EDT IP
   set edt_instance [get_instances -of_icl_instances [get_icl_instances -filter tessent_instrument_type==mentor::edt]]
   add_core_instances -instances $edt_instance

   ## Add the OCC inserted
   set occ_instances [get_instances -of_icl_instances [get_icl_instances -filter tessent_instrument_type==mentor::occ]]
   add_core_instances -instances $occ_instances -parameter_values {fast_capture_mode On}
   ## Include dofile created when 3rd party tools used for scan insertion

   ## Other pin constraints
   add_input_constraints ltest_en -C1

   ## Set attribute to ensure scan reset signal is forced off in the load_unload procedure created by the tool
   set_attribute_value scan_reset -name constraint_value_during_load_unload -value 0
}

set_system_mode analysis
report_clocks
report_input_constraints

set_fault_type TRansition
set_external_capture_options -pll_cycles 5 [lindex [get_timeplate_list] 0]

report_statistics -detail

create_patterns
report_statistics -detail

## For power
report_power_metrics

## Added this for scan volume
report_scan_volume 
report_scan_chains

## Stores TCD, flat_model, fault list and patDB format files in the TSDB directory
write_tsdb_data -replace
write_patterns patterns/picorv32_transition_parallel.v -verilog -parallel -replace -parameter_list {SIM_KEEP_PATH 1}
set_pattern_filtering -sample_per_type 2
write_patterns patterns/picorv32_transition_serial.v -verilog -serial -replace -parameter_list {SIM_KEEP_PATH 1}


exit

