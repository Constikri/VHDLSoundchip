set_device \
    -family  SmartFusion2 \
    -die     PA4M1000_N \
    -package vf256 \
    -speed   STD \
    -tempr   {COM} \
    -voltr   {COM}
set_def {VOLTAGE} {1.2}
set_def {VCCI_1.2_VOLTR} {COM}
set_def {VCCI_1.5_VOLTR} {COM}
set_def {VCCI_1.8_VOLTR} {COM}
set_def {VCCI_2.5_VOLTR} {COM}
set_def {VCCI_3.3_VOLTR} {COM}
set_def {PLL_SUPPLY} {PLL_SUPPLY_25}
set_def USE_CONSTRAINTS_FLOW 1
set_netlist -afl {C:\Users\Constantin\Documents\VHDLSoundchip\designer\soundchip\soundchip.afl} -adl {C:\Users\Constantin\Documents\VHDLSoundchip\designer\soundchip\soundchip.adl}
set_constraints   {C:\Users\Constantin\Documents\VHDLSoundchip\designer\soundchip\soundchip.tcml}
set_placement   {C:\Users\Constantin\Documents\VHDLSoundchip\designer\soundchip\soundchip.loc}
set_routing     {C:\Users\Constantin\Documents\VHDLSoundchip\designer\soundchip\soundchip.seg}
set_sdcfilelist -sdc {C:\Users\Constantin\Documents\VHDLSoundchip\constraint\user.sdc}
