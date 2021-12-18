--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: integrator.vhd
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

entity integrator is
port (
    clock  : in std_logic;
    reset  : in std_logic;  -- synchronous, '1' to reset integrator
    data_enable : in std_logic;  -- '1' for clocks carrying new data
    data : in std_logic_vector;
    sigma : out std_logic_vector
);
end integrator;
architecture architecture_integrator of integrator is

begin

   process(clock) is
    variable sum: signed(sigma'range);
   begin
    if rising_edge(clock) then
      if reset = '1' then
        sum := (others => '0');
      elsif data_enable = '1' then
        sum := sum + signed(data);
      end if;
      sigma <= std_logic_vector(sum);
    end if;
  end process;

end architecture_integrator;
