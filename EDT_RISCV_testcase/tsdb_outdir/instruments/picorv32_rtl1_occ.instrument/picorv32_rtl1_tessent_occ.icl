//--------------------------------------------------------------------------
//
//  Unpublished work. Copyright 2024 Siemens
//
//  This material contains trade secrets or otherwise confidential 
//  information owned by Siemens Industry Software Inc. or its affiliates 
//  (collectively, SISW), or its licensors. Access to and use of this 
//  information is strictly limited as set forth in the Customer's 
//  applicable agreements with SISW.
//
//--------------------------------------------------------------------------
//  File created by: Tessent Shell
//          Version: 2024.4
//       Created on: Thu Nov 20 12:09:51 EST 2025
//--------------------------------------------------------------------------

Module picorv32_rtl1_tessent_occ {
   ClockPort fast_clock {
     Attribute icl_extraction_port_trigger_list = "clock_out";
   }
   ToClockPort clock_out {
     Source fast_clock;
     Attribute exclude_from_sdc = "true";
   }
   DataInPort test_mode;
   DataInPort fast_capture_mode;
   DataInPort capture_cycle_width[1:0];
  
   Attribute keep_active_during_scan_test = "true";
   Attribute tessent_use_in_dft_specification = "false";
   Attribute tessent_instrument_type      = "mentor::occ";
   Attribute tessent_instrument_subtype   = "standard";
   Attribute tessent_instrument_container = "picorv32_rtl1_occ.instrument";
   Attribute tessent_signature            = "b5adf0884d4af6bed9d83ebb27448061";
}
 
 
