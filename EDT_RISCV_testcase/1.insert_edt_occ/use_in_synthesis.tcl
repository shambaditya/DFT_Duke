set_app_var hdlin_enable_upf_compatible_naming true
set_app_var hdlin_mux_size_only 2

# From file ../tsdb_outdir/dft_inserted_designs/picorv32_rtl1.dft_inserted_design/picorv32.design_source_dictionary

analyze -format verilog -library work { \
      "../tsdb_outdir/dft_inserted_designs/picorv32_rtl1.dft_inserted_design/modified_rtl_files/picorv32.v" \
   } 

analyze -format verilog -library work { \
      "../tsdb_outdir/instruments/picorv32_rtl1_cells.instrument/picorv32_rtl1_tessent_mux2.v" \
      "../tsdb_outdir/instruments/picorv32_rtl1_cells.instrument/picorv32_rtl1_tessent_clk_mux2.v" \
      "../tsdb_outdir/instruments/picorv32_rtl1_cells.instrument/picorv32_rtl1_tessent_clk_gate_and.v" \
      "../tsdb_outdir/instruments/picorv32_rtl1_cells.instrument/picorv32_rtl1_tessent_posedge_synchronizer_reset.v" \
   } 

analyze -format verilog -library work { \
      "../tsdb_outdir/instruments/picorv32_rtl1_cells.instrument/picorv32_rtl1_tessent_buf.v" \
      "../tsdb_outdir/instruments/picorv32_rtl1_cells.instrument/picorv32_rtl1_tessent_clk_buf.v" \
      "../tsdb_outdir/instruments/picorv32_rtl1_cells.instrument/picorv32_rtl1_tessent_inv.v" \
   } 

analyze -format verilog -library work { \
      "../tsdb_outdir/instruments/picorv32_rtl1_occ.instrument/picorv32_rtl1_tessent_occ.v" \
   } 

analyze -format verilog -library work { \
      "../tsdb_outdir/instruments/picorv32_rtl1_edt.instrument/picorv32_rtl1_tessent_edt_c1.v" \
   } 

 
