----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Sun Jan 23 18:58:50 2022
-- Parameters for CORESPI
----------------------------------------------------------------------


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

package coreparameters is
    constant FAMILY : integer := 15;
    constant HDL_license : string( 1 to 1 ) := "O";
    constant testbench : string( 1 to 4 ) := "User";
    constant USE_MASTER : integer := 0;
    constant USE_SLAVE : integer := 1;
end coreparameters;
