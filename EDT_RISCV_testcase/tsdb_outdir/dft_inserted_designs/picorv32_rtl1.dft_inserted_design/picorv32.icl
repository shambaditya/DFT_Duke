//-------------------------------------------------
//  File created by: Tessent Shell
//          Version: 2024.4
//       Created on: Thu Nov 20 12:09:56 EST 2025
//-------------------------------------------------


Module picorv32 {
   // Created by ICL extraction
   DataInPort capture_cycle_width_0 {
      Attribute tessent_use_in_dft_specification = "false";
   }
   DataInPort capture_cycle_width_1 {
      Attribute tessent_use_in_dft_specification = "false";
   }
   ClockPort clk {
      Attribute tessent_clock_domain_labels = "clk clk";
      Attribute tessent_clock_periods = "all 3.00ns";
   }
   DataInPort edt_bypass {
      Attribute tessent_no_input_constraints = "on";
   }
   DataInPort edt_configuration {
      Attribute tessent_no_input_constraints = "on";
   }
   DataInPort edt_low_power_shift_en {
      Attribute tessent_no_input_constraints = "on";
   }
   DataInPort fast_capture_mode {
      Attribute tessent_use_in_dft_specification = "false";
   }
   DataInPort test_mode {
      Attribute tessent_use_in_dft_specification = "false";
   }
   Attribute tessent_design_format = "verilog_2001";
   Attribute test_setup_procfile = "";
   Attribute icl_extraction_date = "Thu Nov 20 12:09:56 EST 2025";
   Attribute created_by_tessent_icl_extract = "true";
   Attribute tessent_design_id = "rtl1";
   Attribute tessent_design_level = "physical_block";
   Attribute tessent_is_physical_module = "true";
   Instance picorv32_rtl1_tessent_edt_c1_inst Of picorv32_rtl1_tessent_edt_c1 {
      InputPort edt_configuration = edt_configuration;
      InputPort edt_low_power_shift_en = edt_low_power_shift_en;
      InputPort edt_bypass = edt_bypass;
      Attribute tessent_design_instance = "picorv32_rtl1_tessent_edt_c1_inst";
   }
   Instance picorv32_rtl1_tessent_occ_clk_inst Of picorv32_rtl1_tessent_occ {
      InputPort fast_clock = clk;
      InputPort test_mode = test_mode;
      InputPort fast_capture_mode = fast_capture_mode;
      InputPort capture_cycle_width[1] = capture_cycle_width_1;
      InputPort capture_cycle_width[0] = capture_cycle_width_0;
      Attribute tessent_design_instance = "picorv32_rtl1_tessent_occ_clk_inst";
   }
}

// instanced as picorv32.picorv32_rtl1_tessent_edt_c1_inst
Module picorv32_rtl1_tessent_edt_c1 {
   // ICL module read from source on or near line 17 of file '/home/jh829/tessent_work/EDT_RISCV_testcase/tsdb_outdir/instruments/picorv32_rtl1_edt.instrument/picorv32_rtl1_tessent_edt_c1.icl'
   DataInPort edt_configuration {
      RefEnum ConfigTable;
      Attribute tessent_no_input_constraints = "on";
   }
   DataInPort edt_low_power_shift_en {
      RefEnum OnOffTable;
      Attribute tessent_no_input_constraints = "on";
   }
   DataInPort edt_bypass {
      RefEnum OnOffTable;
      Attribute tessent_no_input_constraints = "on";
   }
   Attribute keep_active_during_scan_test = "true";
   Attribute tessent_instrument_type = "mentor::edt";
   Attribute tessent_signature = "6561a5c2c34d7b5bf5b44574b3084f30";
   Enum ConfigTable {
      low_compression = 1'b0;
      high_compression = 1'b1;
   }
   Enum OnOffTable {
      off = 1'b0;
      on = 1'b1;
   }
}

// instanced as picorv32.picorv32_rtl1_tessent_occ_clk_inst
Module picorv32_rtl1_tessent_occ {
   // ICL module read from source on or near line 17 of file '/home/jh829/tessent_work/EDT_RISCV_testcase/tsdb_outdir/instruments/picorv32_rtl1_occ.instrument/picorv32_rtl1_tessent_occ.icl'
   ClockPort fast_clock {
      Attribute icl_extraction_port_trigger_list = "clock_out";
   }
   ToClockPort clock_out {
      Source fast_clock;
      Attribute exclude_from_sdc = "on";
   }
   DataInPort test_mode;
   DataInPort fast_capture_mode;
   DataInPort capture_cycle_width[1:0];
   Attribute keep_active_during_scan_test = "true";
   Attribute tessent_use_in_dft_specification = "false";
   Attribute tessent_instrument_type = "mentor::occ";
   Attribute tessent_instrument_subtype = "standard";
   Attribute tessent_instrument_container = "picorv32_rtl1_occ.instrument";
   Attribute tessent_signature = "b5adf0884d4af6bed9d83ebb27448061";
}
