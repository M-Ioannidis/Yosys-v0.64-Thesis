#!/usr/bin/env yosys -f

yosys -import

set top "gray_code"
set folder "logic_gates"
set no "log_${top}_${folder}.txt"
set com_show "show -stretch "

#NOT
append com_show " -color darkviolet t:\$not -color darkviolet t:\$_NOT_" 
append com_show " -color darkviolet t:\$logic_not"
#NOT

#AND
append com_show " -color red t:\$and -color red t:\$_AND_"
append com_show " -color brown2 t:\$logic_and"
append com_show " -color darkred t:\$reduce_and"
#AND

#OR
append com_show " -color cyan3 t:\$or -color cyan3 t:\$_OR_" 
append com_show " -color dodgerblue4 t:\$logic_or"
append com_show " -color blue t:\$reduce_or"
#OR

#XOR
append com_show " -color green3 t:\$xor -color green3 t:\$_XOR_"
append com_show " -color chartreuse4  t:\$reduce_xor"
append com_show " -color olivedrab t:\$reduce_xnor"
append com_show " -color seagreen t:\$xnor -color seagreen t:\$_XNOR_" 

#XOR

#mux
append com_show " -color hotpink t:\$mux -color hotpink t:\$_MUX_"
append com_show " -color hotpink3 t:\$pmux -color hotpink3 t:\$_PMUX_"
append com_show " -color darkviolet t:\$bmux -color darkviolet t:\$_BMUX_"
#mux

#eq
append com_show " -color orange3 t:\$eq"
append com_show " -color orangered t:\$ne -format png"
#eq

set vars_list {}
set uniq_list {}
set module_list {}
set temp 1

set output [read [open $no]]

set lines [split $output "\n"]

foreach line $lines {
    if {[regexp {^[0-9]+\.([0-9]+)} $line match number]} {
    	if {[regexp {^[0-9]$} $number]} {
    		lappend vars_list "0$number"
    	} else {
    	    	lappend vars_list $number
    	}
    } 
}

foreach x $vars_list {
    if {![info exists seen($x)]} {
        set seen($x) 1
        lappend uniq_list $x
    }
}

#begin
read_verilog -D ICE40_HX -lib -specify +/ice40/cells_sim.v;

hierarchy -check -top $top;
{*}$com_show -prefix 01_hierarchy $top;
write_rtlil 01_hierarchy_$top.il;
set file1 [exec stat -c%s [file normalize ~/Music/01_hierarchy_$top.il]]
puts [lindex [lsort [glob *.il]] end]
if { $folder eq "top_down" } {
        set out [exec python3 [file normalize ~/Music/codes/cake.py] [file normalize ~/Music/files/top_down/$top.v] "2"]
        set module_list [split $out " "]
        set module_list [lreplace $module_list end end]
        puts $module_list
        foreach x $module_list {
        	lappend uniq_list [expr {[lindex $uniq_list end] + 1}]
        	{*}$com_show -prefix [lindex $uniq_list $temp]_$x $x;
        	write_rtlil [lindex $uniq_list $temp]_$x.il;
        	procs -show $com_show -name $x -count [lindex $uniq_list $temp]
        	incr temp 1; 

        }
} 
procs -name $top -show $com_show -count [lindex $uniq_list $temp];
incr temp 1; 

#begin

#flatten
flatten;
write_rtlil [lindex $uniq_list $temp]_flatten.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_flatten.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_flatten;
	set file1 $file2
}
incr temp 1; 

tribuf -logic;
write_rtlil [lindex $uniq_list $temp]_tribuf.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_tribuf.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_tribuf;
	set file1 $file2
}
incr temp 1; 

deminout;
write_rtlil [lindex $uniq_list $temp]_deminout.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_deminout.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_deminout;
	set file1 $file2
}
incr temp 1;
#flatten

#coarse
opt_expr;
write_rtlil [lindex $uniq_list $temp]_opt_expr_coarse.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_opt_expr_coarse.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_opt_expr_coarse.il;
	set file1 $file2
}
incr temp 1;  

opt_clean;
write_rtlil [lindex $uniq_list $temp]_opt_clean_coarse.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_opt_clean_coarse.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_opt_clean_coarse;
	set file1 $file2
}
incr temp 1; 


check;
write_rtlil [lindex $uniq_list $temp]_check.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_check.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_check;
	set file1 $file2
}
incr temp 1; 
 
opt -nodffe -nosdff -show $com_show -count [lindex $uniq_list $temp] -name coarse -size $file1;
set file2 [exec stat -c%s [lindex [lsort [glob *.il]] end]]
if { $file1 ne $file2 } {
	set file1 $file2
}
incr temp 1; 

fsm;

