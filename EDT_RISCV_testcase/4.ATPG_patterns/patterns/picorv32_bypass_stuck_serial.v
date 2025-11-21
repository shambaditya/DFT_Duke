//
// Verilog format test patterns produced by Tessent Shell 2024.4
// Filename       : patterns/picorv32_bypass_stuck_serial.v
// Scan operation : SERIAL
// Idstamp        : 2024.4:f61e:d8ce:2:d089
// Fault          : STUCK
// Coverage       : 87.39(TC) 80.89(FC)
// Date           : Thu Nov 20 22:17:00 2025
//
// Begin_Verify_Section 
//   format            = Verilog 
//   top_module_name   = picorv32_picorv32_bypass_stuck_serial_v_ctl 
//   serial_flag       = ON 
//   test_set_type     = ALL_TEST 
//   test_set_source   = SCAN_ATPG 
//   pad_value         = X 
//   pattern_begin     = 0 
//   pattern_end       = 1 
//   one_setup         = ON 
//   no_initialization = ON 
//   pattern_checksum  = 29712 
// End_Verify_Section 
// Parameter File Keyword Settings 
//   SIM_KEEP_PATH             true ; 
// End Parameter File Keyword Settings 


`define SIM_INSTANCE_NAME picorv32_inst


`timescale 1ns / 1ns

module picorv32_picorv32_bypass_stuck_serial_v_ctl;

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
reg[308:0]    _found_fail_obus;
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
reg[110:0]    _ibus;
reg[308:0]    _exp_obus, _msk_obus;
wire[308:0]   _sim_obus;
reg[2:0]    _pat_type;
reg         _tp_num;
reg         mgcdft_save_signal, mgcdft_restart_signal;
reg[737:0]   vect;

wire clk, resetn, mem_ready, \mem_rdata[31] , \mem_rdata[30] , \mem_rdata[29] , 
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
     \picorv32_rtl1_controller_c1_edt_channels_in[0] , trap, mem_valid, 
     mem_instr, \mem_addr[31] , \mem_addr[30] , \mem_addr[29] , \mem_addr[28] , 
     \mem_addr[27] , \mem_addr[26] , \mem_addr[25] , \mem_addr[24] , 
     \mem_addr[23] , \mem_addr[22] , \mem_addr[21] , \mem_addr[20] , 
     \mem_addr[19] , \mem_addr[18] , \mem_addr[17] , \mem_addr[16] , 
     \mem_addr[15] , \mem_addr[14] , \mem_addr[13] , \mem_addr[12] , 
     \mem_addr[11] , \mem_addr[10] , \mem_addr[9] , \mem_addr[8] , 
     \mem_addr[7] , \mem_addr[6] , \mem_addr[5] , \mem_addr[4] , \mem_addr[3] , 
     \mem_addr[2] , \mem_addr[1] , \mem_addr[0] , \mem_wdata[31] , 
     \mem_wdata[30] , \mem_wdata[29] , \mem_wdata[28] , \mem_wdata[27] , 
     \mem_wdata[26] , \mem_wdata[25] , \mem_wdata[24] , \mem_wdata[23] , 
     \mem_wdata[22] , \mem_wdata[21] , \mem_wdata[20] , \mem_wdata[19] , 
     \mem_wdata[18] , \mem_wdata[17] , \mem_wdata[16] , \mem_wdata[15] , 
     \mem_wdata[14] , \mem_wdata[13] , \mem_wdata[12] , \mem_wdata[11] , 
     \mem_wdata[10] , \mem_wdata[9] , \mem_wdata[8] , \mem_wdata[7] , 
     \mem_wdata[6] , \mem_wdata[5] , \mem_wdata[4] , \mem_wdata[3] , 
     \mem_wdata[2] , \mem_wdata[1] , \mem_wdata[0] , \mem_wstrb[3] , 
     \mem_wstrb[2] , \mem_wstrb[1] , \mem_wstrb[0] , mem_la_read, mem_la_write, 
     \mem_la_addr[31] , \mem_la_addr[30] , \mem_la_addr[29] , \mem_la_addr[28] , 
     \mem_la_addr[27] , \mem_la_addr[26] , \mem_la_addr[25] , \mem_la_addr[24] , 
     \mem_la_addr[23] , \mem_la_addr[22] , \mem_la_addr[21] , \mem_la_addr[20] , 
     \mem_la_addr[19] , \mem_la_addr[18] , \mem_la_addr[17] , \mem_la_addr[16] , 
     \mem_la_addr[15] , \mem_la_addr[14] , \mem_la_addr[13] , \mem_la_addr[12] , 
     \mem_la_addr[11] , \mem_la_addr[10] , \mem_la_addr[9] , \mem_la_addr[8] , 
     \mem_la_addr[7] , \mem_la_addr[6] , \mem_la_addr[5] , \mem_la_addr[4] , 
     \mem_la_addr[3] , \mem_la_addr[2] , \mem_la_addr[1] , \mem_la_addr[0] , 
     \mem_la_wdata[31] , \mem_la_wdata[30] , \mem_la_wdata[29] , \mem_la_wdata[28] , 
     \mem_la_wdata[27] , \mem_la_wdata[26] , \mem_la_wdata[25] , \mem_la_wdata[24] , 
     \mem_la_wdata[23] , \mem_la_wdata[22] , \mem_la_wdata[21] , \mem_la_wdata[20] , 
     \mem_la_wdata[19] , \mem_la_wdata[18] , \mem_la_wdata[17] , \mem_la_wdata[16] , 
     \mem_la_wdata[15] , \mem_la_wdata[14] , \mem_la_wdata[13] , \mem_la_wdata[12] , 
     \mem_la_wdata[11] , \mem_la_wdata[10] , \mem_la_wdata[9] , \mem_la_wdata[8] , 
     \mem_la_wdata[7] , \mem_la_wdata[6] , \mem_la_wdata[5] , \mem_la_wdata[4] , 
     \mem_la_wdata[3] , \mem_la_wdata[2] , \mem_la_wdata[1] , \mem_la_wdata[0] , 
     \mem_la_wstrb[3] , \mem_la_wstrb[2] , \mem_la_wstrb[1] , \mem_la_wstrb[0] , 
     pcpi_valid, \pcpi_insn[31] , \pcpi_insn[30] , \pcpi_insn[29] , 
     \pcpi_insn[28] , \pcpi_insn[27] , \pcpi_insn[26] , \pcpi_insn[25] , 
     \pcpi_insn[24] , \pcpi_insn[23] , \pcpi_insn[22] , \pcpi_insn[21] , 
     \pcpi_insn[20] , \pcpi_insn[19] , \pcpi_insn[18] , \pcpi_insn[17] , 
     \pcpi_insn[16] , \pcpi_insn[15] , \pcpi_insn[14] , \pcpi_insn[13] , 
     \pcpi_insn[12] , \pcpi_insn[11] , \pcpi_insn[10] , \pcpi_insn[9] , 
     \pcpi_insn[8] , \pcpi_insn[7] , \pcpi_insn[6] , \pcpi_insn[5] , 
     \pcpi_insn[4] , \pcpi_insn[3] , \pcpi_insn[2] , \pcpi_insn[1] , 
     \pcpi_insn[0] , \pcpi_rs1[31] , \pcpi_rs1[30] , \pcpi_rs1[29] , 
     \pcpi_rs1[28] , \pcpi_rs1[27] , \pcpi_rs1[26] , \pcpi_rs1[25] , 
     \pcpi_rs1[24] , \pcpi_rs1[23] , \pcpi_rs1[22] , \pcpi_rs1[21] , 
     \pcpi_rs1[20] , \pcpi_rs1[19] , \pcpi_rs1[18] , \pcpi_rs1[17] , 
     \pcpi_rs1[16] , \pcpi_rs1[15] , \pcpi_rs1[14] , \pcpi_rs1[13] , 
     \pcpi_rs1[12] , \pcpi_rs1[11] , \pcpi_rs1[10] , \pcpi_rs1[9] , 
     \pcpi_rs1[8] , \pcpi_rs1[7] , \pcpi_rs1[6] , \pcpi_rs1[5] , \pcpi_rs1[4] , 
     \pcpi_rs1[3] , \pcpi_rs1[2] , \pcpi_rs1[1] , \pcpi_rs1[0] , \pcpi_rs2[31] , 
     \pcpi_rs2[30] , \pcpi_rs2[29] , \pcpi_rs2[28] , \pcpi_rs2[27] , 
     \pcpi_rs2[26] , \pcpi_rs2[25] , \pcpi_rs2[24] , \pcpi_rs2[23] , 
     \pcpi_rs2[22] , \pcpi_rs2[21] , \pcpi_rs2[20] , \pcpi_rs2[19] , 
     \pcpi_rs2[18] , \pcpi_rs2[17] , \pcpi_rs2[16] , \pcpi_rs2[15] , 
     \pcpi_rs2[14] , \pcpi_rs2[13] , \pcpi_rs2[12] , \pcpi_rs2[11] , 
     \pcpi_rs2[10] , \pcpi_rs2[9] , \pcpi_rs2[8] , \pcpi_rs2[7] , \pcpi_rs2[6] , 
     \pcpi_rs2[5] , \pcpi_rs2[4] , \pcpi_rs2[3] , \pcpi_rs2[2] , \pcpi_rs2[1] , 
     \pcpi_rs2[0] , \eoi[31] , \eoi[30] , \eoi[29] , \eoi[28] , \eoi[27] , 
     \eoi[26] , \eoi[25] , \eoi[24] , \eoi[23] , \eoi[22] , \eoi[21] , 
     \eoi[20] , \eoi[19] , \eoi[18] , \eoi[17] , \eoi[16] , \eoi[15] , 
     \eoi[14] , \eoi[13] , \eoi[12] , \eoi[11] , \eoi[10] , \eoi[9] , 
     \eoi[8] , \eoi[7] , \eoi[6] , \eoi[5] , \eoi[4] , \eoi[3] , \eoi[2] , 
     \eoi[1] , \eoi[0] , trace_valid, \trace_data[35] , \trace_data[34] , 
     \trace_data[33] , \trace_data[32] , \trace_data[31] , \trace_data[30] , 
     \trace_data[29] , \trace_data[28] , \trace_data[27] , \trace_data[26] , 
     \trace_data[25] , \trace_data[24] , \trace_data[23] , \trace_data[22] , 
     \trace_data[21] , \trace_data[20] , \trace_data[19] , \trace_data[18] , 
     \trace_data[17] , \trace_data[16] , \trace_data[15] , \trace_data[14] , 
     \trace_data[13] , \trace_data[12] , \trace_data[11] , \trace_data[10] , 
     \trace_data[9] , \trace_data[8] , \trace_data[7] , \trace_data[6] , 
     \trace_data[5] , \trace_data[4] , \trace_data[3] , \trace_data[2] , 
     \trace_data[1] , \trace_data[0] , \picorv32_rtl1_controller_c1_edt_channels_out[1] , 
     \picorv32_rtl1_controller_c1_edt_channels_out[0] ;

