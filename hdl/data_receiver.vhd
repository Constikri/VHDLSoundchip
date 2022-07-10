--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: data_receiver.vhd
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

entity data_receiver is
port (
    --<port_name> : <direction> <type>;
    reset      : in std_logic;
    data_rdy   : in std_logic;
    data_in    : in std_logic_vector(31 downto 0);
    data_left  : OUT std_logic_vector(15 downto 0);
    data_right : OUT std_logic_vector(15 downto 0)
);
end data_receiver;
architecture architecture_data_receiver of data_receiver is

begin
    process(reset, data_rdy, data_in)
    begin
        if(reset = '1') then
            data_left  <= (others => '0');
            data_right <= (others => '0');
        else
            if(data_rdy = '1') then
                data_left <= data_in(15 downto 0);
                data_right <= data_in(31 downto 16);
            end if;
        end if;
    end process;
end architecture_data_receiver;