opt -show $com_show -count [lindex $uniq_list $temp] -name coarse2 -size $file1;
set file2 [exec stat -c%s [lindex [lsort [glob *.il]] end]]
if { $file1 ne $file2 } {
	set file1 $file2
}
incr temp 1; 

wreduce;
write_rtlil [lindex $uniq_list $temp]_wreduce.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_wreduce.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_wreduce;
	set file1 $file2
}
incr temp 1; 
 
peepopt;
write_rtlil [lindex $uniq_list $temp]_peepopt.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_peepopt.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_peepopt;
	set file1 $file2
}
incr temp 1; 
 
opt_clean;
write_rtlil [lindex $uniq_list $temp]_opt_clean_coarse2.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_opt_clean_coarse2.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_opt_clean_coarse2;
	set file1 $file2
}
incr temp 1; 
 
share;
write_rtlil [lindex $uniq_list $temp]_share.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_share.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_share;
	set file1 $file2
}
incr temp 1; 
 
techmap -map +/cmp2lut.v -D LUT_WIDTH=4;
write_rtlil [lindex $uniq_list $temp]_techmap_cmp2lut.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_techmap_cmp2lut.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_techmap_cmp2lut;
	set file1 $file2
}
incr temp 1; 

opt_expr;
write_rtlil [lindex $uniq_list $temp]_opt_expr_coarse2.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_opt_expr_coarse2.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_opt_expr_coarse2;
	set file1 $file2
}
incr temp 1; 
 
opt_clean;
write_rtlil [lindex $uniq_list $temp]_opt_clean_coarse3.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_opt_clean_coarse3.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_opt_clean_coarse3;
	set file1 $file2
}
incr temp 1; 
 
memory_dff;
write_rtlil [lindex $uniq_list $temp]_memory_dff.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_memory_dff.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_memory_dff;
	set file1 $file2
}
incr temp 1;

yosys {wreduce t:$mul;}
write_rtlil [lindex $uniq_list $temp]_wreduce_mul.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_wreduce_mul.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_wreduce_mul;
	set file1 $file2
}
incr temp 1; 
 
alumacc;
write_rtlil [lindex $uniq_list $temp]_alumacc.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_alumacc.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_alumacc;
	set file1 $file2
}
incr temp 1; 
 
opt -show $com_show -count [lindex $uniq_list $temp] -name coarse3 -size $file1;
set file2 [exec stat -c%s [lindex [lsort [glob *.il]] end]]
if { $file1 ne $file2 } {
	set file1 $file2
}
incr temp 1; 

yosys {memory -nomap;}
write_rtlil [lindex $uniq_list $temp]_memory_nomap.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_memory_nomap.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_memory_nomap;
	set file1 $file2
}
incr temp 1;

opt_clean;
write_rtlil [lindex $uniq_list $temp]_opt_clean_coarse4.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_opt_clean_coarse4.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_opt_clean_coarse4;
	set file1 $file2
}
incr temp 1; 
 
#coarse

#map_ram
memory_libmap -lib +/ice40/brams.txt -lib +/ice40/spram.txt;
write_rtlil [lindex $uniq_list $temp]_memory_libmap.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_memory_libmap.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_memory_libmap;
	set file1 $file2
}
incr temp 1;

techmap -map +/ice40/brams_map.v -map +/ice40/spram_map.v;
write_rtlil [lindex $uniq_list $temp]_techmap_spram.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_techmap_spram.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_techmap_spram;
	set file1 $file2
}
incr temp 1;

ice40_braminit;
write_rtlil [lindex $uniq_list $temp]_ice40_bram.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_ice40_bram.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_ice40_bram;
	set file1 $file2
}
incr temp 1;
#map_ram

#map_ffram
opt -fast -mux_undef -undriven -fine -show $com_show -count [lindex $uniq_list $temp] -name ffram -size $file1;
set file2 [exec stat -c%s [lindex [lsort [glob *.il]] end]]
if { $file1 ne $file2 } {
	set file1 $file2
}
incr temp 1; 

memory_map;
write_rtlil [lindex $uniq_list $temp]_memory_map.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_memory_map.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_memory_map;
	set file1 $file2
}
incr temp 1;

opt -undriven -fine -show $com_show -count [lindex $uniq_list $temp] -name ffram2 -size $file1;
set file2 [exec stat -c%s [lindex [lsort [glob *.il]] end]]
if { $file1 ne $file2 } {
	set file1 $file2
}
incr temp 1; 

#map_ffram


#map_gates
ice40_wrapcarry;
write_rtlil [lindex $uniq_list $temp]_ice40_wrapcarry.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_ice40_wrapcarry.il]]
{*}$com_show -prefix [lindex $uniq_list $temp]_ice40_wrapcarry;
set file1 $file2
incr temp 1; 
 
