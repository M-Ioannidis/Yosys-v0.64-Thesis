yosys -import 

set temp 1
set index "01"
set top "gray_to_bin"
set folder "logic_gates"

set i 2
while {$i < 56} {
	if {$i < 10} {
		lappend index "0$i"
	} else {
		lappend index $i	
	}	
	incr i 1
}

set show "show -format png "

#AND
append show "-color red t:\$and -color red t:\$_AND_ "
append show "-color red3 t:\$logic_and "
append show "-color brown t:\$reduce_and "

#OR
append show "-color turquoise2 t:\$or -color turquoise2 t:\$_OR_ "
append show "-color cyan4 t:\$logic_or "
append show "-color blue t:\$reduce_or "
append show "-color dodgerblue t:\$reduce_bool "

#NOT
append show "-color purple t:\$not -color purple t:\$_NOT_ "
append show "-color purple3 t:\$logic_not "
append show "-color blue t:\$reduce_or "

#XOR
append show "-color green2 t:\$xor -color green2 t:\$_XOR_ "
append show "-color green3 t:\$reduce_xor "
append show "-color olivedrab3 t:\$xnor -color olivedrab3 t:\$_XNOR_ "
append show "-color olivedrab4 t:\$reduce_xnor "

#EQ
append show "-color yellow3 t:\$eq "
append show "-color orange2 t:\$ne "

#MUX
append show "-color hotpink t:\$mux -color hotpink t:\$_MUX_ "
append show "-color hotpink3 t:\$pmux "

#begin
read_verilog -D ICE40_HX -lib -specify +/ice40/cells_sim.v;
hierarchy -check -top $top;

if {$folder == "top_down"} {
	set module_list [exec python3 [file normalize ~/codes/cake.py] [tee -q -s result.string ls] "2"]
	foreach i $module_list {
		lappend index [expr [lindex $index end] + 1]
		incr temp 1
	}
}
procs -count [lindex $index $temp] -show $show; 
set file1 [exec stat -c %s [lindex [lsort [glob *.il]] end]]
incr temp 1

#flatten  
flatten;
write_rtlil "[lindex $index $temp]_flatten.il"
set file2 [exec stat -c %s "[lindex $index $temp]_flatten.il"] 
if {$file1 != $file2} {
	{*}$show -prefix "[lindex $index $temp]_flatten"
	set file1 $file2
}
incr temp 1


tribuf -logic;
write_rtlil "[lindex $index $temp]_tribuf.il"
set file2 [exec stat -c %s "[lindex $index $temp]_tribuf.il"] 
if {$file1 != $file2} {
	{*}$show -prefix "[lindex $index $temp]_tribuf"
	set file1 $file2
}
incr temp 1

deminout;

#coarse
opt_expr
write_rtlil "[lindex $index $temp]_opt_expr_coarse.il"
set file2 [exec stat -c %s "[lindex $index $temp]_opt_expr_coarse.il"] 
if {$file1 != $file2} {
	{*}$show -prefix "[lindex $index $temp]_opt_expr_coarse"
	set file1 $file2
}
incr temp 1

opt_clean
write_rtlil "[lindex $index $temp]_opt_clean_coarse.il"
set file2 [exec stat -c %s "[lindex $index $temp]_opt_clean_coarse.il"] 
if {$file1 != $file2} {
	{*}$show -prefix "[lindex $index $temp]_opt_clean_coarse"
	set file1 $file2
}
incr temp 1

check
incr temp 1

opt -nodffe -nosdff -count [lindex $index $temp] -name "coarse" -show $show -size [exec stat -c %s [lindex [lsort [glob *.il]] end]]
incr temp 1

fsm

opt -count [lindex $index $temp] -name "coarse2" -show $show -size [exec stat -c %s [lindex [lsort [glob *.il]] end]]
incr temp 1

wreduce
write_rtlil "[lindex $index $temp]_wreduce.il"
set file2 [exec stat -c %s "[lindex $index $temp]_wreduce.il"] 
if {$file1 != $file2} {
	{*}$show -prefix "[lindex $index $temp]_wreduce"
	set file1 $file2
}
incr temp 1

