----------------------------------------------------------------------
-- Created by SmartDesign Sun Jul 10 17:00:14 2022
-- Version: 2022.1 2022.1.0.10
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion2;
use smartfusion2.all;
----------------------------------------------------------------------
-- soundchip entity declaration
----------------------------------------------------------------------
entity soundchip is
    -- Port list
    port(
        -- Inputs
        DEVRST_N      : in  std_logic;
        spi_mosi      : in  std_logic;
        spi_sck       : in  std_logic;
        spi_ss        : in  std_logic;
        -- Outputs
        dac_out_left  : out std_logic;
        dac_out_right : out std_logic;
        spi_miso      : out std_logic
        );
end soundchip;
----------------------------------------------------------------------
-- soundchip architecture body
----------------------------------------------------------------------
architecture RTL of soundchip is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- CORERESET_PF_C0
component CORERESET_PF_C0
    -- Port list
    port(
        -- Inputs
        CLK            : in  std_logic;
        EXT_RST_N      : in  std_logic;
        FF_US_RESTORE  : in  std_logic;
        INIT_DONE      : in  std_logic;
        PLL_LOCK       : in  std_logic;
        SS_BUSY        : in  std_logic;
        -- Outputs
        FABRIC_RESET_N : out std_logic
        );
end component;
-- dac
component dac
    -- Port list
    port(
        -- Inputs
        clk     : in  std_logic;
        data_in : in  std_logic_vector(15 downto 0);
        reset   : in  std_logic;
        -- Outputs
        dac_out : out std_logic
        );
end component;
-- data_receiver
component data_receiver
    -- Port list
    port(
        -- Inputs
        data_in    : in  std_logic_vector(31 downto 0);
        data_rdy   : in  std_logic;
        reset      : in  std_logic;
        -- Outputs
        data_left  : out std_logic_vector(15 downto 0);
        data_right : out std_logic_vector(15 downto 0)
        );
end component;
-- FCCC_C0
component FCCC_C0
    -- Port list
    port(
        -- Inputs
        RCOSC_25_50MHZ : in  std_logic;
        -- Outputs
        GL0            : out std_logic;
        GL1            : out std_logic;
        LOCK           : out std_logic
        );
end component;
-- OSC_C0
component OSC_C0
    -- Port list
    port(
        -- Outputs
        RCOSC_25_50MHZ_CCC : out std_logic;
        RCOSC_25_50MHZ_O2F : out std_logic
        );
end component;
-- SPI_SLAVE
component SPI_SLAVE
    -- Port list
    port(
        -- Inputs
        CLK      : in  std_logic;
        CS_N     : in  std_logic;
        DIN      : in  std_logic_vector(31 downto 0);
        DIN_VLD  : in  std_logic;
        MOSI     : in  std_logic;
        RST      : in  std_logic;
        SCLK     : in  std_logic;
        -- Outputs
        DIN_RDY  : out std_logic;
        DOUT     : out std_logic_vector(31 downto 0);
        DOUT_VLD : out std_logic;
        MISO     : out std_logic
        );
