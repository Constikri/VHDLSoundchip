-- Version: 2022.2 2022.2.0.10
-- File used only for Simulation

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity sdf_IOPAD_IN is

    port( PAD : in    std_logic;
          Y   : out   std_logic
        );

end sdf_IOPAD_IN;

architecture DEF_ARCH of sdf_IOPAD_IN is 

  component IOPAD_IN_VDDI
    port( PAD_P    : in    std_logic := 'U';
          IOUT_VDD : out   std_logic
        );
  end component;

  component IOPAD_DELAY
    port( IOUT_IN : in    std_logic := 'U';
          IOUT_P  : out   std_logic
        );
  end component;

  component IOPAD_VDD
    port( OIN_P    : in    std_logic := 'U';
          EIN_P    : in    std_logic := 'U';
          IOUT_VDD : in    std_logic := 'U';
          OIN_VDD  : out   std_logic;
          EIN_VDD  : out   std_logic;
          IOUT_IN  : out   std_logic
        );
  end component;

  component GND
    port(Y : out std_logic); 
  end component;

    signal NET_IOUT_VDD, NET_IOUT_IN, ADLIB_GND : std_logic;
    signal GND_power_net1 : std_logic;

begin 

    ADLIB_GND <= GND_power_net1;

    U_VCCI : IOPAD_IN_VDDI
      port map(PAD_P => PAD, IOUT_VDD => NET_IOUT_VDD);
    
    U_DELAY : IOPAD_DELAY
      port map(IOUT_IN => NET_IOUT_IN, IOUT_P => Y);
    
    U_VCCA : IOPAD_VDD
      port map(OIN_P => ADLIB_GND, EIN_P => ADLIB_GND, IOUT_VDD
         => NET_IOUT_VDD, OIN_VDD => OPEN, EIN_VDD => OPEN, 
        IOUT_IN => NET_IOUT_IN);
    
    GND_power_inst1 : GND
      port map( Y => GND_power_net1);


end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity sdf_IOPAD_TRI is

    port( PAD : out   std_logic;
          D   : in    std_logic;
          E   : in    std_logic
        );

end sdf_IOPAD_TRI;

architecture DEF_ARCH of sdf_IOPAD_TRI is 

  component IOPAD_TRI_VDDI
    port( OIN_VDD : in    std_logic := 'U';
          EIN_VDD : in    std_logic := 'U';
          PAD_P   : out   std_logic
        );
  end component;

  component IOPAD_VDD
    port( OIN_P    : in    std_logic := 'U';
          EIN_P    : in    std_logic := 'U';
          IOUT_VDD : in    std_logic := 'U';
          OIN_VDD  : out   std_logic;
          EIN_VDD  : out   std_logic;
          IOUT_IN  : out   std_logic
        );
  end component;

    signal NET_OIN_VDD, NET_EIN_VDD : std_logic;

begin 


    U_VCCI : IOPAD_TRI_VDDI
      port map(OIN_VDD => NET_OIN_VDD, EIN_VDD => NET_EIN_VDD, 
        PAD_P => PAD);
    
    U_VCCA : IOPAD_VDD
      port map(OIN_P => D, EIN_P => E, IOUT_VDD => OPEN, OIN_VDD
         => NET_OIN_VDD, EIN_VDD => NET_EIN_VDD, IOUT_IN => OPEN);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity soundchip is

    port( DEVRST_N      : in    std_logic;
          spi_mosi      : in    std_logic;
          spi_sck       : in    std_logic;
          spi_ss        : in    std_logic;
          dac_out_left  : out   std_logic;
          dac_out_right : out   std_logic;
          spi_miso      : out   std_logic
        );

end soundchip;

