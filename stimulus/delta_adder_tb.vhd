--------------------------------------------------------------------------------
--
-- File: data_receiver.vhd
--
-- Targeted device: <Family::SmartFusion2> <Die::M2S010> <Package::256 VF>
-- Author: Constantin Krischke
--
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity delta_adder_tb is
end delta_adder_tb;

architecture behavioral of delta_adder_tb is

    constant SYSCLK_PERIOD : time := 200 ns; -- 5MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';
    
    signal delta_sig : std_logic := '0';
    signal data_in_sig : std_logic_vector(15 downto 0) := (others => '0');
    signal data_out_sig : signed(17 downto 0);

    component delta_adder
        -- ports
        port (
            -- Inputs
            delta : IN  std_logic;
            clk   : IN  std_logic;
            reset : IN  std_logic;
            data_in  : IN  std_logic_vector(15 downto 0);
            
            -- Outputs
            data_out : OUT signed(17 downto 0)
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

    -- Instantiate Unit Under Test:  delta_adder
    delta_adder_0 : delta_adder
        -- port map
        port map( 
             -- Inputs
            delta => delta_sig,
            clk => SYSCLK,
            reset => NSYSRESET,
            data_in => data_in_sig,
            
            -- Outputs
            data_out => data_out_sig

        );
        
    tb: process
        begin
            wait until NSYSRESET = '0';
            assert data_out_sig = "000000000000000000";
            
            data_in_sig <= "1101111001100101";
            delta_sig <= '1';
            wait for SYSCLK_PERIOD;
            assert data_out_sig = "111101111001100101";
            
            data_in_sig <= "0101110000101111";
            delta_sig <= '0';
            wait for SYSCLK_PERIOD;
            assert data_out_sig = "000101110000101111";
            
            wait;
        end process;

end behavioral;

