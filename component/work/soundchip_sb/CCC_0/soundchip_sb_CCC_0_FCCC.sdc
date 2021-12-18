set_component soundchip_sb_CCC_0_FCCC
# Microsemi Corp.
# Date: 2021-Aug-18 14:23:37
#

create_clock -period 1000 [ get_pins { CCC_INST/RCOSC_1MHZ } ]
create_generated_clock -multiply_by 100 -source [ get_pins { CCC_INST/RCOSC_1MHZ } ] -phase 0 [ get_pins { CCC_INST/GL0 } ]
