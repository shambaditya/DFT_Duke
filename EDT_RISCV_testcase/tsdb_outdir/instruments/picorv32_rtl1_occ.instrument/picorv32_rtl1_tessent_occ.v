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

module picorv32_rtl1_tessent_occ (
   input  wire         fast_clock,
   input  wire         slow_clock,
   input  wire         scan_en,
   input  wire         test_mode,
   input  wire         fast_capture_mode,
   input  wire   [1:0] capture_cycle_width,
   input  wire         shift_only_mode,
   output wire         clock_out,
   input  wire         scan_in,
   output wire         scan_out
);
  
   wire         fast_clock_en;
   wire         slow_clock_en;
   wire         slow_clock_gated;
   wire         clock_mux_select;
   wire         fast_clock_gated;
   wire         fast_clock_buf_out;
   wire         slow_clock_buf_out;
   wire         scan_en_buf_out;
   wire         test_mode_buf_out;
   wire         fast_capture_mode_buf_out;
   wire   [1:0] capture_cycle_width_buf_out;
   wire         scan_in_buf_out;
   wire         scan_out_buf_in;
   picorv32_rtl1_tessent_clk_buf tessent_persistent_cell_fast_clock_buf (
      .a                                     ( fast_clock                       ),
      .y                                     ( fast_clock_buf_out               )
   );
   picorv32_rtl1_tessent_clk_buf tessent_persistent_cell_slow_clock_buf (
      .a                                     ( slow_clock                       ),
      .y                                     ( slow_clock_buf_out               )
   );
   picorv32_rtl1_tessent_buf tessent_persistent_cell_scan_en_buf (
      .a                                     ( scan_en                          ),
      .y                                     ( scan_en_buf_out                  )
   );
   picorv32_rtl1_tessent_buf tessent_persistent_cell_test_mode_buf (
      .a                                     ( test_mode                        ),
      .y                                     ( test_mode_buf_out                )
   );
   picorv32_rtl1_tessent_buf tessent_persistent_cell_fast_capture_mode_buf (
      .a                                     ( fast_capture_mode                ),
      .y                                     ( fast_capture_mode_buf_out        )
   );
   picorv32_rtl1_tessent_buf tessent_persistent_cell_capture_cycle_width_buf_0 (
      .a                                     ( capture_cycle_width[0]           ),
      .y                                     ( capture_cycle_width_buf_out[0]   )
   );
   picorv32_rtl1_tessent_buf tessent_persistent_cell_capture_cycle_width_buf_1 (
      .a                                     ( capture_cycle_width[1]           ),
      .y                                     ( capture_cycle_width_buf_out[1]   )
   );
   picorv32_rtl1_tessent_buf tessent_persistent_cell_scan_in_buf (
      .a                                     ( scan_in                          ),
      .y                                     ( scan_in_buf_out                  )
   );
   picorv32_rtl1_tessent_buf tessent_persistent_cell_scan_out_buf (
      .a                                     ( scan_out_buf_in                  ),
      .y                                     ( scan_out                         )
   );

   picorv32_rtl1_tessent_occ_control occ_control (
     .fast_clock                             ( fast_clock_buf_out               ),
     .slow_clock                             ( slow_clock_buf_out               ),
     .bypass_clock                           ( clock_out                        ),
     .scan_en                                ( scan_en_buf_out                  ),
     .test_mode                              ( test_mode_buf_out                ),
     .fast_capture_mode                      ( fast_capture_mode_buf_out        ),
     .capture_cycle_width                    ( capture_cycle_width_buf_out      ),
     .shift_only_mode                        ( shift_only_mode                  ),
     .fast_clock_en                          ( fast_clock_en                    ),
     .slow_clock_en                          ( slow_clock_en                    ),
     .clock_mux_select                       ( clock_mux_select                 ),
     .scan_in                                ( scan_in_buf_out                  ),
     .scan_out                               ( scan_out_buf_in                  )
   );
 
   picorv32_rtl1_tessent_clk_gate_and tessent_persistent_cell_cgc_fast_clock (
     .clk                                    ( fast_clock_buf_out               ),
     .fe                                     ( fast_clock_en                    ),
     .te                                     ( fast_clock_en                    ),
     .clkg                                   ( fast_clock_gated                 )
   );
  
   picorv32_rtl1_tessent_clk_gate_and tessent_persistent_cell_cgc_slow_clock (
     .clk                                    ( slow_clock_buf_out               ),
     .fe                                     ( slow_clock_en                    ),
     .te                                     ( slow_clock_en                    ),
     .clkg                                   ( slow_clock_gated                 )
   );
 
   picorv32_rtl1_tessent_clk_mux2 tessent_persistent_cell_clock_out_mux  (
     .a                                      ( fast_clock_gated                 ),
     .b                                      ( slow_clock_gated                 ),
     .s                                      ( clock_mux_select                 ),
     .y                                      ( clock_out                        )
   );
