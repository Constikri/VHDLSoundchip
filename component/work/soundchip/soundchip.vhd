----------------------------------------------------------------------
-- Created by SmartDesign Mon Dec  5 15:55:40 2022
-- Version: 2022.2 2022.2.0.10
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
-- AND2
component AND2
    -- Port list
    port(
        -- Inputs
        A : in  std_logic;
        B : in  std_logic;
        -- Outputs
        Y : out std_logic
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
        dac_reset  : out std_logic;
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
        LOCK           : out std_logic
        );
end component;
-- OSC_C0
component OSC_C0
    -- Port list
    port(
        -- Outputs
        RCOSC_25_50MHZ_CCC : out std_logic
        );
end component;
-- spi_slave
component spi_slave
    -- Port list
    port(
        -- Inputs
        CLK_in       : in  std_logic;
        DataToTx     : in  std_logic_vector(31 downto 0);
        DataToTxLoad : in  std_logic;
        RESET_in     : in  std_logic;
        SPI_CLK      : in  std_logic;
        SPI_MOSI     : in  std_logic;
        SPI_SS       : in  std_logic;
        -- Outputs
        DataRxd      : out std_logic_vector(31 downto 0);
        SPI_DONE     : out std_logic;
        SPI_MISO     : out std_logic
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
signal AND2_0_Y                                           : std_logic;
signal clk_debug                                          : std_logic;
signal dac_out_left_net_0                                 : std_logic;
signal dac_out_right_net_0                                : std_logic;
signal data_receiver_0_dac_reset                          : std_logic;
signal data_receiver_0_data_left                          : std_logic_vector(15 downto 0);
signal data_receiver_0_data_right                         : std_logic_vector(15 downto 0);
signal FCCC_C0_0_LOCK                                     : std_logic;
signal OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC : std_logic;
signal spi_miso_net_0                                     : std_logic;
signal spi_slave_0_DataRxd                                : std_logic_vector(31 downto 0);
signal spi_slave_0_SPI_DONE                               : std_logic;
signal SYSRESET_0_POWER_ON_RESET_N                        : std_logic;
signal dac_out_left_net_1                                 : std_logic;
signal dac_out_right_net_1                                : std_logic;
signal spi_miso_net_1                                     : std_logic;
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal DataToTx_const_net_0                               : std_logic_vector(31 downto 0);
signal VCC_net                                            : std_logic;

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 DataToTx_const_net_0 <= B"11111111111111111111111111111111";
 VCC_net              <= '1';
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 dac_out_left_net_1  <= dac_out_left_net_0;
 dac_out_left        <= dac_out_left_net_1;
 dac_out_right_net_1 <= dac_out_right_net_0;
 dac_out_right       <= dac_out_right_net_1;
 spi_miso_net_1      <= spi_miso_net_0;
 spi_miso            <= spi_miso_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- AND2_0
AND2_0 : AND2
    port map( 
        -- Inputs
        A => FCCC_C0_0_LOCK,
        B => SYSRESET_0_POWER_ON_RESET_N,
        -- Outputs
        Y => AND2_0_Y 
        );
-- dac_0
dac_0 : dac
    port map( 
        -- Inputs
        clk     => clk_debug,
        reset   => data_receiver_0_dac_reset,
        data_in => data_receiver_0_data_left,
        -- Outputs
        dac_out => dac_out_left_net_0 
        );
-- dac_1
dac_1 : dac
    port map( 
        -- Inputs
        clk     => clk_debug,
        reset   => data_receiver_0_dac_reset,
        data_in => data_receiver_0_data_right,
        -- Outputs
        dac_out => dac_out_right_net_0 
        );
-- data_receiver_0
data_receiver_0 : data_receiver
    port map( 
        -- Inputs
        reset      => AND2_0_Y,
        data_rdy   => spi_slave_0_SPI_DONE,
        data_in    => spi_slave_0_DataRxd,
        -- Outputs
        dac_reset  => data_receiver_0_dac_reset,
        data_left  => data_receiver_0_data_left,
        data_right => data_receiver_0_data_right 
        );
-- FCCC_C0_0
FCCC_C0_0 : FCCC_C0
    port map( 
        -- Inputs
        RCOSC_25_50MHZ => OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC,
        -- Outputs
        GL0            => clk_debug,
        LOCK           => FCCC_C0_0_LOCK 
        );
-- OSC_C0_0
OSC_C0_0 : OSC_C0
    port map( 
        -- Outputs
        RCOSC_25_50MHZ_CCC => OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC 
        );
-- spi_slave_0
spi_slave_0 : spi_slave
    port map( 
        -- Inputs
        RESET_in     => AND2_0_Y,
        CLK_in       => clk_debug,
        SPI_CLK      => spi_sck,
        SPI_SS       => spi_ss,
        SPI_MOSI     => spi_mosi,
        DataToTx     => DataToTx_const_net_0,
        DataToTxLoad => VCC_net,
        -- Outputs
        SPI_MISO     => spi_miso_net_0,
        SPI_DONE     => spi_slave_0_SPI_DONE,
        DataRxd      => spi_slave_0_DataRxd 
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
