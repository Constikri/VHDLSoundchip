# Microsemi Corp.
# Date: 2022-Jul-10 21:17:48
# This file was generated based on the following SDC source files:
#   C:/Users/Constantin/Documents/VHDLSoundchip/component/work/FCCC_C0/FCCC_C0_0/FCCC_C0_FCCC_C0_0_FCCC.sdc
#   C:/Users/Constantin/Documents/VHDLSoundchip/component/work/OSC_C0/OSC_C0_0/OSC_C0_OSC_C0_0_OSC.sdc
#   C:/Microsemi/Libero_SoC_v2022.1/Designer/data/aPA4M/cores/constraints/sysreset.sdc
#

create_clock -name {OSC_C0_0/OSC_C0_0/I_RCOSC_25_50MHZ/CLKOUT} -period 20 [ get_pins { OSC_C0_0/OSC_C0_0/I_RCOSC_25_50MHZ/CLKOUT } ]
create_generated_clock -name {FCCC_C0_0/FCCC_C0_0/GL0} -multiply_by 4 -divide_by 2 -source [ get_pins { FCCC_C0_0/FCCC_C0_0/CCC_INST/RCOSC_25_50MHZ } ] -phase 0 [ get_pins { FCCC_C0_0/FCCC_C0_0/CCC_INST/GL0 } ]
create_generated_clock -name {FCCC_C0_0/FCCC_C0_0/GL1} -multiply_by 4 -divide_by 40 -source [ get_pins { FCCC_C0_0/FCCC_C0_0/CCC_INST/RCOSC_25_50MHZ } ] -phase 0 [ get_pins { FCCC_C0_0/FCCC_C0_0/CCC_INST/GL1 } ]
set_false_path -ignore_errors -through [ get_pins { SYSRESET_0/POWER_ON_RESET_N } ]
