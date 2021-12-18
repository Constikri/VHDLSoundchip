----------------------------------------------------------------------
-- Created by SmartDesign Wed Aug 18 14:23:39 2021
-- Version: v2021.1 2021.1.0.17
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion2;
use smartfusion2.all;
library COREAHBLITE_LIB;
use COREAHBLITE_LIB.all;
use COREAHBLITE_LIB.components.all;
library COREAHBLSRAM_OBF_LIB;
use COREAHBLSRAM_OBF_LIB.all;
library COREAHBTOAPB3_LIB;
use COREAHBTOAPB3_LIB.all;
use COREAHBTOAPB3_LIB.components.all;
library COREAPB3_LIB;
use COREAPB3_LIB.all;
use COREAPB3_LIB.components.all;
library COREGPIO_LIB;
use COREGPIO_LIB.all;
use COREGPIO_LIB.components.all;
library CORESPI_LIB;
use CORESPI_LIB.all;
use CORESPI_LIB.components.all;
----------------------------------------------------------------------
-- soundchip_sb entity declaration
----------------------------------------------------------------------
entity soundchip_sb is
    -- Port list
    port(
        -- Inputs
        DEVRST_N         : in    std_logic;
        FAB_RESET_N      : in    std_logic;
        GPIO_IN          : in    std_logic_vector(31 downto 0);
        I2C_0_BCLK       : in    std_logic;
        I2C_0_SCL_F2M    : in    std_logic;
        I2C_0_SDA_F2M    : in    std_logic;
        MMUART_0_RXD_F2M : in    std_logic;
        MMUART_1_RXD_F2M : in    std_logic;
        SPI_0_DI         : in    std_logic;
        m_miso           : in    std_logic;
        s_mosi           : in    std_logic;
        s_sck            : in    std_logic;
        s_ss             : in    std_logic;
        -- Outputs
        FAB_CCC_GL0      : out   std_logic;
        FAB_CCC_LOCK     : out   std_logic;
        GPIO_OE          : out   std_logic_vector(31 downto 0);
        GPIO_OUT         : out   std_logic_vector(31 downto 0);
        I2C_0_SCL_M2F    : out   std_logic;
        I2C_0_SCL_M2F_OE : out   std_logic;
        I2C_0_SDA_M2F    : out   std_logic;
        I2C_0_SDA_M2F_OE : out   std_logic;
        INIT_DONE        : out   std_logic;
        INT              : out   std_logic_vector(31 downto 0);
        MMUART_0_TXD_M2F : out   std_logic;
        MMUART_1_TXD_M2F : out   std_logic;
        MSS_READY        : out   std_logic;
        POWER_ON_RESET_N : out   std_logic;
        RCOSC_1MHZ_CCC   : out   std_logic;
        RCOSC_1MHZ_O2F   : out   std_logic;
        SPI_0_DO         : out   std_logic;
        enable_master    : out   std_logic;
        enable_slave     : out   std_logic;
        m_mosi           : out   std_logic;
        m_sck            : out   std_logic;
        m_ss             : out   std_logic_vector(7 downto 0);
        s_miso           : out   std_logic;
        -- Inouts
        SPI_0_CLK        : inout std_logic;
        SPI_0_SS0        : inout std_logic
        );
end soundchip_sb;
----------------------------------------------------------------------
-- soundchip_sb architecture body
----------------------------------------------------------------------
architecture RTL of soundchip_sb is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- soundchip_sb_CCC_0_FCCC   -   Actel:SgCore:FCCC:2.0.201
component soundchip_sb_CCC_0_FCCC
    -- Port list
    port(
        -- Inputs
        RCOSC_1MHZ : in  std_logic;
        -- Outputs
        GL0        : out std_logic;
        LOCK       : out std_logic
        );
end component;
-- CoreAHBLite   -   Actel:DirectCore:CoreAHBLite:5.2.100
-- using entity instantiation for component CoreAHBLite
-- soundchip_sb_COREAHBLSRAM_0_0_COREAHBLSRAM   -   Actel:DirectCore:COREAHBLSRAM:2.0.113
component soundchip_sb_COREAHBLSRAM_0_0_COREAHBLSRAM
    generic( 
        AHB_AWIDTH                   : integer := 32 ;
        AHB_DWIDTH                   : integer := 32 ;
        FAMILY                       : integer := 19 ;
        LSRAM_NUM_LOCATIONS_DWIDTH32 : integer := 2048 ;
        SEL_SRAM_TYPE                : integer := 0 ;
        USRAM_NUM_LOCATIONS_DWIDTH32 : integer := 512 
        );
    -- Port list
    port(
        -- Inputs
        HADDR     : in  std_logic_vector(31 downto 0);
        HBURST    : in  std_logic_vector(2 downto 0);
        HCLK      : in  std_logic;
        HREADYIN  : in  std_logic;
        HRESETN   : in  std_logic;
        HSEL      : in  std_logic;
        HSIZE     : in  std_logic_vector(2 downto 0);
        HTRANS    : in  std_logic_vector(1 downto 0);
        HWDATA    : in  std_logic_vector(31 downto 0);
        HWRITE    : in  std_logic;
        -- Outputs
        HRDATA    : out std_logic_vector(31 downto 0);
        HREADYOUT : out std_logic;
        HRESP     : out std_logic_vector(1 downto 0)
        );
end component;
-- COREAHBTOAPB3   -   Actel:DirectCore:COREAHBTOAPB3:3.1.100
-- using entity instantiation for component COREAHBTOAPB3
-- CoreAPB3   -   Actel:DirectCore:CoreAPB3:4.1.100
-- using entity instantiation for component CoreAPB3
-- CoreGPIO   -   Actel:DirectCore:CoreGPIO:3.0.120
-- using entity instantiation for component CoreGPIO
-- CoreResetP   -   Actel:DirectCore:CoreResetP:7.1.100
component CoreResetP
    generic( 
        DDR_WAIT            : integer := 200 ;
        DEVICE_090          : integer := 0 ;
        DEVICE_VOLTAGE      : integer := 2 ;
        ENABLE_SOFT_RESETS  : integer := 0 ;
        EXT_RESET_CFG       : integer := 0 ;
        FDDR_IN_USE         : integer := 0 ;
        MDDR_IN_USE         : integer := 0 ;
        SDIF0_IN_USE        : integer := 0 ;
        SDIF0_PCIE          : integer := 0 ;
        SDIF0_PCIE_HOTRESET : integer := 1 ;
        SDIF0_PCIE_L2P2     : integer := 1 ;
        SDIF1_IN_USE        : integer := 0 ;
        SDIF1_PCIE          : integer := 0 ;
        SDIF1_PCIE_HOTRESET : integer := 1 ;
        SDIF1_PCIE_L2P2     : integer := 1 ;
        SDIF2_IN_USE        : integer := 0 ;
        SDIF2_PCIE          : integer := 0 ;
        SDIF2_PCIE_HOTRESET : integer := 1 ;
        SDIF2_PCIE_L2P2     : integer := 1 ;
        SDIF3_IN_USE        : integer := 0 ;
        SDIF3_PCIE          : integer := 0 ;
        SDIF3_PCIE_HOTRESET : integer := 1 ;
        SDIF3_PCIE_L2P2     : integer := 1 
        );
    -- Port list
    port(
        -- Inputs
        CLK_BASE                       : in  std_logic;
        CLK_LTSSM                      : in  std_logic;
        CONFIG1_DONE                   : in  std_logic;
        CONFIG2_DONE                   : in  std_logic;
        FAB_RESET_N                    : in  std_logic;
        FIC_2_APB_M_PRESET_N           : in  std_logic;
        FPLL_LOCK                      : in  std_logic;
        POWER_ON_RESET_N               : in  std_logic;
        RCOSC_25_50MHZ                 : in  std_logic;
        RESET_N_M2F                    : in  std_logic;
        SDIF0_PERST_N                  : in  std_logic;
        SDIF0_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF0_PSEL                     : in  std_logic;
        SDIF0_PWRITE                   : in  std_logic;
        SDIF0_SPLL_LOCK                : in  std_logic;
        SDIF1_PERST_N                  : in  std_logic;
        SDIF1_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF1_PSEL                     : in  std_logic;
        SDIF1_PWRITE                   : in  std_logic;
        SDIF1_SPLL_LOCK                : in  std_logic;
        SDIF2_PERST_N                  : in  std_logic;
        SDIF2_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF2_PSEL                     : in  std_logic;
        SDIF2_PWRITE                   : in  std_logic;
        SDIF2_SPLL_LOCK                : in  std_logic;
        SDIF3_PERST_N                  : in  std_logic;
        SDIF3_PRDATA                   : in  std_logic_vector(31 downto 0);
        SDIF3_PSEL                     : in  std_logic;
        SDIF3_PWRITE                   : in  std_logic;
        SDIF3_SPLL_LOCK                : in  std_logic;
        SOFT_EXT_RESET_OUT             : in  std_logic;
        SOFT_FDDR_CORE_RESET           : in  std_logic;
        SOFT_M3_RESET                  : in  std_logic;
        SOFT_MDDR_DDR_AXI_S_CORE_RESET : in  std_logic;
        SOFT_RESET_F2M                 : in  std_logic;
        SOFT_SDIF0_0_CORE_RESET        : in  std_logic;
        SOFT_SDIF0_1_CORE_RESET        : in  std_logic;
        SOFT_SDIF0_CORE_RESET          : in  std_logic;
        SOFT_SDIF0_PHY_RESET           : in  std_logic;
        SOFT_SDIF1_CORE_RESET          : in  std_logic;
        SOFT_SDIF1_PHY_RESET           : in  std_logic;
        SOFT_SDIF2_CORE_RESET          : in  std_logic;
        SOFT_SDIF2_PHY_RESET           : in  std_logic;
        SOFT_SDIF3_CORE_RESET          : in  std_logic;
        SOFT_SDIF3_PHY_RESET           : in  std_logic;
        -- Outputs
        DDR_READY                      : out std_logic;
        EXT_RESET_OUT                  : out std_logic;
        FDDR_CORE_RESET_N              : out std_logic;
        INIT_DONE                      : out std_logic;
        M3_RESET_N                     : out std_logic;
        MDDR_DDR_AXI_S_CORE_RESET_N    : out std_logic;
        MSS_HPMS_READY                 : out std_logic;
        RESET_N_F2M                    : out std_logic;
        SDIF0_0_CORE_RESET_N           : out std_logic;
        SDIF0_1_CORE_RESET_N           : out std_logic;
        SDIF0_CORE_RESET_N             : out std_logic;
        SDIF0_PHY_RESET_N              : out std_logic;
        SDIF1_CORE_RESET_N             : out std_logic;
        SDIF1_PHY_RESET_N              : out std_logic;
        SDIF2_CORE_RESET_N             : out std_logic;
        SDIF2_PHY_RESET_N              : out std_logic;
        SDIF3_CORE_RESET_N             : out std_logic;
        SDIF3_PHY_RESET_N              : out std_logic;
        SDIF_READY                     : out std_logic;
        SDIF_RELEASED                  : out std_logic
        );
end component;
-- CORESPI   -   Actel:DirectCore:CORESPI:3.0.156
-- using entity instantiation for component CORESPI
-- OR3
component OR3
    -- Port list
    port(
        -- Inputs
        A : in  std_logic;
        B : in  std_logic;
        C : in  std_logic;
        -- Outputs
        Y : out std_logic
        );
