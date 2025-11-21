//
// Verilog format test patterns produced by Tessent Shell 2024.4
// Filename       : patterns/picorv32_transition_serial.v
// Scan operation : SERIAL
// Idstamp        : 2024.4:26a7:c347:2:676a
// Fault          : TRANSITION
// Coverage       : 98.00(TC) 95.11(FC)
// Date           : Thu Nov 20 22:14:08 2025
//
// Begin_Verify_Section 
//   format            = Verilog 
//   top_module_name   = picorv32_picorv32_transition_serial_v_ctl 
//   serial_flag       = ON 
//   test_set_type     = EDT_ALL_TEST 
//   test_set_source   = SCAN_ATPG 
//   pad_value         = 0 
//   pattern_begin     = 0 
//   pattern_end       = 1 
//   one_setup         = ON 
//   no_initialization = ON 
//   pattern_checksum  = 59804 
//   edt_external      = ON 
// End_Verify_Section 
// Parameter File Keyword Settings 
//   SIM_KEEP_PATH             true ; 
// End Parameter File Keyword Settings 


`define SIM_INSTANCE_NAME picorv32_inst


`timescale 1ns / 100ps

module picorv32_picorv32_transition_serial_v_ctl;

integer     _wrote_fail;
integer     _write_DIAG_file;
integer     _DIAG_file_header;
integer     _diag_file;
integer     _diag_chain_header;
integer     _diag_scan_header;
integer     _last_fail_pattern;
integer     _fail_pattern_cnt;
integer     _write_MASK_file;
integer     _MASK_file_header;
integer     _mask_file;
integer     _par_shift_cnt;
integer     _chain_test_;
integer     _compare_fail;
integer     _bit_count;
integer     _report_bit_cnt;
integer     _miscompare_limit;
integer     _found_fail;
integer     _found_fail_per_cycle;
integer     _allow_bad_message_index;
reg[1:0]    _found_fail_obus;
integer     _end_vec_file_ok;
integer     _cycle_count, _save_cycle_count;
integer     _pattern_count, _repeat_count_nest[0:8], _repeat_count, _message_index;
integer     _index, _scan_index, _file_cnt, _max_index, _vec_pat_count, _save_index[0:8];
integer     _repeat_depth;
integer     _file_check;
integer     _run_testsetup;
integer     _in_testsetup;
integer     _start_pat;
integer     _end_pat;
integer     _end_after_setup;
integer     _no_setup;
integer     _save_state;
integer     _restart_state;
integer     _in_restart;
integer     _override_cfg;
integer     _in_range;
integer     _do_compare;
integer     _in_chaintest;
integer     _pat_num;
integer     _skipped_patterns;
integer     _end_simulation;
integer     _config_file;
integer     _fstat;
integer     _max_file_cnt;
reg[256*8:1] _vec_file_name;
reg[256*8:1] _cfg_file_name;
integer     _scan_shift_count;
reg[111:0]    _ibus;
reg[1:0]    _exp_obus, _msk_obus;
wire[1:0]   _sim_obus;
reg[2:0]    _pat_type;
reg         _tp_num;
reg         mgcdft_save_signal, mgcdft_restart_signal;
reg[124:0]   vect;

// Async clock generator registers
reg         _clock_generator0;
wire        clk;
assign  clk = _clock_generator0;
// Clock Monitoring
`define TESSENT_ENABLE_CLOCK_MONITOR
`ifdef MGC_DISABLE_CLOCK_MONITOR
  `undef TESSENT_ENABLE_CLOCK_MONITOR
`endif
`ifdef MGC_DISABLE_CLOCK_MONITOR_picorv32_transition_serial
  `undef TESSENT_ENABLE_CLOCK_MONITOR
`endif

`ifdef TESSENT_DISABLE_CLOCK_MONITOR
  `undef TESSENT_ENABLE_CLOCK_MONITOR
`endif
`ifdef TESSENT_DISABLE_CLOCK_MONITOR_picorv32_transition_serial
  `undef TESSENT_ENABLE_CLOCK_MONITOR
`endif

`ifdef MGC_CLOCK_MONITOR_CYCLES_picorv32_transition_serial
  `undef TESSENT_CLOCK_MONITOR_CYCLES
  `define TESSENT_CLOCK_MONITOR_CYCLES `MGC_CLOCK_MONITOR_CYCLES_picorv32_transition_serial
`else
`ifdef MGC_CLOCK_MONITOR_CYCLES
  `undef TESSENT_CLOCK_MONITOR_CYCLES
  `define TESSENT_CLOCK_MONITOR_CYCLES `MGC_CLOCK_MONITOR_CYCLES
`endif
`endif

`ifdef TESSENT_CLOCK_MONITOR_CYCLES_picorv32_transition_serial
  `undef TESSENT_CLOCK_MONITOR_CYCLES
  `define TESSENT_CLOCK_MONITOR_CYCLES `TESSENT_CLOCK_MONITOR_CYCLES_picorv32_transition_serial
`endif

`ifdef TESSENT_CLOCK_MONITOR_CYCLES
`else
  `define TESSENT_CLOCK_MONITOR_CYCLES 10
`endif

`ifdef MGC_CLOCK_MONITOR_PERIOD_MARGIN_PERCENT_picorv32_transition_serial
  `undef TESSENT_CLOCK_MONITOR_PERIOD_MARGIN_PERCENT
  `define TESSENT_CLOCK_MONITOR_PERIOD_MARGIN_PERCENT `MGC_CLOCK_MONITOR_PERIOD_MARGIN_PERCENT_picorv32_transition_serial
`else
`ifdef MGC_CLOCK_MONITOR_PERIOD_MARGIN_PERCENT
  `undef TESSENT_CLOCK_MONITOR_PERIOD_MARGIN_PERCENT
  `define TESSENT_CLOCK_MONITOR_PERIOD_MARGIN_PERCENT `MGC_CLOCK_MONITOR_PERIOD_MARGIN_PERCENT
`endif
`endif

`ifdef TESSENT_CLOCK_MONITOR_PERIOD_MARGIN_PERCENT_picorv32_transition_serial
  `undef TESSENT_CLOCK_MONITOR_PERIOD_MARGIN_PERCENT
  `define TESSENT_CLOCK_MONITOR_PERIOD_MARGIN_PERCENT `TESSENT_CLOCK_MONITOR_PERIOD_MARGIN_PERCENT_picorv32_transition_serial
`endif

`ifdef TESSENT_CLOCK_MONITOR_PERIOD_MARGIN_PERCENT
`else
  `define TESSENT_CLOCK_MONITOR_PERIOD_MARGIN_PERCENT 1.0
`endif

`define TESSENT_STOP_ON_CLOCK_ERROR
`ifdef MGC_CONTINUE_ON_CLOCK_ERROR_picorv32_transition_serial
  `undef TESSENT_STOP_ON_CLOCK_ERROR
`else
`ifdef MGC_CONTINUE_ON_CLOCK_ERROR
  `undef TESSENT_STOP_ON_CLOCK_ERROR
`endif
`endif

`ifdef TESSENT_CONTINUE_ON_CLOCK_ERROR_picorv32_transition_serial
  `undef TESSENT_STOP_ON_CLOCK_ERROR
`else
`ifdef TESSENT_CONTINUE_ON_CLOCK_ERROR
  `undef TESSENT_STOP_ON_CLOCK_ERROR
`endif
`endif


// Monitoring events for clock:  clk
event   _start_clock_monitor_0;
event   _stop_clock_monitor_0;

