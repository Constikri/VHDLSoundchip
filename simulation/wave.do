onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /soundchip_tb/DATACLK
add wave -noupdate /soundchip_tb/NSYSRESET
add wave -noupdate /soundchip_tb/mosi_sig
add wave -noupdate /soundchip_tb/miso_sig
add wave -noupdate /soundchip_tb/sck_sig
add wave -noupdate /soundchip_tb/cs_sig
add wave -noupdate /soundchip_tb/spi_data_in
add wave -noupdate /soundchip_tb/spi_data_out
add wave -noupdate /soundchip_tb/dac_out_left_sig
add wave -noupdate /soundchip_tb/dac_out_right_sig
add wave -noupdate /soundchip_tb/data_out
add wave -noupdate /soundchip_tb/ascend
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {157420471327000 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 219
configure wave -valuecolwidth 100
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
WaveRestoreZoom {48004122262031 fs} {163303082092516 fs}
