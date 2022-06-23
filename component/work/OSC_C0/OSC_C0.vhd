----------------------------------------------------------------------
-- Created by SmartDesign Sun Jan 23 16:57:27 2022
-- Version: v2021.2 2021.2.0.11
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Component Description (Tcl) 
----------------------------------------------------------------------
--# Exporting Component Description of OSC_C0 to TCL
--# Family: SmartFusion2
--# Part Number: M2S010-VF256
--# Create and Configure the core component OSC_C0
--create_and_configure_core -core_vlnv {Actel:SgCore:OSC:2.0.101} -component_name {OSC_C0} -params {\
--"RCOSC_1MHZ_DRIVES_CCC:1"  \
--"RCOSC_1MHZ_DRIVES_FAB:1"  \
--"RCOSC_1MHZ_IS_USED:0"  \
--"RCOSC_25_50MHZ_DRIVES_CCC:false"  \
--"RCOSC_25_50MHZ_DRIVES_FAB:false"  \
--"RCOSC_25_50MHZ_IS_USED:false"  \
--"VOLTAGE_IS_1_2:true"  \
--"XTLOSC_DRIVES_CCC:1"  \
--"XTLOSC_DRIVES_FAB:1"  \
--"XTLOSC_FREQ:20.00"  \
--"XTLOSC_IS_USED:1"  \
--"XTLOSC_SRC:CRYSTAL"   }
--# Exporting Component Description of OSC_C0 to TCL done

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion2;
use smartfusion2.all;
----------------------------------------------------------------------
-- OSC_C0 entity declaration
----------------------------------------------------------------------
entity OSC_C0 is
    -- Port list
    port(
        -- Inputs
        XTL        : in  std_logic;
        -- Outputs
        XTLOSC_CCC : out std_logic;
        XTLOSC_O2F : out std_logic
        );
end OSC_C0;
----------------------------------------------------------------------
-- OSC_C0 architecture body
----------------------------------------------------------------------
architecture RTL of OSC_C0 is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- OSC_C0_OSC_C0_0_OSC   -   Actel:SgCore:OSC:2.0.101
component OSC_C0_OSC_C0_0_OSC
    -- Port list
    port(
        -- Inputs
        XTL                : in  std_logic;
        -- Outputs
        RCOSC_1MHZ_CCC     : out std_logic;
        RCOSC_1MHZ_O2F     : out std_logic;
        RCOSC_25_50MHZ_CCC : out std_logic;
        RCOSC_25_50MHZ_O2F : out std_logic;
        XTLOSC_CCC         : out std_logic;
        XTLOSC_O2F         : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal XTLOSC_CCC_OUT_XTLOSC_CCC       : std_logic;
signal XTLOSC_O2F_net_0                : std_logic;
signal XTLOSC_O2F_net_1                : std_logic;
signal XTLOSC_CCC_OUT_XTLOSC_CCC_net_0 : std_logic;

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 XTLOSC_O2F_net_1                <= XTLOSC_O2F_net_0;
 XTLOSC_O2F                      <= XTLOSC_O2F_net_1;
 XTLOSC_CCC_OUT_XTLOSC_CCC_net_0 <= XTLOSC_CCC_OUT_XTLOSC_CCC;
 XTLOSC_CCC                      <= XTLOSC_CCC_OUT_XTLOSC_CCC_net_0;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- OSC_C0_0   -   Actel:SgCore:OSC:2.0.101
OSC_C0_0 : OSC_C0_OSC_C0_0_OSC
    port map( 
        -- Inputs
        XTL                => XTL,
        -- Outputs
        RCOSC_25_50MHZ_CCC => OPEN,
        RCOSC_25_50MHZ_O2F => OPEN,
        RCOSC_1MHZ_CCC     => OPEN,
        RCOSC_1MHZ_O2F     => OPEN,
        XTLOSC_CCC         => XTLOSC_CCC_OUT_XTLOSC_CCC,
        XTLOSC_O2F         => XTLOSC_O2F_net_0 
        );

end RTL;
