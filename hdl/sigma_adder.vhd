--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: sigma_adder.vhd
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

library IEEE;

use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity sigma_adder is
port (
	delta_in : IN signed(17 downto 0);
	clk      : IN std_logic;
	reset    : IN std_logic;
	dac_out  : OUT std_logic
);
end sigma_adder;

architecture architecture_sigma_adder of sigma_adder is

	signal sigma_register : signed(17 downto 0);

begin
	process(clk, reset)
		variable temp_reg : signed(17 downto 0);
	begin
		if(reset = '1') then
			sigma_register <= (17 => '1', others => '0');
		else
			if(rising_edge(clk)) then
				temp_reg := delta_in + sigma_register;
				sigma_register <= temp_reg(17 downto 0);
			end if;
		end if;
	end process;
   
    dac_out <= sigma_register(17);
end architecture_sigma_adder;
