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

entity dac is
port (
    --<port_name> : <direction> <type>;
	d_in : IN  std_logic_vector(15 downto 0);
    a_out : OUT std_logic
);
end dac;
architecture architecture_dac of dac is
   -- signal, component etc. declarations
   -- integrator, 1-bit quantizer, adder, feedback loop
begin

   -- architecture body
end architecture_dac;
