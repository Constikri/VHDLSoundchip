set_component soundchip_sb_FABOSC_0_OSC
# Microsemi Corp.
# Date: 2021-Aug-18 14:23:39
#

create_clock -ignore_errors -period 20 [ get_pins { I_RCOSC_25_50MHZ/CLKOUT } ]
create_clock -ignore_errors -period 1000 [ get_pins { I_RCOSC_1MHZ/CLKOUT } ]
