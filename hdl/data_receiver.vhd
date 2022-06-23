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
	port_name1 : IN  std_logic; -- example
    port_name2 : OUT std_logic_vector(1 downto 0)  -- example
    --<other_ports>;
);
end data_receiver;
architecture architecture_data_receiver of data_receiver is
   -- signal, component etc. declarations
   
   
   
	signal signal_name1 : std_logic; -- example
	signal signal_name2 : std_logic_vector(1 downto 0) ; -- example

begin
	
	-- CORESPI_0_0   -   Actel:DirectCore:CORESPI:3.0.156
CORESPI_0_0 : entity CORESPI_LIB.CORESPI
    generic map( 
        FAMILY     => ( 15 ),
        USE_MASTER => ( 0 ),
        USE_SLAVE  => ( 1 )
        )
    port map( 
        -- Inputs
        PADDR         => CoreAPB3_0_APBmslave0_PADDR_0,
        PCLK          => FAB_CCC_GL0_net_0,
        PENABLE       => CoreAPB3_0_APBmslave0_PENABLE,
        PRESETN       => MSS_READY_net_0,
        PSEL          => CoreAPB3_0_APBmslave0_PSELx,
        PWDATA        => CoreAPB3_0_APBmslave0_PWDATA_0,
        PWRITE        => CoreAPB3_0_APBmslave0_PWRITE,
        m_miso        => m_miso,
        s_mosi        => s_mosi,
        s_sck         => s_sck,
        s_ss          => s_ss,
        -- Outputs
        PRDATA        => CoreAPB3_0_APBmslave0_PRDATA,
        enable_master => enable_master_net_0,
        enable_slave  => enable_slave_net_0,
        interrupt     => CORESPI_0_0_interrupt,
        m_mosi        => m_mosi_net_0,
        m_sck         => m_sck_net_0,
        m_ss          => m_ss_net_0,
        rx_data_ready => CORESPI_0_0_rx_data_ready,
        s_miso        => s_miso_net_0,
        tx_reg_empty  => CORESPI_0_0_tx_reg_empty 
        );
-- CORESPI_0_0_intr_or_0
CORESPI_0_0_intr_or_0 : OR3
    port map( 
        -- Inputs
        A => CORESPI_0_0_tx_reg_empty,
        B => CORESPI_0_0_rx_data_ready,
        C => CORESPI_0_0_interrupt,
        -- Outputs
        Y => CORESPI_0_0_intr_or_0_Y 
        );
   -- architecture body
end architecture_data_receiver;
