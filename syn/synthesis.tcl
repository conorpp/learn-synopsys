#**************************************************
#Define top design

create_mw_lib -technology $cell_lib/sc-x/astro/tf/ibm13_8lm_2thick_3rf.tf -mw_reference_library "$cell_lib/sc-x/astro/ibm13rfrvt_fram" -open $mw_design_library/

analyze -format verilog $src_files

elaborate $design_name -lib work
list_designs
current_design
link

uniquify

create_clock -period 13 -waveform {0 6} {clk}
#set_clock_latency 0.03 clock

#**************************************************
#Design environment

check_design

compile -exact_map


write -hierarchy -format verilog -output $netlist/${design_name}_mapped.v
write -format ddc -hierarchy -output $netlist/${design_name}_mapped.ddc 
#write_sdf -version 2.1 $work_dir/sim/sdf_syn_design.sdf

# Generate report / netlist / milkyway
report_timing > $reports/mapped.timing.rpt
report_area > $reports/mapped.area.rpt
report_qor > $reports/mapped.qor.rpt
report_power > $reports/mapped.power.rpt
write_milkyway -overwrite -output ${design_name}_DCT

# exit 

# Delete log files
# exec rm -rf $work_dir/clog* $work_dir/*.svf $work_dir/*.log

#exit
