--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: sigma_adder_tb.vhd
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
use ieee.numeric_std.all;

entity sigma_adder_tb is
end sigma_adder_tb;

architecture behavioral of sigma_adder_tb is

    constant SYSCLK_PERIOD : time := 200 ns; -- 5MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';
    
    signal delta_in_sig : signed(17 downto 0) := (others => '0');
    signal dac_out_sig : std_logic;

    component sigma_adder
        -- ports
        port (
            -- Inputs
            delta_in : IN signed(17 downto 0);
            clk      : IN std_logic;
            reset    : IN std_logic;
            
            -- Outputs
            dac_out  : OUT std_logic
        );
    end component;

begin

    process
        variable vhdl_initial : BOOLEAN := TRUE;

    begin
        if ( vhdl_initial ) then
            -- Assert Reset
            NSYSRESET <= '1';
            wait for ( SYSCLK_PERIOD * 2 );
            
            NSYSRESET <= '0';
            wait;
        end if;
    end process;

    -- Clock Driver
    SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );

    -- Instantiate Unit Under Test:  sigma_adder
    sigma_adder_0 : sigma_adder
        -- port map
        port map( 
            -- Inputs
            delta_in => delta_in_sig,
            clk => SYSCLK,
            reset => NSYSRESET,
            
            -- Outputs
            dac_out => dac_out_sig
        );
        
    tb: process
        begin
            wait until NSYSRESET = '0'; -- 400 ns
            assert dac_out_sig = '1';
            
            delta_in_sig <= "111101111001100101";
            wait for SYSCLK_PERIOD; -- 600 ns
            assert dac_out_sig = '0';
            
            delta_in_sig <= "001101111001100101";
            wait for SYSCLK_PERIOD; -- 800 ns
            assert dac_out_sig = '1';
            
            delta_in_sig <= "111101111001100101";
            wait for SYSCLK_PERIOD; -- 1000 ns
            assert dac_out_sig = '1';
            
            delta_in_sig <= "111101111001100101";
            wait for SYSCLK_PERIOD; -- 1200 ns
            assert dac_out_sig = '1';
            
            delta_in_sig <= "111101111001100101";
            wait for SYSCLK_PERIOD; -- 1400 ns
            assert dac_out_sig = '1';
            
            delta_in_sig <= "111101111001100101";
            wait for SYSCLK_PERIOD; -- 1600 ns
            assert dac_out_sig = '1';
            
            delta_in_sig <= "111101111001100101";
            wait for SYSCLK_PERIOD; -- 1800 ns
            assert dac_out_sig = '1';
            
            delta_in_sig <= "111101111001100101";
            wait for SYSCLK_PERIOD; -- 2000 ns
            assert dac_out_sig = '1';
            
            delta_in_sig <= "111101111001100101";
            wait for SYSCLK_PERIOD; -- 2200 ns
            assert dac_out_sig = '0';
            
            wait;
        end process;

end behavioral;