techmap -map +/techmap.v -map +/ice40/arith_map.v -name techmap -count [lindex $uniq_list $temp] -show $com_show;
if { [lindex [lsort [glob *.il]] end] != "[lindex $uniq_list $temp-1]_ice40_wrapcarry.il"} {
	set index [lsearch [lsort [glob *.png]] [lindex $uniq_list $temp-1]_ice40_wrapcarry.png]
	set diff [expr {[llength [lsort [glob *.png]]]-$index}]
	for {set i 0} {$i < $diff} {incr i} {
		lappend uniq_list [expr {[lindex $uniq_list end] + 1}]
	}
	incr temp 2
}
write_rtlil [lindex $uniq_list $temp]_techmap_arith.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_techmap_arith.il]]
{*}$com_show -prefix [lindex $uniq_list $temp]_techmap_arith;
set file1 $file2
incr temp 1; 

opt -fast -show $com_show -count [lindex $uniq_list $temp] -name gates -size $file1;
set file2 [exec stat -c%s [lindex [lsort [glob *.il]] end]]
if { $file1 ne $file2 } {
	set file1 $file2
}
incr temp 1; 

ice40_opt -show $com_show -count [lindex $uniq_list $temp] -size $file1;
set file2 [exec stat -c%s [lindex [lsort [glob *.il]] end]]
if { $file1 ne $file2 } {
	set file1 $file2
}
incr temp 1; 

#map_gates


#map_ffs
yosys {dfflegalize -cell $_DFF_?_ 0 -cell $_DFFE_?P_ 0 -cell $_DFF_?P?_ 0 -cell $_DFFE_?P?P_ 0 -cell $_SDFF_?P?_ 0 -cell $_SDFFCE_?P?P_ 0 -cell $_DLATCH_?_ x -mince -1;}

techmap -map +/ice40/ff_map.v;

opt_expr -mux_undef;
write_rtlil [lindex $uniq_list $temp]_opt_expr_mux_undef.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_opt_expr_mux_undef.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_opt_expr_mux_undef;
	set file1 $file2
}
incr temp 1; 
 
simplemap;
write_rtlil [lindex $uniq_list $temp]_simplemap.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_simplemap.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_simplemap;
	set file1 $file2
}
incr temp 1; 

ice40_opt -full -show $com_show -count [lindex $uniq_list $temp] -size $file1;
set file2 [exec stat -c%s [lindex [lsort [glob *.il]] end]]
if { $file1 ne $file2 } {
	set file1 $file2
}
incr temp 1;

techmap -map +/ice40/latches_map.v;
#map_ffs

#map_luts
read_verilog -D ICE40_HX -icells -lib -specify +/ice40/abc9_model.v;

abc9 -show $com_show -count [lindex $uniq_list $temp] -W 250 -size $file1;
set file2 [exec stat -c%s [lindex [lsort [glob *.il]] end]]
if { $file1 ne $file2 } {
	set file1 $file2
}
incr temp 1; 

ice40_wrapcarry -unwrap;
write_rtlil [lindex $uniq_list $temp]_ice40_unwrap.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_ice40_unwrap.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_ice40_unwrap;
	set file1 $file2
}
incr temp 1; 
 
techmap -map +/ice40/ff_map.v;

clean;
write_rtlil [lindex $uniq_list $temp]_clean.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_clean.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_clean;
	set file1 $file2
}
incr temp 1; 
 
opt_lut -tech ice40;
write_rtlil [lindex $uniq_list $temp]_opt_lut.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_opt_lut.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_opt_lut;
	set file1 $file2
}
incr temp 1; 
 
 #map_luts


techmap -map +/ice40/cells_map.v;
write_rtlil [lindex $uniq_list $temp]_techmap_cells_map.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_techmap_cells_map.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_techmap_cells_map;
	set file1 $file2
}
incr temp 1; 
 
clean;
write_rtlil [lindex $uniq_list $temp]_clean.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_clean.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_clean;
	set file1 $file2
}
incr temp 1; 
 
autoname;
write_rtlil [lindex $uniq_list $temp]_autoname.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_autoname.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_autoname;
	set file1 $file2
}
incr temp 1; 
 
hierarchy -check;

write_rtlil [lindex $uniq_list $temp]_hierarchy_final.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_hierarchy_final.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_hierarchy_final;
	set file1 $file2
}
incr temp 1; 
 
stat;

check -noinit;
write_rtlil [lindex $uniq_list $temp]_check_noinit.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_check_noinit.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_check_noinit;
	set file1 $file2
}
incr temp 1; 
 
blackbox =A:whitebox;
write_rtlil [lindex $uniq_list $temp]_blackbox.il;
set file2 [exec stat -c%s [file normalize ~/Music/[lindex $uniq_list $temp]_blackbox.il]]
if { $file1 ne $file2 } {
	{*}$com_show -prefix [lindex $uniq_list $temp]_blackbox;
	set file1 $file2
}
write_verilog $top.v
