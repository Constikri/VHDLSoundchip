----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Thu Aug 19 11:59:46 2021
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
    constant USE_MASTER : integer := 1;
    constant USE_SLAVE : integer := 1;
end coreparameters;