event       before_finish;
assign clk = _ibus[110];
assign resetn = _ibus[109];
assign mem_ready = _ibus[108];
assign \mem_rdata[31]  = _ibus[107];
assign \mem_rdata[30]  = _ibus[106];
assign \mem_rdata[29]  = _ibus[105];
assign \mem_rdata[28]  = _ibus[104];
assign \mem_rdata[27]  = _ibus[103];
assign \mem_rdata[26]  = _ibus[102];
assign \mem_rdata[25]  = _ibus[101];
assign \mem_rdata[24]  = _ibus[100];
assign \mem_rdata[23]  = _ibus[99];
assign \mem_rdata[22]  = _ibus[98];
assign \mem_rdata[21]  = _ibus[97];
assign \mem_rdata[20]  = _ibus[96];
assign \mem_rdata[19]  = _ibus[95];
assign \mem_rdata[18]  = _ibus[94];
assign \mem_rdata[17]  = _ibus[93];
assign \mem_rdata[16]  = _ibus[92];
assign \mem_rdata[15]  = _ibus[91];
assign \mem_rdata[14]  = _ibus[90];
assign \mem_rdata[13]  = _ibus[89];
assign \mem_rdata[12]  = _ibus[88];
assign \mem_rdata[11]  = _ibus[87];
assign \mem_rdata[10]  = _ibus[86];
assign \mem_rdata[9]  = _ibus[85];
assign \mem_rdata[8]  = _ibus[84];
assign \mem_rdata[7]  = _ibus[83];
assign \mem_rdata[6]  = _ibus[82];
assign \mem_rdata[5]  = _ibus[81];
assign \mem_rdata[4]  = _ibus[80];
assign \mem_rdata[3]  = _ibus[79];
assign \mem_rdata[2]  = _ibus[78];
assign \mem_rdata[1]  = _ibus[77];
assign \mem_rdata[0]  = _ibus[76];
assign pcpi_wr = _ibus[75];
assign \pcpi_rd[31]  = _ibus[74];
assign \pcpi_rd[30]  = _ibus[73];
assign \pcpi_rd[29]  = _ibus[72];
assign \pcpi_rd[28]  = _ibus[71];
assign \pcpi_rd[27]  = _ibus[70];
assign \pcpi_rd[26]  = _ibus[69];
assign \pcpi_rd[25]  = _ibus[68];
assign \pcpi_rd[24]  = _ibus[67];
assign \pcpi_rd[23]  = _ibus[66];
assign \pcpi_rd[22]  = _ibus[65];
assign \pcpi_rd[21]  = _ibus[64];
assign \pcpi_rd[20]  = _ibus[63];
assign \pcpi_rd[19]  = _ibus[62];
assign \pcpi_rd[18]  = _ibus[61];
assign \pcpi_rd[17]  = _ibus[60];
assign \pcpi_rd[16]  = _ibus[59];
assign \pcpi_rd[15]  = _ibus[58];
assign \pcpi_rd[14]  = _ibus[57];
assign \pcpi_rd[13]  = _ibus[56];
assign \pcpi_rd[12]  = _ibus[55];
assign \pcpi_rd[11]  = _ibus[54];
assign \pcpi_rd[10]  = _ibus[53];
assign \pcpi_rd[9]  = _ibus[52];
assign \pcpi_rd[8]  = _ibus[51];
assign \pcpi_rd[7]  = _ibus[50];
assign \pcpi_rd[6]  = _ibus[49];
assign \pcpi_rd[5]  = _ibus[48];
assign \pcpi_rd[4]  = _ibus[47];
assign \pcpi_rd[3]  = _ibus[46];
assign \pcpi_rd[2]  = _ibus[45];
assign \pcpi_rd[1]  = _ibus[44];
assign \pcpi_rd[0]  = _ibus[43];
assign pcpi_wait = _ibus[42];
assign pcpi_ready = _ibus[41];
assign \irq[31]  = _ibus[40];
assign \irq[30]  = _ibus[39];
assign \irq[29]  = _ibus[38];
assign \irq[28]  = _ibus[37];
assign \irq[27]  = _ibus[36];
assign \irq[26]  = _ibus[35];
assign \irq[25]  = _ibus[34];
assign \irq[24]  = _ibus[33];
assign \irq[23]  = _ibus[32];
assign \irq[22]  = _ibus[31];
assign \irq[21]  = _ibus[30];
assign \irq[20]  = _ibus[29];
assign \irq[19]  = _ibus[28];
assign \irq[18]  = _ibus[27];
assign \irq[17]  = _ibus[26];
assign \irq[16]  = _ibus[25];
assign \irq[15]  = _ibus[24];
assign \irq[14]  = _ibus[23];
assign \irq[13]  = _ibus[22];
assign \irq[12]  = _ibus[21];
assign \irq[11]  = _ibus[20];
assign \irq[10]  = _ibus[19];
assign \irq[9]  = _ibus[18];
assign \irq[8]  = _ibus[17];
assign \irq[7]  = _ibus[16];
assign \irq[6]  = _ibus[15];
assign \irq[5]  = _ibus[14];
assign \irq[4]  = _ibus[13];
assign \irq[3]  = _ibus[12];
assign \irq[2]  = _ibus[11];
assign \irq[1]  = _ibus[10];
assign \irq[0]  = _ibus[9];
assign scan_en_w = _ibus[8];
assign edt_update = 1'b0;
assign test_clock_w = _ibus[7];
assign test_mode = _ibus[6];
assign fast_capture_mode = 1'b0;
assign capture_cycle_width_1 = _ibus[5];
assign capture_cycle_width_0 = 1'b0;
assign edt_bypass = _ibus[4];
assign edt_configuration = _ibus[3];
assign edt_low_power_shift_en = _ibus[2];
assign \picorv32_rtl1_controller_c1_edt_channels_in[1]  = _ibus[1];
assign \picorv32_rtl1_controller_c1_edt_channels_in[0]  = _ibus[0];