event   _start_occ_clock_monitor;
event   _stop_occ_clock_monitor;
`ifdef TESSENT_ENABLE_CLOCK_MONITOR
integer   _number_clock_monitor_cycles;
real      _clock_monitor_period_margin;
integer   _clock_monitor_0_fail;
realtime  _clock_monitor_0_start_time;
realtime  _clock_monitor_0_measured_period;
integer   _clock_monitor_0_start;
integer   _clock_monitor_0_stop;
realtime  _clock_monitor_0_expected_period;
integer   _clock_monitor_0_cycle_counter;
reg       _clock_monitor_0_complete;
wire      _clock_monitor_0_clkNet;
integer   _clock_monitor_1_fail;
realtime  _clock_monitor_1_start_time;
realtime  _clock_monitor_1_measured_period;
integer   _clock_monitor_1_cycle_counter;
reg       _clock_monitor_1_complete;
wire      _clock_monitor_1_clkNet;
integer   _occ_clock_monitor_start;
integer   _occ_clock_monitor_stop;
integer   _occ_clock_monitor_fail;
assign    _clock_monitor_0_clkNet  = picorv32_inst.clk ;
assign    _clock_monitor_1_clkNet  = picorv32_inst.picorv32_rtl1_tessent_occ_clk_inst.tessent_persistent_cell_fast_clock_buf.y ;
initial begin
$timeformat(-9, 3, "ns", 1);
  _number_clock_monitor_cycles    = `TESSENT_CLOCK_MONITOR_CYCLES;
  _clock_monitor_period_margin    = `TESSENT_CLOCK_MONITOR_PERIOD_MARGIN_PERCENT;
  _clock_monitor_0_fail               = 0;
  _clock_monitor_0_cycle_counter      = 0;
  _clock_monitor_0_complete           = 1'b0;
  _clock_monitor_0_start              = 0;
  _clock_monitor_0_stop               = 0;
  _clock_monitor_0_expected_period    = 3.000;
  _clock_monitor_1_fail               = 0;
  _clock_monitor_1_cycle_counter      = 0;
  _clock_monitor_1_complete           = 1'b0;
  _occ_clock_monitor_start              = 0;
  _occ_clock_monitor_stop               = 0;
end
always @(_stop_clock_monitor_0) begin
  if ((_clock_monitor_0_stop == 0) && (_clock_monitor_0_start)== 1) begin
    _clock_monitor_0_start = 0;
    _clock_monitor_0_stop  = 1;
    _clock_monitor_0_fail  = 0;
    if (_clock_monitor_0_complete) begin
      if (( _clock_monitor_0_measured_period > _clock_monitor_0_expected_period * (1.0 + (_clock_monitor_period_margin/100)) ) | ( _clock_monitor_0_measured_period < _clock_monitor_0_expected_period * (1.0 - (_clock_monitor_period_margin/100)) )) begin
        $display ("%t: Clock monitoring failed: clk.  Period expected = %.6t, actual = %.6t", $realtime, _clock_monitor_0_expected_period, _clock_monitor_0_measured_period);
        _clock_monitor_0_fail = _clock_monitor_0_fail + 1;
      end else begin
        $display ("%t: Clock monitoring passed: clk.  Period = %.6t as expected (within %.2f%% margin of %.6t) ", $realtime, _clock_monitor_0_measured_period, _clock_monitor_period_margin, _clock_monitor_0_expected_period);
      end
    end else begin
      if (_clock_monitor_0_cycle_counter == 0 ) begin
        $display ("%t: Clock monitoring failed: clk.  Period expected = %.6t, actual = n/a ( no transition detected )", $realtime, _clock_monitor_0_expected_period);
        _clock_monitor_0_fail = _clock_monitor_0_fail + 1;
      end else begin
        $display ("%t: Clock monitoring failed: clk.  Period expected = %.6t, actual = %.6t ( expected %0d cycles, but only detected %0d )", $realtime, _clock_monitor_0_expected_period, _clock_monitor_0_measured_period, _number_clock_monitor_cycles, _clock_monitor_0_cycle_counter - 1);
        _clock_monitor_0_fail = _clock_monitor_0_fail + 1;
      end
    end
    if (_clock_monitor_0_fail !=0) begin
       _compare_fail               = _compare_fail + 1;
`ifdef TESSENT_STOP_ON_CLOCK_ERROR
       $display("ERROR:  Clock period error detected, simulation aborted.");
       _end_vec_file_ok = 1;
       if ((_end_vec_file_ok) && (_compare_fail == 0)) begin
          $display("No error between simulated and expected patterns\n");
       end

       if (_compare_fail != 0) begin
          $display("Error between simulated and expected patterns\n");
       end

       $finish;
`endif
    end
  end
end
always @(_start_clock_monitor_0) begin
    _clock_monitor_0_start = 1;
    _clock_monitor_0_stop  = 0;
    _clock_monitor_0_complete           = 1'b0;
    _clock_monitor_0_measured_period    = 0;
    _clock_monitor_0_cycle_counter      = 0;
    $display ($realtime, "ns: Start clock monitoring on:  clk");
    #(3.000 * (1.0 + (_clock_monitor_period_margin/100)) * (_number_clock_monitor_cycles+2));
      -> _stop_clock_monitor_0;
end
// [start] : clk {{{
always @(posedge _clock_monitor_0_clkNet) begin
  if (_clock_monitor_0_start && (_clock_monitor_0_clkNet == 1'b1)) begin
      if (~_clock_monitor_0_complete) begin
        if ( _clock_monitor_0_cycle_counter == 0 ) begin
          _clock_monitor_0_start_time = $realtime;
        end
        if ( _clock_monitor_0_cycle_counter >= _number_clock_monitor_cycles ) begin
          _clock_monitor_0_complete = 1'b1;
          _clock_monitor_0_measured_period = ($realtime - _clock_monitor_0_start_time) / _number_clock_monitor_cycles;
        end else begin
          if (_clock_monitor_0_cycle_counter > 0) begin
            _clock_monitor_0_measured_period = ($realtime - _clock_monitor_0_start_time) / _clock_monitor_0_cycle_counter;
          end
          _clock_monitor_0_cycle_counter = _clock_monitor_0_cycle_counter + 1;
        end
      end
  end
end
// [end]   : clk }}}
always @(_stop_occ_clock_monitor) begin
  if ((_occ_clock_monitor_stop == 0) && (_occ_clock_monitor_start == 1)) begin
    _occ_clock_monitor_start = 0;
    _occ_clock_monitor_stop  = 1;
    _occ_clock_monitor_fail  = 0;
    _clock_monitor_1_fail  = 0;
    if (_clock_monitor_1_cycle_counter == 0 ) begin
      $display ("%t: OCC fast clock input monitoring failed: picorv32_rtl1_tessent_occ_clk_inst.tessent_persistent_cell_fast_clock_buf.y.  No transition detected", $realtime);
      _clock_monitor_1_fail = _clock_monitor_1_fail + 1;
    end else begin
      $display ("%t: OCC fast clock input monitoring passed: picorv32_rtl1_tessent_occ_clk_inst.tessent_persistent_cell_fast_clock_buf.y.  Measured period = %.6t. Number of cycles = %0d. ", $realtime, _clock_monitor_1_measured_period, _clock_monitor_1_cycle_counter);
    end
    if (_clock_monitor_1_fail !=0) begin
       _compare_fail               = _compare_fail + 1;
       _occ_clock_monitor_fail      = _occ_clock_monitor_fail + 1;
    end
    if (_occ_clock_monitor_fail !=0) begin
`ifdef TESSENT_STOP_ON_CLOCK_ERROR
          $display("ERROR:  OCC fast clock inputs error detected, simulation aborted.");
       _end_vec_file_ok = 1;
       if ((_end_vec_file_ok) && (_compare_fail == 0)) begin
          $display("No error between simulated and expected patterns\n");
       end

       if (_compare_fail != 0) begin
          $display("Error between simulated and expected patterns\n");
       end

       $finish;
`endif
    end
  end
end
always @(_start_occ_clock_monitor) begin
    _occ_clock_monitor_start = 1;
    _occ_clock_monitor_stop  = 0;
    _clock_monitor_1_complete           = 1'b0;
    _clock_monitor_1_measured_period    = 0;
    _clock_monitor_1_cycle_counter      = 0;
    $display ($realtime, "ns: Start OCC fast clock input monitoring on:  picorv32_rtl1_tessent_occ_clk_inst.tessent_persistent_cell_fast_clock_buf.y");
end
// [start] : picorv32_rtl1_tessent_occ_clk_inst.tessent_persistent_cell_fast_clock_buf.y {{{
always @(posedge _clock_monitor_1_clkNet) begin
  if (_occ_clock_monitor_start && (_clock_monitor_1_clkNet == 1'b1)) begin
    if ( _clock_monitor_1_cycle_counter == 0 ) begin
      _clock_monitor_1_start_time = $realtime;
    end
    if (_clock_monitor_1_cycle_counter > 0) begin
      _clock_monitor_1_measured_period = ($realtime - _clock_monitor_1_start_time) / _clock_monitor_1_cycle_counter;
    end
      _clock_monitor_1_cycle_counter = _clock_monitor_1_cycle_counter + 1;
  end
end
`endif

