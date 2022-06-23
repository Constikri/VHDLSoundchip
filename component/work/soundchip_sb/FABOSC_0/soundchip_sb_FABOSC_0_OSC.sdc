set_component soundchip_sb_FABOSC_0_OSC
# Microsemi Corp.
# Date: 2022-Jan-23 18:58:52
#

create_clock -ignore_errors -period 20 [ get_pins { I_RCOSC_25_50MHZ/CLKOUT } ]
