set_device -family {SmartFusion2} -die {M2S010} -speed {STD}
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
read_sdc -component {C:\Users\Constantin\Documents\VHDLSoundchip\component\work\FCCC_C0\FCCC_C0_0\FCCC_C0_FCCC_C0_0_FCCC.sdc}
read_sdc -component {C:\Users\Constantin\Documents\VHDLSoundchip\component\work\OSC_C0\OSC_C0_0\OSC_C0_OSC_C0_0_OSC.sdc}
derive_constraints
write_sdc {C:\Users\Constantin\Documents\VHDLSoundchip\constraint\soundchip_derived_constraints.sdc}
write_ndc {C:\Users\Constantin\Documents\VHDLSoundchip\constraint\soundchip_derived_constraints.ndc}
write_pdc {C:\Users\Constantin\Documents\VHDLSoundchip\constraint\fp\soundchip_derived_constraints.pdc}