assign _sim_obus[308] = trap;
assign _sim_obus[307] = mem_valid;
assign _sim_obus[306] = mem_instr;
assign _sim_obus[305] = \mem_addr[31] ;
assign _sim_obus[304] = \mem_addr[30] ;
assign _sim_obus[303] = \mem_addr[29] ;
assign _sim_obus[302] = \mem_addr[28] ;
assign _sim_obus[301] = \mem_addr[27] ;
assign _sim_obus[300] = \mem_addr[26] ;
assign _sim_obus[299] = \mem_addr[25] ;
assign _sim_obus[298] = \mem_addr[24] ;
assign _sim_obus[297] = \mem_addr[23] ;
assign _sim_obus[296] = \mem_addr[22] ;
assign _sim_obus[295] = \mem_addr[21] ;
assign _sim_obus[294] = \mem_addr[20] ;
assign _sim_obus[293] = \mem_addr[19] ;
assign _sim_obus[292] = \mem_addr[18] ;
assign _sim_obus[291] = \mem_addr[17] ;
assign _sim_obus[290] = \mem_addr[16] ;
assign _sim_obus[289] = \mem_addr[15] ;
assign _sim_obus[288] = \mem_addr[14] ;
assign _sim_obus[287] = \mem_addr[13] ;
assign _sim_obus[286] = \mem_addr[12] ;
assign _sim_obus[285] = \mem_addr[11] ;
assign _sim_obus[284] = \mem_addr[10] ;
assign _sim_obus[283] = \mem_addr[9] ;
assign _sim_obus[282] = \mem_addr[8] ;
assign _sim_obus[281] = \mem_addr[7] ;
assign _sim_obus[280] = \mem_addr[6] ;
assign _sim_obus[279] = \mem_addr[5] ;
assign _sim_obus[278] = \mem_addr[4] ;
assign _sim_obus[277] = \mem_addr[3] ;
assign _sim_obus[276] = \mem_addr[2] ;
assign _sim_obus[275] = \mem_addr[1] ;
assign _sim_obus[274] = \mem_addr[0] ;
assign _sim_obus[273] = \mem_wdata[31] ;
assign _sim_obus[272] = \mem_wdata[30] ;
assign _sim_obus[271] = \mem_wdata[29] ;
assign _sim_obus[270] = \mem_wdata[28] ;
assign _sim_obus[269] = \mem_wdata[27] ;
assign _sim_obus[268] = \mem_wdata[26] ;
assign _sim_obus[267] = \mem_wdata[25] ;
assign _sim_obus[266] = \mem_wdata[24] ;
assign _sim_obus[265] = \mem_wdata[23] ;
assign _sim_obus[264] = \mem_wdata[22] ;
assign _sim_obus[263] = \mem_wdata[21] ;
assign _sim_obus[262] = \mem_wdata[20] ;
assign _sim_obus[261] = \mem_wdata[19] ;
assign _sim_obus[260] = \mem_wdata[18] ;
assign _sim_obus[259] = \mem_wdata[17] ;
assign _sim_obus[258] = \mem_wdata[16] ;
assign _sim_obus[257] = \mem_wdata[15] ;
assign _sim_obus[256] = \mem_wdata[14] ;
assign _sim_obus[255] = \mem_wdata[13] ;
assign _sim_obus[254] = \mem_wdata[12] ;
assign _sim_obus[253] = \mem_wdata[11] ;
assign _sim_obus[252] = \mem_wdata[10] ;
assign _sim_obus[251] = \mem_wdata[9] ;
assign _sim_obus[250] = \mem_wdata[8] ;
assign _sim_obus[249] = \mem_wdata[7] ;
assign _sim_obus[248] = \mem_wdata[6] ;
assign _sim_obus[247] = \mem_wdata[5] ;
assign _sim_obus[246] = \mem_wdata[4] ;
assign _sim_obus[245] = \mem_wdata[3] ;
assign _sim_obus[244] = \mem_wdata[2] ;
assign _sim_obus[243] = \mem_wdata[1] ;
assign _sim_obus[242] = \mem_wdata[0] ;
assign _sim_obus[241] = \mem_wstrb[3] ;
assign _sim_obus[240] = \mem_wstrb[2] ;
assign _sim_obus[239] = \mem_wstrb[1] ;
assign _sim_obus[238] = \mem_wstrb[0] ;
assign _sim_obus[237] = mem_la_read;
assign _sim_obus[236] = mem_la_write;
assign _sim_obus[235] = \mem_la_addr[31] ;
assign _sim_obus[234] = \mem_la_addr[30] ;
assign _sim_obus[233] = \mem_la_addr[29] ;
assign _sim_obus[232] = \mem_la_addr[28] ;
assign _sim_obus[231] = \mem_la_addr[27] ;
assign _sim_obus[230] = \mem_la_addr[26] ;
assign _sim_obus[229] = \mem_la_addr[25] ;
assign _sim_obus[228] = \mem_la_addr[24] ;
assign _sim_obus[227] = \mem_la_addr[23] ;
assign _sim_obus[226] = \mem_la_addr[22] ;
assign _sim_obus[225] = \mem_la_addr[21] ;
assign _sim_obus[224] = \mem_la_addr[20] ;
assign _sim_obus[223] = \mem_la_addr[19] ;
assign _sim_obus[222] = \mem_la_addr[18] ;
assign _sim_obus[221] = \mem_la_addr[17] ;
assign _sim_obus[220] = \mem_la_addr[16] ;
assign _sim_obus[219] = \mem_la_addr[15] ;
assign _sim_obus[218] = \mem_la_addr[14] ;
assign _sim_obus[217] = \mem_la_addr[13] ;
assign _sim_obus[216] = \mem_la_addr[12] ;
assign _sim_obus[215] = \mem_la_addr[11] ;
assign _sim_obus[214] = \mem_la_addr[10] ;
assign _sim_obus[213] = \mem_la_addr[9] ;
assign _sim_obus[212] = \mem_la_addr[8] ;
assign _sim_obus[211] = \mem_la_addr[7] ;
assign _sim_obus[210] = \mem_la_addr[6] ;
assign _sim_obus[209] = \mem_la_addr[5] ;
assign _sim_obus[208] = \mem_la_addr[4] ;
assign _sim_obus[207] = \mem_la_addr[3] ;
assign _sim_obus[206] = \mem_la_addr[2] ;
assign _sim_obus[205] = \mem_la_addr[1] ;
assign _sim_obus[204] = \mem_la_addr[0] ;
assign _sim_obus[203] = \mem_la_wdata[31] ;
assign _sim_obus[202] = \mem_la_wdata[30] ;
assign _sim_obus[201] = \mem_la_wdata[29] ;
assign _sim_obus[200] = \mem_la_wdata[28] ;
assign _sim_obus[199] = \mem_la_wdata[27] ;
assign _sim_obus[198] = \mem_la_wdata[26] ;
assign _sim_obus[197] = \mem_la_wdata[25] ;
assign _sim_obus[196] = \mem_la_wdata[24] ;
assign _sim_obus[195] = \mem_la_wdata[23] ;
assign _sim_obus[194] = \mem_la_wdata[22] ;
assign _sim_obus[193] = \mem_la_wdata[21] ;
assign _sim_obus[192] = \mem_la_wdata[20] ;
assign _sim_obus[191] = \mem_la_wdata[19] ;
assign _sim_obus[190] = \mem_la_wdata[18] ;
assign _sim_obus[189] = \mem_la_wdata[17] ;
assign _sim_obus[188] = \mem_la_wdata[16] ;
assign _sim_obus[187] = \mem_la_wdata[15] ;
assign _sim_obus[186] = \mem_la_wdata[14] ;
assign _sim_obus[185] = \mem_la_wdata[13] ;
assign _sim_obus[184] = \mem_la_wdata[12] ;
assign _sim_obus[183] = \mem_la_wdata[11] ;
assign _sim_obus[182] = \mem_la_wdata[10] ;
assign _sim_obus[181] = \mem_la_wdata[9] ;
assign _sim_obus[180] = \mem_la_wdata[8] ;
assign _sim_obus[179] = \mem_la_wdata[7] ;
assign _sim_obus[178] = \mem_la_wdata[6] ;
assign _sim_obus[177] = \mem_la_wdata[5] ;
assign _sim_obus[176] = \mem_la_wdata[4] ;
assign _sim_obus[175] = \mem_la_wdata[3] ;
assign _sim_obus[174] = \mem_la_wdata[2] ;
assign _sim_obus[173] = \mem_la_wdata[1] ;
assign _sim_obus[172] = \mem_la_wdata[0] ;
assign _sim_obus[171] = \mem_la_wstrb[3] ;
assign _sim_obus[170] = \mem_la_wstrb[2] ;
assign _sim_obus[169] = \mem_la_wstrb[1] ;
assign _sim_obus[168] = \mem_la_wstrb[0] ;
assign _sim_obus[167] = pcpi_valid;
assign _sim_obus[166] = \pcpi_insn[31] ;
assign _sim_obus[165] = \pcpi_insn[30] ;
assign _sim_obus[164] = \pcpi_insn[29] ;
assign _sim_obus[163] = \pcpi_insn[28] ;
assign _sim_obus[162] = \pcpi_insn[27] ;
assign _sim_obus[161] = \pcpi_insn[26] ;
assign _sim_obus[160] = \pcpi_insn[25] ;
assign _sim_obus[159] = \pcpi_insn[24] ;
assign _sim_obus[158] = \pcpi_insn[23] ;
assign _sim_obus[157] = \pcpi_insn[22] ;
assign _sim_obus[156] = \pcpi_insn[21] ;
assign _sim_obus[155] = \pcpi_insn[20] ;
assign _sim_obus[154] = \pcpi_insn[19] ;
assign _sim_obus[153] = \pcpi_insn[18] ;
assign _sim_obus[152] = \pcpi_insn[17] ;
assign _sim_obus[151] = \pcpi_insn[16] ;
assign _sim_obus[150] = \pcpi_insn[15] ;
assign _sim_obus[149] = \pcpi_insn[14] ;
assign _sim_obus[148] = \pcpi_insn[13] ;
assign _sim_obus[147] = \pcpi_insn[12] ;
assign _sim_obus[146] = \pcpi_insn[11] ;
assign _sim_obus[145] = \pcpi_insn[10] ;
assign _sim_obus[144] = \pcpi_insn[9] ;
assign _sim_obus[143] = \pcpi_insn[8] ;
assign _sim_obus[142] = \pcpi_insn[7] ;
assign _sim_obus[141] = \pcpi_insn[6] ;
assign _sim_obus[140] = \pcpi_insn[5] ;
assign _sim_obus[139] = \pcpi_insn[4] ;
assign _sim_obus[138] = \pcpi_insn[3] ;
assign _sim_obus[137] = \pcpi_insn[2] ;
assign _sim_obus[136] = \pcpi_insn[1] ;
assign _sim_obus[135] = \pcpi_insn[0] ;
assign _sim_obus[134] = \pcpi_rs1[31] ;
assign _sim_obus[133] = \pcpi_rs1[30] ;
assign _sim_obus[132] = \pcpi_rs1[29] ;
assign _sim_obus[131] = \pcpi_rs1[28] ;
assign _sim_obus[130] = \pcpi_rs1[27] ;
assign _sim_obus[129] = \pcpi_rs1[26] ;
assign _sim_obus[128] = \pcpi_rs1[25] ;
assign _sim_obus[127] = \pcpi_rs1[24] ;
assign _sim_obus[126] = \pcpi_rs1[23] ;
assign _sim_obus[125] = \pcpi_rs1[22] ;
assign _sim_obus[124] = \pcpi_rs1[21] ;
assign _sim_obus[123] = \pcpi_rs1[20] ;
assign _sim_obus[122] = \pcpi_rs1[19] ;
assign _sim_obus[121] = \pcpi_rs1[18] ;
assign _sim_obus[120] = \pcpi_rs1[17] ;
assign _sim_obus[119] = \pcpi_rs1[16] ;
assign _sim_obus[118] = \pcpi_rs1[15] ;
assign _sim_obus[117] = \pcpi_rs1[14] ;
assign _sim_obus[116] = \pcpi_rs1[13] ;
assign _sim_obus[115] = \pcpi_rs1[12] ;
assign _sim_obus[114] = \pcpi_rs1[11] ;
assign _sim_obus[113] = \pcpi_rs1[10] ;
assign _sim_obus[112] = \pcpi_rs1[9] ;
assign _sim_obus[111] = \pcpi_rs1[8] ;
assign _sim_obus[110] = \pcpi_rs1[7] ;
assign _sim_obus[109] = \pcpi_rs1[6] ;
assign _sim_obus[108] = \pcpi_rs1[5] ;
assign _sim_obus[107] = \pcpi_rs1[4] ;
assign _sim_obus[106] = \pcpi_rs1[3] ;
assign _sim_obus[105] = \pcpi_rs1[2] ;
assign _sim_obus[104] = \pcpi_rs1[1] ;
assign _sim_obus[103] = \pcpi_rs1[0] ;
assign _sim_obus[102] = \pcpi_rs2[31] ;
assign _sim_obus[101] = \pcpi_rs2[30] ;
assign _sim_obus[100] = \pcpi_rs2[29] ;
assign _sim_obus[99] = \pcpi_rs2[28] ;
assign _sim_obus[98] = \pcpi_rs2[27] ;
assign _sim_obus[97] = \pcpi_rs2[26] ;
assign _sim_obus[96] = \pcpi_rs2[25] ;
assign _sim_obus[95] = \pcpi_rs2[24] ;
assign _sim_obus[94] = \pcpi_rs2[23] ;
assign _sim_obus[93] = \pcpi_rs2[22] ;
assign _sim_obus[92] = \pcpi_rs2[21] ;
assign _sim_obus[91] = \pcpi_rs2[20] ;
assign _sim_obus[90] = \pcpi_rs2[19] ;
assign _sim_obus[89] = \pcpi_rs2[18] ;
assign _sim_obus[88] = \pcpi_rs2[17] ;
assign _sim_obus[87] = \pcpi_rs2[16] ;
assign _sim_obus[86] = \pcpi_rs2[15] ;
assign _sim_obus[85] = \pcpi_rs2[14] ;
assign _sim_obus[84] = \pcpi_rs2[13] ;
assign _sim_obus[83] = \pcpi_rs2[12] ;
assign _sim_obus[82] = \pcpi_rs2[11] ;
assign _sim_obus[81] = \pcpi_rs2[10] ;
assign _sim_obus[80] = \pcpi_rs2[9] ;
assign _sim_obus[79] = \pcpi_rs2[8] ;
assign _sim_obus[78] = \pcpi_rs2[7] ;
assign _sim_obus[77] = \pcpi_rs2[6] ;
assign _sim_obus[76] = \pcpi_rs2[5] ;
assign _sim_obus[75] = \pcpi_rs2[4] ;
assign _sim_obus[74] = \pcpi_rs2[3] ;
assign _sim_obus[73] = \pcpi_rs2[2] ;
assign _sim_obus[72] = \pcpi_rs2[1] ;
assign _sim_obus[71] = \pcpi_rs2[0] ;
assign _sim_obus[70] = \eoi[31] ;
assign _sim_obus[69] = \eoi[30] ;
assign _sim_obus[68] = \eoi[29] ;
assign _sim_obus[67] = \eoi[28] ;
assign _sim_obus[66] = \eoi[27] ;
assign _sim_obus[65] = \eoi[26] ;
assign _sim_obus[64] = \eoi[25] ;
assign _sim_obus[63] = \eoi[24] ;
assign _sim_obus[62] = \eoi[23] ;
assign _sim_obus[61] = \eoi[22] ;
assign _sim_obus[60] = \eoi[21] ;
assign _sim_obus[59] = \eoi[20] ;
assign _sim_obus[58] = \eoi[19] ;
assign _sim_obus[57] = \eoi[18] ;
assign _sim_obus[56] = \eoi[17] ;
assign _sim_obus[55] = \eoi[16] ;
assign _sim_obus[54] = \eoi[15] ;
assign _sim_obus[53] = \eoi[14] ;
assign _sim_obus[52] = \eoi[13] ;
assign _sim_obus[51] = \eoi[12] ;
assign _sim_obus[50] = \eoi[11] ;
assign _sim_obus[49] = \eoi[10] ;
assign _sim_obus[48] = \eoi[9] ;
assign _sim_obus[47] = \eoi[8] ;
assign _sim_obus[46] = \eoi[7] ;
assign _sim_obus[45] = \eoi[6] ;
assign _sim_obus[44] = \eoi[5] ;
assign _sim_obus[43] = \eoi[4] ;
assign _sim_obus[42] = \eoi[3] ;
assign _sim_obus[41] = \eoi[2] ;
assign _sim_obus[40] = \eoi[1] ;
assign _sim_obus[39] = \eoi[0] ;
assign _sim_obus[38] = trace_valid;
assign _sim_obus[37] = \trace_data[35] ;
assign _sim_obus[36] = \trace_data[34] ;
assign _sim_obus[35] = \trace_data[33] ;
assign _sim_obus[34] = \trace_data[32] ;
assign _sim_obus[33] = \trace_data[31] ;
assign _sim_obus[32] = \trace_data[30] ;
assign _sim_obus[31] = \trace_data[29] ;
assign _sim_obus[30] = \trace_data[28] ;
assign _sim_obus[29] = \trace_data[27] ;
assign _sim_obus[28] = \trace_data[26] ;
assign _sim_obus[27] = \trace_data[25] ;
assign _sim_obus[26] = \trace_data[24] ;
assign _sim_obus[25] = \trace_data[23] ;
assign _sim_obus[24] = \trace_data[22] ;
assign _sim_obus[23] = \trace_data[21] ;
assign _sim_obus[22] = \trace_data[20] ;
assign _sim_obus[21] = \trace_data[19] ;
assign _sim_obus[20] = \trace_data[18] ;
assign _sim_obus[19] = \trace_data[17] ;
assign _sim_obus[18] = \trace_data[16] ;
assign _sim_obus[17] = \trace_data[15] ;
assign _sim_obus[16] = \trace_data[14] ;
assign _sim_obus[15] = \trace_data[13] ;
assign _sim_obus[14] = \trace_data[12] ;
assign _sim_obus[13] = \trace_data[11] ;
assign _sim_obus[12] = \trace_data[10] ;
assign _sim_obus[11] = \trace_data[9] ;
assign _sim_obus[10] = \trace_data[8] ;
assign _sim_obus[9] = \trace_data[7] ;
assign _sim_obus[8] = \trace_data[6] ;
assign _sim_obus[7] = \trace_data[5] ;
assign _sim_obus[6] = \trace_data[4] ;
assign _sim_obus[5] = \trace_data[3] ;
assign _sim_obus[4] = \trace_data[2] ;
assign _sim_obus[3] = \trace_data[1] ;
assign _sim_obus[2] = \trace_data[0] ;
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
    $sformat(_vcd_dump_file_name, "patterns/picorv32_bypass_stuck_serial.v.dump");
    if(_change_out_path) begin 
      $sformat(_vcd_dump_file_name, "%0s/%0s", _new_out_path, _vcd_dump_file_name);
    end
    $dumpfile(_vcd_dump_file_name);
    $dumpvars;