architecture DEF_ARCH of soundchip is 

  component INV_BA
    port( A : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component IOOUTFF_BYPASS
    port( A : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component SLE
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          EN  : in    std_logic := 'U';
          ALn : in    std_logic := 'U';
          ADn : in    std_logic := 'U';
          SLn : in    std_logic := 'U';
          SD  : in    std_logic := 'U';
          LAT : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component CFG4
    generic (INIT:std_logic_vector(15 downto 0) := x"0000");

    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          D : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component IOTRI_OB_EB
    port( D    : in    std_logic := 'U';
          E    : in    std_logic := 'U';
          DOUT : out   std_logic;
          EOUT : out   std_logic
        );
  end component;

  component ARI1_CC
    generic (INIT:std_logic_vector(19 downto 0) := x"00000");

    port( A   : in    std_logic := 'U';
          B   : in    std_logic := 'U';
          C   : in    std_logic := 'U';
          D   : in    std_logic := 'U';
          FCI : in    std_logic := 'U';
          S   : out   std_logic;
          Y   : out   std_logic;
          FCO : out   std_logic;
          CC  : in    std_logic := 'U';
          P   : out   std_logic;
          UB  : out   std_logic
        );
  end component;

  component IP_INTERFACE
    port( A   : in    std_logic := 'U';
          B   : in    std_logic := 'U';
          C   : in    std_logic := 'U';
          IPA : out   std_logic;
          IPB : out   std_logic;
          IPC : out   std_logic
        );
  end component;

  component RGB_NG
    port( An  : in    std_logic := 'U';
          ENn : in    std_logic := 'U';
          YL  : out   std_logic;
          YR  : out   std_logic
        );
  end component;

  component CFG2
    generic (INIT:std_logic_vector(3 downto 0) := x"0");

    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component GB_NG
    port( An  : in    std_logic := 'U';
          ENn : in    std_logic := 'U';
          YNn : out   std_logic;
          YSn : out   std_logic
        );
  end component;

  component IOINFF_BYPASS
    port( A : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component CCC

            generic (INIT:std_logic_vector(209 downto 0) := "00" & x"0000000000000000000000000000000000000000000000000000"; 
        VCOFREQUENCY:real := 0.0);

    port( Y0              : out   std_logic;
          Y1              : out   std_logic;
          Y2              : out   std_logic;
          Y3              : out   std_logic;
          PRDATA          : out   std_logic_vector(7 downto 0);
          LOCK            : out   std_logic;
          BUSY            : out   std_logic;
          CLK0            : in    std_logic := 'U';
          CLK1            : in    std_logic := 'U';
          CLK2            : in    std_logic := 'U';
          CLK3            : in    std_logic := 'U';
          NGMUX0_SEL      : in    std_logic := 'U';
          NGMUX1_SEL      : in    std_logic := 'U';
          NGMUX2_SEL      : in    std_logic := 'U';
          NGMUX3_SEL      : in    std_logic := 'U';
          NGMUX0_HOLD_N   : in    std_logic := 'U';
          NGMUX1_HOLD_N   : in    std_logic := 'U';
          NGMUX2_HOLD_N   : in    std_logic := 'U';
          NGMUX3_HOLD_N   : in    std_logic := 'U';
          NGMUX0_ARST_N   : in    std_logic := 'U';
          NGMUX1_ARST_N   : in    std_logic := 'U';
          NGMUX2_ARST_N   : in    std_logic := 'U';
          NGMUX3_ARST_N   : in    std_logic := 'U';
          PLL_BYPASS_N    : in    std_logic := 'U';
          PLL_ARST_N      : in    std_logic := 'U';
          PLL_POWERDOWN_N : in    std_logic := 'U';
          GPD0_ARST_N     : in    std_logic := 'U';
          GPD1_ARST_N     : in    std_logic := 'U';
          GPD2_ARST_N     : in    std_logic := 'U';
          GPD3_ARST_N     : in    std_logic := 'U';
          PRESET_N        : in    std_logic := 'U';
          PCLK            : in    std_logic := 'U';
          PSEL            : in    std_logic := 'U';
          PENABLE         : in    std_logic := 'U';
          PWRITE          : in    std_logic := 'U';
          PADDR           : in    std_logic_vector(7 downto 2) := (others => 'U');
          PWDATA          : in    std_logic_vector(7 downto 0) := (others => 'U');
          CLK0_PAD        : in    std_logic := 'U';
          CLK1_PAD        : in    std_logic := 'U';
          CLK2_PAD        : in    std_logic := 'U';
          CLK3_PAD        : in    std_logic := 'U';
          GL0             : out   std_logic;
          GL1             : out   std_logic;
          GL2             : out   std_logic;
          GL3             : out   std_logic;
          RCOSC_25_50MHZ  : in    std_logic := 'U';
          RCOSC_1MHZ      : in    std_logic := 'U';
          XTLOSC          : in    std_logic := 'U'
        );
  end component;

  component CFG3
    generic (INIT:std_logic_vector(7 downto 0) := x"00");

    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component CC_CONFIG
    port( CI : in    std_logic := 'U';
          CO : out   std_logic;
          P  : in    std_logic_vector(0 to 11) := (others => 'U');
          UB : in    std_logic_vector(0 to 11) := (others => 'U');
          CC : out   std_logic_vector(0 to 11)
        );
  end component;

  component RCOSC_25_50MHZ
    generic (FREQUENCY:real := 50.0);

    port( CLKOUT : out   std_logic
        );
  end component;

  component sdf_IOPAD_IN
    port( PAD : in    std_logic := 'U';
          Y   : out   std_logic
        );
  end component;

  component sdf_IOPAD_TRI
    port( PAD : out   std_logic;
          D   : in    std_logic := 'U';
          E   : in    std_logic := 'U'
        );
  end component;

  component IOIN_IB
    port( YIN : in    std_logic := 'U';
          E   : in    std_logic := 'U';
          Y   : out   std_logic
        );
  end component;

  component IOENFF_BYPASS
    port( A : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component SYSRESET_FF
    port( UDRCAP           : out   std_logic;
          UDRSH            : out   std_logic;
          UDRUPD           : out   std_logic;
          UIREG            : out   std_logic_vector(7 downto 0);
          URSTB            : out   std_logic;
          UDRCK            : out   std_logic;
          UTDI             : out   std_logic;
          POWER_ON_RESET_N : out   std_logic;
          FF_TO_START      : out   std_logic;
          FF_DONE          : out   std_logic;
          UTDO             : in    std_logic := 'U';
          DEVRST_N         : in    std_logic := 'U';
          TDI              : in    std_logic := 'U';
          TMS              : in    std_logic := 'U';
          TCK              : in    std_logic := 'U';
          TRSTB            : in    std_logic := 'U';
          TDO              : out   std_logic
        );
  end component;

  component GND
    port(Y : out std_logic); 
  end component;

  component VCC
    port(Y : out std_logic); 
  end component;

    signal \data_receiver_0_data_left[15]\, 
        \data_receiver_0_data_left[14]\, 
        \data_receiver_0_data_left[13]\, 
        \data_receiver_0_data_left[12]\, 
        \data_receiver_0_data_left[11]\, 
        \data_receiver_0_data_left[10]\, 
        \data_receiver_0_data_left[9]\, 
        \data_receiver_0_data_left[8]\, 
        \data_receiver_0_data_left[7]\, 
        \data_receiver_0_data_left[6]\, 
        \data_receiver_0_data_left[5]\, 
        \data_receiver_0_data_left[4]\, 
        \data_receiver_0_data_left[3]\, 
        \data_receiver_0_data_left[2]\, 
        \data_receiver_0_data_left[1]\, 
        \data_receiver_0_data_left[0]\, 
        \data_receiver_0_data_right[15]\, 
        \data_receiver_0_data_right[14]\, 
        \data_receiver_0_data_right[13]\, 
        \data_receiver_0_data_right[12]\, 
        \data_receiver_0_data_right[11]\, 
        \data_receiver_0_data_right[10]\, 
        \data_receiver_0_data_right[9]\, 
        \data_receiver_0_data_right[8]\, 
        \data_receiver_0_data_right[7]\, 
        \data_receiver_0_data_right[6]\, 
        \data_receiver_0_data_right[5]\, 
        \data_receiver_0_data_right[4]\, 
        \data_receiver_0_data_right[3]\, 
        \data_receiver_0_data_right[2]\, 
        \data_receiver_0_data_right[1]\, 
        \data_receiver_0_data_right[0]\, 
        \spi_slave_0_DataRxd[31]\, \spi_slave_0_DataRxd[30]\, 
        \spi_slave_0_DataRxd[29]\, \spi_slave_0_DataRxd[28]\, 
        \spi_slave_0_DataRxd[27]\, \spi_slave_0_DataRxd[26]\, 
        \spi_slave_0_DataRxd[25]\, \spi_slave_0_DataRxd[24]\, 
        \spi_slave_0_DataRxd[23]\, \spi_slave_0_DataRxd[22]\, 
        \spi_slave_0_DataRxd[21]\, \spi_slave_0_DataRxd[20]\, 
        \spi_slave_0_DataRxd[19]\, \spi_slave_0_DataRxd[18]\, 
        \spi_slave_0_DataRxd[17]\, \spi_slave_0_DataRxd[16]\, 
        \spi_slave_0_DataRxd[15]\, \spi_slave_0_DataRxd[14]\, 
        \spi_slave_0_DataRxd[13]\, \spi_slave_0_DataRxd[12]\, 
        \spi_slave_0_DataRxd[11]\, \spi_slave_0_DataRxd[10]\, 
        \spi_slave_0_DataRxd[9]\, \spi_slave_0_DataRxd[8]\, 
        \spi_slave_0_DataRxd[7]\, \spi_slave_0_DataRxd[6]\, 
        \spi_slave_0_DataRxd[5]\, \spi_slave_0_DataRxd[4]\, 
        \spi_slave_0_DataRxd[3]\, \spi_slave_0_DataRxd[2]\, 
        \spi_slave_0_DataRxd[1]\, \spi_slave_0_DataRxd[0]\, 
        FCCC_C0_0_LOCK, SYSRESET_0_POWER_ON_RESET_N, 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_YNn\, AND2_0_Y, 
        spi_mosi_c, spi_sck_c, spi_ss_c, dac_out_left_c, 
        dac_out_right_c, spi_miso_c, 
        \data_receiver_0/dac_reset_RNILDSA/U0_YNn\, 
        OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC, 
        \dac_1/data_delta[16]\, \dac_1/data_delta[15]\, 
        \dac_1/data_delta[14]\, \dac_1/data_delta[13]\, 
        \dac_1/data_delta[12]\, \dac_1/data_delta[11]\, 
        \dac_1/data_delta[10]\, \dac_1/data_delta[9]\, 
        \dac_1/data_delta[8]\, \dac_1/data_delta[7]\, 
        \dac_1/data_delta[6]\, \dac_1/data_delta[5]\, 
        \dac_1/data_delta[4]\, \dac_1/data_delta[3]\, 
        \dac_1/data_delta[2]\, \dac_1/data_delta[1]\, 
        \dac_1/data_delta[0]\, 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[16]\, 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[15]\, 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[14]\, 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[13]\, 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[12]\, 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[11]\, 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[10]\, 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[9]\, 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[8]\, 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[7]\, 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[6]\, 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[5]\, 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[4]\, 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[3]\, 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[2]\, 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[1]\, 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[0]\, 
        \dac_1/SIGMA_ADDER_0/temp_reg[17]\, 
        \dac_1/SIGMA_ADDER_0/temp_reg[16]\, 
        \dac_1/SIGMA_ADDER_0/temp_reg[15]\, 
        \dac_1/SIGMA_ADDER_0/temp_reg[14]\, 
        \dac_1/SIGMA_ADDER_0/temp_reg[13]\, 
        \dac_1/SIGMA_ADDER_0/temp_reg[12]\, 
        \dac_1/SIGMA_ADDER_0/temp_reg[11]\, 
        \dac_1/SIGMA_ADDER_0/temp_reg[10]\, 
        \dac_1/SIGMA_ADDER_0/temp_reg[9]\, 
        \dac_1/SIGMA_ADDER_0/temp_reg[8]\, 
        \dac_1/SIGMA_ADDER_0/temp_reg[7]\, 
        \dac_1/SIGMA_ADDER_0/temp_reg[6]\, 
        \dac_1/SIGMA_ADDER_0/temp_reg[5]\, 
        \dac_1/SIGMA_ADDER_0/temp_reg[4]\, 
        \dac_1/SIGMA_ADDER_0/temp_reg[3]\, 
        \dac_1/SIGMA_ADDER_0/temp_reg[2]\, 
        \dac_1/SIGMA_ADDER_0/temp_reg[1]\, 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_0_Y\, 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_0_Z\, 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_1_Z\, 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_2_Z\, 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_3_Z\, 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_4_Z\, 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_5_Z\, 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_6_Z\, 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_7_Z\, 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_8_Z\, 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_9_Z\, 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_10_Z\, 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_11_Z\, 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_12_Z\, 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_13_Z\, 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_14_Z\, 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_15_Z\, 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_16_Z\, 
        \dac_0/data_delta[16]\, \dac_0/data_delta[15]\, 
        \dac_0/data_delta[14]\, \dac_0/data_delta[13]\, 
        \dac_0/data_delta[12]\, \dac_0/data_delta[11]\, 
        \dac_0/data_delta[10]\, \dac_0/data_delta[9]\, 
        \dac_0/data_delta[8]\, \dac_0/data_delta[7]\, 
        \dac_0/data_delta[6]\, \dac_0/data_delta[5]\, 
        \dac_0/data_delta[4]\, \dac_0/data_delta[3]\, 
        \dac_0/data_delta[2]\, \dac_0/data_delta[1]\, 
        \dac_0/data_delta[0]\, 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[16]\, 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[15]\, 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[14]\, 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[13]\, 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[12]\, 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[11]\, 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[10]\, 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[9]\, 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[8]\, 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[7]\, 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[6]\, 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[5]\, 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[4]\, 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[3]\, 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[2]\, 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[1]\, 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[0]\, 
        \dac_0/SIGMA_ADDER_0/temp_reg[17]\, 
        \dac_0/SIGMA_ADDER_0/temp_reg[16]\, 
        \dac_0/SIGMA_ADDER_0/temp_reg[15]\, 
        \dac_0/SIGMA_ADDER_0/temp_reg[14]\, 
        \dac_0/SIGMA_ADDER_0/temp_reg[13]\, 
        \dac_0/SIGMA_ADDER_0/temp_reg[12]\, 
        \dac_0/SIGMA_ADDER_0/temp_reg[11]\, 
        \dac_0/SIGMA_ADDER_0/temp_reg[10]\, 
        \dac_0/SIGMA_ADDER_0/temp_reg[9]\, 
        \dac_0/SIGMA_ADDER_0/temp_reg[8]\, 
        \dac_0/SIGMA_ADDER_0/temp_reg[7]\, 
        \dac_0/SIGMA_ADDER_0/temp_reg[6]\, 
        \dac_0/SIGMA_ADDER_0/temp_reg[5]\, 
        \dac_0/SIGMA_ADDER_0/temp_reg[4]\, 
        \dac_0/SIGMA_ADDER_0/temp_reg[3]\, 
        \dac_0/SIGMA_ADDER_0/temp_reg[2]\, 
        \dac_0/SIGMA_ADDER_0/temp_reg[1]\, 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_0_Y_0\, 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_0_Z\, 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_1_Z\, 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_2_Z\, 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_3_Z\, 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_4_Z\, 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_5_Z\, 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_6_Z\, 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_7_Z\, 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_8_Z\, 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_9_Z\, 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_10_Z\, 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_11_Z\, 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_12_Z\, 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_13_Z\, 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_14_Z\, 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_15_Z\, 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_16_Z\, 
        \FCCC_C0_0/FCCC_C0_0/GL0_net\, 
        \data_receiver_0/dac_reset_Z\, \spi_slave_0/TxData_Z[30]\, 
        \spi_slave_0/TxData_Z[29]\, \spi_slave_0/TxData_Z[28]\, 
        \spi_slave_0/TxData_Z[27]\, \spi_slave_0/TxData_Z[26]\, 
        \spi_slave_0/TxData_Z[25]\, \spi_slave_0/TxData_Z[24]\, 
        \spi_slave_0/TxData_Z[23]\, \spi_slave_0/TxData_Z[22]\, 
        \spi_slave_0/TxData_Z[21]\, \spi_slave_0/TxData_Z[20]\, 
        \spi_slave_0/TxData_Z[19]\, \spi_slave_0/TxData_Z[18]\, 
        \spi_slave_0/TxData_Z[17]\, \spi_slave_0/TxData_Z[16]\, 
        \spi_slave_0/TxData_Z[15]\, \spi_slave_0/TxData_Z[14]\, 
        \spi_slave_0/TxData_Z[13]\, \spi_slave_0/TxData_Z[12]\, 
        \spi_slave_0/TxData_Z[11]\, \spi_slave_0/TxData_Z[10]\, 
        \spi_slave_0/TxData_Z[9]\, \spi_slave_0/TxData_Z[8]\, 
        \spi_slave_0/TxData_Z[7]\, \spi_slave_0/TxData_Z[6]\, 
        \spi_slave_0/TxData_Z[5]\, \spi_slave_0/TxData_Z[4]\, 
        \spi_slave_0/TxData_Z[3]\, \spi_slave_0/TxData_Z[2]\, 
        \spi_slave_0/TxData_Z[1]\, \spi_slave_0/TxData_Z[0]\, 
        \spi_slave_0/index_Z[4]\, \spi_slave_0/index_Z[3]\, 
        \spi_slave_0/index_Z[2]\, \spi_slave_0/index_Z[1]\, 
        \spi_slave_0/index_Z[0]\, \spi_slave_0/SPI_DONE_Z\, 
        \spi_slave_0/SCLK_old_Z\, \spi_slave_0/SCLK_latched_Z\, 
        \spi_slave_0/SS_latched_Z\, \spi_slave_0/MOSI_latched_Z\, 
        \spi_slave_0/SPI_DONE_0_sqmuxa_0_0\, 
        \spi_slave_0/SS_old_Z\, \spi_slave_0/N_2_i\, 
        \spi_slave_0/N_4_i\, \spi_slave_0/N_15\, 
        \spi_slave_0/N_17_i\, \spi_slave_0/N_161_i\, 
        \spi_slave_0/N_10\, \spi_slave_0/N_12\, \spi_slave_0/N_8\, 
        \spi_slave_0/N_21\, \spi_slave_0/N_33\, 
        \spi_slave_0/N_19\, 
        \spi_slave_0/SPI_DONE_0_sqmuxa_0_a3_2_Z\, 
        \spi_slave_0/N_149\, ff_to_start_net, 
        \dac_out_left_obuf/U0/DOUT1\, \dac_out_left_obuf/U0/DOUT\, 
        \dac_out_left_obuf/U0/EOUT1\, \dac_out_left_obuf/U0/EOUT\, 
        \spi_sck_ibuf/U0/YIN1\, \spi_sck_ibuf/U0/YIN\, 
        \dac_out_right_obuf/U0/DOUT1\, 
        \dac_out_right_obuf/U0/DOUT\, 
        \dac_out_right_obuf/U0/EOUT1\, 
        \dac_out_right_obuf/U0/EOUT\, \spi_ss_ibuf/U0/YIN1\, 
        \spi_ss_ibuf/U0/YIN\, \spi_miso_obuf/U0/DOUT1\, 
        \spi_miso_obuf/U0/DOUT\, \spi_miso_obuf/U0/EOUT1\, 
        \spi_miso_obuf/U0/EOUT\, \SYSRESET_0/UTDO_net\, 
        \spi_mosi_ibuf/U0/YIN1\, \spi_mosi_ibuf/U0/YIN\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/CLK0_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/CLK1_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/CLK2_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/CLK3_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX0_SEL_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX1_SEL_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX2_SEL_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX3_SEL_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX0_HOLD_N_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX1_HOLD_N_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX2_HOLD_N_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX3_HOLD_N_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX0_ARST_N_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX1_ARST_N_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX2_ARST_N_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX3_ARST_N_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PLL_BYPASS_N_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PLL_ARST_N_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PLL_POWERDOWN_N_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/GPD0_ARST_N_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/GPD1_ARST_N_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/GPD2_ARST_N_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/GPD3_ARST_N_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PRESET_N_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PCLK_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PSEL_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PENABLE_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWRITE_net\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PADDR_net[7]\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PADDR_net[6]\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PADDR_net[5]\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PADDR_net[4]\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PADDR_net[3]\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PADDR_net[2]\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[7]\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[6]\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[5]\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[4]\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[3]\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[2]\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[1]\, 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[0]\, 
        AND2_0_Y_arst, spi_slave_0_SPI_DONE, 
        \AND2_0_RNIKOS1/U0_RGB1_YR\, 
        \AND2_0_RNIKOS1/U0_RGB1_RGB0_rgbr_net_1\, 
        \AND2_0_RNIKOS1/U0_RGB1_RGB0_rgbl_net_1\, 
        \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\, 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbl_net_1\, 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbl_net_1\, 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB2_rgbr_net_1\, 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB0_rgbl_net_1\, 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB2_rgbr_net_1\, 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_YR\, 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB0_rgbr_net_1\, 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB0_rgbl_net_1\, 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB1_rgbr_net_1\, 
        \data_receiver_0/dac_reset_RNILDSA/U0_YNn_GSouth\, 
        \AND2_0_RNIKOS1/U0_YNn_GSouth\, 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_YNn_GSouth\, 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_YNn_GSouth\, ADLIB_GND0, 
        ADLIB_VCC1, CI_TO_CO2, NET_CC_CONFIG3, NET_CC_CONFIG4, 
        NET_CC_CONFIG5, NET_CC_CONFIG6, NET_CC_CONFIG7, 
        NET_CC_CONFIG8, NET_CC_CONFIG9, NET_CC_CONFIG10, 
        NET_CC_CONFIG11, NET_CC_CONFIG12, NET_CC_CONFIG13, 
        NET_CC_CONFIG14, NET_CC_CONFIG15, NET_CC_CONFIG16, 
        NET_CC_CONFIG17, NET_CC_CONFIG18, NET_CC_CONFIG19, 
        NET_CC_CONFIG20, NET_CC_CONFIG21, NET_CC_CONFIG22, 
        NET_CC_CONFIG23, NET_CC_CONFIG24, NET_CC_CONFIG25, 
        NET_CC_CONFIG26, NET_CC_CONFIG27, NET_CC_CONFIG28, 
        NET_CC_CONFIG29, NET_CC_CONFIG30, NET_CC_CONFIG31, 
        NET_CC_CONFIG32, NET_CC_CONFIG33, NET_CC_CONFIG34, 
        NET_CC_CONFIG35, NET_CC_CONFIG36, NET_CC_CONFIG37, 
        NET_CC_CONFIG38, NET_CC_CONFIG39, NET_CC_CONFIG40, 
        NET_CC_CONFIG41, NET_CC_CONFIG42, NET_CC_CONFIG43, 
        NET_CC_CONFIG44, NET_CC_CONFIG45, NET_CC_CONFIG46, 
        NET_CC_CONFIG47, NET_CC_CONFIG48, NET_CC_CONFIG49, 
        NET_CC_CONFIG50, NET_CC_CONFIG51, NET_CC_CONFIG52, 
        NET_CC_CONFIG53, NET_CC_CONFIG54, NET_CC_CONFIG55, 
        NET_CC_CONFIG56, CI_TO_CO57, NET_CC_CONFIG58, 
        NET_CC_CONFIG59, NET_CC_CONFIG60, NET_CC_CONFIG61, 
        NET_CC_CONFIG62, NET_CC_CONFIG63, NET_CC_CONFIG64, 
        NET_CC_CONFIG65, NET_CC_CONFIG66, NET_CC_CONFIG67, 
        NET_CC_CONFIG68, NET_CC_CONFIG69, NET_CC_CONFIG70, 
        NET_CC_CONFIG71, NET_CC_CONFIG72, NET_CC_CONFIG73, 
        NET_CC_CONFIG74, NET_CC_CONFIG75, NET_CC_CONFIG76, 
        NET_CC_CONFIG77, NET_CC_CONFIG78, NET_CC_CONFIG79, 
        NET_CC_CONFIG80, NET_CC_CONFIG81, NET_CC_CONFIG82, 
        NET_CC_CONFIG83, NET_CC_CONFIG84, NET_CC_CONFIG85, 
        NET_CC_CONFIG86, NET_CC_CONFIG87, NET_CC_CONFIG88, 
        NET_CC_CONFIG89, NET_CC_CONFIG90, NET_CC_CONFIG91, 
        NET_CC_CONFIG92, NET_CC_CONFIG93, NET_CC_CONFIG94, 
        NET_CC_CONFIG95, NET_CC_CONFIG96, NET_CC_CONFIG97, 
        NET_CC_CONFIG98, NET_CC_CONFIG99, NET_CC_CONFIG100, 
        NET_CC_CONFIG101, NET_CC_CONFIG102, NET_CC_CONFIG103, 
        NET_CC_CONFIG104, NET_CC_CONFIG105, NET_CC_CONFIG106, 
        NET_CC_CONFIG107, NET_CC_CONFIG108, NET_CC_CONFIG109, 
        NET_CC_CONFIG110, NET_CC_CONFIG111, AFLSDF_VCC, 
        AFLSDF_GND, \AFLSDF_INV_0\, \AFLSDF_INV_1\, 
        \AFLSDF_INV_2\, \AFLSDF_INV_3\, \AFLSDF_INV_4\, 
        \AFLSDF_INV_5\, \AFLSDF_INV_6\, \AFLSDF_INV_7\, 
        \AFLSDF_INV_8\, \AFLSDF_INV_9\, \AFLSDF_INV_10\, 
        \AFLSDF_INV_11\, \AFLSDF_INV_12\, \AFLSDF_INV_13\, 
        \AFLSDF_INV_14\, \AFLSDF_INV_15\, \AFLSDF_INV_16\, 
        \AFLSDF_INV_17\, \AFLSDF_INV_18\, \AFLSDF_INV_19\, 
        \AFLSDF_INV_20\, \AFLSDF_INV_21\, \AFLSDF_INV_22\, 
        \AFLSDF_INV_23\, \AFLSDF_INV_24\, \AFLSDF_INV_25\, 
        \AFLSDF_INV_26\, \AFLSDF_INV_27\, \AFLSDF_INV_28\, 
        \AFLSDF_INV_29\, \AFLSDF_INV_30\, \AFLSDF_INV_31\, 
        \AFLSDF_INV_32\, \AFLSDF_INV_33\, \AFLSDF_INV_34\, 
        \AFLSDF_INV_35\, \AFLSDF_INV_36\, \AFLSDF_INV_37\, 
        \AFLSDF_INV_38\, \AFLSDF_INV_39\, \AFLSDF_INV_40\, 
        \AFLSDF_INV_41\, \AFLSDF_INV_42\, \AFLSDF_INV_43\, 
        \AFLSDF_INV_44\, \AFLSDF_INV_45\, \AFLSDF_INV_46\, 
        \AFLSDF_INV_47\, \AFLSDF_INV_48\, \AFLSDF_INV_49\, 
        \AFLSDF_INV_50\, \AFLSDF_INV_51\, \AFLSDF_INV_52\, 
        \AFLSDF_INV_53\, \AFLSDF_INV_54\, \AFLSDF_INV_55\, 
        \AFLSDF_INV_56\, \AFLSDF_INV_57\, \AFLSDF_INV_58\, 
        \AFLSDF_INV_59\, \AFLSDF_INV_60\, \AFLSDF_INV_61\, 
        \AFLSDF_INV_62\, \AFLSDF_INV_63\, \AFLSDF_INV_64\, 
        \AFLSDF_INV_65\, \AFLSDF_INV_66\, \AFLSDF_INV_67\, 
        \AFLSDF_INV_68\, \AFLSDF_INV_69\, \AFLSDF_INV_70\, 
        \AFLSDF_INV_71\, \AFLSDF_INV_72\, \AFLSDF_INV_73\, 
        \AFLSDF_INV_74\, \AFLSDF_INV_75\, \AFLSDF_INV_76\, 
        \AFLSDF_INV_77\, \AFLSDF_INV_78\, \AFLSDF_INV_79\, 
        \AFLSDF_INV_80\, \AFLSDF_INV_81\, \AFLSDF_INV_82\, 
        \AFLSDF_INV_83\, \AFLSDF_INV_84\, \AFLSDF_INV_85\, 
        \AFLSDF_INV_86\, \AFLSDF_INV_87\, \AFLSDF_INV_88\, 
        \AFLSDF_INV_89\, \AFLSDF_INV_90\, \AFLSDF_INV_91\, 
        \AFLSDF_INV_92\, \AFLSDF_INV_93\, \AFLSDF_INV_94\, 
        \AFLSDF_INV_95\, \AFLSDF_INV_96\, \AFLSDF_INV_97\, 
        \AFLSDF_INV_98\, \AFLSDF_INV_99\, \AFLSDF_INV_100\, 
        \AFLSDF_INV_101\, \AFLSDF_INV_102\, \AFLSDF_INV_103\, 
        \AFLSDF_INV_104\, \AFLSDF_INV_105\, \AFLSDF_INV_106\, 
        \AFLSDF_INV_107\, \AFLSDF_INV_108\, \AFLSDF_INV_109\, 
        \AFLSDF_INV_110\ : std_logic;
    signal GND_power_net1 : std_logic;
    signal VCC_power_net1 : std_logic;
    signal nc24, nc1, nc8, nc13, nc16, nc19, nc25, nc20, nc27, 
        nc9, nc22, nc28, nc14, nc5, nc21, nc15, nc3, nc10, nc7, 
        nc17, nc4, nc12, nc2, nc23, nc18, nc26, nc6, nc11
         : std_logic;

    for all : sdf_IOPAD_IN
	Use entity work.sdf_IOPAD_IN(DEF_ARCH);
    for all : sdf_IOPAD_TRI
	Use entity work.sdf_IOPAD_TRI(DEF_ARCH);
begin 

    ADLIB_GND0 <= GND_power_net1;
    AFLSDF_GND <= GND_power_net1;
    ADLIB_VCC1 <= VCC_power_net1;
    AFLSDF_VCC <= VCC_power_net1;

    AFLSDF_INV_67 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_67\);
    
    \dac_out_right_obuf/U0/U_IOOUTFF\ : IOOUTFF_BYPASS
      port map(A => \dac_out_right_obuf/U0/DOUT1\, Y => 
        \dac_out_right_obuf/U0/DOUT\);
    
    \spi_slave_0/TxData[8]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[7]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_0\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[8]\);
    
    \spi_slave_0/SS_old_RNIM0QF1\ : CFG4
      generic map(INIT => x"2322")

      port map(A => \spi_slave_0/SS_old_Z\, B => 
        \spi_slave_0/SS_latched_Z\, C => \spi_slave_0/SCLK_old_Z\, 
        D => \spi_slave_0/SCLK_latched_Z\, Y => 
        \spi_slave_0/N_17_i\);
    
    \dac_out_right_obuf/U0/U_IOTRI\ : IOTRI_OB_EB
      port map(D => dac_out_right_c, E => ADLIB_VCC1, DOUT => 
        \dac_out_right_obuf/U0/DOUT1\, EOUT => 
        \dac_out_right_obuf/U0/EOUT1\);
    
    \spi_slave_0/RxdData[20]\ : SLE
      port map(D => \spi_slave_0_DataRxd[19]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_1\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \spi_slave_0_DataRxd[20]\);
    
    \dac_0/SIGMA_ADDER_0/temp_reg_cry_12\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_0/SIGMA_ADDER_0/sigma_register_Z[12]\, B
         => \dac_0/data_delta[12]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_11_Z\, S => 
        \dac_0/SIGMA_ADDER_0/temp_reg[12]\, Y => OPEN, FCO => 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_12_Z\, CC => 
        NET_CC_CONFIG96, P => NET_CC_CONFIG94, UB => 
        NET_CC_CONFIG95);
    
    \FCCC_C0_0/FCCC_C0_0/CCC_INST/IP_INTERFACE_1\ : IP_INTERFACE
      port map(A => ADLIB_VCC1, B => ADLIB_VCC1, C => ADLIB_VCC1, 
        IPA => \FCCC_C0_0/FCCC_C0_0/CCC_INST/CLK1_net\, IPB => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PENABLE_net\, IPC => OPEN);
    
    \dac_1/DELTA_ADDER_0/data_out_1[2]\ : SLE
      port map(D => \data_receiver_0_data_right[2]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB0_rgbl_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_1/data_delta[2]\);
    
    \dac_0/SIGMA_ADDER_0/sigma_register[8]\ : SLE
      port map(D => \dac_0/SIGMA_ADDER_0/temp_reg[8]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[8]\);
    
    AFLSDF_INV_59 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_59\);
    
    \dac_1/SIGMA_ADDER_0/sigma_register[13]\ : SLE
      port map(D => \dac_1/SIGMA_ADDER_0/temp_reg[13]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[13]\);
    
    \dac_0/DELTA_ADDER_0/data_out_1[10]\ : SLE
      port map(D => \data_receiver_0_data_left[10]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_0/data_delta[10]\);
    
    \AND2_0_RNIKOS1/U0_RGB1\ : RGB_NG
      port map(An => \AND2_0_RNIKOS1/U0_YNn_GSouth\, ENn => 
        ADLIB_GND0, YL => AND2_0_Y_arst, YR => 
        \AND2_0_RNIKOS1/U0_RGB1_YR\);
    
    AFLSDF_INV_20 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\, Y
         => \AFLSDF_INV_20\);
    
    \data_receiver_0/data[8]\ : SLE
      port map(D => \spi_slave_0_DataRxd[8]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_2\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_right[8]\);
    
    \dac_1/DELTA_ADDER_0/data_out_1[14]\ : SLE
      port map(D => \data_receiver_0_data_right[14]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_1/data_delta[14]\);
    
    \data_receiver_0/data[22]\ : SLE
      port map(D => \spi_slave_0_DataRxd[22]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_YR\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_3\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_left[6]\);
    
    \spi_slave_0/index_n2_i_o2\ : CFG2
      generic map(INIT => x"E")

      port map(A => \spi_slave_0/index_Z[0]\, B => 
        \spi_slave_0/index_Z[1]\, Y => \spi_slave_0/N_19\);
    
    \dac_1/SIGMA_ADDER_0/sigma_register[8]\ : SLE
      port map(D => \dac_1/SIGMA_ADDER_0/temp_reg[8]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[8]\);
    
    AFLSDF_INV_82 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_82\);
    
    \dac_1/SIGMA_ADDER_0/sigma_register[10]\ : SLE
      port map(D => \dac_1/SIGMA_ADDER_0/temp_reg[10]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[10]\);
    
    AFLSDF_INV_37 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_37\);
    
    \data_receiver_0/data[7]\ : SLE
      port map(D => \spi_slave_0_DataRxd[7]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_4\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_right[7]\);
    
    \dac_1/DELTA_ADDER_0/data_out_1[10]\ : SLE
      port map(D => \data_receiver_0_data_right[10]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_1/data_delta[10]\);
    
    \spi_slave_0/index[1]\ : SLE
      port map(D => \spi_slave_0/N_15\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => \spi_slave_0/N_17_i\, ALn => \AFLSDF_INV_5\, ADn
         => ADLIB_GND0, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0/index_Z[1]\);
    
    \data_receiver_0/data[2]\ : SLE
      port map(D => \spi_slave_0_DataRxd[2]\, CLK => 
        spi_slave_0_SPI_DONE, EN => ADLIB_VCC1, ALn => 
        \AFLSDF_INV_6\, ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD
         => ADLIB_GND0, LAT => ADLIB_GND0, Q => 
        \data_receiver_0_data_right[2]\);
    
    AFLSDF_INV_77 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_77\);
    
    \dac_1/DELTA_ADDER_0/data_out_1[7]\ : SLE
      port map(D => \data_receiver_0_data_right[7]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB0_rgbl_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_1/data_delta[7]\);
    
    \dac_0/DELTA_ADDER_0/data_out_1[6]\ : SLE
      port map(D => \data_receiver_0_data_left[6]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB0_rgbl_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_0/data_delta[6]\);
    
    \spi_slave_0/TxData[7]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[6]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_7\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[7]\);
    
    AFLSDF_INV_92 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_92\);
    
    \spi_slave_0/RxdData[16]\ : SLE
      port map(D => \spi_slave_0_DataRxd[15]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB2_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_8\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \spi_slave_0_DataRxd[16]\);
    
    AFLSDF_INV_53 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_53\);
    
    \spi_slave_0/TxData[0]\ : SLE
      port map(D => ADLIB_VCC1, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_9\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \spi_slave_0/TxData_Z[0]\);
    
    \spi_slave_0/index_RNO[0]\ : CFG2
      generic map(INIT => x"B")

      port map(A => \spi_slave_0/N_149\, B => 
        \spi_slave_0/index_Z[0]\, Y => \spi_slave_0/N_161_i\);
    
    AFLSDF_INV_10 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB0_rgbr_net_1\, Y
         => \AFLSDF_INV_10\);
    
    \data_receiver_0/data[26]\ : SLE
      port map(D => \spi_slave_0_DataRxd[26]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_10\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_left[10]\);
    
    \spi_slave_0/RxdData[3]\ : SLE
      port map(D => \spi_slave_0_DataRxd[2]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_11\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[3]\);
    
    \data_receiver_0/data[0]\ : SLE
      port map(D => \spi_slave_0_DataRxd[0]\, CLK => 
        spi_slave_0_SPI_DONE, EN => ADLIB_VCC1, ALn => 
        \AFLSDF_INV_12\, ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD
         => ADLIB_GND0, LAT => ADLIB_GND0, Q => 
        \data_receiver_0_data_right[0]\);
    
    \spi_slave_0/index[3]\ : SLE
      port map(D => \spi_slave_0/N_10\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => \spi_slave_0/N_17_i\, ALn => \AFLSDF_INV_13\, ADn
         => ADLIB_GND0, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0/index_Z[3]\);
    
    AFLSDF_INV_47 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_47\);
    
    \spi_slave_0/RxdData[5]\ : SLE
      port map(D => \spi_slave_0_DataRxd[4]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbl_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_14\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[5]\);
    
    \dac_0/DELTA_ADDER_0/data_out_1[5]\ : SLE
      port map(D => \data_receiver_0_data_left[5]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB0_rgbl_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_0/data_delta[5]\);
    
    AFLSDF_INV_100 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\, Y
         => \AFLSDF_INV_100\);
    
    \spi_slave_0/SS_old\ : SLE
      port map(D => \spi_slave_0/SS_latched_Z\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_15\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \spi_slave_0/SS_old_Z\);
    
    \data_receiver_0/data[18]\ : SLE
      port map(D => \spi_slave_0_DataRxd[18]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_16\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_left[2]\);
    
    AFLSDF_INV_86 : INV_BA
      port map(A => AND2_0_Y_arst, Y => \AFLSDF_INV_86\);
    
    \data_receiver_0/data[21]\ : SLE
      port map(D => \spi_slave_0_DataRxd[21]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_YR\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_17\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_left[5]\);
    
    AFLSDF_INV_55 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_55\);
    
    \dac_1/SIGMA_ADDER_0/sigma_register[16]\ : SLE
      port map(D => \dac_1/SIGMA_ADDER_0/temp_reg[16]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[16]\);
    
    \spi_slave_0/RxdData[25]\ : SLE
      port map(D => \spi_slave_0_DataRxd[24]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_18\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[25]\);
    
    \dac_1/SIGMA_ADDER_0/temp_reg_cry_1\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_1/SIGMA_ADDER_0/sigma_register_Z[1]\, B
         => \dac_1/data_delta[1]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => \dac_1/SIGMA_ADDER_0/temp_reg_cry_0_Z\, 
        S => \dac_1/SIGMA_ADDER_0/temp_reg[1]\, Y => OPEN, FCO
         => \dac_1/SIGMA_ADDER_0/temp_reg_cry_1_Z\, CC => 
        NET_CC_CONFIG8, P => NET_CC_CONFIG6, UB => NET_CC_CONFIG7);
    
    AFLSDF_INV_62 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_62\);
    
    \spi_slave_0/TxData[9]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[8]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_19\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[9]\);
    
    \data_receiver_0/data[9]\ : SLE
      port map(D => \spi_slave_0_DataRxd[9]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_20\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_right[9]\);
    
    \dac_1/SIGMA_ADDER_0/temp_reg_cry_9\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_1/SIGMA_ADDER_0/sigma_register_Z[9]\, B
         => \dac_1/data_delta[9]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => \dac_1/SIGMA_ADDER_0/temp_reg_cry_8_Z\, 
        S => \dac_1/SIGMA_ADDER_0/temp_reg[9]\, Y => OPEN, FCO
         => \dac_1/SIGMA_ADDER_0/temp_reg_cry_9_Z\, CC => 
        NET_CC_CONFIG32, P => NET_CC_CONFIG30, UB => 
        NET_CC_CONFIG31);
    
    AFLSDF_INV_96 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB0_rgbl_net_1\, Y
         => \AFLSDF_INV_96\);
    
    \dac_0/SIGMA_ADDER_0/sigma_register[17]\ : SLE
      port map(D => \dac_0/SIGMA_ADDER_0/temp_reg[17]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => dac_out_left_c);
    
    \data_receiver_0/data[3]\ : SLE
      port map(D => \spi_slave_0_DataRxd[3]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_21\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_right[3]\);
    
    \dac_1/SIGMA_ADDER_0/temp_reg_cry_7\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_1/SIGMA_ADDER_0/sigma_register_Z[7]\, B
         => \dac_1/data_delta[7]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => \dac_1/SIGMA_ADDER_0/temp_reg_cry_6_Z\, 
        S => \dac_1/SIGMA_ADDER_0/temp_reg[7]\, Y => OPEN, FCO
         => \dac_1/SIGMA_ADDER_0/temp_reg_cry_7_Z\, CC => 
        NET_CC_CONFIG26, P => NET_CC_CONFIG24, UB => 
        NET_CC_CONFIG25);
    
    \dac_1/SIGMA_ADDER_0/temp_reg_cry_3\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_1/SIGMA_ADDER_0/sigma_register_Z[3]\, B
         => \dac_1/data_delta[3]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => \dac_1/SIGMA_ADDER_0/temp_reg_cry_2_Z\, 
        S => \dac_1/SIGMA_ADDER_0/temp_reg[3]\, Y => OPEN, FCO
         => \dac_1/SIGMA_ADDER_0/temp_reg_cry_3_Z\, CC => 
        NET_CC_CONFIG14, P => NET_CC_CONFIG12, UB => 
        NET_CC_CONFIG13);
    
    \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB1\ : 
        RGB_NG
      port map(An => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_YNn_GSouth\, 
        ENn => ADLIB_GND0, YL => OPEN, YR => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB1_rgbr_net_1\);
    
    \spi_slave_0/RxdData[30]\ : SLE
      port map(D => \spi_slave_0_DataRxd[29]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_22\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[30]\);
    
    \data_receiver_0/data[20]\ : SLE
      port map(D => \spi_slave_0_DataRxd[20]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_YR\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_23\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_left[4]\);
    
    \spi_slave_0/RxdData[18]\ : SLE
      port map(D => \spi_slave_0_DataRxd[17]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB2_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_24\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[18]\);
    
    \data_receiver_0/dac_reset\ : CFG2
      generic map(INIT => x"1")

      port map(A => AND2_0_Y, B => \spi_slave_0/SPI_DONE_Z\, Y
         => \data_receiver_0/dac_reset_Z\);
    
    \spi_slave_0/index_n3_i\ : CFG4
      generic map(INIT => x"FCF9")

      port map(A => \spi_slave_0/index_Z[2]\, B => 
        \spi_slave_0/index_Z[3]\, C => \spi_slave_0/N_149\, D => 
        \spi_slave_0/N_19\, Y => \spi_slave_0/N_10\);
    
    \dac_0/SIGMA_ADDER_0/temp_reg_cry_1\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_0/SIGMA_ADDER_0/sigma_register_Z[1]\, B
         => \dac_0/data_delta[1]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => \dac_0/SIGMA_ADDER_0/temp_reg_cry_0_Z\, 
        S => \dac_0/SIGMA_ADDER_0/temp_reg[1]\, Y => OPEN, FCO
         => \dac_0/SIGMA_ADDER_0/temp_reg_cry_1_Z\, CC => 
        NET_CC_CONFIG63, P => NET_CC_CONFIG61, UB => 
        NET_CC_CONFIG62);
    
    \dac_1/DELTA_ADDER_0/data_out_1[0]\ : SLE
      port map(D => \data_receiver_0_data_right[0]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB0_rgbl_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_1/data_delta[0]\);
    
    \data_receiver_0/dac_reset_RNILDSA\ : GB_NG
      port map(An => \AFLSDF_INV_25\, ENn => ADLIB_GND0, YNn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_YNn\, YSn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_YNn_GSouth\);
    
    \dac_1/DELTA_ADDER_0/data_out_1[9]\ : SLE
      port map(D => \data_receiver_0_data_right[9]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_1/data_delta[9]\);
    
    \dac_0/SIGMA_ADDER_0/temp_reg_cry_9\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_0/SIGMA_ADDER_0/sigma_register_Z[9]\, B
         => \dac_0/data_delta[9]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => \dac_0/SIGMA_ADDER_0/temp_reg_cry_8_Z\, 
        S => \dac_0/SIGMA_ADDER_0/temp_reg[9]\, Y => OPEN, FCO
         => \dac_0/SIGMA_ADDER_0/temp_reg_cry_9_Z\, CC => 
        NET_CC_CONFIG87, P => NET_CC_CONFIG85, UB => 
        NET_CC_CONFIG86);
    
    \dac_1/SIGMA_ADDER_0/sigma_register[12]\ : SLE
      port map(D => \dac_1/SIGMA_ADDER_0/temp_reg[12]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[12]\);
    
    \dac_0/SIGMA_ADDER_0/temp_reg_cry_7\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_0/SIGMA_ADDER_0/sigma_register_Z[7]\, B
         => \dac_0/data_delta[7]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => \dac_0/SIGMA_ADDER_0/temp_reg_cry_6_Z\, 
        S => \dac_0/SIGMA_ADDER_0/temp_reg[7]\, Y => OPEN, FCO
         => \dac_0/SIGMA_ADDER_0/temp_reg_cry_7_Z\, CC => 
        NET_CC_CONFIG81, P => NET_CC_CONFIG79, UB => 
        NET_CC_CONFIG80);
    
    AFLSDF_INV_5 : INV_BA
      port map(A => AND2_0_Y_arst, Y => \AFLSDF_INV_5\);
    
    \data_receiver_0/data[14]\ : SLE
      port map(D => \spi_slave_0_DataRxd[14]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_26\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_right[14]\);
    
    \dac_0/SIGMA_ADDER_0/temp_reg_cry_3\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_0/SIGMA_ADDER_0/sigma_register_Z[3]\, B
         => \dac_0/data_delta[3]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => \dac_0/SIGMA_ADDER_0/temp_reg_cry_2_Z\, 
        S => \dac_0/SIGMA_ADDER_0/temp_reg[3]\, Y => OPEN, FCO
         => \dac_0/SIGMA_ADDER_0/temp_reg_cry_3_Z\, CC => 
        NET_CC_CONFIG69, P => NET_CC_CONFIG67, UB => 
        NET_CC_CONFIG68);
    
    AFLSDF_INV_81 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB0_rgbr_net_1\, Y
         => \AFLSDF_INV_81\);
    
    AFLSDF_INV_27 : INV_BA
      port map(A => AND2_0_Y_arst, Y => \AFLSDF_INV_27\);
    
    AFLSDF_INV_0 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_0\);
    
    \dac_0/SIGMA_ADDER_0/sigma_register[14]\ : SLE
      port map(D => \dac_0/SIGMA_ADDER_0/temp_reg[14]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[14]\);
    
    AFLSDF_INV_32 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_32\);
    
    AFLSDF_INV_109 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_109\);
    
    \spi_slave_0/index[2]\ : SLE
      port map(D => \spi_slave_0/N_12\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => \spi_slave_0/N_17_i\, ALn => \AFLSDF_INV_27\, ADn
         => ADLIB_GND0, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0/index_Z[2]\);
    
    AFLSDF_INV_66 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\, Y
         => \AFLSDF_INV_66\);
    
    AFLSDF_INV_72 : INV_BA
      port map(A => AND2_0_Y, Y => \AFLSDF_INV_72\);
    
    \spi_sck_ibuf/U0/U_IOINFF\ : IOINFF_BYPASS
      port map(A => \spi_sck_ibuf/U0/YIN1\, Y => 
        \spi_sck_ibuf/U0/YIN\);
    
    \dac_0/SIGMA_ADDER_0/temp_reg_cry_10\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_0/SIGMA_ADDER_0/sigma_register_Z[10]\, B
         => \dac_0/data_delta[10]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => \dac_0/SIGMA_ADDER_0/temp_reg_cry_9_Z\, 
        S => \dac_0/SIGMA_ADDER_0/temp_reg[10]\, Y => OPEN, FCO
         => \dac_0/SIGMA_ADDER_0/temp_reg_cry_10_Z\, CC => 
        NET_CC_CONFIG90, P => NET_CC_CONFIG88, UB => 
        NET_CC_CONFIG89);
    
    \dac_0/SIGMA_ADDER_0/sigma_register[7]\ : SLE
      port map(D => \dac_0/SIGMA_ADDER_0/temp_reg[7]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[7]\);
    
    \spi_slave_0/RxdData[17]\ : SLE
      port map(D => \spi_slave_0_DataRxd[16]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB2_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_28\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[17]\);
    
    \data_receiver_0/data[29]\ : SLE
      port map(D => \spi_slave_0_DataRxd[29]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_YR\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_29\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_left[13]\);
    
    \data_receiver_0/data[4]\ : SLE
      port map(D => \spi_slave_0_DataRxd[4]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_30\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_right[4]\);
    
    AFLSDF_INV_91 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_91\);
    
    \spi_slave_0/TxData[4]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[3]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_31\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[4]\);
    
    \spi_slave_0/TxData[26]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[25]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_32\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[26]\);
    
    \dac_1/SIGMA_ADDER_0/sigma_register[7]\ : SLE
      port map(D => \dac_1/SIGMA_ADDER_0/temp_reg[7]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[7]\);
    
    \data_receiver_0/data[15]\ : SLE
      port map(D => \spi_slave_0_DataRxd[15]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_33\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_right[15]\);
    
    \dac_out_left_obuf/U0/U_IOOUTFF\ : IOOUTFF_BYPASS
      port map(A => \dac_out_left_obuf/U0/DOUT1\, Y => 
        \dac_out_left_obuf/U0/DOUT\);
    
    AFLSDF_INV_103 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_103\);
    
    \SYSRESET_0/IP_INTERFACE_0\ : IP_INTERFACE
      port map(A => ADLIB_VCC1, B => ADLIB_VCC1, C => ADLIB_VCC1, 
        IPA => \SYSRESET_0/UTDO_net\, IPB => OPEN, IPC => OPEN);
    
    \spi_miso_obuf/U0/U_IOOUTFF\ : IOOUTFF_BYPASS
      port map(A => \spi_miso_obuf/U0/DOUT1\, Y => 
        \spi_miso_obuf/U0/DOUT\);
    
    \dac_0/SIGMA_ADDER_0/sigma_register[0]\ : SLE
      port map(D => \dac_0/SIGMA_ADDER_0/temp_reg_cry_0_Y_0\, CLK
         => \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[0]\);
    
    \dac_0/DELTA_ADDER_0/data_out_1[8]\ : SLE
      port map(D => \data_receiver_0_data_left[8]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB0_rgbl_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_0/data_delta[8]\);
    
    AFLSDF_INV_42 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\, Y
         => \AFLSDF_INV_42\);
    
    AFLSDF_INV_17 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_17\);
    
    \dac_1/SIGMA_ADDER_0/sigma_register[0]\ : SLE
      port map(D => \dac_1/SIGMA_ADDER_0/temp_reg_cry_0_Y\, CLK
         => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[0]\);
    
    AFLSDF_INV_54 : INV_BA
      port map(A => AND2_0_Y_arst, Y => \AFLSDF_INV_54\);
    
    AFLSDF_INV_36 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_36\);
    
    \spi_slave_0/TxData[16]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[15]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_34\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[16]\);
    
    \spi_slave_0/RxdData[13]\ : SLE
      port map(D => \spi_slave_0_DataRxd[12]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB2_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_35\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[13]\);
    
    AFLSDF_INV_89 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_89\);
    
    \spi_slave_0/TxData[3]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[2]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_36\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[3]\);
    
    \AND2_0_RNIKOS1/U0_RGB1_RGB0\ : RGB_NG
      port map(An => \AND2_0_RNIKOS1/U0_YNn_GSouth\, ENn => 
        ADLIB_GND0, YL => 
        \AND2_0_RNIKOS1/U0_RGB1_RGB0_rgbl_net_1\, YR => 
        \AND2_0_RNIKOS1/U0_RGB1_RGB0_rgbr_net_1\);
    
    AFLSDF_INV_76 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_76\);
    
    \FCCC_C0_0/FCCC_C0_0/CCC_INST/IP_INTERFACE_4\ : IP_INTERFACE
      port map(A => ADLIB_VCC1, B => ADLIB_VCC1, C => ADLIB_VCC1, 
        IPA => OPEN, IPB => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX0_HOLD_N_net\, IPC => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[2]\);
    
    \spi_slave_0/TxData[25]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[24]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_37\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[25]\);
    
    AFLSDF_INV_61 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_61\);
    
    \dac_0/DELTA_ADDER_0/data_out_1[14]\ : SLE
      port map(D => \data_receiver_0_data_left[14]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_0/data_delta[14]\);
    
    AFLSDF_INV_106 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_106\);
    
    \spi_slave_0/RxdData[21]\ : SLE
      port map(D => \spi_slave_0_DataRxd[20]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_38\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[21]\);
    
    AFLSDF_INV_99 : INV_BA
      port map(A => \spi_slave_0/SPI_DONE_Z\, Y => 
        \AFLSDF_INV_99\);
    
    \dac_1/SIGMA_ADDER_0/sigma_register[17]\ : SLE
      port map(D => \dac_1/SIGMA_ADDER_0/temp_reg[17]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => dac_out_right_c);
    
    AFLSDF_INV_58 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB0_rgbl_net_1\, Y
         => \AFLSDF_INV_58\);
    
    AFLSDF_INV_108 : INV_BA
      port map(A => \FCCC_C0_0/FCCC_C0_0/GL0_net\, Y => 
        \AFLSDF_INV_108\);
    
    \dac_1/DELTA_ADDER_0/data_out_1[6]\ : SLE
      port map(D => \data_receiver_0_data_right[6]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB0_rgbl_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_1/data_delta[6]\);
    
    \spi_slave_0/TxData[15]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[14]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_39\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[15]\);
    
    \FCCC_C0_0/FCCC_C0_0/CCC_INST/INST_CCC_IP\ : CCC

              generic map(INIT => "00" & x"000007FB8000044D74000307C6318C6318C61EC0404040400301",
         VCOFREQUENCY => 800.000000)

      port map(Y0 => OPEN, Y1 => OPEN, Y2 => OPEN, Y3 => OPEN, 
        PRDATA(7) => nc24, PRDATA(6) => nc1, PRDATA(5) => nc8, 
        PRDATA(4) => nc13, PRDATA(3) => nc16, PRDATA(2) => nc19, 
        PRDATA(1) => nc25, PRDATA(0) => nc20, LOCK => 
        FCCC_C0_0_LOCK, BUSY => OPEN, CLK0 => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/CLK0_net\, CLK1 => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/CLK1_net\, CLK2 => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/CLK2_net\, CLK3 => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/CLK3_net\, NGMUX0_SEL => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX0_SEL_net\, NGMUX1_SEL
         => \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX1_SEL_net\, 
        NGMUX2_SEL => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX2_SEL_net\, NGMUX3_SEL
         => \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX3_SEL_net\, 
        NGMUX0_HOLD_N => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX0_HOLD_N_net\, 
        NGMUX1_HOLD_N => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX1_HOLD_N_net\, 
        NGMUX2_HOLD_N => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX2_HOLD_N_net\, 
        NGMUX3_HOLD_N => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX3_HOLD_N_net\, 
        NGMUX0_ARST_N => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX0_ARST_N_net\, 
        NGMUX1_ARST_N => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX1_ARST_N_net\, 
        NGMUX2_ARST_N => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX2_ARST_N_net\, 
        NGMUX3_ARST_N => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX3_ARST_N_net\, 
        PLL_BYPASS_N => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PLL_BYPASS_N_net\, 
        PLL_ARST_N => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PLL_ARST_N_net\, 
        PLL_POWERDOWN_N => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PLL_POWERDOWN_N_net\, 
        GPD0_ARST_N => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/GPD0_ARST_N_net\, 
        GPD1_ARST_N => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/GPD1_ARST_N_net\, 
        GPD2_ARST_N => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/GPD2_ARST_N_net\, 
        GPD3_ARST_N => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/GPD3_ARST_N_net\, PRESET_N
         => \FCCC_C0_0/FCCC_C0_0/CCC_INST/PRESET_N_net\, PCLK => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PCLK_net\, PSEL => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PSEL_net\, PENABLE => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PENABLE_net\, PWRITE => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWRITE_net\, PADDR(7) => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PADDR_net[7]\, PADDR(6) => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PADDR_net[6]\, PADDR(5) => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PADDR_net[5]\, PADDR(4) => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PADDR_net[4]\, PADDR(3) => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PADDR_net[3]\, PADDR(2) => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PADDR_net[2]\, PWDATA(7)
         => \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[7]\, 
        PWDATA(6) => \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[6]\, 
        PWDATA(5) => \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[5]\, 
        PWDATA(4) => \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[4]\, 
        PWDATA(3) => \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[3]\, 
        PWDATA(2) => \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[2]\, 
        PWDATA(1) => \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[1]\, 
        PWDATA(0) => \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[0]\, 
        CLK0_PAD => ADLIB_GND0, CLK1_PAD => ADLIB_GND0, CLK2_PAD
         => ADLIB_GND0, CLK3_PAD => ADLIB_GND0, GL0 => OPEN, GL1
         => OPEN, GL2 => OPEN, GL3 => 
        \FCCC_C0_0/FCCC_C0_0/GL0_net\, RCOSC_25_50MHZ => 
        OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC, 
        RCOSC_1MHZ => ADLIB_GND0, XTLOSC => ADLIB_GND0);
    
    AFLSDF_INV_46 : INV_BA
      port map(A => AND2_0_Y_arst, Y => \AFLSDF_INV_46\);
    
    \spi_slave_0/TxData[24]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[23]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_40\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[24]\);
    
    \spi_slave_0/RxdData[0]\ : SLE
      port map(D => \spi_slave_0/MOSI_latched_Z\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_41\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[0]\);
    
    \spi_slave_0/index_n1_i\ : CFG3
      generic map(INIT => x"FD")

      port map(A => \spi_slave_0/N_19\, B => \spi_slave_0/N_149\, 
        C => \spi_slave_0/N_33\, Y => \spi_slave_0/N_15\);
    
    \data_receiver_0/data[17]\ : SLE
      port map(D => \spi_slave_0_DataRxd[17]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_42\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_left[1]\);
    
    \spi_slave_0/TxData[23]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[22]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_43\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[23]\);
    
    AFLSDF_INV_83 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_83\);
    
    \data_receiver_0/data[6]\ : SLE
      port map(D => \spi_slave_0_DataRxd[6]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_44\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_right[6]\);
    
    \FCCC_C0_0/FCCC_C0_0/CCC_INST/IP_INTERFACE_7\ : IP_INTERFACE
      port map(A => ADLIB_VCC1, B => ADLIB_VCC1, C => ADLIB_VCC1, 
        IPA => \FCCC_C0_0/FCCC_C0_0/CCC_INST/CLK3_net\, IPB => 
        OPEN, IPC => \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[5]\);
    
    AFLSDF_INV_22 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_22\);
    
    AFLSDF_INV_31 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_31\);
    
    \spi_slave_0/TxData[29]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[28]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_45\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[29]\);
    
    \data_receiver_0/data[1]\ : SLE
      port map(D => \spi_slave_0_DataRxd[1]\, CLK => 
        spi_slave_0_SPI_DONE, EN => ADLIB_VCC1, ALn => 
        \AFLSDF_INV_46\, ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD
         => ADLIB_GND0, LAT => ADLIB_GND0, Q => 
        \data_receiver_0_data_right[1]\);
    
    \dac_0/DELTA_ADDER_0/data_out_1[11]\ : SLE
      port map(D => \data_receiver_0_data_left[11]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_0/data_delta[11]\);
    
    \spi_slave_0/TxData[14]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[13]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_47\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[14]\);
    
    \dac_1/DELTA_ADDER_0/data_out_1[5]\ : SLE
      port map(D => \data_receiver_0_data_right[5]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB0_rgbl_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_1/data_delta[5]\);
    
    AFLSDF_INV_71 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\, Y
         => \AFLSDF_INV_71\);
    
    \spi_slave_0/RxdData[22]\ : SLE
      port map(D => \spi_slave_0_DataRxd[21]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_48\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[22]\);
    
    \spi_slave_0/TxData[13]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[12]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_49\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[13]\);
    
    AFLSDF_INV_69 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\, Y
         => \AFLSDF_INV_69\);
    
    \dac_1/SIGMA_ADDER_0/temp_reg_cry_13\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_1/SIGMA_ADDER_0/sigma_register_Z[13]\, B
         => \dac_1/data_delta[13]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_12_Z\, S => 
        \dac_1/SIGMA_ADDER_0/temp_reg[13]\, Y => OPEN, FCO => 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_13_Z\, CC => 
        NET_CC_CONFIG44, P => NET_CC_CONFIG42, UB => 
        NET_CC_CONFIG43);
    
    \dac_0/SIGMA_ADDER_0/sigma_register[5]\ : SLE
      port map(D => \dac_0/SIGMA_ADDER_0/temp_reg[5]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[5]\);
    
    AFLSDF_INV_93 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_93\);
    
    AFLSDF_INV_85 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_85\);
    
    \dac_0/SIGMA_ADDER_0/sigma_register[4]\ : SLE
      port map(D => \dac_0/SIGMA_ADDER_0/temp_reg[4]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[4]\);
    
    \dac_1/SIGMA_ADDER_0/temp_reg_cry_6\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_1/SIGMA_ADDER_0/sigma_register_Z[6]\, B
         => \dac_1/data_delta[6]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => \dac_1/SIGMA_ADDER_0/temp_reg_cry_5_Z\, 
        S => \dac_1/SIGMA_ADDER_0/temp_reg[6]\, Y => OPEN, FCO
         => \dac_1/SIGMA_ADDER_0/temp_reg_cry_6_Z\, CC => 
        NET_CC_CONFIG23, P => NET_CC_CONFIG21, UB => 
        NET_CC_CONFIG22);
    
    AFLSDF_INV_107 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_107\);
    
    \spi_slave_0/TxData[19]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[18]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_50\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[19]\);
    
    \data_receiver_0/data[23]\ : SLE
      port map(D => \spi_slave_0_DataRxd[23]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_YR\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_51\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_left[7]\);
    
    \dac_1/SIGMA_ADDER_0/sigma_register[5]\ : SLE
      port map(D => \dac_1/SIGMA_ADDER_0/temp_reg[5]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[5]\);
    
    \dac_0/SIGMA_ADDER_0/sigma_register[9]\ : SLE
      port map(D => \dac_0/SIGMA_ADDER_0/temp_reg[9]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[9]\);
    
    \dac_1/SIGMA_ADDER_0/sigma_register[4]\ : SLE
      port map(D => \dac_1/SIGMA_ADDER_0/temp_reg[4]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[4]\);
    
    \dac_0/SIGMA_ADDER_0/sigma_register[1]\ : SLE
      port map(D => \dac_0/SIGMA_ADDER_0/temp_reg[1]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[1]\);
    
    \spi_slave_0/TxData[28]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[27]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_52\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[28]\);
    
    \dac_1/SIGMA_ADDER_0/sigma_register[9]\ : SLE
      port map(D => \dac_1/SIGMA_ADDER_0/temp_reg[9]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[9]\);
    
    AFLSDF_INV_41 : INV_BA
      port map(A => AND2_0_Y_arst, Y => \AFLSDF_INV_41\);
    
    \FCCC_C0_0/FCCC_C0_0/CCC_INST/IP_INTERFACE_8\ : IP_INTERFACE
      port map(A => ADLIB_VCC1, B => ADLIB_GND0, C => ADLIB_VCC1, 
        IPA => \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWRITE_net\, IPB => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX2_SEL_net\, IPC => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[6]\);
    
    \dac_1/SIGMA_ADDER_0/sigma_register[1]\ : SLE
      port map(D => \dac_1/SIGMA_ADDER_0/temp_reg[1]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[1]\);
    
    \spi_slave_0/RxdData[24]\ : SLE
      port map(D => \spi_slave_0_DataRxd[23]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_53\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[24]\);
    
    \dac_1/SIGMA_ADDER_0/temp_reg_cry_15\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_1/SIGMA_ADDER_0/sigma_register_Z[15]\, B
         => \dac_1/data_delta[15]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_14_Z\, S => 
        \dac_1/SIGMA_ADDER_0/temp_reg[15]\, Y => OPEN, FCO => 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_15_Z\, CC => 
        NET_CC_CONFIG50, P => NET_CC_CONFIG48, UB => 
        NET_CC_CONFIG49);
    
    AFLSDF_INV_95 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_95\);
    
    AFLSDF_INV_12 : INV_BA
      port map(A => AND2_0_Y_arst, Y => \AFLSDF_INV_12\);
    
    AFLSDF_INV_26 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\, Y
         => \AFLSDF_INV_26\);
    
    \spi_slave_0/index[0]\ : SLE
      port map(D => \spi_slave_0/N_161_i\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => \spi_slave_0/N_17_i\, ALn => \AFLSDF_INV_54\, ADn
         => ADLIB_GND0, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0/index_Z[0]\);
    
    \dac_0/SIGMA_ADDER_0/temp_reg_cry_0_CC_1\ : CC_CONFIG
      port map(CI => CI_TO_CO57, CO => OPEN, P(0) => 
        NET_CC_CONFIG85, P(1) => NET_CC_CONFIG88, P(2) => 
        NET_CC_CONFIG91, P(3) => NET_CC_CONFIG94, P(4) => 
        NET_CC_CONFIG97, P(5) => NET_CC_CONFIG100, P(6) => 
        NET_CC_CONFIG103, P(7) => NET_CC_CONFIG106, P(8) => 
        NET_CC_CONFIG109, P(9) => ADLIB_VCC1, P(10) => ADLIB_VCC1, 
        P(11) => ADLIB_VCC1, UB(0) => NET_CC_CONFIG86, UB(1) => 
        NET_CC_CONFIG89, UB(2) => NET_CC_CONFIG92, UB(3) => 
        NET_CC_CONFIG95, UB(4) => NET_CC_CONFIG98, UB(5) => 
        NET_CC_CONFIG101, UB(6) => NET_CC_CONFIG104, UB(7) => 
        NET_CC_CONFIG107, UB(8) => NET_CC_CONFIG110, UB(9) => 
        ADLIB_VCC1, UB(10) => ADLIB_VCC1, UB(11) => ADLIB_VCC1, 
        CC(0) => NET_CC_CONFIG87, CC(1) => NET_CC_CONFIG90, CC(2)
         => NET_CC_CONFIG93, CC(3) => NET_CC_CONFIG96, CC(4) => 
        NET_CC_CONFIG99, CC(5) => NET_CC_CONFIG102, CC(6) => 
        NET_CC_CONFIG105, CC(7) => NET_CC_CONFIG108, CC(8) => 
        NET_CC_CONFIG111, CC(9) => nc27, CC(10) => nc9, CC(11)
         => nc22);
    
    \dac_0/SIGMA_ADDER_0/temp_reg_cry_6\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_0/SIGMA_ADDER_0/sigma_register_Z[6]\, B
         => \dac_0/data_delta[6]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => \dac_0/SIGMA_ADDER_0/temp_reg_cry_5_Z\, 
        S => \dac_0/SIGMA_ADDER_0/temp_reg[6]\, Y => OPEN, FCO
         => \dac_0/SIGMA_ADDER_0/temp_reg_cry_6_Z\, CC => 
        NET_CC_CONFIG78, P => NET_CC_CONFIG76, UB => 
        NET_CC_CONFIG77);
    
    \dac_0/SIGMA_ADDER_0/sigma_register[6]\ : SLE
      port map(D => \dac_0/SIGMA_ADDER_0/temp_reg[6]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[6]\);
    
    AFLSDF_INV_63 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_63\);
    
    AFLSDF_INV_39 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_39\);
    
    \spi_slave_0/TxData[18]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[17]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_55\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[18]\);
    
    \spi_slave_0/RxdData[2]\ : SLE
      port map(D => \spi_slave_0_DataRxd[1]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_56\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[2]\);
    
    AFLSDF_INV_8 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\, Y
         => \AFLSDF_INV_8\);
    
    \dac_1/SIGMA_ADDER_0/sigma_register[6]\ : SLE
      port map(D => \dac_1/SIGMA_ADDER_0/temp_reg[6]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[6]\);
    
    AFLSDF_INV_79 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB0_rgbl_net_1\, Y
         => \AFLSDF_INV_79\);
    
    \spi_slave_0/SPI_DONE_0_sqmuxa_0_a3\ : CFG4
      generic map(INIT => x"0080")

      port map(A => \spi_slave_0/N_33\, B => 
        \spi_slave_0/SPI_DONE_0_sqmuxa_0_a3_2_Z\, C => 
        \spi_slave_0/SCLK_old_Z\, D => 
        \spi_slave_0/SCLK_latched_Z\, Y => 
        \spi_slave_0/SPI_DONE_0_sqmuxa_0_0\);
    
    \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1\ : RGB_NG
      port map(An => \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_YNn_GSouth\, 
        ENn => ADLIB_GND0, YL => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbl_net_1\, 
        YR => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\);
    
    \dac_0/SIGMA_ADDER_0/temp_reg_cry_14\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_0/SIGMA_ADDER_0/sigma_register_Z[14]\, B
         => \dac_0/data_delta[14]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_13_Z\, S => 
        \dac_0/SIGMA_ADDER_0/temp_reg[14]\, Y => OPEN, FCO => 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_14_Z\, CC => 
        NET_CC_CONFIG102, P => NET_CC_CONFIG100, UB => 
        NET_CC_CONFIG101);
    
    \dac_0/SIGMA_ADDER_0/temp_reg_cry_11\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_0/SIGMA_ADDER_0/sigma_register_Z[11]\, B
         => \dac_0/data_delta[11]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_10_Z\, S => 
        \dac_0/SIGMA_ADDER_0/temp_reg[11]\, Y => OPEN, FCO => 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_11_Z\, CC => 
        NET_CC_CONFIG93, P => NET_CC_CONFIG91, UB => 
        NET_CC_CONFIG92);
    
    \spi_slave_0/index_n1_i_a2\ : CFG2
      generic map(INIT => x"8")

      port map(A => \spi_slave_0/index_Z[0]\, B => 
        \spi_slave_0/index_Z[1]\, Y => \spi_slave_0/N_33\);
    
    \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1\ : RGB_NG
      port map(An => \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_YNn\, ENn
         => ADLIB_GND0, YL => OPEN, YR => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\);
    
    \dac_0/SIGMA_ADDER_0/sigma_register[2]\ : SLE
      port map(D => \dac_0/SIGMA_ADDER_0/temp_reg[2]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[2]\);
    
    \spi_slave_0/RxdData[31]\ : SLE
      port map(D => \spi_slave_0_DataRxd[30]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_57\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[31]\);
    
    AFLSDF_INV_65 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_65\);
    
    \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB2\ : RGB_NG
      port map(An => \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_YNn_GSouth\, 
        ENn => ADLIB_GND0, YL => OPEN, YR => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB2_rgbr_net_1\);
    
    \spi_slave_0/RxdData[4]\ : SLE
      port map(D => \spi_slave_0_DataRxd[3]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbl_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_58\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[4]\);
    
    \spi_slave_0/RxdData[19]\ : SLE
      port map(D => \spi_slave_0_DataRxd[18]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_59\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[19]\);
    
    \dac_1/SIGMA_ADDER_0/sigma_register[2]\ : SLE
      port map(D => \dac_1/SIGMA_ADDER_0/temp_reg[2]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[2]\);
    
    AFLSDF_INV_9 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_9\);
    
    AFLSDF_INV_16 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\, Y
         => \AFLSDF_INV_16\);
    
    \dac_1/SIGMA_ADDER_0/temp_reg_cry_0\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_1/SIGMA_ADDER_0/sigma_register_Z[0]\, B
         => \dac_1/data_delta[0]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => ADLIB_GND0, S => OPEN, Y => 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_0_Y\, FCO => 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_0_Z\, CC => 
        NET_CC_CONFIG5, P => NET_CC_CONFIG3, UB => NET_CC_CONFIG4);
    
    AFLSDF_INV_49 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_49\);
    
    AFLSDF_INV_33 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\, Y
         => \AFLSDF_INV_33\);
    
    AFLSDF_INV_102 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_102\);
    
    \spi_slave_0/SPI_DONE_0_sqmuxa_0_a3_2\ : CFG4
      generic map(INIT => x"0080")

      port map(A => \spi_slave_0/index_Z[4]\, B => 
        \spi_slave_0/index_Z[3]\, C => \spi_slave_0/index_Z[2]\, 
        D => \spi_slave_0/SS_latched_Z\, Y => 
        \spi_slave_0/SPI_DONE_0_sqmuxa_0_a3_2_Z\);
    
    \data_receiver_0/data[12]\ : SLE
      port map(D => \spi_slave_0_DataRxd[12]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_60\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_right[12]\);
    
    AFLSDF_INV_21 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB0_rgbl_net_1\, Y
         => \AFLSDF_INV_21\);
    
    AFLSDF_INV_73 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB0_rgbl_net_1\, Y
         => \AFLSDF_INV_73\);
    
    AFLSDF_INV_50 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_50\);
    
    \data_receiver_0/dac_reset_RNILDSA/U0_RGB1\ : RGB_NG
      port map(An => \data_receiver_0/dac_reset_RNILDSA/U0_YNn\, 
        ENn => ADLIB_GND0, YL => OPEN, YR => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\);
    
    \dac_1/DELTA_ADDER_0/data_out_1[8]\ : SLE
      port map(D => \data_receiver_0_data_right[8]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB2_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB2_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_1/data_delta[8]\);
    
    \dac_0/DELTA_ADDER_0/data_out_1[15]\ : SLE
      port map(D => \data_receiver_0_data_left[15]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_0/data_delta[15]\);
    
    AFLSDF_INV_84 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_84\);
    
    \dac_0/SIGMA_ADDER_0/temp_reg_cry_0\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_0/SIGMA_ADDER_0/sigma_register_Z[0]\, B
         => \dac_0/data_delta[0]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => ADLIB_GND0, S => OPEN, Y => 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_0_Y_0\, FCO => 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_0_Z\, CC => 
        NET_CC_CONFIG60, P => NET_CC_CONFIG58, UB => 
        NET_CC_CONFIG59);
    
    \spi_slave_0/SCLK_old\ : SLE
      port map(D => \spi_slave_0/SCLK_latched_Z\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_61\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \spi_slave_0/SCLK_old_Z\);
    
    \spi_slave_0/RxdData[26]\ : SLE
      port map(D => \spi_slave_0_DataRxd[25]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_62\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[26]\);
    
    \dac_0/SIGMA_ADDER_0/temp_reg_cry_16\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_0/SIGMA_ADDER_0/sigma_register_Z[16]\, B
         => \dac_0/data_delta[16]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_15_Z\, S => 
        \dac_0/SIGMA_ADDER_0/temp_reg[16]\, Y => OPEN, FCO => 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_16_Z\, CC => 
        NET_CC_CONFIG108, P => NET_CC_CONFIG106, UB => 
        NET_CC_CONFIG107);
    
    \FCCC_C0_0/FCCC_C0_0/CCC_INST/IP_INTERFACE_10\ : IP_INTERFACE
      port map(A => ADLIB_VCC1, B => ADLIB_VCC1, C => ADLIB_VCC1, 
        IPA => \FCCC_C0_0/FCCC_C0_0/CCC_INST/PLL_ARST_N_net\, IPB
         => \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX2_HOLD_N_net\, IPC
         => OPEN);
    
    AFLSDF_INV_35 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\, Y
         => \AFLSDF_INV_35\);
    
    AFLSDF_INV_6 : INV_BA
      port map(A => AND2_0_Y_arst, Y => \AFLSDF_INV_6\);
    
    \FCCC_C0_0/FCCC_C0_0/CCC_INST/IP_INTERFACE_12\ : IP_INTERFACE
      port map(A => ADLIB_VCC1, B => ADLIB_VCC1, C => ADLIB_VCC1, 
        IPA => \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX0_ARST_N_net\, 
        IPB => OPEN, IPC => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PADDR_net[2]\);
    
    \dac_1/SIGMA_ADDER_0/temp_reg_cry_10\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_1/SIGMA_ADDER_0/sigma_register_Z[10]\, B
         => \dac_1/data_delta[10]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => \dac_1/SIGMA_ADDER_0/temp_reg_cry_9_Z\, 
        S => \dac_1/SIGMA_ADDER_0/temp_reg[10]\, Y => OPEN, FCO
         => \dac_1/SIGMA_ADDER_0/temp_reg_cry_10_Z\, CC => 
        NET_CC_CONFIG35, P => NET_CC_CONFIG33, UB => 
        NET_CC_CONFIG34);
    
    AFLSDF_INV_75 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB0_rgbl_net_1\, Y
         => \AFLSDF_INV_75\);
    
    \spi_slave_0/TxData[27]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[26]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_63\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[27]\);
    
    \dac_1/SIGMA_ADDER_0/temp_reg_cry_2\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_1/SIGMA_ADDER_0/sigma_register_Z[2]\, B
         => \dac_1/data_delta[2]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => \dac_1/SIGMA_ADDER_0/temp_reg_cry_1_Z\, 
        S => \dac_1/SIGMA_ADDER_0/temp_reg[2]\, Y => OPEN, FCO
         => \dac_1/SIGMA_ADDER_0/temp_reg_cry_2_Z\, CC => 
        NET_CC_CONFIG11, P => NET_CC_CONFIG9, UB => 
        NET_CC_CONFIG10);
    
    \spi_slave_0/index_n3_i_o2_0_RNIBMMH1\ : CFG4
      generic map(INIT => x"CFDF")

      port map(A => \spi_slave_0/index_Z[4]\, B => 
        \spi_slave_0/SCLK_old_Z\, C => 
        \spi_slave_0/SCLK_latched_Z\, D => \spi_slave_0/N_21\, Y
         => \spi_slave_0/N_149\);
    
    ip_interface_inst : IP_INTERFACE
      port map(A => ADLIB_VCC1, B => ff_to_start_net, C => 
        ADLIB_VCC1, IPA => OPEN, IPB => OPEN, IPC => OPEN);
    
    AFLSDF_INV_43 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_43\);
    
    \spi_miso_obuf/U0/U_IOTRI\ : IOTRI_OB_EB
      port map(D => spi_miso_c, E => ADLIB_VCC1, DOUT => 
        \spi_miso_obuf/U0/DOUT1\, EOUT => 
        \spi_miso_obuf/U0/EOUT1\);
    
    \dac_1/SIGMA_ADDER_0/sigma_register[15]\ : SLE
      port map(D => \dac_1/SIGMA_ADDER_0/temp_reg[15]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[15]\);
    
    AFLSDF_INV_94 : INV_BA
      port map(A => AND2_0_Y_arst, Y => \AFLSDF_INV_94\);
    
    AFLSDF_INV_104 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_104\);
    
    \data_receiver_0/data[16]\ : SLE
      port map(D => \spi_slave_0_DataRxd[16]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_64\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_left[0]\);
    
    \spi_slave_0/SS_latched_RNIF5U21\ : CFG3
      generic map(INIT => x"10")

      port map(A => \spi_slave_0/SS_latched_Z\, B => 
        \spi_slave_0/SCLK_old_Z\, C => 
        \spi_slave_0/SCLK_latched_Z\, Y => \spi_slave_0/N_4_i\);
    
    \dac_0/SIGMA_ADDER_0/sigma_register[16]\ : SLE
      port map(D => \dac_0/SIGMA_ADDER_0/temp_reg[16]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[16]\);
    
    AFLSDF_INV_88 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\, Y
         => \AFLSDF_INV_88\);
    
    AFLSDF_INV_11 : INV_BA
      port map(A => AND2_0_Y_arst, Y => \AFLSDF_INV_11\);
    
    \OSC_C0_0/OSC_C0_0/I_RCOSC_25_50MHZ\ : RCOSC_25_50MHZ
      generic map(FREQUENCY => 50.000000)

      port map(CLKOUT => 
        OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC);
    
    \spi_slave_0/TxData[2]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[1]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_65\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[2]\);
    
    \spi_ss_ibuf/U0/U_IOPAD\ : sdf_IOPAD_IN
      port map(PAD => spi_ss, Y => \spi_ss_ibuf/U0/YIN1\);
    
    \data_receiver_0/data[11]\ : SLE
      port map(D => \spi_slave_0_DataRxd[11]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_66\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_right[11]\);
    
    AFLSDF_INV_110 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\, Y
         => \AFLSDF_INV_110\);
    
    \spi_slave_0/TxData[17]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[16]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_67\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[17]\);
    
    \spi_slave_0/RxdData[1]\ : SLE
      port map(D => \spi_slave_0_DataRxd[0]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_68\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[1]\);
    
    AFLSDF_INV_29 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_29\);
    
    \dac_0/SIGMA_ADDER_0/temp_reg_cry_2\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_0/SIGMA_ADDER_0/sigma_register_Z[2]\, B
         => \dac_0/data_delta[2]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => \dac_0/SIGMA_ADDER_0/temp_reg_cry_1_Z\, 
        S => \dac_0/SIGMA_ADDER_0/temp_reg[2]\, Y => OPEN, FCO
         => \dac_0/SIGMA_ADDER_0/temp_reg_cry_2_Z\, CC => 
        NET_CC_CONFIG66, P => NET_CC_CONFIG64, UB => 
        NET_CC_CONFIG65);
    
    \spi_mosi_ibuf/U0/U_IOINFF\ : IOINFF_BYPASS
      port map(A => \spi_mosi_ibuf/U0/YIN1\, Y => 
        \spi_mosi_ibuf/U0/YIN\);
    
    \dac_0/SIGMA_ADDER_0/temp_reg_cry_15\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_0/SIGMA_ADDER_0/sigma_register_Z[15]\, B
         => \dac_0/data_delta[15]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_14_Z\, S => 
        \dac_0/SIGMA_ADDER_0/temp_reg[15]\, Y => OPEN, FCO => 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_15_Z\, CC => 
        NET_CC_CONFIG105, P => NET_CC_CONFIG103, UB => 
        NET_CC_CONFIG104);
    
    AFLSDF_INV_45 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_45\);
    
    \spi_slave_0/RxdData[10]\ : SLE
      port map(D => \spi_slave_0_DataRxd[9]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB2_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_69\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[10]\);
    
    \dac_0/DELTA_ADDER_0/data_out_1[12]\ : SLE
      port map(D => \data_receiver_0_data_left[12]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_0/data_delta[12]\);
    
    AFLSDF_INV_3 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_3\);
    
    \dac_1/SIGMA_ADDER_0/temp_reg_s_17\ : ARI1_CC
      generic map(INIT => x"46600")

      port map(A => ADLIB_VCC1, B => \dac_1/data_delta[16]\, C
         => dac_out_right_c, D => ADLIB_GND0, FCI => 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_16_Z\, S => 
        \dac_1/SIGMA_ADDER_0/temp_reg[17]\, Y => OPEN, FCO => 
        OPEN, CC => NET_CC_CONFIG56, P => NET_CC_CONFIG54, UB => 
        NET_CC_CONFIG55);
    
    \dac_0/DELTA_ADDER_0/data_out_1[13]\ : SLE
      port map(D => \data_receiver_0_data_left[13]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \dac_0/data_delta[13]\);
    
    AFLSDF_INV_98 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\, Y
         => \AFLSDF_INV_98\);
    
    \spi_slave_0/RxdData[28]\ : SLE
      port map(D => \spi_slave_0_DataRxd[27]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_70\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[28]\);
    
    \dac_1/SIGMA_ADDER_0/sigma_register[14]\ : SLE
      port map(D => \dac_1/SIGMA_ADDER_0/temp_reg[14]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[14]\);
    
    \dac_0/DELTA_ADDER_0/data_out_1[3]\ : SLE
      port map(D => \data_receiver_0_data_left[3]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \dac_0/data_delta[3]\);
    
    AFLSDF_INV_7 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_7\);
    
    AFLSDF_INV_64 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\, Y
         => \AFLSDF_INV_64\);
    
    \spi_miso_obuf/U0/U_IOPAD\ : sdf_IOPAD_TRI
      port map(PAD => spi_miso, D => \spi_miso_obuf/U0/DOUT\, E
         => \spi_miso_obuf/U0/EOUT\);
    
    \spi_mosi_ibuf/U0/U_IOIN\ : IOIN_IB
      port map(YIN => \spi_mosi_ibuf/U0/YIN\, E => ADLIB_GND0, Y
         => spi_mosi_c);
    
    \dac_out_left_obuf/U0/U_IOENFF\ : IOENFF_BYPASS
      port map(A => \dac_out_left_obuf/U0/EOUT1\, Y => 
        \dac_out_left_obuf/U0/EOUT\);
    
    \data_receiver_0/data[10]\ : SLE
      port map(D => \spi_slave_0_DataRxd[10]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_71\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_right[10]\);
    
    AFLSDF_INV_101 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_101\);
    
    \dac_1/DELTA_ADDER_0/data_out_1[11]\ : SLE
      port map(D => \data_receiver_0_data_right[11]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_1/data_delta[11]\);
    
    \dac_1/DELTA_ADDER_0/data_out_1[13]\ : SLE
      port map(D => \data_receiver_0_data_right[13]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_1/data_delta[13]\);
    
    \AND2_0_RNIKOS1/U0_RGB1_RGB1\ : RGB_NG
      port map(An => \AND2_0_RNIKOS1/U0_YNn_GSouth\, ENn => 
        ADLIB_GND0, YL => OPEN, YR => 
        \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\);
    
    \dac_0/SIGMA_ADDER_0/sigma_register[15]\ : SLE
      port map(D => \dac_0/SIGMA_ADDER_0/temp_reg[15]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[15]\);
    
    AND2_0_RNIKOS1 : GB_NG
      port map(An => \AFLSDF_INV_72\, ENn => ADLIB_GND0, YNn => 
        OPEN, YSn => \AND2_0_RNIKOS1/U0_YNn_GSouth\);
    
    AFLSDF_INV_23 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_23\);
    
    \spi_slave_0/RxdData[6]\ : SLE
      port map(D => \spi_slave_0_DataRxd[5]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbl_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_73\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[6]\);
    
    AFLSDF_INV_19 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_19\);
    
    \dac_0/SIGMA_ADDER_0/temp_reg_cry_13\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_0/SIGMA_ADDER_0/sigma_register_Z[13]\, B
         => \dac_0/data_delta[13]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_12_Z\, S => 
        \dac_0/SIGMA_ADDER_0/temp_reg[13]\, Y => OPEN, FCO => 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_13_Z\, CC => 
        NET_CC_CONFIG99, P => NET_CC_CONFIG97, UB => 
        NET_CC_CONFIG98);
    
    \FCCC_C0_0/FCCC_C0_0/CCC_INST/IP_INTERFACE_9\ : IP_INTERFACE
      port map(A => ADLIB_VCC1, B => ADLIB_GND0, C => ADLIB_VCC1, 
        IPA => \FCCC_C0_0/FCCC_C0_0/CCC_INST/PLL_BYPASS_N_net\, 
        IPB => \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX3_SEL_net\, IPC
         => \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[7]\);
    
    \dac_0/SIGMA_ADDER_0/temp_reg_cry_0_CC_0\ : CC_CONFIG
      port map(CI => ADLIB_VCC1, CO => CI_TO_CO57, P(0) => 
        ADLIB_VCC1, P(1) => ADLIB_VCC1, P(2) => ADLIB_GND0, P(3)
         => NET_CC_CONFIG58, P(4) => NET_CC_CONFIG61, P(5) => 
        NET_CC_CONFIG64, P(6) => NET_CC_CONFIG67, P(7) => 
        NET_CC_CONFIG70, P(8) => NET_CC_CONFIG73, P(9) => 
        NET_CC_CONFIG76, P(10) => NET_CC_CONFIG79, P(11) => 
        NET_CC_CONFIG82, UB(0) => ADLIB_VCC1, UB(1) => ADLIB_VCC1, 
        UB(2) => ADLIB_VCC1, UB(3) => NET_CC_CONFIG59, UB(4) => 
        NET_CC_CONFIG62, UB(5) => NET_CC_CONFIG65, UB(6) => 
        NET_CC_CONFIG68, UB(7) => NET_CC_CONFIG71, UB(8) => 
        NET_CC_CONFIG74, UB(9) => NET_CC_CONFIG77, UB(10) => 
        NET_CC_CONFIG80, UB(11) => NET_CC_CONFIG83, CC(0) => nc28, 
        CC(1) => nc14, CC(2) => nc5, CC(3) => NET_CC_CONFIG60, 
        CC(4) => NET_CC_CONFIG63, CC(5) => NET_CC_CONFIG66, CC(6)
         => NET_CC_CONFIG69, CC(7) => NET_CC_CONFIG72, CC(8) => 
        NET_CC_CONFIG75, CC(9) => NET_CC_CONFIG78, CC(10) => 
        NET_CC_CONFIG81, CC(11) => NET_CC_CONFIG84);
    
    \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB0\ : RGB_NG
      port map(An => 
        \data_receiver_0/dac_reset_RNILDSA/U0_YNn_GSouth\, ENn
         => ADLIB_GND0, YL => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB0_rgbl_net_1\, 
        YR => OPEN);
    
    AFLSDF_INV_4 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB0_rgbl_net_1\, Y
         => \AFLSDF_INV_4\);
    
    \FCCC_C0_0/FCCC_C0_0/CCC_INST/IP_INTERFACE_16\ : IP_INTERFACE
      port map(A => ADLIB_VCC1, B => ADLIB_VCC1, C => ADLIB_VCC1, 
        IPA => OPEN, IPB => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/GPD2_ARST_N_net\, IPC => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PADDR_net[6]\);
    
    \dac_0/SIGMA_ADDER_0/sigma_register[11]\ : SLE
      port map(D => \dac_0/SIGMA_ADDER_0/temp_reg[11]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[11]\);
    
    AFLSDF_INV_68 : INV_BA
      port map(A => AND2_0_Y_arst, Y => \AFLSDF_INV_68\);
    
    \spi_mosi_ibuf/U0/U_IOPAD\ : sdf_IOPAD_IN
      port map(PAD => spi_mosi, Y => \spi_mosi_ibuf/U0/YIN1\);
    
    \dac_0/DELTA_ADDER_0/data_out_1[4]\ : SLE
      port map(D => \data_receiver_0_data_left[4]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \dac_0/data_delta[4]\);
    
    \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1\ : 
        RGB_NG
      port map(An => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_YNn_GSouth\, 
        ENn => ADLIB_GND0, YL => spi_slave_0_SPI_DONE, YR => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_YR\);
    
    \spi_slave_0/RxdData[27]\ : SLE
      port map(D => \spi_slave_0_DataRxd[26]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_74\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[27]\);
    
    \dac_0/DELTA_ADDER_0/data_out_1[16]\ : SLE
      port map(D => dac_out_left_c, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \dac_0/data_delta[16]\);
    
    AFLSDF_INV_57 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_57\);
    
    \dac_1/SIGMA_ADDER_0/temp_reg_cry_5\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_1/SIGMA_ADDER_0/sigma_register_Z[5]\, B
         => \dac_1/data_delta[5]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => \dac_1/SIGMA_ADDER_0/temp_reg_cry_4_Z\, 
        S => \dac_1/SIGMA_ADDER_0/temp_reg[5]\, Y => OPEN, FCO
         => \dac_1/SIGMA_ADDER_0/temp_reg_cry_5_Z\, CC => 
        NET_CC_CONFIG20, P => NET_CC_CONFIG18, UB => 
        NET_CC_CONFIG19);
    
    \spi_slave_0/SPI_DONE\ : SLE
      port map(D => \spi_slave_0/SPI_DONE_0_sqmuxa_0_0\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbl_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_75\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \spi_slave_0/SPI_DONE_Z\);
    
    \dac_out_right_obuf/U0/U_IOPAD\ : sdf_IOPAD_TRI
      port map(PAD => dac_out_right, D => 
        \dac_out_right_obuf/U0/DOUT\, E => 
        \dac_out_right_obuf/U0/EOUT\);
    
    \dac_0/SIGMA_ADDER_0/sigma_register[13]\ : SLE
      port map(D => \dac_0/SIGMA_ADDER_0/temp_reg[13]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[13]\);
    
    \data_receiver_0/data[28]\ : SLE
      port map(D => \spi_slave_0_DataRxd[28]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_YR\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_76\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_left[12]\);
    
    AFLSDF_INV_34 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_34\);
    
    \spi_slave_0/TxData[20]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[19]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_77\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[20]\);
    
    AFLSDF_INV_25 : INV_BA
      port map(A => \data_receiver_0/dac_reset_Z\, Y => 
        \AFLSDF_INV_25\);
    
    \data_receiver_0/data[19]\ : SLE
      port map(D => \spi_slave_0_DataRxd[19]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_YR\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_78\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_left[3]\);
    
    AFLSDF_INV_74 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_74\);
    
    \FCCC_C0_0/FCCC_C0_0/CCC_INST/IP_INTERFACE_17\ : IP_INTERFACE
      port map(A => ADLIB_VCC1, B => ADLIB_VCC1, C => ADLIB_VCC1, 
        IPA => OPEN, IPB => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/GPD3_ARST_N_net\, IPC => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PADDR_net[7]\);
    
    \data_receiver_0/data[5]\ : SLE
      port map(D => \spi_slave_0_DataRxd[5]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_79\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_right[5]\);
    
    \spi_slave_0/TxData[30]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[29]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_80\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[30]\);
    
    \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1\ : RGB_NG
      port map(An => 
        \data_receiver_0/dac_reset_RNILDSA/U0_YNn_GSouth\, ENn
         => ADLIB_GND0, YL => OPEN, YR => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\);
    
    \data_receiver_0/data[31]\ : SLE
      port map(D => \spi_slave_0_DataRxd[31]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_81\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_left[15]\);
    
    AFLSDF_INV_13 : INV_BA
      port map(A => AND2_0_Y_arst, Y => \AFLSDF_INV_13\);
    
    \dac_0/SIGMA_ADDER_0/temp_reg_cry_5\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_0/SIGMA_ADDER_0/sigma_register_Z[5]\, B
         => \dac_0/data_delta[5]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => \dac_0/SIGMA_ADDER_0/temp_reg_cry_4_Z\, 
        S => \dac_0/SIGMA_ADDER_0/temp_reg[5]\, Y => OPEN, FCO
         => \dac_0/SIGMA_ADDER_0/temp_reg_cry_5_Z\, CC => 
        NET_CC_CONFIG75, P => NET_CC_CONFIG73, UB => 
        NET_CC_CONFIG74);
    
    \dac_0/SIGMA_ADDER_0/sigma_register[10]\ : SLE
      port map(D => \dac_0/SIGMA_ADDER_0/temp_reg[10]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[10]\);
    
    \spi_slave_0/TxData[6]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[5]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_82\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[6]\);
    
    \dac_1/SIGMA_ADDER_0/temp_reg_cry_16\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_1/SIGMA_ADDER_0/sigma_register_Z[16]\, B
         => \dac_1/data_delta[16]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_15_Z\, S => 
        \dac_1/SIGMA_ADDER_0/temp_reg[16]\, Y => OPEN, FCO => 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_16_Z\, CC => 
        NET_CC_CONFIG53, P => NET_CC_CONFIG51, UB => 
        NET_CC_CONFIG52);
    
    \spi_slave_0/TxData[10]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[9]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_83\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[10]\);
    
    \spi_slave_0/SCLK_latched\ : SLE
      port map(D => spi_sck_c, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_84\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \spi_slave_0/SCLK_latched_Z\);
    
    \spi_slave_0/RxdData[23]\ : SLE
      port map(D => \spi_slave_0_DataRxd[22]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_85\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[23]\);
    
    \spi_slave_0/MOSI_latched\ : SLE
      port map(D => spi_mosi_c, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_86\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \spi_slave_0/MOSI_latched_Z\);
    
    \spi_sck_ibuf/U0/U_IOIN\ : IOIN_IB
      port map(YIN => \spi_sck_ibuf/U0/YIN\, E => ADLIB_GND0, Y
         => spi_sck_c);
    
    \spi_slave_0/RxdData[15]\ : SLE
      port map(D => \spi_slave_0_DataRxd[14]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB2_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_87\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[15]\);
    
    \dac_1/SIGMA_ADDER_0/temp_reg_cry_14\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_1/SIGMA_ADDER_0/sigma_register_Z[14]\, B
         => \dac_1/data_delta[14]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_13_Z\, S => 
        \dac_1/SIGMA_ADDER_0/temp_reg[14]\, Y => OPEN, FCO => 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_14_Z\, CC => 
        NET_CC_CONFIG47, P => NET_CC_CONFIG45, UB => 
        NET_CC_CONFIG46);
    
    \dac_1/SIGMA_ADDER_0/temp_reg_cry_12\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_1/SIGMA_ADDER_0/sigma_register_Z[12]\, B
         => \dac_1/data_delta[12]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_11_Z\, S => 
        \dac_1/SIGMA_ADDER_0/temp_reg[12]\, Y => OPEN, FCO => 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_12_Z\, CC => 
        NET_CC_CONFIG41, P => NET_CC_CONFIG39, UB => 
        NET_CC_CONFIG40);
    
    AFLSDF_INV_38 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_38\);
    
    \spi_slave_0/index_n4_i\ : CFG4
      generic map(INIT => x"EBFF")

      port map(A => \spi_slave_0/SCLK_old_Z\, B => 
        \spi_slave_0/index_Z[4]\, C => \spi_slave_0/N_21\, D => 
        \spi_slave_0/SCLK_latched_Z\, Y => \spi_slave_0/N_8\);
    
    AFLSDF_INV_44 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB0_rgbl_net_1\, Y
         => \AFLSDF_INV_44\);
    
    AFLSDF_INV_78 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_78\);
    
    \spi_slave_0/RxdData[9]\ : SLE
      port map(D => \spi_slave_0_DataRxd[8]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB2_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_88\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[9]\);
    
    \dac_1/DELTA_ADDER_0/data_out_1[12]\ : SLE
      port map(D => \data_receiver_0_data_right[12]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_1/data_delta[12]\);
    
    \dac_0/DELTA_ADDER_0/data_out_1[1]\ : SLE
      port map(D => \data_receiver_0_data_left[1]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_0/data_delta[1]\);
    
    AFLSDF_INV_15 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_15\);
    
    AFLSDF_INV_2 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\, Y
         => \AFLSDF_INV_2\);
    
    \data_receiver_0/data[30]\ : SLE
      port map(D => \spi_slave_0_DataRxd[30]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_YR\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_89\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_left[14]\);
    
    AFLSDF_INV_80 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_80\);
    
    \spi_slave_0/index_n2_i\ : CFG3
      generic map(INIT => x"EB")

      port map(A => \spi_slave_0/N_149\, B => 
        \spi_slave_0/index_Z[2]\, C => \spi_slave_0/N_19\, Y => 
        \spi_slave_0/N_12\);
    
    \data_receiver_0/data[24]\ : SLE
      port map(D => \spi_slave_0_DataRxd[24]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_YR\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_90\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_left[8]\);
    
    \spi_slave_0/SS_latched_RNIF5U21_0\ : CFG3
      generic map(INIT => x"04")

      port map(A => \spi_slave_0/SS_latched_Z\, B => 
        \spi_slave_0/SCLK_old_Z\, C => 
        \spi_slave_0/SCLK_latched_Z\, Y => \spi_slave_0/N_2_i\);
    
    \spi_slave_0/TxData[22]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[21]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_91\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[22]\);
    
    \dac_0/SIGMA_ADDER_0/sigma_register[3]\ : SLE
      port map(D => \dac_0/SIGMA_ADDER_0/temp_reg[3]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[3]\);
    
    \FCCC_C0_0/FCCC_C0_0/CCC_INST/IP_INTERFACE_3\ : IP_INTERFACE
      port map(A => ADLIB_GND0, B => ADLIB_GND0, C => ADLIB_VCC1, 
        IPA => \FCCC_C0_0/FCCC_C0_0/CCC_INST/PRESET_N_net\, IPB
         => \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX1_SEL_net\, IPC
         => \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[1]\);
    
    \spi_ss_ibuf/U0/U_IOINFF\ : IOINFF_BYPASS
      port map(A => \spi_ss_ibuf/U0/YIN1\, Y => 
        \spi_ss_ibuf/U0/YIN\);
    
    AFLSDF_INV_48 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_48\);
    
    \dac_out_left_obuf/U0/U_IOPAD\ : sdf_IOPAD_TRI
      port map(PAD => dac_out_left, D => 
        \dac_out_left_obuf/U0/DOUT\, E => 
        \dac_out_left_obuf/U0/EOUT\);
    
    \dac_1/SIGMA_ADDER_0/sigma_register[3]\ : SLE
      port map(D => \dac_1/SIGMA_ADDER_0/temp_reg[3]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[3]\);
    
    \SYSRESET_0/INST_SYSRESET_FF_IP\ : SYSRESET_FF
      port map(UDRCAP => OPEN, UDRSH => OPEN, UDRUPD => OPEN, 
        UIREG(7) => nc21, UIREG(6) => nc15, UIREG(5) => nc3, 
        UIREG(4) => nc10, UIREG(3) => nc7, UIREG(2) => nc17, 
        UIREG(1) => nc4, UIREG(0) => nc12, URSTB => OPEN, UDRCK
         => OPEN, UTDI => OPEN, POWER_ON_RESET_N => 
        SYSRESET_0_POWER_ON_RESET_N, FF_TO_START => 
        ff_to_start_net, FF_DONE => OPEN, UTDO => 
        \SYSRESET_0/UTDO_net\, DEVRST_N => DEVRST_N, TDI => 
        ADLIB_VCC1, TMS => ADLIB_VCC1, TCK => ADLIB_VCC1, TRSTB
         => ADLIB_VCC1, TDO => OPEN);
    
    AFLSDF_INV_90 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_90\);
    
    \dac_0/DELTA_ADDER_0/data_out_1[2]\ : SLE
      port map(D => \data_receiver_0_data_left[2]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB2_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB2_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_0/data_delta[2]\);
    
    \FCCC_C0_0/FCCC_C0_0/CCC_INST/IP_INTERFACE_2\ : IP_INTERFACE
      port map(A => ADLIB_VCC1, B => ADLIB_GND0, C => ADLIB_VCC1, 
        IPA => \FCCC_C0_0/FCCC_C0_0/CCC_INST/PCLK_net\, IPB => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX0_SEL_net\, IPC => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[0]\);
    
    \spi_slave_0/TxData[12]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[11]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_92\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[12]\);
    
    \FCCC_C0_0/FCCC_C0_0/CCC_INST/IP_INTERFACE_11\ : IP_INTERFACE
      port map(A => ADLIB_VCC1, B => ADLIB_VCC1, C => ADLIB_VCC1, 
        IPA => \FCCC_C0_0/FCCC_C0_0/CCC_INST/PLL_POWERDOWN_N_net\, 
        IPB => \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX3_HOLD_N_net\, 
        IPC => OPEN);
    
    \dac_1/SIGMA_ADDER_0/temp_reg_cry_11\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_1/SIGMA_ADDER_0/sigma_register_Z[11]\, B
         => \dac_1/data_delta[11]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_10_Z\, S => 
        \dac_1/SIGMA_ADDER_0/temp_reg[11]\, Y => OPEN, FCO => 
        \dac_1/SIGMA_ADDER_0/temp_reg_cry_11_Z\, CC => 
        NET_CC_CONFIG38, P => NET_CC_CONFIG36, UB => 
        NET_CC_CONFIG37);
    
    \data_receiver_0/data[25]\ : SLE
      port map(D => \spi_slave_0_DataRxd[25]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_YR\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_93\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_left[9]\);
    
    \FCCC_C0_0/FCCC_C0_0/CCC_INST/IP_INTERFACE_15\ : IP_INTERFACE
      port map(A => ADLIB_VCC1, B => ADLIB_VCC1, C => ADLIB_VCC1, 
        IPA => \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX3_ARST_N_net\, 
        IPB => \FCCC_C0_0/FCCC_C0_0/CCC_INST/GPD1_ARST_N_net\, 
        IPC => \FCCC_C0_0/FCCC_C0_0/CCC_INST/PADDR_net[5]\);
    
    \spi_miso_obuf/U0/U_IOENFF\ : IOENFF_BYPASS
      port map(A => \spi_miso_obuf/U0/EOUT1\, Y => 
        \spi_miso_obuf/U0/EOUT\);
    
    \dac_1/SIGMA_ADDER_0/temp_reg_cry_8\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_1/SIGMA_ADDER_0/sigma_register_Z[8]\, B
         => \dac_1/data_delta[8]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => \dac_1/SIGMA_ADDER_0/temp_reg_cry_7_Z\, 
        S => \dac_1/SIGMA_ADDER_0/temp_reg[8]\, Y => OPEN, FCO
         => \dac_1/SIGMA_ADDER_0/temp_reg_cry_8_Z\, CC => 
        NET_CC_CONFIG29, P => NET_CC_CONFIG27, UB => 
        NET_CC_CONFIG28);
    
    AFLSDF_INV_1 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_1\);
    
    \spi_slave_0/index[4]\ : SLE
      port map(D => \spi_slave_0/N_8\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => \spi_slave_0/N_17_i\, ALn => \AFLSDF_INV_94\, ADn
         => ADLIB_GND0, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0/index_Z[4]\);
    
    \FCCC_C0_0/FCCC_C0_0/CCC_INST/IP_INTERFACE_14\ : IP_INTERFACE
      port map(A => ADLIB_VCC1, B => ADLIB_VCC1, C => ADLIB_VCC1, 
        IPA => \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX2_ARST_N_net\, 
        IPB => \FCCC_C0_0/FCCC_C0_0/CCC_INST/GPD0_ARST_N_net\, 
        IPC => \FCCC_C0_0/FCCC_C0_0/CCC_INST/PADDR_net[4]\);
    
    AFLSDF_INV_52 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_52\);
    
    AFLSDF_INV_24 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\, Y
         => \AFLSDF_INV_24\);
    
    \dac_0/DELTA_ADDER_0/data_out_1[7]\ : SLE
      port map(D => \data_receiver_0_data_left[7]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \dac_0/data_delta[7]\);
    
    AND2_0 : CFG2
      generic map(INIT => x"8")

      port map(A => FCCC_C0_0_LOCK, B => 
        SYSRESET_0_POWER_ON_RESET_N, Y => AND2_0_Y);
    
    \dac_1/SIGMA_ADDER_0/temp_reg_cry_0_CC_1\ : CC_CONFIG
      port map(CI => CI_TO_CO2, CO => OPEN, P(0) => 
        NET_CC_CONFIG33, P(1) => NET_CC_CONFIG36, P(2) => 
        NET_CC_CONFIG39, P(3) => NET_CC_CONFIG42, P(4) => 
        NET_CC_CONFIG45, P(5) => NET_CC_CONFIG48, P(6) => 
        NET_CC_CONFIG51, P(7) => NET_CC_CONFIG54, P(8) => 
        ADLIB_VCC1, P(9) => ADLIB_VCC1, P(10) => ADLIB_VCC1, 
        P(11) => ADLIB_VCC1, UB(0) => NET_CC_CONFIG34, UB(1) => 
        NET_CC_CONFIG37, UB(2) => NET_CC_CONFIG40, UB(3) => 
        NET_CC_CONFIG43, UB(4) => NET_CC_CONFIG46, UB(5) => 
        NET_CC_CONFIG49, UB(6) => NET_CC_CONFIG52, UB(7) => 
        NET_CC_CONFIG55, UB(8) => ADLIB_VCC1, UB(9) => ADLIB_VCC1, 
        UB(10) => ADLIB_VCC1, UB(11) => ADLIB_VCC1, CC(0) => 
        NET_CC_CONFIG35, CC(1) => NET_CC_CONFIG38, CC(2) => 
        NET_CC_CONFIG41, CC(3) => NET_CC_CONFIG44, CC(4) => 
        NET_CC_CONFIG47, CC(5) => NET_CC_CONFIG50, CC(6) => 
        NET_CC_CONFIG53, CC(7) => NET_CC_CONFIG56, CC(8) => nc2, 
        CC(9) => nc23, CC(10) => nc18, CC(11) => nc26);
    
    \spi_slave_0/TxData[5]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[4]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_95\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[5]\);
    
    \spi_slave_0/RxdData[8]\ : SLE
      port map(D => \spi_slave_0_DataRxd[7]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbl_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_96\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[8]\);
    
    \dac_0/SIGMA_ADDER_0/temp_reg_s_17\ : ARI1_CC
      generic map(INIT => x"46600")

      port map(A => ADLIB_VCC1, B => \dac_0/data_delta[16]\, C
         => dac_out_left_c, D => ADLIB_GND0, FCI => 
        \dac_0/SIGMA_ADDER_0/temp_reg_cry_16_Z\, S => 
        \dac_0/SIGMA_ADDER_0/temp_reg[17]\, Y => OPEN, FCO => 
        OPEN, CC => NET_CC_CONFIG111, P => NET_CC_CONFIG109, UB
         => NET_CC_CONFIG110);
    
    \dac_0/SIGMA_ADDER_0/temp_reg_cry_8\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_0/SIGMA_ADDER_0/sigma_register_Z[8]\, B
         => \dac_0/data_delta[8]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => \dac_0/SIGMA_ADDER_0/temp_reg_cry_7_Z\, 
        S => \dac_0/SIGMA_ADDER_0/temp_reg[8]\, Y => OPEN, FCO
         => \dac_0/SIGMA_ADDER_0/temp_reg_cry_8_Z\, CC => 
        NET_CC_CONFIG84, P => NET_CC_CONFIG82, UB => 
        NET_CC_CONFIG83);
    
    AFLSDF_INV_60 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\, Y
         => \AFLSDF_INV_60\);
    
    \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB0\ : 
        RGB_NG
      port map(An => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_YNn_GSouth\, 
        ENn => ADLIB_GND0, YL => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB0_rgbl_net_1\, 
        YR => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB0_rgbr_net_1\);
    
    \dac_1/DELTA_ADDER_0/data_out_1[15]\ : SLE
      port map(D => \data_receiver_0_data_right[15]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_1/data_delta[15]\);
    
    \spi_slave_0/RxdData[7]\ : SLE
      port map(D => \spi_slave_0_DataRxd[6]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbl_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_97\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[7]\);
    
    \data_receiver_0/data[13]\ : SLE
      port map(D => \spi_slave_0_DataRxd[13]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_98\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_right[13]\);
    
    \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25\ : GB_NG
      port map(An => \AFLSDF_INV_99\, ENn => ADLIB_GND0, YNn => 
        OPEN, YSn => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_YNn_GSouth\);
    
    \dac_1/DELTA_ADDER_0/data_out_1[3]\ : SLE
      port map(D => \data_receiver_0_data_right[3]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_1/data_delta[3]\);
    
    AFLSDF_INV_28 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\, Y
         => \AFLSDF_INV_28\);
    
    \spi_sck_ibuf/U0/U_IOPAD\ : sdf_IOPAD_IN
      port map(PAD => spi_sck, Y => \spi_sck_ibuf/U0/YIN1\);
    
    AFLSDF_INV_14 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB0_rgbl_net_1\, Y
         => \AFLSDF_INV_14\);
    
    AFLSDF_INV_56 : INV_BA
      port map(A => AND2_0_Y_arst, Y => \AFLSDF_INV_56\);
    
    \spi_slave_0/RxdData[11]\ : SLE
      port map(D => \spi_slave_0_DataRxd[10]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB2_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_100\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[11]\);
    
    \data_receiver_0/data[27]\ : SLE
      port map(D => \spi_slave_0_DataRxd[27]\, CLK => 
        \spi_slave_0/SPI_DONE_inferred_clock_RNIDF25/U0_RGB1_YR\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_101\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \data_receiver_0_data_left[11]\);
    
    \dac_0/SIGMA_ADDER_0/sigma_register[12]\ : SLE
      port map(D => \dac_0/SIGMA_ADDER_0/temp_reg[12]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => 
        \dac_0/SIGMA_ADDER_0/sigma_register_Z[12]\);
    
    \dac_out_left_obuf/U0/U_IOTRI\ : IOTRI_OB_EB
      port map(D => dac_out_left_c, E => ADLIB_VCC1, DOUT => 
        \dac_out_left_obuf/U0/DOUT1\, EOUT => 
        \dac_out_left_obuf/U0/EOUT1\);
    
    AFLSDF_INV_30 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB0_rgbl_net_1\, Y
         => \AFLSDF_INV_30\);
    
    \FCCC_C0_0/FCCC_C0_0/CCC_INST/IP_INTERFACE_6\ : IP_INTERFACE
      port map(A => ADLIB_VCC1, B => ADLIB_VCC1, C => ADLIB_VCC1, 
        IPA => \FCCC_C0_0/FCCC_C0_0/CCC_INST/CLK2_net\, IPB => 
        OPEN, IPC => \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[4]\);
    
    AFLSDF_INV_87 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\, Y
         => \AFLSDF_INV_87\);
    
    \spi_slave_0/index_n3_i_o2_0\ : CFG4
      generic map(INIT => x"FFFE")

      port map(A => \spi_slave_0/index_Z[1]\, B => 
        \spi_slave_0/index_Z[3]\, C => \spi_slave_0/index_Z[0]\, 
        D => \spi_slave_0/index_Z[2]\, Y => \spi_slave_0/N_21\);
    
    AFLSDF_INV_70 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_70\);
    
    \spi_slave_0/RxdData[29]\ : SLE
      port map(D => \spi_slave_0_DataRxd[28]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_102\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[29]\);
    
    \dac_1/DELTA_ADDER_0/data_out_1[4]\ : SLE
      port map(D => \data_receiver_0_data_right[4]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_1/data_delta[4]\);
    
    \spi_slave_0/TxData[21]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[20]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_103\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[21]\);
    
    \dac_1/DELTA_ADDER_0/data_out_1[16]\ : SLE
      port map(D => dac_out_right_c, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_1/data_delta[16]\);
    
    AFLSDF_INV_18 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_18\);
    
    \dac_1/SIGMA_ADDER_0/sigma_register[11]\ : SLE
      port map(D => \dac_1/SIGMA_ADDER_0/temp_reg[11]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB1_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB1_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => 
        \dac_1/SIGMA_ADDER_0/sigma_register_Z[11]\);
    
    \dac_out_right_obuf/U0/U_IOENFF\ : IOENFF_BYPASS
      port map(A => \dac_out_right_obuf/U0/EOUT1\, Y => 
        \dac_out_right_obuf/U0/EOUT\);
    
    \spi_ss_ibuf/U0/U_IOIN\ : IOIN_IB
      port map(YIN => \spi_ss_ibuf/U0/YIN\, E => ADLIB_GND0, Y
         => spi_ss_c);
    
    \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0\ : RGB_NG
      port map(An => \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_YNn_GSouth\, 
        ENn => ADLIB_GND0, YL => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbl_net_1\, 
        YR => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\);
    
    \dac_1/SIGMA_ADDER_0/temp_reg_cry_0_CC_0\ : CC_CONFIG
      port map(CI => ADLIB_VCC1, CO => CI_TO_CO2, P(0) => 
        ADLIB_VCC1, P(1) => ADLIB_GND0, P(2) => NET_CC_CONFIG3, 
        P(3) => NET_CC_CONFIG6, P(4) => NET_CC_CONFIG9, P(5) => 
        NET_CC_CONFIG12, P(6) => NET_CC_CONFIG15, P(7) => 
        NET_CC_CONFIG18, P(8) => NET_CC_CONFIG21, P(9) => 
        NET_CC_CONFIG24, P(10) => NET_CC_CONFIG27, P(11) => 
        NET_CC_CONFIG30, UB(0) => ADLIB_VCC1, UB(1) => ADLIB_VCC1, 
        UB(2) => NET_CC_CONFIG4, UB(3) => NET_CC_CONFIG7, UB(4)
         => NET_CC_CONFIG10, UB(5) => NET_CC_CONFIG13, UB(6) => 
        NET_CC_CONFIG16, UB(7) => NET_CC_CONFIG19, UB(8) => 
        NET_CC_CONFIG22, UB(9) => NET_CC_CONFIG25, UB(10) => 
        NET_CC_CONFIG28, UB(11) => NET_CC_CONFIG31, CC(0) => nc6, 
        CC(1) => nc11, CC(2) => NET_CC_CONFIG5, CC(3) => 
        NET_CC_CONFIG8, CC(4) => NET_CC_CONFIG11, CC(5) => 
        NET_CC_CONFIG14, CC(6) => NET_CC_CONFIG17, CC(7) => 
        NET_CC_CONFIG20, CC(8) => NET_CC_CONFIG23, CC(9) => 
        NET_CC_CONFIG26, CC(10) => NET_CC_CONFIG29, CC(11) => 
        NET_CC_CONFIG32);
    
    \dac_0/DELTA_ADDER_0/data_out_1[0]\ : SLE
      port map(D => \data_receiver_0_data_left[0]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB2_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB2_rgbr_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_0/data_delta[0]\);
    
    \spi_slave_0/TxData[31]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[30]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_104\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => spi_miso_c);
    
    \FCCC_C0_0/FCCC_C0_0/CCC_INST/IP_INTERFACE_13\ : IP_INTERFACE
      port map(A => ADLIB_VCC1, B => ADLIB_VCC1, C => ADLIB_VCC1, 
        IPA => \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX1_ARST_N_net\, 
        IPB => OPEN, IPC => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PADDR_net[3]\);
    
    \dac_0/DELTA_ADDER_0/data_out_1[9]\ : SLE
      port map(D => \data_receiver_0_data_left[9]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_YR\, EN => 
        ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_YR\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \dac_0/data_delta[9]\);
    
    \spi_slave_0/RxdData[12]\ : SLE
      port map(D => \spi_slave_0_DataRxd[11]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB2_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_105\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[12]\);
    
    AFLSDF_INV_97 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB0_rgbl_net_1\, Y
         => \AFLSDF_INV_97\);
    
    \spi_slave_0/TxData[11]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[10]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_106\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[11]\);
    
    \spi_slave_0/SS_latched\ : SLE
      port map(D => spi_ss_c, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_107\, ADn => 
        ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT => 
        ADLIB_GND0, Q => \spi_slave_0/SS_latched_Z\);
    
    \FCCC_C0_0/FCCC_C0_0/GL0_INST\ : GB_NG
      port map(An => \AFLSDF_INV_108\, ENn => ADLIB_GND0, YNn => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_YNn\, YSn => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_YNn_GSouth\);
    
    AFLSDF_INV_105 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_RGB1_rgbr_net_1\, Y
         => \AFLSDF_INV_105\);
    
    AFLSDF_INV_40 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_40\);
    
    \dac_1/SIGMA_ADDER_0/temp_reg_cry_4\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_1/SIGMA_ADDER_0/sigma_register_Z[4]\, B
         => \dac_1/data_delta[4]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => \dac_1/SIGMA_ADDER_0/temp_reg_cry_3_Z\, 
        S => \dac_1/SIGMA_ADDER_0/temp_reg[4]\, Y => OPEN, FCO
         => \dac_1/SIGMA_ADDER_0/temp_reg_cry_4_Z\, CC => 
        NET_CC_CONFIG17, P => NET_CC_CONFIG15, UB => 
        NET_CC_CONFIG16);
    
    AFLSDF_INV_51 : INV_BA
      port map(A => \AND2_0_RNIKOS1/U0_RGB1_YR\, Y => 
        \AFLSDF_INV_51\);
    
    \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB2\ : RGB_NG
      port map(An => 
        \data_receiver_0/dac_reset_RNILDSA/U0_YNn_GSouth\, ENn
         => ADLIB_GND0, YL => OPEN, YR => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB2_rgbr_net_1\);
    
    \spi_slave_0/TxData[1]\ : SLE
      port map(D => \spi_slave_0/TxData_Z[0]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbr_net_1\, 
        EN => ADLIB_VCC1, ALn => \AFLSDF_INV_109\, ADn => 
        ADLIB_VCC1, SLn => \spi_slave_0/N_2_i\, SD => ADLIB_VCC1, 
        LAT => ADLIB_GND0, Q => \spi_slave_0/TxData_Z[1]\);
    
    \FCCC_C0_0/FCCC_C0_0/CCC_INST/IP_INTERFACE_0\ : IP_INTERFACE
      port map(A => ADLIB_VCC1, B => ADLIB_VCC1, C => ADLIB_VCC1, 
        IPA => \FCCC_C0_0/FCCC_C0_0/CCC_INST/CLK0_net\, IPB => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PSEL_net\, IPC => OPEN);
    
    \spi_slave_0/RxdData[14]\ : SLE
      port map(D => \spi_slave_0_DataRxd[13]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB2_rgbr_net_1\, 
        EN => \spi_slave_0/N_4_i\, ALn => \AFLSDF_INV_110\, ADn
         => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, LAT
         => ADLIB_GND0, Q => \spi_slave_0_DataRxd[14]\);
    
    \FCCC_C0_0/FCCC_C0_0/CCC_INST/IP_INTERFACE_5\ : IP_INTERFACE
      port map(A => ADLIB_VCC1, B => ADLIB_VCC1, C => ADLIB_VCC1, 
        IPA => OPEN, IPB => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/NGMUX1_HOLD_N_net\, IPC => 
        \FCCC_C0_0/FCCC_C0_0/CCC_INST/PWDATA_net[3]\);
    
    \dac_1/DELTA_ADDER_0/data_out_1[1]\ : SLE
      port map(D => \data_receiver_0_data_right[1]\, CLK => 
        \FCCC_C0_0/FCCC_C0_0/GL0_INST/U0_RGB1_RGB0_rgbl_net_1\, 
        EN => ADLIB_VCC1, ALn => 
        \data_receiver_0/dac_reset_RNILDSA/U0_RGB1_RGB0_rgbl_net_1\, 
        ADn => ADLIB_VCC1, SLn => ADLIB_VCC1, SD => ADLIB_GND0, 
        LAT => ADLIB_GND0, Q => \dac_1/data_delta[1]\);
    
    \dac_0/SIGMA_ADDER_0/temp_reg_cry_4\ : ARI1_CC
      generic map(INIT => x"555AA")

      port map(A => \dac_0/SIGMA_ADDER_0/sigma_register_Z[4]\, B
         => \dac_0/data_delta[4]\, C => ADLIB_GND0, D => 
        ADLIB_GND0, FCI => \dac_0/SIGMA_ADDER_0/temp_reg_cry_3_Z\, 
        S => \dac_0/SIGMA_ADDER_0/temp_reg[4]\, Y => OPEN, FCO
         => \dac_0/SIGMA_ADDER_0/temp_reg_cry_4_Z\, CC => 
        NET_CC_CONFIG72, P => NET_CC_CONFIG70, UB => 
        NET_CC_CONFIG71);
    
    GND_power_inst1 : GND
      port map( Y => GND_power_net1);

    VCC_power_inst1 : VCC
      port map( Y => VCC_power_net1);


end DEF_ARCH; 
