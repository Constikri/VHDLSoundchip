set_device -family {SmartFusion2} -die {M2S010} -speed {STD}
set_editor_type {SYNTHESIS}
set_proj_path {C:\Users\Constantin\Documents\VHDLSoundchip\hshl_soundchip.prjx}
read_vhdl -mode vhdl_2008 {C:\Users\Constantin\Documents\VHDLSoundchip\component\work\FCCC_C0\FCCC_C0_0\FCCC_C0_FCCC_C0_0_FCCC.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\Constantin\Documents\VHDLSoundchip\component\work\FCCC_C0\FCCC_C0.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\Constantin\Documents\VHDLSoundchip\component\work\OSC_C0\OSC_C0_0\OSC_C0_OSC_C0_0_OSC.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\Constantin\Documents\VHDLSoundchip\component\work\OSC_C0\OSC_C0.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\Constantin\Documents\VHDLSoundchip\hdl\spi_slave.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\Constantin\Documents\VHDLSoundchip\hdl\delta_adder.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\Constantin\Documents\VHDLSoundchip\hdl\sigma_adder.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\Constantin\Documents\VHDLSoundchip\hdl\dac.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\Constantin\Documents\VHDLSoundchip\hdl\data_receiver.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\Constantin\Documents\VHDLSoundchip\component\work\soundchip\soundchip.vhd}
set_top_level {soundchip}
map_netlist
read_sdc {C:\Users\Constantin\Documents\VHDLSoundchip\constraint\user.sdc}
set_output_sdc {C:\Users\Constantin\Documents\VHDLSoundchip\constraint\user.sdc}
