--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: delta_adder.vhd
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

entity delta_adder is
port (
	data_in  : IN  std_logic_vector(15 downto 0);
	delta : IN  std_logic;
	clk   : IN  std_logic;
	reset : IN  std_logic;
    data_out : OUT signed(17 downto 0)
);
end delta_adder;
architecture architecture_delta_adder of delta_adder is
	constant delta_at_one  : signed(17 downto 0) := (17 downto 16 => '1', others => '0');
	constant delta_at_zero : signed(17 downto 0) := (others => '0');

begin
	process(clk, reset)
	begin
	
		if(reset = '1') then
            data_out <= (others => '0');
		else
			if(rising_edge(clk)) then
				data_out <= delta_at_one + ("00" & signed(data_in)) when (delta = '1') else delta_at_zero + ("00" & signed(data_in));
			end if;
		end if;
		
	end process;
end architecture_delta_adder;