peepopt

opt_clean
write_rtlil "[lindex $index $temp]_opt_clean_coarse2.il"
set file2 [exec stat -c %s "[lindex $index $temp]_opt_clean_coarse2.il"] 
if {$file1 != $file2} {
	{*}$show -prefix "[lindex $index $temp]_opt_clean_coarse2"
	set file1 $file2
}
incr temp 1

share

techmap -map +/cmp2lut.v -D LUT_WIDTH=4
write_rtlil "[lindex $index $temp]_techmap_cmp2lut.il"
set file2 [exec stat -c %s "[lindex $index $temp]_techmap_cmp2lut.il"] 
if {$file1 != $file2} {
	{*}$show -prefix "[lindex $index $temp]_techmap_cmp2lut"
	set file1 $file2
}
incr temp 1

opt_expr
write_rtlil "[lindex $index $temp]_opt_expr_coarse2.il"
set file2 [exec stat -c %s "[lindex $index $temp]_opt_expr_coarse2.il"] 
if {$file1 != $file2} {
	{*}$show -prefix "[lindex $index $temp]_opt_expr_coarse2"
	set file1 $file2
}
incr temp 1

opt_clean
write_rtlil "[lindex $index $temp]_opt_clean_coarse3.il"
set file2 [exec stat -c %s "[lindex $index $temp]_opt_clean_coarse3.il"] 
if {$file1 != $file2} {
	{*}$show -prefix "[lindex $index $temp]_opt_clean_coarse3"
	set file1 $file2
}
incr temp 1

memory_dff 

wreduce t:\$mul 

alumacc
write_rtlil "[lindex $index $temp]_alumacc.il"
set file2 [exec stat -c %s "[lindex $index $temp]_alumacc.il"] 
if {$file1 != $file2} {
	{*}$show -prefix "[lindex $index $temp]_alumacc"
	set file1 $file2
}
incr temp 1

opt -count [lindex $index $temp] -name "coarse3" -show $show -size [exec stat -c %s [lindex [lsort [glob *.il]] end]]
incr temp 1

\memory -nomap
write_rtlil "[lindex $index $temp]_memory_nomap.il"
set file2 [exec stat -c %s "[lindex $index $temp]_memory_nomap.il"] 
if {$file1 != $file2} {
	{*}$show -prefix "[lindex $index $temp]_memory_nomap"
	set file1 $file2
}
incr temp 1

opt_clean
write_rtlil "[lindex $index $temp]_opt_clean_coarse4.il"
set file2 [exec stat -c %s "[lindex $index $temp]_opt_clean_coarse4.il"] 
if {$file1 != $file2} {
	{*}$show -prefix "[lindex $index $temp]_opt_clean_coarse4"
	set file1 $file2
}
incr temp 1

# map_ram:
memory_libmap -lib +/ice40/brams.txt -lib +/ice40/spram.txt -no-auto-huge

techmap -map +/ice40/brams_map.v -map +/ice40/spram_map.v

ice40_braminit

# map_ffram:
opt -fast -mux_undef -undriven -fine -count [lindex $index $temp] -name "ffram" -show $show -size [exec stat -c %s [lindex [lsort [glob *.il]] end]]
incr temp 1

memory_map
write_rtlil "[lindex $index $temp]_memory_map.il"
set file2 [exec stat -c %s "[lindex $index $temp]_memory_map.il"] 
if {$file1 != $file2} {
	{*}$show -prefix "[lindex $index $temp]_memory_map"
	set file1 $file2
}
incr temp 1

opt -undriven -fine -count [lindex $index $temp] -name "ffram2" -show $show -size [exec stat -c %s [lindex [lsort [glob *.il]] end]]
incr temp 1

