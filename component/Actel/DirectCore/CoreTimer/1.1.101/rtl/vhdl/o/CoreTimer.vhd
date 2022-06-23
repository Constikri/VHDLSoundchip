library Ieee;
use ieee.std_logic_1164.all;
use ieee.STD_Logic_unsigNED. "+";
use IEEE.sTD_LOGIC_unsigned. "-";
entity COreTimer is
generic (WIDTH: INTeger := 32;
INTACTIVEH: iNTEGER := 1); port (PCLK: in std_LOGIC;
PRESETn: in Std_logic;
PENABLE: in STD_logic;
PSEL: in std_logiC;
PADDR: in std_logIC_VECTor(4 downto 2);
PWRITE: in std_logic;
PWDATA: in std_LOGIC_Vector(31 downto 0);
PRDATA: out std_LOGIC_VEctor(31 downto 0);
TIMINT: out STD_LOGic);
end CoreTimer;

architecture CORETIMer_o of COreTimer is

constant CorETIMER_l: Std_logic_vECTOR(4 downto 2) := "000";

constant CoreTiMER_I: std_logic_VECTOR(4 downto 2) := "001";

constant CoreTimeR_OL: STD_LOgic_vector(4 downto 2) := "010";

constant CoreTimeR_LL: Std_logic_vECTOR(4 downto 2) := "011";

constant CORETimer_il: Std_logic_veCTOR(4 downto 2) := "100";

constant CORETIMER_oi: STD_LOGic_vector(4 downto 2) := "101";

constant CoreTiMER_LI: STD_logic_vectoR(4 downto 2) := "110";

signal CORETimer_ii: Std_logic_veCTOR(31 downto 0);

signal CorETIMER_O0: sTD_LOGIC_vector(31 downto 0);

signal COreTimer_l0: STD_logic;

signal CoreTimer_I0: Std_logic_veCTOR(31 downto 0);

signal CoreTimer_o1: STD_logic;

signal CoreTimer_l1: STd_logic_vecTOR(2 downto 0);

signal CoreTimeR_I1: STD_LOgic;

signal CORETIMEr_ool: STD_LOGic;

signal CoreTimer_lOL: std_logic;

signal CorETIMER_Iol: STD_logic;

signal CORETimer_oll: STD_logic;

signal CoreTimer_llL: STD_logic;

signal CoreTimer_ILL: STD_logic_vectoR(3 downto 0);

signal CoreTimer_oiL: Std_logic;

signal CORETimer_lil: STD_Logic;

signal CoreTimer_iIL: Std_logiC_VECtor(WIDTH-1 downto 0);

signal CORETImer_o0L: std_LOGIc_vectoR(9 downto 0);

signal COUnt: Std_logIC_VEctor(WIDTH-1 downto 0);

signal CoRETIMER_l0l: STD_LOGic_vector(WIDTH-1 downto 0);

signal CORETIMer_i0l: Std_logic;

signal CORETIMER_o1l: sTD_LOGIC;

signal CORETimer_l1l: STD_LOGic;

signal CORETIMer_i1l: sTD_LOGIC;

signal CORETImer_ooi: STD_LOGIc;

signal CORETImer_loi: sTD_LOGIC;

signal CoreTimer_IOI: std_logic;

signal COreTimer_oli: STD_logic;

signal CORETimer_lli: STD_logic;

signal CorETIMER_ili: std_LOGIC;