endmodule
  
module picorv32_rtl1_tessent_occ_control (
   input  wire         fast_clock,
   input  wire         slow_clock,
   input  wire         bypass_clock,
   input  wire         scan_en,
   input  wire         test_mode,
   input  wire         fast_capture_mode,
   input  wire   [1:0] capture_cycle_width,
   input  wire         shift_only_mode,
   output wire         slow_clock_en,
   output wire         clock_mux_select,
   output wire         fast_clock_en,
   input  wire         scan_in,
   output reg          scan_out
);
 
   wire         SCAN_EN_inv_sync;
   wire         ShiftReg_EN;
   reg          BYPASS_SHIFT_FF;
   wire         SCAN_OUT_d;
   wire         ShiftReg_SCAN_OUT;
   wire         SHIFT_REG_CLK_en;
   wire         SHIFT_REG_CLK_G;
   wire         SHIFT_REG_CLK;
 
   reg          SE_SLOW_CLK_inv;
 
   always @ (negedge slow_clock or negedge test_mode) begin
     if (~test_mode) begin
       SE_SLOW_CLK_inv <= 1'b0;
     end else begin
       SE_SLOW_CLK_inv <= ~scan_en;
     end
   end
   picorv32_rtl1_tessent_posedge_synchronizer_reset tessent_persistent_cell_ltest_ntc_sync_cell (
     .d                                      ( SE_SLOW_CLK_inv                  ),
     .clk                                    ( fast_clock                       ),
     .rn                                     ( ~( scan_en | ~test_mode )        ),
     .q                                      ( SCAN_EN_inv_sync                 )
   );
 
   assign SHIFT_REG_CLK_en = test_mode & ShiftReg_EN & SCAN_EN_inv_sync;
 
   picorv32_rtl1_tessent_clk_gate_and tessent_persistent_cell_cgc_SHIFT_REG_CLK (
     .clk                                    ( fast_clock                       ), 
     .fe                                     ( SHIFT_REG_CLK_en                 ),
     .te                                     ( SHIFT_REG_CLK_en                 ),
     .clkg                                   ( SHIFT_REG_CLK_G                  )
   );
 
   picorv32_rtl1_tessent_clk_mux2 tessent_persistent_cell_SHIFT_REG_CLK_mux (
     .a                                      ( SHIFT_REG_CLK_G                  ), 
     .b                                      ( slow_clock                       ),
     .s                                      ( scan_en | ~fast_capture_mode     ),
     .y                                      ( SHIFT_REG_CLK                    )
   );
  
   always @ (posedge bypass_clock) begin
     BYPASS_SHIFT_FF <= scan_in & scan_en;
   end
   assign SCAN_OUT_d = (~test_mode) ? BYPASS_SHIFT_FF : ShiftReg_SCAN_OUT;
 
   always @ (negedge bypass_clock) begin
     scan_out <= SCAN_OUT_d & scan_en;
   end
 
   picorv32_rtl1_tessent_occ_shift_reg ShiftReg (
     .clk                                    ( SHIFT_REG_CLK                    ),
     .scan_en                                ( scan_en                          ),
     .capture_cycle_width                    ( capture_cycle_width              ),
     .some_ones_left                         ( ShiftReg_EN                      ),
     .scan_in                                ( scan_in                          ),
     .scan_out                               ( ShiftReg_SCAN_OUT                )
   );
 
 
   assign fast_clock_en    = (ShiftReg_SCAN_OUT & fast_capture_mode & SCAN_EN_inv_sync) | (~test_mode);
   assign slow_clock_en    = (((ShiftReg_SCAN_OUT & (~fast_capture_mode)) | scan_en) & test_mode) | (shift_only_mode & scan_en);
   assign clock_mux_select = ((scan_en | (~fast_capture_mode)) & test_mode) | (shift_only_mode & scan_en);
 
endmodule
  
  
module picorv32_rtl1_tessent_occ_shift_reg (
   input  wire         clk,
   input  wire         scan_en,
   input  wire   [1:0] capture_cycle_width,
   output wire         some_ones_left,
   input  wire         scan_in,
   output wire         scan_out
);
   reg    [2:0] FF;
   wire         scan_in_gated;
 
   assign scan_in_gated = scan_in & scan_en;
    
   always @ (posedge clk) begin
     case (capture_cycle_width)
        2'd2: FF <= {scan_in_gated, FF[2:1]};
        2'd1: FF <= {1'b0, scan_in_gated, FF[1:1]};
        2'd0: FF <= {2'b0, scan_in_gated};
        default: FF <= {scan_in_gated, FF[2:1]};
     endcase
   end
 
   assign some_ones_left = |FF;
   assign scan_out = FF[0];
   
endmodule
