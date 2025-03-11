transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/bloodxe/Desktop/arodriguez_isomarribas_osoto_digital_design_lab_2025/Problem2/Sumador4bits.vhd}
vcom -93 -work work {C:/Users/bloodxe/Desktop/arodriguez_isomarribas_osoto_digital_design_lab_2025/Problem2/Sumador1bit.vhd}

