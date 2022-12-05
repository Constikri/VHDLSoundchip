----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Sun Jul 24 22:07:27 2022
-- Parameters for CLK_GEN
----------------------------------------------------------------------


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

package coreparameters is
    constant CLK_PERIOD : integer := 20000;
    constant DUTY_CYCLE : integer := 50;
end coreparameters;
