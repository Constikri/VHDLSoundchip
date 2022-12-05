create_clock -name {OSC_0} -period 20 -waveform {0 10 } [ get_pins { OSC_C0_0/OSC_C0_0/I_RCOSC_25_50MHZ/CLKOUT } ]
create_generated_clock -name {FCCC_C0_0} -add  -master_clock  OSC_0 -multiply_by 2 -source [ get_pins { FCCC_C0_0/FCCC_C0_0/CCC_INST/RCOSC_25_50MHZ } ] [ get_pins { FCCC_C0_0/FCCC_C0_0/CCC_INST/GL0 } ]
set_false_path -ignore_errors -through [ get_pins { SYSRESET_0/POWER_ON_RESET_N } ]
