--------------------------------------------------------------------------------
--
-- File: data_receiver.vhd
--
-- Targeted device: <Family::SmartFusion2> <Die::M2S010> <Package::256 VF>
-- Author: Constantin Krischke
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;

entity data_receiver is
port (
    -- Inputs
    reset      : in std_logic;
    data_rdy   : in std_logic;
    data_in    : in std_logic_vector(31 downto 0);
    
    -- Outputs
    dac_reset  : OUT std_logic;
    data_left  : OUT std_logic_vector(15 downto 0);
    data_right : OUT std_logic_vector(15 downto 0)
);
end data_receiver;
architecture architecture_data_receiver of data_receiver is

    signal data : std_logic_vector(31 downto 0); 
    
begin
    process(reset,data_rdy,data_in)
    begin
        if (reset = '1') then
            data <= (others => '0');
        else
            if (rising_edge(data_rdy)) then
                data <= data_in;
            end if;
        end if;
    end process;
    
    data_left <= data(31 downto 16);
    data_right <= data(15 downto 0);
    dac_reset <= reset or data_rdy;
    
end architecture_data_receiver;
