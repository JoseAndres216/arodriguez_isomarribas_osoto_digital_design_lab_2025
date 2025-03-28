transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2 {C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2/display_7seg.v}
vlog -vlog01compat -work work +incdir+C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2 {C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2/shift_l.v}
vlog -vlog01compat -work work +incdir+C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2/output_files {C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2/output_files/shift_r.v}
vlog -sv -work work +incdir+C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2 {C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2/alu.sv}
vlog -sv -work work +incdir+C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2 {C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2/adder.sv}
vlog -sv -work work +incdir+C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2 {C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2/sustractor.sv}
vlog -sv -work work +incdir+C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2 {C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2/multiplier.sv}
vlog -sv -work work +incdir+C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2 {C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2/mux_alu.sv}
vlog -sv -work work +incdir+C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2 {C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2/and_operation.sv}
vlog -sv -work work +incdir+C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2 {C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2/xor_operation.sv}
vlog -sv -work work +incdir+C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2 {C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2/or_operation.sv}
vlog -sv -work work +incdir+C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2 {C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2/modulo_operation.sv}
vlog -sv -work work +incdir+C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2 {C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2/div_operation.sv}

vlog -sv -work work +incdir+C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2 {C:/Users/caman/Documents/Github/arodriguez_isomarribas_osoto_digital_design_lab_2025/Lab2/alu_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  alu_tb

add wave *
view structure
view signals
run -all