wire resetn, mem_ready, \mem_rdata[31] , \mem_rdata[30] , \mem_rdata[29] , 
     \mem_rdata[28] , \mem_rdata[27] , \mem_rdata[26] , \mem_rdata[25] , 
     \mem_rdata[24] , \mem_rdata[23] , \mem_rdata[22] , \mem_rdata[21] , 
     \mem_rdata[20] , \mem_rdata[19] , \mem_rdata[18] , \mem_rdata[17] , 
     \mem_rdata[16] , \mem_rdata[15] , \mem_rdata[14] , \mem_rdata[13] , 
     \mem_rdata[12] , \mem_rdata[11] , \mem_rdata[10] , \mem_rdata[9] , 
     \mem_rdata[8] , \mem_rdata[7] , \mem_rdata[6] , \mem_rdata[5] , 
     \mem_rdata[4] , \mem_rdata[3] , \mem_rdata[2] , \mem_rdata[1] , 
     \mem_rdata[0] , pcpi_wr, \pcpi_rd[31] , \pcpi_rd[30] , \pcpi_rd[29] , 
     \pcpi_rd[28] , \pcpi_rd[27] , \pcpi_rd[26] , \pcpi_rd[25] , \pcpi_rd[24] , 
     \pcpi_rd[23] , \pcpi_rd[22] , \pcpi_rd[21] , \pcpi_rd[20] , \pcpi_rd[19] , 
     \pcpi_rd[18] , \pcpi_rd[17] , \pcpi_rd[16] , \pcpi_rd[15] , \pcpi_rd[14] , 
     \pcpi_rd[13] , \pcpi_rd[12] , \pcpi_rd[11] , \pcpi_rd[10] , \pcpi_rd[9] , 
     \pcpi_rd[8] , \pcpi_rd[7] , \pcpi_rd[6] , \pcpi_rd[5] , \pcpi_rd[4] , 
     \pcpi_rd[3] , \pcpi_rd[2] , \pcpi_rd[1] , \pcpi_rd[0] , pcpi_wait, 
     pcpi_ready, \irq[31] , \irq[30] , \irq[29] , \irq[28] , \irq[27] , 
     \irq[26] , \irq[25] , \irq[24] , \irq[23] , \irq[22] , \irq[21] , 
     \irq[20] , \irq[19] , \irq[18] , \irq[17] , \irq[16] , \irq[15] , 
     \irq[14] , \irq[13] , \irq[12] , \irq[11] , \irq[10] , \irq[9] , 
     \irq[8] , \irq[7] , \irq[6] , \irq[5] , \irq[4] , \irq[3] , \irq[2] , 
     \irq[1] , \irq[0] , scan_en_w, edt_update, test_clock_w, test_mode, 
     fast_capture_mode, capture_cycle_width_1, capture_cycle_width_0, 
     edt_bypass, edt_configuration, edt_low_power_shift_en, \picorv32_rtl1_controller_c1_edt_channels_in[1] , 
     \picorv32_rtl1_controller_c1_edt_channels_in[0] , \picorv32_rtl1_controller_c1_edt_channels_out[1] , 
     \picorv32_rtl1_controller_c1_edt_channels_out[0] ;

event       before_finish;
assign resetn = _ibus[111];
assign mem_ready = _ibus[110];
assign \mem_rdata[31]  = _ibus[109];
assign \mem_rdata[30]  = _ibus[108];
assign \mem_rdata[29]  = _ibus[107];
assign \mem_rdata[28]  = _ibus[106];
assign \mem_rdata[27]  = _ibus[105];
assign \mem_rdata[26]  = _ibus[104];
assign \mem_rdata[25]  = _ibus[103];
assign \mem_rdata[24]  = _ibus[102];
assign \mem_rdata[23]  = _ibus[101];
assign \mem_rdata[22]  = _ibus[100];
assign \mem_rdata[21]  = _ibus[99];
assign \mem_rdata[20]  = _ibus[98];
assign \mem_rdata[19]  = _ibus[97];
assign \mem_rdata[18]  = _ibus[96];
assign \mem_rdata[17]  = _ibus[95];
assign \mem_rdata[16]  = _ibus[94];
assign \mem_rdata[15]  = _ibus[93];
assign \mem_rdata[14]  = _ibus[92];
assign \mem_rdata[13]  = _ibus[91];
assign \mem_rdata[12]  = _ibus[90];
assign \mem_rdata[11]  = _ibus[89];
assign \mem_rdata[10]  = _ibus[88];
assign \mem_rdata[9]  = _ibus[87];
assign \mem_rdata[8]  = _ibus[86];
assign \mem_rdata[7]  = _ibus[85];
assign \mem_rdata[6]  = _ibus[84];
assign \mem_rdata[5]  = _ibus[83];
assign \mem_rdata[4]  = _ibus[82];
assign \mem_rdata[3]  = _ibus[81];
assign \mem_rdata[2]  = _ibus[80];
assign \mem_rdata[1]  = _ibus[79];
assign \mem_rdata[0]  = _ibus[78];
assign pcpi_wr = _ibus[77];
assign \pcpi_rd[31]  = _ibus[76];
assign \pcpi_rd[30]  = _ibus[75];
assign \pcpi_rd[29]  = _ibus[74];
assign \pcpi_rd[28]  = _ibus[73];
assign \pcpi_rd[27]  = _ibus[72];
assign \pcpi_rd[26]  = _ibus[71];
assign \pcpi_rd[25]  = _ibus[70];
assign \pcpi_rd[24]  = _ibus[69];
assign \pcpi_rd[23]  = _ibus[68];
assign \pcpi_rd[22]  = _ibus[67];
assign \pcpi_rd[21]  = _ibus[66];
assign \pcpi_rd[20]  = _ibus[65];
assign \pcpi_rd[19]  = _ibus[64];
assign \pcpi_rd[18]  = _ibus[63];
assign \pcpi_rd[17]  = _ibus[62];
assign \pcpi_rd[16]  = _ibus[61];
assign \pcpi_rd[15]  = _ibus[60];
assign \pcpi_rd[14]  = _ibus[59];
assign \pcpi_rd[13]  = _ibus[58];
assign \pcpi_rd[12]  = _ibus[57];
assign \pcpi_rd[11]  = _ibus[56];
assign \pcpi_rd[10]  = _ibus[55];
assign \pcpi_rd[9]  = _ibus[54];
assign \pcpi_rd[8]  = _ibus[53];
assign \pcpi_rd[7]  = _ibus[52];
assign \pcpi_rd[6]  = _ibus[51];
assign \pcpi_rd[5]  = _ibus[50];
assign \pcpi_rd[4]  = _ibus[49];
assign \pcpi_rd[3]  = _ibus[48];
assign \pcpi_rd[2]  = _ibus[47];
assign \pcpi_rd[1]  = _ibus[46];
assign \pcpi_rd[0]  = _ibus[45];
assign pcpi_wait = _ibus[44];
assign pcpi_ready = _ibus[43];
assign \irq[31]  = _ibus[42];
assign \irq[30]  = _ibus[41];
assign \irq[29]  = _ibus[40];
assign \irq[28]  = _ibus[39];
assign \irq[27]  = _ibus[38];
assign \irq[26]  = _ibus[37];
assign \irq[25]  = _ibus[36];
assign \irq[24]  = _ibus[35];
assign \irq[23]  = _ibus[34];
assign \irq[22]  = _ibus[33];
assign \irq[21]  = _ibus[32];
assign \irq[20]  = _ibus[31];
assign \irq[19]  = _ibus[30];
assign \irq[18]  = _ibus[29];
assign \irq[17]  = _ibus[28];
assign \irq[16]  = _ibus[27];
assign \irq[15]  = _ibus[26];
assign \irq[14]  = _ibus[25];
assign \irq[13]  = _ibus[24];
assign \irq[12]  = _ibus[23];
assign \irq[11]  = _ibus[22];
assign \irq[10]  = _ibus[21];
assign \irq[9]  = _ibus[20];
assign \irq[8]  = _ibus[19];
assign \irq[7]  = _ibus[18];
assign \irq[6]  = _ibus[17];
assign \irq[5]  = _ibus[16];
assign \irq[4]  = _ibus[15];
assign \irq[3]  = _ibus[14];
assign \irq[2]  = _ibus[13];
assign \irq[1]  = _ibus[12];
assign \irq[0]  = _ibus[11];
assign scan_en_w = _ibus[10];
assign edt_update = _ibus[9];
assign test_clock_w = _ibus[8];
assign test_mode = _ibus[7];
assign fast_capture_mode = _ibus[6];
assign capture_cycle_width_1 = 1'b0;
assign capture_cycle_width_0 = _ibus[5];
assign edt_bypass = _ibus[4];
assign edt_configuration = _ibus[3];
assign edt_low_power_shift_en = _ibus[2];
assign \picorv32_rtl1_controller_c1_edt_channels_in[1]  = _ibus[1];
assign \picorv32_rtl1_controller_c1_edt_channels_in[0]  = _ibus[0];