end component;
-- CoreTimer   -   Actel:DirectCore:CoreTimer:1.1.101
component CoreTimer
    generic( 
        INTACTIVEH : integer := 1 ;
        WIDTH      : integer := 32 
        );
    -- Port list
    port(
        -- Inputs
        PADDR   : in  std_logic_vector(4 downto 2);
        PCLK    : in  std_logic;
        PENABLE : in  std_logic;
        PRESETn : in  std_logic;
        PSEL    : in  std_logic;
        PWDATA  : in  std_logic_vector(31 downto 0);
        PWRITE  : in  std_logic;
        -- Outputs
        PRDATA  : out std_logic_vector(31 downto 0);
        TIMINT  : out std_logic
        );
end component;
-- soundchip_sb_FABOSC_0_OSC   -   Actel:SgCore:OSC:2.0.101
component soundchip_sb_FABOSC_0_OSC
    -- Port list
    port(
        -- Inputs
        XTL                : in  std_logic;
        -- Outputs
        RCOSC_1MHZ_CCC     : out std_logic;
        RCOSC_1MHZ_O2F     : out std_logic;
        RCOSC_25_50MHZ_CCC : out std_logic;
        RCOSC_25_50MHZ_O2F : out std_logic;
        XTLOSC_CCC         : out std_logic;
        XTLOSC_O2F         : out std_logic
        );
end component;
-- soundchip_sb_MSS
component soundchip_sb_MSS
    -- Port list
    port(
        -- Inputs
        FIC_0_AHB_M_HRDATA     : in    std_logic_vector(31 downto 0);
        FIC_0_AHB_M_HREADY     : in    std_logic;
        FIC_0_AHB_M_HRESP      : in    std_logic;
        FIC_2_APB_M_PRDATA     : in    std_logic_vector(31 downto 0);
        FIC_2_APB_M_PREADY     : in    std_logic;
        FIC_2_APB_M_PSLVERR    : in    std_logic;
        I2C_0_BCLK             : in    std_logic;
        I2C_0_SCL_F2M          : in    std_logic;
        I2C_0_SDA_F2M          : in    std_logic;
        MCCC_CLK_BASE          : in    std_logic;
        MCCC_CLK_BASE_PLL_LOCK : in    std_logic;
        MMUART_0_RXD_F2M       : in    std_logic;
        MMUART_1_RXD_F2M       : in    std_logic;
        MSS_INT_F2M            : in    std_logic_vector(15 downto 0);
        MSS_RESET_N_F2M        : in    std_logic;
        SPI_0_DI               : in    std_logic;
        -- Outputs
        FIC_0_AHB_M_HADDR      : out   std_logic_vector(31 downto 0);
        FIC_0_AHB_M_HSIZE      : out   std_logic_vector(1 downto 0);
        FIC_0_AHB_M_HTRANS     : out   std_logic_vector(1 downto 0);
        FIC_0_AHB_M_HWDATA     : out   std_logic_vector(31 downto 0);
        FIC_0_AHB_M_HWRITE     : out   std_logic;
        FIC_2_APB_M_PADDR      : out   std_logic_vector(15 downto 2);
        FIC_2_APB_M_PCLK       : out   std_logic;
        FIC_2_APB_M_PENABLE    : out   std_logic;
        FIC_2_APB_M_PRESET_N   : out   std_logic;
        FIC_2_APB_M_PSEL       : out   std_logic;
        FIC_2_APB_M_PWDATA     : out   std_logic_vector(31 downto 0);
        FIC_2_APB_M_PWRITE     : out   std_logic;
        I2C_0_SCL_M2F          : out   std_logic;
        I2C_0_SCL_M2F_OE       : out   std_logic;
        I2C_0_SDA_M2F          : out   std_logic;
        I2C_0_SDA_M2F_OE       : out   std_logic;
        MMUART_0_TXD_M2F       : out   std_logic;
        MMUART_1_TXD_M2F       : out   std_logic;
        MSS_RESET_N_M2F        : out   std_logic;
        SPI_0_DO               : out   std_logic;
        -- Inouts
        SPI_0_CLK              : inout std_logic;
        SPI_0_SS0              : inout std_logic
        );
