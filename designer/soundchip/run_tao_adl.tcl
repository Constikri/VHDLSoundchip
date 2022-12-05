set_device -family {SmartFusion2} -die {M2S010} -speed {STD}
read_adl {C:\Users\Constantin\Documents\VHDLSoundchip\designer\soundchip\soundchip.adl}
read_afl {C:\Users\Constantin\Documents\VHDLSoundchip\designer\soundchip\soundchip.afl}
map_netlist
read_sdc {C:\Users\Constantin\Documents\VHDLSoundchip\constraint\user.sdc}
check_constraints {C:\Users\Constantin\Documents\VHDLSoundchip\constraint\placer_sdc_errors.log}
write_sdc -mode layout {C:\Users\Constantin\Documents\VHDLSoundchip\designer\soundchip\place_route.sdc}
