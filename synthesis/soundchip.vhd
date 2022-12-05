-- Version: 2022.2 2022.2.0.10

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity delta_adder_0 is

    port( data_receiver_0_data_right : in    std_logic_vector(15 downto 0);
          data_delta                 : out   std_logic_vector(16 downto 0);
          dac_out_right_c            : in    std_logic;
          clk_debug                  : in    std_logic;
          dac_reset_i                : in    std_logic
        );

end delta_adder_0;

architecture DEF_ARCH of delta_adder_0 is 

  component GND
    port( Y : out   std_logic
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

  component VCC
    port( Y : out   std_logic
        );
  end component;

    signal \VCC\, \GND\ : std_logic;

begin 


    GND_Z : GND
      port map(Y => \GND\);
    
    \data_out_1[4]\ : SLE
      port map(D => data_receiver_0_data_right(4), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(4));
    
    VCC_Z : VCC
      port map(Y => \VCC\);
    
    \data_out_1[7]\ : SLE
      port map(D => data_receiver_0_data_right(7), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(7));
    
    \data_out_1[10]\ : SLE
      port map(D => data_receiver_0_data_right(10), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(10));
    
    \data_out_1[9]\ : SLE
      port map(D => data_receiver_0_data_right(9), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(9));
    
    \data_out_1[15]\ : SLE
      port map(D => data_receiver_0_data_right(15), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(15));
    
    \data_out_1[8]\ : SLE
      port map(D => data_receiver_0_data_right(8), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(8));
    
    \data_out_1[16]\ : SLE
      port map(D => dac_out_right_c, CLK => clk_debug, EN => 
        \VCC\, ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD
         => \GND\, LAT => \GND\, Q => data_delta(16));
    
    \data_out_1[5]\ : SLE
      port map(D => data_receiver_0_data_right(5), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(5));
    
    \data_out_1[13]\ : SLE
      port map(D => data_receiver_0_data_right(13), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(13));
    
    \data_out_1[6]\ : SLE
      port map(D => data_receiver_0_data_right(6), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(6));
    
    \data_out_1[3]\ : SLE
      port map(D => data_receiver_0_data_right(3), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(3));
    
    \data_out_1[11]\ : SLE
      port map(D => data_receiver_0_data_right(11), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(11));
    
    \data_out_1[12]\ : SLE
      port map(D => data_receiver_0_data_right(12), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(12));
    
    \data_out_1[2]\ : SLE
      port map(D => data_receiver_0_data_right(2), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(2));
    
    \data_out_1[1]\ : SLE
      port map(D => data_receiver_0_data_right(1), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(1));
    
    \data_out_1[0]\ : SLE
      port map(D => data_receiver_0_data_right(0), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(0));
    
    \data_out_1[14]\ : SLE
      port map(D => data_receiver_0_data_right(14), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(14));
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity sigma_adder_0 is

    port( data_delta      : in    std_logic_vector(16 downto 0);
          dac_out_right_c : out   std_logic;
          clk_debug       : in    std_logic;
          dac_reset_i     : in    std_logic
        );

end sigma_adder_0;

architecture DEF_ARCH of sigma_adder_0 is 

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

  component ARI1
    generic (INIT:std_logic_vector(19 downto 0) := x"00000");

    port( A   : in    std_logic := 'U';
          B   : in    std_logic := 'U';
          C   : in    std_logic := 'U';
          D   : in    std_logic := 'U';
          FCI : in    std_logic := 'U';
          S   : out   std_logic;
          Y   : out   std_logic;
          FCO : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

    signal \dac_out_right_c\ : std_logic;
    signal sigma_register_Z : std_logic_vector(16 downto 0);
    signal temp_reg : std_logic_vector(17 downto 1);
    signal \VCC\, \GND\, temp_reg_cry_0_Y, temp_reg_cry_0_Z, 
        temp_reg_cry_0_S, temp_reg_cry_1_Z, temp_reg_cry_1_Y, 
        temp_reg_cry_2_Z, temp_reg_cry_2_Y, temp_reg_cry_3_Z, 
        temp_reg_cry_3_Y, temp_reg_cry_4_Z, temp_reg_cry_4_Y, 
        temp_reg_cry_5_Z, temp_reg_cry_5_Y, temp_reg_cry_6_Z, 
        temp_reg_cry_6_Y, temp_reg_cry_7_Z, temp_reg_cry_7_Y, 
        temp_reg_cry_8_Z, temp_reg_cry_8_Y, temp_reg_cry_9_Z, 
        temp_reg_cry_9_Y, temp_reg_cry_10_Z, temp_reg_cry_10_Y, 
        temp_reg_cry_11_Z, temp_reg_cry_11_Y, temp_reg_cry_12_Z, 
        temp_reg_cry_12_Y, temp_reg_cry_13_Z, temp_reg_cry_13_Y, 
        temp_reg_cry_14_Z, temp_reg_cry_14_Y, temp_reg_cry_15_Z, 
        temp_reg_cry_15_Y, temp_reg_s_17_FCO, temp_reg_s_17_Y, 
        temp_reg_cry_16_Z, temp_reg_cry_16_Y : std_logic;

begin 

    dac_out_right_c <= \dac_out_right_c\;

    \sigma_register[17]\ : SLE
      port map(D => temp_reg(17), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => \dac_out_right_c\);
    
    temp_reg_cry_14 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(14), B => data_delta(14), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_13_Z, S => 
        temp_reg(14), Y => temp_reg_cry_14_Y, FCO => 
        temp_reg_cry_14_Z);
    
    temp_reg_cry_12 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(12), B => data_delta(12), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_11_Z, S => 
        temp_reg(12), Y => temp_reg_cry_12_Y, FCO => 
        temp_reg_cry_12_Z);
    
    \sigma_register[7]\ : SLE
      port map(D => temp_reg(7), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(7));
    
    \sigma_register[2]\ : SLE
      port map(D => temp_reg(2), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(2));
    
    temp_reg_cry_6 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(6), B => data_delta(6), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_5_Z, S => 
        temp_reg(6), Y => temp_reg_cry_6_Y, FCO => 
        temp_reg_cry_6_Z);
    
    temp_reg_cry_15 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(15), B => data_delta(15), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_14_Z, S => 
        temp_reg(15), Y => temp_reg_cry_15_Y, FCO => 
        temp_reg_cry_15_Z);
    
    \sigma_register[10]\ : SLE
      port map(D => temp_reg(10), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(10));
    
    \sigma_register[8]\ : SLE
      port map(D => temp_reg(8), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(8));
    
    \sigma_register[3]\ : SLE
      port map(D => temp_reg(3), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(3));
    
    \sigma_register[9]\ : SLE
      port map(D => temp_reg(9), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(9));
    
    \sigma_register[16]\ : SLE
      port map(D => temp_reg(16), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(16));
    
    temp_reg_s_17 : ARI1
      generic map(INIT => x"46600")

      port map(A => \VCC\, B => data_delta(16), C => 
        \dac_out_right_c\, D => \GND\, FCI => temp_reg_cry_16_Z, 
        S => temp_reg(17), Y => temp_reg_s_17_Y, FCO => 
        temp_reg_s_17_FCO);
    
    temp_reg_cry_16 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(16), B => data_delta(16), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_15_Z, S => 
        temp_reg(16), Y => temp_reg_cry_16_Y, FCO => 
        temp_reg_cry_16_Z);
    
    temp_reg_cry_4 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(4), B => data_delta(4), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_3_Z, S => 
        temp_reg(4), Y => temp_reg_cry_4_Y, FCO => 
        temp_reg_cry_4_Z);
    
    temp_reg_cry_13 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(13), B => data_delta(13), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_12_Z, S => 
        temp_reg(13), Y => temp_reg_cry_13_Y, FCO => 
        temp_reg_cry_13_Z);
    
    temp_reg_cry_7 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(7), B => data_delta(7), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_6_Z, S => 
        temp_reg(7), Y => temp_reg_cry_7_Y, FCO => 
        temp_reg_cry_7_Z);
    
    temp_reg_cry_10 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(10), B => data_delta(10), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_9_Z, S => 
        temp_reg(10), Y => temp_reg_cry_10_Y, FCO => 
        temp_reg_cry_10_Z);
    
    \sigma_register[4]\ : SLE
      port map(D => temp_reg(4), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(4));
    
    temp_reg_cry_3 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(3), B => data_delta(3), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_2_Z, S => 
        temp_reg(3), Y => temp_reg_cry_3_Y, FCO => 
        temp_reg_cry_3_Z);
    
    \sigma_register[15]\ : SLE
      port map(D => temp_reg(15), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(15));
    
    temp_reg_cry_11 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(11), B => data_delta(11), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_10_Z, S => 
        temp_reg(11), Y => temp_reg_cry_11_Y, FCO => 
        temp_reg_cry_11_Z);
    
    \sigma_register[6]\ : SLE
      port map(D => temp_reg(6), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(6));
    
    \sigma_register[11]\ : SLE
      port map(D => temp_reg(11), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(11));
    
    \sigma_register[14]\ : SLE
      port map(D => temp_reg(14), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(14));
    
    GND_Z : GND
      port map(Y => \GND\);
    
    VCC_Z : VCC
      port map(Y => \VCC\);
    
    \sigma_register[0]\ : SLE
      port map(D => temp_reg_cry_0_Y, CLK => clk_debug, EN => 
        \VCC\, ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD
         => \GND\, LAT => \GND\, Q => sigma_register_Z(0));
    
    \sigma_register[5]\ : SLE
      port map(D => temp_reg(5), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(5));
    
    temp_reg_cry_9 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(9), B => data_delta(9), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_8_Z, S => 
        temp_reg(9), Y => temp_reg_cry_9_Y, FCO => 
        temp_reg_cry_9_Z);
    
    temp_reg_cry_8 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(8), B => data_delta(8), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_7_Z, S => 
        temp_reg(8), Y => temp_reg_cry_8_Y, FCO => 
        temp_reg_cry_8_Z);
    
    \sigma_register[1]\ : SLE
      port map(D => temp_reg(1), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(1));
    
    temp_reg_cry_5 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(5), B => data_delta(5), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_4_Z, S => 
        temp_reg(5), Y => temp_reg_cry_5_Y, FCO => 
        temp_reg_cry_5_Z);
    
    temp_reg_cry_2 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(2), B => data_delta(2), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_1_Z, S => 
        temp_reg(2), Y => temp_reg_cry_2_Y, FCO => 
        temp_reg_cry_2_Z);
    
    temp_reg_cry_1 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(1), B => data_delta(1), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_0_Z, S => 
        temp_reg(1), Y => temp_reg_cry_1_Y, FCO => 
        temp_reg_cry_1_Z);
    
    \sigma_register[13]\ : SLE
      port map(D => temp_reg(13), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(13));
    
    \sigma_register[12]\ : SLE
      port map(D => temp_reg(12), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(12));
    
    temp_reg_cry_0 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(0), B => data_delta(0), C
         => \GND\, D => \GND\, FCI => \GND\, S => 
        temp_reg_cry_0_S, Y => temp_reg_cry_0_Y, FCO => 
        temp_reg_cry_0_Z);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity dac_0 is

    port( data_receiver_0_data_right : in    std_logic_vector(15 downto 0);
          dac_reset_i                : in    std_logic;
          clk_debug                  : in    std_logic;
          dac_out_right_c            : out   std_logic
        );