#map_gates
ice40_wrapcarry
#set size2 [llength [glob *.il]]
#puts $size2 
techmap -map +/techmap.v -map +/ice40/arith_map.v -name "techmap" -count [lindex $index $temp] -show $show
#if {$size2 != [llength [glob *.il]]} {
#	puts "glob" [llength [glob *.il]]
#	set size2 [expr [llength [glob *.il]] - $size2]
#	puts "size" $size2 
#	exec sleep 2
#	exec sleep 2
#	for {set i 0} {$i < $size2} {incr i} {
#		incr temp 1
#	}
#}
#exec sleep 2
write_rtlil "[lindex $index $temp]_techmap_arith_map.il"
{*}$show -prefix "[lindex $index $temp]_techmap_arith_map"
set file1 $file2
incr temp 1

opt -fast -count [lindex $index $temp] -name "map_gates" -show $show -size [exec stat -c %s [lindex [lsort [glob *.il]] end]]
incr temp 1

ice40_opt -count [lindex $index $temp] -show $show -name "map_gates" -size [exec stat -c %s [lindex [lsort [glob *.il]] end]]
incr temp 1

#map_ffs
dfflegalize -cell \$_DFF_?_ 0 -cell \$_DFFE_?P_ 0 -cell \$_DFF_?P?_ 0 -cell \$_DFFE_?P?P_ 0 -cell \$_SDFF_?P?_ 0 -cell \$_SDFFCE_?P?P_ 0 -cell \$_DLATCH_?_ x -mince -1

techmap -map +/ice40/ff_map.v

opt_expr -mux_undef
write_rtlil "[lindex $index $temp]_opt_expr_map_ffs.il"
set file2 [exec stat -c %s "[lindex $index $temp]_opt_expr_map_ffs.il"] 
if {$file1 != $file2} {
	{*}$show -prefix "[lindex $index $temp]_opt_expr_map_ffs"
	set file1 $file2
}
incr temp 1

simplemap

ice40_opt -full -count [lindex $index $temp] -show $show -name "map_ffs" -size [exec stat -c %s [lindex [lsort [glob *.il]] end]]
incr temp 1

#map_luts

techmap -map +/ice40/latches_map.v

read_verilog -D ICE40_HX -icells -lib -specify +/ice40/abc9_model.v

abc9 -W 250 -count [lindex $index $temp] -show $show -size [exec stat -c %s [lindex [lsort [glob *.il]] end]]
incr temp 1

ice40_wrapcarry -unwrap

techmap -map +/ice40/ff_map.v

clean
write_rtlil "[lindex $index $temp]_clean.il"
set file2 [exec stat -c %s "[lindex $index $temp]_clean.il"] 
{*}$show -prefix "[lindex $index $temp]_clean"
set file1 $file2
incr temp 1

opt_lut -tech ice40
write_rtlil "[lindex $index $temp]_opt_lut.il"
set file2 [exec stat -c %s "[lindex $index $temp]_opt_lut.il"] 
{*}$show -prefix "[lindex $index $temp]_opt_lut"
set file1 $file2
incr temp 1

#map_cells
techmap -map +/ice40/cells_map.v
write_rtlil "[lindex $index $temp]_techmap_cells_map.il"
set file2 [exec stat -c %s "[lindex $index $temp]_techmap_cells_map.il"] 
{*}$show -prefix "[lindex $index $temp]_techmap_cells_map"
set file1 $file2
incr temp 1

clean
write_rtlil "[lindex $index $temp]_clean.il"
set file2 [exec stat -c %s "[lindex $index $temp]_clean.il"] 
{*}$show -prefix "[lindex $index $temp]_clean"
set file1 $file2
incr temp 1

#check:
autoname
write_rtlil "[lindex $index $temp]_autoname.il"
set file2 [exec stat -c %s "[lindex $index $temp]_autoname.il"] 
{*}$show -prefix "[lindex $index $temp]_autoname"
set file1 $file2
incr temp 1

hierarchy -check
write_rtlil "[lindex $index $temp]_hierarchy_final.il"
set file2 [exec stat -c %s "[lindex $index $temp]_hierarchy_final.il"] 
{*}$show -prefix "[lindex $index $temp]_hierarchy_final"
set file1 $file2
incr temp 1

stat
incr temp 1

check -noinit

blackbox =A:whitebox
write_rtlil "[lindex $index $temp]_blackbox.il"

write_verilog $top.v
