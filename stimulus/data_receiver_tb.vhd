--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: data_receiver_tb.vhd
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

entity data_receiver_tb is
end data_receiver_tb;

architecture behavioral of data_receiver_tb is

    constant SYSCLK_PERIOD : time := 100 ns; -- 10MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';
    
    signal data_rdy_sig : std_logic := '0';
    signal data_in_sig : std_logic_vector(31 downto 0) := (others => '0');
    signal data_right_sig : std_logic_vector(15 downto 0);
    signal data_left_sig: std_logic_vector(15 downto 0);

    component data_receiver
        port (
            -- Inputs
            reset      : in std_logic;
            data_rdy   : in std_logic;
            data_in    : in std_logic_vector(31 downto 0);
            
            -- Outputs
            data_left  : OUT std_logic_vector(15 downto 0);
            data_right : OUT std_logic_vector(15 downto 0)
        );
    end component;

begin
    -- Clock Driver
    SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );

    -- Instantiate Unit Under Test:  data_receiver
    data_receiver_0: data_receiver
        -- port map
        port map(
            -- Inputs
            reset => NSYSRESET,
            data_rdy => data_rdy_sig,
            data_in => data_in_sig,
            
            -- Outputs
            data_left => data_left_sig,
            data_right => data_right_sig
        );
    
    tb: process
        begin
            NSYSRESET <= '1';
            wait for SYSCLK_PERIOD;
            NSYSRESET <= '0';
            
            data_in_sig <= ("00001111011100101110110001110010"); 
            wait for SYSCLK_PERIOD;
            assert ((data_left_sig = "0000000000000000") and (data_right_sig = "0000000000000000"));
            
            data_rdy_sig <= '1';
            wait for SYSCLK_PERIOD;
            assert ((data_left_sig = "1110110001110010") and (data_right_sig = "0000111101110010"));
            
            data_rdy_sig <= '0';
            wait for SYSCLK_PERIOD;
            
            data_rdy_sig <= '1';
            data_in_sig <= ("00110100100000010000011111010010");
            wait for SYSCLK_PERIOD;
            assert ((data_left_sig = "0000011111010010") and (data_right_sig = "0011010010000001"));
            
            wait;
        end process;

end behavioral;

