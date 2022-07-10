--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: dac_tb.vhd
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

entity dac_tb is
end dac_tb;

architecture behavioral of dac_tb is

    constant SYSCLK_PERIOD : time := 20 ns; -- 50MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';
    
    signal data_in_sig : std_logic_vector(15 downto 0) := (others => '0');
    signal dac_out_sig : std_logic;

    component dac
        -- ports
        port (
            -- Inputs
            data_in : IN std_logic_vector(15 downto 0);
            clk     : IN std_logic;
            reset   : IN std_logic;
            
            -- Outputs
            dac_out : OUT std_logic
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

    -- Instantiate Unit Under Test:  dac
    dac_0 : dac
        -- port map
        port map( 
            -- Inputs
            data_in => data_in_sig,
            clk => SYSCLK,
            reset => NSYSRESET,
            
            -- Outputs
            dac_out => dac_out_sig
        );
        
    tb: process
        begin
        wait until NSYSRESET = '0';
        
        data_in_sig <= "0000000000000000";
        wait for 22670 ns;
        
        data_in_sig <= "0000000000000001";
        wait for 22670 ns;
        
        data_in_sig <= "0000000000000011";
        wait for 22670 ns;
        
        data_in_sig <= "0000000000000111";
        wait for 22670 ns;
        
        data_in_sig <= "0000000000001111";
        wait for 22670 ns;
        
        data_in_sig <= "0000000000011111";
        wait for 22670 ns;
        
        data_in_sig <= "0000000000111111";
        wait for 22670 ns;
        
        data_in_sig <= "0000000001111111";
        wait for 22670 ns;
        
        data_in_sig <= "0000000011111111";
        wait for 22670 ns;
        
        data_in_sig <= "0000000111111111";
        wait for 22670 ns;
        
        data_in_sig <= "0000001111111111";
        wait for 22670 ns;
        
        data_in_sig <= "0000011111111111";
        wait for 22670 ns;
        
        data_in_sig <= "0000111111111111";
        wait for 22670 ns;
        
        data_in_sig <= "0001111111111111";
        wait for 22670 ns;
        
        data_in_sig <= "0011111111111111";
        wait for 22670 ns;
        
        data_in_sig <= "0111111111111111";
        wait for 22670 ns;
        
        data_in_sig <= "1111111111111111";
        wait for 22670 ns;
        
        wait;
        end process;

end behavioral;

