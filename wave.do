onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mul32booth_vhd_tst/md
add wave -noupdate /mul32booth_vhd_tst/mr
add wave -noupdate /mul32booth_vhd_tst/out1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {99405 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 383
configure wave -valuecolwidth 158
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {99193 ps} {99810 ps}