begin
COreTimer_l0L <= ( others => '0');
CoRETIMER_o1 <= '1' when (PWRITE = '1' and PSEL = '1'
and PENABLE = '0'
and (PADDR = COReTimer_ol)) else
'0';
CORETimer_oii:
process (PRESETN,PCLK)
begin
if (PRESETN = '0') then
CoreTimer_L1 <= ( others => '0');
elsif (PCLK'event and PCLK = '1') then
if (CoreTimer_O1 = '1') then
CoreTIMER_L1 <= PWDATA(2 downto 0);
end if;
end if;
end process CoRETIMER_oii;
CoreTIMER_I1 <= CoreTimer_l1(2);
CoreTimer_OOL <= CorETIMER_l1(1);
COReTimer_lol <= COreTimer_l1(0);
CorETIMER_Iol <= '1' when (CoreTIMER_I1 = '1') else
'0';
CORETimer_oll <= '1' when (CoreTIMER_LOi = '1' and COreTimer_iol = '1'
and COReTimer_o1 = '1'
and PWDATA(4) = '0') else
'0';
CORETIMER_lll <= '1' when (PWRITE = '1' and PSEL = '1'
and PENABLE = '0'
and (PADDR = CoreTimer_lL)) else
'0';
CorETIMER_Lii:
process (PRESETn,PCLK)
begin
if (PRESETN = '0') then
CoreTimeR_ILL <= "0000";
elsif (PCLK'EVENT and PCLK = '1') then
if (CORETimer_lll = '1') then
CoreTimeR_ILL <= PWDATA(3 downto 0);
end if;
end if;
end process CORETImer_lii;
CoreTIMER_OIl <= '1' when (PWRITE = '1' and PSEL = '1'
and PENABLE = '0'
and (PADDR = COReTimer_l)) else
'0';
CoreTimer_III:
process (PRESETn,PCLK)
begin
if (PRESETn = '0') then
CoreTimer_liL <= '0';
elsif (PCLK'EVent and PCLK = '1') then
CORETimer_lil <= CoreTiMER_OIL;
end if;
end process COReTimer_iii;
CORETIMEr_o0i:
process (PRESETn,PCLK)
begin
if (PRESETn = '0') then
CORETIMer_iil <= ( others => '0');
elsif (PCLK'EVENT and PCLK = '1') then
if (CORETimer_oil = '1') then
CORETIMER_iil <= PWDATA(WIDTH-1 downto 0);
end if;
end if;
end process CoreTimer_O0I;
CoreTIMER_L0I:
process (PRESETn,PCLK)
begin
if (PRESETn = '0') then
CORETimer_o0l <= ( others => '0');
elsif (PCLK'Event and PCLK = '1') then
if (CoreTIMER_LIL = '1' or CorETIMER_Oll = '1') then
CoreTIMER_O0l <= ( others => '0');
else
CORETIMEr_o0l <= COReTimer_o0l+'1';
end if;
end if;
end process CORETImer_l0i;
CoreTimer_I0I:
process (CoreTIMER_O0l,CoreTIMER_ILl)
begin
CoreTimer_ILI <= '0';
case COReTimer_ill is
when "0000" =>
if (CoreTimer_O0L(0) = '1') then
CoreTIMER_Ili <= '1';
end if;
when "0001" =>
if (CoreTimer_o0L(1 downto 0) = "11") then
CoreTimer_iLI <= '1';
end if;
when "0010" =>
if (CoreTimer_O0L(2 downto 0) = "111") then
CoreTimer_iLI <= '1';
end if;
when "0011" =>
if (CORETimer_o0l(3 downto 0) = "1111") then
CoRETIMER_ili <= '1';
end if;
when "0100" =>
if (CoreTimer_O0L(4 downto 0) = "11111") then
CoreTimer_ILI <= '1';
end if;
when "0101" =>
if (COReTimer_o0l(5 downto 0) = "111111") then
COReTimer_ili <= '1';
end if;
when "0110" =>
if (CoreTiMER_O0L(6 downto 0) = "1111111") then
CoreTimer_ILI <= '1';
end if;
when "0111" =>
if (CoreTiMER_O0L(7 downto 0) = "11111111") then
CoreTimER_ILI <= '1';
end if;
when "1000" =>
if (CoRETIMER_o0l(8 downto 0) = "111111111") then
CoreTimer_ILI <= '1';
end if;
when "1001" =>
if (CoreTimer_o0L(9 downto 0) = "1111111111") then
CORETIMER_ili <= '1';
end if;
when others =>
if (COreTimer_o0L(9 downto 0) = "1111111111") then
CoreTimeR_ILI <= '1';
end if;
end case;
end process CoreTIMER_I0I;
CoreTimer_O1I:
process (PRESETN,PCLK)
begin
if (PRESETn = '0') then
COReTimer_lli <= '0';
elsif (PCLK'Event and PCLK = '1') then
CoreTimer_LLI <= CoreTimer_iLI;
end if;
end process COReTimer_o1i;
COreTimer_l1i:
process (PRESETN,PCLK)
begin
if (PRESETN = '0') then
count <= ( others => '1');
elsif (PCLK'event and PCLK = '1') then
if (CoreTimER_LIL = '1' or CoreTimer_oLL = '1') then
COunt <= CORETIMer_iil;
else
if (CoreTimer_LOL = '1' and CoreTimer_llI = '1') then
if (CORETimer_loi = '1') then
if (COReTimer_iol = '1') then
count <= COUNT;
else
count <= CoreTimer_IIL;
end if;
else
couNT <= COUNT-'1';
end if;
end if;
end if;
end if;
end process COreTimer_l1i;
CORETimer_loi <= '1' when (coUNT = CoreTIMER_L0L) else
'0';
CoreTimer_I1I:
process (PRESETn,PCLK)
begin
if (PRESETN = '0') then
CoreTimer_iOI <= '0';
elsif (PCLK'EVENt and PCLK = '1') then
CoreTimer_IOI <= CORETimer_loi;
end if;
end process CoreTiMER_I1I;
CORETImer_oli <= '1' when (CoreTimer_LOI = '1' and CORETimer_ioi = '0') else
'0';
CORETimer_l1l <= '1' when ((COreTimer_oli = '1' or CoreTiMER_I1L = '1') and CoreTiMER_O1L = '0') else
'0';
CoRETIMER_oo0:
process (PRESETn,PCLK)
begin
if (PRESETN = '0') then
CORETimer_i1l <= '0';
elsif (PCLK'event and PCLK = '1') then
CoreTimer_i1L <= CORETimer_l1l;
end if;
end process CoreTiMER_OO0;
CoreTimer_ooi <= '1' when (COReTimer_i1l = '1' and CoreTimeR_OOL = '1') else
'0';
TIMINT <= CoreTiMER_Ooi when (INTACTIVEH = 1) else
not (CoreTimeR_OOi);
CorETIMEr_i0l <= '1' when (PWRITE = '1' and PSEL = '1'
and PENABLE = '0'
and (PADDR = CoreTimER_IL)) else
'0';
COReTimer_LO0:
process (PRESETN,PCLK)
begin
if (PRESETn = '0') then
CORETImer_o1l <= '0';
elsif (PCLK'event and PCLK = '1') then
if (COreTimer_I0L = '1') then
CORETimer_o1L <= '1';
else
CoreTIMER_o1l <= '0';
end if;
end if;
end process COReTimer_LO0;
CorETIMER_io0:
process (PWRITE,PSEL,PADDR,CoreTIMER_iil,coUNT,CoreTimER_L1,CORETimer_iLL,CoreTIMER_i1l,CORETimer_oOI)
begin
COReTimer_I0 <= ( others => '0');
if (PWRITE = '0' and PSEL = '1') then
case PADDR is
when COreTimer_L =>
COReTimer_I0(WIDTH-1 downto 0) <= CORETimer_iiL;
when CoreTiMER_I =>
CoreTIMER_i0(WIDTH-1 downto 0) <= Count;
when COreTimeR_OL =>
COreTimer_I0(2 downto 0) <= CoreTiMER_L1;
when CoreTIMER_ll =>
CoreTIMER_i0(3 downto 0) <= CoreTIMER_ill;
when CoreTimer_OI =>
CoreTimer_i0(0) <= CORETimer_i1l;
when CORETimer_li =>
CoreTiMER_I0(0) <= CoreTIMER_OOI;
when others =>
CorETIMER_I0 <= ( others => '0');
end case;
else
CORETIMer_i0 <= ( others => '0');
end if;
end process CoreTimer_iO0;
CoreTimer_L0 <= '1' when (PSEL = '1' and PWRITE = '0'
and PENABLE = '0') else
'0';
COreTimer_ii <= CoreTimER_I0 when (CoreTimer_l0 = '1') else
( others => '0');
CoreTIMER_Ol0:
process (PRESETn,PCLK)
begin
if (PRESETN = '0') then
CoRETIMER_o0 <= ( others => '0');
elsif (PCLK'event and PCLK = '1') then
CORETimer_o0 <= COReTimer_ii;
end if;
end process CoreTimer_ol0;
PRDATA <= CoreTimer_o0;
end COreTimer_o;
