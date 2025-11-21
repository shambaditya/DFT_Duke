//--------------------------------------------------------------------------------
//
//  Unpublished work. Copyright 2024 Siemens
//
//  This material contains trade secrets or otherwise confidential 
//  information owned by Siemens Industry Software Inc. or its affiliates 
//  (collectively, SISW), or its licensors. Access to and use of this 
//  information is strictly limited as set forth in the Customer's 
//  applicable agreements with SISW.
//
//--------------------------------------------------------------------------------
//  File created by: Tessent Shell
//          Version: 2024.4
//       Created on: Thu Nov 20 12:09:55 EST 2025
//
//       IP version: 8
//--------------------------------------------------------------------------------


module picorv32_rtl1_tessent_edt_c1_decompressor (
   input  wire        edt_clock,
   input  wire        edt_update,
   input  wire [ 1:0] edt_channels_in,
   output reg  [59:0] edt_scan_in
);
   reg    [15:0] lfsm_vec;
   reg    [15:0] lfsm_vec_lockup;

   // synopsys sync_set_reset edt_update
   always @(posedge edt_clock)
   begin : lfsm
      if (edt_update == 1'b1) begin
         lfsm_vec <= 16'b0000000000000000;
      end
      else begin
         lfsm_vec[ 0] <= lfsm_vec[ 1];
         lfsm_vec[ 1] <= lfsm_vec[ 2] ^ edt_channels_in[0];
         lfsm_vec[ 2] <= lfsm_vec[ 3];
         lfsm_vec[ 3] <= lfsm_vec[ 4] ^ edt_channels_in[1];
         lfsm_vec[ 4] <= lfsm_vec[ 5];
         lfsm_vec[ 5] <= lfsm_vec[ 6] ^ edt_channels_in[1];
         lfsm_vec[ 6] <= lfsm_vec[ 7];
         lfsm_vec[ 7] <= lfsm_vec[ 8] ^ edt_channels_in[1];
         lfsm_vec[ 8] <= lfsm_vec[ 9] ^ lfsm_vec[ 6];
         lfsm_vec[ 9] <= lfsm_vec[10] ^ edt_channels_in[1];
         lfsm_vec[10] <= lfsm_vec[11] ^ lfsm_vec[ 4];
         lfsm_vec[11] <= lfsm_vec[12] ^ edt_channels_in[0];
         lfsm_vec[12] <= lfsm_vec[13] ^ lfsm_vec[ 3];
         lfsm_vec[13] <= lfsm_vec[14] ^ edt_channels_in[0];
         lfsm_vec[14] <= lfsm_vec[15];
         lfsm_vec[15] <= lfsm_vec[ 0] ^ edt_channels_in[0];
      end
   end

   always @(negedge edt_clock)
   begin : lockup_cells
      lfsm_vec_lockup <= lfsm_vec;
   end

   always @(lfsm_vec_lockup)
   begin : phase_shifter
      edt_scan_in[ 0] = lfsm_vec_lockup[ 6] ^ lfsm_vec_lockup[ 8] ^ lfsm_vec_lockup[ 9];
      edt_scan_in[ 1] = lfsm_vec_lockup[ 1] ^ lfsm_vec_lockup[ 4] ^ lfsm_vec_lockup[13];
      edt_scan_in[ 2] = lfsm_vec_lockup[ 3] ^ lfsm_vec_lockup[10] ^ lfsm_vec_lockup[15];
      edt_scan_in[ 3] = lfsm_vec_lockup[ 0] ^ lfsm_vec_lockup[ 7] ^ lfsm_vec_lockup[14];
      edt_scan_in[ 4] = lfsm_vec_lockup[ 2] ^ lfsm_vec_lockup[ 5] ^ lfsm_vec_lockup[12];
      edt_scan_in[ 5] = lfsm_vec_lockup[ 1] ^ lfsm_vec_lockup[ 9] ^ lfsm_vec_lockup[12];
      edt_scan_in[ 6] = lfsm_vec_lockup[ 6] ^ lfsm_vec_lockup[ 7] ^ lfsm_vec_lockup[14];
      edt_scan_in[ 7] = lfsm_vec_lockup[ 0] ^ lfsm_vec_lockup[ 8] ^ lfsm_vec_lockup[15];
      edt_scan_in[ 8] = lfsm_vec_lockup[10] ^ lfsm_vec_lockup[11] ^ lfsm_vec_lockup[13];
      edt_scan_in[ 9] = lfsm_vec_lockup[ 2] ^ lfsm_vec_lockup[ 3] ^ lfsm_vec_lockup[11];
      edt_scan_in[10] = lfsm_vec_lockup[ 2] ^ lfsm_vec_lockup[ 4] ^ lfsm_vec_lockup[15];
      edt_scan_in[11] = lfsm_vec_lockup[ 8] ^ lfsm_vec_lockup[13] ^ lfsm_vec_lockup[14];
      edt_scan_in[12] = lfsm_vec_lockup[ 5] ^ lfsm_vec_lockup[ 6] ^ lfsm_vec_lockup[12];
      edt_scan_in[13] = lfsm_vec_lockup[ 1] ^ lfsm_vec_lockup[ 5] ^ lfsm_vec_lockup[11];
      edt_scan_in[14] = lfsm_vec_lockup[ 0] ^ lfsm_vec_lockup[ 4] ^ lfsm_vec_lockup[10];
      edt_scan_in[15] = lfsm_vec_lockup[ 2] ^ lfsm_vec_lockup[ 7] ^ lfsm_vec_lockup[ 9];
      edt_scan_in[16] = lfsm_vec_lockup[ 1] ^ lfsm_vec_lockup[ 4] ^ lfsm_vec_lockup[ 5];
      edt_scan_in[17] = lfsm_vec_lockup[ 7] ^ lfsm_vec_lockup[ 8] ^ lfsm_vec_lockup[ 9];
      edt_scan_in[18] = lfsm_vec_lockup[ 0] ^ lfsm_vec_lockup[ 6] ^ lfsm_vec_lockup[13];
      edt_scan_in[19] = lfsm_vec_lockup[11] ^ lfsm_vec_lockup[12] ^ lfsm_vec_lockup[15];
      edt_scan_in[20] = lfsm_vec_lockup[ 3] ^ lfsm_vec_lockup[ 9] ^ lfsm_vec_lockup[12];
      edt_scan_in[21] = lfsm_vec_lockup[ 1] ^ lfsm_vec_lockup[ 2] ^ lfsm_vec_lockup[13];
      edt_scan_in[22] = lfsm_vec_lockup[ 4] ^ lfsm_vec_lockup[ 8] ^ lfsm_vec_lockup[10];
      edt_scan_in[23] = lfsm_vec_lockup[ 7] ^ lfsm_vec_lockup[10] ^ lfsm_vec_lockup[14];
      edt_scan_in[24] = lfsm_vec_lockup[ 6] ^ lfsm_vec_lockup[11] ^ lfsm_vec_lockup[15];
      edt_scan_in[25] = lfsm_vec_lockup[ 0] ^ lfsm_vec_lockup[ 5] ^ lfsm_vec_lockup[14];
      edt_scan_in[26] = lfsm_vec_lockup[ 2] ^ lfsm_vec_lockup[10] ^ lfsm_vec_lockup[14];
      edt_scan_in[27] = lfsm_vec_lockup[ 5] ^ lfsm_vec_lockup[ 7] ^ lfsm_vec_lockup[12];
      edt_scan_in[28] = lfsm_vec_lockup[ 9] ^ lfsm_vec_lockup[11] ^ lfsm_vec_lockup[13];
      edt_scan_in[29] = lfsm_vec_lockup[ 0] ^ lfsm_vec_lockup[ 4] ^ lfsm_vec_lockup[15];
      edt_scan_in[30] = lfsm_vec_lockup[ 1] ^ lfsm_vec_lockup[ 6] ^ lfsm_vec_lockup[ 8];
      edt_scan_in[31] = lfsm_vec_lockup[ 4] ^ lfsm_vec_lockup[ 5] ^ lfsm_vec_lockup[ 6];
      edt_scan_in[32] = lfsm_vec_lockup[ 0] ^ lfsm_vec_lockup[ 1] ^ lfsm_vec_lockup[12];
      edt_scan_in[33] = lfsm_vec_lockup[ 8] ^ lfsm_vec_lockup[ 9] ^ lfsm_vec_lockup[10];
      edt_scan_in[34] = lfsm_vec_lockup[ 3] ^ lfsm_vec_lockup[11] ^ lfsm_vec_lockup[13];
      edt_scan_in[35] = lfsm_vec_lockup[ 2] ^ lfsm_vec_lockup[ 7] ^ lfsm_vec_lockup[14];
      edt_scan_in[36] = lfsm_vec_lockup[ 5] ^ lfsm_vec_lockup[13] ^ lfsm_vec_lockup[15];
      edt_scan_in[37] = lfsm_vec_lockup[ 4] ^ lfsm_vec_lockup[ 8] ^ lfsm_vec_lockup[11];
      edt_scan_in[38] = lfsm_vec_lockup[ 2] ^ lfsm_vec_lockup[10] ^ lfsm_vec_lockup[12];
      edt_scan_in[39] = lfsm_vec_lockup[ 0] ^ lfsm_vec_lockup[ 1] ^ lfsm_vec_lockup[ 9];
      edt_scan_in[40] = lfsm_vec_lockup[ 6] ^ lfsm_vec_lockup[14] ^ lfsm_vec_lockup[15];
      edt_scan_in[41] = lfsm_vec_lockup[ 9] ^ lfsm_vec_lockup[11] ^ lfsm_vec_lockup[12];
      edt_scan_in[42] = lfsm_vec_lockup[ 6] ^ lfsm_vec_lockup[ 7] ^ lfsm_vec_lockup[15];
      edt_scan_in[43] = lfsm_vec_lockup[ 2] ^ lfsm_vec_lockup[ 4] ^ lfsm_vec_lockup[ 5];
      edt_scan_in[44] = lfsm_vec_lockup[ 0] ^ lfsm_vec_lockup[13] ^ lfsm_vec_lockup[14];
      edt_scan_in[45] = lfsm_vec_lockup[ 3] ^ lfsm_vec_lockup[ 7] ^ lfsm_vec_lockup[10];
      edt_scan_in[46] = lfsm_vec_lockup[ 3] ^ lfsm_vec_lockup[ 8] ^ lfsm_vec_lockup[12];
      edt_scan_in[47] = lfsm_vec_lockup[ 1] ^ lfsm_vec_lockup[ 7] ^ lfsm_vec_lockup[13];
      edt_scan_in[48] = lfsm_vec_lockup[ 3] ^ lfsm_vec_lockup[ 6] ^ lfsm_vec_lockup[10];
      edt_scan_in[49] = lfsm_vec_lockup[ 9] ^ lfsm_vec_lockup[11] ^ lfsm_vec_lockup[15];
      edt_scan_in[50] = lfsm_vec_lockup[ 2] ^ lfsm_vec_lockup[ 9] ^ lfsm_vec_lockup[12];
      edt_scan_in[51] = lfsm_vec_lockup[ 0] ^ lfsm_vec_lockup[ 4] ^ lfsm_vec_lockup[14];
      edt_scan_in[52] = lfsm_vec_lockup[ 0] ^ lfsm_vec_lockup[ 1] ^ lfsm_vec_lockup[11];
      edt_scan_in[53] = lfsm_vec_lockup[ 4] ^ lfsm_vec_lockup[ 8] ^ lfsm_vec_lockup[15];
      edt_scan_in[54] = lfsm_vec_lockup[ 2] ^ lfsm_vec_lockup[ 7] ^ lfsm_vec_lockup[13];
      edt_scan_in[55] = lfsm_vec_lockup[ 3] ^ lfsm_vec_lockup[ 5] ^ lfsm_vec_lockup[10];
      edt_scan_in[56] = lfsm_vec_lockup[ 3] ^ lfsm_vec_lockup[ 6] ^ lfsm_vec_lockup[14];
      edt_scan_in[57] = lfsm_vec_lockup[ 4] ^ lfsm_vec_lockup[12] ^ lfsm_vec_lockup[13];
      edt_scan_in[58] = lfsm_vec_lockup[ 0] ^ lfsm_vec_lockup[ 3] ^ lfsm_vec_lockup[ 7];
      edt_scan_in[59] = lfsm_vec_lockup[ 3] ^ lfsm_vec_lockup[10] ^ lfsm_vec_lockup[11];
   end

endmodule


module picorv32_rtl1_tessent_edt_c1_low_power_shift_decoder (
   input  wire [59:0] encoded_control,
   output wire [59:0] decoded_control
);
   assign decoded_control[ 0] = encoded_control[ 0];
   assign decoded_control[ 1] = encoded_control[ 1];
   assign decoded_control[ 2] = encoded_control[ 2];
   assign decoded_control[ 3] = encoded_control[ 3];
   assign decoded_control[ 4] = encoded_control[ 4];
   assign decoded_control[ 5] = encoded_control[ 5];
   assign decoded_control[ 6] = encoded_control[ 6];
   assign decoded_control[ 7] = encoded_control[ 7];
   assign decoded_control[ 8] = encoded_control[ 8];
   assign decoded_control[ 9] = encoded_control[ 9];
   assign decoded_control[10] = encoded_control[10];
   assign decoded_control[11] = encoded_control[11];
   assign decoded_control[12] = encoded_control[12];
   assign decoded_control[13] = encoded_control[13];
   assign decoded_control[14] = encoded_control[14];
   assign decoded_control[15] = encoded_control[15];
   assign decoded_control[16] = encoded_control[16];
   assign decoded_control[17] = encoded_control[17];
   assign decoded_control[18] = encoded_control[18];
   assign decoded_control[19] = encoded_control[19];
   assign decoded_control[20] = encoded_control[20];
   assign decoded_control[21] = encoded_control[21];
   assign decoded_control[22] = encoded_control[22];
   assign decoded_control[23] = encoded_control[23];
   assign decoded_control[24] = encoded_control[24];
   assign decoded_control[25] = encoded_control[25];
   assign decoded_control[26] = encoded_control[26];
   assign decoded_control[27] = encoded_control[27];
   assign decoded_control[28] = encoded_control[28];
   assign decoded_control[29] = encoded_control[29];
   assign decoded_control[30] = encoded_control[30];
   assign decoded_control[31] = encoded_control[31];
   assign decoded_control[32] = encoded_control[32];
   assign decoded_control[33] = encoded_control[33];
   assign decoded_control[34] = encoded_control[34];
   assign decoded_control[35] = encoded_control[35];
   assign decoded_control[36] = encoded_control[36];
   assign decoded_control[37] = encoded_control[37];
   assign decoded_control[38] = encoded_control[38];
   assign decoded_control[39] = encoded_control[39];
   assign decoded_control[40] = encoded_control[40];
   assign decoded_control[41] = encoded_control[41];
   assign decoded_control[42] = encoded_control[42];
   assign decoded_control[43] = encoded_control[43];
   assign decoded_control[44] = encoded_control[44];
   assign decoded_control[45] = encoded_control[45];
   assign decoded_control[46] = encoded_control[46];
   assign decoded_control[47] = encoded_control[47];
   assign decoded_control[48] = encoded_control[48];
   assign decoded_control[49] = encoded_control[49];
   assign decoded_control[50] = encoded_control[50];
   assign decoded_control[51] = encoded_control[51];
   assign decoded_control[52] = encoded_control[52];
   assign decoded_control[53] = encoded_control[53];
   assign decoded_control[54] = encoded_control[54];
   assign decoded_control[55] = encoded_control[55];
   assign decoded_control[56] = encoded_control[56];
   assign decoded_control[57] = encoded_control[57];
   assign decoded_control[58] = encoded_control[58];
   assign decoded_control[59] = encoded_control[59];
endmodule


module picorv32_rtl1_tessent_edt_c1_low_power_shift_controller (
   input  wire        edt_clock,
   input  wire        edt_update,
   input  wire        edt_configuration,
   input  wire        edt_low_power_shift_en,
   input  wire [ 1:0] edt_channels_in,
   input  wire [59:0] edt_decompressor_out,
   output wire [ 1:0] edt_channels_out_from_low_power_shift_control,
   output wire [59:0] edt_scan_in
);
   reg    [29:0] low_power_shift_reg_0;
   reg    [29:0] low_power_shift_reg_1;
   reg    [29:0] low_power_hold_reg_0;
   reg    [29:0] low_power_hold_reg_1;
   wire   [59:0] encoded_control;
   wire   [59:0] bias_inputs;
   wire          config0_low_power_shift_reg_1_in;
   wire          low_power_shift_reg_sync_reset;
   wire          low_power_hold_reg_sync_set;
   wire          low_power_shift_reg_0_out;

   assign low_power_shift_reg_sync_reset = edt_update;

   // synopsys sync_set_reset low_power_shift_reg_sync_reset
   always @(posedge edt_clock)
   begin : shift_low_power_regs
      if (low_power_shift_reg_sync_reset == 1'b1) begin
         low_power_shift_reg_0 <= 30'b000000000000000000000000000000;
         low_power_shift_reg_1 <= 30'b000000000000000000000000000000;
      end
      else begin
         low_power_shift_reg_0 <= {edt_channels_in[0], low_power_shift_reg_0[29:1]};
         low_power_shift_reg_1 <= {config0_low_power_shift_reg_1_in, low_power_shift_reg_1[29:1]};
      end
   end

   assign low_power_hold_reg_sync_set = edt_update & ~edt_low_power_shift_en;

   // synopsys sync_set_reset low_power_hold_reg_sync_set
   always @(posedge edt_clock)
   begin : update_low_power_regs
      if (low_power_hold_reg_sync_set == 1'b1) begin
         low_power_hold_reg_0 <= 30'b111111111111111111111111111111;
         low_power_hold_reg_1 <= 30'b111111111111111111111111111111;
      end
      else begin
         if (edt_update == 1'b1) begin
            low_power_hold_reg_0 <= low_power_shift_reg_0;
            low_power_hold_reg_1 <= low_power_shift_reg_1;
         end
      end
   end

   assign config0_low_power_shift_reg_1_in = edt_configuration ? low_power_shift_reg_0[0] : edt_channels_in[1];

   assign edt_channels_out_from_low_power_shift_control[0] = edt_low_power_shift_en ? low_power_shift_reg_0_out : edt_channels_in[0];
   assign edt_channels_out_from_low_power_shift_control[1] = edt_low_power_shift_en ? low_power_shift_reg_1[0] : edt_channels_in[1];

   assign low_power_shift_reg_0_out = edt_configuration ? low_power_shift_reg_1[0] : low_power_shift_reg_0[0];

   assign encoded_control = {low_power_hold_reg_1[29], low_power_hold_reg_1[28], low_power_hold_reg_1[27], 
                             low_power_hold_reg_1[26], low_power_hold_reg_1[25], low_power_hold_reg_1[24], 
                             low_power_hold_reg_1[23], low_power_hold_reg_1[22], low_power_hold_reg_1[21], 
                             low_power_hold_reg_1[20], low_power_hold_reg_1[19], low_power_hold_reg_1[18], 
                             low_power_hold_reg_1[17], low_power_hold_reg_1[16], low_power_hold_reg_1[15], 
                             low_power_hold_reg_1[14], low_power_hold_reg_1[13], low_power_hold_reg_1[12], 
                             low_power_hold_reg_1[11], low_power_hold_reg_1[10], low_power_hold_reg_1[9], 
                             low_power_hold_reg_1[8], low_power_hold_reg_1[7], low_power_hold_reg_1[6], 
                             low_power_hold_reg_1[5], low_power_hold_reg_1[4], low_power_hold_reg_1[3], 
                             low_power_hold_reg_1[2], low_power_hold_reg_1[1], low_power_hold_reg_1[0], 
                             low_power_hold_reg_0[29], low_power_hold_reg_0[28], low_power_hold_reg_0[27], 
                             low_power_hold_reg_0[26], low_power_hold_reg_0[25], low_power_hold_reg_0[24], 
                             low_power_hold_reg_0[23], low_power_hold_reg_0[22], low_power_hold_reg_0[21], 
                             low_power_hold_reg_0[20], low_power_hold_reg_0[19], low_power_hold_reg_0[18], 
                             low_power_hold_reg_0[17], low_power_hold_reg_0[16], low_power_hold_reg_0[15], 
                             low_power_hold_reg_0[14], low_power_hold_reg_0[13], low_power_hold_reg_0[12], 
                             low_power_hold_reg_0[11], low_power_hold_reg_0[10], low_power_hold_reg_0[9], 
                             low_power_hold_reg_0[8], low_power_hold_reg_0[7], low_power_hold_reg_0[6], 
                             low_power_hold_reg_0[5], low_power_hold_reg_0[4], low_power_hold_reg_0[3], 
                             low_power_hold_reg_0[2], low_power_hold_reg_0[1], low_power_hold_reg_0[0]};

   picorv32_rtl1_tessent_edt_c1_low_power_shift_decoder decoder (
      .encoded_control(encoded_control),
      .decoded_control(bias_inputs));

   assign edt_scan_in[ 0] = edt_decompressor_out[ 0] & bias_inputs[ 0];
   assign edt_scan_in[ 1] = edt_decompressor_out[ 1] & bias_inputs[ 1];
   assign edt_scan_in[ 2] = edt_decompressor_out[ 2] & bias_inputs[ 2];
   assign edt_scan_in[ 3] = edt_decompressor_out[ 3] & bias_inputs[ 3];
   assign edt_scan_in[ 4] = edt_decompressor_out[ 4] & bias_inputs[ 4];
   assign edt_scan_in[ 5] = edt_decompressor_out[ 5] & bias_inputs[ 5];
   assign edt_scan_in[ 6] = edt_decompressor_out[ 6] & bias_inputs[ 6];
   assign edt_scan_in[ 7] = edt_decompressor_out[ 7] & bias_inputs[ 7];
   assign edt_scan_in[ 8] = edt_decompressor_out[ 8] & bias_inputs[ 8];
   assign edt_scan_in[ 9] = edt_decompressor_out[ 9] & bias_inputs[ 9];
   assign edt_scan_in[10] = edt_decompressor_out[10] & bias_inputs[10];
   assign edt_scan_in[11] = edt_decompressor_out[11] & bias_inputs[11];
   assign edt_scan_in[12] = edt_decompressor_out[12] & bias_inputs[12];
   assign edt_scan_in[13] = edt_decompressor_out[13] & bias_inputs[13];
   assign edt_scan_in[14] = edt_decompressor_out[14] & bias_inputs[14];
   assign edt_scan_in[15] = edt_decompressor_out[15] & bias_inputs[15];
   assign edt_scan_in[16] = edt_decompressor_out[16] & bias_inputs[16];
   assign edt_scan_in[17] = edt_decompressor_out[17] & bias_inputs[17];
   assign edt_scan_in[18] = edt_decompressor_out[18] & bias_inputs[18];
   assign edt_scan_in[19] = edt_decompressor_out[19] & bias_inputs[19];
   assign edt_scan_in[20] = edt_decompressor_out[20] & bias_inputs[20];
   assign edt_scan_in[21] = edt_decompressor_out[21] & bias_inputs[21];
   assign edt_scan_in[22] = edt_decompressor_out[22] & bias_inputs[22];
   assign edt_scan_in[23] = edt_decompressor_out[23] & bias_inputs[23];
   assign edt_scan_in[24] = edt_decompressor_out[24] & bias_inputs[24];
   assign edt_scan_in[25] = edt_decompressor_out[25] & bias_inputs[25];
   assign edt_scan_in[26] = edt_decompressor_out[26] & bias_inputs[26];
   assign edt_scan_in[27] = edt_decompressor_out[27] & bias_inputs[27];
   assign edt_scan_in[28] = edt_decompressor_out[28] & bias_inputs[28];
   assign edt_scan_in[29] = edt_decompressor_out[29] & bias_inputs[29];
   assign edt_scan_in[30] = edt_decompressor_out[30] & bias_inputs[30];
   assign edt_scan_in[31] = edt_decompressor_out[31] & bias_inputs[31];
   assign edt_scan_in[32] = edt_decompressor_out[32] & bias_inputs[32];
   assign edt_scan_in[33] = edt_decompressor_out[33] & bias_inputs[33];
   assign edt_scan_in[34] = edt_decompressor_out[34] & bias_inputs[34];
   assign edt_scan_in[35] = edt_decompressor_out[35] & bias_inputs[35];
   assign edt_scan_in[36] = edt_decompressor_out[36] & bias_inputs[36];
   assign edt_scan_in[37] = edt_decompressor_out[37] & bias_inputs[37];
   assign edt_scan_in[38] = edt_decompressor_out[38] & bias_inputs[38];
   assign edt_scan_in[39] = edt_decompressor_out[39] & bias_inputs[39];
   assign edt_scan_in[40] = edt_decompressor_out[40] & bias_inputs[40];
   assign edt_scan_in[41] = edt_decompressor_out[41] & bias_inputs[41];
   assign edt_scan_in[42] = edt_decompressor_out[42] & bias_inputs[42];
   assign edt_scan_in[43] = edt_decompressor_out[43] & bias_inputs[43];
   assign edt_scan_in[44] = edt_decompressor_out[44] & bias_inputs[44];
   assign edt_scan_in[45] = edt_decompressor_out[45] & bias_inputs[45];
   assign edt_scan_in[46] = edt_decompressor_out[46] & bias_inputs[46];
   assign edt_scan_in[47] = edt_decompressor_out[47] & bias_inputs[47];
   assign edt_scan_in[48] = edt_decompressor_out[48] & bias_inputs[48];
   assign edt_scan_in[49] = edt_decompressor_out[49] & bias_inputs[49];
   assign edt_scan_in[50] = edt_decompressor_out[50] & bias_inputs[50];
   assign edt_scan_in[51] = edt_decompressor_out[51] & bias_inputs[51];
   assign edt_scan_in[52] = edt_decompressor_out[52] & bias_inputs[52];
   assign edt_scan_in[53] = edt_decompressor_out[53] & bias_inputs[53];
   assign edt_scan_in[54] = edt_decompressor_out[54] & bias_inputs[54];
   assign edt_scan_in[55] = edt_decompressor_out[55] & bias_inputs[55];
   assign edt_scan_in[56] = edt_decompressor_out[56] & bias_inputs[56];
   assign edt_scan_in[57] = edt_decompressor_out[57] & bias_inputs[57];
   assign edt_scan_in[58] = edt_decompressor_out[58] & bias_inputs[58];
   assign edt_scan_in[59] = edt_decompressor_out[59] & bias_inputs[59];
endmodule


module picorv32_rtl1_tessent_edt_c1_onehot_decoder_5_to_30 (
   input  wire [ 4:0] encoded_masks,
   output reg  [29:0] decoded_masks
);
   always @(encoded_masks)
   begin
      case (encoded_masks)
         5'b00000: decoded_masks = 30'b000000000000000000000000000000;
         5'b00001: decoded_masks = 30'b000000000000000000000000000001;
         5'b00010: decoded_masks = 30'b000000000000000000000000000010;
         5'b00011: decoded_masks = 30'b000000000000000000000000000100;
         5'b00100: decoded_masks = 30'b000000000000000000000000001000;
         5'b00101: decoded_masks = 30'b000000000000000000000000010000;
         5'b00110: decoded_masks = 30'b000000000000000000000000100000;
         5'b00111: decoded_masks = 30'b000000000000000000000001000000;
         5'b01000: decoded_masks = 30'b000000000000000000000010000000;
         5'b01001: decoded_masks = 30'b000000000000000000000100000000;
         5'b01010: decoded_masks = 30'b000000000000000000001000000000;
         5'b01011: decoded_masks = 30'b000000000000000000010000000000;
         5'b01100: decoded_masks = 30'b000000000000000000100000000000;
         5'b01101: decoded_masks = 30'b000000000000000001000000000000;
         5'b01110: decoded_masks = 30'b000000000000000010000000000000;
         5'b01111: decoded_masks = 30'b000000000000000100000000000000;
         5'b10000: decoded_masks = 30'b000000000000001000000000000000;
         5'b10001: decoded_masks = 30'b000000000000010000000000000000;
         5'b10010: decoded_masks = 30'b000000000000100000000000000000;
         5'b10011: decoded_masks = 30'b000000000001000000000000000000;
         5'b10100: decoded_masks = 30'b000000000010000000000000000000;
         5'b10101: decoded_masks = 30'b000000000100000000000000000000;
         5'b10110: decoded_masks = 30'b000000001000000000000000000000;
         5'b10111: decoded_masks = 30'b000000010000000000000000000000;
         5'b11000: decoded_masks = 30'b000000100000000000000000000000;
         5'b11001: decoded_masks = 30'b000001000000000000000000000000;
         5'b11010: decoded_masks = 30'b000010000000000000000000000000;
         5'b11011: decoded_masks = 30'b000100000000000000000000000000;
         5'b11100: decoded_masks = 30'b001000000000000000000000000000;
         5'b11101: decoded_masks = 30'b010000000000000000000000000000;
         5'b11110: decoded_masks = 30'b100000000000000000000000000000;
         default:  decoded_masks = 30'b111111111111111111111111111111;
      endcase
   end
endmodule


module picorv32_rtl1_tessent_edt_c1_onehot_decoder_6_to_60 (
   input  wire [ 5:0] encoded_masks,
   output reg  [59:0] decoded_masks
);
   always @(encoded_masks)
   begin
      case (encoded_masks)
         6'b000000: decoded_masks = 60'b000000000000000000000000000000000000000000000000000000000000;
         6'b000001: decoded_masks = 60'b000000000000000000000000000000000000000000000000000000000001;
         6'b000010: decoded_masks = 60'b000000000000000000000000000000000000000000000000000000000010;
         6'b000011: decoded_masks = 60'b000000000000000000000000000000000000000000000000000000000100;
         6'b000100: decoded_masks = 60'b000000000000000000000000000000000000000000000000000000001000;
         6'b000101: decoded_masks = 60'b000000000000000000000000000000000000000000000000000000010000;
         6'b000110: decoded_masks = 60'b000000000000000000000000000000000000000000000000000000100000;
         6'b000111: decoded_masks = 60'b000000000000000000000000000000000000000000000000000001000000;
         6'b001000: decoded_masks = 60'b000000000000000000000000000000000000000000000000000010000000;
         6'b001001: decoded_masks = 60'b000000000000000000000000000000000000000000000000000100000000;
         6'b001010: decoded_masks = 60'b000000000000000000000000000000000000000000000000001000000000;
         6'b001011: decoded_masks = 60'b000000000000000000000000000000000000000000000000010000000000;
         6'b001100: decoded_masks = 60'b000000000000000000000000000000000000000000000000100000000000;
         6'b001101: decoded_masks = 60'b000000000000000000000000000000000000000000000001000000000000;
         6'b001110: decoded_masks = 60'b000000000000000000000000000000000000000000000010000000000000;
         6'b001111: decoded_masks = 60'b000000000000000000000000000000000000000000000100000000000000;
         6'b010000: decoded_masks = 60'b000000000000000000000000000000000000000000001000000000000000;
         6'b010001: decoded_masks = 60'b000000000000000000000000000000000000000000010000000000000000;
         6'b010010: decoded_masks = 60'b000000000000000000000000000000000000000000100000000000000000;
         6'b010011: decoded_masks = 60'b000000000000000000000000000000000000000001000000000000000000;
         6'b010100: decoded_masks = 60'b000000000000000000000000000000000000000010000000000000000000;
         6'b010101: decoded_masks = 60'b000000000000000000000000000000000000000100000000000000000000;
         6'b010110: decoded_masks = 60'b000000000000000000000000000000000000001000000000000000000000;
         6'b010111: decoded_masks = 60'b000000000000000000000000000000000000010000000000000000000000;
         6'b011000: decoded_masks = 60'b000000000000000000000000000000000000100000000000000000000000;
         6'b011001: decoded_masks = 60'b000000000000000000000000000000000001000000000000000000000000;
         6'b011010: decoded_masks = 60'b000000000000000000000000000000000010000000000000000000000000;
         6'b011011: decoded_masks = 60'b000000000000000000000000000000000100000000000000000000000000;
         6'b011100: decoded_masks = 60'b000000000000000000000000000000001000000000000000000000000000;
         6'b011101: decoded_masks = 60'b000000000000000000000000000000010000000000000000000000000000;
         6'b011110: decoded_masks = 60'b000000000000000000000000000000100000000000000000000000000000;
         6'b011111: decoded_masks = 60'b000000000000000000000000000001000000000000000000000000000000;
         6'b100000: decoded_masks = 60'b000000000000000000000000000010000000000000000000000000000000;
         6'b100001: decoded_masks = 60'b000000000000000000000000000100000000000000000000000000000000;
         6'b100010: decoded_masks = 60'b000000000000000000000000001000000000000000000000000000000000;
         6'b100011: decoded_masks = 60'b000000000000000000000000010000000000000000000000000000000000;
         6'b100100: decoded_masks = 60'b000000000000000000000000100000000000000000000000000000000000;
         6'b100101: decoded_masks = 60'b000000000000000000000001000000000000000000000000000000000000;
         6'b100110: decoded_masks = 60'b000000000000000000000010000000000000000000000000000000000000;
         6'b100111: decoded_masks = 60'b000000000000000000000100000000000000000000000000000000000000;
         6'b101000: decoded_masks = 60'b000000000000000000001000000000000000000000000000000000000000;
         6'b101001: decoded_masks = 60'b000000000000000000010000000000000000000000000000000000000000;
         6'b101010: decoded_masks = 60'b000000000000000000100000000000000000000000000000000000000000;
         6'b101011: decoded_masks = 60'b000000000000000001000000000000000000000000000000000000000000;
         6'b101100: decoded_masks = 60'b000000000000000010000000000000000000000000000000000000000000;
         6'b101101: decoded_masks = 60'b000000000000000100000000000000000000000000000000000000000000;
         6'b101110: decoded_masks = 60'b000000000000001000000000000000000000000000000000000000000000;
         6'b101111: decoded_masks = 60'b000000000000010000000000000000000000000000000000000000000000;
         6'b110000: decoded_masks = 60'b000000000000100000000000000000000000000000000000000000000000;
         6'b110001: decoded_masks = 60'b000000000001000000000000000000000000000000000000000000000000;
         6'b110010: decoded_masks = 60'b000000000010000000000000000000000000000000000000000000000000;
         6'b110011: decoded_masks = 60'b000000000100000000000000000000000000000000000000000000000000;
         6'b110100: decoded_masks = 60'b000000001000000000000000000000000000000000000000000000000000;
         6'b110101: decoded_masks = 60'b000000010000000000000000000000000000000000000000000000000000;
         6'b110110: decoded_masks = 60'b000000100000000000000000000000000000000000000000000000000000;
         6'b110111: decoded_masks = 60'b000001000000000000000000000000000000000000000000000000000000;
         6'b111000: decoded_masks = 60'b000010000000000000000000000000000000000000000000000000000000;
         6'b111001: decoded_masks = 60'b000100000000000000000000000000000000000000000000000000000000;
         6'b111010: decoded_masks = 60'b001000000000000000000000000000000000000000000000000000000000;
         6'b111011: decoded_masks = 60'b010000000000000000000000000000000000000000000000000000000000;
         6'b111100: decoded_masks = 60'b100000000000000000000000000000000000000000000000000000000000;
         default:   decoded_masks = 60'b111111111111111111111111111111111111111111111111111111111111;
      endcase
   end
endmodule


module picorv32_rtl1_tessent_edt_c1_xor_decoder (
   input  wire [17:0] encoded_masks,
   output wire [29:0] decoded_masks_0,
   output wire [29:0] decoded_masks_1
);
   assign decoded_masks_0[ 0] = encoded_masks[ 0] ^ encoded_masks[ 1] ^ encoded_masks[ 2];
   assign decoded_masks_0[ 1] = encoded_masks[ 0] ^ encoded_masks[ 1] ^ encoded_masks[ 3];
   assign decoded_masks_0[ 2] = encoded_masks[ 0] ^ encoded_masks[ 1] ^ encoded_masks[ 4];
   assign decoded_masks_0[ 3] = encoded_masks[ 0] ^ encoded_masks[ 1] ^ encoded_masks[ 5];
   assign decoded_masks_0[ 4] = encoded_masks[ 0] ^ encoded_masks[ 1] ^ encoded_masks[ 6];
   assign decoded_masks_0[ 5] = encoded_masks[ 0] ^ encoded_masks[ 1] ^ encoded_masks[ 7];
   assign decoded_masks_0[ 6] = encoded_masks[ 0] ^ encoded_masks[ 1] ^ encoded_masks[ 8];
   assign decoded_masks_0[ 7] = encoded_masks[ 0] ^ encoded_masks[ 2] ^ encoded_masks[ 3];
   assign decoded_masks_0[ 8] = encoded_masks[ 1] ^ encoded_masks[ 2] ^ encoded_masks[ 3];
   assign decoded_masks_0[ 9] = encoded_masks[ 3] ^ encoded_masks[ 4] ^ encoded_masks[ 7];
   assign decoded_masks_0[10] = encoded_masks[ 1] ^ encoded_masks[ 6] ^ encoded_masks[ 8];
   assign decoded_masks_0[11] = encoded_masks[ 2] ^ encoded_masks[ 4] ^ encoded_masks[ 5];
   assign decoded_masks_0[12] = encoded_masks[ 5] ^ encoded_masks[ 6] ^ encoded_masks[ 7];
   assign decoded_masks_0[13] = encoded_masks[ 0] ^ encoded_masks[ 4] ^ encoded_masks[ 8];
   assign decoded_masks_0[14] = encoded_masks[ 0] ^ encoded_masks[ 5] ^ encoded_masks[ 6];
   assign decoded_masks_0[15] = encoded_masks[ 6] ^ encoded_masks[ 7] ^ encoded_masks[ 8];
   assign decoded_masks_0[16] = encoded_masks[ 2] ^ encoded_masks[ 5] ^ encoded_masks[ 7];
   assign decoded_masks_0[17] = encoded_masks[ 3] ^ encoded_masks[ 6] ^ encoded_masks[ 8];
   assign decoded_masks_0[18] = encoded_masks[ 1] ^ encoded_masks[ 4] ^ encoded_masks[ 8];
   assign decoded_masks_0[19] = encoded_masks[ 3] ^ encoded_masks[ 4] ^ encoded_masks[ 5];
   assign decoded_masks_0[20] = encoded_masks[ 2] ^ encoded_masks[ 6] ^ encoded_masks[ 7];
   assign decoded_masks_0[21] = encoded_masks[ 0] ^ encoded_masks[ 2] ^ encoded_masks[ 6];
   assign decoded_masks_0[22] = encoded_masks[ 5] ^ encoded_masks[ 7] ^ encoded_masks[ 8];
   assign decoded_masks_0[23] = encoded_masks[ 1] ^ encoded_masks[ 3] ^ encoded_masks[ 4];
   assign decoded_masks_0[24] = encoded_masks[ 2] ^ encoded_masks[ 3] ^ encoded_masks[ 7];
   assign decoded_masks_0[25] = encoded_masks[ 4] ^ encoded_masks[ 6] ^ encoded_masks[ 8];
   assign decoded_masks_0[26] = encoded_masks[ 2] ^ encoded_masks[ 5] ^ encoded_masks[ 6];
   assign decoded_masks_0[27] = encoded_masks[ 0] ^ encoded_masks[ 2] ^ encoded_masks[ 4];
   assign decoded_masks_0[28] = encoded_masks[ 0] ^ encoded_masks[ 5] ^ encoded_masks[ 7];
   assign decoded_masks_0[29] = encoded_masks[ 3] ^ encoded_masks[ 5] ^ encoded_masks[ 8];

   assign decoded_masks_1[ 0] = encoded_masks[ 9] ^ encoded_masks[10] ^ encoded_masks[11];
   assign decoded_masks_1[ 1] = encoded_masks[ 9] ^ encoded_masks[10] ^ encoded_masks[12];
   assign decoded_masks_1[ 2] = encoded_masks[ 9] ^ encoded_masks[10] ^ encoded_masks[13];
   assign decoded_masks_1[ 3] = encoded_masks[ 9] ^ encoded_masks[10] ^ encoded_masks[14];
   assign decoded_masks_1[ 4] = encoded_masks[ 9] ^ encoded_masks[10] ^ encoded_masks[15];
   assign decoded_masks_1[ 5] = encoded_masks[ 9] ^ encoded_masks[10] ^ encoded_masks[16];
   assign decoded_masks_1[ 6] = encoded_masks[ 9] ^ encoded_masks[10] ^ encoded_masks[17];
   assign decoded_masks_1[ 7] = encoded_masks[ 9] ^ encoded_masks[11] ^ encoded_masks[12];
   assign decoded_masks_1[ 8] = encoded_masks[10] ^ encoded_masks[11] ^ encoded_masks[12];
   assign decoded_masks_1[ 9] = encoded_masks[12] ^ encoded_masks[13] ^ encoded_masks[16];
   assign decoded_masks_1[10] = encoded_masks[10] ^ encoded_masks[15] ^ encoded_masks[17];
   assign decoded_masks_1[11] = encoded_masks[11] ^ encoded_masks[13] ^ encoded_masks[14];
   assign decoded_masks_1[12] = encoded_masks[14] ^ encoded_masks[15] ^ encoded_masks[16];
   assign decoded_masks_1[13] = encoded_masks[ 9] ^ encoded_masks[13] ^ encoded_masks[17];
   assign decoded_masks_1[14] = encoded_masks[ 9] ^ encoded_masks[14] ^ encoded_masks[15];
   assign decoded_masks_1[15] = encoded_masks[15] ^ encoded_masks[16] ^ encoded_masks[17];
   assign decoded_masks_1[16] = encoded_masks[11] ^ encoded_masks[14] ^ encoded_masks[16];
   assign decoded_masks_1[17] = encoded_masks[12] ^ encoded_masks[15] ^ encoded_masks[17];
   assign decoded_masks_1[18] = encoded_masks[10] ^ encoded_masks[13] ^ encoded_masks[17];
   assign decoded_masks_1[19] = encoded_masks[12] ^ encoded_masks[13] ^ encoded_masks[14];
   assign decoded_masks_1[20] = encoded_masks[11] ^ encoded_masks[15] ^ encoded_masks[16];
   assign decoded_masks_1[21] = encoded_masks[ 9] ^ encoded_masks[11] ^ encoded_masks[15];
   assign decoded_masks_1[22] = encoded_masks[14] ^ encoded_masks[16] ^ encoded_masks[17];
   assign decoded_masks_1[23] = encoded_masks[10] ^ encoded_masks[12] ^ encoded_masks[13];
   assign decoded_masks_1[24] = encoded_masks[11] ^ encoded_masks[12] ^ encoded_masks[16];
   assign decoded_masks_1[25] = encoded_masks[13] ^ encoded_masks[15] ^ encoded_masks[17];
   assign decoded_masks_1[26] = encoded_masks[11] ^ encoded_masks[14] ^ encoded_masks[15];
   assign decoded_masks_1[27] = encoded_masks[ 9] ^ encoded_masks[11] ^ encoded_masks[13];
   assign decoded_masks_1[28] = encoded_masks[ 9] ^ encoded_masks[14] ^ encoded_masks[16];
   assign decoded_masks_1[29] = encoded_masks[12] ^ encoded_masks[14] ^ encoded_masks[17];

endmodule


module picorv32_rtl1_tessent_edt_c1_plugin_xor_decoder (
   input  wire [ 9:0] encoded_masks,
   output wire [17:0] decoded_masks
);
   assign decoded_masks[ 0] = encoded_masks[0];
   assign decoded_masks[ 1] = encoded_masks[1];
   assign decoded_masks[ 2] = encoded_masks[2];
   assign decoded_masks[ 3] = encoded_masks[3];
   assign decoded_masks[ 4] = encoded_masks[4];
   assign decoded_masks[ 5] = encoded_masks[5];
   assign decoded_masks[ 6] = encoded_masks[6];
   assign decoded_masks[ 7] = encoded_masks[7];
   assign decoded_masks[ 8] = encoded_masks[8];
   assign decoded_masks[ 9] = encoded_masks[9];
   assign decoded_masks[10] = encoded_masks[0] ^ encoded_masks[1] ^ encoded_masks[2];
   assign decoded_masks[11] = encoded_masks[0] ^ encoded_masks[1] ^ encoded_masks[3];
   assign decoded_masks[12] = encoded_masks[0] ^ encoded_masks[1] ^ encoded_masks[4];
   assign decoded_masks[13] = encoded_masks[0] ^ encoded_masks[1] ^ encoded_masks[5];
   assign decoded_masks[14] = encoded_masks[0] ^ encoded_masks[1] ^ encoded_masks[6];
   assign decoded_masks[15] = encoded_masks[0] ^ encoded_masks[1] ^ encoded_masks[7];
   assign decoded_masks[16] = encoded_masks[0] ^ encoded_masks[1] ^ encoded_masks[8];
   assign decoded_masks[17] = encoded_masks[0] ^ encoded_masks[1] ^ encoded_masks[9];
endmodule


module picorv32_rtl1_tessent_edt_c1_controller (
   input  wire        edt_clock,
   input  wire        edt_update,
   input  wire        edt_configuration,
   input  wire        edt_low_power_shift_en,
   input  wire [ 1:0] edt_channels_in,
   input  wire [59:0] edt_decompressor_out,
   output wire [ 1:0] edt_channels_out_from_controller,
   output wire [29:0] masks_for_compactor_0,
   output wire [29:0] masks_for_compactor_1,
   output wire [59:0] edt_scan_in
);
   reg    [ 9:0] masks_shift_reg_0;
   reg    [ 8:0] masks_shift_reg_1;
   reg    [ 9:0] masks_hold_reg_0;
   reg    [ 8:0] masks_hold_reg_1;
   wire          control_bit;
   wire   [ 4:0] config0_onehot_encoded_masks_0;
   wire   [ 4:0] config0_onehot_encoded_masks_1;
   wire   [ 5:0] config1_onehot_encoded_masks_0;
   wire   [17:0] config0_xor_encoded_masks;
   wire   [ 9:0] config1_plugin_xor_encoded_masks;
   wire   [17:0] config1_xor_encoded_masks;
   wire   [17:0] xor_encoded_masks;
   wire   [29:0] config0_onehot_decoded_masks_0;
   wire   [29:0] config0_onehot_decoded_masks_1;
   wire   [59:0] config1_onehot_decoded_masks_0;
   wire   [29:0] onehot_decoded_masks_0;
   wire   [29:0] onehot_decoded_masks_1;
   wire   [29:0] xor_decoded_masks_0;
   wire   [29:0] xor_decoded_masks_1;
   wire          config0_masks_shift_reg_1_in;
   wire          masks_shift_reg_sync_reset;
   wire   [ 1:0] edt_channels_out_from_low_power_shift_control;

   picorv32_rtl1_tessent_edt_c1_low_power_shift_controller low_power_shift_controller_i (
      .edt_clock(edt_clock),
      .edt_update(edt_update),
      .edt_configuration(edt_configuration),
      .edt_low_power_shift_en(edt_low_power_shift_en),
      .edt_channels_in(edt_channels_in),
      .edt_decompressor_out(edt_decompressor_out),
      .edt_channels_out_from_low_power_shift_control(edt_channels_out_from_low_power_shift_control),
      .edt_scan_in(edt_scan_in));

   assign masks_shift_reg_sync_reset = edt_update;

   // synopsys sync_set_reset masks_shift_reg_sync_reset
   always @(posedge edt_clock)
   begin : shift_masks_regs
      if (masks_shift_reg_sync_reset == 1'b1) begin
         masks_shift_reg_0 <= 10'b0000000000;
         masks_shift_reg_1 <= 9'b000000000;
      end
      else begin
         masks_shift_reg_0 <= {edt_channels_out_from_low_power_shift_control[0], masks_shift_reg_0[9:1]};
         masks_shift_reg_1 <= {config0_masks_shift_reg_1_in, masks_shift_reg_1[8:1]};
      end
   end

   always @(posedge edt_clock)
   begin : update_masks_regs
      if (edt_update == 1'b1) begin
         masks_hold_reg_0 <= masks_shift_reg_0;
         masks_hold_reg_1 <= masks_shift_reg_1;
      end
   end

   assign config0_masks_shift_reg_1_in = edt_configuration ? masks_shift_reg_0[0] : edt_channels_out_from_low_power_shift_control[1];

   assign edt_channels_out_from_controller[0] = edt_configuration ? masks_shift_reg_1[8] : masks_shift_reg_0[0];
   assign edt_channels_out_from_controller[1] = edt_configuration ? masks_shift_reg_1[8] : masks_shift_reg_1[0];

   assign control_bit = masks_hold_reg_0[9];

   assign config0_xor_encoded_masks = {masks_hold_reg_1[0], masks_hold_reg_1[1], masks_hold_reg_1[2], 
                                       masks_hold_reg_1[3], masks_hold_reg_1[4], masks_hold_reg_1[5], 
                                       masks_hold_reg_1[6], masks_hold_reg_1[7], masks_hold_reg_1[8], 
                                       masks_hold_reg_0[0], masks_hold_reg_0[1], masks_hold_reg_0[2], 
                                       masks_hold_reg_0[3], masks_hold_reg_0[4], masks_hold_reg_0[5], 
                                       masks_hold_reg_0[6], masks_hold_reg_0[7], masks_hold_reg_0[8]};

   assign config1_plugin_xor_encoded_masks = {masks_hold_reg_1[8], masks_hold_reg_0[0], masks_hold_reg_0[1], 
                                              masks_hold_reg_0[2], masks_hold_reg_0[3], masks_hold_reg_0[4], 
                                              masks_hold_reg_0[5], masks_hold_reg_0[6], masks_hold_reg_0[7], 
                                              masks_hold_reg_0[8]};

   assign config0_onehot_encoded_masks_0 = {masks_hold_reg_0[8], masks_hold_reg_0[7], masks_hold_reg_0[6], 
                                            masks_hold_reg_0[5], masks_hold_reg_0[4]};
   assign config0_onehot_encoded_masks_1 = {masks_hold_reg_1[8], masks_hold_reg_1[7], masks_hold_reg_1[6], 
                                            masks_hold_reg_1[5], masks_hold_reg_1[4]};

   assign config1_onehot_encoded_masks_0 = {masks_hold_reg_0[8], masks_hold_reg_0[7], masks_hold_reg_0[6], 
                                            masks_hold_reg_0[5], masks_hold_reg_0[4], masks_hold_reg_0[3]};

   picorv32_rtl1_tessent_edt_c1_plugin_xor_decoder plugin_xor_decoder (
      .encoded_masks(config1_plugin_xor_encoded_masks),
      .decoded_masks(config1_xor_encoded_masks));

   assign xor_encoded_masks = edt_configuration ? config1_xor_encoded_masks : config0_xor_encoded_masks;

   picorv32_rtl1_tessent_edt_c1_xor_decoder xor_decoder (
      .encoded_masks(xor_encoded_masks),
      .decoded_masks_0(xor_decoded_masks_0),
      .decoded_masks_1(xor_decoded_masks_1));

   picorv32_rtl1_tessent_edt_c1_onehot_decoder_5_to_30 config0_decoder1 (.encoded_masks(config0_onehot_encoded_masks_0),
                                                                         .decoded_masks(config0_onehot_decoded_masks_0));
   picorv32_rtl1_tessent_edt_c1_onehot_decoder_5_to_30 config0_decoder2 (.encoded_masks(config0_onehot_encoded_masks_1),
                                                                         .decoded_masks(config0_onehot_decoded_masks_1));

   picorv32_rtl1_tessent_edt_c1_onehot_decoder_6_to_60 config1_decoder1 (.encoded_masks(config1_onehot_encoded_masks_0),
                                                                         .decoded_masks(config1_onehot_decoded_masks_0));

   assign onehot_decoded_masks_0 = edt_configuration ? config1_onehot_decoded_masks_0[29:0] : config0_onehot_decoded_masks_0;
   assign onehot_decoded_masks_1 = edt_configuration ? config1_onehot_decoded_masks_0[59:30] : config0_onehot_decoded_masks_1;

   assign masks_for_compactor_0 = control_bit ? onehot_decoded_masks_0 : xor_decoded_masks_0;
   assign masks_for_compactor_1 = control_bit ? onehot_decoded_masks_1 : xor_decoded_masks_1;
endmodule


module picorv32_rtl1_tessent_edt_c1_spatial_compactor_30_w_output_lockup (
   input  wire        edt_clock,
   input  wire [29:0] multi_bit_input,
   output reg         single_bit_output
);
   reg    [14:0] level1;
   reg    [ 7:0] level2;
   reg    [ 3:0] level3;
   reg    [ 1:0] level4;
   reg           level5_pipelined;

   always @(multi_bit_input)
   begin : compact30_level1
      level1[ 0] = multi_bit_input[ 0] ^ multi_bit_input[ 1];
      level1[ 1] = multi_bit_input[ 2] ^ multi_bit_input[ 3];
      level1[ 2] = multi_bit_input[ 4] ^ multi_bit_input[ 5];
      level1[ 3] = multi_bit_input[ 6] ^ multi_bit_input[ 7];
      level1[ 4] = multi_bit_input[ 8] ^ multi_bit_input[ 9];
      level1[ 5] = multi_bit_input[10] ^ multi_bit_input[11];
      level1[ 6] = multi_bit_input[12] ^ multi_bit_input[13];
      level1[ 7] = multi_bit_input[14] ^ multi_bit_input[15];
      level1[ 8] = multi_bit_input[16] ^ multi_bit_input[17];
      level1[ 9] = multi_bit_input[18] ^ multi_bit_input[19];
      level1[10] = multi_bit_input[20] ^ multi_bit_input[21];
      level1[11] = multi_bit_input[22] ^ multi_bit_input[23];
      level1[12] = multi_bit_input[24] ^ multi_bit_input[25];
      level1[13] = multi_bit_input[26] ^ multi_bit_input[27];
      level1[14] = multi_bit_input[28] ^ multi_bit_input[29];
   end

   always @(level1)
   begin : compact30_level2
      level2[0] = level1[ 0] ^ level1[ 1];
      level2[1] = level1[ 2] ^ level1[ 3];
      level2[2] = level1[ 4] ^ level1[ 5];
      level2[3] = level1[ 6] ^ level1[ 7];
      level2[4] = level1[ 8] ^ level1[ 9];
      level2[5] = level1[10] ^ level1[11];
      level2[6] = level1[12] ^ level1[13];
      level2[7] = level1[14];
   end

   always @(level2)
   begin : compact30_level3
      level3[0] = level2[0] ^ level2[1];
      level3[1] = level2[2] ^ level2[3];
      level3[2] = level2[4] ^ level2[5];
      level3[3] = level2[6] ^ level2[7];
   end

   always @(level3)
   begin : compact30_level4
      level4[0] = level3[0] ^ level3[1];
      level4[1] = level3[2] ^ level3[3];
   end

   always @(posedge edt_clock)
   begin : compact30_level5_pipelined
      level5_pipelined <= level4[0] ^ level4[1];
   end

   always @(negedge edt_clock)
   begin : compact30_level5_lockup
      single_bit_output <= level5_pipelined;
   end

endmodule


module picorv32_rtl1_tessent_edt_c1_config1_spatial_compactor_2 (
   input  wire [1:0] multi_bit_input,
   output reg        single_bit_output
);

   always @(multi_bit_input)
   begin : compact2_level1
      single_bit_output = multi_bit_input[0] ^ multi_bit_input[1];
   end

endmodule


module picorv32_rtl1_tessent_edt_c1_compactor (
   input  wire        edt_clock,
   input  wire        edt_configuration,
   input  wire [59:0] edt_scan_out,
   input  wire [29:0] masks_for_compactor_0,
   input  wire [29:0] masks_for_compactor_1,
   output wire [ 1:0] edt_channels_out
);
   wire   [29:0] masked_scan_outputs_0;
   wire   [29:0] masked_scan_outputs_1;
   wire   [1:0] config0_edt_channels_out;
   wire         config1_edt_channels_out;

   assign masked_scan_outputs_0 = edt_scan_out[29: 0] & masks_for_compactor_0;
   assign masked_scan_outputs_1 = edt_scan_out[59:30] & masks_for_compactor_1;

   picorv32_rtl1_tessent_edt_c1_spatial_compactor_30_w_output_lockup config0_compactor1 (
      .edt_clock(edt_clock),
      .multi_bit_input(masked_scan_outputs_0),
      .single_bit_output(config0_edt_channels_out[0]));
   picorv32_rtl1_tessent_edt_c1_spatial_compactor_30_w_output_lockup config0_compactor2 (
      .edt_clock(edt_clock),
      .multi_bit_input(masked_scan_outputs_1),
      .single_bit_output(config0_edt_channels_out[1]));

   picorv32_rtl1_tessent_edt_c1_config1_spatial_compactor_2 config1_compactor1 (
      .multi_bit_input(config0_edt_channels_out[1:0]),
      .single_bit_output(config1_edt_channels_out));

   assign edt_channels_out[0] = edt_configuration ? config1_edt_channels_out : config0_edt_channels_out[0];
   assign edt_channels_out[1] = config0_edt_channels_out[1];
endmodule


module picorv32_rtl1_tessent_edt_c1_bypass_logic (
   input  wire        edt_bypass,
   input  wire [ 1:0] edt_channels_in,
   output wire [ 1:0] edt_channels_out,
   output wire [59:0] edt_scan_in,
   input  wire [59:0] edt_scan_out,
   input  wire [59:0] edt_bypass_in,
   input  wire [ 1:0] edt_bypass_out
);

   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_0 (
      .a(edt_bypass_in[0]),
      .b(edt_channels_in[0]),
      .s(edt_bypass),
      .y(edt_scan_in[0]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_1 (
      .a(edt_bypass_in[1]),
      .b(edt_scan_out[0]),
      .s(edt_bypass),
      .y(edt_scan_in[1]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_2 (
      .a(edt_bypass_in[2]),
      .b(edt_scan_out[1]),
      .s(edt_bypass),
      .y(edt_scan_in[2]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_3 (
      .a(edt_bypass_in[3]),
      .b(edt_scan_out[2]),
      .s(edt_bypass),
      .y(edt_scan_in[3]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_4 (
      .a(edt_bypass_in[4]),
      .b(edt_scan_out[3]),
      .s(edt_bypass),
      .y(edt_scan_in[4]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_5 (
      .a(edt_bypass_in[5]),
      .b(edt_scan_out[4]),
      .s(edt_bypass),
      .y(edt_scan_in[5]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_6 (
      .a(edt_bypass_in[6]),
      .b(edt_scan_out[5]),
      .s(edt_bypass),
      .y(edt_scan_in[6]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_7 (
      .a(edt_bypass_in[7]),
      .b(edt_scan_out[6]),
      .s(edt_bypass),
      .y(edt_scan_in[7]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_8 (
      .a(edt_bypass_in[8]),
      .b(edt_scan_out[7]),
      .s(edt_bypass),
      .y(edt_scan_in[8]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_9 (
      .a(edt_bypass_in[9]),
      .b(edt_scan_out[8]),
      .s(edt_bypass),
      .y(edt_scan_in[9]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_10 (
      .a(edt_bypass_in[10]),
      .b(edt_scan_out[9]),
      .s(edt_bypass),
      .y(edt_scan_in[10]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_11 (
      .a(edt_bypass_in[11]),
      .b(edt_scan_out[10]),
      .s(edt_bypass),
      .y(edt_scan_in[11]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_12 (
      .a(edt_bypass_in[12]),
      .b(edt_scan_out[11]),
      .s(edt_bypass),
      .y(edt_scan_in[12]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_13 (
      .a(edt_bypass_in[13]),
      .b(edt_scan_out[12]),
      .s(edt_bypass),
      .y(edt_scan_in[13]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_14 (
      .a(edt_bypass_in[14]),
      .b(edt_scan_out[13]),
      .s(edt_bypass),
      .y(edt_scan_in[14]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_15 (
      .a(edt_bypass_in[15]),
      .b(edt_scan_out[14]),
      .s(edt_bypass),
      .y(edt_scan_in[15]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_16 (
      .a(edt_bypass_in[16]),
      .b(edt_scan_out[15]),
      .s(edt_bypass),
      .y(edt_scan_in[16]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_17 (
      .a(edt_bypass_in[17]),
      .b(edt_scan_out[16]),
      .s(edt_bypass),
      .y(edt_scan_in[17]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_18 (
      .a(edt_bypass_in[18]),
      .b(edt_scan_out[17]),
      .s(edt_bypass),
      .y(edt_scan_in[18]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_19 (
      .a(edt_bypass_in[19]),
      .b(edt_scan_out[18]),
      .s(edt_bypass),
      .y(edt_scan_in[19]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_20 (
      .a(edt_bypass_in[20]),
      .b(edt_scan_out[19]),
      .s(edt_bypass),
      .y(edt_scan_in[20]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_21 (
      .a(edt_bypass_in[21]),
      .b(edt_scan_out[20]),
      .s(edt_bypass),
      .y(edt_scan_in[21]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_22 (
      .a(edt_bypass_in[22]),
      .b(edt_scan_out[21]),
      .s(edt_bypass),
      .y(edt_scan_in[22]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_23 (
      .a(edt_bypass_in[23]),
      .b(edt_scan_out[22]),
      .s(edt_bypass),
      .y(edt_scan_in[23]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_24 (
      .a(edt_bypass_in[24]),
      .b(edt_scan_out[23]),
      .s(edt_bypass),
      .y(edt_scan_in[24]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_25 (
      .a(edt_bypass_in[25]),
      .b(edt_scan_out[24]),
      .s(edt_bypass),
      .y(edt_scan_in[25]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_26 (
      .a(edt_bypass_in[26]),
      .b(edt_scan_out[25]),
      .s(edt_bypass),
      .y(edt_scan_in[26]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_27 (
      .a(edt_bypass_in[27]),
      .b(edt_scan_out[26]),
      .s(edt_bypass),
      .y(edt_scan_in[27]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_28 (
      .a(edt_bypass_in[28]),
      .b(edt_scan_out[27]),
      .s(edt_bypass),
      .y(edt_scan_in[28]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_29 (
      .a(edt_bypass_in[29]),
      .b(edt_scan_out[28]),
      .s(edt_bypass),
      .y(edt_scan_in[29]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_30 (
      .a(edt_bypass_in[30]),
      .b(edt_channels_in[1]),
      .s(edt_bypass),
      .y(edt_scan_in[30]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_31 (
      .a(edt_bypass_in[31]),
      .b(edt_scan_out[30]),
      .s(edt_bypass),
      .y(edt_scan_in[31]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_32 (
      .a(edt_bypass_in[32]),
      .b(edt_scan_out[31]),
      .s(edt_bypass),
      .y(edt_scan_in[32]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_33 (
      .a(edt_bypass_in[33]),
      .b(edt_scan_out[32]),
      .s(edt_bypass),
      .y(edt_scan_in[33]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_34 (
      .a(edt_bypass_in[34]),
      .b(edt_scan_out[33]),
      .s(edt_bypass),
      .y(edt_scan_in[34]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_35 (
      .a(edt_bypass_in[35]),
      .b(edt_scan_out[34]),
      .s(edt_bypass),
      .y(edt_scan_in[35]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_36 (
      .a(edt_bypass_in[36]),
      .b(edt_scan_out[35]),
      .s(edt_bypass),
      .y(edt_scan_in[36]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_37 (
      .a(edt_bypass_in[37]),
      .b(edt_scan_out[36]),
      .s(edt_bypass),
      .y(edt_scan_in[37]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_38 (
      .a(edt_bypass_in[38]),
      .b(edt_scan_out[37]),
      .s(edt_bypass),
      .y(edt_scan_in[38]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_39 (
      .a(edt_bypass_in[39]),
      .b(edt_scan_out[38]),
      .s(edt_bypass),
      .y(edt_scan_in[39]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_40 (
      .a(edt_bypass_in[40]),
      .b(edt_scan_out[39]),
      .s(edt_bypass),
      .y(edt_scan_in[40]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_41 (
      .a(edt_bypass_in[41]),
      .b(edt_scan_out[40]),
      .s(edt_bypass),
      .y(edt_scan_in[41]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_42 (
      .a(edt_bypass_in[42]),
      .b(edt_scan_out[41]),
      .s(edt_bypass),
      .y(edt_scan_in[42]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_43 (
      .a(edt_bypass_in[43]),
      .b(edt_scan_out[42]),
      .s(edt_bypass),
      .y(edt_scan_in[43]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_44 (
      .a(edt_bypass_in[44]),
      .b(edt_scan_out[43]),
      .s(edt_bypass),
      .y(edt_scan_in[44]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_45 (
      .a(edt_bypass_in[45]),
      .b(edt_scan_out[44]),
      .s(edt_bypass),
      .y(edt_scan_in[45]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_46 (
      .a(edt_bypass_in[46]),
      .b(edt_scan_out[45]),
      .s(edt_bypass),
      .y(edt_scan_in[46]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_47 (
      .a(edt_bypass_in[47]),
      .b(edt_scan_out[46]),
      .s(edt_bypass),
      .y(edt_scan_in[47]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_48 (
      .a(edt_bypass_in[48]),
      .b(edt_scan_out[47]),
      .s(edt_bypass),
      .y(edt_scan_in[48]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_49 (
      .a(edt_bypass_in[49]),
      .b(edt_scan_out[48]),
      .s(edt_bypass),
      .y(edt_scan_in[49]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_50 (
      .a(edt_bypass_in[50]),
      .b(edt_scan_out[49]),
      .s(edt_bypass),
      .y(edt_scan_in[50]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_51 (
      .a(edt_bypass_in[51]),
      .b(edt_scan_out[50]),
      .s(edt_bypass),
      .y(edt_scan_in[51]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_52 (
      .a(edt_bypass_in[52]),
      .b(edt_scan_out[51]),
      .s(edt_bypass),
      .y(edt_scan_in[52]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_53 (
      .a(edt_bypass_in[53]),
      .b(edt_scan_out[52]),
      .s(edt_bypass),
      .y(edt_scan_in[53]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_54 (
      .a(edt_bypass_in[54]),
      .b(edt_scan_out[53]),
      .s(edt_bypass),
      .y(edt_scan_in[54]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_55 (
      .a(edt_bypass_in[55]),
      .b(edt_scan_out[54]),
      .s(edt_bypass),
      .y(edt_scan_in[55]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_56 (
      .a(edt_bypass_in[56]),
      .b(edt_scan_out[55]),
      .s(edt_bypass),
      .y(edt_scan_in[56]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_57 (
      .a(edt_bypass_in[57]),
      .b(edt_scan_out[56]),
      .s(edt_bypass),
      .y(edt_scan_in[57]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_58 (
      .a(edt_bypass_in[58]),
      .b(edt_scan_out[57]),
      .s(edt_bypass),
      .y(edt_scan_in[58]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_scan_in_mux_59 (
      .a(edt_bypass_in[59]),
      .b(edt_scan_out[58]),
      .s(edt_bypass),
      .y(edt_scan_in[59]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_channels_out_mux_0 (
      .a(edt_bypass_out[0]),
      .b(edt_scan_out[29]),
      .s(edt_bypass),
      .y(edt_channels_out[0]));
   picorv32_rtl1_tessent_mux2 tessent_persistent_cell_edt_channels_out_mux_1 (
      .a(edt_bypass_out[1]),
      .b(edt_scan_out[59]),
      .s(edt_bypass),
      .y(edt_channels_out[1]));
endmodule


module picorv32_rtl1_tessent_edt_c1 (
   input  wire        edt_clock,
   input  wire        edt_update,
   input  wire        edt_configuration,
   input  wire        edt_low_power_shift_en,
   input  wire        edt_bypass,
   input  wire [ 1:0] edt_channels_in,
   output wire [ 1:0] edt_channels_out,
   output wire [59:0] edt_scan_in,
   input  wire [59:0] edt_scan_out
);
   wire   [59:0] edt_decompressor_out;
   wire   [59:0] edt_bypass_in;
   wire   [ 1:0] edt_bypass_out;
   wire   [29:0] masks_for_compactor_0;
   wire   [29:0] masks_for_compactor_1;
   wire   [ 1:0] edt_channels_out_from_controller;
   wire          edt_clock_buf_out;
   wire          edt_update_buf_out;
   wire          edt_bypass_buf_out;
   wire          edt_configuration_buf_out;
   wire          edt_low_power_shift_en_buf_out;
   wire   [ 1:0] edt_channels_in_buf_out;
   wire   [ 1:0] edt_channels_out_buf_in;
   wire   [59:0] edt_scan_in_buf_in;
   wire   [59:0] edt_scan_out_buf_out;

   picorv32_rtl1_tessent_clk_buf tessent_persistent_cell_edt_clock_buf (.a(edt_clock),
                                                                        .y(edt_clock_buf_out));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_update_buf (.a(edt_update),
                                                                     .y(edt_update_buf_out));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_bypass_buf (.a(edt_bypass),
                                                                     .y(edt_bypass_buf_out));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_configuration_buf (.a(edt_configuration),
                                                                            .y(edt_configuration_buf_out));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_low_power_shift_en_buf (.a(edt_low_power_shift_en),
                                                                                 .y(edt_low_power_shift_en_buf_out));

   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_channels_in_0_buf (.a(edt_channels_in[0]),
                                                                            .y(edt_channels_in_buf_out[0]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_channels_in_1_buf (.a(edt_channels_in[1]),
                                                                            .y(edt_channels_in_buf_out[1]));

   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_channels_out_0_buf (.a(edt_channels_out_buf_in[0]),
                                                                             .y(edt_channels_out[0]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_channels_out_1_buf (.a(edt_channels_out_buf_in[1]),
                                                                             .y(edt_channels_out[1]));

   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_0_buf (.a(edt_scan_in_buf_in[0]),
                                                                        .y(edt_scan_in[0]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_1_buf (.a(edt_scan_in_buf_in[1]),
                                                                        .y(edt_scan_in[1]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_2_buf (.a(edt_scan_in_buf_in[2]),
                                                                        .y(edt_scan_in[2]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_3_buf (.a(edt_scan_in_buf_in[3]),
                                                                        .y(edt_scan_in[3]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_4_buf (.a(edt_scan_in_buf_in[4]),
                                                                        .y(edt_scan_in[4]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_5_buf (.a(edt_scan_in_buf_in[5]),
                                                                        .y(edt_scan_in[5]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_6_buf (.a(edt_scan_in_buf_in[6]),
                                                                        .y(edt_scan_in[6]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_7_buf (.a(edt_scan_in_buf_in[7]),
                                                                        .y(edt_scan_in[7]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_8_buf (.a(edt_scan_in_buf_in[8]),
                                                                        .y(edt_scan_in[8]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_9_buf (.a(edt_scan_in_buf_in[9]),
                                                                        .y(edt_scan_in[9]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_10_buf (.a(edt_scan_in_buf_in[10]),
                                                                         .y(edt_scan_in[10]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_11_buf (.a(edt_scan_in_buf_in[11]),
                                                                         .y(edt_scan_in[11]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_12_buf (.a(edt_scan_in_buf_in[12]),
                                                                         .y(edt_scan_in[12]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_13_buf (.a(edt_scan_in_buf_in[13]),
                                                                         .y(edt_scan_in[13]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_14_buf (.a(edt_scan_in_buf_in[14]),
                                                                         .y(edt_scan_in[14]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_15_buf (.a(edt_scan_in_buf_in[15]),
                                                                         .y(edt_scan_in[15]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_16_buf (.a(edt_scan_in_buf_in[16]),
                                                                         .y(edt_scan_in[16]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_17_buf (.a(edt_scan_in_buf_in[17]),
                                                                         .y(edt_scan_in[17]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_18_buf (.a(edt_scan_in_buf_in[18]),
                                                                         .y(edt_scan_in[18]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_19_buf (.a(edt_scan_in_buf_in[19]),
                                                                         .y(edt_scan_in[19]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_20_buf (.a(edt_scan_in_buf_in[20]),
                                                                         .y(edt_scan_in[20]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_21_buf (.a(edt_scan_in_buf_in[21]),
                                                                         .y(edt_scan_in[21]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_22_buf (.a(edt_scan_in_buf_in[22]),
                                                                         .y(edt_scan_in[22]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_23_buf (.a(edt_scan_in_buf_in[23]),
                                                                         .y(edt_scan_in[23]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_24_buf (.a(edt_scan_in_buf_in[24]),
                                                                         .y(edt_scan_in[24]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_25_buf (.a(edt_scan_in_buf_in[25]),
                                                                         .y(edt_scan_in[25]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_26_buf (.a(edt_scan_in_buf_in[26]),
                                                                         .y(edt_scan_in[26]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_27_buf (.a(edt_scan_in_buf_in[27]),
                                                                         .y(edt_scan_in[27]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_28_buf (.a(edt_scan_in_buf_in[28]),
                                                                         .y(edt_scan_in[28]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_29_buf (.a(edt_scan_in_buf_in[29]),
                                                                         .y(edt_scan_in[29]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_30_buf (.a(edt_scan_in_buf_in[30]),
                                                                         .y(edt_scan_in[30]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_31_buf (.a(edt_scan_in_buf_in[31]),
                                                                         .y(edt_scan_in[31]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_32_buf (.a(edt_scan_in_buf_in[32]),
                                                                         .y(edt_scan_in[32]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_33_buf (.a(edt_scan_in_buf_in[33]),
                                                                         .y(edt_scan_in[33]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_34_buf (.a(edt_scan_in_buf_in[34]),
                                                                         .y(edt_scan_in[34]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_35_buf (.a(edt_scan_in_buf_in[35]),
                                                                         .y(edt_scan_in[35]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_36_buf (.a(edt_scan_in_buf_in[36]),
                                                                         .y(edt_scan_in[36]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_37_buf (.a(edt_scan_in_buf_in[37]),
                                                                         .y(edt_scan_in[37]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_38_buf (.a(edt_scan_in_buf_in[38]),
                                                                         .y(edt_scan_in[38]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_39_buf (.a(edt_scan_in_buf_in[39]),
                                                                         .y(edt_scan_in[39]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_40_buf (.a(edt_scan_in_buf_in[40]),
                                                                         .y(edt_scan_in[40]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_41_buf (.a(edt_scan_in_buf_in[41]),
                                                                         .y(edt_scan_in[41]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_42_buf (.a(edt_scan_in_buf_in[42]),
                                                                         .y(edt_scan_in[42]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_43_buf (.a(edt_scan_in_buf_in[43]),
                                                                         .y(edt_scan_in[43]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_44_buf (.a(edt_scan_in_buf_in[44]),
                                                                         .y(edt_scan_in[44]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_45_buf (.a(edt_scan_in_buf_in[45]),
                                                                         .y(edt_scan_in[45]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_46_buf (.a(edt_scan_in_buf_in[46]),
                                                                         .y(edt_scan_in[46]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_47_buf (.a(edt_scan_in_buf_in[47]),
                                                                         .y(edt_scan_in[47]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_48_buf (.a(edt_scan_in_buf_in[48]),
                                                                         .y(edt_scan_in[48]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_49_buf (.a(edt_scan_in_buf_in[49]),
                                                                         .y(edt_scan_in[49]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_50_buf (.a(edt_scan_in_buf_in[50]),
                                                                         .y(edt_scan_in[50]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_51_buf (.a(edt_scan_in_buf_in[51]),
                                                                         .y(edt_scan_in[51]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_52_buf (.a(edt_scan_in_buf_in[52]),
                                                                         .y(edt_scan_in[52]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_53_buf (.a(edt_scan_in_buf_in[53]),
                                                                         .y(edt_scan_in[53]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_54_buf (.a(edt_scan_in_buf_in[54]),
                                                                         .y(edt_scan_in[54]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_55_buf (.a(edt_scan_in_buf_in[55]),
                                                                         .y(edt_scan_in[55]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_56_buf (.a(edt_scan_in_buf_in[56]),
                                                                         .y(edt_scan_in[56]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_57_buf (.a(edt_scan_in_buf_in[57]),
                                                                         .y(edt_scan_in[57]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_58_buf (.a(edt_scan_in_buf_in[58]),
                                                                         .y(edt_scan_in[58]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_in_59_buf (.a(edt_scan_in_buf_in[59]),
                                                                         .y(edt_scan_in[59]));

   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_0_buf (.a(edt_scan_out[0]),
                                                                         .y(edt_scan_out_buf_out[0]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_1_buf (.a(edt_scan_out[1]),
                                                                         .y(edt_scan_out_buf_out[1]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_2_buf (.a(edt_scan_out[2]),
                                                                         .y(edt_scan_out_buf_out[2]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_3_buf (.a(edt_scan_out[3]),
                                                                         .y(edt_scan_out_buf_out[3]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_4_buf (.a(edt_scan_out[4]),
                                                                         .y(edt_scan_out_buf_out[4]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_5_buf (.a(edt_scan_out[5]),
                                                                         .y(edt_scan_out_buf_out[5]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_6_buf (.a(edt_scan_out[6]),
                                                                         .y(edt_scan_out_buf_out[6]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_7_buf (.a(edt_scan_out[7]),
                                                                         .y(edt_scan_out_buf_out[7]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_8_buf (.a(edt_scan_out[8]),
                                                                         .y(edt_scan_out_buf_out[8]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_9_buf (.a(edt_scan_out[9]),
                                                                         .y(edt_scan_out_buf_out[9]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_10_buf (.a(edt_scan_out[10]),
                                                                          .y(edt_scan_out_buf_out[10]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_11_buf (.a(edt_scan_out[11]),
                                                                          .y(edt_scan_out_buf_out[11]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_12_buf (.a(edt_scan_out[12]),
                                                                          .y(edt_scan_out_buf_out[12]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_13_buf (.a(edt_scan_out[13]),
                                                                          .y(edt_scan_out_buf_out[13]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_14_buf (.a(edt_scan_out[14]),
                                                                          .y(edt_scan_out_buf_out[14]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_15_buf (.a(edt_scan_out[15]),
                                                                          .y(edt_scan_out_buf_out[15]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_16_buf (.a(edt_scan_out[16]),
                                                                          .y(edt_scan_out_buf_out[16]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_17_buf (.a(edt_scan_out[17]),
                                                                          .y(edt_scan_out_buf_out[17]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_18_buf (.a(edt_scan_out[18]),
                                                                          .y(edt_scan_out_buf_out[18]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_19_buf (.a(edt_scan_out[19]),
                                                                          .y(edt_scan_out_buf_out[19]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_20_buf (.a(edt_scan_out[20]),
                                                                          .y(edt_scan_out_buf_out[20]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_21_buf (.a(edt_scan_out[21]),
                                                                          .y(edt_scan_out_buf_out[21]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_22_buf (.a(edt_scan_out[22]),
                                                                          .y(edt_scan_out_buf_out[22]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_23_buf (.a(edt_scan_out[23]),
                                                                          .y(edt_scan_out_buf_out[23]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_24_buf (.a(edt_scan_out[24]),
                                                                          .y(edt_scan_out_buf_out[24]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_25_buf (.a(edt_scan_out[25]),
                                                                          .y(edt_scan_out_buf_out[25]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_26_buf (.a(edt_scan_out[26]),
                                                                          .y(edt_scan_out_buf_out[26]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_27_buf (.a(edt_scan_out[27]),
                                                                          .y(edt_scan_out_buf_out[27]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_28_buf (.a(edt_scan_out[28]),
                                                                          .y(edt_scan_out_buf_out[28]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_29_buf (.a(edt_scan_out[29]),
                                                                          .y(edt_scan_out_buf_out[29]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_30_buf (.a(edt_scan_out[30]),
                                                                          .y(edt_scan_out_buf_out[30]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_31_buf (.a(edt_scan_out[31]),
                                                                          .y(edt_scan_out_buf_out[31]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_32_buf (.a(edt_scan_out[32]),
                                                                          .y(edt_scan_out_buf_out[32]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_33_buf (.a(edt_scan_out[33]),
                                                                          .y(edt_scan_out_buf_out[33]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_34_buf (.a(edt_scan_out[34]),
                                                                          .y(edt_scan_out_buf_out[34]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_35_buf (.a(edt_scan_out[35]),
                                                                          .y(edt_scan_out_buf_out[35]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_36_buf (.a(edt_scan_out[36]),
                                                                          .y(edt_scan_out_buf_out[36]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_37_buf (.a(edt_scan_out[37]),
                                                                          .y(edt_scan_out_buf_out[37]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_38_buf (.a(edt_scan_out[38]),
                                                                          .y(edt_scan_out_buf_out[38]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_39_buf (.a(edt_scan_out[39]),
                                                                          .y(edt_scan_out_buf_out[39]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_40_buf (.a(edt_scan_out[40]),
                                                                          .y(edt_scan_out_buf_out[40]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_41_buf (.a(edt_scan_out[41]),
                                                                          .y(edt_scan_out_buf_out[41]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_42_buf (.a(edt_scan_out[42]),
                                                                          .y(edt_scan_out_buf_out[42]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_43_buf (.a(edt_scan_out[43]),
                                                                          .y(edt_scan_out_buf_out[43]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_44_buf (.a(edt_scan_out[44]),
                                                                          .y(edt_scan_out_buf_out[44]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_45_buf (.a(edt_scan_out[45]),
                                                                          .y(edt_scan_out_buf_out[45]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_46_buf (.a(edt_scan_out[46]),
                                                                          .y(edt_scan_out_buf_out[46]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_47_buf (.a(edt_scan_out[47]),
                                                                          .y(edt_scan_out_buf_out[47]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_48_buf (.a(edt_scan_out[48]),
                                                                          .y(edt_scan_out_buf_out[48]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_49_buf (.a(edt_scan_out[49]),
                                                                          .y(edt_scan_out_buf_out[49]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_50_buf (.a(edt_scan_out[50]),
                                                                          .y(edt_scan_out_buf_out[50]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_51_buf (.a(edt_scan_out[51]),
                                                                          .y(edt_scan_out_buf_out[51]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_52_buf (.a(edt_scan_out[52]),
                                                                          .y(edt_scan_out_buf_out[52]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_53_buf (.a(edt_scan_out[53]),
                                                                          .y(edt_scan_out_buf_out[53]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_54_buf (.a(edt_scan_out[54]),
                                                                          .y(edt_scan_out_buf_out[54]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_55_buf (.a(edt_scan_out[55]),
                                                                          .y(edt_scan_out_buf_out[55]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_56_buf (.a(edt_scan_out[56]),
                                                                          .y(edt_scan_out_buf_out[56]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_57_buf (.a(edt_scan_out[57]),
                                                                          .y(edt_scan_out_buf_out[57]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_58_buf (.a(edt_scan_out[58]),
                                                                          .y(edt_scan_out_buf_out[58]));
   picorv32_rtl1_tessent_buf tessent_persistent_cell_edt_scan_out_59_buf (.a(edt_scan_out[59]),
                                                                          .y(edt_scan_out_buf_out[59]));

   picorv32_rtl1_tessent_edt_c1_decompressor picorv32_rtl1_tessent_edt_c1_decompressor_i (
      .edt_clock(edt_clock_buf_out),
      .edt_update(edt_update_buf_out),
      .edt_channels_in(edt_channels_out_from_controller),
      .edt_scan_in(edt_decompressor_out));

   picorv32_rtl1_tessent_edt_c1_compactor picorv32_rtl1_tessent_edt_c1_compactor_i (
      .edt_clock(edt_clock_buf_out),
      .edt_configuration(edt_configuration_buf_out),
      .edt_scan_out(edt_scan_out_buf_out),
      .masks_for_compactor_0(masks_for_compactor_0),
      .masks_for_compactor_1(masks_for_compactor_1),
      .edt_channels_out(edt_bypass_out));

   picorv32_rtl1_tessent_edt_c1_controller picorv32_rtl1_tessent_edt_c1_controller_i (
      .edt_clock(edt_clock_buf_out),
      .edt_update(edt_update_buf_out),
      .edt_configuration(edt_configuration_buf_out),
      .edt_low_power_shift_en(edt_low_power_shift_en_buf_out),
      .edt_channels_in(edt_channels_in_buf_out),
      .edt_decompressor_out(edt_decompressor_out),
      .edt_channels_out_from_controller(edt_channels_out_from_controller),
      .masks_for_compactor_0(masks_for_compactor_0),
      .masks_for_compactor_1(masks_for_compactor_1),
      .edt_scan_in(edt_bypass_in));

   picorv32_rtl1_tessent_edt_c1_bypass_logic picorv32_rtl1_tessent_edt_c1_bypass_logic_i (
      .edt_bypass(edt_bypass_buf_out),
      .edt_channels_in(edt_channels_in_buf_out),
      .edt_channels_out(edt_channels_out_buf_in),
      .edt_scan_in(edt_scan_in_buf_in),
      .edt_scan_out(edt_scan_out_buf_out),
      .edt_bypass_in(edt_bypass_in),
      .edt_bypass_out(edt_bypass_out));
endmodule