`endif

`ifdef UTVCD
    $sformat(_utvcd_dump_file_name, "patterns/picorv32_bypass_stuck_serial.v.dump");
    if(_change_out_path) begin 
      $sformat(_utvcd_dump_file_name, "%0s/%0s", _new_out_path, _utvcd_dump_file_name);
    end
    $dumpfile(_utvcd_dump_file_name);
    $vtDump;
    $dumpvars;
`endif

`ifdef debussy
    $sformat(_fsdb_dump_file_name, "patterns/picorv32_bypass_stuck_serial.v.fsdb");
    if(_change_out_path) begin 
      $sformat(_fsdb_dump_file_name, "%0s/%0s", _new_out_path, _fsdb_dump_file_name);
    end
    $fsdbDumpfile(_fsdb_dump_file_name);
    $fsdbDumpvars;
`endif

`ifdef QWAVE
    $sformat(_qwave_dump_file_name, "patterns/picorv32_bypass_stuck_serial.v.qwave.db");
    if(_change_out_path) begin 
      $sformat(_qwave_dump_file_name, "%0s/%0s", _new_out_path, _qwave_dump_file_name);
    end
    $qwavedb_dumpvars_filename(_qwave_dump_file_name);
    $qwavedb_dumpvars;
`endif
end 

reg /* sparse */[375:0] _nam_obus[308:0];
initial begin 
   if(_change_path) begin 
     $sformat(_new_filename,"%0s/patterns/picorv32_bypass_stuck_serial.v.po.name",_new_path); 
     $display("Loading %0s\n", _new_filename ); 
     $readmemh(_new_filename,_nam_obus,308,0); 
   end 
   else begin
     $display("Loading patterns/picorv32_bypass_stuck_serial.v.po.name");
     $readmemh("patterns/picorv32_bypass_stuck_serial.v.po.name",_nam_obus,308,0);
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
         ((_bit_count < 309)&&(_found_fail==0));
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
         ((_bit_count < 309)&&((_miscompare_limit==0)||(_compare_fail<=_miscompare_limit)));
          _bit_count =_bit_count +1) begin
      if ((_msk_obus[_bit_count] === 1'b1) &&
          (_exp_obus[_bit_count] !== _sim_obus[_bit_count])) begin
        _found_fail_obus[_bit_count] = 1'b1;
        $write($realtime, "ns: Mismatch at pin %d name %s, Simulated %b, Expected %b\n",_bit_count,_nam_obus[_bit_count],_sim_obus[_bit_count],_exp_obus[_bit_count]);
        if (_write_MASK_file == 0) begin
         if (_scan_shift_count != 0) begin 
            case (_bit_count) // Scan Chain Failure 
              0: begin
                      $write($realtime, "ns: Mismatch on chain: picorv32_rtl1_tessent_edt_c1_inst__chain_1 cell: %d\n", (_scan_shift_count-1));
               end
              1: begin
                      $write($realtime, "ns: Mismatch on chain: picorv32_rtl1_tessent_edt_c1_inst__chain_2 cell: %d\n", (_scan_shift_count-1));
               end
            endcase
          end // _scan_shift_count
        end
        if (_write_DIAG_file == 1) begin
          if (_DIAG_file_header == 0) begin
            if ((_start_pat > -1) && (_end_pat > -1)) begin
              $sformat(_tmp_filename, "patterns/picorv32_bypass_stuck_serial.v_%0d_%0d.fail",
                       _start_pat, _end_pat);
            end
            else if (_start_pat > -1) begin
              $sformat(_tmp_filename, "patterns/picorv32_bypass_stuck_serial.v_%0d.fail",
                       _start_pat);
            end
            else if (_end_pat > -1) begin
              $sformat(_tmp_filename, "patterns/picorv32_bypass_stuck_serial.v__%0d.fail",
                       _end_pat);
            end
            else begin
              $sformat(_tmp_filename, "patterns/picorv32_bypass_stuck_serial.v.fail");
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
              $fwrite(_diag_file, "// This File is simulation generated (%0s/patterns/picorv32_bypass_stuck_serial.v)\n", _new_out_path);
            end
            else begin
              $fwrite(_diag_file, "// This File is simulation generated (patterns/picorv32_bypass_stuck_serial.v)\n");
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
                 $fwrite(_diag_file, "chain: picorv32_rtl1_tessent_edt_c1_inst__chain_1  cell: %d, simulation_time=%.0f\n", (_scan_shift_count-1), $realtime);
                end
            1: begin
                 $fwrite(_diag_file, "chain: picorv32_rtl1_tessent_edt_c1_inst__chain_2  cell: %d, simulation_time=%.0f\n", (_scan_shift_count-1), $realtime);
                end
          endcase
         end // EndIf  _ScanShift_count
        end // EndIf _write_DIAG_file
        if (_write_MASK_file == 1) begin
          if (_MASK_file_header == 0) begin
            if ((_start_pat > -1) && (_end_pat > -1)) begin
              $sformat(_tmp_filename, "patterns/picorv32_bypass_stuck_serial.v_%0d_%0d.mask",
                       _start_pat, _end_pat);
            end
            else if (_start_pat > -1) begin
              $sformat(_tmp_filename, "patterns/picorv32_bypass_stuck_serial.v_%0d.mask",
                       _start_pat);
            end
            else if (_end_pat > -1) begin
              $sformat(_tmp_filename, "patterns/picorv32_bypass_stuck_serial.v__%0d.mask",
                       _end_pat);
            end
            else begin
              $sformat(_tmp_filename, "patterns/picorv32_bypass_stuck_serial.v.mask");
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
                    $write($realtime, "ns: Mismatch on chain: picorv32_rtl1_tessent_edt_c1_inst__chain_1 cell: %d\n", (_scan_shift_count-1));
                 if (_chain_test_ == 0) begin
                   $fwrite(_mask_file, "%d %s %d\n",
                             _pattern_count, "picorv32_rtl1_tessent_edt_c1_inst__chain_1", (_scan_shift_count-1));
                   _wrote_fail = 1;
                 end
                 if (_chain_test_ == 1) begin
                   $fwrite(_mask_file, "// %d %s %d\n",
                    _pattern_count,"picorv32_rtl1_tessent_edt_c1_inst__chain_1", (_scan_shift_count-1));
                   _wrote_fail = 1;
                 end
               end
            1: begin
                    $write($realtime, "ns: Mismatch on chain: picorv32_rtl1_tessent_edt_c1_inst__chain_2 cell: %d\n", (_scan_shift_count-1));
                 if (_chain_test_ == 0) begin
                   $fwrite(_mask_file, "%d %s %d\n",
                             _pattern_count, "picorv32_rtl1_tessent_edt_c1_inst__chain_2", (_scan_shift_count-1));
                   _wrote_fail = 1;
                 end
                 if (_chain_test_ == 1) begin
                   $fwrite(_mask_file, "// %d %s %d\n",
                    _pattern_count,"picorv32_rtl1_tessent_edt_c1_inst__chain_2", (_scan_shift_count-1));
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

reg[737:0]     mem [0:363732];
picorv32 picorv32_inst (.clk(clk), .resetn(resetn), 
     .mem_ready(mem_ready), .mem_rdata({\mem_rdata[31] 
     , \mem_rdata[30] , \mem_rdata[29] , \mem_rdata[28] 
     , \mem_rdata[27] , \mem_rdata[26] , \mem_rdata[25] 
     , \mem_rdata[24] , \mem_rdata[23] , \mem_rdata[22] 
     , \mem_rdata[21] , \mem_rdata[20] , \mem_rdata[19] 
     , \mem_rdata[18] , \mem_rdata[17] , \mem_rdata[16] 
     , \mem_rdata[15] , \mem_rdata[14] , \mem_rdata[13] 
     , \mem_rdata[12] , \mem_rdata[11] , \mem_rdata[10] 
     , \mem_rdata[9] , \mem_rdata[8] , \mem_rdata[7] 
     , \mem_rdata[6] , \mem_rdata[5] , \mem_rdata[4] 
     , \mem_rdata[3] , \mem_rdata[2] , \mem_rdata[1] 
     , \mem_rdata[0] }), .pcpi_wr(pcpi_wr), .pcpi_rd({\pcpi_rd[31] 
     , \pcpi_rd[30] , \pcpi_rd[29] , \pcpi_rd[28] , \pcpi_rd[27] 
     , \pcpi_rd[26] , \pcpi_rd[25] , \pcpi_rd[24] , \pcpi_rd[23] 
     , \pcpi_rd[22] , \pcpi_rd[21] , \pcpi_rd[20] , \pcpi_rd[19] 
     , \pcpi_rd[18] , \pcpi_rd[17] , \pcpi_rd[16] , \pcpi_rd[15] 
     , \pcpi_rd[14] , \pcpi_rd[13] , \pcpi_rd[12] , \pcpi_rd[11] 
     , \pcpi_rd[10] , \pcpi_rd[9] , \pcpi_rd[8] , \pcpi_rd[7] 
     , \pcpi_rd[6] , \pcpi_rd[5] , \pcpi_rd[4] , \pcpi_rd[3] 
     , \pcpi_rd[2] , \pcpi_rd[1] , \pcpi_rd[0] }), 
     .pcpi_wait(pcpi_wait), .pcpi_ready(pcpi_ready), 
     .irq({\irq[31] , \irq[30] , \irq[29] , \irq[28] , \irq[27] 
     , \irq[26] , \irq[25] , \irq[24] , \irq[23] , \irq[22] 
     , \irq[21] , \irq[20] , \irq[19] , \irq[18] , \irq[17] 
     , \irq[16] , \irq[15] , \irq[14] , \irq[13] , \irq[12] 
     , \irq[11] , \irq[10] , \irq[9] , \irq[8] , \irq[7] 
     , \irq[6] , \irq[5] , \irq[4] , \irq[3] , \irq[2] , \irq[1] 
     , \irq[0] }), .scan_en_w(scan_en_w), .edt_update(edt_update), 
     .test_clock_w(test_clock_w), .test_mode(test_mode), 
     .fast_capture_mode(fast_capture_mode), 
     .capture_cycle_width_1(capture_cycle_width_1), 
     .capture_cycle_width_0(capture_cycle_width_0), 
     .edt_bypass(edt_bypass), 
     .edt_configuration(edt_configuration), 
     .edt_low_power_shift_en(edt_low_power_shift_en), 
     .picorv32_rtl1_controller_c1_edt_channels_in({\picorv32_rtl1_controller_c1_edt_channels_in[1] 
     , \picorv32_rtl1_controller_c1_edt_channels_in[0] }), 
     .trap(trap), .mem_valid(mem_valid), .mem_instr(mem_instr), 
     .mem_addr({\mem_addr[31] , \mem_addr[30] , \mem_addr[29] 
     , \mem_addr[28] , \mem_addr[27] , \mem_addr[26] 
     , \mem_addr[25] , \mem_addr[24] , \mem_addr[23] 
     , \mem_addr[22] , \mem_addr[21] , \mem_addr[20] 
     , \mem_addr[19] , \mem_addr[18] , \mem_addr[17] 
     , \mem_addr[16] , \mem_addr[15] , \mem_addr[14] 
     , \mem_addr[13] , \mem_addr[12] , \mem_addr[11] 
     , \mem_addr[10] , \mem_addr[9] , \mem_addr[8] , \mem_addr[7] 
     , \mem_addr[6] , \mem_addr[5] , \mem_addr[4] , \mem_addr[3] 
     , \mem_addr[2] , \mem_addr[1] , \mem_addr[0] }), 
     .mem_wdata({\mem_wdata[31] , \mem_wdata[30] 
     , \mem_wdata[29] , \mem_wdata[28] , \mem_wdata[27] 
     , \mem_wdata[26] , \mem_wdata[25] , \mem_wdata[24] 
     , \mem_wdata[23] , \mem_wdata[22] , \mem_wdata[21] 
     , \mem_wdata[20] , \mem_wdata[19] , \mem_wdata[18] 
     , \mem_wdata[17] , \mem_wdata[16] , \mem_wdata[15] 
     , \mem_wdata[14] , \mem_wdata[13] , \mem_wdata[12] 
     , \mem_wdata[11] , \mem_wdata[10] , \mem_wdata[9] 
     , \mem_wdata[8] , \mem_wdata[7] , \mem_wdata[6] 
     , \mem_wdata[5] , \mem_wdata[4] , \mem_wdata[3] 
     , \mem_wdata[2] , \mem_wdata[1] , \mem_wdata[0] }), 
     .mem_wstrb({\mem_wstrb[3] , \mem_wstrb[2] , \mem_wstrb[1] 
     , \mem_wstrb[0] }), .mem_la_read(mem_la_read), 
     .mem_la_write(mem_la_write), .mem_la_addr({\mem_la_addr[31] 
     , \mem_la_addr[30] , \mem_la_addr[29] , \mem_la_addr[28] 
     , \mem_la_addr[27] , \mem_la_addr[26] , \mem_la_addr[25] 
     , \mem_la_addr[24] , \mem_la_addr[23] , \mem_la_addr[22] 
     , \mem_la_addr[21] , \mem_la_addr[20] , \mem_la_addr[19] 
     , \mem_la_addr[18] , \mem_la_addr[17] , \mem_la_addr[16] 
     , \mem_la_addr[15] , \mem_la_addr[14] , \mem_la_addr[13] 
     , \mem_la_addr[12] , \mem_la_addr[11] , \mem_la_addr[10] 
     , \mem_la_addr[9] , \mem_la_addr[8] , \mem_la_addr[7] 
     , \mem_la_addr[6] , \mem_la_addr[5] , \mem_la_addr[4] 
     , \mem_la_addr[3] , \mem_la_addr[2] , \mem_la_addr[1] 
     , \mem_la_addr[0] }), .mem_la_wdata({\mem_la_wdata[31] 
     , \mem_la_wdata[30] , \mem_la_wdata[29] , \mem_la_wdata[28] 
     , \mem_la_wdata[27] , \mem_la_wdata[26] , \mem_la_wdata[25] 
     , \mem_la_wdata[24] , \mem_la_wdata[23] , \mem_la_wdata[22] 
     , \mem_la_wdata[21] , \mem_la_wdata[20] , \mem_la_wdata[19] 
     , \mem_la_wdata[18] , \mem_la_wdata[17] , \mem_la_wdata[16] 
     , \mem_la_wdata[15] , \mem_la_wdata[14] , \mem_la_wdata[13] 
     , \mem_la_wdata[12] , \mem_la_wdata[11] , \mem_la_wdata[10] 
     , \mem_la_wdata[9] , \mem_la_wdata[8] , \mem_la_wdata[7] 
     , \mem_la_wdata[6] , \mem_la_wdata[5] , \mem_la_wdata[4] 
     , \mem_la_wdata[3] , \mem_la_wdata[2] , \mem_la_wdata[1] 
     , \mem_la_wdata[0] }), .mem_la_wstrb({\mem_la_wstrb[3] 
     , \mem_la_wstrb[2] , \mem_la_wstrb[1] , \mem_la_wstrb[0] }), 
     .pcpi_valid(pcpi_valid), .pcpi_insn({\pcpi_insn[31] 
     , \pcpi_insn[30] , \pcpi_insn[29] , \pcpi_insn[28] 
     , \pcpi_insn[27] , \pcpi_insn[26] , \pcpi_insn[25] 
     , \pcpi_insn[24] , \pcpi_insn[23] , \pcpi_insn[22] 
     , \pcpi_insn[21] , \pcpi_insn[20] , \pcpi_insn[19] 
     , \pcpi_insn[18] , \pcpi_insn[17] , \pcpi_insn[16] 
     , \pcpi_insn[15] , \pcpi_insn[14] , \pcpi_insn[13] 
     , \pcpi_insn[12] , \pcpi_insn[11] , \pcpi_insn[10] 
     , \pcpi_insn[9] , \pcpi_insn[8] , \pcpi_insn[7] 
     , \pcpi_insn[6] , \pcpi_insn[5] , \pcpi_insn[4] 
     , \pcpi_insn[3] , \pcpi_insn[2] , \pcpi_insn[1] 
     , \pcpi_insn[0] }), .pcpi_rs1({\pcpi_rs1[31] , \pcpi_rs1[30] 
     , \pcpi_rs1[29] , \pcpi_rs1[28] , \pcpi_rs1[27] 
     , \pcpi_rs1[26] , \pcpi_rs1[25] , \pcpi_rs1[24] 
     , \pcpi_rs1[23] , \pcpi_rs1[22] , \pcpi_rs1[21] 
     , \pcpi_rs1[20] , \pcpi_rs1[19] , \pcpi_rs1[18] 
     , \pcpi_rs1[17] , \pcpi_rs1[16] , \pcpi_rs1[15] 
     , \pcpi_rs1[14] , \pcpi_rs1[13] , \pcpi_rs1[12] 
     , \pcpi_rs1[11] , \pcpi_rs1[10] , \pcpi_rs1[9] 
     , \pcpi_rs1[8] , \pcpi_rs1[7] , \pcpi_rs1[6] , \pcpi_rs1[5] 
     , \pcpi_rs1[4] , \pcpi_rs1[3] , \pcpi_rs1[2] , \pcpi_rs1[1] 
     , \pcpi_rs1[0] }), .pcpi_rs2({\pcpi_rs2[31] , \pcpi_rs2[30] 
     , \pcpi_rs2[29] , \pcpi_rs2[28] , \pcpi_rs2[27] 
     , \pcpi_rs2[26] , \pcpi_rs2[25] , \pcpi_rs2[24] 
     , \pcpi_rs2[23] , \pcpi_rs2[22] , \pcpi_rs2[21] 
     , \pcpi_rs2[20] , \pcpi_rs2[19] , \pcpi_rs2[18] 
     , \pcpi_rs2[17] , \pcpi_rs2[16] , \pcpi_rs2[15] 
     , \pcpi_rs2[14] , \pcpi_rs2[13] , \pcpi_rs2[12] 
     , \pcpi_rs2[11] , \pcpi_rs2[10] , \pcpi_rs2[9] 
     , \pcpi_rs2[8] , \pcpi_rs2[7] , \pcpi_rs2[6] , \pcpi_rs2[5] 
     , \pcpi_rs2[4] , \pcpi_rs2[3] , \pcpi_rs2[2] , \pcpi_rs2[1] 
     , \pcpi_rs2[0] }), .eoi({\eoi[31] , \eoi[30] , \eoi[29] 
     , \eoi[28] , \eoi[27] , \eoi[26] , \eoi[25] , \eoi[24] 
     , \eoi[23] , \eoi[22] , \eoi[21] , \eoi[20] , \eoi[19] 
     , \eoi[18] , \eoi[17] , \eoi[16] , \eoi[15] , \eoi[14] 
     , \eoi[13] , \eoi[12] , \eoi[11] , \eoi[10] , \eoi[9] 
     , \eoi[8] , \eoi[7] , \eoi[6] , \eoi[5] , \eoi[4] , \eoi[3] 
     , \eoi[2] , \eoi[1] , \eoi[0] }), .trace_valid(trace_valid), 
     .trace_data({\trace_data[35] , \trace_data[34] 
     , \trace_data[33] , \trace_data[32] , \trace_data[31] 
     , \trace_data[30] , \trace_data[29] , \trace_data[28] 
     , \trace_data[27] , \trace_data[26] , \trace_data[25] 
     , \trace_data[24] , \trace_data[23] , \trace_data[22] 
     , \trace_data[21] , \trace_data[20] , \trace_data[19] 
     , \trace_data[18] , \trace_data[17] , \trace_data[16] 
     , \trace_data[15] , \trace_data[14] , \trace_data[13] 
     , \trace_data[12] , \trace_data[11] , \trace_data[10] 
     , \trace_data[9] , \trace_data[8] , \trace_data[7] 
     , \trace_data[6] , \trace_data[5] , \trace_data[4] 
     , \trace_data[3] , \trace_data[2] , \trace_data[1] 
     , \trace_data[0] }), 
     .picorv32_rtl1_controller_c1_edt_channels_out({\picorv32_rtl1_controller_c1_edt_channels_out[1] 
     , \picorv32_rtl1_controller_c1_edt_channels_out[0] }));

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
//  $display("Reading checkpoint patterns/picorv32_bypass_stuck_serial.v.dat");
//  $restart("patterns/picorv32_bypass_stuck_serial.v.dat");
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
  _cfg_file_name = "patterns/picorv32_bypass_stuck_serial.v.cfg";
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
  $sformat(_new_filename,"%0s/patterns/picorv32_bypass_stuck_serial.v.cfg",_new_path); 
  _config_file = $fopen(_new_filename, "r");
end
else begin
  _config_file = $fopen("patterns/picorv32_bypass_stuck_serial.v.cfg", "r");
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
   _found_fail_obus =309'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
   for (_index=0; _index <= _max_index; _index = _index+1)
   begin
      vect = mem[_index];
      _exp_obus=309'bXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
      _msk_obus=309'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
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
          _pattern_count = (_pat_num - 1);
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
            _found_fail_obus =309'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
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
                  _ibus[7] = 1'b0;
                  _ibus[110:8] = vect[737:635];
                  _ibus[6:0] = vect[633:627];

                  #10; // 10 ns
                  _exp_obus[308:0] = vect[626:318];
                  _msk_obus[308:0] = vect[317:9];
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
                       $fwrite(_diag_file, "total_cycles 5861\n");
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
                  _ibus[7] = vect[634];

                  #10; // 30 ns
                  _ibus[7] = 1'b0;

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
//  $display("Writing checkpoint patterns/picorv32_bypass_stuck_serial.v.dat");
//  $save("patterns/picorv32_bypass_stuck_serial.v.dat");
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
    $fwrite(_diag_file, "total_cycles 5861\n");
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
