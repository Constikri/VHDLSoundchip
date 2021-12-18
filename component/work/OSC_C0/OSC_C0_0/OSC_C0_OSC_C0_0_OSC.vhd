-- Version: v2021.1 2021.1.0.17

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity OSC_C0_OSC_C0_0_OSC is

    port( XTL                : in    std_logic;
          RCOSC_25_50MHZ_CCC : out   std_logic;
          RCOSC_25_50MHZ_O2F : out   std_logic;
          RCOSC_1MHZ_CCC     : out   std_logic;
          RCOSC_1MHZ_O2F     : out   std_logic;
          XTLOSC_CCC         : out   std_logic;
          XTLOSC_O2F         : out   std_logic
        );

end OSC_C0_OSC_C0_0_OSC;

architecture DEF_ARCH of OSC_C0_OSC_C0_0_OSC is 

  component CLKINT
    port( A : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component RCOSC_1MHZ_FAB
    port( A      : in    std_logic := 'U';
          CLKOUT : out   std_logic
        );
  end component;

  component RCOSC_1MHZ
    port( CLKOUT : out   std_logic
        );
  end component;

    signal N_RCOSC_1MHZ_CCC, N_RCOSC_1MHZ_CLKINT : std_logic;

begin 

    RCOSC_1MHZ_CCC <= N_RCOSC_1MHZ_CCC;

    I_RCOSC_1MHZ_FAB_CLKINT : CLKINT
      port map(A => N_RCOSC_1MHZ_CLKINT, Y => RCOSC_1MHZ_O2F);
    
    I_RCOSC_1MHZ_FAB : RCOSC_1MHZ_FAB
      port map(A => N_RCOSC_1MHZ_CCC, CLKOUT => 
        N_RCOSC_1MHZ_CLKINT);
    
    I_RCOSC_1MHZ : RCOSC_1MHZ
      port map(CLKOUT => N_RCOSC_1MHZ_CCC);
    

end DEF_ARCH; 