assign _sim_obus[1] = \picorv32_rtl1_controller_c1_edt_channels_out[1] ;
assign _sim_obus[0] = \picorv32_rtl1_controller_c1_edt_channels_out[0] ;

// Change Path Variables & Get Argument 
integer      _change_path; 
integer      _change_out_path; 
reg[512*8:1]  _new_path; 
reg[512*8:1]  _new_out_path; 
reg[512*8:1]  _new_filename; 
reg[512*8:1]  _vcd_dump_file_name; 
reg[512*8:1]  _utvcd_dump_file_name; 
reg[512*8:1]  _fsdb_dump_file_name; 
reg[512*8:1]  _qwave_dump_file_name; 
reg[512*8:1]  _tmp_filename; 
initial begin 
  _change_path = 0; 
  _change_out_path = 0; 
  if ($value$plusargs("NEWPATH=%s", _new_path)) begin 
    $display("Found New Path %0s\n", _new_path); 
    _change_path = 1; 
  end 
  if ($value$plusargs("NEWOUTPATH=%s", _new_out_path)) begin 
    $display("Found New Out Path %0s\n", _new_out_path); 
    _change_out_path = 1; 
  end 

`ifdef VCD
    $sformat(_vcd_dump_file_name, "patterns/picorv32_transition_serial.v.dump");
    if(_change_out_path) begin 
      $sformat(_vcd_dump_file_name, "%0s/%0s", _new_out_path, _vcd_dump_file_name);
    end
    $dumpfile(_vcd_dump_file_name);
    $dumpvars;
`endif

`ifdef UTVCD
    $sformat(_utvcd_dump_file_name, "patterns/picorv32_transition_serial.v.dump");
    if(_change_out_path) begin 
      $sformat(_utvcd_dump_file_name, "%0s/%0s", _new_out_path, _utvcd_dump_file_name);
    end
    $dumpfile(_utvcd_dump_file_name);
    $vtDump;
    $dumpvars;
`endif

`ifdef debussy
    $sformat(_fsdb_dump_file_name, "patterns/picorv32_transition_serial.v.fsdb");
    if(_change_out_path) begin 
      $sformat(_fsdb_dump_file_name, "%0s/%0s", _new_out_path, _fsdb_dump_file_name);
    end
    $fsdbDumpfile(_fsdb_dump_file_name);
    $fsdbDumpvars;
`endif

`ifdef QWAVE
    $sformat(_qwave_dump_file_name, "patterns/picorv32_transition_serial.v.qwave.db");
    if(_change_out_path) begin 
      $sformat(_qwave_dump_file_name, "%0s/%0s", _new_out_path, _qwave_dump_file_name);
    end
    $qwavedb_dumpvars_filename(_qwave_dump_file_name);
    $qwavedb_dumpvars;
`endif
end 

reg /* sparse */[375:0] _nam_obus[1:0];
initial begin 
   if(_change_path) begin 
     $sformat(_new_filename,"%0s/patterns/picorv32_transition_serial.v.po.name",_new_path); 
     $display("Loading %0s\n", _new_filename ); 
     $readmemh(_new_filename,_nam_obus,1,0); 
   end 
   else begin
     $display("Loading patterns/picorv32_transition_serial.v.po.name");
     $readmemh("patterns/picorv32_transition_serial.v.po.name",_nam_obus,1,0);
   end 
end 


// Declare Wires for tracking Vector Type
reg[3:0] _MGCDFT_VECTYPE ;
reg[160:0] _procedure_string ;
reg mgcdft_test_setup, mgcdft_load_unload, mgcdft_shift,
     mgcdft_single_shift, mgcdft_shift_extra, 
     mgcdft_shadow_control, mgcdft_master_observe,
     mgcdft_shadow_observe, mgcdft_skew_load, 
     mgcdft_seq_transparent, mgcdft_launch_capture,
     mgcdft_clock_proc, mgcdft_test_end, mgcdft_unknown; 

event       set_vector_type;
always @(_MGCDFT_VECTYPE) begin
  assign mgcdft_test_setup      = 1'b0;
  assign mgcdft_load_unload     = 1'b0;
  assign mgcdft_shift           = 1'b0;
  assign mgcdft_single_shift    = 1'b0;
  assign mgcdft_shift_extra     = 1'b0;
  assign mgcdft_shadow_control  = 1'b0;
  assign mgcdft_master_observe  = 1'b0;
  assign mgcdft_shadow_observe  = 1'b0;
  assign mgcdft_skew_load       = 1'b0;
  assign mgcdft_seq_transparent = 1'b0;
  assign mgcdft_launch_capture  = 1'b0;
  assign mgcdft_clock_proc      = 1'b0;
  assign mgcdft_test_end        = 1'b0;
  assign mgcdft_unknown         = 1'b0;
  case (_MGCDFT_VECTYPE)
    4'b0001: begin
               assign mgcdft_test_setup      = 1'b1;
               _procedure_string = "TEST_SETUP";
               _scan_shift_count = 0;
             end
    4'b0010: begin
               assign mgcdft_load_unload     = 1'b1;
               _procedure_string = "LOAD";
               _scan_shift_count = 0;
             end
    4'b0011: begin
               assign mgcdft_shift           = 1'b1;
               _procedure_string = "SHIFT";
               if(!(_scan_shift_count)) begin
                 _scan_shift_count = 1;
               end
             end
    4'b0100: begin
               assign mgcdft_single_shift    = 1'b1;
               _procedure_string = "SINGLE_SHIFT";
               if(!(_scan_shift_count)) begin
                 _scan_shift_count = 1;
               end
             end
    4'b0101: begin
               assign mgcdft_shift_extra     = 1'b1;
               _procedure_string = "SHIFT_EXTRA";
               _scan_shift_count = 0;
             end
    4'b0110: begin
               assign mgcdft_shadow_control  = 1'b1;
               _procedure_string = "SHADOW_CONTROL";
               _scan_shift_count = 0;
             end
    4'b0111: begin
               assign mgcdft_master_observe  = 1'b1;
               _procedure_string = "MASTER_OBSERVE";
               _scan_shift_count = 0;
             end
    4'b1000: begin
               assign mgcdft_shadow_observe  = 1'b1;
               _procedure_string = "SHADOW_OBSERVE";
               _scan_shift_count = 0;
             end
    4'b1001: begin
               assign mgcdft_skew_load       = 1'b1;
               _procedure_string = "SKEW_LOAD";
               _scan_shift_count = 0;
             end
    4'b1010: begin
               assign mgcdft_seq_transparent = 1'b1;
               _procedure_string = "SEQ_TRANSPARENT";
               _scan_shift_count = 0;
             end
    4'b1011: begin
               assign mgcdft_launch_capture  = 1'b1;
               _procedure_string = "LAUNCH_CAPTURE";
               _scan_shift_count = 0;
             end
    4'b1101: begin
               assign mgcdft_clock_proc      = 1'b1;
               _procedure_string = "CLOCK_PROC";
               _scan_shift_count = 0;
             end
    4'b1111: begin
               assign mgcdft_test_end        = 1'b1;
               _procedure_string = "TEST_END";
               _scan_shift_count = 0;
             end
    4'b0000: begin
               assign mgcdft_unknown         = 1'b1;
               _procedure_string = "UNKNOWN";
               _scan_shift_count = 0;
             end
    default: begin
               assign mgcdft_unknown         = 1'b1;
               _procedure_string = "UNKNOWN";
               _scan_shift_count = 0;
             end
  endcase
