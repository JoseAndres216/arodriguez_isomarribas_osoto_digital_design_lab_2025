transcript on
if ![file isdirectory lab3_iputf_libs] {
	file mkdir lab3_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 


vlog "C:/Users/bloodxe/Desktop/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab3/pll_sim/pll.vo"

vlog -sv -work work +incdir+C:/Users/bloodxe/Desktop/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab3 {C:/Users/bloodxe/Desktop/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab3/board_controller.sv}
vlog -sv -work work +incdir+C:/Users/bloodxe/Desktop/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab3 {C:/Users/bloodxe/Desktop/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab3/victory_checker.sv}
vlog -sv -work work +incdir+C:/Users/bloodxe/Desktop/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab3 {C:/Users/bloodxe/Desktop/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab3/game_core.sv}

vlog -sv -work work +incdir+C:/Users/bloodxe/Desktop/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab3 {C:/Users/bloodxe/Desktop/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab3/tb_game_core.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_game_core

add wave *
view structure
view signals
run -all
