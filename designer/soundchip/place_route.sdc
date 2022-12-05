# Microsemi Corp.
# Date: 2022-Dec-05 15:56:07
# This file was generated based on the following SDC source files:
#   C:/Users/Constantin/Documents/VHDLSoundchip/constraint/user.sdc
#

create_clock -name {OSC_0} -period 20 -waveform {0 10 } [ get_pins { OSC_C0_0/OSC_C0_0/I_RCOSC_25_50MHZ/CLKOUT } ]
create_generated_clock -name {FCCC_C0_0} -add  -master_clock  OSC_0 -multiply_by 2 -source [ get_pins { FCCC_C0_0/FCCC_C0_0/CCC_INST/INST_CCC_IP/RCOSC_25_50MHZ } ] [ get_pins { FCCC_C0_0/FCCC_C0_0/CCC_INST/INST_CCC_IP/GL0 } ]
set_false_path -through [ get_pins { SYSRESET_0/INST_SYSRESET_FF_IP/POWER_ON_RESET_N } ]
