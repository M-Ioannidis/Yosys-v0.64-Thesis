yosys -import 

set temp 1
set index "01"
set top "susskind"
set folder "top_down"

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
append show "-color green2 t:\$XOR -color green2 t:\$_XOR_ "
append show "-color green3 t:\$reduce_xor "
append show "-color olivedrab3 t:\$xnor -color olivedrab3 t:\$_XNOR_ "
append show "-color olivedrab4 t:\$reduce_xnor "

#EQ
append show "-color gold t:\$EQ "
append show "-color orange2 t:\$NE "

#MUX
append show "-color hotpink t:\$mux -color hotpink t:\$_MUX_ "
append show "-color hotpink3 t:\$pmux "

exec ~/yosys/./yosys -p "synth_ice40 -run :map_luts -top $top -noabc9 -noabc; write_rtlil temp.il; show -prefix 01_temp -format png" ~/files/$folder/$top.v
read_rtlil ~/temp.il
set file1 [exec stat -c %s "temp.il"] 
exec rm temp.il

#map_luts
techmap -map +/ice40/latches_map.v

simplemap
write_rtlil "[lindex $index $temp]_simplemap.il"
set file2 [exec stat -c %s "[lindex $index $temp]_simplemap.il"] 
if {$file1 != $file2} {
	{*}$show -prefix "[lindex $index $temp]_simplemap"
	set file1 $file2
}
incr temp 1

techmap -map +/gate2lut.v -D LUT_WIDTH=4
write_rtlil "[lindex $index $temp]_techmap_gate2lut.il"
set file2 [exec stat -c %s "[lindex $index $temp]_techmap_gate2lut.il"] 
if {$file1 != $file2} {
	{*}$show -prefix "[lindex $index $temp]_techmap_gate2lut"
	set file1 $file2
}
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

stat

check -noinit

blackbox =A:whitebox
write_rtlil "[lindex $index $temp]_blackbox.il"

write_verilog $top.v