end

event       compare_exp_sim_obus;
always @(compare_exp_sim_obus) begin
 _found_fail = 0;
 if (_do_compare) begin
  if (_exp_obus !== _sim_obus) begin
     for(_bit_count = 0;
         ((_bit_count < 2)&&(_found_fail==0));
          _bit_count =_bit_count +1) begin
        if ((_msk_obus[_bit_count] === 1'b1) &&
            (_exp_obus[_bit_count] !== _sim_obus[_bit_count])) begin
           _found_fail = 1;
           _found_fail_per_cycle = 1;
           _found_fail_obus[_bit_count] = 1'b1;
        end
     end
  end
  if (_found_fail == 1) begin
    $write($realtime, "ns: Simulated response %b pattern %d cycle %d\n",_sim_obus,_pattern_count,_cycle_count);
    $write($realtime, "ns: Expected  response %b pattern %d cycle %d\n",_exp_obus,_pattern_count,_cycle_count);
     for(_bit_count = 0;
         ((_bit_count < 2)&&((_miscompare_limit==0)||(_compare_fail<=_miscompare_limit)));
          _bit_count =_bit_count +1) begin
      if ((_msk_obus[_bit_count] === 1'b1) &&
          (_exp_obus[_bit_count] !== _sim_obus[_bit_count])) begin
        _found_fail_obus[_bit_count] = 1'b1;
        $write($realtime, "ns: Mismatch at pin %d name %s, Simulated %b, Expected %b\n",_bit_count,_nam_obus[_bit_count],_sim_obus[_bit_count],_exp_obus[_bit_count]);
        if (_write_MASK_file == 0) begin
         if (_scan_shift_count != 0) begin 
            case (_bit_count) // Scan Chain Failure 
              0: begin
                      $write($realtime, "ns: Mismatch on chain: edt_picorv32_rtl1_tessent_edt_c1_inst__edt_block_channel1 at shift cycle: %d\n", (_scan_shift_count-1));
               end
              1: begin
                      $write($realtime, "ns: Mismatch on chain: edt_picorv32_rtl1_tessent_edt_c1_inst__edt_block_channel2 at shift cycle: %d\n", (_scan_shift_count-1));
               end
            endcase
          end // _scan_shift_count
        end
        if (_write_DIAG_file == 1) begin
          if (_DIAG_file_header == 0) begin
            if ((_start_pat > -1) && (_end_pat > -1)) begin
              $sformat(_tmp_filename, "patterns/picorv32_transition_serial.v_%0d_%0d.fail",
                       _start_pat, _end_pat);
            end
            else if (_start_pat > -1) begin
              $sformat(_tmp_filename, "patterns/picorv32_transition_serial.v_%0d.fail",
                       _start_pat);
            end
            else if (_end_pat > -1) begin
              $sformat(_tmp_filename, "patterns/picorv32_transition_serial.v__%0d.fail",
                       _end_pat);
            end
            else begin
              $sformat(_tmp_filename, "patterns/picorv32_transition_serial.v.fail");
            end
            if(_change_out_path) begin 
              $sformat(_tmp_filename, "%0s/%0s", _new_out_path, _tmp_filename);
            end
            _diag_file = $fopen(_tmp_filename);
            if (_diag_file == 0) begin
              $display("ERROR: Couldn't open .fail file %0s, simulation aborted\n", _tmp_filename);
              ->before_finish;
              #0;
              $finish;
            end
            if(_change_out_path) begin 
              $fwrite(_diag_file, "// This File is simulation generated (%0s/patterns/picorv32_transition_serial.v)\n", _new_out_path);
            end
            else begin
              $fwrite(_diag_file, "// This File is simulation generated (patterns/picorv32_transition_serial.v)\n");
            end
            $fwrite(_diag_file, "format cycle\n");
            $fwrite(_diag_file, " failures_begin\n");
            $fwrite(_diag_file, "//cycle_number  PO_name  expected_value  simulated_value  ");
            $fwrite(_diag_file, "pattern_id  chain_name  cell_number\n\n");
            _DIAG_file_header = 1;
          end
          if ((_pattern_count == _last_fail_pattern) && (_pattern_count == 0)) begin
             _fail_pattern_cnt = 1; 
          end
          if (_pattern_count > _last_fail_pattern) begin 
             _fail_pattern_cnt = _fail_pattern_cnt + 1;
             _last_fail_pattern = _pattern_count;
          end

          $fwrite(_diag_file, "%d  %s ", _cycle_count, _nam_obus[_bit_count]);
          case ( _exp_obus[_bit_count] )
            1'b1: begin
                    $fwrite(_diag_file, "            H"); 
                  end
            1'b0: begin
                    $fwrite(_diag_file, "            L"); 
                  end
            1'bZ: begin
                    $fwrite(_diag_file, "            Z"); 
                  end
          endcase
          case ( _sim_obus[_bit_count] )
            1'b1: begin
                    $fwrite(_diag_file, " H  // Pattern %d ", _pattern_count); 
                  end
            1'b0: begin
                    $fwrite(_diag_file, " L  // Pattern %d ", _pattern_count); 
                  end
            1'bZ: begin
                    $fwrite(_diag_file, " Z  // Pattern %d ", _pattern_count); 
                  end
            1'bX: begin
                    $fwrite(_diag_file, " X  // Pattern %d ", _pattern_count); 
                  end
          endcase
         if (_scan_shift_count == 0) begin
                 $fwrite(_diag_file, ", simulation_time=%.0f\n", $realtime);
         end // EndIf  _ScanShift_count
         if (_scan_shift_count != 0) begin
          case (_bit_count) // Scan Chain Failure
            0: begin
                 $fwrite(_diag_file, "chain: edt_picorv32_rtl1_tessent_edt_c1_inst__edt_block_channel1  cell: %d, simulation_time=%.0f\n", (_scan_shift_count-1), $realtime);
                end
            1: begin
                 $fwrite(_diag_file, "chain: edt_picorv32_rtl1_tessent_edt_c1_inst__edt_block_channel2  cell: %d, simulation_time=%.0f\n", (_scan_shift_count-1), $realtime);
                end
          endcase
         end // EndIf  _ScanShift_count
        end // EndIf _write_DIAG_file
        if (_write_MASK_file == 1) begin
          if (_MASK_file_header == 0) begin
            if ((_start_pat > -1) && (_end_pat > -1)) begin
              $sformat(_tmp_filename, "patterns/picorv32_transition_serial.v_%0d_%0d.mask",
                       _start_pat, _end_pat);
            end
            else if (_start_pat > -1) begin
              $sformat(_tmp_filename, "patterns/picorv32_transition_serial.v_%0d.mask",
                       _start_pat);
            end
            else if (_end_pat > -1) begin
              $sformat(_tmp_filename, "patterns/picorv32_transition_serial.v__%0d.mask",
                       _end_pat);
            end
            else begin
              $sformat(_tmp_filename, "patterns/picorv32_transition_serial.v.mask");
            end
            if(_change_out_path) begin 
              $sformat(_tmp_filename, "%0s/%0s", _new_out_path, _tmp_filename);
            end
            _mask_file = $fopen(_tmp_filename);
            if (_mask_file == 0) begin
              $display("ERROR: Couldn't open .mask file %0s, simulation aborted\n", _tmp_filename);
              ->before_finish;
              #0;
              $finish;
            end
            $fwrite(_mask_file, "%s\n%s\n", "type mask", "");
            _MASK_file_header = 1;
          end
        _wrote_fail = 0;
         if (_scan_shift_count != 0) begin 
          case (_bit_count) // Scan Chain Failure 
            0: begin
                    $write($realtime, "ns: Mismatch on chain: edt_picorv32_rtl1_tessent_edt_c1_inst__edt_block_channel1 at shift cycle: %d\n", (_scan_shift_count-1));
                 if (_chain_test_ == 0) begin
                   $fwrite(_mask_file, "%d %s %d\n",
                             _pattern_count, "edt_picorv32_rtl1_tessent_edt_c1_inst__edt_block_channel1", (_scan_shift_count-1));
                   _wrote_fail = 1;
                 end
                 if (_chain_test_ == 1) begin
                   $fwrite(_mask_file, "// %d %s %d\n",
                    _pattern_count,"edt_picorv32_rtl1_tessent_edt_c1_inst__edt_block_channel1", (_scan_shift_count-1));
                   _wrote_fail = 1;
                 end
               end
            1: begin
                    $write($realtime, "ns: Mismatch on chain: edt_picorv32_rtl1_tessent_edt_c1_inst__edt_block_channel2 at shift cycle: %d\n", (_scan_shift_count-1));
                 if (_chain_test_ == 0) begin
                   $fwrite(_mask_file, "%d %s %d\n",
                             _pattern_count, "edt_picorv32_rtl1_tessent_edt_c1_inst__edt_block_channel2", (_scan_shift_count-1));
                   _wrote_fail = 1;
                 end
                 if (_chain_test_ == 1) begin
                   $fwrite(_mask_file, "// %d %s %d\n",
                    _pattern_count,"edt_picorv32_rtl1_tessent_edt_c1_inst__edt_block_channel2", (_scan_shift_count-1));
                   _wrote_fail = 1;
                 end
               end
          endcase
         end // _scan_shift_count 
          if (_wrote_fail == 0 )  begin // not Scan Chain Failure
            if (_chain_test_ == 0) begin
              $fwrite(_mask_file, "%d %s\n", _pattern_count,_nam_obus[_bit_count]);
            end
            if (_chain_test_ == 1) begin
              $fwrite(_mask_file, "// %d %s\n", _pattern_count,_nam_obus[_bit_count]);
            end
          end
        end// if MaskFile
      end
    end
    _compare_fail = _compare_fail + 1;
  end
 end // if _do_compare
end

reg[124:0]     mem [0:2147482];
picorv32 picorv32_inst (.resetn(resetn), .mem_ready(mem_ready), 
     .mem_rdata({\mem_rdata[31] , \mem_rdata[30] 
     , \mem_rdata[29] , \mem_rdata[28] , \mem_rdata[27] 
     , \mem_rdata[26] , \mem_rdata[25] , \mem_rdata[24] 
     , \mem_rdata[23] , \mem_rdata[22] , \mem_rdata[21] 
     , \mem_rdata[20] , \mem_rdata[19] , \mem_rdata[18] 
     , \mem_rdata[17] , \mem_rdata[16] , \mem_rdata[15] 
     , \mem_rdata[14] , \mem_rdata[13] , \mem_rdata[12] 
     , \mem_rdata[11] , \mem_rdata[10] , \mem_rdata[9] 
     , \mem_rdata[8] , \mem_rdata[7] , \mem_rdata[6] 
     , \mem_rdata[5] , \mem_rdata[4] , \mem_rdata[3] 
     , \mem_rdata[2] , \mem_rdata[1] , \mem_rdata[0] }), 
     .pcpi_wr(pcpi_wr), .pcpi_rd({\pcpi_rd[31] , \pcpi_rd[30] 
     , \pcpi_rd[29] , \pcpi_rd[28] , \pcpi_rd[27] , \pcpi_rd[26] 
     , \pcpi_rd[25] , \pcpi_rd[24] , \pcpi_rd[23] , \pcpi_rd[22] 
     , \pcpi_rd[21] , \pcpi_rd[20] , \pcpi_rd[19] , \pcpi_rd[18] 
     , \pcpi_rd[17] , \pcpi_rd[16] , \pcpi_rd[15] , \pcpi_rd[14] 
     , \pcpi_rd[13] , \pcpi_rd[12] , \pcpi_rd[11] , \pcpi_rd[10] 
     , \pcpi_rd[9] , \pcpi_rd[8] , \pcpi_rd[7] , \pcpi_rd[6] 
     , \pcpi_rd[5] , \pcpi_rd[4] , \pcpi_rd[3] , \pcpi_rd[2] 
     , \pcpi_rd[1] , \pcpi_rd[0] }), .pcpi_wait(pcpi_wait), 
     .pcpi_ready(pcpi_ready), .irq({\irq[31] , \irq[30] 
     , \irq[29] , \irq[28] , \irq[27] , \irq[26] , \irq[25] 
     , \irq[24] , \irq[23] , \irq[22] , \irq[21] , \irq[20] 
     , \irq[19] , \irq[18] , \irq[17] , \irq[16] , \irq[15] 
     , \irq[14] , \irq[13] , \irq[12] , \irq[11] , \irq[10] 
     , \irq[9] , \irq[8] , \irq[7] , \irq[6] , \irq[5] , \irq[4] 
     , \irq[3] , \irq[2] , \irq[1] , \irq[0] }), 
     .scan_en_w(scan_en_w), .edt_update(edt_update), 
     .test_clock_w(test_clock_w), .test_mode(test_mode), 
     .fast_capture_mode(fast_capture_mode), 
     .capture_cycle_width_1(capture_cycle_width_1), 
     .capture_cycle_width_0(capture_cycle_width_0), 
     .edt_bypass(edt_bypass), 
     .edt_configuration(edt_configuration), 
     .edt_low_power_shift_en(edt_low_power_shift_en), 
     .picorv32_rtl1_controller_c1_edt_channels_in({\picorv32_rtl1_controller_c1_edt_channels_in[1] 
     , \picorv32_rtl1_controller_c1_edt_channels_in[0] }), 
     .picorv32_rtl1_controller_c1_edt_channels_out({\picorv32_rtl1_controller_c1_edt_channels_out[1] 
     , \picorv32_rtl1_controller_c1_edt_channels_out[0] }), 
     .clk(clk));


// Async clock generators
initial begin
  _clock_generator0 = 1'b0;
  #0 ;
  forever begin
    #1.50 ;
    _clock_generator0 = 1'b1;
    #1.50 ;
    _clock_generator0 = 1'b0;
  end
end

initial begin
_in_restart = 0;
while (_in_restart < 2) begin
_in_restart = _in_restart + 1;
_restart_state     = -1;
if ($value$plusargs("RESTART=%d", _restart_state)) begin
  $display(" Found RESTART   %d", _restart_state);
end

if ((_in_restart < 2) || (_restart_state == 1)) begin
mgcdft_save_signal = 1'b0;
mgcdft_restart_signal = 1'b0;
if (_restart_state == 1) begin
  #0;
  mgcdft_restart_signal = 1'b1;
//  $display("Reading checkpoint patterns/picorv32_transition_serial.v.dat");
//  $restart("patterns/picorv32_transition_serial.v.dat");
end

#0;
mgcdft_save_signal = 1'b0;
mgcdft_restart_signal = 1'b0;
_compare_fail = 0;
_pattern_count = 0;
_cycle_count = 0;
_save_cycle_count = 0;
_write_DIAG_file = 0; // change to 1, to generate file
_write_MASK_file = 0; // change to 1, to generate file
_wrote_fail = 0;
_DIAG_file_header = 0;
_diag_file = 0;
_diag_chain_header = 0;
_diag_scan_header = 0;
_fail_pattern_cnt = 0;
_last_fail_pattern = 0;
_MASK_file_header = 0;
_mask_file = 0;
_chain_test_ = 0;
_par_shift_cnt = 0;
_report_bit_cnt = 0;
// Limit # of miscompares before aborting simulation (non-zero)
_miscompare_limit = 0; 
_end_vec_file_ok = 0; 
_scan_shift_count = 0;
_run_testsetup = 1;
_in_testsetup = 1;
_start_pat      = -1;
_end_pat        = -1;
_end_after_setup = -1;
_no_setup       = -1;
_save_state     = -1;
_override_cfg   = 0;
_pat_num        = -1;
_in_range       = 1;
_do_compare     = 1;
_in_chaintest   = 0;

_skipped_patterns = 0;

_end_simulation   = 0;

if ($value$plusargs("STARTPAT=%d", _start_pat)) begin
  if (_start_pat > -1) begin
    $display(" Found Start pattern number %d", _start_pat);
    _in_range = 0;
    _do_compare = 0;
  end
  else begin
    $display(" Ignoring negative Start pattern number   %d", _start_pat);
    _start_pat = -1;
  end
end
if ($value$plusargs("ENDPAT=%d", _end_pat)) begin
  if (_end_pat > -1) begin
    $display(" Found End pattern number   %d", _end_pat);
  end
  else begin
    $display(" Ignoring negative End pattern number   %d", _end_pat);
    _end_pat = -1;
  end
end

if ($value$plusargs("CHAINTEST=%d", _in_chaintest)) begin
  if (_in_chaintest) begin
    $display(" Found ChainTest identifier %d", _in_chaintest);
  end
end

if ($value$plusargs("END_AFTER_SETUP=%d", _end_after_setup)) begin
  $display(" Found End after setup   %d", _end_after_setup);
  if (_end_after_setup > 0) begin
    _end_pat = 0;
    _in_chaintest = 1;
  end
end

if ($value$plusargs("SKIP_SETUP=%d", _no_setup)) begin
  $display(" Found Skip setup   %d", _no_setup);
  if (_no_setup > 0) begin
    if (_start_pat == -1) begin
      _start_pat = 0;
      _in_chaintest = 1;
    end
    _run_testsetup = 0;
    _in_range = 0;
    _do_compare = 0;
  end
end

if ($value$plusargs("SAVE=%d", _save_state)) begin
  $display(" Found SAVE   %d", _save_state);
end

if ($value$plusargs("CONFIG=%0s", _cfg_file_name)) begin
  $display(" Found CONFIG identifier   %0s", _cfg_file_name);
  _override_cfg = 1;
end
else begin
  _cfg_file_name = "patterns/picorv32_transition_serial.v.cfg";
end

if ((_end_pat != -1) && (_end_pat < _start_pat)) begin
  _start_pat = -1;
  _in_range = 1;
  _do_compare = 1;
  $display("STARTPAT less than ENDPAT, ignoring STARTPAT ");
end
_allow_bad_message_index = 0;
if ($value$plusargs("ALLOW_BAD_MESSAGE_INDEX=%d", _allow_bad_message_index)) begin
  $display(" Found ALLOW_BAD_MESSAGE_INDEX %d", _allow_bad_message_index);
end

// read vector config file
if(_override_cfg) begin 
  _config_file = $fopen(_cfg_file_name, "r");
end
else begin
if(_change_path) begin 
  $sformat(_new_filename,"%0s/patterns/picorv32_transition_serial.v.cfg",_new_path); 
  _config_file = $fopen(_new_filename, "r");
end
else begin
  _config_file = $fopen("patterns/picorv32_transition_serial.v.cfg", "r");
end

end

if (_config_file == 0) begin
  $display("ERROR: Couldn't open configuration file, simulation aborted\n");
  ->before_finish;
  #0;
  $finish;
end
_fstat = 0;
if (_start_pat != -1) begin
  if (_no_setup > 0) begin
  $display("BEGIN pattern read loop  Skip test_setup\n");
  end
  else if (_in_chaintest == 0) begin
    if (_end_pat != -1) begin
    $display("BEGIN pattern read loop  Start pattern (%d) End pattern (%d)\n",
_start_pat,_end_pat);
    end
    else begin
    $display("BEGIN pattern read loop  Start pattern (%d) \n",
_start_pat);
    end
  end
  else begin
    if (_end_pat != -1) begin
    $display("BEGIN pattern read loop  Start chain pattern (%d) End chain pattern (%d)\n",
_start_pat,_end_pat);
    end
    else begin
    $display("BEGIN pattern read loop  Start chain pattern (%d)\n",
_start_pat);
    end
  end
end
else if (_end_pat != -1) begin
  if (_end_after_setup > 0) begin
  $display("BEGIN pattern read loop  End after test_setup\n");
  end
  else if (_in_chaintest == 0) begin
  $display("BEGIN pattern read loop  End pattern (%d)\n", _end_pat);
  end
  else begin
  $display("BEGIN pattern read loop  End chain pattern (%d)\n", _end_pat);
  end
end

// begin pattern read loop
while (!$feof(_config_file) && (!_end_simulation))
begin
         _fstat = $fscanf(_config_file, "%s", _vec_file_name);
         _fstat = $fscanf(_config_file, "%d", _max_index);
   if (_fstat != -1) begin
         _fstat = $fscanf(_config_file, "%d", _vec_pat_count);
         if (_fstat == -1) begin
           _vec_pat_count = -1;
         end
         // skip .vec file if _start_pat greater than this
         if ((_start_pat != -1) && !_in_range && (_vec_pat_count != -1) &&
             !_in_testsetup && !_in_chaintest &&
             ((_pat_num + _vec_pat_count) < _start_pat)) begin
           _max_index = -1;
           if (_chain_test_) begin
             _pattern_count = 0;
             _pat_num = 0;
           end
           _pat_num = _pat_num + _vec_pat_count;
           _skipped_patterns = _skipped_patterns + _vec_pat_count;
           _end_vec_file_ok = 1;
           _chain_test_ = 0;
            $display("Skipping %0s\n", _vec_file_name);
         end
         else begin
          if(_change_path) begin 
            $sformat(_new_filename,"%0s/patterns/%0s",_new_path, _vec_file_name); 
            $display("Loading %0s\n", _new_filename ); 
            $readmemb(_new_filename, mem, 0, _max_index);
         end
         else begin
           $display("Loading %0s\n", _vec_file_name);
           $sformat(_new_filename,"patterns/%0s", _vec_file_name); 
           $readmemb(_new_filename, mem, 0, _max_index);
         end
           _end_vec_file_ok = 0;
         end
   end
   else begin
     _max_index = -1;
     _vec_pat_count = -1;
   end
   _scan_index = 0;
   _repeat_count_nest[0] = 0;
   _repeat_count = 0;
   _repeat_depth = 0;
   _message_index = 0;
   _save_index[0] = 0;
   _found_fail_obus =2'b00;
   for (_index=0; _index <= _max_index; _index = _index+1)
   begin
      vect = mem[_index];
      _exp_obus=2'bXX;
      _msk_obus=2'b00;
      _MGCDFT_VECTYPE = vect[3:0];
      _pat_type = vect[6:4];
      _tp_num = vect[7];
      //    Range Check
      if ((_start_pat != -1) && ((_start_pat != 0) || (!_in_testsetup)) &&
          ((!_chain_test_)||(_chain_test_ && _in_chaintest))) begin
        if (!_chain_test_ && _in_chaintest && !_in_range && !_in_testsetup) begin
          _in_range = 1;
          _do_compare = 1;
        end
        if ((_pat_num == _start_pat) && !_in_range) begin
          _in_range = 1;
          _do_compare = 0;
          if (_in_chaintest) begin
            _pattern_count = (_pat_num - 2);
          end
          else begin
            _pattern_count = (_pat_num - 1);
          end
          if (_pattern_count < 0) begin
            _pattern_count = 0;
          end
        end
        if (_pat_num == (_start_pat + 1)) begin
          _do_compare = 1;
        end
      end

      if ((_end_pat != -1) && (_pattern_count > _end_pat) && 
          ((!_chain_test_)||(_chain_test_ && _in_chaintest))) begin
         // simulation complete, exit
         _index = _max_index + 1;
         _end_vec_file_ok = 1;
         _end_simulation = 1;
      end
      if ((_index > 0) && (_end_pat != -1) && !_chain_test_ && _in_chaintest &&
          !_run_testsetup) begin
         // simulation complete, exit
         _index = _max_index + 1;
         _end_vec_file_ok = 1;
         _end_simulation = 1;
      end
      if ((_in_range) || (_run_testsetup)) begin
      case (_pat_type)
         3'b000:  begin // end vector
            _index = _max_index + 1;
         end // end vector
         3'b001: ;// skip scan vector, handled by shift vector
         3'b010:  begin // broadside vector
            _found_fail_per_cycle = 0;
            _found_fail_obus =2'b00;
            if (vect[8] == 1'b1) begin
               _pattern_count = _pattern_count + 1;
               _par_shift_cnt = 0;
              if ((!_do_compare) && (_pattern_count >= _start_pat)) begin
                _do_compare = 1;
              end
              if ((_end_pat != -1) && (_pattern_count > _end_pat) && 
                  ((!_chain_test_)||(_chain_test_ && _in_chaintest))) begin
                // simulation complete, exit
                _index = _max_index + 1;
                _end_vec_file_ok = 1;
                _end_simulation = 1;
                _in_range = 0;
              end
            end
            if (vect[8] === 1'bz) begin
               _pattern_count = 0;
               _par_shift_cnt = 0;
            end
            if(_scan_shift_count) begin
               _scan_shift_count = _scan_shift_count + 1;
            end
            case (_tp_num)
               1'b1: begin // timeplate 1 - gen_tp1
                  _ibus[8] = 1'b0;
                  _ibus[111:9] = vect[124:22];
                  _ibus[7:0] = vect[20:13];

                  #10; // 10 ns
                  _exp_obus[1:0] = vect[12:11];
                  _msk_obus[1:0] = vect[10:9];
                  #0;
                  ->compare_exp_sim_obus;
                  if ((_miscompare_limit)&&(_compare_fail>=_miscompare_limit)) begin
                    $display("ERROR: exceeded miscompare limit(%d), exiting simulation",_miscompare_limit);
                    _end_vec_file_ok = 1;
                    if (_DIAG_file_header == 1) begin
                       $fwrite(_diag_file, " failures_end\n");
                       $fwrite(_diag_file, " failure_buffer_limit_reached none\n");
                       if (_diag_scan_header==1) begin
                         $fwrite(_diag_file, "last_cycle_applied %d\n", (_cycle_count-1));
                       end
                       $fwrite(_diag_file, "total_cycles 2160\n");
                       $fwrite(_diag_file, "// failing_patterns=%d simulated_patterns=%d", _fail_pattern_cnt, (_pattern_count+1));
                       $fwrite(_diag_file, " simulation_time=", $realtime, ";\n");
                       $fwrite(_diag_file, "failure_file_end\n");
                       $fclose(_diag_file);
                    end
                    ->before_finish;
                    #0;
                    $finish;
                  end

                  #10; // 20 ns
                  _ibus[8] = vect[21];

                  #10; // 30 ns
                  _ibus[8] = 1'b0;

                  #10; // 40 ns
               end // timeplate 1 - gen_tp1
               default: begin
                  $display("ERROR: corrupt timeplate number\n");
                  ->before_finish;
                  #0;
                  $finish;
               end
            endcase // _tp_num
            _cycle_count = _cycle_count + 1;
            _par_shift_cnt = 0;
         end // broadside vector
         3'b011:  begin // status message vector
            _message_index = vect[38:7];
            case (_message_index)
               0: begin
                  $display("Begin chain test\n");
                 _chain_test_ = 1;
                  _diag_chain_header = 0;
               end
               1: begin
                 _chain_test_ = 0;
                  if (_diag_chain_header) begin
                    $fwrite(_diag_file, " last_cycle_applied %d\n", _cycle_count);
                  end
                  _diag_scan_header = 0;
                  if ((_start_pat > -1) || (_end_pat > -1)) begin
                    if (_pat_num > -1) begin
                        $display("Simulated chain pattern %d\n",_pat_num);
                    end
                  end
                  _pat_num = -1;
                  _pattern_count = 0;
                  $display("End chain test\n");
               end
               2: begin
                  $display("Status update: simulated through pattern %d\n",_pattern_count);
               end
               3: begin
                  _end_vec_file_ok = 1;
                  if ((_start_pat > -1) || (_end_pat > -1)) begin
                    if (_pat_num > -1) begin
                      if (!_chain_test_) begin
                        $display("Simulated pattern %d\n",_pat_num);
                      end
                    end
                  end
               end
               4: begin // start of atpg pattern
                  if ((_start_pat > -1) || (_end_pat > -1)) begin
                    if (_pat_num > -1) begin
                      if (_chain_test_) begin
                        $display("Simulated chain pattern %d\n",_pat_num);
                      end
                      else begin
                        $display("Simulated pattern %d\n",_pat_num);
                      end
                    end
                  end
                  _pat_num = _pat_num + 1;
                  _run_testsetup  = 0;
                  _in_testsetup  = 0;
                  if (_end_after_setup  > 0) begin
                    //simulation complete, exit
                    _index = _max_index + 1;
                    _end_vec_file_ok = 1;
                    _end_simulation = 1;
                    _in_range = 0;
                  end
               end
               5: begin // increment pattern count
                 _pattern_count = _pattern_count + 1;
                 _par_shift_cnt = 0;
                 if ((_end_pat != -1) && (_pattern_count > (_end_pat - 1)) && 
                     ((!_chain_test_)||(_chain_test_ && _in_chaintest))) begin
                   // simulation complete, exit
                    _index = _max_index + 1;
                   _end_vec_file_ok = 1;
                   _end_simulation = 1;
                   _in_range = 0;
                 end
               end
               20: begin
                   -> _start_clock_monitor_0;
               end
               21: begin
                   -> _start_occ_clock_monitor;
               end
               22: begin
                   -> _stop_occ_clock_monitor;
               end
               23: begin
                   -> _stop_clock_monitor_0;
               end
               default: begin
                  $display("ERROR: corrupt message index\n");
                  if (_allow_bad_message_index != 1) begin
                     ->before_finish;
                     #0;
                     $finish;
                  end
               end
            endcase // _message_index
         end
         default: begin
            $display("ERROR: corrupt vector number\n");
            ->before_finish;
            #0;
            $finish;
         end
      endcase
   end // if in_range
      else begin
      case (_pat_type)  // _pat_type = vect[6:4]; 
         3'b011:  begin // status message vector
            _message_index = vect[38:7];
            case (_message_index)
               0: begin
                  _chain_test_ = 1;
                  _diag_chain_header = 0;
               end
               1: begin
                  if (_pat_num > -1) begin
                    $display("Skipped chain pattern %d\n",_pat_num);
                  end
                  _chain_test_ = 0;
                  _pat_num = -1;
                  $display("End chain test\n");
               end
               3: begin 
                  _end_vec_file_ok = 1;
                  if (_pat_num > -1) begin
                    if (!_chain_test_) begin
                      $display("Skipped pattern %d\n",_pat_num);
                    end
                  end
               end
               4: begin // start of atpg pattern
                  if (_pat_num > -1) begin
                    if (!_chain_test_) begin
                      _skipped_patterns = _skipped_patterns + 1;
                    end
                  end
                  if (_pat_num > -1) begin
                    if (_chain_test_) begin
                      $display("Skipped chain pattern %d\n",_pat_num);
                    end
                    else begin
                      $display("Skipped pattern %d\n",_pat_num);
                    end
                  end
                  _pat_num = _pat_num + 1;
                  _run_testsetup  = 0;
                  _in_testsetup  = 0;
                  if (_end_after_setup  > 0) begin
                    //simulation complete, exit
                    _index = _max_index + 1;
                    _end_vec_file_ok = 1;
                    _end_simulation = 1;
                    _in_range = 0;
                  end
               end
               default: begin
                  // Skip
               end
            endcase // _message_index
         end
         default: begin
            // Skip
         end
      endcase
      end // else !_in_range
   end // index loop
end // file_cnt loop

if (_save_state == 1) begin
  #1;
  mgcdft_save_signal = 1'b1;
//  $display("Writing checkpoint patterns/picorv32_transition_serial.v.dat");
//  $save("patterns/picorv32_transition_serial.v.dat");
  if (_in_restart == 2) begin
    _in_restart = 1;
  end
  #1;
  $stop;
end
end
end  // while _in_restart
 if (_DIAG_file_header == 1) begin
    $fwrite(_diag_file, " failures_end\n");
    $fwrite(_diag_file, " failure_buffer_limit_reached none\n");
    if (_diag_scan_header==1) begin
      $fwrite(_diag_file, "last_cycle_applied %d\n", (_cycle_count-1));
    end
    $fwrite(_diag_file, "total_cycles 2160\n");
    $fwrite(_diag_file, "// failing_patterns=%d simulated_patterns=%d", _fail_pattern_cnt, (_pattern_count+1));
    $fwrite(_diag_file, " simulation_time=", $realtime, ";\n");
    $fwrite(_diag_file, "failure_file_end\n");
    $fclose(_diag_file);
 end


#1;
if (_end_vec_file_ok == 0) begin
  $display("ERROR: Pattern file corrupted, simulation aborted\n");
end
if ((_end_vec_file_ok) && (_compare_fail == 0)) begin
   $display("No error between simulated and expected patterns\n");
end

if (_compare_fail != 0) begin
   $display("Error between simulated and expected patterns\n");
end

#1;
->before_finish;
#0;
$finish;
end
endmodule
