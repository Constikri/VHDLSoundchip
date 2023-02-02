--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: soundchip_tb.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::SmartFusion2> <Die::M2S010> <Package::256 VF>
-- Author: <Name>
--
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.math_real.all;

entity soundchip_tb is
end soundchip_tb;

architecture behavioral of soundchip_tb is
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
    constant SYSCLK_PERIOD : time := 10 ns; -- 100MHZ
    constant DATACLK_PERIOD : time := 22670 ns;
    constant WORD_SIZE : natural := 32;
    constant INITIAL_RST : time := 100 us;

    signal DATACLK : std_logic := '0';
    -- signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';

    signal mosi_sig : std_logic;
    signal miso_sig : std_logic;
    signal sck_sig : std_logic;
    signal cs_sig : std_logic;
    signal spi_data_in : std_logic_vector((WORD_SIZE-1) downto 0);
    signal spi_data_out : std_logic_vector((WORD_SIZE-1) downto 0);
    
    signal dac_out_left_sig : std_logic;
    signal dac_out_right_sig : std_logic;
    
    signal data_out : std_logic_vector(15 downto 0) := (others => '0');
    signal ascend   : std_logic := '1';
    constant compare_max : std_logic_vector(15 downto 0) := (others => '1');
    constant compare_min : std_logic_vector(15 downto 0) := (others => '0');
    
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
    -- soundchip
    component soundchip
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
    end component;
    
    procedure SPI_MASTER (
        constant SPI_PER : time;
        signal SMM_MDI  : in  std_logic_vector((WORD_SIZE-1) downto 0);
        signal SMM_MDO  : out std_logic_vector((WORD_SIZE-1) downto 0);
        signal SMM_SCLK : out std_logic;
        signal SMM_CS_N : out std_logic;
        signal SMM_MOSI : out std_logic;
        signal SMM_MISO : in  std_logic
    ) is
    begin
        SMM_CS_N <= '0';
        for i in 0 to (WORD_SIZE-1) loop
            SMM_SCLK <= '0';
            SMM_MOSI <= SMM_MDI(WORD_SIZE-1-i);
            wait for SPI_PER/2;
            SMM_SCLK <= '1';
            SMM_MDO(WORD_SIZE-1-i) <= SMM_MISO;
            wait for SPI_PER/2;
        end loop;
        SMM_SCLK <= '0';
        wait for SPI_PER/2;
        SMM_CS_N <= '1';
    end procedure;

begin
    -- Clock Driver
    -- SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );
    DATACLK <= not DATACLK after (DATACLK_PERIOD / 2.0 );

----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
    -- soundchip_0
    soundchip_0 : soundchip
        port map( 
            -- Inputs
            spi_mosi      => mosi_sig,
            spi_sck       => sck_sig,
            spi_ss        => cs_sig,
            DEVRST_N      => NSYSRESET,
            -- Outputs
            dac_out_left  => dac_out_left_sig,
            spi_miso      => miso_sig,
            dac_out_right => dac_out_right_sig
        );

    process(DATACLK)
        begin
            if (rising_edge(DATACLK)) then
                data_out <= (data_out + "1111") when (ascend = '1') else (data_out - "1111");
            end if;
            if (data_out = compare_max) then
                ascend <= '0';
            elsif (data_out = compare_min) then
                ascend <= '1';
            end if;
        end process;
    
    spi_data_in(31 downto 16) <= data_out;
    spi_data_in(15 downto 0) <= data_out;
    
    tb: process
        begin
            NSYSRESET <= '0';
            wait for ( INITIAL_RST );
            NSYSRESET <= '1';
            
            for i in 0 to 262140 loop
                SPI_MASTER((SYSCLK_PERIOD*10), spi_data_in, spi_data_out, sck_sig, cs_sig, mosi_sig, miso_sig);
                wait for DATACLK_PERIOD;
            end loop;
            
            wait;
        end process;
end behavioral;