end dac_0;

architecture DEF_ARCH of dac_0 is 

  component delta_adder_0
    port( data_receiver_0_data_right : in    std_logic_vector(15 downto 0) := (others => 'U');
          data_delta                 : out   std_logic_vector(16 downto 0);
          dac_out_right_c            : in    std_logic := 'U';
          clk_debug                  : in    std_logic := 'U';
          dac_reset_i                : in    std_logic := 'U'
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component sigma_adder_0
    port( data_delta      : in    std_logic_vector(16 downto 0) := (others => 'U');
          dac_out_right_c : out   std_logic;
          clk_debug       : in    std_logic := 'U';
          dac_reset_i     : in    std_logic := 'U'
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

    signal \dac_out_right_c\ : std_logic;
    signal data_delta : std_logic_vector(16 downto 0);
    signal \GND\, \VCC\ : std_logic;

    for all : delta_adder_0
	Use entity work.delta_adder_0(DEF_ARCH);
    for all : sigma_adder_0
	Use entity work.sigma_adder_0(DEF_ARCH);
begin 

    dac_out_right_c <= \dac_out_right_c\;

    \DELTA_ADDER_0\ : delta_adder_0
      port map(data_receiver_0_data_right(15) => 
        data_receiver_0_data_right(15), 
        data_receiver_0_data_right(14) => 
        data_receiver_0_data_right(14), 
        data_receiver_0_data_right(13) => 
        data_receiver_0_data_right(13), 
        data_receiver_0_data_right(12) => 
        data_receiver_0_data_right(12), 
        data_receiver_0_data_right(11) => 
        data_receiver_0_data_right(11), 
        data_receiver_0_data_right(10) => 
        data_receiver_0_data_right(10), 
        data_receiver_0_data_right(9) => 
        data_receiver_0_data_right(9), 
        data_receiver_0_data_right(8) => 
        data_receiver_0_data_right(8), 
        data_receiver_0_data_right(7) => 
        data_receiver_0_data_right(7), 
        data_receiver_0_data_right(6) => 
        data_receiver_0_data_right(6), 
        data_receiver_0_data_right(5) => 
        data_receiver_0_data_right(5), 
        data_receiver_0_data_right(4) => 
        data_receiver_0_data_right(4), 
        data_receiver_0_data_right(3) => 
        data_receiver_0_data_right(3), 
        data_receiver_0_data_right(2) => 
        data_receiver_0_data_right(2), 
        data_receiver_0_data_right(1) => 
        data_receiver_0_data_right(1), 
        data_receiver_0_data_right(0) => 
        data_receiver_0_data_right(0), data_delta(16) => 
        data_delta(16), data_delta(15) => data_delta(15), 
        data_delta(14) => data_delta(14), data_delta(13) => 
        data_delta(13), data_delta(12) => data_delta(12), 
        data_delta(11) => data_delta(11), data_delta(10) => 
        data_delta(10), data_delta(9) => data_delta(9), 
        data_delta(8) => data_delta(8), data_delta(7) => 
        data_delta(7), data_delta(6) => data_delta(6), 
        data_delta(5) => data_delta(5), data_delta(4) => 
        data_delta(4), data_delta(3) => data_delta(3), 
        data_delta(2) => data_delta(2), data_delta(1) => 
        data_delta(1), data_delta(0) => data_delta(0), 
        dac_out_right_c => \dac_out_right_c\, clk_debug => 
        clk_debug, dac_reset_i => dac_reset_i);
    
    VCC_Z : VCC
      port map(Y => \VCC\);
    
    \SIGMA_ADDER_0\ : sigma_adder_0
      port map(data_delta(16) => data_delta(16), data_delta(15)
         => data_delta(15), data_delta(14) => data_delta(14), 
        data_delta(13) => data_delta(13), data_delta(12) => 
        data_delta(12), data_delta(11) => data_delta(11), 
        data_delta(10) => data_delta(10), data_delta(9) => 
        data_delta(9), data_delta(8) => data_delta(8), 
        data_delta(7) => data_delta(7), data_delta(6) => 
        data_delta(6), data_delta(5) => data_delta(5), 
        data_delta(4) => data_delta(4), data_delta(3) => 
        data_delta(3), data_delta(2) => data_delta(2), 
        data_delta(1) => data_delta(1), data_delta(0) => 
        data_delta(0), dac_out_right_c => \dac_out_right_c\, 
        clk_debug => clk_debug, dac_reset_i => dac_reset_i);
    
    GND_Z : GND
      port map(Y => \GND\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity OSC_C0_OSC_C0_0_OSC is

    port( OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC : out   std_logic
        );

end OSC_C0_OSC_C0_0_OSC;

architecture DEF_ARCH of OSC_C0_OSC_C0_0_OSC is 

  component RCOSC_25_50MHZ
    generic (FREQUENCY:real := 50.0);

    port( CLKOUT : out   std_logic
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

    signal \GND\, \VCC\ : std_logic;

begin 


    I_RCOSC_25_50MHZ : RCOSC_25_50MHZ
      generic map(FREQUENCY => 50.000000)

      port map(CLKOUT => 
        OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC);
    
    VCC_Z : VCC
      port map(Y => \VCC\);
    
    GND_Z : GND
      port map(Y => \GND\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity OSC_C0 is

    port( OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC : out   std_logic
        );

end OSC_C0;

architecture DEF_ARCH of OSC_C0 is 

  component OSC_C0_OSC_C0_0_OSC
    port( OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC : out   std_logic
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

    signal \GND\, \VCC\ : std_logic;

    for all : OSC_C0_OSC_C0_0_OSC
	Use entity work.OSC_C0_OSC_C0_0_OSC(DEF_ARCH);
begin 


    OSC_C0_0 : OSC_C0_OSC_C0_0_OSC
      port map(OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC
         => OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC);
    
    VCC_Z : VCC
      port map(Y => \VCC\);
    
    GND_Z : GND
      port map(Y => \GND\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity delta_adder is

    port( data_receiver_0_data_left : in    std_logic_vector(15 downto 0);
          data_delta                : out   std_logic_vector(16 downto 0);
          dac_out_left_c            : in    std_logic;
          clk_debug                 : in    std_logic;
          dac_reset_i               : in    std_logic
        );

end delta_adder;

architecture DEF_ARCH of delta_adder is 

  component GND
    port( Y : out   std_logic
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

  component VCC
    port( Y : out   std_logic
        );
  end component;

    signal \VCC\, \GND\ : std_logic;

begin 


    GND_Z : GND
      port map(Y => \GND\);
    
    \data_out_1[4]\ : SLE
      port map(D => data_receiver_0_data_left(4), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(4));
    
    VCC_Z : VCC
      port map(Y => \VCC\);
    
    \data_out_1[7]\ : SLE
      port map(D => data_receiver_0_data_left(7), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(7));
    
    \data_out_1[10]\ : SLE
      port map(D => data_receiver_0_data_left(10), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(10));
    
    \data_out_1[9]\ : SLE
      port map(D => data_receiver_0_data_left(9), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(9));
    
    \data_out_1[15]\ : SLE
      port map(D => data_receiver_0_data_left(15), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(15));
    
    \data_out_1[8]\ : SLE
      port map(D => data_receiver_0_data_left(8), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(8));
    
    \data_out_1[16]\ : SLE
      port map(D => dac_out_left_c, CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => data_delta(16));
    
    \data_out_1[5]\ : SLE
      port map(D => data_receiver_0_data_left(5), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(5));
    
    \data_out_1[13]\ : SLE
      port map(D => data_receiver_0_data_left(13), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(13));
    
    \data_out_1[6]\ : SLE
      port map(D => data_receiver_0_data_left(6), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(6));
    
    \data_out_1[3]\ : SLE
      port map(D => data_receiver_0_data_left(3), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(3));
    
    \data_out_1[11]\ : SLE
      port map(D => data_receiver_0_data_left(11), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(11));
    
    \data_out_1[12]\ : SLE
      port map(D => data_receiver_0_data_left(12), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(12));
    
    \data_out_1[2]\ : SLE
      port map(D => data_receiver_0_data_left(2), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(2));
    
    \data_out_1[1]\ : SLE
      port map(D => data_receiver_0_data_left(1), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(1));
    
    \data_out_1[0]\ : SLE
      port map(D => data_receiver_0_data_left(0), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(0));
    
    \data_out_1[14]\ : SLE
      port map(D => data_receiver_0_data_left(14), CLK => 
        clk_debug, EN => \VCC\, ALn => dac_reset_i, ADn => \VCC\, 
        SLn => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        data_delta(14));
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity sigma_adder is

    port( data_delta     : in    std_logic_vector(16 downto 0);
          dac_out_left_c : out   std_logic;
          clk_debug      : in    std_logic;
          dac_reset_i    : in    std_logic
        );

end sigma_adder;

architecture DEF_ARCH of sigma_adder is 

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

  component ARI1
    generic (INIT:std_logic_vector(19 downto 0) := x"00000");

    port( A   : in    std_logic := 'U';
          B   : in    std_logic := 'U';
          C   : in    std_logic := 'U';
          D   : in    std_logic := 'U';
          FCI : in    std_logic := 'U';
          S   : out   std_logic;
          Y   : out   std_logic;
          FCO : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

    signal \dac_out_left_c\ : std_logic;
    signal sigma_register_Z : std_logic_vector(16 downto 0);
    signal temp_reg : std_logic_vector(17 downto 1);
    signal \VCC\, \GND\, temp_reg_cry_0_Y_0, temp_reg_cry_0_Z, 
        temp_reg_cry_0_S_0, temp_reg_cry_1_Z, temp_reg_cry_1_Y_0, 
        temp_reg_cry_2_Z, temp_reg_cry_2_Y_0, temp_reg_cry_3_Z, 
        temp_reg_cry_3_Y_0, temp_reg_cry_4_Z, temp_reg_cry_4_Y_0, 
        temp_reg_cry_5_Z, temp_reg_cry_5_Y_0, temp_reg_cry_6_Z, 
        temp_reg_cry_6_Y_0, temp_reg_cry_7_Z, temp_reg_cry_7_Y_0, 
        temp_reg_cry_8_Z, temp_reg_cry_8_Y_0, temp_reg_cry_9_Z, 
        temp_reg_cry_9_Y_0, temp_reg_cry_10_Z, 
        temp_reg_cry_10_Y_0, temp_reg_cry_11_Z, 
        temp_reg_cry_11_Y_0, temp_reg_cry_12_Z, 
        temp_reg_cry_12_Y_0, temp_reg_cry_13_Z, 
        temp_reg_cry_13_Y_0, temp_reg_cry_14_Z, 
        temp_reg_cry_14_Y_0, temp_reg_cry_15_Z, 
        temp_reg_cry_15_Y_0, temp_reg_s_17_FCO_0, 
        temp_reg_s_17_Y_0, temp_reg_cry_16_Z, temp_reg_cry_16_Y_0
         : std_logic;

begin 

    dac_out_left_c <= \dac_out_left_c\;

    \sigma_register[17]\ : SLE
      port map(D => temp_reg(17), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => \dac_out_left_c\);
    
    temp_reg_cry_14 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(14), B => data_delta(14), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_13_Z, S => 
        temp_reg(14), Y => temp_reg_cry_14_Y_0, FCO => 
        temp_reg_cry_14_Z);
    
    temp_reg_cry_12 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(12), B => data_delta(12), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_11_Z, S => 
        temp_reg(12), Y => temp_reg_cry_12_Y_0, FCO => 
        temp_reg_cry_12_Z);
    
    \sigma_register[7]\ : SLE
      port map(D => temp_reg(7), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(7));
    
    \sigma_register[2]\ : SLE
      port map(D => temp_reg(2), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(2));
    
    temp_reg_cry_6 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(6), B => data_delta(6), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_5_Z, S => 
        temp_reg(6), Y => temp_reg_cry_6_Y_0, FCO => 
        temp_reg_cry_6_Z);
    
    temp_reg_cry_15 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(15), B => data_delta(15), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_14_Z, S => 
        temp_reg(15), Y => temp_reg_cry_15_Y_0, FCO => 
        temp_reg_cry_15_Z);
    
    \sigma_register[10]\ : SLE
      port map(D => temp_reg(10), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(10));
    
    \sigma_register[8]\ : SLE
      port map(D => temp_reg(8), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(8));
    
    \sigma_register[3]\ : SLE
      port map(D => temp_reg(3), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(3));
    
    \sigma_register[9]\ : SLE
      port map(D => temp_reg(9), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(9));
    
    \sigma_register[16]\ : SLE
      port map(D => temp_reg(16), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(16));
    
    temp_reg_s_17 : ARI1
      generic map(INIT => x"46600")

      port map(A => \VCC\, B => data_delta(16), C => 
        \dac_out_left_c\, D => \GND\, FCI => temp_reg_cry_16_Z, S
         => temp_reg(17), Y => temp_reg_s_17_Y_0, FCO => 
        temp_reg_s_17_FCO_0);
    
    temp_reg_cry_16 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(16), B => data_delta(16), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_15_Z, S => 
        temp_reg(16), Y => temp_reg_cry_16_Y_0, FCO => 
        temp_reg_cry_16_Z);
    
    temp_reg_cry_4 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(4), B => data_delta(4), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_3_Z, S => 
        temp_reg(4), Y => temp_reg_cry_4_Y_0, FCO => 
        temp_reg_cry_4_Z);
    
    temp_reg_cry_13 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(13), B => data_delta(13), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_12_Z, S => 
        temp_reg(13), Y => temp_reg_cry_13_Y_0, FCO => 
        temp_reg_cry_13_Z);
    
    temp_reg_cry_7 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(7), B => data_delta(7), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_6_Z, S => 
        temp_reg(7), Y => temp_reg_cry_7_Y_0, FCO => 
        temp_reg_cry_7_Z);
    
    temp_reg_cry_10 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(10), B => data_delta(10), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_9_Z, S => 
        temp_reg(10), Y => temp_reg_cry_10_Y_0, FCO => 
        temp_reg_cry_10_Z);
    
    \sigma_register[4]\ : SLE
      port map(D => temp_reg(4), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(4));
    
    temp_reg_cry_3 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(3), B => data_delta(3), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_2_Z, S => 
        temp_reg(3), Y => temp_reg_cry_3_Y_0, FCO => 
        temp_reg_cry_3_Z);
    
    \sigma_register[15]\ : SLE
      port map(D => temp_reg(15), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(15));
    
    temp_reg_cry_11 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(11), B => data_delta(11), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_10_Z, S => 
        temp_reg(11), Y => temp_reg_cry_11_Y_0, FCO => 
        temp_reg_cry_11_Z);
    
    \sigma_register[6]\ : SLE
      port map(D => temp_reg(6), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(6));
    
    \sigma_register[11]\ : SLE
      port map(D => temp_reg(11), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(11));
    
    \sigma_register[14]\ : SLE
      port map(D => temp_reg(14), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(14));
    
    GND_Z : GND
      port map(Y => \GND\);
    
    VCC_Z : VCC
      port map(Y => \VCC\);
    
    \sigma_register[0]\ : SLE
      port map(D => temp_reg_cry_0_Y_0, CLK => clk_debug, EN => 
        \VCC\, ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD
         => \GND\, LAT => \GND\, Q => sigma_register_Z(0));
    
    \sigma_register[5]\ : SLE
      port map(D => temp_reg(5), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(5));
    
    temp_reg_cry_9 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(9), B => data_delta(9), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_8_Z, S => 
        temp_reg(9), Y => temp_reg_cry_9_Y_0, FCO => 
        temp_reg_cry_9_Z);
    
    temp_reg_cry_8 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(8), B => data_delta(8), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_7_Z, S => 
        temp_reg(8), Y => temp_reg_cry_8_Y_0, FCO => 
        temp_reg_cry_8_Z);
    
    \sigma_register[1]\ : SLE
      port map(D => temp_reg(1), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(1));
    
    temp_reg_cry_5 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(5), B => data_delta(5), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_4_Z, S => 
        temp_reg(5), Y => temp_reg_cry_5_Y_0, FCO => 
        temp_reg_cry_5_Z);
    
    temp_reg_cry_2 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(2), B => data_delta(2), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_1_Z, S => 
        temp_reg(2), Y => temp_reg_cry_2_Y_0, FCO => 
        temp_reg_cry_2_Z);
    
    temp_reg_cry_1 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(1), B => data_delta(1), C
         => \GND\, D => \GND\, FCI => temp_reg_cry_0_Z, S => 
        temp_reg(1), Y => temp_reg_cry_1_Y_0, FCO => 
        temp_reg_cry_1_Z);
    
    \sigma_register[13]\ : SLE
      port map(D => temp_reg(13), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(13));
    
    \sigma_register[12]\ : SLE
      port map(D => temp_reg(12), CLK => clk_debug, EN => \VCC\, 
        ALn => dac_reset_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => sigma_register_Z(12));
    
    temp_reg_cry_0 : ARI1
      generic map(INIT => x"555AA")

      port map(A => sigma_register_Z(0), B => data_delta(0), C
         => \GND\, D => \GND\, FCI => \GND\, S => 
        temp_reg_cry_0_S_0, Y => temp_reg_cry_0_Y_0, FCO => 
        temp_reg_cry_0_Z);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity dac is

    port( data_receiver_0_data_left : in    std_logic_vector(15 downto 0);
          dac_reset_i               : in    std_logic;
          clk_debug                 : in    std_logic;
          dac_out_left_c            : out   std_logic
        );

