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

     
module picorv32_rtl1_tessent_clk_buf (
  input wire a,
  output wire y
);
 
buf gate (y, a);
    
endmodule
  
