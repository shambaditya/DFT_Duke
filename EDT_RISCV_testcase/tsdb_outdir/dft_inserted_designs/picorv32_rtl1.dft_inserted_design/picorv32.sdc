#--------------------------------------------------------------------------
#
#  Unpublished work. Copyright 2024 Siemens
#
#  This material contains trade secrets or otherwise confidential 
#  information owned by Siemens Industry Software Inc. or its affiliates 
#  (collectively, SISW), or its licensors. Access to and use of this 
#  information is strictly limited as set forth in the Customer's 
#  applicable agreements with SISW.
#
#--------------------------------------------------------------------------
#  File created by: Tessent Shell
#          Version: 2024.4
#       Created on: Thu Nov 20 12:09:57 EST 2025
#--------------------------------------------------------------------------

#
#  Procs table of content:
#
#    tessent_set_default_variables
#    tessent_set_ltest_set_timing_variables_default
#    tessent_set_ltest_create_clocks
#    tessent_set_ltest_non_modal
#    tessent_set_non_modal
#    tessent_set_ltest_occ
#    tessent_set_ltest_modal_shift
#    tessent_set_ltest_modal_edt_fast_capture
#    tessent_set_ltest_modal_edt_slow_capture
#    tessent_set_ltest_modal_edt_shift
#    tessent_set_ltest_modal_bypass_shift
#    tessent_set_ltest_disable
#    tessent_set_ltest_set_pin_delays
#    tessent_get_cts_skew_groups_dict
#    tessent_picorv32_set_dft_signals
#    tessent_get_cells
#    tessent_get_flops
#    tessent_get_pins
#    tessent_get_ports
#    tessent_map_to_verilog
#    tessent_remap_vhdl_path_list
#    tessent_remove_clock_groups
#    tessent_get_clock_source
#    tessent_set_clock_sense_stop_propagation
#    tessent_kill_functional_paths
#    tessent_get_mem_cells
#    tessent_get_clocks
#    tessent_get_preserve_instances
#    tessent_get_size_only_instances
#    tessent_get_optimize_instances
#
proc tessent_set_default_variables {} {
  global time_unit_multiplier scan_en_port_name edt_update_port_name tessent_regQ tessent_edt_mapping tessent_timing_options tessent_hierarchy_separator tessent_path_cache tessent_tck_clocks_group_created tessent_timing_tool tessent_test_inst_regexp
  #
  # This proc defines the default value of the variables used in instrument timing constraints
  #

  # Time units assumed ns
  set time_unit_multiplier 1.0

  set scan_en_port_name scan_en_w

  set edt_update_port_name edt_update

  set tessent_regQ Q

  # Use this mapping to find which unique identifier maps to which EDT controller instance.
  array set tessent_edt_mapping {
    edt_inst0 picorv32_rtl1_tessent_edt_c1_inst
  }

 # Test procedure timing specifications:
  tessent_set_ltest_set_timing_variables_default


  set tessent_hierarchy_separator /

  array set tessent_path_cache {
  }

  set tessent_tck_clocks_group_created 0

  switch -glob [file tail [info nameofexecutable]] {
    common_shell_exec {set tessent_timing_tool dc_shell}
    oasys*            {set tessent_timing_tool oasys}
    rc                {set tessent_timing_tool encounter}
    genus             {set tessent_timing_tool genus}
    dgcom_exec        {set tessent_timing_tool pt_shell}
    default           {set tessent_timing_tool pt_shell}
  }
  

  set tessent_test_inst_regexp {(.*_tessent_occ_.*)}

}
proc tessent_set_ltest_set_timing_variables_default {} {  
  
  global tessent_slow_clock_period
  global tessent_shift_clock_edge1_percentage
  global tessent_shift_clock_edge2_percentage
  global tessent_force_pi_percentage
  global tessent_measure_po_percentage
  global tessent_scan_input_delay
  global tessent_scan_output_delay
  global tessent_edt_channel_in_ports_list
  global tessent_edt_channel_out_ports_list
  
  global tessent_scan_en_setup_extra_cycles
  global tessent_scan_en_hold_extra_cycles
  global tessent_edt_update_setup_extra_cycles
  global tessent_edt_update_hold_extra_cycles
  
  
  set tessent_slow_clock_period       40.
  # The following variable settings reflect the default fastscan timeplate specifications:
  #     timeplate gen_tp1 =
  #        force_pi 0 ;
  #        measure_po 10 ;
  #        pulse_clock 20 10 ;
  #        period 40 ;
  #     end;
  # Please adjust these numbers according to your own settings.
  set tessent_shift_clock_edge1_percentage 50.
  set tessent_shift_clock_edge2_percentage 75.
  set tessent_force_pi_percentage          0.
  set tessent_measure_po_percentage        25.
  set tessent_scan_input_delay             0.
  set tessent_scan_output_delay            0.
  
  # Default dead cycles values for both scan_enable and edt_update signals.
  # WARNING: If you change these defaults, make sure that the new values match your
  # test_proc specifications once creating your ATPG test patterns.
  set tessent_scan_en_setup_extra_cycles    0
  set tessent_scan_en_hold_extra_cycles     0
  set tessent_edt_update_setup_extra_cycles 0
  set tessent_edt_update_hold_extra_cycles  0
  
  set tessent_edt_channel_in_ports_list {
    {picorv32_rtl1_controller_c1_edt_channels_in[0]}
    {picorv32_rtl1_controller_c1_edt_channels_in[1]}
  }
  set tessent_edt_channel_out_ports_list {
    {picorv32_rtl1_controller_c1_edt_channels_out[0]}
    {picorv32_rtl1_controller_c1_edt_channels_out[1]}
  }
  
  
}
proc tessent_set_ltest_create_clocks {} {  
  
  global time_unit_multiplier
  
  global tessent_slow_clock_period
  global tessent_shift_clock_edge1_percentage
  global tessent_shift_clock_edge2_percentage
  global tessent_force_pi_percentage
  global tessent_measure_po_percentage
  
  
  set slow_clock_period   [expr $tessent_slow_clock_period * $time_unit_multiplier]
  set sc_rise_time        [expr $tessent_shift_clock_edge1_percentage/100. * $slow_clock_period]
  set sc_fall_time        [expr $tessent_shift_clock_edge2_percentage/100. * $slow_clock_period]
  set sc_waveform         "$sc_rise_time $sc_fall_time"
  set force_pi_rise       [expr $tessent_force_pi_percentage/100.   * $slow_clock_period]
  set measure_po_rise     [expr $tessent_measure_po_percentage/100. * $slow_clock_period]
  set min_width           [expr 0.25 * $slow_clock_period]
  set force_pi_waveform   "$force_pi_rise   [expr $force_pi_rise   + $min_width]"
  set measure_po_waveform "$measure_po_rise [expr $measure_po_rise + $min_width]"
  
  # test_clock:
    create_clock [tessent_get_ports test_clock_w] \
      -add -period $slow_clock_period -waveform $sc_waveform \
      -name tessent_test_clock
  
  # Virtual force_pi clock, to comply with your timeplate "force_pi" specifications
    create_clock \
      -period $slow_clock_period -waveform $force_pi_waveform \
      -name tessent_virtual_force_pi
  
  # Virtual measure_po clock, to comply with your timeplate "measure_po" specifications
    create_clock \
      -period $slow_clock_period -waveform $measure_po_waveform \
      -name tessent_virtual_measure_po
  
  
}
proc tessent_set_ltest_non_modal {{logictest on}} {  
  
  global tessent_edt_mapping
  global scan_en_port_name
  global tessent_scan_en_setup_extra_cycles tessent_scan_en_hold_extra_cycles
  global edt_update_port_name
  global tessent_edt_update_setup_extra_cycles tessent_edt_update_hold_extra_cycles
  
  if {$logictest eq "off"} {
    tessent_set_ltest_disable all_test_x
    return
  }
  
  # Create ltest slow clocks
  tessent_set_ltest_create_clocks
  
  # Slow logictest clocks are exclusive to all other clocks
  set_clock_groups -physically_exclusive -name ltest_clocks \
                   -group [list tessent_virtual* tessent_test_clock]
  
  # Constrain ltest ports
  tessent_set_ltest_set_pin_delays
  
  
  # scan_enable
  # You can time your scan_enable and edt_update signals by leaving them toggling in
  # synthesis/layout, at the cost of enabling many shift_clock-based false capture paths.
  # Otherwise, you can tie your scan_enable to its inactive value in your master script.
  set setup [expr $tessent_scan_en_setup_extra_cycles+1]
  set hold  [expr $tessent_scan_en_setup_extra_cycles + $tessent_scan_en_hold_extra_cycles]
  set_multicycle_path -setup $setup -from [tessent_get_ports $scan_en_port_name]
  set_multicycle_path -hold  $hold  -from [tessent_get_ports $scan_en_port_name]
  
  # edt_update
  set setup [expr $tessent_edt_update_setup_extra_cycles+1]
  set hold  [expr $tessent_edt_update_setup_extra_cycles + $tessent_edt_update_hold_extra_cycles]
  set_multicycle_path -setup $setup -from [tessent_get_ports $edt_update_port_name]
  set_multicycle_path -hold  $hold  -from [tessent_get_ports $edt_update_port_name]
  
  # Relax clock mux timing in On-Chip clock controllers (OCCs)
  tessent_set_ltest_occ
  
  # This OCC path is only valid in scan shift mode
  set  non_scan_clocks [remove_from_collection [all_clocks] [tessent_get_clocks "tessent_virtual* tessent_test_clock"]]
  if {[sizeof_collection $non_scan_clocks]} {
    set_false_path -from $non_scan_clocks -to [tessent_get_cells {
      picorv32_rtl1_tessent_occ_clk_inst/occ_control/scan_out*
    }]
    set_false_path -to $non_scan_clocks -from [tessent_get_cells {
      picorv32_rtl1_tessent_occ_clk_inst/occ_control/scan_out*
    }]
    set_false_path -from $non_scan_clocks -through [tessent_get_pins {
      picorv32_rtl1_tessent_occ_clk_inst/tessent_persistent_cell_scan_in_buf/y
    }]
  }
  
  # Relax hold time check from low power hold registers
  set_multicycle_path -hold 1 \
      -from [tessent_get_cells $tessent_edt_mapping(edt_inst0)/picorv32_rtl1_tessent_edt_c1_controller_i/low_power_shift_controller_i/low_power_hold_reg*] 
  # Match hold MCP with a setup MCP in case a broader MCP is applied
  set_multicycle_path -setup 1 \
      -from [tessent_get_cells $tessent_edt_mapping(edt_inst0)/picorv32_rtl1_tessent_edt_c1_controller_i/low_power_shift_controller_i/low_power_hold_reg*] 
  
  
  
}
proc tessent_set_non_modal {{logictest "on"}} {
  tessent_set_ltest_non_modal $logictest
}
proc tessent_set_ltest_occ {} {  
  global tessent_timing_tool
  
  # Scan_en toggles these OCC mux 'select' pin between load_unload and capture phases. 
  # Because their fast clock 'input0' pin is tied to zero during the switch, such  
  # mux end-up behaving like AND gates (scan_en & test_clock) and can be timed that way,
  # with a 'set_clock_gating_check -high' command.
  set mux_coll [tessent_get_cells {
    picorv32_rtl1_tessent_occ_clk_inst/tessent_persistent_cell_clock_out*_mux
    picorv32_rtl1_tessent_occ_clk_inst/occ_control/tessent_persistent_cell_SHIFT_REG_CLK*_mux
  }]
  foreach_in_collection mux $mux_coll {
    # Skip over RTL cells
    if {$tessent_timing_tool in {dc_shell pt_shell} && [get_attribute $mux is_hierarchical] eq "true"} {
        continue
    } elseif {$tessent_timing_tool in {genus encounter} && [get_property $mux obj_type] eq "hinst" } {
        continue
    }
  set_clock_gating_check -high $mux
  }
  
  
}
proc tessent_set_ltest_modal_shift {} {  
  
  global tessent_edt_mapping
  global scan_en_port_name
  
  # Create clocks and set input/output delays for ports
  tessent_set_ltest_create_clocks
  # Set input/output delays for ports
  tessent_set_ltest_set_pin_delays
  
  # Forcing scan_en active allows timing all shift paths 
  # while blocking all intra or inter domain capture paths.
  set_case_analysis 1 [tessent_get_ports $scan_en_port_name]
  
  # Relax clock mux timing in On-Chip clock controllers (OCCs)
  tessent_set_ltest_occ
  
  # edt_inst0.edt_configuration:
    set_false_path -through [tessent_get_pins $tessent_edt_mapping(edt_inst0)/tessent_persistent_cell_edt_configuration_buf/y]
  # edt_inst0.edt_low_power_shift_en:
    set_false_path -through [tessent_get_pins $tessent_edt_mapping(edt_inst0)/tessent_persistent_cell_edt_low_power_shift_en_buf/y]
  
  # Relax hold time check from low power hold registers
  set_multicycle_path -hold 1 \
      -from [tessent_get_cells $tessent_edt_mapping(edt_inst0)/picorv32_rtl1_tessent_edt_c1_controller_i/low_power_shift_controller_i/low_power_hold_reg*] 
  # Match hold MCP with a setup MCP in case a broader MCP is applied
  set_multicycle_path -setup 1 \
      -from [tessent_get_cells $tessent_edt_mapping(edt_inst0)/picorv32_rtl1_tessent_edt_c1_controller_i/low_power_shift_controller_i/low_power_hold_reg*] 
  
  
  
}
proc tessent_set_ltest_modal_edt_fast_capture {} {  
  
  global tessent_edt_mapping
  global scan_en_port_name
  
  
  # Block all shift-only paths
  set_case_analysis 0 [tessent_get_ports $scan_en_port_name]
  
  # Relax clock mux timing in On-Chip clock controllers (OCCs)
  tessent_set_ltest_occ
  
  # Define the 'tessent_block_edt_bypass_in_fast_capture' global variable in your calling script
  # if you want to block the chain concatenation timing paths, which may exist at-speed if
  # the destination chain SI flop keeps shifting during capture. That should normally not happen
  # when using Tessent scan insertion tools, but if these paths do exist in your design
  # and you don't intend running edt_bypass mode along with fast_capture, then apply the
  # constraints below.
  global tessent_block_edt_bypass_in_fast_capture
  if {[info exists tessent_block_edt_bypass_in_fast_capture]} {
    # edt_inst0.edt_bypass:
      set_case_analysis 0 [tessent_get_pins $tessent_edt_mapping(edt_inst0)/tessent_persistent_cell_edt_bypass_buf/y]
  }
  
  # edt_inst0.channels_out*:
    set_false_path -through [tessent_get_pins $tessent_edt_mapping(edt_inst0)/tessent_persistent_cell_edt_channels_out_*_buf/y]
  
  
}
proc tessent_set_ltest_modal_edt_slow_capture {} {  
  
  global tessent_edt_mapping
  global tessent_scan_input_delay tessent_scan_output_delay
  global scan_en_port_name
  global tessent_scan_en_setup_extra_cycles tessent_scan_en_hold_extra_cycles
  global edt_update_port_name
  global tessent_edt_update_setup_extra_cycles tessent_edt_update_hold_extra_cycles
  
  # Create clocks and set input/output delays for ports
  tessent_set_ltest_create_clocks
  # Set input/output delays for ports
  set scan_inports   [remove_from_collection [all_inputs] [tessent_get_ports {test_clock_w clk}]]
  set_input_delay  $tessent_scan_input_delay   -clock tessent_virtual_force_pi $scan_inports
  set_output_delay $tessent_scan_output_delay  -clock tessent_virtual_measure_po [all_outputs]
  
  # In slow capture mode, tessent_test_clock propagates to all your scan flops, through sub-trees made of
  # your individual functional clock domains. Depending on whether your layout tool has balanced your
  # whole test_clock fanout and whether you want to declare some clock domain combinations as compatible,
  # you may or may not have to relax the hold for some capture paths. This edt_slow_capture proc assumes
  # you don't want to stress the hold across any domain, so it adds a 1-cycle hold margin for all
  # same-edge test_clock timing paths. Retimed paths are not relaxed: those might represent either
  # cross-domain scan lockup latches or intentionally retimed capture cross-domain paths.
  # Setup check is always preserved as one cycle of tessent_test_clock.
  # Set the following variable to 1 in your master SDC script if you want to skip that hold MCP:
  global tessent_time_hold_in_slow_capture
  if {!([info exists tessent_time_hold_in_slow_capture] && $tessent_time_hold_in_slow_capture == 1)} {
    set_multicycle_path -hold 1 -rise_from [tessent_get_clocks tessent_test_clock] -rise_to [tessent_get_clocks tessent_test_clock]
    set_multicycle_path -hold 1 -fall_from [tessent_get_clocks tessent_test_clock] -fall_to [tessent_get_clocks tessent_test_clock]
  }
  
  # scan_enable
  set setup [expr $tessent_scan_en_setup_extra_cycles+1]
  set hold  [expr $tessent_scan_en_setup_extra_cycles + $tessent_scan_en_hold_extra_cycles]
  set_multicycle_path -setup $setup -from [tessent_get_ports $scan_en_port_name]
  set_multicycle_path -hold  $hold  -from [tessent_get_ports $scan_en_port_name]
  
  # edt_update
  set setup [expr $tessent_edt_update_setup_extra_cycles+1]
  set hold  [expr $tessent_edt_update_setup_extra_cycles + $tessent_edt_update_hold_extra_cycles]
  set_multicycle_path -setup $setup -from [tessent_get_ports $edt_update_port_name]
  set_multicycle_path -hold  $hold  -from [tessent_get_ports $edt_update_port_name]
  
  # Relax clock mux timing in On-Chip clock controllers (OCCs)
  tessent_set_ltest_occ
  
  
  # Relax hold time check from low power hold registers
  set_multicycle_path -hold 1 \
      -from [tessent_get_cells $tessent_edt_mapping(edt_inst0)/picorv32_rtl1_tessent_edt_c1_controller_i/low_power_shift_controller_i/low_power_hold_reg*] 
  # Match hold MCP with a setup MCP in case a broader MCP is applied
  set_multicycle_path -setup 1 \
      -from [tessent_get_cells $tessent_edt_mapping(edt_inst0)/picorv32_rtl1_tessent_edt_c1_controller_i/low_power_shift_controller_i/low_power_hold_reg*] 
  
  
  
}
proc tessent_set_ltest_modal_edt_shift {} {  
  global tessent_edt_mapping
  
  tessent_set_ltest_modal_shift
  # edt_inst0.edt_bypass:
    set_case_analysis 0 [tessent_get_pins $tessent_edt_mapping(edt_inst0)/tessent_persistent_cell_edt_bypass_buf/y]
  
  
}
proc tessent_set_ltest_modal_bypass_shift {} {  
  global tessent_edt_mapping
  
  tessent_set_ltest_modal_shift
  # edt_inst0.edt_bypass:
    set_case_analysis 1 [tessent_get_pins $tessent_edt_mapping(edt_inst0)/tessent_persistent_cell_edt_bypass_buf/y]
  
  
}
proc tessent_set_ltest_disable {{mode all_test_on}} {  
  
  # Invoke this proc when running modal signoff STA checks in any other modes than edt or lbist.
  # It turns all ltest-related DftSignals off and disables your logicbist controller when present.
  # It also prevents tessent_tck from propagating to functional domains.
  global tessent_clock_mapping
  
  global tessent_edt_mapping
  # Turn off all logictest-related dft_signals.
  tessent_picorv32_set_dft_signals $mode
  
  # Prevent tessent_tck from propagating to functional domains and avoid bogus clock gating check warnings.
  set_disable_clock_gating_check [tessent_get_cells {picorv32_rtl1_tessent_occ_clk_inst/tessent_persistent_cell_clock_out*_mux}]
  
  
}
proc tessent_set_ltest_set_pin_delays {} {  
  
  global tessent_scan_input_delay tessent_scan_output_delay
  global scan_en_port_name edt_update_port_name
  
  # scan_enable
    set_input_delay  $tessent_scan_input_delay -add -clock tessent_virtual_force_pi [tessent_get_ports $scan_en_port_name]
  
  # edt_update
    set_input_delay  $tessent_scan_input_delay -add -clock tessent_virtual_force_pi [tessent_get_ports $edt_update_port_name]
  
  
  global tessent_edt_channel_in_ports_list
  global tessent_edt_channel_out_ports_list
  
  foreach port $tessent_edt_channel_in_ports_list {
    set_input_delay $tessent_scan_input_delay  -add -clock tessent_virtual_force_pi [tessent_get_ports $port]
  }
  foreach port $tessent_edt_channel_out_ports_list {
    set_output_delay $tessent_scan_output_delay -add -clock tessent_virtual_measure_po [tessent_get_ports $port]
  }
  # OCC fast_capture_mode:
    set_false_path -from [tessent_get_ports fast_capture_mode]
  # OCC test_mode:
    set_false_path -from [tessent_get_ports test_mode]
  
  
}
proc tessent_get_cts_skew_groups_dict {} {  
  
  # This proc returns a dictionary of information for clock tree synthesis.
  # Use it in your CTS script, along with your proper tool commands.
  # CTS stop pins indicate clock endpoints to be balanced during CTS.
  # CTS exclude pins indicate branches of a clock tree that should be excluded from CTS.
  # CTS root pins indicate points at which new CTS clock trees should be started.
  #   The CTS root pins listed for a specific SSH instance should all be included in the
  #   same skew group so that this group of clocks is balanced together.
  # In Synopsys ICC, invoke:
  #     set_clock_tree_exceptions -stop_pins    <stop_pin>
  #     set_clock_tree_exceptions -exclude_pins <exclude_pin>
  # In Cadence Innovus, invoke:
  #     modify_ccopt_skew_group -add_sinks <stop_pin>  -skew_group <group_name>
  #     create_ccopt_skew_group -sources <exclude_pin> -auto_sinks -skew_group <group name>
  # The effect of these commands is:
  # * In the OCC we add exclude_pins to prevent adding delay buffers to the small OCC internal clock tree, due to
  #   balancing with all flops in the OCC fanout, therefore helping the OCC clock enable signals meet setup timing.
  #
  # You can use the dictionary the following way:
  #    set cts_skew_groups_dict [tessent_get_cts_skew_groups_dict]
  #    dict for {skew_group sub_dict} $cts_skew_groups_dict {
  #      dict with sub_dict {
  #        foreach pin $cts_exclude_pins {
  #           puts "$skew_group : $dc_instance/$pin"
  #           <insert your CTS command here>
  #        }
  #        foreach pin $cts_stop_pins {
  #           puts "$skew_group : $dc_instance/$pin"
  #           <insert your CTS command here>
  #        }
  #      }
  #      unset -nocomplain cts_exclude_pins cts_stop_pins
  #    }
  set return_dict {
    cts_skew_group(occ0) {
      dc_instance      picorv32_rtl1_tessent_occ_clk_inst
      cts_exclude_pins {occ_control/tessent_persistent_cell_ltest_ntc_sync_cell/clk occ_control/tessent_persistent_cell_cgc_SHIFT_REG_CLK/clk occ_control/tessent_persistent_cell_SHIFT_REG_CLK_mux/b}
    }
  }
  return $return_dict
  
  
}
proc tessent_picorv32_set_dft_signals {{mode reset}} {
#
# Force all dft_signal sources to either their reset or all_test value when applicable.
#   argument mode :== reset | all_test_on | all_test_x
#
  set_case_analysis 0 [tessent_get_ports scan_en_w]
  set_case_analysis 0 [tessent_get_ports edt_update]

}
proc tessent_get_cells {path_list args} {
  set actualArgs [list]
  set silent 0
  set cell_col {}
  set warning_list [list]
  foreach argValue $args {
    if { $argValue eq "" } { continue }
    if { $argValue eq "-silent" } { set silent 1; continue }
    lappend actualArgs $argValue
  }
  if { [llength $path_list] == 0 && [lsearch $actualArgs "-of_objects"] > -1 } {
    set cell_col_tmp [get_cells {*}$actualArgs -quiet]
    if {[sizeof_collection $cell_col_tmp] > 0} {
      append_to_collection cell_col $cell_col_tmp -unique
    } else {
      lappend warning_list "Tessent SDC warning: Cell was not found using $actualArgs"
    }
  }
  # Quietly try verilog syntax first. If not found, try VHDL remapping
  foreach path $path_list {
    set cell_col_tmp [get_cells [list [tessent_map_to_verilog $path]] {*}$actualArgs -quiet]
    if { [sizeof_collection $cell_col_tmp] == 0 && [regexp {%TSSEP%} $path]} {
      # try a partially ungrouped path with known markers
      set cell_col_tmp [get_cells [list [tessent_map_to_verilog $path -mappings [list {%TSSEP%} {?}]]] {*}$actualArgs -quiet]
    } 
    if { [sizeof_collection $cell_col_tmp] == 0 } {
      set cell_col_tmp [get_cells [tessent_map_to_verilog [tessent_remap_vhdl_path_list [list $path]]] {*}$actualArgs -quiet]
    } 
    if {[sizeof_collection $cell_col_tmp] > 0} {
      append_to_collection cell_col $cell_col_tmp -unique
    } else {
      lappend warning_list "Tessent SDC warning: Cell was not found with pattern '${path}'"
    }
  }
  if {[sizeof_collection $cell_col] > 0} {
    if {[llength $warning_list] > 0 && !$silent} {
      puts [join $warning_list "\n"]
    }
    return $cell_col
  } elseif {!$silent} {
    puts "Tessent SDC error: No cell found with pattern(s) '${path_list}'"
  }
  return

}
proc tessent_get_flops {path_list args} {
  global tessent_timing_tool
  set cell_col [tessent_get_cells $path_list {*}$args]
  
  if {[sizeof_collection $cell_col] == 0} {return {}}

  switch -- $tessent_timing_tool {
    encounter {set flop_col [filter sequential true $cell_col]}
    default   {set flop_col [filter_collection $cell_col "is_sequential == true"]}
  }

  return $flop_col
 
}
proc tessent_get_pins {path_list args} {
  global tessent_timing_tool
  set pin_col {}
  set actualArgs [list]
  set silent 0
  set hierarchical ""
  set warning_list [list]
  foreach argValue $args {
    if { $argValue eq "" } { continue }
    if { $argValue eq "-silent" } { set silent 1; continue }
    if { [regexp {^-hier(archical)?$} $argValue] } { set hierarchical "-hierarchical"; continue }
    lappend actualArgs $argValue
  }
  switch -- $tessent_timing_tool {
    pt_shell {set pin_name_attribute "lib_pin_name"}
    default  {set pin_name_attribute "name"}
  }
  foreach path $path_list {
    set pin_sep_index [string last / $path]
    set mapped_cells [tessent_get_cells [list [string range $path 0 [expr $pin_sep_index - 1]]] -silent {*}$hierarchical]
    if {[sizeof_collection $mapped_cells] > 0} {
      set pin_col_tmp [get_pins -of_objects $mapped_cells -filter "$pin_name_attribute =~ [string range $path [expr $pin_sep_index + 1] end]" {*}$actualArgs -quiet]
    } else {
      set pin_col_tmp {}
    }
    if {[sizeof_collection $pin_col_tmp] > 0} {
      append_to_collection pin_col $pin_col_tmp -unique
    } else {
      lappend warning_list "Tessent SDC warning: Pin was not found with pattern '${path}'"
    }
  }
  if {[sizeof_collection $pin_col] > 0} {
    if {[llength $warning_list] > 0 && !$silent} {
      puts [join $warning_list "\n"]
    }
    return $pin_col
  } elseif {!$silent} {
    puts "Tessent SDC error: No pin found with pattern(s) '${path_list}'"
  }
  return

}
proc tessent_get_ports {args} {
  global tessent_timing_tool
  set actualArgs [list]
  set silent 0
  set warning_list [list]
  set port_patterns [list *]
  set argNb 1
  foreach argValue $args {
    if { $argValue eq "-silent" } { set silent 1; continue }
    if { $argNb == 1 } {
      set port_patterns $argValue
    } else {
      lappend actualArgs $argValue
    }
    incr argNb
  }
  # Quietly try verilog syntax first. If not found, try advanced remapping
  set port_col {}
  foreach port_pattern $port_patterns {
    set port_col_tmp [get_ports [list [tessent_map_to_verilog $port_pattern]] {*}$actualArgs -quiet]
    if { [sizeof_collection $port_col_tmp] == 0 } {
      set port_col_tmp [get_ports [tessent_map_to_verilog [tessent_remap_vhdl_path_list [list $port_pattern] -type ports]] {*}$actualArgs -quiet]
    } 
    if {[sizeof_collection $port_col_tmp] > 0} {
      append_to_collection port_col $port_col_tmp -unique
    } else {
      lappend warning_list "Tessent SDC warning: Port was not found with pattern '${port_pattern}'"
    }
  }
  set sc [sizeof_collection $port_col]
  if {$sc > 0} {
    if {[llength $warning_list] > 0 && !$silent} {
      puts [join $warning_list "\n"]
    }
    if {$sc == 1 && $tessent_timing_tool eq "oasys"} {
      return [index_collection $port_col 0]
    } else {
      return $port_col
    }
  } elseif {!$silent} {
    puts "Tessent SDC error: No port found with pattern(s) '${port_patterns}'"
  }
  return
  
}
proc tessent_map_to_verilog {path_list args} {
  global tessent_hierarchy_separator tessent_custom_mapping_regsub

  set ARGS(-mappings) [list]
  array set ARGS $args

  set mapped_paths $path_list
  if {[array size tessent_custom_mapping_regsub] > 0} {
    foreach custom_re [array names tessent_custom_mapping_regsub] {
      set mapped_paths [regsub -all $custom_re $mapped_paths $tessent_custom_mapping_regsub($custom_re)]
    }
  }
  array set map_array {
    [ ?
    ] ?
    ) ?
    ( ?
    . ?
    - ?
  }
  set map_array(%TSSEP%) $tessent_hierarchy_separator
  if {$tessent_hierarchy_separator ne "/"} {
    set map_array(/) $tessent_hierarchy_separator
  }
  if {[string is list $ARGS(-mappings)]} {
    array set map_array $ARGS(-mappings)
  }
  set mapped_paths [string map [array get map_array] $mapped_paths]
  return $mapped_paths
  
}
proc tessent_remap_vhdl_path_list {path_list args} {
  global tessent_path_cache
  set remapped_path_list [list]
  array set ARGS {
    -type cells
  }
  array set ARGS $args
  set type $ARGS(-type)
  set get_cmd "get_${type}"
  foreach path $path_list {
    # Check if we have that full path cached
    if {[info exists tessent_path_cache($path)]} {
      set pathMapped $tessent_path_cache($path)
    } else {
      set pathMapped ""
      set pathUnmapped ""
      foreach sub_path [split $path "/"] {
        if {$pathUnmapped eq ""} {
          set slash ""
        } else {
          set slash "/"
        }
        append pathUnmapped $slash $sub_path
        # Problematic paths are the following:
        #   - Paths with unrolled VHDL generate loops
        #   - non-standard change names that would trim the trailing underscore of multi-bit register names
        #   - Complex ports in some timing tools

        # Check if we have that hiercarchy cached
        if {[info exists tessent_path_cache($pathUnmapped)]} {
          set pathMapped $tessent_path_cache($pathUnmapped)
          continue
        }
        append pathMapped $slash $sub_path
        # If for port, go straight into Complex ports mapping
        if {$type eq "ports"} {
          # Some timing tools address complex identifiers like Tessent Shell: <id>.<id> 
          # Some other timing tools address those same complex construct like this <id>[<id>]
          # Try to exclude indexes from identifier as is bus was intact
          #     i.s. <id>.<id>[n] -> <id>[id][n]
          set pathMappedTemp [regsub -all {\.([^\.\[]+)} $pathMapped {[\1]}]
          if {[sizeof_collection [$get_cmd -quiet [tessent_map_to_verilog $pathMappedTemp]]] > 0} {
            set pathMapped $pathMappedTemp
            set tessent_path_cache($pathUnmapped) $pathMapped
            continue
          }
          # Try to include indexes as part of a full "escaped" identifier 
          #     i.e. <id>.<id>[n] -> <id>[<id>[n]]
          set pathMappedTemp [regsub -all {\.([^\.]+)} $pathMapped {[\1]}]
          if {[sizeof_collection [$get_cmd -quiet [tessent_map_to_verilog $pathMappedTemp]]] > 0} {
            set pathMapped $pathMappedTemp
            set tessent_path_cache($pathUnmapped) $pathMapped
            continue
          }
          # rest of the mappings are for cells
          continue
        }
        # Try verilog first on this hierarchy
        if {[sizeof_collection [$get_cmd -quiet [tessent_map_to_verilog $pathMapped]]] > 0} {
          set tessent_path_cache($pathUnmapped) $pathMapped
          continue
        }
        # Unrolled VHDL loop from HDLE - closing bracket of a generate loop identifier was removed
        set pathMappedTemp [regsub {[\])]\.} $pathMapped {.}]
        if {[sizeof_collection [$get_cmd -quiet [tessent_map_to_verilog $pathMappedTemp]]] > 0} {
          set pathMapped $pathMappedTemp
          set tessent_path_cache($pathUnmapped) $pathMapped
          continue
        }
        # Identifier that would simply have had its last character trimmed
        #   This would be an underscore, adding '?' to support some pre-mapped paths in constraints
        set pathMappedTemp [regsub {[\]\?]$} $pathMapped {}]
        if {[sizeof_collection [$get_cmd -quiet [tessent_map_to_verilog $pathMappedTemp]]] > 0} {
          set pathMapped $pathMappedTemp
          set tessent_path_cache($pathUnmapped) $pathMapped
          continue
        }
      }
    }
    lappend remapped_path_list $pathMapped 
  }
  return $remapped_path_list

}
proc tessent_remove_clock_groups {group_type group_name_list} {
  global tessent_timing_tool tessent_tck_clocks_group_created
  if {!$tessent_tck_clocks_group_created} {return}
  switch -- $tessent_timing_tool {
    dc_shell  {remove_clock_groups $group_type $group_name_list; set tessent_tck_clocks_group_created 0}
    pt_shell  {remove_clock_groups $group_type -name $group_name_list; set tessent_tck_clocks_group_created 0}
    encounter {#remove_clock_groups command does not exist}
    genus     {#remove_clock_groups command does not exist}
    default   {#do not assume remove_clock_groups exists}
  }
 
}
proc tessent_get_clock_source {clk} {
  global tessent_timing_tool
  set clockSource0 ""
  switch -- $tessent_timing_tool {
    encounter {set clockSource0 [lindex [get_attribute sources [tessent_get_clocks $clk]] 0]}
    genus     {set clockSource0 [lindex [get_db [tessent_get_clocks $clk] .sources] 0]}
    default   {set clockSource0 [index_collection [get_attribute [tessent_get_clocks $clk] sources] 0]}
  }
  return $clockSource0
 
}
proc tessent_set_clock_sense_stop_propagation {clk pin} {
  global tessent_timing_tool
  if {$tessent_timing_tool in {genus encounter}} {
    set target $pin
  } else {
    set cell_name [regsub {/[^/]*$} [get_attribute $pin full_name] {}]
    set cell [tessent_get_cells $cell_name]
    if {![get_attribute $cell is_hierarchical]} {
      set target $pin
    } else {
      set target ""
      foreach_in_collection ipin [tessent_get_pins [get_attribute $cell full_name]/*/*] {
        if {[get_attribute $ipin direction] eq "in" && [get_attribute [all_connected $ipin] full_name] eq [get_attribute $pin full_name]} {
          append_to_collection target $ipin
        }
      }
      if {[sizeof_collection $target] > 0} {
        puts "Tessent SDC note: Hierarchical pin '[get_attribute $pin full_name]' maps to libcell pin(s) [join [get_attribute $target full_name] ,]."
      } else {
        puts "Tessent SDC error: Failed to map hierarchical pin '[get_attribute $pin full_name]' to libcell pin."
        return
      }
    }
  }
  if {$tessent_timing_tool eq "pt_shell"} {
    set_sense -type clock -clocks $clk -stop_propagation $target
  } else {
    set_clock_sense -clocks $clk -stop_propagation $target
  }
 
}
proc tessent_kill_functional_paths {{verbose OFF}} {

  global ClockSeqCellModuleRegExp ClockSeqCellInstanceRegExp
  global CreateDisabledFlopsReport
  global tessent_test_inst_regexp
  global tessent_clock_mapping tessent_unmapped_functional_clocks
  set funcFlops {}
  set mapped_functional_clocks [list]
  foreach clk $tessent_unmapped_functional_clocks {
    lappend mapped_functional_clocks $tessent_clock_mapping($clk)
  }
  if {[llength $mapped_functional_clocks] == 0} {return}
  foreach_in_collection clk [tessent_get_clocks $mapped_functional_clocks] {
      set funcFlops [add_to_collection $funcFlops [all_registers -clock $clk]]
  }
  
  set funcFlops [filter_collection $funcFlops -regexp full_name!~"$tessent_test_inst_regexp"]
  
  # Exclude memory cell instances and their collar flops
  
  set funcFlops [remove_from_collection $funcFlops [ list  ]]

  if {[sizeof_collection $funcFlops] > 0} {
    puts "\n##################### Disabling timing to all functional registers #############################"

    set use_set_disable_timing 0
 
    # Exclude clock gating sequential cells by their module name, if needed
    if [info exists ClockSeqCellModuleRegExp] {
      set excludeRegExp "ref_name=~\"${ClockSeqCellModuleRegExp}\""
      set CScells [filter_collection $funcFlops -regexp $excludeRegExp]
      puts "\nExcluding sequential clock cells instances: "
      foreach_in_collection flop $CScells {
         set flopName [get_attribute $flop full_name]
         puts "     $flopName"
      }
      set funcFlops [remove_from_collection $funcFlops $CScells]
      set use_set_disable_timing 1
    }
 
    # Exclude clock gating sequential cells by their instance name, if needed
    if [info exists ClockSeqCellInstanceRegExp] {
      set excludeRegExp "full_name=~\"${ClockSeqCellInstanceRegExp}\""
      set ClockCells [filter_collection $funcFlops -regexp $excludeRegExp]
      puts "\nExcluding instances: "
      foreach_in_collection flop $ClockCells {
         set flopName [get_attribute $flop full_name]
         puts "     $flopName"
      }
      set funcFlops [remove_from_collection $funcFlops $ClockCells]
      set use_set_disable_timing 1
    }
 
    # Disable all flops in $funcFlops
    set funcFlops [sort_collection $funcFlops full_name]
    if {$use_set_disable_timing} {
        puts "Disabling functional registers with a set_disable_timing command:"
    } else {
        puts "Disabling functional registers with a set_false_path -to command:"
    }
    foreach_in_collection flop $funcFlops {
        set flopName [get_attribute $flop full_name]
        if {$verbose == "ON"} {
            puts "Disabling register: $flopName"
        }
        if {$use_set_disable_timing} {
            set_disable_timing [tessent_get_pins $flopName/*]
        } else {
            set_false_path -to [tessent_get_cells $flopName]
        }
    }
 

    # Create report file
    if {[info exists CreateDisabledFlopsReport]} {
        puts "\ntessent_kill_functional_paths: Creating report file \"DisabledFunctionalFlops.report\". \n"
        redirect DisabledFunctionalFlops.report {
            foreach_in_collection flop $funcFlops {
                set flopName [get_attribute $flop full_name]
                puts "$flopName"
            }
        }
    }
 
  }
  
}
proc tessent_get_mem_cells {inpath} {
  set out_cells [tessent_get_cells $inpath]
  foreach_in_collection cell $out_cells {
    if {[get_attribute $cell is_hierarchical] eq "true"} {
      set cell_path [get_attribute $cell full_name]
      if {[sizeof_collection [get_cells -quiet "$cell_path/*"]]>0} {
        set out_cells [add_to_collection $out_cells [tessent_get_mem_cells "$cell_path/*"]]
      }
    }
  }
  return [filter_collection $out_cells "is_sequential==true"]
  
}
proc tessent_get_clocks {patternList args} {
  # Genus does not support more than one <pattern> for 'get_clocks <pattern>'
  set C {}
  foreach p $patternList {
    append_to_collection C [get_clocks $p {*}$args] -unique
  }
  return $C
 
}
proc tessent_get_preserve_instances {select} {
  # The 'select' argument identifies a list of instances to be returned.
  # The instances must be preserved in the post-synthesis netlist in order to perform further actions on it:
  #   add_core_instances
  #   scan_insertion       superset of 'add_core_instances' list
  #   icl_extract          superset of 'scan_insertion' list

  set persistent_design_instance_glob_list {
    tessent_persistent_cell_*
  }

  set scan_instrument_instance_list {
    picorv32_rtl1_tessent_occ_clk_inst
    picorv32_rtl1_tessent_edt_c1_inst
  }

  set scan_related_instance_list {
  }

  set tcd_scan_instance_list {
  }

  set non_scan_instance_list {
  }

  set icl_design_instance_list {
  }

  set keyList [list add_core_instances scan_insertion icl_extract]
  set concatDict {
    add_core_instances { persistent_design_instance_glob_list scan_instrument_instance_list scan_related_instance_list }
    scan_insertion     { tcd_scan_instance_list non_scan_instance_list }
    icl_extract        { icl_design_instance_list }
  }
  set instanceColl {}
  # Nothing to return when 'select' is unknown
  if { [lsearch -exact $keyList $select] < 0 } {
    return $instanceColl
  }
  # Assemble a superset list depending on the 'select' value
  # based on the list of list of variables names to concatenate
  # for each 'select' value.
  foreach {validSelect concatVarnameList} $concatDict {
    foreach concatVarname $concatVarnameList {
      set getCellsArg [expr {[string match *_glob_list $concatVarname] ? "-hierarchical" : ""}]
      foreach instancePattern [set $concatVarname] {
        append_to_collection instanceColl [tessent_get_cells $instancePattern -filter {is_hierarchical==true} $getCellsArg -silent] -unique
      }
    }
    if { $select eq $validSelect } {
      break
    }
  }
  return $instanceColl

}
proc tessent_get_size_only_instances {} {
  set persistent_cell_instance_glob_list {
    tessent_persistent_cell_*
  }

  set instanceColl {}
  foreach instancePattern $persistent_cell_instance_glob_list {
    append_to_collection instanceColl [get_cells $instancePattern -filter {is_hierarchical==false} -hierarchical -quiet] -unique
  }

  return $instanceColl
}
proc tessent_get_optimize_instances {} {
  set optimize_instance_list {
    picorv32_rtl1_tessent_edt_c1_inst/picorv32_rtl1_tessent_edt_c1_bypass_logic_i
    picorv32_rtl1_tessent_edt_c1_inst/picorv32_rtl1_tessent_edt_c1_compactor_i
    picorv32_rtl1_tessent_edt_c1_inst/picorv32_rtl1_tessent_edt_c1_controller_i
    picorv32_rtl1_tessent_edt_c1_inst/picorv32_rtl1_tessent_edt_c1_decompressor_i
    picorv32_rtl1_tessent_occ_clk_inst/occ_control
  }

  set instanceColl {}
  foreach instancePattern $optimize_instance_list {
    append_to_collection instanceColl [tessent_get_cells $instancePattern -silent]
  }
  return $instanceColl

}

# Provide pre-2021.2 tessent-shell plugin proc mapping to 2021.3 convention, 
# so as to maintain backward-compatibility with older customer scripts.
set tessent_old_2_new_proc_name_mapping {
  {tessent_constrain_picorv32_mentor_ltest_modal_edt_shift tessent_set_ltest_modal_edt_shift no}
  {tessent_constrain_picorv32_mentor_ltest_non_modal tessent_set_ltest_non_modal yes}
  {tessent_constrain_picorv32_mentor_ltest_modal_edt_slow_capture tessent_set_ltest_modal_edt_slow_capture no}
  {tessent_constrain_picorv32_mentor_ltest_modal_edt_fast_capture tessent_set_ltest_modal_edt_fast_capture no}
  {tessent_constrain_picorv32_mentor_ltest_create_clocks tessent_set_ltest_create_clocks no}
  {tessent_constrain_picorv32_mentor_ltest_modal_bypass_shift tessent_set_ltest_modal_bypass_shift no}
  {tessent_constrain_picorv32_mentor_ltest_set_pin_delays tessent_set_ltest_set_pin_delays no}
  {tessent_constrain_picorv32_mentor_ltest_occ tessent_set_ltest_occ no}
  {tessent_constrain_picorv32_mentor_ltest_set_timing_variables_default tessent_set_ltest_set_timing_variables_default no}
  {tessent_constrain_picorv32_non_modal tessent_set_non_modal yes}
  {tessent_constrain_picorv32_mentor_ltest_modal_shift tessent_set_ltest_modal_shift no}
  {tessent_constrain_picorv32_mentor_ltest_disable tessent_set_ltest_disable yes}
}
foreach line $tessent_old_2_new_proc_name_mapping {
  lassign $line old_proc_name new_proc_name arguments
  if {$arguments eq "yes"} {
    proc $old_proc_name args "$new_proc_name {*}\$args"
  } else {
    proc $old_proc_name {} $new_proc_name
  }
}
    
