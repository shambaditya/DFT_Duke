define_design_lib work -path work

## Reading in the file written out during Step 1 using write_design_import_script
source ../1.insert_edt_occ/use_in_synthesis.tcl

elaborate gps_baseband

link
check_design

## Synthesize
compile

## Write the synthesized netlist out
write -f verilog -hierarchy -output gps_baseband_synthesized.vg

exit

