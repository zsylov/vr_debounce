transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/CSDN/vr_debounce/vr_debounce {F:/CSDN/vr_debounce/vr_debounce/vir_key_module.v}
vlog -vlog01compat -work work +incdir+F:/CSDN/vr_debounce/vr_debounce {F:/CSDN/vr_debounce/vr_debounce/detect.v}
vlog -vlog01compat -work work +incdir+F:/CSDN/vr_debounce/vr_debounce {F:/CSDN/vr_debounce/vr_debounce/delay.v}
vlog -vlog01compat -work work +incdir+F:/CSDN/vr_debounce/vr_debounce {F:/CSDN/vr_debounce/vr_debounce/debounce.v}
vlog -vlog01compat -work work +incdir+F:/CSDN/vr_debounce/vr_debounce {F:/CSDN/vr_debounce/vr_debounce/vr_debounce.v}

vlog -vlog01compat -work work +incdir+F:/CSDN/vr_debounce/vr_debounce/simulation/modelsim {F:/CSDN/vr_debounce/vr_debounce/simulation/modelsim/vr_debounce.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver -L rtl_work -L work -voptargs="+acc"  vr_debounce_vlg_tst

add wave *
view structure
view signals
run 1000 us
