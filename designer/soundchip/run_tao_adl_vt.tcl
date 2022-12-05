set_device -family {SmartFusion2} -die {M2S010} -speed {STD}
read_adl {C:\Users\Constantin\Documents\VHDLSoundchip\designer\soundchip\soundchip.adl}
read_afl {C:\Users\Constantin\Documents\VHDLSoundchip\designer\soundchip\soundchip.afl}
map_netlist
read_sdc {C:\Users\Constantin\Documents\VHDLSoundchip\constraint\soundchip_derived_constraints.sdc}
check_constraints {C:\Users\Constantin\Documents\VHDLSoundchip\constraint\timing_sdc_errors.log}
write_sdc -mode smarttime {C:\Users\Constantin\Documents\VHDLSoundchip\designer\soundchip\timing_analysis.sdc}