end component;
-- SYSRESET
component SYSRESET
    -- Port list
    port(
        -- Inputs
        DEVRST_N         : in  std_logic;
        -- Outputs
        POWER_ON_RESET_N : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal CoreAHBLite_0_AHBmslave0_HADDR                 : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave0_HBURST                : std_logic_vector(2 downto 0);
signal CoreAHBLite_0_AHBmslave0_HMASTLOCK             : std_logic;
signal CoreAHBLite_0_AHBmslave0_HPROT                 : std_logic_vector(3 downto 0);
signal CoreAHBLite_0_AHBmslave0_HRDATA                : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave0_HREADY                : std_logic;
signal CoreAHBLite_0_AHBmslave0_HREADYOUT             : std_logic;
signal CoreAHBLite_0_AHBmslave0_HRESP                 : std_logic_vector(1 downto 0);
signal CoreAHBLite_0_AHBmslave0_HSELx                 : std_logic;
signal CoreAHBLite_0_AHBmslave0_HSIZE                 : std_logic_vector(2 downto 0);
signal CoreAHBLite_0_AHBmslave0_HTRANS                : std_logic_vector(1 downto 0);
signal CoreAHBLite_0_AHBmslave0_HWDATA                : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave0_HWRITE                : std_logic;
signal CoreAHBLite_0_AHBmslave1_HADDR                 : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave1_HBURST                : std_logic_vector(2 downto 0);
signal CoreAHBLite_0_AHBmslave1_HMASTLOCK             : std_logic;
signal CoreAHBLite_0_AHBmslave1_HPROT                 : std_logic_vector(3 downto 0);
signal CoreAHBLite_0_AHBmslave1_HRDATA                : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave1_HREADY                : std_logic;
signal CoreAHBLite_0_AHBmslave1_HREADYOUT             : std_logic;
signal CoreAHBLite_0_AHBmslave1_HRESP                 : std_logic_vector(1 downto 0);
signal CoreAHBLite_0_AHBmslave1_HSELx                 : std_logic;
signal CoreAHBLite_0_AHBmslave1_HSIZE                 : std_logic_vector(2 downto 0);
signal CoreAHBLite_0_AHBmslave1_HTRANS                : std_logic_vector(1 downto 0);
signal CoreAHBLite_0_AHBmslave1_HWDATA                : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave1_HWRITE                : std_logic;
signal COREAHBTOAPB3_0_APBmaster_PADDR                : std_logic_vector(31 downto 0);
signal COREAHBTOAPB3_0_APBmaster_PENABLE              : std_logic;
signal COREAHBTOAPB3_0_APBmaster_PRDATA               : std_logic_vector(31 downto 0);
signal COREAHBTOAPB3_0_APBmaster_PREADY               : std_logic;
signal COREAHBTOAPB3_0_APBmaster_PSELx                : std_logic;
signal COREAHBTOAPB3_0_APBmaster_PSLVERR              : std_logic;
signal COREAHBTOAPB3_0_APBmaster_PWDATA               : std_logic_vector(31 downto 0);
signal COREAHBTOAPB3_0_APBmaster_PWRITE               : std_logic;
signal CoreAPB3_0_APBmslave0_PENABLE                  : std_logic;
signal CoreAPB3_0_APBmslave0_PSELx                    : std_logic;
signal CoreAPB3_0_APBmslave0_PWRITE                   : std_logic;
signal CoreAPB3_0_APBmslave1_PRDATA                   : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave1_PREADY                   : std_logic;
signal CoreAPB3_0_APBmslave1_PSELx                    : std_logic;
signal CoreAPB3_0_APBmslave1_PSLVERR                  : std_logic;
signal CoreAPB3_0_APBmslave2_PRDATA                   : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave2_PSELx                    : std_logic;
signal CORERESETP_0_RESET_N_F2M                       : std_logic;
signal CORESPI_0_0_interrupt                          : std_logic;
signal CORESPI_0_0_intr_or_0_Y                        : std_logic;
signal CORESPI_0_0_rx_data_ready                      : std_logic;
signal CORESPI_0_0_tx_reg_empty                       : std_logic;
signal CoreTimer_0_0_TIMINT                           : std_logic;
signal enable_master_net_0                            : std_logic;
signal enable_slave_net_0                             : std_logic;
signal FAB_CCC_GL0_net_0                              : std_logic;
signal FAB_CCC_LOCK_net_0                             : std_logic;
signal FABOSC_0_RCOSC_25_50MHZ_O2F                    : std_logic;
signal GPIO_OE_net_0                                  : std_logic_vector(31 downto 0);
signal GPIO_OUT_net_0                                 : std_logic_vector(31 downto 0);
signal I2C_0_SCL_M2F_net_0                            : std_logic;
signal I2C_0_SCL_M2F_OE_net_0                         : std_logic;
signal I2C_0_SDA_M2F_net_0                            : std_logic;
signal I2C_0_SDA_M2F_OE_net_0                         : std_logic;
signal INIT_DONE_net_0                                : std_logic;
signal INT_net_0                                      : std_logic_vector(31 downto 0);
signal m_mosi_net_0                                   : std_logic;
signal m_sck_net_0                                    : std_logic;
signal m_ss_net_0                                     : std_logic_vector(7 downto 0);
signal MMUART_0_TXD_M2F_net_0                         : std_logic;
signal MMUART_1_TXD_M2F_net_0                         : std_logic;
signal MSS_READY_net_0                                : std_logic;
signal POWER_ON_RESET_N_net_0                         : std_logic;
signal RCOSC_1MHZ_CCC_OUT_RCOSC_1MHZ_CCC              : std_logic;
signal RCOSC_1MHZ_O2F_net_0                           : std_logic;
signal s_miso_net_0                                   : std_logic;
signal soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HADDR  : std_logic_vector(31 downto 0);
signal soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRDATA : std_logic_vector(31 downto 0);
signal soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HREADY : std_logic;
signal soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HTRANS : std_logic_vector(1 downto 0);
signal soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HWDATA : std_logic_vector(31 downto 0);
signal soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HWRITE : std_logic;
signal soundchip_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N    : std_logic;
signal soundchip_sb_MSS_TMP_0_MSS_RESET_N_M2F         : std_logic;
signal SPI_0_DO_net_0                                 : std_logic;
signal SPI_0_DO_net_1                                 : std_logic;
signal POWER_ON_RESET_N_net_1                         : std_logic;
signal INIT_DONE_net_1                                : std_logic;
signal RCOSC_1MHZ_CCC_OUT_RCOSC_1MHZ_CCC_net_0        : std_logic;
signal RCOSC_1MHZ_O2F_net_1                           : std_logic;
signal FAB_CCC_GL0_net_1                              : std_logic;
signal FAB_CCC_LOCK_net_1                             : std_logic;
signal MSS_READY_net_1                                : std_logic;
signal INT_net_1                                      : std_logic_vector(31 downto 0);
signal GPIO_OUT_net_1                                 : std_logic_vector(31 downto 0);
signal GPIO_OE_net_1                                  : std_logic_vector(31 downto 0);
signal enable_master_net_1                            : std_logic;
signal enable_slave_net_1                             : std_logic;
signal m_mosi_net_1                                   : std_logic;
signal m_sck_net_1                                    : std_logic;
signal m_ss_net_1                                     : std_logic_vector(7 downto 0);
signal s_miso_net_1                                   : std_logic;
signal I2C_0_SDA_M2F_net_1                            : std_logic;
signal I2C_0_SDA_M2F_OE_net_1                         : std_logic;
signal I2C_0_SCL_M2F_net_1                            : std_logic;
signal I2C_0_SCL_M2F_OE_net_1                         : std_logic;
signal MMUART_0_TXD_M2F_net_1                         : std_logic;
signal MMUART_1_TXD_M2F_net_1                         : std_logic;
signal MSS_INT_F2M_net_0                              : std_logic_vector(15 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net                                        : std_logic;
signal VCC_net                                        : std_logic;
signal PADDR_const_net_0                              : std_logic_vector(7 downto 2);
signal PWDATA_const_net_0                             : std_logic_vector(7 downto 0);
signal IADDR_const_net_0                              : std_logic_vector(31 downto 0);
signal SDIF0_PRDATA_const_net_0                       : std_logic_vector(31 downto 0);
signal SDIF1_PRDATA_const_net_0                       : std_logic_vector(31 downto 0);
signal SDIF2_PRDATA_const_net_0                       : std_logic_vector(31 downto 0);
signal SDIF3_PRDATA_const_net_0                       : std_logic_vector(31 downto 0);
signal HBURST_M0_const_net_0                          : std_logic_vector(2 downto 0);
signal HPROT_M0_const_net_0                           : std_logic_vector(3 downto 0);
signal HADDR_M1_const_net_0                           : std_logic_vector(31 downto 0);
signal HTRANS_M1_const_net_0                          : std_logic_vector(1 downto 0);
signal HSIZE_M1_const_net_0                           : std_logic_vector(2 downto 0);
signal HBURST_M1_const_net_0                          : std_logic_vector(2 downto 0);
signal HPROT_M1_const_net_0                           : std_logic_vector(3 downto 0);
signal HWDATA_M1_const_net_0                          : std_logic_vector(31 downto 0);
signal HADDR_M2_const_net_0                           : std_logic_vector(31 downto 0);
signal HTRANS_M2_const_net_0                          : std_logic_vector(1 downto 0);
signal HSIZE_M2_const_net_0                           : std_logic_vector(2 downto 0);
signal HBURST_M2_const_net_0                          : std_logic_vector(2 downto 0);
signal HPROT_M2_const_net_0                           : std_logic_vector(3 downto 0);
signal HWDATA_M2_const_net_0                          : std_logic_vector(31 downto 0);
signal HADDR_M3_const_net_0                           : std_logic_vector(31 downto 0);
signal HTRANS_M3_const_net_0                          : std_logic_vector(1 downto 0);
signal HSIZE_M3_const_net_0                           : std_logic_vector(2 downto 0);
signal HBURST_M3_const_net_0                          : std_logic_vector(2 downto 0);
signal HPROT_M3_const_net_0                           : std_logic_vector(3 downto 0);
signal HWDATA_M3_const_net_0                          : std_logic_vector(31 downto 0);
signal HRDATA_S2_const_net_0                          : std_logic_vector(31 downto 0);
signal HRESP_S2_const_net_0                           : std_logic_vector(1 downto 0);
signal HRDATA_S3_const_net_0                          : std_logic_vector(31 downto 0);
signal HRESP_S3_const_net_0                           : std_logic_vector(1 downto 0);
signal HRDATA_S4_const_net_0                          : std_logic_vector(31 downto 0);
signal HRESP_S4_const_net_0                           : std_logic_vector(1 downto 0);
signal HRDATA_S5_const_net_0                          : std_logic_vector(31 downto 0);
signal HRESP_S5_const_net_0                           : std_logic_vector(1 downto 0);
signal HRDATA_S6_const_net_0                          : std_logic_vector(31 downto 0);
signal HRESP_S6_const_net_0                           : std_logic_vector(1 downto 0);
signal HRDATA_S7_const_net_0                          : std_logic_vector(31 downto 0);
signal HRESP_S7_const_net_0                           : std_logic_vector(1 downto 0);
signal HRDATA_S8_const_net_0                          : std_logic_vector(31 downto 0);
signal HRESP_S8_const_net_0                           : std_logic_vector(1 downto 0);
signal HRDATA_S9_const_net_0                          : std_logic_vector(31 downto 0);
signal HRESP_S9_const_net_0                           : std_logic_vector(1 downto 0);
signal HRDATA_S10_const_net_0                         : std_logic_vector(31 downto 0);
signal HRESP_S10_const_net_0                          : std_logic_vector(1 downto 0);
signal HRDATA_S11_const_net_0                         : std_logic_vector(31 downto 0);
signal HRESP_S11_const_net_0                          : std_logic_vector(1 downto 0);
signal HRDATA_S12_const_net_0                         : std_logic_vector(31 downto 0);
signal HRESP_S12_const_net_0                          : std_logic_vector(1 downto 0);
signal HRDATA_S13_const_net_0                         : std_logic_vector(31 downto 0);
signal HRESP_S13_const_net_0                          : std_logic_vector(1 downto 0);
signal HRDATA_S14_const_net_0                         : std_logic_vector(31 downto 0);
signal HRESP_S14_const_net_0                          : std_logic_vector(1 downto 0);
signal HRDATA_S15_const_net_0                         : std_logic_vector(31 downto 0);
signal HRESP_S15_const_net_0                          : std_logic_vector(1 downto 0);
signal HRDATA_S16_const_net_0                         : std_logic_vector(31 downto 0);
signal HRESP_S16_const_net_0                          : std_logic_vector(1 downto 0);
signal PRDATAS3_const_net_0                           : std_logic_vector(31 downto 0);
signal PRDATAS4_const_net_0                           : std_logic_vector(31 downto 0);
signal PRDATAS5_const_net_0                           : std_logic_vector(31 downto 0);
signal PRDATAS6_const_net_0                           : std_logic_vector(31 downto 0);
signal PRDATAS7_const_net_0                           : std_logic_vector(31 downto 0);
signal PRDATAS8_const_net_0                           : std_logic_vector(31 downto 0);
signal PRDATAS9_const_net_0                           : std_logic_vector(31 downto 0);
signal PRDATAS10_const_net_0                          : std_logic_vector(31 downto 0);
signal PRDATAS11_const_net_0                          : std_logic_vector(31 downto 0);
signal PRDATAS12_const_net_0                          : std_logic_vector(31 downto 0);
signal PRDATAS13_const_net_0                          : std_logic_vector(31 downto 0);
signal PRDATAS14_const_net_0                          : std_logic_vector(31 downto 0);
signal PRDATAS15_const_net_0                          : std_logic_vector(31 downto 0);
signal PRDATAS16_const_net_0                          : std_logic_vector(31 downto 0);
signal FIC_2_APB_M_PRDATA_const_net_0                 : std_logic_vector(31 downto 0);
----------------------------------------------------------------------
-- Bus Interface Nets Declarations - Unequal Pin Widths
----------------------------------------------------------------------
signal CoreAPB3_0_APBmslave0_PADDR                    : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_0                  : std_logic_vector(3 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_0_3to0             : std_logic_vector(3 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_1                  : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_1_7to0             : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_2                  : std_logic_vector(4 downto 2);
signal CoreAPB3_0_APBmslave0_PADDR_2_4to2             : std_logic_vector(4 downto 2);

signal CoreAPB3_0_APBmslave0_PRDATA                   : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PRDATA_0                 : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave0_PRDATA_0_31to8           : std_logic_vector(31 downto 8);
signal CoreAPB3_0_APBmslave0_PRDATA_0_7to0            : std_logic_vector(7 downto 0);

signal CoreAPB3_0_APBmslave0_PWDATA                   : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_0                 : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PWDATA_0_7to0            : std_logic_vector(7 downto 0);

signal soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP  : std_logic_vector(1 downto 0);
signal soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP_0: std_logic;
signal soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP_0_0to0: std_logic_vector(0 to 0);

signal soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE  : std_logic_vector(1 downto 0);
signal soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0: std_logic_vector(2 downto 0);
signal soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0_1to0: std_logic_vector(1 downto 0);
signal soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0_2to2: std_logic_vector(2 to 2);


begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 GND_net                        <= '0';
 VCC_net                        <= '1';
 PADDR_const_net_0              <= B"000000";
 PWDATA_const_net_0             <= B"00000000";
 IADDR_const_net_0              <= B"00000000000000000000000000000000";
 SDIF0_PRDATA_const_net_0       <= B"00000000000000000000000000000000";
 SDIF1_PRDATA_const_net_0       <= B"00000000000000000000000000000000";
 SDIF2_PRDATA_const_net_0       <= B"00000000000000000000000000000000";
 SDIF3_PRDATA_const_net_0       <= B"00000000000000000000000000000000";
 HBURST_M0_const_net_0          <= B"000";
 HPROT_M0_const_net_0           <= B"0000";
 HADDR_M1_const_net_0           <= B"00000000000000000000000000000000";
 HTRANS_M1_const_net_0          <= B"00";
 HSIZE_M1_const_net_0           <= B"000";
 HBURST_M1_const_net_0          <= B"000";
 HPROT_M1_const_net_0           <= B"0000";
 HWDATA_M1_const_net_0          <= B"00000000000000000000000000000000";
 HADDR_M2_const_net_0           <= B"00000000000000000000000000000000";
 HTRANS_M2_const_net_0          <= B"00";
 HSIZE_M2_const_net_0           <= B"000";
 HBURST_M2_const_net_0          <= B"000";
 HPROT_M2_const_net_0           <= B"0000";
 HWDATA_M2_const_net_0          <= B"00000000000000000000000000000000";
 HADDR_M3_const_net_0           <= B"00000000000000000000000000000000";
 HTRANS_M3_const_net_0          <= B"00";
 HSIZE_M3_const_net_0           <= B"000";
 HBURST_M3_const_net_0          <= B"000";
 HPROT_M3_const_net_0           <= B"0000";
 HWDATA_M3_const_net_0          <= B"00000000000000000000000000000000";
 HRDATA_S2_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S2_const_net_0           <= B"00";
 HRDATA_S3_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S3_const_net_0           <= B"00";
 HRDATA_S4_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S4_const_net_0           <= B"00";
 HRDATA_S5_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S5_const_net_0           <= B"00";
 HRDATA_S6_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S6_const_net_0           <= B"00";
 HRDATA_S7_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S7_const_net_0           <= B"00";
 HRDATA_S8_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S8_const_net_0           <= B"00";
 HRDATA_S9_const_net_0          <= B"00000000000000000000000000000000";
 HRESP_S9_const_net_0           <= B"00";
 HRDATA_S10_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S10_const_net_0          <= B"00";
 HRDATA_S11_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S11_const_net_0          <= B"00";
 HRDATA_S12_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S12_const_net_0          <= B"00";
 HRDATA_S13_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S13_const_net_0          <= B"00";
 HRDATA_S14_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S14_const_net_0          <= B"00";
 HRDATA_S15_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S15_const_net_0          <= B"00";
 HRDATA_S16_const_net_0         <= B"00000000000000000000000000000000";
 HRESP_S16_const_net_0          <= B"00";
 PRDATAS3_const_net_0           <= B"00000000000000000000000000000000";
 PRDATAS4_const_net_0           <= B"00000000000000000000000000000000";
 PRDATAS5_const_net_0           <= B"00000000000000000000000000000000";
 PRDATAS6_const_net_0           <= B"00000000000000000000000000000000";
 PRDATAS7_const_net_0           <= B"00000000000000000000000000000000";
 PRDATAS8_const_net_0           <= B"00000000000000000000000000000000";
 PRDATAS9_const_net_0           <= B"00000000000000000000000000000000";
 PRDATAS10_const_net_0          <= B"00000000000000000000000000000000";
 PRDATAS11_const_net_0          <= B"00000000000000000000000000000000";
 PRDATAS12_const_net_0          <= B"00000000000000000000000000000000";
 PRDATAS13_const_net_0          <= B"00000000000000000000000000000000";
 PRDATAS14_const_net_0          <= B"00000000000000000000000000000000";
 PRDATAS15_const_net_0          <= B"00000000000000000000000000000000";
 PRDATAS16_const_net_0          <= B"00000000000000000000000000000000";
 FIC_2_APB_M_PRDATA_const_net_0 <= B"00000000000000000000000000000000";
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 SPI_0_DO_net_1                          <= SPI_0_DO_net_0;
 SPI_0_DO                                <= SPI_0_DO_net_1;
 POWER_ON_RESET_N_net_1                  <= POWER_ON_RESET_N_net_0;
 POWER_ON_RESET_N                        <= POWER_ON_RESET_N_net_1;
 INIT_DONE_net_1                         <= INIT_DONE_net_0;
 INIT_DONE                               <= INIT_DONE_net_1;
 RCOSC_1MHZ_CCC_OUT_RCOSC_1MHZ_CCC_net_0 <= RCOSC_1MHZ_CCC_OUT_RCOSC_1MHZ_CCC;
 RCOSC_1MHZ_CCC                          <= RCOSC_1MHZ_CCC_OUT_RCOSC_1MHZ_CCC_net_0;
 RCOSC_1MHZ_O2F_net_1                    <= RCOSC_1MHZ_O2F_net_0;
 RCOSC_1MHZ_O2F                          <= RCOSC_1MHZ_O2F_net_1;
 FAB_CCC_GL0_net_1                       <= FAB_CCC_GL0_net_0;
 FAB_CCC_GL0                             <= FAB_CCC_GL0_net_1;
 FAB_CCC_LOCK_net_1                      <= FAB_CCC_LOCK_net_0;
 FAB_CCC_LOCK                            <= FAB_CCC_LOCK_net_1;
 MSS_READY_net_1                         <= MSS_READY_net_0;
 MSS_READY                               <= MSS_READY_net_1;
 INT_net_1                               <= INT_net_0;
 INT(31 downto 0)                        <= INT_net_1;
 GPIO_OUT_net_1                          <= GPIO_OUT_net_0;
 GPIO_OUT(31 downto 0)                   <= GPIO_OUT_net_1;
 GPIO_OE_net_1                           <= GPIO_OE_net_0;
 GPIO_OE(31 downto 0)                    <= GPIO_OE_net_1;
 enable_master_net_1                     <= enable_master_net_0;
 enable_master                           <= enable_master_net_1;
 enable_slave_net_1                      <= enable_slave_net_0;
 enable_slave                            <= enable_slave_net_1;
 m_mosi_net_1                            <= m_mosi_net_0;
 m_mosi                                  <= m_mosi_net_1;
 m_sck_net_1                             <= m_sck_net_0;
 m_sck                                   <= m_sck_net_1;
 m_ss_net_1                              <= m_ss_net_0;
 m_ss(7 downto 0)                        <= m_ss_net_1;
 s_miso_net_1                            <= s_miso_net_0;
 s_miso                                  <= s_miso_net_1;
 I2C_0_SDA_M2F_net_1                     <= I2C_0_SDA_M2F_net_0;
 I2C_0_SDA_M2F                           <= I2C_0_SDA_M2F_net_1;
 I2C_0_SDA_M2F_OE_net_1                  <= I2C_0_SDA_M2F_OE_net_0;
 I2C_0_SDA_M2F_OE                        <= I2C_0_SDA_M2F_OE_net_1;
 I2C_0_SCL_M2F_net_1                     <= I2C_0_SCL_M2F_net_0;
 I2C_0_SCL_M2F                           <= I2C_0_SCL_M2F_net_1;
 I2C_0_SCL_M2F_OE_net_1                  <= I2C_0_SCL_M2F_OE_net_0;
 I2C_0_SCL_M2F_OE                        <= I2C_0_SCL_M2F_OE_net_1;
 MMUART_0_TXD_M2F_net_1                  <= MMUART_0_TXD_M2F_net_0;
 MMUART_0_TXD_M2F                        <= MMUART_0_TXD_M2F_net_1;
 MMUART_1_TXD_M2F_net_1                  <= MMUART_1_TXD_M2F_net_0;
 MMUART_1_TXD_M2F                        <= MMUART_1_TXD_M2F_net_1;
----------------------------------------------------------------------
-- Concatenation assignments
----------------------------------------------------------------------
 MSS_INT_F2M_net_0 <= ( '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & CoreTimer_0_0_TIMINT & CORESPI_0_0_intr_or_0_Y );
----------------------------------------------------------------------
-- Bus Interface Nets Assignments - Unequal Pin Widths
----------------------------------------------------------------------
 CoreAPB3_0_APBmslave0_PADDR_0(3 downto 0) <= ( CoreAPB3_0_APBmslave0_PADDR_0_3to0(3 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_0_3to0(3 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(3 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_1(7 downto 0) <= ( CoreAPB3_0_APBmslave0_PADDR_1_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PADDR_1_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(7 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_2(4 downto 2) <= ( CoreAPB3_0_APBmslave0_PADDR_2_4to2(4 downto 2) );
 CoreAPB3_0_APBmslave0_PADDR_2_4to2(4 downto 2) <= CoreAPB3_0_APBmslave0_PADDR(4 downto 2);

 CoreAPB3_0_APBmslave0_PRDATA_0(31 downto 0) <= ( CoreAPB3_0_APBmslave0_PRDATA_0_31to8(31 downto 8) & CoreAPB3_0_APBmslave0_PRDATA_0_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PRDATA_0_31to8(31 downto 8) <= B"000000000000000000000000";
 CoreAPB3_0_APBmslave0_PRDATA_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PRDATA(7 downto 0);

 CoreAPB3_0_APBmslave0_PWDATA_0(7 downto 0) <= ( CoreAPB3_0_APBmslave0_PWDATA_0_7to0(7 downto 0) );
 CoreAPB3_0_APBmslave0_PWDATA_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PWDATA(7 downto 0);

 soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP_0 <= ( soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP_0_0to0(0) );
 soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP_0_0to0(0) <= soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP(0);

 soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0(2 downto 0) <= ( soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0_2to2(2) & soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0_1to0(1 downto 0) );
 soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0_1to0(1 downto 0) <= soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE(1 downto 0);
 soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0_2to2(2) <= '0';

----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- CCC_0   -   Actel:SgCore:FCCC:2.0.201
CCC_0 : soundchip_sb_CCC_0_FCCC
    port map( 
        -- Inputs
        RCOSC_1MHZ => RCOSC_1MHZ_CCC_OUT_RCOSC_1MHZ_CCC,
        -- Outputs
        GL0        => FAB_CCC_GL0_net_0,
        LOCK       => FAB_CCC_LOCK_net_0 
        );
-- CoreAHBLite_0   -   Actel:DirectCore:CoreAHBLite:5.2.100
CoreAHBLite_0 : entity COREAHBLITE_LIB.CoreAHBLite
    generic map( 
        FAMILY             => ( 19 ),
        HADDR_SHG_CFG      => ( 1 ),
        M0_AHBSLOT0ENABLE  => ( 1 ),
        M0_AHBSLOT1ENABLE  => ( 1 ),
        M0_AHBSLOT2ENABLE  => ( 0 ),
        M0_AHBSLOT3ENABLE  => ( 0 ),
        M0_AHBSLOT4ENABLE  => ( 0 ),
        M0_AHBSLOT5ENABLE  => ( 0 ),
        M0_AHBSLOT6ENABLE  => ( 0 ),
        M0_AHBSLOT7ENABLE  => ( 0 ),
        M0_AHBSLOT8ENABLE  => ( 0 ),
        M0_AHBSLOT9ENABLE  => ( 0 ),
        M0_AHBSLOT10ENABLE => ( 0 ),
        M0_AHBSLOT11ENABLE => ( 0 ),
        M0_AHBSLOT12ENABLE => ( 0 ),
        M0_AHBSLOT13ENABLE => ( 0 ),
        M0_AHBSLOT14ENABLE => ( 0 ),
        M0_AHBSLOT15ENABLE => ( 0 ),
        M0_AHBSLOT16ENABLE => ( 0 ),
        M1_AHBSLOT0ENABLE  => ( 0 ),
        M1_AHBSLOT1ENABLE  => ( 0 ),
        M1_AHBSLOT2ENABLE  => ( 0 ),
        M1_AHBSLOT3ENABLE  => ( 0 ),
        M1_AHBSLOT4ENABLE  => ( 0 ),
        M1_AHBSLOT5ENABLE  => ( 0 ),
        M1_AHBSLOT6ENABLE  => ( 0 ),
        M1_AHBSLOT7ENABLE  => ( 0 ),
        M1_AHBSLOT8ENABLE  => ( 0 ),
        M1_AHBSLOT9ENABLE  => ( 0 ),
        M1_AHBSLOT10ENABLE => ( 0 ),
        M1_AHBSLOT11ENABLE => ( 0 ),
        M1_AHBSLOT12ENABLE => ( 0 ),
        M1_AHBSLOT13ENABLE => ( 0 ),
        M1_AHBSLOT14ENABLE => ( 0 ),
        M1_AHBSLOT15ENABLE => ( 0 ),
        M1_AHBSLOT16ENABLE => ( 0 ),
        M2_AHBSLOT0ENABLE  => ( 0 ),
        M2_AHBSLOT1ENABLE  => ( 0 ),
        M2_AHBSLOT2ENABLE  => ( 0 ),
        M2_AHBSLOT3ENABLE  => ( 0 ),
        M2_AHBSLOT4ENABLE  => ( 0 ),
        M2_AHBSLOT5ENABLE  => ( 0 ),
        M2_AHBSLOT6ENABLE  => ( 0 ),
        M2_AHBSLOT7ENABLE  => ( 0 ),
        M2_AHBSLOT8ENABLE  => ( 0 ),
        M2_AHBSLOT9ENABLE  => ( 0 ),
        M2_AHBSLOT10ENABLE => ( 0 ),
        M2_AHBSLOT11ENABLE => ( 0 ),
        M2_AHBSLOT12ENABLE => ( 0 ),
        M2_AHBSLOT13ENABLE => ( 0 ),
        M2_AHBSLOT14ENABLE => ( 0 ),
        M2_AHBSLOT15ENABLE => ( 0 ),
        M2_AHBSLOT16ENABLE => ( 0 ),
        M3_AHBSLOT0ENABLE  => ( 0 ),
        M3_AHBSLOT1ENABLE  => ( 0 ),
        M3_AHBSLOT2ENABLE  => ( 0 ),
        M3_AHBSLOT3ENABLE  => ( 0 ),
        M3_AHBSLOT4ENABLE  => ( 0 ),
        M3_AHBSLOT5ENABLE  => ( 0 ),
        M3_AHBSLOT6ENABLE  => ( 0 ),
        M3_AHBSLOT7ENABLE  => ( 0 ),
        M3_AHBSLOT8ENABLE  => ( 0 ),
        M3_AHBSLOT9ENABLE  => ( 0 ),
        M3_AHBSLOT10ENABLE => ( 0 ),
        M3_AHBSLOT11ENABLE => ( 0 ),
        M3_AHBSLOT12ENABLE => ( 0 ),
        M3_AHBSLOT13ENABLE => ( 0 ),
        M3_AHBSLOT14ENABLE => ( 0 ),
        M3_AHBSLOT15ENABLE => ( 0 ),
        M3_AHBSLOT16ENABLE => ( 0 ),
        MEMSPACE           => ( 2 ),
        SC_0               => ( 0 ),
        SC_1               => ( 0 ),
        SC_2               => ( 0 ),
        SC_3               => ( 0 ),
        SC_4               => ( 0 ),
        SC_5               => ( 0 ),
        SC_6               => ( 0 ),
        SC_7               => ( 0 ),
        SC_8               => ( 0 ),
        SC_9               => ( 0 ),
        SC_10              => ( 0 ),
        SC_11              => ( 0 ),
        SC_12              => ( 0 ),
        SC_13              => ( 0 ),
        SC_14              => ( 0 ),
        SC_15              => ( 0 )
        )
    port map( 
        -- Inputs
        HCLK          => FAB_CCC_GL0_net_0,
        HRESETN       => MSS_READY_net_0,
        REMAP_M0      => GND_net,
        HADDR_M0      => soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HADDR,
        HMASTLOCK_M0  => GND_net, -- tied to '0' from definition
        HSIZE_M0      => soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE_0,
        HTRANS_M0     => soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HTRANS,
        HWRITE_M0     => soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HWRITE,
        HWDATA_M0     => soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HWDATA,
        HBURST_M0     => HBURST_M0_const_net_0, -- tied to X"0" from definition
        HPROT_M0      => HPROT_M0_const_net_0, -- tied to X"0" from definition
        HADDR_M1      => HADDR_M1_const_net_0, -- tied to X"0" from definition
        HMASTLOCK_M1  => GND_net, -- tied to '0' from definition
        HSIZE_M1      => HSIZE_M1_const_net_0, -- tied to X"0" from definition
        HTRANS_M1     => HTRANS_M1_const_net_0, -- tied to X"0" from definition
        HWRITE_M1     => GND_net, -- tied to '0' from definition
        HWDATA_M1     => HWDATA_M1_const_net_0, -- tied to X"0" from definition
        HBURST_M1     => HBURST_M1_const_net_0, -- tied to X"0" from definition
        HPROT_M1      => HPROT_M1_const_net_0, -- tied to X"0" from definition
        HADDR_M2      => HADDR_M2_const_net_0, -- tied to X"0" from definition
        HMASTLOCK_M2  => GND_net, -- tied to '0' from definition
        HSIZE_M2      => HSIZE_M2_const_net_0, -- tied to X"0" from definition
        HTRANS_M2     => HTRANS_M2_const_net_0, -- tied to X"0" from definition
        HWRITE_M2     => GND_net, -- tied to '0' from definition
        HWDATA_M2     => HWDATA_M2_const_net_0, -- tied to X"0" from definition
        HBURST_M2     => HBURST_M2_const_net_0, -- tied to X"0" from definition
        HPROT_M2      => HPROT_M2_const_net_0, -- tied to X"0" from definition
        HADDR_M3      => HADDR_M3_const_net_0, -- tied to X"0" from definition
        HMASTLOCK_M3  => GND_net, -- tied to '0' from definition
        HSIZE_M3      => HSIZE_M3_const_net_0, -- tied to X"0" from definition
        HTRANS_M3     => HTRANS_M3_const_net_0, -- tied to X"0" from definition
        HWRITE_M3     => GND_net, -- tied to '0' from definition
        HWDATA_M3     => HWDATA_M3_const_net_0, -- tied to X"0" from definition
        HBURST_M3     => HBURST_M3_const_net_0, -- tied to X"0" from definition
        HPROT_M3      => HPROT_M3_const_net_0, -- tied to X"0" from definition
        HRDATA_S0     => CoreAHBLite_0_AHBmslave0_HRDATA,
        HREADYOUT_S0  => CoreAHBLite_0_AHBmslave0_HREADYOUT,
        HRESP_S0      => CoreAHBLite_0_AHBmslave0_HRESP,
        HRDATA_S1     => CoreAHBLite_0_AHBmslave1_HRDATA,
        HREADYOUT_S1  => CoreAHBLite_0_AHBmslave1_HREADYOUT,
        HRESP_S1      => CoreAHBLite_0_AHBmslave1_HRESP,
        HRDATA_S2     => HRDATA_S2_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S2  => VCC_net, -- tied to '1' from definition
        HRESP_S2      => HRESP_S2_const_net_0, -- tied to X"0" from definition
        HRDATA_S3     => HRDATA_S3_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S3  => VCC_net, -- tied to '1' from definition
        HRESP_S3      => HRESP_S3_const_net_0, -- tied to X"0" from definition
        HRDATA_S4     => HRDATA_S4_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S4  => VCC_net, -- tied to '1' from definition
        HRESP_S4      => HRESP_S4_const_net_0, -- tied to X"0" from definition
        HRDATA_S5     => HRDATA_S5_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S5  => VCC_net, -- tied to '1' from definition
        HRESP_S5      => HRESP_S5_const_net_0, -- tied to X"0" from definition
        HRDATA_S6     => HRDATA_S6_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S6  => VCC_net, -- tied to '1' from definition
        HRESP_S6      => HRESP_S6_const_net_0, -- tied to X"0" from definition
        HRDATA_S7     => HRDATA_S7_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S7  => VCC_net, -- tied to '1' from definition
        HRESP_S7      => HRESP_S7_const_net_0, -- tied to X"0" from definition
        HRDATA_S8     => HRDATA_S8_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S8  => VCC_net, -- tied to '1' from definition
        HRESP_S8      => HRESP_S8_const_net_0, -- tied to X"0" from definition
        HRDATA_S9     => HRDATA_S9_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S9  => VCC_net, -- tied to '1' from definition
        HRESP_S9      => HRESP_S9_const_net_0, -- tied to X"0" from definition
        HRDATA_S10    => HRDATA_S10_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S10 => VCC_net, -- tied to '1' from definition
        HRESP_S10     => HRESP_S10_const_net_0, -- tied to X"0" from definition
        HRDATA_S11    => HRDATA_S11_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S11 => VCC_net, -- tied to '1' from definition
        HRESP_S11     => HRESP_S11_const_net_0, -- tied to X"0" from definition
        HRDATA_S12    => HRDATA_S12_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S12 => VCC_net, -- tied to '1' from definition
        HRESP_S12     => HRESP_S12_const_net_0, -- tied to X"0" from definition
        HRDATA_S13    => HRDATA_S13_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S13 => VCC_net, -- tied to '1' from definition
        HRESP_S13     => HRESP_S13_const_net_0, -- tied to X"0" from definition
        HRDATA_S14    => HRDATA_S14_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S14 => VCC_net, -- tied to '1' from definition
        HRESP_S14     => HRESP_S14_const_net_0, -- tied to X"0" from definition
        HRDATA_S15    => HRDATA_S15_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S15 => VCC_net, -- tied to '1' from definition
        HRESP_S15     => HRESP_S15_const_net_0, -- tied to X"0" from definition
        HRDATA_S16    => HRDATA_S16_const_net_0, -- tied to X"0" from definition
        HREADYOUT_S16 => VCC_net, -- tied to '1' from definition
        HRESP_S16     => HRESP_S16_const_net_0, -- tied to X"0" from definition
        -- Outputs
        HRESP_M0      => soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP,
        HRDATA_M0     => soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRDATA,
        HREADY_M0     => soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HREADY,
        HRESP_M1      => OPEN,
        HRDATA_M1     => OPEN,
        HREADY_M1     => OPEN,
        HRESP_M2      => OPEN,
        HRDATA_M2     => OPEN,
        HREADY_M2     => OPEN,
        HRESP_M3      => OPEN,
        HRDATA_M3     => OPEN,
        HREADY_M3     => OPEN,
        HSEL_S0       => CoreAHBLite_0_AHBmslave0_HSELx,
        HADDR_S0      => CoreAHBLite_0_AHBmslave0_HADDR,
        HSIZE_S0      => CoreAHBLite_0_AHBmslave0_HSIZE,
        HTRANS_S0     => CoreAHBLite_0_AHBmslave0_HTRANS,
        HWRITE_S0     => CoreAHBLite_0_AHBmslave0_HWRITE,
        HWDATA_S0     => CoreAHBLite_0_AHBmslave0_HWDATA,
        HREADY_S0     => CoreAHBLite_0_AHBmslave0_HREADY,
        HMASTLOCK_S0  => CoreAHBLite_0_AHBmslave0_HMASTLOCK,
        HBURST_S0     => CoreAHBLite_0_AHBmslave0_HBURST,
        HPROT_S0      => CoreAHBLite_0_AHBmslave0_HPROT,
        HSEL_S1       => CoreAHBLite_0_AHBmslave1_HSELx,
        HADDR_S1      => CoreAHBLite_0_AHBmslave1_HADDR,
        HSIZE_S1      => CoreAHBLite_0_AHBmslave1_HSIZE,
        HTRANS_S1     => CoreAHBLite_0_AHBmslave1_HTRANS,
        HWRITE_S1     => CoreAHBLite_0_AHBmslave1_HWRITE,
        HWDATA_S1     => CoreAHBLite_0_AHBmslave1_HWDATA,
        HREADY_S1     => CoreAHBLite_0_AHBmslave1_HREADY,
        HMASTLOCK_S1  => CoreAHBLite_0_AHBmslave1_HMASTLOCK,
        HBURST_S1     => CoreAHBLite_0_AHBmslave1_HBURST,
        HPROT_S1      => CoreAHBLite_0_AHBmslave1_HPROT,
        HSEL_S2       => OPEN,
        HADDR_S2      => OPEN,
        HSIZE_S2      => OPEN,
        HTRANS_S2     => OPEN,
        HWRITE_S2     => OPEN,
        HWDATA_S2     => OPEN,
        HREADY_S2     => OPEN,
        HMASTLOCK_S2  => OPEN,
        HBURST_S2     => OPEN,
        HPROT_S2      => OPEN,
        HSEL_S3       => OPEN,
        HADDR_S3      => OPEN,
        HSIZE_S3      => OPEN,
        HTRANS_S3     => OPEN,
        HWRITE_S3     => OPEN,
        HWDATA_S3     => OPEN,
        HREADY_S3     => OPEN,
        HMASTLOCK_S3  => OPEN,
        HBURST_S3     => OPEN,
        HPROT_S3      => OPEN,
        HSEL_S4       => OPEN,
        HADDR_S4      => OPEN,
        HSIZE_S4      => OPEN,
        HTRANS_S4     => OPEN,
        HWRITE_S4     => OPEN,
        HWDATA_S4     => OPEN,
        HREADY_S4     => OPEN,
        HMASTLOCK_S4  => OPEN,
        HBURST_S4     => OPEN,
        HPROT_S4      => OPEN,
        HSEL_S5       => OPEN,
        HADDR_S5      => OPEN,
        HSIZE_S5      => OPEN,
        HTRANS_S5     => OPEN,
        HWRITE_S5     => OPEN,
        HWDATA_S5     => OPEN,
        HREADY_S5     => OPEN,
        HMASTLOCK_S5  => OPEN,
        HBURST_S5     => OPEN,
        HPROT_S5      => OPEN,
        HSEL_S6       => OPEN,
        HADDR_S6      => OPEN,
        HSIZE_S6      => OPEN,
        HTRANS_S6     => OPEN,
        HWRITE_S6     => OPEN,
        HWDATA_S6     => OPEN,
        HREADY_S6     => OPEN,
        HMASTLOCK_S6  => OPEN,
        HBURST_S6     => OPEN,
        HPROT_S6      => OPEN,
        HSEL_S7       => OPEN,
        HADDR_S7      => OPEN,
        HSIZE_S7      => OPEN,
        HTRANS_S7     => OPEN,
        HWRITE_S7     => OPEN,
        HWDATA_S7     => OPEN,
        HREADY_S7     => OPEN,
        HMASTLOCK_S7  => OPEN,
        HBURST_S7     => OPEN,
        HPROT_S7      => OPEN,
        HSEL_S8       => OPEN,
        HADDR_S8      => OPEN,
        HSIZE_S8      => OPEN,
        HTRANS_S8     => OPEN,
        HWRITE_S8     => OPEN,
        HWDATA_S8     => OPEN,
        HREADY_S8     => OPEN,
        HMASTLOCK_S8  => OPEN,
        HBURST_S8     => OPEN,
        HPROT_S8      => OPEN,
        HSEL_S9       => OPEN,
        HADDR_S9      => OPEN,
        HSIZE_S9      => OPEN,
        HTRANS_S9     => OPEN,
        HWRITE_S9     => OPEN,
        HWDATA_S9     => OPEN,
        HREADY_S9     => OPEN,
        HMASTLOCK_S9  => OPEN,
        HBURST_S9     => OPEN,
        HPROT_S9      => OPEN,
        HSEL_S10      => OPEN,
        HADDR_S10     => OPEN,
        HSIZE_S10     => OPEN,
        HTRANS_S10    => OPEN,
        HWRITE_S10    => OPEN,
        HWDATA_S10    => OPEN,
        HREADY_S10    => OPEN,
        HMASTLOCK_S10 => OPEN,
        HBURST_S10    => OPEN,
        HPROT_S10     => OPEN,
        HSEL_S11      => OPEN,
        HADDR_S11     => OPEN,
        HSIZE_S11     => OPEN,
        HTRANS_S11    => OPEN,
        HWRITE_S11    => OPEN,
        HWDATA_S11    => OPEN,
        HREADY_S11    => OPEN,
        HMASTLOCK_S11 => OPEN,
        HBURST_S11    => OPEN,
        HPROT_S11     => OPEN,
        HSEL_S12      => OPEN,
        HADDR_S12     => OPEN,
        HSIZE_S12     => OPEN,
        HTRANS_S12    => OPEN,
        HWRITE_S12    => OPEN,
        HWDATA_S12    => OPEN,
        HREADY_S12    => OPEN,
        HMASTLOCK_S12 => OPEN,
        HBURST_S12    => OPEN,
        HPROT_S12     => OPEN,
        HSEL_S13      => OPEN,
        HADDR_S13     => OPEN,
        HSIZE_S13     => OPEN,
        HTRANS_S13    => OPEN,
        HWRITE_S13    => OPEN,
        HWDATA_S13    => OPEN,
        HREADY_S13    => OPEN,
        HMASTLOCK_S13 => OPEN,
        HBURST_S13    => OPEN,
        HPROT_S13     => OPEN,
        HSEL_S14      => OPEN,
        HADDR_S14     => OPEN,
        HSIZE_S14     => OPEN,
        HTRANS_S14    => OPEN,
        HWRITE_S14    => OPEN,
        HWDATA_S14    => OPEN,
        HREADY_S14    => OPEN,
        HMASTLOCK_S14 => OPEN,
        HBURST_S14    => OPEN,
        HPROT_S14     => OPEN,
        HSEL_S15      => OPEN,
        HADDR_S15     => OPEN,
        HSIZE_S15     => OPEN,
        HTRANS_S15    => OPEN,
        HWRITE_S15    => OPEN,
        HWDATA_S15    => OPEN,
        HREADY_S15    => OPEN,
        HMASTLOCK_S15 => OPEN,
        HBURST_S15    => OPEN,
        HPROT_S15     => OPEN,
        HSEL_S16      => OPEN,
        HADDR_S16     => OPEN,
        HSIZE_S16     => OPEN,
        HTRANS_S16    => OPEN,
        HWRITE_S16    => OPEN,
        HWDATA_S16    => OPEN,
        HREADY_S16    => OPEN,
        HMASTLOCK_S16 => OPEN,
        HBURST_S16    => OPEN,
        HPROT_S16     => OPEN 
        );
-- COREAHBLSRAM_0_0   -   Actel:DirectCore:COREAHBLSRAM:2.0.113
COREAHBLSRAM_0_0 : soundchip_sb_COREAHBLSRAM_0_0_COREAHBLSRAM
    generic map( 
        AHB_AWIDTH                   => ( 32 ),
        AHB_DWIDTH                   => ( 32 ),
        FAMILY                       => ( 19 ),
        LSRAM_NUM_LOCATIONS_DWIDTH32 => ( 2048 ),
        SEL_SRAM_TYPE                => ( 0 ),
        USRAM_NUM_LOCATIONS_DWIDTH32 => ( 512 )
        )
    port map( 
        -- Inputs
        HCLK      => FAB_CCC_GL0_net_0,
        HRESETN   => MSS_READY_net_0,
        HSEL      => CoreAHBLite_0_AHBmslave0_HSELx,
        HREADYIN  => CoreAHBLite_0_AHBmslave0_HREADY,
        HSIZE     => CoreAHBLite_0_AHBmslave0_HSIZE,
        HTRANS    => CoreAHBLite_0_AHBmslave0_HTRANS,
        HBURST    => CoreAHBLite_0_AHBmslave0_HBURST,
        HADDR     => CoreAHBLite_0_AHBmslave0_HADDR,
        HWRITE    => CoreAHBLite_0_AHBmslave0_HWRITE,
        HWDATA    => CoreAHBLite_0_AHBmslave0_HWDATA,
        -- Outputs
        HREADYOUT => CoreAHBLite_0_AHBmslave0_HREADYOUT,
        HRDATA    => CoreAHBLite_0_AHBmslave0_HRDATA,
        HRESP     => CoreAHBLite_0_AHBmslave0_HRESP 
        );
-- COREAHBTOAPB3_0   -   Actel:DirectCore:COREAHBTOAPB3:3.1.100
COREAHBTOAPB3_0 : entity COREAHBTOAPB3_LIB.COREAHBTOAPB3
    generic map( 
        FAMILY => ( 19 )
        )
    port map( 
        -- Inputs
        HCLK      => FAB_CCC_GL0_net_0,
        HRESETN   => MSS_READY_net_0,
        HADDR     => CoreAHBLite_0_AHBmslave1_HADDR,
        HTRANS    => CoreAHBLite_0_AHBmslave1_HTRANS,
        HWRITE    => CoreAHBLite_0_AHBmslave1_HWRITE,
        HWDATA    => CoreAHBLite_0_AHBmslave1_HWDATA,
        HSEL      => CoreAHBLite_0_AHBmslave1_HSELx,
        HREADY    => CoreAHBLite_0_AHBmslave1_HREADY,
        PRDATA    => COREAHBTOAPB3_0_APBmaster_PRDATA,
        PREADY    => COREAHBTOAPB3_0_APBmaster_PREADY,
        PSLVERR   => COREAHBTOAPB3_0_APBmaster_PSLVERR,
        -- Outputs
        HRDATA    => CoreAHBLite_0_AHBmslave1_HRDATA,
        HREADYOUT => CoreAHBLite_0_AHBmslave1_HREADYOUT,
        HRESP     => CoreAHBLite_0_AHBmslave1_HRESP,
        PWDATA    => COREAHBTOAPB3_0_APBmaster_PWDATA,
        PENABLE   => COREAHBTOAPB3_0_APBmaster_PENABLE,
        PADDR     => COREAHBTOAPB3_0_APBmaster_PADDR,
        PWRITE    => COREAHBTOAPB3_0_APBmaster_PWRITE,
        PSEL      => COREAHBTOAPB3_0_APBmaster_PSELx 
        );
-- CoreAPB3_0   -   Actel:DirectCore:CoreAPB3:4.1.100
CoreAPB3_0 : entity COREAPB3_LIB.CoreAPB3
    generic map( 
        APB_DWIDTH      => ( 32 ),
        APBSLOT0ENABLE  => ( 1 ),
        APBSLOT1ENABLE  => ( 1 ),
        APBSLOT2ENABLE  => ( 1 ),
        APBSLOT3ENABLE  => ( 0 ),
        APBSLOT4ENABLE  => ( 0 ),
        APBSLOT5ENABLE  => ( 0 ),
        APBSLOT6ENABLE  => ( 0 ),
        APBSLOT7ENABLE  => ( 0 ),
        APBSLOT8ENABLE  => ( 0 ),
        APBSLOT9ENABLE  => ( 0 ),
        APBSLOT10ENABLE => ( 0 ),
        APBSLOT11ENABLE => ( 0 ),
        APBSLOT12ENABLE => ( 0 ),
        APBSLOT13ENABLE => ( 0 ),
        APBSLOT14ENABLE => ( 0 ),
        APBSLOT15ENABLE => ( 0 ),
        FAMILY          => ( 19 ),
        IADDR_OPTION    => ( 0 ),
        MADDR_BITS      => ( 16 ),
        SC_0            => ( 0 ),
        SC_1            => ( 0 ),
        SC_2            => ( 0 ),
        SC_3            => ( 0 ),
        SC_4            => ( 0 ),
        SC_5            => ( 0 ),
        SC_6            => ( 0 ),
        SC_7            => ( 0 ),
        SC_8            => ( 0 ),
        SC_9            => ( 0 ),
        SC_10           => ( 0 ),
        SC_11           => ( 0 ),
        SC_12           => ( 0 ),
        SC_13           => ( 0 ),
        SC_14           => ( 0 ),
        SC_15           => ( 0 ),
        UPR_NIBBLE_POSN => ( 3 )
        )
    port map( 
        -- Inputs
        PRESETN    => GND_net, -- tied to '0' from definition
        PCLK       => GND_net, -- tied to '0' from definition
        PADDR      => COREAHBTOAPB3_0_APBmaster_PADDR,
        PWRITE     => COREAHBTOAPB3_0_APBmaster_PWRITE,
        PENABLE    => COREAHBTOAPB3_0_APBmaster_PENABLE,
        PWDATA     => COREAHBTOAPB3_0_APBmaster_PWDATA,
        PSEL       => COREAHBTOAPB3_0_APBmaster_PSELx,
        PRDATAS0   => CoreAPB3_0_APBmslave0_PRDATA_0,
        PREADYS0   => VCC_net, -- tied to '1' from definition
        PSLVERRS0  => GND_net, -- tied to '0' from definition
        PRDATAS1   => CoreAPB3_0_APBmslave1_PRDATA,
        PREADYS1   => CoreAPB3_0_APBmslave1_PREADY,
        PSLVERRS1  => CoreAPB3_0_APBmslave1_PSLVERR,
        PRDATAS2   => CoreAPB3_0_APBmslave2_PRDATA,
        PREADYS2   => VCC_net, -- tied to '1' from definition
        PSLVERRS2  => GND_net, -- tied to '0' from definition
        PRDATAS3   => PRDATAS3_const_net_0, -- tied to X"0" from definition
        PREADYS3   => VCC_net, -- tied to '1' from definition
        PSLVERRS3  => GND_net, -- tied to '0' from definition
        PRDATAS4   => PRDATAS4_const_net_0, -- tied to X"0" from definition
        PREADYS4   => VCC_net, -- tied to '1' from definition
        PSLVERRS4  => GND_net, -- tied to '0' from definition
        PRDATAS5   => PRDATAS5_const_net_0, -- tied to X"0" from definition
        PREADYS5   => VCC_net, -- tied to '1' from definition
        PSLVERRS5  => GND_net, -- tied to '0' from definition
        PRDATAS6   => PRDATAS6_const_net_0, -- tied to X"0" from definition
        PREADYS6   => VCC_net, -- tied to '1' from definition
        PSLVERRS6  => GND_net, -- tied to '0' from definition
        PRDATAS7   => PRDATAS7_const_net_0, -- tied to X"0" from definition
        PREADYS7   => VCC_net, -- tied to '1' from definition
        PSLVERRS7  => GND_net, -- tied to '0' from definition
        PRDATAS8   => PRDATAS8_const_net_0, -- tied to X"0" from definition
        PREADYS8   => VCC_net, -- tied to '1' from definition
        PSLVERRS8  => GND_net, -- tied to '0' from definition
        PRDATAS9   => PRDATAS9_const_net_0, -- tied to X"0" from definition
        PREADYS9   => VCC_net, -- tied to '1' from definition
        PSLVERRS9  => GND_net, -- tied to '0' from definition
        PRDATAS10  => PRDATAS10_const_net_0, -- tied to X"0" from definition
        PREADYS10  => VCC_net, -- tied to '1' from definition
        PSLVERRS10 => GND_net, -- tied to '0' from definition
        PRDATAS11  => PRDATAS11_const_net_0, -- tied to X"0" from definition
        PREADYS11  => VCC_net, -- tied to '1' from definition
        PSLVERRS11 => GND_net, -- tied to '0' from definition
        PRDATAS12  => PRDATAS12_const_net_0, -- tied to X"0" from definition
        PREADYS12  => VCC_net, -- tied to '1' from definition
        PSLVERRS12 => GND_net, -- tied to '0' from definition
        PRDATAS13  => PRDATAS13_const_net_0, -- tied to X"0" from definition
        PREADYS13  => VCC_net, -- tied to '1' from definition
        PSLVERRS13 => GND_net, -- tied to '0' from definition
        PRDATAS14  => PRDATAS14_const_net_0, -- tied to X"0" from definition
        PREADYS14  => VCC_net, -- tied to '1' from definition
        PSLVERRS14 => GND_net, -- tied to '0' from definition
        PRDATAS15  => PRDATAS15_const_net_0, -- tied to X"0" from definition
        PREADYS15  => VCC_net, -- tied to '1' from definition
        PSLVERRS15 => GND_net, -- tied to '0' from definition
        PRDATAS16  => PRDATAS16_const_net_0, -- tied to X"0" from definition
        PREADYS16  => VCC_net, -- tied to '1' from definition
        PSLVERRS16 => GND_net, -- tied to '0' from definition
        IADDR      => IADDR_const_net_0, -- tied to X"0" from definition
        -- Outputs
        PRDATA     => COREAHBTOAPB3_0_APBmaster_PRDATA,
        PREADY     => COREAHBTOAPB3_0_APBmaster_PREADY,
        PSLVERR    => COREAHBTOAPB3_0_APBmaster_PSLVERR,
        PADDRS     => CoreAPB3_0_APBmslave0_PADDR,
        PWRITES    => CoreAPB3_0_APBmslave0_PWRITE,
        PENABLES   => CoreAPB3_0_APBmslave0_PENABLE,
        PWDATAS    => CoreAPB3_0_APBmslave0_PWDATA,
        PSELS0     => CoreAPB3_0_APBmslave0_PSELx,
        PSELS1     => CoreAPB3_0_APBmslave1_PSELx,
        PSELS2     => CoreAPB3_0_APBmslave2_PSELx,
        PSELS3     => OPEN,
        PSELS4     => OPEN,
        PSELS5     => OPEN,
        PSELS6     => OPEN,
        PSELS7     => OPEN,
        PSELS8     => OPEN,
        PSELS9     => OPEN,
        PSELS10    => OPEN,
        PSELS11    => OPEN,
        PSELS12    => OPEN,
        PSELS13    => OPEN,
        PSELS14    => OPEN,
        PSELS15    => OPEN,
        PSELS16    => OPEN 
        );
-- CoreGPIO_0_0   -   Actel:DirectCore:CoreGPIO:3.0.120
CoreGPIO_0_0 : entity COREGPIO_LIB.CoreGPIO
    generic map( 
        APB_WIDTH       => ( 32 ),
        FAMILY          => ( 11 ),
        FIXED_CONFIG_0  => ( 0 ),
        FIXED_CONFIG_1  => ( 0 ),
        FIXED_CONFIG_2  => ( 0 ),
        FIXED_CONFIG_3  => ( 0 ),
        FIXED_CONFIG_4  => ( 0 ),
        FIXED_CONFIG_5  => ( 0 ),
        FIXED_CONFIG_6  => ( 0 ),
        FIXED_CONFIG_7  => ( 0 ),
        FIXED_CONFIG_8  => ( 0 ),
        FIXED_CONFIG_9  => ( 0 ),
        FIXED_CONFIG_10 => ( 0 ),
        FIXED_CONFIG_11 => ( 0 ),
        FIXED_CONFIG_12 => ( 0 ),
        FIXED_CONFIG_13 => ( 0 ),
        FIXED_CONFIG_14 => ( 0 ),
        FIXED_CONFIG_15 => ( 0 ),
        FIXED_CONFIG_16 => ( 0 ),
        FIXED_CONFIG_17 => ( 0 ),
        FIXED_CONFIG_18 => ( 0 ),
        FIXED_CONFIG_19 => ( 0 ),
        FIXED_CONFIG_20 => ( 0 ),
        FIXED_CONFIG_21 => ( 0 ),
        FIXED_CONFIG_22 => ( 0 ),
        FIXED_CONFIG_23 => ( 0 ),
        FIXED_CONFIG_24 => ( 0 ),
        FIXED_CONFIG_25 => ( 0 ),
        FIXED_CONFIG_26 => ( 0 ),
        FIXED_CONFIG_27 => ( 0 ),
        FIXED_CONFIG_28 => ( 0 ),
        FIXED_CONFIG_29 => ( 0 ),
        FIXED_CONFIG_30 => ( 0 ),
        FIXED_CONFIG_31 => ( 0 ),
        INT_BUS         => ( 0 ),
        IO_INT_TYPE_0   => ( 7 ),
        IO_INT_TYPE_1   => ( 7 ),
        IO_INT_TYPE_2   => ( 7 ),
        IO_INT_TYPE_3   => ( 7 ),
        IO_INT_TYPE_4   => ( 7 ),
        IO_INT_TYPE_5   => ( 7 ),
        IO_INT_TYPE_6   => ( 7 ),
        IO_INT_TYPE_7   => ( 7 ),
        IO_INT_TYPE_8   => ( 7 ),
        IO_INT_TYPE_9   => ( 7 ),
        IO_INT_TYPE_10  => ( 7 ),
        IO_INT_TYPE_11  => ( 7 ),
        IO_INT_TYPE_12  => ( 7 ),
        IO_INT_TYPE_13  => ( 7 ),
        IO_INT_TYPE_14  => ( 7 ),
        IO_INT_TYPE_15  => ( 7 ),
        IO_INT_TYPE_16  => ( 7 ),
        IO_INT_TYPE_17  => ( 7 ),
        IO_INT_TYPE_18  => ( 7 ),
        IO_INT_TYPE_19  => ( 7 ),
        IO_INT_TYPE_20  => ( 7 ),
        IO_INT_TYPE_21  => ( 7 ),
        IO_INT_TYPE_22  => ( 7 ),
        IO_INT_TYPE_23  => ( 7 ),
        IO_INT_TYPE_24  => ( 7 ),
        IO_INT_TYPE_25  => ( 7 ),
        IO_INT_TYPE_26  => ( 7 ),
        IO_INT_TYPE_27  => ( 7 ),
        IO_INT_TYPE_28  => ( 7 ),
        IO_INT_TYPE_29  => ( 7 ),
        IO_INT_TYPE_30  => ( 7 ),
        IO_INT_TYPE_31  => ( 7 ),
        IO_NUM          => ( 32 ),
        IO_TYPE_0       => ( 0 ),
        IO_TYPE_1       => ( 0 ),
        IO_TYPE_2       => ( 0 ),
        IO_TYPE_3       => ( 0 ),
        IO_TYPE_4       => ( 0 ),
        IO_TYPE_5       => ( 0 ),
        IO_TYPE_6       => ( 0 ),
        IO_TYPE_7       => ( 0 ),
        IO_TYPE_8       => ( 0 ),
        IO_TYPE_9       => ( 0 ),
        IO_TYPE_10      => ( 0 ),
        IO_TYPE_11      => ( 0 ),
        IO_TYPE_12      => ( 0 ),
        IO_TYPE_13      => ( 0 ),
        IO_TYPE_14      => ( 0 ),
        IO_TYPE_15      => ( 0 ),
        IO_TYPE_16      => ( 0 ),
        IO_TYPE_17      => ( 0 ),
        IO_TYPE_18      => ( 0 ),
        IO_TYPE_19      => ( 0 ),
        IO_TYPE_20      => ( 0 ),
        IO_TYPE_21      => ( 0 ),
        IO_TYPE_22      => ( 0 ),
        IO_TYPE_23      => ( 0 ),
        IO_TYPE_24      => ( 0 ),
        IO_TYPE_25      => ( 0 ),
        IO_TYPE_26      => ( 0 ),
        IO_TYPE_27      => ( 0 ),
        IO_TYPE_28      => ( 0 ),
        IO_TYPE_29      => ( 0 ),
        IO_TYPE_30      => ( 0 ),
        IO_TYPE_31      => ( 0 ),
        IO_VAL_0        => ( 0 ),
        IO_VAL_1        => ( 0 ),
        IO_VAL_2        => ( 0 ),
        IO_VAL_3        => ( 0 ),
        IO_VAL_4        => ( 0 ),
        IO_VAL_5        => ( 0 ),
        IO_VAL_6        => ( 0 ),
        IO_VAL_7        => ( 0 ),
        IO_VAL_8        => ( 0 ),
        IO_VAL_9        => ( 0 ),
        IO_VAL_10       => ( 0 ),
        IO_VAL_11       => ( 0 ),
        IO_VAL_12       => ( 0 ),
        IO_VAL_13       => ( 0 ),
        IO_VAL_14       => ( 0 ),
        IO_VAL_15       => ( 0 ),
        IO_VAL_16       => ( 0 ),
        IO_VAL_17       => ( 0 ),
        IO_VAL_18       => ( 0 ),
        IO_VAL_19       => ( 0 ),
        IO_VAL_20       => ( 0 ),
        IO_VAL_21       => ( 0 ),
        IO_VAL_22       => ( 0 ),
        IO_VAL_23       => ( 0 ),
        IO_VAL_24       => ( 0 ),
        IO_VAL_25       => ( 0 ),
        IO_VAL_26       => ( 0 ),
        IO_VAL_27       => ( 0 ),
        IO_VAL_28       => ( 0 ),
        IO_VAL_29       => ( 0 ),
        IO_VAL_30       => ( 0 ),
        IO_VAL_31       => ( 0 ),
        OE_TYPE         => ( 0 )
        )
    port map( 
        -- Inputs
        PRESETN  => MSS_READY_net_0,
        PCLK     => FAB_CCC_GL0_net_0,
        PSEL     => CoreAPB3_0_APBmslave1_PSELx,
        PENABLE  => CoreAPB3_0_APBmslave0_PENABLE,
        PWRITE   => CoreAPB3_0_APBmslave0_PWRITE,
        PADDR    => CoreAPB3_0_APBmslave0_PADDR_1,
        PWDATA   => CoreAPB3_0_APBmslave0_PWDATA,
        GPIO_IN  => GPIO_IN,
        -- Outputs
        PSLVERR  => CoreAPB3_0_APBmslave1_PSLVERR,
        PREADY   => CoreAPB3_0_APBmslave1_PREADY,
        PRDATA   => CoreAPB3_0_APBmslave1_PRDATA,
        INT      => INT_net_0,
        INT_OR   => OPEN,
        GPIO_OUT => GPIO_OUT_net_0,
        GPIO_OE  => GPIO_OE_net_0 
        );
-- CORERESETP_0   -   Actel:DirectCore:CoreResetP:7.1.100
CORERESETP_0 : CoreResetP
    generic map( 
        DDR_WAIT            => ( 200 ),
        DEVICE_090          => ( 0 ),
        DEVICE_VOLTAGE      => ( 2 ),
        ENABLE_SOFT_RESETS  => ( 0 ),
        EXT_RESET_CFG       => ( 0 ),
        FDDR_IN_USE         => ( 0 ),
        MDDR_IN_USE         => ( 0 ),
        SDIF0_IN_USE        => ( 0 ),
        SDIF0_PCIE          => ( 0 ),
        SDIF0_PCIE_HOTRESET => ( 1 ),
        SDIF0_PCIE_L2P2     => ( 1 ),
        SDIF1_IN_USE        => ( 0 ),
        SDIF1_PCIE          => ( 0 ),
        SDIF1_PCIE_HOTRESET => ( 1 ),
        SDIF1_PCIE_L2P2     => ( 1 ),
        SDIF2_IN_USE        => ( 0 ),
        SDIF2_PCIE          => ( 0 ),
        SDIF2_PCIE_HOTRESET => ( 1 ),
        SDIF2_PCIE_L2P2     => ( 1 ),
        SDIF3_IN_USE        => ( 0 ),
        SDIF3_PCIE          => ( 0 ),
        SDIF3_PCIE_HOTRESET => ( 1 ),
        SDIF3_PCIE_L2P2     => ( 1 )
        )
    port map( 
        -- Inputs
        RESET_N_M2F                    => soundchip_sb_MSS_TMP_0_MSS_RESET_N_M2F,
        FIC_2_APB_M_PRESET_N           => soundchip_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N,
        POWER_ON_RESET_N               => POWER_ON_RESET_N_net_0,
        FAB_RESET_N                    => FAB_RESET_N,
        RCOSC_25_50MHZ                 => FABOSC_0_RCOSC_25_50MHZ_O2F,
        CLK_BASE                       => FAB_CCC_GL0_net_0,
        CLK_LTSSM                      => GND_net, -- tied to '0' from definition
        FPLL_LOCK                      => VCC_net, -- tied to '1' from definition
        SDIF0_SPLL_LOCK                => VCC_net, -- tied to '1' from definition
        SDIF1_SPLL_LOCK                => VCC_net, -- tied to '1' from definition
        SDIF2_SPLL_LOCK                => VCC_net, -- tied to '1' from definition
        SDIF3_SPLL_LOCK                => VCC_net, -- tied to '1' from definition
        CONFIG1_DONE                   => VCC_net,
        CONFIG2_DONE                   => VCC_net,
        SDIF0_PERST_N                  => VCC_net, -- tied to '1' from definition
        SDIF1_PERST_N                  => VCC_net, -- tied to '1' from definition
        SDIF2_PERST_N                  => VCC_net, -- tied to '1' from definition
        SDIF3_PERST_N                  => VCC_net, -- tied to '1' from definition
        SDIF0_PSEL                     => GND_net, -- tied to '0' from definition
        SDIF0_PWRITE                   => VCC_net, -- tied to '1' from definition
        SDIF0_PRDATA                   => SDIF0_PRDATA_const_net_0, -- tied to X"0" from definition
        SDIF1_PSEL                     => GND_net, -- tied to '0' from definition
        SDIF1_PWRITE                   => VCC_net, -- tied to '1' from definition
        SDIF1_PRDATA                   => SDIF1_PRDATA_const_net_0, -- tied to X"0" from definition
        SDIF2_PSEL                     => GND_net, -- tied to '0' from definition
        SDIF2_PWRITE                   => VCC_net, -- tied to '1' from definition
        SDIF2_PRDATA                   => SDIF2_PRDATA_const_net_0, -- tied to X"0" from definition
        SDIF3_PSEL                     => GND_net, -- tied to '0' from definition
        SDIF3_PWRITE                   => VCC_net, -- tied to '1' from definition
        SDIF3_PRDATA                   => SDIF3_PRDATA_const_net_0, -- tied to X"0" from definition
        SOFT_EXT_RESET_OUT             => GND_net, -- tied to '0' from definition
        SOFT_RESET_F2M                 => GND_net, -- tied to '0' from definition
        SOFT_M3_RESET                  => GND_net, -- tied to '0' from definition
        SOFT_MDDR_DDR_AXI_S_CORE_RESET => GND_net, -- tied to '0' from definition
        SOFT_FDDR_CORE_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF0_PHY_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF0_CORE_RESET          => GND_net, -- tied to '0' from definition
        SOFT_SDIF0_0_CORE_RESET        => GND_net, -- tied to '0' from definition
        SOFT_SDIF0_1_CORE_RESET        => GND_net, -- tied to '0' from definition
        SOFT_SDIF1_PHY_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF1_CORE_RESET          => GND_net, -- tied to '0' from definition
        SOFT_SDIF2_PHY_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF2_CORE_RESET          => GND_net, -- tied to '0' from definition
        SOFT_SDIF3_PHY_RESET           => GND_net, -- tied to '0' from definition
        SOFT_SDIF3_CORE_RESET          => GND_net, -- tied to '0' from definition
        -- Outputs
        MSS_HPMS_READY                 => MSS_READY_net_0,
        DDR_READY                      => OPEN,
        SDIF_READY                     => OPEN,
        RESET_N_F2M                    => CORERESETP_0_RESET_N_F2M,
        M3_RESET_N                     => OPEN,
        EXT_RESET_OUT                  => OPEN,
        MDDR_DDR_AXI_S_CORE_RESET_N    => OPEN,
        FDDR_CORE_RESET_N              => OPEN,
        SDIF0_CORE_RESET_N             => OPEN,
        SDIF0_0_CORE_RESET_N           => OPEN,
        SDIF0_1_CORE_RESET_N           => OPEN,
        SDIF0_PHY_RESET_N              => OPEN,
        SDIF1_CORE_RESET_N             => OPEN,
        SDIF1_PHY_RESET_N              => OPEN,
        SDIF2_CORE_RESET_N             => OPEN,
        SDIF2_PHY_RESET_N              => OPEN,
        SDIF3_CORE_RESET_N             => OPEN,
        SDIF3_PHY_RESET_N              => OPEN,
        SDIF_RELEASED                  => OPEN,
        INIT_DONE                      => INIT_DONE_net_0 
        );
-- CORESPI_0_0   -   Actel:DirectCore:CORESPI:3.0.156
CORESPI_0_0 : entity CORESPI_LIB.CORESPI
    generic map( 
        FAMILY     => ( 15 ),
        USE_MASTER => ( 1 ),
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
-- CoreTimer_0_0   -   Actel:DirectCore:CoreTimer:1.1.101
CoreTimer_0_0 : CoreTimer
    generic map( 
        INTACTIVEH => ( 1 ),
        WIDTH      => ( 32 )
        )
    port map( 
        -- Inputs
        PCLK    => FAB_CCC_GL0_net_0,
        PRESETn => MSS_READY_net_0,
        PSEL    => CoreAPB3_0_APBmslave2_PSELx,
        PADDR   => CoreAPB3_0_APBmslave0_PADDR_2,
        PWRITE  => CoreAPB3_0_APBmslave0_PWRITE,
        PENABLE => CoreAPB3_0_APBmslave0_PENABLE,
        PWDATA  => CoreAPB3_0_APBmslave0_PWDATA,
        -- Outputs
        PRDATA  => CoreAPB3_0_APBmslave2_PRDATA,
        TIMINT  => CoreTimer_0_0_TIMINT 
        );
-- FABOSC_0   -   Actel:SgCore:OSC:2.0.101
FABOSC_0 : soundchip_sb_FABOSC_0_OSC
    port map( 
        -- Inputs
        XTL                => GND_net, -- tied to '0' from definition
        -- Outputs
        RCOSC_25_50MHZ_CCC => OPEN,
        RCOSC_25_50MHZ_O2F => FABOSC_0_RCOSC_25_50MHZ_O2F,
        RCOSC_1MHZ_CCC     => RCOSC_1MHZ_CCC_OUT_RCOSC_1MHZ_CCC,
        RCOSC_1MHZ_O2F     => RCOSC_1MHZ_O2F_net_0,
        XTLOSC_CCC         => OPEN,
        XTLOSC_O2F         => OPEN 
        );
-- soundchip_sb_MSS_0
soundchip_sb_MSS_0 : soundchip_sb_MSS
    port map( 
        -- Inputs
        SPI_0_DI               => SPI_0_DI,
        MCCC_CLK_BASE          => FAB_CCC_GL0_net_0,
        I2C_0_SDA_F2M          => I2C_0_SDA_F2M,
        I2C_0_SCL_F2M          => I2C_0_SCL_F2M,
        MCCC_CLK_BASE_PLL_LOCK => FAB_CCC_LOCK_net_0,
        MSS_RESET_N_F2M        => CORERESETP_0_RESET_N_F2M,
        MMUART_0_RXD_F2M       => MMUART_0_RXD_F2M,
        MMUART_1_RXD_F2M       => MMUART_1_RXD_F2M,
        I2C_0_BCLK             => I2C_0_BCLK,
        FIC_0_AHB_M_HREADY     => soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HREADY,
        FIC_0_AHB_M_HRESP      => soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRESP_0,
        FIC_2_APB_M_PREADY     => VCC_net, -- tied to '1' from definition
        FIC_2_APB_M_PSLVERR    => GND_net, -- tied to '0' from definition
        MSS_INT_F2M            => MSS_INT_F2M_net_0,
        FIC_0_AHB_M_HRDATA     => soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HRDATA,
        FIC_2_APB_M_PRDATA     => FIC_2_APB_M_PRDATA_const_net_0, -- tied to X"0" from definition
        -- Outputs
        SPI_0_DO               => SPI_0_DO_net_0,
        I2C_0_SDA_M2F          => I2C_0_SDA_M2F_net_0,
        I2C_0_SDA_M2F_OE       => I2C_0_SDA_M2F_OE_net_0,
        I2C_0_SCL_M2F          => I2C_0_SCL_M2F_net_0,
        I2C_0_SCL_M2F_OE       => I2C_0_SCL_M2F_OE_net_0,
        MSS_RESET_N_M2F        => soundchip_sb_MSS_TMP_0_MSS_RESET_N_M2F,
        MMUART_0_TXD_M2F       => MMUART_0_TXD_M2F_net_0,
        MMUART_1_TXD_M2F       => MMUART_1_TXD_M2F_net_0,
        FIC_0_AHB_M_HWRITE     => soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HWRITE,
        FIC_2_APB_M_PRESET_N   => soundchip_sb_MSS_TMP_0_FIC_2_APB_M_PRESET_N,
        FIC_2_APB_M_PCLK       => OPEN,
        FIC_2_APB_M_PWRITE     => OPEN,
        FIC_2_APB_M_PENABLE    => OPEN,
        FIC_2_APB_M_PSEL       => OPEN,
        FIC_0_AHB_M_HADDR      => soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HADDR,
        FIC_0_AHB_M_HWDATA     => soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HWDATA,
        FIC_0_AHB_M_HSIZE      => soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HSIZE,
        FIC_0_AHB_M_HTRANS     => soundchip_sb_MSS_TMP_0_FIC_0_AHB_MASTER_HTRANS,
        FIC_2_APB_M_PADDR      => OPEN,
        FIC_2_APB_M_PWDATA     => OPEN,
        -- Inouts
        SPI_0_CLK              => SPI_0_CLK,
        SPI_0_SS0              => SPI_0_SS0 
        );
-- SYSRESET_POR
SYSRESET_POR : SYSRESET
    port map( 
        -- Inputs
        DEVRST_N         => DEVRST_N,
        -- Outputs
        POWER_ON_RESET_N => POWER_ON_RESET_N_net_0 
        );

end RTL;
