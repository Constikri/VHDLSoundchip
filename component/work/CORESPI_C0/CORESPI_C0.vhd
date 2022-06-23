----------------------------------------------------------------------
-- Created by SmartDesign Sun Jan 23 18:57:06 2022
-- Version: v2021.2 2021.2.0.11
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Component Description (Tcl) 
----------------------------------------------------------------------
--# Exporting Component Description of CORESPI_C0 to TCL
--# Family: SmartFusion2
--# Part Number: M2S010-VF256
--# Create and Configure the core component CORESPI_C0
--create_and_configure_core -core_vlnv {Actel:DirectCore:CORESPI:3.0.156} -component_name {CORESPI_C0} -params {\
--"USE_MASTER:0"  \
--"USE_SLAVE:1"   }
--# Exporting Component Description of CORESPI_C0 to TCL done

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion2;
use smartfusion2.all;
library CORESPI_LIB;
use CORESPI_LIB.all;
use CORESPI_LIB.components.all;
----------------------------------------------------------------------
-- CORESPI_C0 entity declaration
----------------------------------------------------------------------
entity CORESPI_C0 is
    -- Port list
    port(
        -- Inputs
        PADDR         : in  std_logic_vector(3 downto 0);
        PCLK          : in  std_logic;
        PENABLE       : in  std_logic;
        PRESETN       : in  std_logic;
        PSEL          : in  std_logic;
        PWDATA        : in  std_logic_vector(7 downto 0);
        PWRITE        : in  std_logic;
        m_miso        : in  std_logic;
        s_mosi        : in  std_logic;
        s_sck         : in  std_logic;
        s_ss          : in  std_logic;
        -- Outputs
        PRDATA        : out std_logic_vector(7 downto 0);
        enable_master : out std_logic;
        enable_slave  : out std_logic;
        interrupt     : out std_logic;
        m_mosi        : out std_logic;
        m_sck         : out std_logic;
        m_ss          : out std_logic_vector(7 downto 0);
        rx_data_ready : out std_logic;
        s_miso        : out std_logic;
        tx_reg_empty  : out std_logic
        );
end CORESPI_C0;
----------------------------------------------------------------------
-- CORESPI_C0 architecture body
----------------------------------------------------------------------
architecture RTL of CORESPI_C0 is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- CORESPI   -   Actel:DirectCore:CORESPI:3.0.156
-- using entity instantiation for component CORESPI
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal APBslave_PRDATA       : std_logic_vector(7 downto 0);
signal enable_master_net_0   : std_logic;
signal enable_slave_net_0    : std_logic;
signal interrupt_net_0       : std_logic;
signal m_mosi_net_0          : std_logic;
signal m_sck_net_0           : std_logic;
signal m_ss_net_0            : std_logic_vector(7 downto 0);
signal rx_data_ready_net_0   : std_logic;
signal s_miso_net_0          : std_logic;
signal tx_reg_empty_net_0    : std_logic;
signal enable_master_net_1   : std_logic;
signal enable_slave_net_1    : std_logic;
signal interrupt_net_1       : std_logic;
signal m_mosi_net_1          : std_logic;
signal m_sck_net_1           : std_logic;
signal rx_data_ready_net_1   : std_logic;
signal s_miso_net_1          : std_logic;
signal tx_reg_empty_net_1    : std_logic;
signal m_ss_net_1            : std_logic_vector(7 downto 0);
signal APBslave_PRDATA_net_0 : std_logic_vector(7 downto 0);

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 enable_master_net_1   <= enable_master_net_0;
 enable_master         <= enable_master_net_1;
 enable_slave_net_1    <= enable_slave_net_0;
 enable_slave          <= enable_slave_net_1;
 interrupt_net_1       <= interrupt_net_0;
 interrupt             <= interrupt_net_1;
 m_mosi_net_1          <= m_mosi_net_0;
 m_mosi                <= m_mosi_net_1;
 m_sck_net_1           <= m_sck_net_0;
 m_sck                 <= m_sck_net_1;
 rx_data_ready_net_1   <= rx_data_ready_net_0;
 rx_data_ready         <= rx_data_ready_net_1;
 s_miso_net_1          <= s_miso_net_0;
 s_miso                <= s_miso_net_1;
 tx_reg_empty_net_1    <= tx_reg_empty_net_0;
 tx_reg_empty          <= tx_reg_empty_net_1;
 m_ss_net_1            <= m_ss_net_0;
 m_ss(7 downto 0)      <= m_ss_net_1;
 APBslave_PRDATA_net_0 <= APBslave_PRDATA;
 PRDATA(7 downto 0)    <= APBslave_PRDATA_net_0;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- CORESPI_C0_0   -   Actel:DirectCore:CORESPI:3.0.156
CORESPI_C0_0 : entity CORESPI_LIB.CORESPI
    generic map( 
        FAMILY     => ( 15 ),
        USE_MASTER => ( 0 ),
        USE_SLAVE  => ( 1 )
        )
    port map( 
        -- Inputs
        PCLK          => PCLK,
        PENABLE       => PENABLE,
        PRESETN       => PRESETN,
        PSEL          => PSEL,
        PWRITE        => PWRITE,
        m_miso        => m_miso,
        s_mosi        => s_mosi,
        s_sck         => s_sck,
        s_ss          => s_ss,
        PADDR         => PADDR,
        PWDATA        => PWDATA,
        -- Outputs
        enable_master => enable_master_net_0,
        enable_slave  => enable_slave_net_0,
        interrupt     => interrupt_net_0,
        m_mosi        => m_mosi_net_0,
        m_sck         => m_sck_net_0,
        rx_data_ready => rx_data_ready_net_0,
        s_miso        => s_miso_net_0,
        tx_reg_empty  => tx_reg_empty_net_0,
        PRDATA        => APBslave_PRDATA,
        m_ss          => m_ss_net_0 
        );

end RTL;