end component;
-- SYSRESET
component SYSRESET
    -- Port list
    port(
        -- Inputs
        DEVRST_N         : in  std_logic;
        -- Outputs
        POWER_ON_RESET_N : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal CORERESET_PF_C0_0_FABRIC_RESET_N                   : std_logic;
signal dac_out_left_net_0                                 : std_logic;
signal dac_out_right_net_0                                : std_logic;
signal data_receiver_0_data_left                          : std_logic_vector(15 downto 0);
signal data_receiver_0_data_right                         : std_logic_vector(15 downto 0);
signal FCCC_C0_0_GL0                                      : std_logic;
signal FCCC_C0_0_GL1                                      : std_logic;
signal FCCC_C0_0_LOCK                                     : std_logic;
signal OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC : std_logic;
signal OSC_C0_0_RCOSC_25_50MHZ_O2F                        : std_logic;
signal spi_miso_net_0                                     : std_logic;
signal SPI_SLAVE_0_DOUT                                   : std_logic_vector(31 downto 0);
signal SPI_SLAVE_0_DOUT_VLD                               : std_logic;
signal SYSRESET_0_POWER_ON_RESET_N                        : std_logic;
signal dac_out_left_net_1                                 : std_logic;
signal spi_miso_net_1                                     : std_logic;
signal dac_out_right_net_1                                : std_logic;
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net                                            : std_logic;
signal DIN_const_net_0                                    : std_logic_vector(31 downto 0);
signal VCC_net                                            : std_logic;
----------------------------------------------------------------------
-- Inverted Signals
----------------------------------------------------------------------
signal FABRIC_RESET_N_OUT_PRE_INV0_0                      : std_logic;

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 GND_net         <= '0';
 DIN_const_net_0 <= B"11111111111111111111111111111111";
 VCC_net         <= '1';
----------------------------------------------------------------------
-- Inversions
----------------------------------------------------------------------
 CORERESET_PF_C0_0_FABRIC_RESET_N <= NOT FABRIC_RESET_N_OUT_PRE_INV0_0;
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 dac_out_left_net_1  <= dac_out_left_net_0;
 dac_out_left        <= dac_out_left_net_1;
 spi_miso_net_1      <= spi_miso_net_0;
 spi_miso            <= spi_miso_net_1;
 dac_out_right_net_1 <= dac_out_right_net_0;
 dac_out_right       <= dac_out_right_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- CORERESET_PF_C0_0
CORERESET_PF_C0_0 : CORERESET_PF_C0
    port map( 
        -- Inputs
        CLK            => OSC_C0_0_RCOSC_25_50MHZ_O2F,
        EXT_RST_N      => SYSRESET_0_POWER_ON_RESET_N,
        PLL_LOCK       => FCCC_C0_0_LOCK,
        SS_BUSY        => GND_net, -- tied to '0' from definition
        INIT_DONE      => VCC_net, -- tied to '1' from definition
        FF_US_RESTORE  => GND_net, -- tied to '0' from definition
        -- Outputs
        FABRIC_RESET_N => FABRIC_RESET_N_OUT_PRE_INV0_0 
        );
-- dac_0
dac_0 : dac
    port map( 
        -- Inputs
        clk     => FCCC_C0_0_GL1,
        reset   => CORERESET_PF_C0_0_FABRIC_RESET_N,
        data_in => data_receiver_0_data_left,
        -- Outputs
        dac_out => dac_out_left_net_0 
        );
-- dac_1
dac_1 : dac
    port map( 
        -- Inputs
        clk     => FCCC_C0_0_GL1,
        reset   => CORERESET_PF_C0_0_FABRIC_RESET_N,
        data_in => data_receiver_0_data_right,
        -- Outputs
        dac_out => dac_out_right_net_0 
        );
-- data_receiver_0
data_receiver_0 : data_receiver
    port map( 
        -- Inputs
        reset      => CORERESET_PF_C0_0_FABRIC_RESET_N,
        data_rdy   => SPI_SLAVE_0_DOUT_VLD,
        data_in    => SPI_SLAVE_0_DOUT,
        -- Outputs
        data_left  => data_receiver_0_data_left,
        data_right => data_receiver_0_data_right 
        );
-- FCCC_C0_0
FCCC_C0_0 : FCCC_C0
    port map( 
        -- Inputs
        RCOSC_25_50MHZ => OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC,
        -- Outputs
        GL0            => FCCC_C0_0_GL0,
        GL1            => FCCC_C0_0_GL1,
        LOCK           => FCCC_C0_0_LOCK 
        );
-- OSC_C0_0
OSC_C0_0 : OSC_C0
    port map( 
        -- Outputs
        RCOSC_25_50MHZ_O2F => OSC_C0_0_RCOSC_25_50MHZ_O2F,
        RCOSC_25_50MHZ_CCC => OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC 
        );
-- SPI_SLAVE_0
SPI_SLAVE_0 : SPI_SLAVE
    port map( 
        -- Inputs
        CLK      => FCCC_C0_0_GL0,
        RST      => CORERESET_PF_C0_0_FABRIC_RESET_N,
        SCLK     => spi_sck,
        CS_N     => spi_ss,
        MOSI     => spi_mosi,
        DIN_VLD  => GND_net,
        DIN      => DIN_const_net_0,
        -- Outputs
        MISO     => spi_miso_net_0,
        DIN_RDY  => OPEN,
        DOUT_VLD => SPI_SLAVE_0_DOUT_VLD,
        DOUT     => SPI_SLAVE_0_DOUT 
        );
-- SYSRESET_0
SYSRESET_0 : SYSRESET
    port map( 
        -- Inputs
        DEVRST_N         => DEVRST_N,
        -- Outputs
        POWER_ON_RESET_N => SYSRESET_0_POWER_ON_RESET_N 
        );

end RTL;
