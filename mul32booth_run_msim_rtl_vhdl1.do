transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Huberto/Desktop/novo/mul32booth/array32.vhd}
vcom -93 -work work {C:/Users/Huberto/Desktop/novo/mul32booth/Soma1.vhd}
vcom -93 -work work {C:/Users/Huberto/Desktop/novo/mul32booth/RCA.vhd}
vcom -93 -work work {C:/Users/Huberto/Desktop/novo/mul32booth/boothDecoder.vhd}
vcom -93 -work work {C:/Users/Huberto/Desktop/novo/mul32booth/mul32booth.vhd}

vcom -93 -work work {C:/Users/Huberto/Desktop/novo/mul32booth/simulation/modelsim/mul32booth.vht}

vsim +altera -do mul32booth_run_msim_rtl_vhdl.do -l msim_transcript -gui work.mul32booth_vhd_tst 

do wave.do

run 100ns