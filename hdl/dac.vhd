--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: dac.vhd
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
use IEEE.numeric_std.all;

entity dac is
port (
    --<port_name> : <direction> <type>;
	data_in : IN unsigned(15 downto 0);
	clk     : IN std_logic;
	reset   : IN std_logic;
    dac_out : OUT std_logic
);
end dac;
architecture architecture_dac of dac is
   signal data_delta : signed(17 downto 0);
   signal delta_sig  : std_logic;
   
   component delta_adder is
		port (
			data_in  : IN  unsigned(15 downto 0);
			delta : IN  std_logic;
			clk   : IN  std_logic;
			reset : IN  std_logic;
			data_out : OUT signed(17 downto 0)
		);
	end component;
	component sigma_adder is
		port (
			delta_in : IN signed(17 downto 0);
			clk      : IN std_logic;
			reset    : IN std_logic;
			dac_out  : OUT std_logic
		);
	end component;
begin

	dac_out <= delta_sig;
	
	DELTA_ADDER1: delta_adder port map (
		data_in => data_in,
		delta   => delta_sig,
		clk     => clk,
		reset   => reset,
		data_out => data_delta
	);
	
	SIGMA_ADDER1: sigma_adder port map (
		delta_in => data_delta,
		clk      => clk,
		reset    => reset,
		dac_out  => delta_sig
	);
end architecture_dac;
