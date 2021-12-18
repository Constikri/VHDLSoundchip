--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: soundchip_hdl.vhd
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
use IEEE.std_logic_arith.all;

entity soundchip_hdl is
port (
    --<port_name> : <direction> <type>;
	
);
end soundchip_hdl;
architecture architecture_soundchip_hdl of soundchip_hdl is
   -- signal, component etc. declarations
	signal dsp_sig_0, dsp_sig_1, dsp_sig_2, dsp_sig_3, dsp_sig_4, dsp_sig_5, dsp_sig_6, dsp_sig_7, dsp_sig_8, dsp_sig_9, dsp_sig_10, dsp_sig_11, dsp_sig_12, dsp_sig_13, dsp_sig_14, dsp_sig_15 : std_logic;
	
    
    component dsp
        port (
            OUT_0 : OUT std_logic;
            OUT_1 : OUT std_logic;
            OUT_2 : OUT std_logic;
            OUT_3 : OUT std_logic;
            OUT_4 : OUT std_logic;
            OUT_5 : OUT std_logic;
            OUT_6 : OUT std_logic;
            OUT_7 : OUT std_logic;
            OUT_8 : OUT std_logic;
            OUT_9 : OUT std_logic;
            OUT_10 : OUT std_logic;
            OUT_11 : OUT std_logic;
            OUT_12 : OUT std_logic;
            OUT_13 : OUT std_logic;
            OUT_14 : OUT std_logic;
            OUT_15 : OUT std_logic
        );
    end component;
    
    component dac
        port (
            in_0 : IN  std_logic;
            in_1 : IN  std_logic;
            in_2 : IN  std_logic;
            in_3 : IN  std_logic;
            in_4 : IN  std_logic;
            in_5 : IN  std_logic;
            in_6 : IN  std_logic;
            in_7 : IN  std_logic;
            a_out : OUT std_logic
        );
    end component;
begin
    
    DSP_0: dsp port map (
        OUT_0 => dsp_sig_0,
        OUT_1 => dsp_sig_1,
        OUT_2 => dsp_sig_2,
        OUT_3 => dsp_sig_3,
        OUT_4 => dsp_sig_4,
        OUT_5 => dsp_sig_5,
        OUT_6 => dsp_sig_6,
        OUT_7 => dsp_sig_7,
        OUT_8 => dsp_sig_8,
        OUT_9 => dsp_sig_9,
        OUT_10 => dsp_sig_10,
        OUT_11 => dsp_sig_11,
        OUT_12 => dsp_sig_12,
        OUT_13 => dsp_sig_13,
        OUT_14 => dsp_sig_14,
        OUT_15 => dsp_sig_15
    );
    
    DAC_0: dac port map (
        in_0 => dsp_sig_0,
        in_1 => dsp_sig_1,
        in_2 => dsp_sig_2,
        in_3 => dsp_sig_3,
        in_4 => dsp_sig_4,
        in_5 => dsp_sig_5,
        in_6 => dsp_sig_6,
        in_7 => dsp_sig_7,
        a_out 
    );
    
    DAC_1: dac port map (
        in_0 => dsp_sig_8,
        in_1 => dsp_sig_9,
        in_2 => dsp_sig_10,
        in_3 => dsp_sig_11,
        in_4 => dsp_sig_12,
        in_5 => dsp_sig_13,
        in_6 => dsp_sig_14,
        in_7 => dsp_sig_15,
        a_out 
    );
   -- architecture body
end architecture_soundchip_hdl;