end dac;

architecture DEF_ARCH of dac is 

  component delta_adder
    port( data_receiver_0_data_left : in    std_logic_vector(15 downto 0) := (others => 'U');
          data_delta                : out   std_logic_vector(16 downto 0);
          dac_out_left_c            : in    std_logic := 'U';
          clk_debug                 : in    std_logic := 'U';
          dac_reset_i               : in    std_logic := 'U'
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component sigma_adder
    port( data_delta     : in    std_logic_vector(16 downto 0) := (others => 'U');
          dac_out_left_c : out   std_logic;
          clk_debug      : in    std_logic := 'U';
          dac_reset_i    : in    std_logic := 'U'
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

    signal \dac_out_left_c\ : std_logic;
    signal data_delta : std_logic_vector(16 downto 0);
    signal \GND\, \VCC\ : std_logic;

    for all : delta_adder
	Use entity work.delta_adder(DEF_ARCH);
    for all : sigma_adder
	Use entity work.sigma_adder(DEF_ARCH);
begin 

    dac_out_left_c <= \dac_out_left_c\;

    DELTA_ADDER_0 : delta_adder
      port map(data_receiver_0_data_left(15) => 
        data_receiver_0_data_left(15), 
        data_receiver_0_data_left(14) => 
        data_receiver_0_data_left(14), 
        data_receiver_0_data_left(13) => 
        data_receiver_0_data_left(13), 
        data_receiver_0_data_left(12) => 
        data_receiver_0_data_left(12), 
        data_receiver_0_data_left(11) => 
        data_receiver_0_data_left(11), 
        data_receiver_0_data_left(10) => 
        data_receiver_0_data_left(10), 
        data_receiver_0_data_left(9) => 
        data_receiver_0_data_left(9), 
        data_receiver_0_data_left(8) => 
        data_receiver_0_data_left(8), 
        data_receiver_0_data_left(7) => 
        data_receiver_0_data_left(7), 
        data_receiver_0_data_left(6) => 
        data_receiver_0_data_left(6), 
        data_receiver_0_data_left(5) => 
        data_receiver_0_data_left(5), 
        data_receiver_0_data_left(4) => 
        data_receiver_0_data_left(4), 
        data_receiver_0_data_left(3) => 
        data_receiver_0_data_left(3), 
        data_receiver_0_data_left(2) => 
        data_receiver_0_data_left(2), 
        data_receiver_0_data_left(1) => 
        data_receiver_0_data_left(1), 
        data_receiver_0_data_left(0) => 
        data_receiver_0_data_left(0), data_delta(16) => 
        data_delta(16), data_delta(15) => data_delta(15), 
        data_delta(14) => data_delta(14), data_delta(13) => 
        data_delta(13), data_delta(12) => data_delta(12), 
        data_delta(11) => data_delta(11), data_delta(10) => 
        data_delta(10), data_delta(9) => data_delta(9), 
        data_delta(8) => data_delta(8), data_delta(7) => 
        data_delta(7), data_delta(6) => data_delta(6), 
        data_delta(5) => data_delta(5), data_delta(4) => 
        data_delta(4), data_delta(3) => data_delta(3), 
        data_delta(2) => data_delta(2), data_delta(1) => 
        data_delta(1), data_delta(0) => data_delta(0), 
        dac_out_left_c => \dac_out_left_c\, clk_debug => 
        clk_debug, dac_reset_i => dac_reset_i);
    
    VCC_Z : VCC
      port map(Y => \VCC\);
    
    SIGMA_ADDER_0 : sigma_adder
      port map(data_delta(16) => data_delta(16), data_delta(15)
         => data_delta(15), data_delta(14) => data_delta(14), 
        data_delta(13) => data_delta(13), data_delta(12) => 
        data_delta(12), data_delta(11) => data_delta(11), 
        data_delta(10) => data_delta(10), data_delta(9) => 
        data_delta(9), data_delta(8) => data_delta(8), 
        data_delta(7) => data_delta(7), data_delta(6) => 
        data_delta(6), data_delta(5) => data_delta(5), 
        data_delta(4) => data_delta(4), data_delta(3) => 
        data_delta(3), data_delta(2) => data_delta(2), 
        data_delta(1) => data_delta(1), data_delta(0) => 
        data_delta(0), dac_out_left_c => \dac_out_left_c\, 
        clk_debug => clk_debug, dac_reset_i => dac_reset_i);
    
    GND_Z : GND
      port map(Y => \GND\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity FCCC_C0_FCCC_C0_0_FCCC is

    port( OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC : in    std_logic;
          FCCC_C0_0_LOCK                                     : out   std_logic;
          clk_debug                                          : out   std_logic
        );

end FCCC_C0_FCCC_C0_0_FCCC;

architecture DEF_ARCH of FCCC_C0_FCCC_C0_0_FCCC is 

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component CLKINT
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

  component GND
    port( Y : out   std_logic
        );
  end component;

    signal PRDATA : std_logic_vector(7 downto 0);
    signal GL0_net, Y0, Y1, Y2, Y3, BUSY, \VCC\, \GND\, GL1, GL2, 
        GL3 : std_logic;

begin 


    VCC_Z : VCC
      port map(Y => \VCC\);
    
    GL0_INST : CLKINT
      port map(A => GL0_net, Y => clk_debug);
    
    CCC_INST : CCC

              generic map(INIT => "00" & x"000007FB8000044D74000318C6318C1F18C61EC0404040400301",
         VCOFREQUENCY => 800.000000)

      port map(Y0 => Y0, Y1 => Y1, Y2 => Y2, Y3 => Y3, PRDATA(7)
         => PRDATA(7), PRDATA(6) => PRDATA(6), PRDATA(5) => 
        PRDATA(5), PRDATA(4) => PRDATA(4), PRDATA(3) => PRDATA(3), 
        PRDATA(2) => PRDATA(2), PRDATA(1) => PRDATA(1), PRDATA(0)
         => PRDATA(0), LOCK => FCCC_C0_0_LOCK, BUSY => BUSY, CLK0
         => \VCC\, CLK1 => \VCC\, CLK2 => \VCC\, CLK3 => \VCC\, 
        NGMUX0_SEL => \GND\, NGMUX1_SEL => \GND\, NGMUX2_SEL => 
        \GND\, NGMUX3_SEL => \GND\, NGMUX0_HOLD_N => \VCC\, 
        NGMUX1_HOLD_N => \VCC\, NGMUX2_HOLD_N => \VCC\, 
        NGMUX3_HOLD_N => \VCC\, NGMUX0_ARST_N => \VCC\, 
        NGMUX1_ARST_N => \VCC\, NGMUX2_ARST_N => \VCC\, 
        NGMUX3_ARST_N => \VCC\, PLL_BYPASS_N => \VCC\, PLL_ARST_N
         => \VCC\, PLL_POWERDOWN_N => \VCC\, GPD0_ARST_N => \VCC\, 
        GPD1_ARST_N => \VCC\, GPD2_ARST_N => \VCC\, GPD3_ARST_N
         => \VCC\, PRESET_N => \GND\, PCLK => \VCC\, PSEL => 
        \VCC\, PENABLE => \VCC\, PWRITE => \VCC\, PADDR(7) => 
        \VCC\, PADDR(6) => \VCC\, PADDR(5) => \VCC\, PADDR(4) => 
        \VCC\, PADDR(3) => \VCC\, PADDR(2) => \VCC\, PWDATA(7)
         => \VCC\, PWDATA(6) => \VCC\, PWDATA(5) => \VCC\, 
        PWDATA(4) => \VCC\, PWDATA(3) => \VCC\, PWDATA(2) => 
        \VCC\, PWDATA(1) => \VCC\, PWDATA(0) => \VCC\, CLK0_PAD
         => \GND\, CLK1_PAD => \GND\, CLK2_PAD => \GND\, CLK3_PAD
         => \GND\, GL0 => GL0_net, GL1 => GL1, GL2 => GL2, GL3
         => GL3, RCOSC_25_50MHZ => 
        OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC, 
        RCOSC_1MHZ => \GND\, XTLOSC => \GND\);
    
    GND_Z : GND
      port map(Y => \GND\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity FCCC_C0 is

    port( clk_debug                                          : out   std_logic;
          FCCC_C0_0_LOCK                                     : out   std_logic;
          OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC : in    std_logic
        );

end FCCC_C0;

architecture DEF_ARCH of FCCC_C0 is 

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component FCCC_C0_FCCC_C0_0_FCCC
    port( OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC : in    std_logic := 'U';
          FCCC_C0_0_LOCK                                     : out   std_logic;
          clk_debug                                          : out   std_logic
        );
  end component;

    signal \GND\, \VCC\ : std_logic;

    for all : FCCC_C0_FCCC_C0_0_FCCC
	Use entity work.FCCC_C0_FCCC_C0_0_FCCC(DEF_ARCH);
begin 


    VCC_Z : VCC
      port map(Y => \VCC\);
    
    GND_Z : GND
      port map(Y => \GND\);
    
    FCCC_C0_0 : FCCC_C0_FCCC_C0_0_FCCC
      port map(OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC
         => OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC, 
        FCCC_C0_0_LOCK => FCCC_C0_0_LOCK, clk_debug => clk_debug);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity data_receiver is

    port( spi_slave_0_DataRxd        : in    std_logic_vector(31 downto 0);
          data_receiver_0_data_left  : out   std_logic_vector(15 downto 0);
          data_receiver_0_data_right : out   std_logic_vector(15 downto 0);
          AND2_0_Y                   : in    std_logic;
          spi_slave_0_SPI_DONE       : in    std_logic;
          AND2_0_Y_arst_i            : in    std_logic;
          dac_reset_i                : out   std_logic
        );

end data_receiver;

architecture DEF_ARCH of data_receiver is 

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

  component CLKINT
    port( A : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component CFG2
    generic (INIT:std_logic_vector(3 downto 0) := x"0");

    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal dac_reset_Z, \VCC\, \GND\ : std_logic;

begin 


    \data[18]\ : SLE
      port map(D => spi_slave_0_DataRxd(18), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_left(2));
    
    \data[17]\ : SLE
      port map(D => spi_slave_0_DataRxd(17), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_left(1));
    
    \data[16]\ : SLE
      port map(D => spi_slave_0_DataRxd(16), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_left(0));
    
    \data[3]\ : SLE
      port map(D => spi_slave_0_DataRxd(3), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_right(3));
    
    \data[5]\ : SLE
      port map(D => spi_slave_0_DataRxd(5), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_right(5));
    
    \data[23]\ : SLE
      port map(D => spi_slave_0_DataRxd(23), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_left(7));
    
    \data[30]\ : SLE
      port map(D => spi_slave_0_DataRxd(30), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_left(14));
    
    \data[9]\ : SLE
      port map(D => spi_slave_0_DataRxd(9), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_right(9));
    
    \data[2]\ : SLE
      port map(D => spi_slave_0_DataRxd(2), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_right(2));
    
    \data[6]\ : SLE
      port map(D => spi_slave_0_DataRxd(6), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_right(6));
    
    \data[31]\ : SLE
      port map(D => spi_slave_0_DataRxd(31), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_left(15));
    
    \data[7]\ : SLE
      port map(D => spi_slave_0_DataRxd(7), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_right(7));
    
    \data[12]\ : SLE
      port map(D => spi_slave_0_DataRxd(12), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_right(12));
    
    \data[10]\ : SLE
      port map(D => spi_slave_0_DataRxd(10), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_right(10));
    
    \data[0]\ : SLE
      port map(D => spi_slave_0_DataRxd(0), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_right(0));
    
    \data[11]\ : SLE
      port map(D => spi_slave_0_DataRxd(11), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_right(11));
    
    \data[24]\ : SLE
      port map(D => spi_slave_0_DataRxd(24), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_left(8));
    
    dac_reset_RNILDSA : CLKINT
      port map(A => dac_reset_Z, Y => dac_reset_i);
    
    \data[8]\ : SLE
      port map(D => spi_slave_0_DataRxd(8), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_right(8));
    
    \data[28]\ : SLE
      port map(D => spi_slave_0_DataRxd(28), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_left(12));
    
    \data[27]\ : SLE
      port map(D => spi_slave_0_DataRxd(27), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_left(11));
    
    \data[4]\ : SLE
      port map(D => spi_slave_0_DataRxd(4), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_right(4));
    
    \data[26]\ : SLE
      port map(D => spi_slave_0_DataRxd(26), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_left(10));
    
    \data[15]\ : SLE
      port map(D => spi_slave_0_DataRxd(15), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_right(15));
    
    \data[19]\ : SLE
      port map(D => spi_slave_0_DataRxd(19), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_left(3));
    
    \data[13]\ : SLE
      port map(D => spi_slave_0_DataRxd(13), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_right(13));
    
    \data[22]\ : SLE
      port map(D => spi_slave_0_DataRxd(22), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_left(6));
    
    \data[20]\ : SLE
      port map(D => spi_slave_0_DataRxd(20), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_left(4));
    
    GND_Z : GND
      port map(Y => \GND\);
    
    VCC_Z : VCC
      port map(Y => \VCC\);
    
    \data[21]\ : SLE
      port map(D => spi_slave_0_DataRxd(21), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_left(5));
    
    \data[1]\ : SLE
      port map(D => spi_slave_0_DataRxd(1), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_right(1));
    
    \data[25]\ : SLE
      port map(D => spi_slave_0_DataRxd(25), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_left(9));
    
    \data[29]\ : SLE
      port map(D => spi_slave_0_DataRxd(29), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_left(13));
    
    \data[14]\ : SLE
      port map(D => spi_slave_0_DataRxd(14), CLK => 
        spi_slave_0_SPI_DONE, EN => \VCC\, ALn => AND2_0_Y_arst_i, 
        ADn => \VCC\, SLn => \VCC\, SD => \GND\, LAT => \GND\, Q
         => data_receiver_0_data_right(14));
    
    dac_reset : CFG2
      generic map(INIT => x"1")

      port map(A => AND2_0_Y, B => spi_slave_0_SPI_DONE, Y => 
        dac_reset_Z);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity spi_slave is

    port( spi_slave_0_DataRxd  : out   std_logic_vector(31 downto 0);
          spi_miso_c           : out   std_logic;
          spi_mosi_c           : in    std_logic;
          spi_sck_c            : in    std_logic;
          spi_ss_c             : in    std_logic;
          clk_debug            : in    std_logic;
          AND2_0_Y_arst_i      : in    std_logic;
          spi_slave_0_SPI_DONE : out   std_logic
        );

end spi_slave;

architecture DEF_ARCH of spi_slave is 

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

  component CFG3
    generic (INIT:std_logic_vector(7 downto 0) := x"00");

    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component CFG2
    generic (INIT:std_logic_vector(3 downto 0) := x"0");

    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component CLKINT
    port( A : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

    signal \spi_slave_0_DataRxd\ : 
        std_logic_vector(31 downto 0);
    signal TxData_Z : std_logic_vector(30 downto 0);
    signal index_Z : std_logic_vector(4 downto 0);
    signal SPI_DONE_Z, SCLK_old_Z, \VCC\, SCLK_latched_Z, \GND\, 
        SS_latched_Z, MOSI_latched_Z, SPI_DONE_0_sqmuxa_0_0, 
        SS_old_Z, N_2_i, N_4_i, N_15, N_17_i, N_161_i, N_10, N_12, 
        N_8, N_21, N_33, N_19, SPI_DONE_0_sqmuxa_0_a3_2_Z, N_149
         : std_logic;

begin 

    \spi_slave_0_DataRxd\(31) <= 'U';
    spi_slave_0_DataRxd(30) <= \spi_slave_0_DataRxd\(30);
    spi_slave_0_DataRxd(29) <= \spi_slave_0_DataRxd\(29);
    spi_slave_0_DataRxd(28) <= \spi_slave_0_DataRxd\(28);
    spi_slave_0_DataRxd(27) <= \spi_slave_0_DataRxd\(27);
    spi_slave_0_DataRxd(26) <= \spi_slave_0_DataRxd\(26);
    spi_slave_0_DataRxd(25) <= \spi_slave_0_DataRxd\(25);
    spi_slave_0_DataRxd(24) <= \spi_slave_0_DataRxd\(24);
    spi_slave_0_DataRxd(23) <= \spi_slave_0_DataRxd\(23);
    spi_slave_0_DataRxd(22) <= \spi_slave_0_DataRxd\(22);
    spi_slave_0_DataRxd(21) <= \spi_slave_0_DataRxd\(21);
    spi_slave_0_DataRxd(20) <= \spi_slave_0_DataRxd\(20);
    spi_slave_0_DataRxd(19) <= \spi_slave_0_DataRxd\(19);
    spi_slave_0_DataRxd(18) <= \spi_slave_0_DataRxd\(18);
    spi_slave_0_DataRxd(17) <= \spi_slave_0_DataRxd\(17);
    spi_slave_0_DataRxd(16) <= \spi_slave_0_DataRxd\(16);
    spi_slave_0_DataRxd(15) <= \spi_slave_0_DataRxd\(15);
    spi_slave_0_DataRxd(14) <= \spi_slave_0_DataRxd\(14);
    spi_slave_0_DataRxd(13) <= \spi_slave_0_DataRxd\(13);
    spi_slave_0_DataRxd(12) <= \spi_slave_0_DataRxd\(12);
    spi_slave_0_DataRxd(11) <= \spi_slave_0_DataRxd\(11);
    spi_slave_0_DataRxd(10) <= \spi_slave_0_DataRxd\(10);
    spi_slave_0_DataRxd(9) <= \spi_slave_0_DataRxd\(9);
    spi_slave_0_DataRxd(8) <= \spi_slave_0_DataRxd\(8);
    spi_slave_0_DataRxd(7) <= \spi_slave_0_DataRxd\(7);
    spi_slave_0_DataRxd(6) <= \spi_slave_0_DataRxd\(6);
    spi_slave_0_DataRxd(5) <= \spi_slave_0_DataRxd\(5);
    spi_slave_0_DataRxd(4) <= \spi_slave_0_DataRxd\(4);
    spi_slave_0_DataRxd(3) <= \spi_slave_0_DataRxd\(3);
    spi_slave_0_DataRxd(2) <= \spi_slave_0_DataRxd\(2);
    spi_slave_0_DataRxd(1) <= \spi_slave_0_DataRxd\(1);
    spi_slave_0_DataRxd(0) <= \spi_slave_0_DataRxd\(0);

    \RxdData[23]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(22), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(23));
    
    \TxData[4]\ : SLE
      port map(D => TxData_Z(3), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(4));
    
    \RxdData[29]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(28), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(29));
    
    index_n3_i_o2_0_RNIBMMH1 : CFG4
      generic map(INIT => x"CFDF")

      port map(A => index_Z(4), B => SCLK_old_Z, C => 
        SCLK_latched_Z, D => N_21, Y => N_149);
    
    SCLK_latched : SLE
      port map(D => spi_sck_c, CLK => clk_debug, EN => \VCC\, ALn
         => AND2_0_Y_arst_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => SCLK_latched_Z);
    
    \index[2]\ : SLE
      port map(D => N_12, CLK => clk_debug, EN => N_17_i, ALn => 
        AND2_0_Y_arst_i, ADn => \GND\, SLn => \VCC\, SD => \GND\, 
        LAT => \GND\, Q => index_Z(2));
    
    \TxData[10]\ : SLE
      port map(D => TxData_Z(9), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(10));
    
    \RxdData[16]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(15), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(16));
    
    index_n1_i : CFG3
      generic map(INIT => x"FD")

      port map(A => N_19, B => N_149, C => N_33, Y => N_15);
    
    \TxData[27]\ : SLE
      port map(D => TxData_Z(26), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(27));
    
    \TxData[5]\ : SLE
      port map(D => TxData_Z(4), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(5));
    
    \RxdData[11]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(10), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(11));
    
    index_n3_i : CFG4
      generic map(INIT => x"FCF9")

      port map(A => index_Z(2), B => index_Z(3), C => N_149, D
         => N_19, Y => N_10);
    
    \RxdData[20]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(19), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(20));
    
    index_n2_i_o2 : CFG2
      generic map(INIT => x"E")

      port map(A => index_Z(0), B => index_Z(1), Y => N_19);
    
    \TxData[7]\ : SLE
      port map(D => TxData_Z(6), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(7));
    
    \TxData[15]\ : SLE
      port map(D => TxData_Z(14), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(15));
    
    SCLK_old : SLE
      port map(D => SCLK_latched_Z, CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => \VCC\, SD
         => \GND\, LAT => \GND\, Q => SCLK_old_Z);
    
    \RxdData[14]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(13), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(14));
    
    \RxdData[13]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(12), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(13));
    
    \TxData[31]\ : SLE
      port map(D => TxData_Z(30), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => spi_miso_c);
    
    \TxData[18]\ : SLE
      port map(D => TxData_Z(17), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(18));
    
    \RxdData[4]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(3), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(4));
    
    \RxdData[25]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(24), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(25));
    
    \RxdData[19]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(18), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(19));
    
    \index[3]\ : SLE
      port map(D => N_10, CLK => clk_debug, EN => N_17_i, ALn => 
        AND2_0_Y_arst_i, ADn => \GND\, SLn => \VCC\, SD => \GND\, 
        LAT => \GND\, Q => index_Z(3));
    
    \RxdData[7]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(6), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(7));
    
    SPI_DONE_0_sqmuxa_0_a3_2 : CFG4
      generic map(INIT => x"0080")

      port map(A => index_Z(4), B => index_Z(3), C => index_Z(2), 
        D => SS_latched_Z, Y => SPI_DONE_0_sqmuxa_0_a3_2_Z);
    
    \RxdData[27]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(26), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(27));
    
    \RxdData[9]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(8), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(9));
    
    \RxdData[0]\ : SLE
      port map(D => MOSI_latched_Z, CLK => clk_debug, EN => N_4_i, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => \VCC\, SD
         => \GND\, LAT => \GND\, Q => \spi_slave_0_DataRxd\(0));
    
    index_n4_i : CFG4
      generic map(INIT => x"EBFF")

      port map(A => SCLK_old_Z, B => index_Z(4), C => N_21, D => 
        SCLK_latched_Z, Y => N_8);
    
    \index[1]\ : SLE
      port map(D => N_15, CLK => clk_debug, EN => N_17_i, ALn => 
        AND2_0_Y_arst_i, ADn => \GND\, SLn => \VCC\, SD => \GND\, 
        LAT => \GND\, Q => index_Z(1));
    
    \RxdData[1]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(0), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(1));
    
    SS_old_RNIM0QF1 : CFG4
      generic map(INIT => x"2322")

      port map(A => SS_old_Z, B => SS_latched_Z, C => SCLK_old_Z, 
        D => SCLK_latched_Z, Y => N_17_i);
    
    \TxData[3]\ : SLE
      port map(D => TxData_Z(2), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(3));
    
    \TxData[24]\ : SLE
      port map(D => TxData_Z(23), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(24));
    
    SS_latched_RNIF5U21 : CFG3
      generic map(INIT => x"10")

      port map(A => SS_latched_Z, B => SCLK_old_Z, C => 
        SCLK_latched_Z, Y => N_4_i);
    
    SPI_DONE_inferred_clock_RNIDF25 : CLKINT
      port map(A => SPI_DONE_Z, Y => spi_slave_0_SPI_DONE);
    
    index_n1_i_a2 : CFG2
      generic map(INIT => x"8")

      port map(A => index_Z(0), B => index_Z(1), Y => N_33);
    
    \TxData[26]\ : SLE
      port map(D => TxData_Z(25), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(26));
    
    \TxData[13]\ : SLE
      port map(D => TxData_Z(12), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(13));
    
    \TxData[2]\ : SLE
      port map(D => TxData_Z(1), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(2));
    
    \TxData[11]\ : SLE
      port map(D => TxData_Z(10), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(11));
    
    SPI_DONE : SLE
      port map(D => SPI_DONE_0_sqmuxa_0_0, CLK => clk_debug, EN
         => \VCC\, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => 
        \VCC\, SD => \GND\, LAT => \GND\, Q => SPI_DONE_Z);
    
    \TxData[19]\ : SLE
      port map(D => TxData_Z(18), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(19));
    
    \RxdData[10]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(9), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(10));
    
    \RxdData[22]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(21), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(22));
    
    SPI_DONE_0_sqmuxa_0_a3 : CFG4
      generic map(INIT => x"0080")

      port map(A => N_33, B => SPI_DONE_0_sqmuxa_0_a3_2_Z, C => 
        SCLK_old_Z, D => SCLK_latched_Z, Y => 
        SPI_DONE_0_sqmuxa_0_0);
    
    \RxdData[15]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(14), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(15));
    
    \RxdData[17]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(16), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(17));
    
    \RxdData[31]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(30), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        spi_slave_0_DataRxd(31));
    
    \RxdData[28]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(27), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(28));
    
    \TxData[0]\ : SLE
      port map(D => \VCC\, CLK => clk_debug, EN => \VCC\, ALn => 
        AND2_0_Y_arst_i, ADn => \VCC\, SLn => \VCC\, SD => \GND\, 
        LAT => \GND\, Q => TxData_Z(0));
    
    index_n2_i : CFG3
      generic map(INIT => x"EB")

      port map(A => N_149, B => index_Z(2), C => N_19, Y => N_12);
    
    \TxData[22]\ : SLE
      port map(D => TxData_Z(21), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(22));
    
    \TxData[17]\ : SLE
      port map(D => TxData_Z(16), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(17));
    
    MOSI_latched : SLE
      port map(D => spi_mosi_c, CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => \VCC\, SD
         => \GND\, LAT => \GND\, Q => MOSI_latched_Z);
    
    \RxdData[2]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(1), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(2));
    
    \TxData[8]\ : SLE
      port map(D => TxData_Z(7), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(8));
    
    SS_latched_RNIF5U21_0 : CFG3
      generic map(INIT => x"04")

      port map(A => SS_latched_Z, B => SCLK_old_Z, C => 
        SCLK_latched_Z, Y => N_2_i);
    
    \RxdData[12]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(11), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(12));
    
    \index[0]\ : SLE
      port map(D => N_161_i, CLK => clk_debug, EN => N_17_i, ALn
         => AND2_0_Y_arst_i, ADn => \GND\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => index_Z(0));
    
    \TxData[20]\ : SLE
      port map(D => TxData_Z(19), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(20));
    
    \RxdData[30]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(29), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(30));
    
    GND_Z : GND
      port map(Y => \GND\);
    
    VCC_Z : VCC
      port map(Y => \VCC\);
    
    \TxData[6]\ : SLE
      port map(D => TxData_Z(5), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(6));
    
    \RxdData[18]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(17), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(18));
    
    \index_RNO[0]\ : CFG2
      generic map(INIT => x"B")

      port map(A => N_149, B => index_Z(0), Y => N_161_i);
    
    \RxdData[6]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(5), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(6));
    
    \TxData[14]\ : SLE
      port map(D => TxData_Z(13), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(14));
    
    SS_latched : SLE
      port map(D => spi_ss_c, CLK => clk_debug, EN => \VCC\, ALn
         => AND2_0_Y_arst_i, ADn => \VCC\, SLn => \VCC\, SD => 
        \GND\, LAT => \GND\, Q => SS_latched_Z);
    
    \TxData[25]\ : SLE
      port map(D => TxData_Z(24), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(25));
    
    \RxdData[3]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(2), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(3));
    
    \TxData[16]\ : SLE
      port map(D => TxData_Z(15), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(16));
    
    \TxData[28]\ : SLE
      port map(D => TxData_Z(27), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(28));
    
    \index[4]\ : SLE
      port map(D => N_8, CLK => clk_debug, EN => N_17_i, ALn => 
        AND2_0_Y_arst_i, ADn => \GND\, SLn => \VCC\, SD => \GND\, 
        LAT => \GND\, Q => index_Z(4));
    
    \RxdData[5]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(4), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(5));
    
    \TxData[23]\ : SLE
      port map(D => TxData_Z(22), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(23));
    
    index_n3_i_o2_0 : CFG4
      generic map(INIT => x"FFFE")

      port map(A => index_Z(1), B => index_Z(3), C => index_Z(0), 
        D => index_Z(2), Y => N_21);
    
    \RxdData[26]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(25), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(26));
    
    \TxData[21]\ : SLE
      port map(D => TxData_Z(20), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(21));
    
    SS_old : SLE
      port map(D => SS_latched_Z, CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => \VCC\, SD
         => \GND\, LAT => \GND\, Q => SS_old_Z);
    
    \TxData[29]\ : SLE
      port map(D => TxData_Z(28), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(29));
    
    \RxdData[8]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(7), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(8));
    
    \TxData[9]\ : SLE
      port map(D => TxData_Z(8), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(9));
    
    \TxData[30]\ : SLE
      port map(D => TxData_Z(29), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(30));
    
    \RxdData[21]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(20), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(21));
    
    \TxData[1]\ : SLE
      port map(D => TxData_Z(0), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(1));
    
    \TxData[12]\ : SLE
      port map(D => TxData_Z(11), CLK => clk_debug, EN => \VCC\, 
        ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn => N_2_i, SD
         => \VCC\, LAT => \GND\, Q => TxData_Z(12));
    
    \RxdData[24]\ : SLE
      port map(D => \spi_slave_0_DataRxd\(23), CLK => clk_debug, 
        EN => N_4_i, ALn => AND2_0_Y_arst_i, ADn => \VCC\, SLn
         => \VCC\, SD => \GND\, LAT => \GND\, Q => 
        \spi_slave_0_DataRxd\(24));
    

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

  component GND
    port( Y : out   std_logic
        );
  end component;

  component OUTBUF
    generic (IOSTD:string := "");

    port( D   : in    std_logic := 'U';
          PAD : out   std_logic
        );
  end component;

  component AND2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component SYSRESET
    port( POWER_ON_RESET_N : out   std_logic;
          DEVRST_N         : in    std_logic := 'U'
        );
  end component;

  component dac_0
    port( data_receiver_0_data_right : in    std_logic_vector(15 downto 0) := (others => 'U');
          dac_reset_i                : in    std_logic := 'U';
          clk_debug                  : in    std_logic := 'U';
          dac_out_right_c            : out   std_logic
        );
  end component;

  component INBUF
    generic (IOSTD:string := "");

    port( PAD : in    std_logic := 'U';
          Y   : out   std_logic
        );
  end component;

  component OSC_C0
    port( OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC : out   std_logic
        );
  end component;

  component CLKINT
    port( A : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component dac
    port( data_receiver_0_data_left : in    std_logic_vector(15 downto 0) := (others => 'U');
          dac_reset_i               : in    std_logic := 'U';
          clk_debug                 : in    std_logic := 'U';
          dac_out_left_c            : out   std_logic
        );
  end component;

  component FCCC_C0
    port( clk_debug                                          : out   std_logic;
          FCCC_C0_0_LOCK                                     : out   std_logic;
          OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC : in    std_logic := 'U'
        );
  end component;

  component CFG1
    generic (INIT:std_logic_vector(1 downto 0) := "00");

    port( A : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component data_receiver
    port( spi_slave_0_DataRxd        : in    std_logic_vector(31 downto 0) := (others => 'U');
          data_receiver_0_data_left  : out   std_logic_vector(15 downto 0);
          data_receiver_0_data_right : out   std_logic_vector(15 downto 0);
          AND2_0_Y                   : in    std_logic := 'U';
          spi_slave_0_SPI_DONE       : in    std_logic := 'U';
          AND2_0_Y_arst_i            : in    std_logic := 'U';
          dac_reset_i                : out   std_logic
        );
  end component;

  component spi_slave
    port( spi_slave_0_DataRxd  : out   std_logic_vector(31 downto 0);
          spi_miso_c           : out   std_logic;
          spi_mosi_c           : in    std_logic := 'U';
          spi_sck_c            : in    std_logic := 'U';
          spi_ss_c             : in    std_logic := 'U';
          clk_debug            : in    std_logic := 'U';
          AND2_0_Y_arst_i      : in    std_logic := 'U';
          spi_slave_0_SPI_DONE : out   std_logic
        );
  end component;

    signal data_receiver_0_data_left : 
        std_logic_vector(15 downto 0);
    signal data_receiver_0_data_right : 
        std_logic_vector(15 downto 0);
    signal spi_slave_0_DataRxd : std_logic_vector(31 downto 0);
    signal FCCC_C0_0_LOCK, SYSRESET_0_POWER_ON_RESET_N, clk_debug, 
        spi_slave_0_SPI_DONE, \VCC\, \GND\, AND2_0_Y_arst, 
        AND2_0_Y, spi_mosi_c, spi_sck_c, spi_ss_c, dac_out_left_c, 
        dac_out_right_c, spi_miso_c, AND2_0_Y_arst_i, 
        data_receiver_0_dac_reset_i, 
        OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC
         : std_logic;

    for all : dac_0
	Use entity work.dac_0(DEF_ARCH);
    for all : OSC_C0
	Use entity work.OSC_C0(DEF_ARCH);
    for all : dac
	Use entity work.dac(DEF_ARCH);
    for all : FCCC_C0
	Use entity work.FCCC_C0(DEF_ARCH);
    for all : data_receiver
	Use entity work.data_receiver(DEF_ARCH);
    for all : spi_slave
	Use entity work.spi_slave(DEF_ARCH);
begin 


    GND_Z : GND
      port map(Y => \GND\);
    
    spi_miso_obuf : OUTBUF
      generic map(IOSTD => "")

      port map(D => spi_miso_c, PAD => spi_miso);
    
    AND2_0 : AND2
      port map(A => FCCC_C0_0_LOCK, B => 
        SYSRESET_0_POWER_ON_RESET_N, Y => AND2_0_Y);
    
    VCC_Z : VCC
      port map(Y => \VCC\);
    
    dac_out_left_obuf : OUTBUF
      generic map(IOSTD => "")

      port map(D => dac_out_left_c, PAD => dac_out_left);
    
    SYSRESET_0 : SYSRESET
      port map(POWER_ON_RESET_N => SYSRESET_0_POWER_ON_RESET_N, 
        DEVRST_N => DEVRST_N);
    
    dac_1 : dac_0
      port map(data_receiver_0_data_right(15) => 
        data_receiver_0_data_right(15), 
        data_receiver_0_data_right(14) => 
        data_receiver_0_data_right(14), 
        data_receiver_0_data_right(13) => 
        data_receiver_0_data_right(13), 
        data_receiver_0_data_right(12) => 
        data_receiver_0_data_right(12), 
        data_receiver_0_data_right(11) => 
        data_receiver_0_data_right(11), 
        data_receiver_0_data_right(10) => 
        data_receiver_0_data_right(10), 
        data_receiver_0_data_right(9) => 
        data_receiver_0_data_right(9), 
        data_receiver_0_data_right(8) => 
        data_receiver_0_data_right(8), 
        data_receiver_0_data_right(7) => 
        data_receiver_0_data_right(7), 
        data_receiver_0_data_right(6) => 
        data_receiver_0_data_right(6), 
        data_receiver_0_data_right(5) => 
        data_receiver_0_data_right(5), 
        data_receiver_0_data_right(4) => 
        data_receiver_0_data_right(4), 
        data_receiver_0_data_right(3) => 
        data_receiver_0_data_right(3), 
        data_receiver_0_data_right(2) => 
        data_receiver_0_data_right(2), 
        data_receiver_0_data_right(1) => 
        data_receiver_0_data_right(1), 
        data_receiver_0_data_right(0) => 
        data_receiver_0_data_right(0), dac_reset_i => 
        data_receiver_0_dac_reset_i, clk_debug => clk_debug, 
        dac_out_right_c => dac_out_right_c);
    
    spi_sck_ibuf : INBUF
      generic map(IOSTD => "")

      port map(PAD => spi_sck, Y => spi_sck_c);
    
    OSC_C0_0 : OSC_C0
      port map(OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC
         => OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC);
    
    AND2_0_RNIKOS1 : CLKINT
      port map(A => AND2_0_Y, Y => AND2_0_Y_arst);
    
    spi_mosi_ibuf : INBUF
      generic map(IOSTD => "")

      port map(PAD => spi_mosi, Y => spi_mosi_c);
    
    \dac_0\ : dac
      port map(data_receiver_0_data_left(15) => 
        data_receiver_0_data_left(15), 
        data_receiver_0_data_left(14) => 
        data_receiver_0_data_left(14), 
        data_receiver_0_data_left(13) => 
        data_receiver_0_data_left(13), 
        data_receiver_0_data_left(12) => 
        data_receiver_0_data_left(12), 
        data_receiver_0_data_left(11) => 
        data_receiver_0_data_left(11), 
        data_receiver_0_data_left(10) => 
        data_receiver_0_data_left(10), 
        data_receiver_0_data_left(9) => 
        data_receiver_0_data_left(9), 
        data_receiver_0_data_left(8) => 
        data_receiver_0_data_left(8), 
        data_receiver_0_data_left(7) => 
        data_receiver_0_data_left(7), 
        data_receiver_0_data_left(6) => 
        data_receiver_0_data_left(6), 
        data_receiver_0_data_left(5) => 
        data_receiver_0_data_left(5), 
        data_receiver_0_data_left(4) => 
        data_receiver_0_data_left(4), 
        data_receiver_0_data_left(3) => 
        data_receiver_0_data_left(3), 
        data_receiver_0_data_left(2) => 
        data_receiver_0_data_left(2), 
        data_receiver_0_data_left(1) => 
        data_receiver_0_data_left(1), 
        data_receiver_0_data_left(0) => 
        data_receiver_0_data_left(0), dac_reset_i => 
        data_receiver_0_dac_reset_i, clk_debug => clk_debug, 
        dac_out_left_c => dac_out_left_c);
    
    dac_out_right_obuf : OUTBUF
      generic map(IOSTD => "")

      port map(D => dac_out_right_c, PAD => dac_out_right);
    
    spi_ss_ibuf : INBUF
      generic map(IOSTD => "")

      port map(PAD => spi_ss, Y => spi_ss_c);
    
    FCCC_C0_0 : FCCC_C0
      port map(clk_debug => clk_debug, FCCC_C0_0_LOCK => 
        FCCC_C0_0_LOCK, 
        OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC => 
        OSC_C0_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC);
    
    AND2_0_RNIKOS1_0 : CFG1
      generic map(INIT => "01")

      port map(A => AND2_0_Y_arst, Y => AND2_0_Y_arst_i);
    
    data_receiver_0 : data_receiver
      port map(spi_slave_0_DataRxd(31) => spi_slave_0_DataRxd(31), 
        spi_slave_0_DataRxd(30) => spi_slave_0_DataRxd(30), 
        spi_slave_0_DataRxd(29) => spi_slave_0_DataRxd(29), 
        spi_slave_0_DataRxd(28) => spi_slave_0_DataRxd(28), 
        spi_slave_0_DataRxd(27) => spi_slave_0_DataRxd(27), 
        spi_slave_0_DataRxd(26) => spi_slave_0_DataRxd(26), 
        spi_slave_0_DataRxd(25) => spi_slave_0_DataRxd(25), 
        spi_slave_0_DataRxd(24) => spi_slave_0_DataRxd(24), 
        spi_slave_0_DataRxd(23) => spi_slave_0_DataRxd(23), 
        spi_slave_0_DataRxd(22) => spi_slave_0_DataRxd(22), 
        spi_slave_0_DataRxd(21) => spi_slave_0_DataRxd(21), 
        spi_slave_0_DataRxd(20) => spi_slave_0_DataRxd(20), 
        spi_slave_0_DataRxd(19) => spi_slave_0_DataRxd(19), 
        spi_slave_0_DataRxd(18) => spi_slave_0_DataRxd(18), 
        spi_slave_0_DataRxd(17) => spi_slave_0_DataRxd(17), 
        spi_slave_0_DataRxd(16) => spi_slave_0_DataRxd(16), 
        spi_slave_0_DataRxd(15) => spi_slave_0_DataRxd(15), 
        spi_slave_0_DataRxd(14) => spi_slave_0_DataRxd(14), 
        spi_slave_0_DataRxd(13) => spi_slave_0_DataRxd(13), 
        spi_slave_0_DataRxd(12) => spi_slave_0_DataRxd(12), 
        spi_slave_0_DataRxd(11) => spi_slave_0_DataRxd(11), 
        spi_slave_0_DataRxd(10) => spi_slave_0_DataRxd(10), 
        spi_slave_0_DataRxd(9) => spi_slave_0_DataRxd(9), 
        spi_slave_0_DataRxd(8) => spi_slave_0_DataRxd(8), 
        spi_slave_0_DataRxd(7) => spi_slave_0_DataRxd(7), 
        spi_slave_0_DataRxd(6) => spi_slave_0_DataRxd(6), 
        spi_slave_0_DataRxd(5) => spi_slave_0_DataRxd(5), 
        spi_slave_0_DataRxd(4) => spi_slave_0_DataRxd(4), 
        spi_slave_0_DataRxd(3) => spi_slave_0_DataRxd(3), 
        spi_slave_0_DataRxd(2) => spi_slave_0_DataRxd(2), 
        spi_slave_0_DataRxd(1) => spi_slave_0_DataRxd(1), 
        spi_slave_0_DataRxd(0) => spi_slave_0_DataRxd(0), 
        data_receiver_0_data_left(15) => 
        data_receiver_0_data_left(15), 
        data_receiver_0_data_left(14) => 
        data_receiver_0_data_left(14), 
        data_receiver_0_data_left(13) => 
        data_receiver_0_data_left(13), 
        data_receiver_0_data_left(12) => 
        data_receiver_0_data_left(12), 
        data_receiver_0_data_left(11) => 
        data_receiver_0_data_left(11), 
        data_receiver_0_data_left(10) => 
        data_receiver_0_data_left(10), 
        data_receiver_0_data_left(9) => 
        data_receiver_0_data_left(9), 
        data_receiver_0_data_left(8) => 
        data_receiver_0_data_left(8), 
        data_receiver_0_data_left(7) => 
        data_receiver_0_data_left(7), 
        data_receiver_0_data_left(6) => 
        data_receiver_0_data_left(6), 
        data_receiver_0_data_left(5) => 
        data_receiver_0_data_left(5), 
        data_receiver_0_data_left(4) => 
        data_receiver_0_data_left(4), 
        data_receiver_0_data_left(3) => 
        data_receiver_0_data_left(3), 
        data_receiver_0_data_left(2) => 
        data_receiver_0_data_left(2), 
        data_receiver_0_data_left(1) => 
        data_receiver_0_data_left(1), 
        data_receiver_0_data_left(0) => 
        data_receiver_0_data_left(0), 
        data_receiver_0_data_right(15) => 
        data_receiver_0_data_right(15), 
        data_receiver_0_data_right(14) => 
        data_receiver_0_data_right(14), 
        data_receiver_0_data_right(13) => 
        data_receiver_0_data_right(13), 
        data_receiver_0_data_right(12) => 
        data_receiver_0_data_right(12), 
        data_receiver_0_data_right(11) => 
        data_receiver_0_data_right(11), 
        data_receiver_0_data_right(10) => 
        data_receiver_0_data_right(10), 
        data_receiver_0_data_right(9) => 
        data_receiver_0_data_right(9), 
        data_receiver_0_data_right(8) => 
        data_receiver_0_data_right(8), 
        data_receiver_0_data_right(7) => 
        data_receiver_0_data_right(7), 
        data_receiver_0_data_right(6) => 
        data_receiver_0_data_right(6), 
        data_receiver_0_data_right(5) => 
        data_receiver_0_data_right(5), 
        data_receiver_0_data_right(4) => 
        data_receiver_0_data_right(4), 
        data_receiver_0_data_right(3) => 
        data_receiver_0_data_right(3), 
        data_receiver_0_data_right(2) => 
        data_receiver_0_data_right(2), 
        data_receiver_0_data_right(1) => 
        data_receiver_0_data_right(1), 
        data_receiver_0_data_right(0) => 
        data_receiver_0_data_right(0), AND2_0_Y => AND2_0_Y, 
        spi_slave_0_SPI_DONE => spi_slave_0_SPI_DONE, 
        AND2_0_Y_arst_i => AND2_0_Y_arst_i, dac_reset_i => 
        data_receiver_0_dac_reset_i);
    
    spi_slave_0 : spi_slave
      port map(spi_slave_0_DataRxd(31) => spi_slave_0_DataRxd(31), 
        spi_slave_0_DataRxd(30) => spi_slave_0_DataRxd(30), 
        spi_slave_0_DataRxd(29) => spi_slave_0_DataRxd(29), 
        spi_slave_0_DataRxd(28) => spi_slave_0_DataRxd(28), 
        spi_slave_0_DataRxd(27) => spi_slave_0_DataRxd(27), 
        spi_slave_0_DataRxd(26) => spi_slave_0_DataRxd(26), 
        spi_slave_0_DataRxd(25) => spi_slave_0_DataRxd(25), 
        spi_slave_0_DataRxd(24) => spi_slave_0_DataRxd(24), 
        spi_slave_0_DataRxd(23) => spi_slave_0_DataRxd(23), 
        spi_slave_0_DataRxd(22) => spi_slave_0_DataRxd(22), 
        spi_slave_0_DataRxd(21) => spi_slave_0_DataRxd(21), 
        spi_slave_0_DataRxd(20) => spi_slave_0_DataRxd(20), 
        spi_slave_0_DataRxd(19) => spi_slave_0_DataRxd(19), 
        spi_slave_0_DataRxd(18) => spi_slave_0_DataRxd(18), 
        spi_slave_0_DataRxd(17) => spi_slave_0_DataRxd(17), 
        spi_slave_0_DataRxd(16) => spi_slave_0_DataRxd(16), 
        spi_slave_0_DataRxd(15) => spi_slave_0_DataRxd(15), 
        spi_slave_0_DataRxd(14) => spi_slave_0_DataRxd(14), 
        spi_slave_0_DataRxd(13) => spi_slave_0_DataRxd(13), 
        spi_slave_0_DataRxd(12) => spi_slave_0_DataRxd(12), 
        spi_slave_0_DataRxd(11) => spi_slave_0_DataRxd(11), 
        spi_slave_0_DataRxd(10) => spi_slave_0_DataRxd(10), 
        spi_slave_0_DataRxd(9) => spi_slave_0_DataRxd(9), 
        spi_slave_0_DataRxd(8) => spi_slave_0_DataRxd(8), 
        spi_slave_0_DataRxd(7) => spi_slave_0_DataRxd(7), 
        spi_slave_0_DataRxd(6) => spi_slave_0_DataRxd(6), 
        spi_slave_0_DataRxd(5) => spi_slave_0_DataRxd(5), 
        spi_slave_0_DataRxd(4) => spi_slave_0_DataRxd(4), 
        spi_slave_0_DataRxd(3) => spi_slave_0_DataRxd(3), 
        spi_slave_0_DataRxd(2) => spi_slave_0_DataRxd(2), 
        spi_slave_0_DataRxd(1) => spi_slave_0_DataRxd(1), 
        spi_slave_0_DataRxd(0) => spi_slave_0_DataRxd(0), 
        spi_miso_c => spi_miso_c, spi_mosi_c => spi_mosi_c, 
        spi_sck_c => spi_sck_c, spi_ss_c => spi_ss_c, clk_debug
         => clk_debug, AND2_0_Y_arst_i => AND2_0_Y_arst_i, 
        spi_slave_0_SPI_DONE => spi_slave_0_SPI_DONE);
    

end DEF_ARCH; 
