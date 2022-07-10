--
-- Synopsys
-- Vhdl wrapper for top level design, written on Sun Jul 10 21:18:02 2022
--
library ieee;
use ieee.std_logic_1164.all;

entity wrapper_for_soundchip is
   port (
      DEVRST_N : in std_logic;
      spi_mosi : in std_logic;
      spi_sck : in std_logic;
      spi_ss : in std_logic;
      dac_out_left : out std_logic;
      dac_out_right : out std_logic;
      spi_miso : out std_logic
   );
end wrapper_for_soundchip;

architecture rtl of wrapper_for_soundchip is

component soundchip
 port (
   DEVRST_N : in std_logic;
   spi_mosi : in std_logic;
   spi_sck : in std_logic;
   spi_ss : in std_logic;
   dac_out_left : out std_logic;
   dac_out_right : out std_logic;
   spi_miso : out std_logic
 );
end component;

signal tmp_DEVRST_N : std_logic;
signal tmp_spi_mosi : std_logic;
signal tmp_spi_sck : std_logic;
signal tmp_spi_ss : std_logic;
signal tmp_dac_out_left : std_logic;
signal tmp_dac_out_right : std_logic;
signal tmp_spi_miso : std_logic;

begin

tmp_DEVRST_N <= DEVRST_N;

tmp_spi_mosi <= spi_mosi;

tmp_spi_sck <= spi_sck;

tmp_spi_ss <= spi_ss;

dac_out_left <= tmp_dac_out_left;

dac_out_right <= tmp_dac_out_right;

spi_miso <= tmp_spi_miso;



u1:   soundchip port map (
		DEVRST_N => tmp_DEVRST_N,
		spi_mosi => tmp_spi_mosi,
		spi_sck => tmp_spi_sck,
		spi_ss => tmp_spi_ss,
		dac_out_left => tmp_dac_out_left,
		dac_out_right => tmp_dac_out_right,
		spi_miso => tmp_spi_miso
       );
end rtl;
