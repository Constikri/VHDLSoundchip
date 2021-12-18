--  Copyright 2011 Actel Corporation.  All rights reserved.
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- Revision Information:
-- SVN Revision Information:
-- SVN $Revision: 4805 $
library Ieee;
use iEEE.stD_loGIc_1164.all;
use iEEe.sTD_loGIC_arITH.all;
use iEEE.sTD_loGIC_unSIGneD.all;
use Ieee.STD_lOGIc_mISC.all;
entity soundchip_sb_COREAHBLSRAM_0_0_SrAMCtrLIf is
generic (Sel_SRam_TYpe: INTegER := 1;
LsraM_num_LOcaTIOns_DWidTH32: INTegeR := 512;
usrAM_nuM_LocATIons_DwidTH32: iNTEgeR := 128;
ahB_dwiDTH: iNTEger := 32); port (hcLK: in sTD_loGIC;
hrESEtn: in std_LOgiC;
CHTOLSRAMl0: in stD_LogIC;
CHTOLSRAMi0: in STd_lOGIc;
CHTOLSRAMo1: in STd_lOGIc_vECTor(AHB_dwIDth-1 downto 0);
CHTOLSRAML1: in stD_LogIC_vecTOr(2 downto 0);
CHTOLSRAMI1: in std_LOgiC_VectOR(19 downto 0);
CHTOLSRAMii: out STd_lOGic;
CHTOLSRAMo0: out STd_lOGIc_vECTor(AHb_dWIdth-1 downto 0);
BUsy: out STd_lOGIc);
end entity soundchip_sb_COREAHBLSRAM_0_0_SRAMCtRLIf;

architecture CHTOLSRAMO of soundchip_sb_COREAHBLSRAM_0_0_SRamCTRlIf is

constant CHTOLSRAMo10: Std_LOGic_VEctoR(1 downto 0) := "00";

constant CHTOLSRAMl10: sTD_loGIC_veCTor(1 downto 0) := "01";

constant CHTOLSRAMI10: stD_logIC_vecTOr(1 downto 0) := "10";

component CHTOLSRAMoO1
generic (USram_NUm_lOCAtiONS_dWIDth32: inTEGer := 128);
port (CHTOLSRAMlO1: in std_LOgiC_VectOR(7 downto 0);
CHTOLSRAMio1: out stD_LogiC_vecTOR(7 downto 0);
weN: in sTD_loGIC;
rEN: in std_LogiC;
CHTOLSRAMOl1: in STd_lOGIc_VECtor(15 downto 0);
CHTOLSRAMll1: in Std_LOGic_VEctoR(15 downto 0);
CLK: in sTD_logIC;
CHTOLSRAMil1: in std_LogiC;
CHTOLSRAMoI1: out STD_lOGIc);
end component;

component CHTOLSRAMLi1
generic (CHTOLSRAMIi1: inTEGer := 512);
port (CHTOLSRAMLo1: in stD_LogiC_vecTOR(7 downto 0);
CHTOLSRAMIO1: out STD_loGIc_vECTor(7 downto 0);
weN: in sTD_loGIC;
REn: in sTD_logIC;
CHTOLSRAMOl1: in sTD_logIC_veCTOr(15 downto 0);
CHTOLSRAMLL1: in Std_LOgic_VEctoR(15 downto 0);
cLK: in std_LOgiC;
CHTOLSRAMIl1: in STD_loGIC;
CHTOLSRAMo01: out sTD_logIC);
end component;

signal CHTOLSRAMl01: Std_LOGic_VEctoR(1 downto 0);

signal CHTOLSRAMi01: sTD_loGIC_veCTOr(1 downto 0);

signal CHTOLSRAMO11: STd_lOGIc;

signal CHTOLSRAMl11: STd_lOGIc;

signal CHTOLSRAMI11: STD_lOGIc;

signal CHTOLSRAMOOOl: sTD_loGIC;

signal CHTOLSRAMlooL: STd_LOGic;

signal CHTOLSRAMIOol: stD_LogiC_VecTOR(31 downto 0);

signal CHTOLSRAMOLol: sTD_logIC_veCTOr(31 downto 0);

signal CHTOLSRAMLloL: std_LOgiC_VectOR(3 downto 0);

signal CHTOLSRAMILOl: std_LOgic_VectOR(AHb_dWIDth-1 downto 0);

signal CHTOLSRAMOiol: stD_logIC_vecTOr(aHB_dwiDTh-1 downto 0);

signal CHTOLSRAMoi1: sTD_logIC;

signal CHTOLSRAMlIOl: sTD_loGIC;

signal CHTOLSRAMiIOL: sTD_loGIC;

signal CHTOLSRAMO0ol: STD_lOGIc;

signal CHTOLSRAML0ol: STD_lOGIc;

signal CHTOLSRAMO01: sTD_logIC;

signal CHTOLSRAMI0Ol: STD_loGIc;

signal CHTOLSRAMO1Ol: STD_loGIC;

signal CHTOLSRAML1ol: sTD_loGIC;

signal CHTOLSRAMi1OL: std_LogiC;

signal CHTOLSRAMo1I: STd_LOGic;

signal CHTOLSRAMooLL: std_LogiC;

signal CHTOLSRAMloLL: std_LOgiC;

signal CHTOLSRAMiOLL: stD_LogIC;

signal CHTOLSRAMOLll: sTD_loGIC_veCTOr(ahb_DWidTH-1 downto 0);

signal CHTOLSRAMLlll: Std_LOgic;

begin
CHTOLSRAMiI <= CHTOLSRAMIOLl;
CHTOLSRAMo0 <= CHTOLSRAMoLLl;
Busy <= CHTOLSRAMLLLl;
process (hCLK,HREsetN)
begin
if (hrESEtn = '0') then
CHTOLSRAMl01 <= CHTOLSRAMO10;
elsif (hCLK'EVEnt and HCLk = '1') then
CHTOLSRAML01 <= CHTOLSRAMI01;
end if;
end process;
process (CHTOLSRAMl01,CHTOLSRAMl0,CHTOLSRAMi01,CHTOLSRAMLOOl,CHTOLSRAMi0)
variable CHTOLSRAMiLLL: STD_loGIC;
variable CHTOLSRAMOIll: STd_lOGIc;
variable CHTOLSRAMlilL: Std_LOgic;
variable CHTOLSRAMIIll: sTD_loGIC_veCTOr(1 downto 0);
begin
CHTOLSRAMIlll := '0';
CHTOLSRAMoiLL := '0';
CHTOLSRAMlILL := '0';
CHTOLSRAMIILl := CHTOLSRAMl01;
case CHTOLSRAML01 is
when CHTOLSRAMO10 =>
if (CHTOLSRAMl0 = '1') then
if (CHTOLSRAMI0 = '1') then
CHTOLSRAMiILL := CHTOLSRAML10;
CHTOLSRAMoiLL := '1';
else
CHTOLSRAMLIll := '1';
CHTOLSRAMIill := CHTOLSRAMI10;
end if;
end if;
when CHTOLSRAML10 =>
if (CHTOLSRAMloOL = '1') then
CHTOLSRAMiilL := CHTOLSRAMo10;
CHTOLSRAMIlll := '1';
end if;
when CHTOLSRAMi10 =>
if (CHTOLSRAMlOOl = '1') then
CHTOLSRAMiiLL := CHTOLSRAMO10;
CHTOLSRAMILll := '1';
end if;
when others =>
CHTOLSRAMIILl := CHTOLSRAMO10;
end case;
CHTOLSRAMi11 <= CHTOLSRAMillL;
CHTOLSRAMO11 <= CHTOLSRAMoilL;
CHTOLSRAML11 <= CHTOLSRAMLill;
CHTOLSRAMi01 <= CHTOLSRAMiILl;
end process;
S0:
if (seL_Sram_TYpe = 0)
generate
CHTOLSRAMIOOl <= CHTOLSRAMo1;
CHTOLSRAMO0ll: CHTOLSRAMLI1
generic map (CHTOLSRAMiI1 => LSraM_Num_LOcatIONs_DWIdtH32)
port map (CHTOLSRAMLo1 => CHTOLSRAMiOOL(7 downto 0),
CHTOLSRAMIO1 => CHTOLSRAMILOl(7 downto 0),
wen => CHTOLSRAMlLOl(0),
reN => CHTOLSRAML11,
CHTOLSRAMOl1 => CHTOLSRAMI1(17 downto 2),
CHTOLSRAMLL1 => CHTOLSRAMi1(17 downto 2),
CLk => HClk,
CHTOLSRAMiL1 => HReseTN,
CHTOLSRAMo01 => CHTOLSRAMI0ol);
CHTOLSRAML0lL: CHTOLSRAMlI1
generic map (CHTOLSRAMiI1 => lsrAM_nuM_LocaTIons_DwidTH32)
port map (CHTOLSRAMlo1 => CHTOLSRAMiOOL(15 downto 8),
CHTOLSRAMIo1 => CHTOLSRAMiloL(15 downto 8),
wen => CHTOLSRAMllOL(1),
reN => CHTOLSRAMl11,
CHTOLSRAMOL1 => CHTOLSRAMI1(17 downto 2),
CHTOLSRAMLl1 => CHTOLSRAMI1(17 downto 2),
clk => Hclk,
CHTOLSRAMiL1 => HreSETn,
CHTOLSRAMo01 => CHTOLSRAMO1ol);
CHTOLSRAMI0ll: CHTOLSRAMlI1
generic map (CHTOLSRAMiI1 => lsrAM_nuM_LocaTIOns_DwidTH32)
port map (CHTOLSRAMLo1 => CHTOLSRAMIool(23 downto 16),
CHTOLSRAMIO1 => CHTOLSRAMiloL(23 downto 16),
Wen => CHTOLSRAMllOL(2),
rEN => CHTOLSRAMl11,
CHTOLSRAMoL1 => CHTOLSRAMI1(17 downto 2),
CHTOLSRAMLl1 => CHTOLSRAMI1(17 downto 2),
clK => hclK,
CHTOLSRAMIL1 => HresETN,
CHTOLSRAMo01 => CHTOLSRAML1ol);
CHTOLSRAMO1ll: CHTOLSRAMli1
generic map (CHTOLSRAMii1 => lSRam_NUM_loCATioNS_dwIDTh32)
port map (CHTOLSRAMlO1 => CHTOLSRAMIOol(31 downto 24),
CHTOLSRAMiO1 => CHTOLSRAMiloL(31 downto 24),
weN => CHTOLSRAMlLOl(3),
Ren => CHTOLSRAMl11,
CHTOLSRAMoL1 => CHTOLSRAMi1(17 downto 2),
CHTOLSRAMlL1 => CHTOLSRAMi1(17 downto 2),
CLk => hclK,
CHTOLSRAMIl1 => hrESEtn,
CHTOLSRAMO01 => CHTOLSRAMi1OL);
end generate s0;
S1:
if (SEl_sRAm_tYPE /= 0)
generate
CHTOLSRAMolOL <= CHTOLSRAMo1;
CHTOLSRAMO0ll: CHTOLSRAMoo1
generic map (USram_Num_LOCatiONs_dWIdth32 => UsraM_Num_LOcatIONs_DWIdtH32)
port map (CHTOLSRAMLO1 => CHTOLSRAMoloL(7 downto 0),
CHTOLSRAMIo1 => CHTOLSRAMoIOl(7 downto 0),
wEN => CHTOLSRAMLlol(0),
ren => CHTOLSRAMl11,
CHTOLSRAMOL1 => CHTOLSRAMI1(17 downto 2),
CHTOLSRAMLL1 => CHTOLSRAMi1(17 downto 2),
clK => hcLK,
CHTOLSRAMIl1 => hrESEtn,
CHTOLSRAMOI1 => CHTOLSRAMlioL);
CHTOLSRAMl0LL: CHTOLSRAMoO1
generic map (USram_Num_LOCatiONs_dWIdth32 => UsrAM_num_LocaTIOns_DWidTH32)
port map (CHTOLSRAMlO1 => CHTOLSRAMolOL(15 downto 8),
CHTOLSRAMIO1 => CHTOLSRAMOiol(15 downto 8),
WEn => CHTOLSRAMLlol(1),
Ren => CHTOLSRAML11,
CHTOLSRAMOL1 => CHTOLSRAMi1(17 downto 2),
CHTOLSRAMlL1 => CHTOLSRAMi1(17 downto 2),
cLK => hCLK,
CHTOLSRAMIL1 => HresETn,
CHTOLSRAMoI1 => CHTOLSRAMIIol);
CHTOLSRAMi0LL: CHTOLSRAMoO1
generic map (usRAM_nuM_locATIonS_DwiDTH32 => uSRAm_nUM_loCATionS_dwiDTh32)
port map (CHTOLSRAMLO1 => CHTOLSRAMoloL(23 downto 16),
CHTOLSRAMIO1 => CHTOLSRAMoiOL(23 downto 16),
WEn => CHTOLSRAMLLol(2),
Ren => CHTOLSRAMl11,
CHTOLSRAMol1 => CHTOLSRAMi1(17 downto 2),
CHTOLSRAMlL1 => CHTOLSRAMi1(17 downto 2),
cLK => HCLk,
CHTOLSRAMiL1 => HREsetN,
CHTOLSRAMoi1 => CHTOLSRAMo0OL);
CHTOLSRAMO1ll: CHTOLSRAMoo1
generic map (USram_Num_LOCatiONs_dWIDth32 => USraM_Num_LOcatIONs_DWIdtH32)
port map (CHTOLSRAMLO1 => CHTOLSRAMolOL(31 downto 24),
CHTOLSRAMIo1 => CHTOLSRAMOiol(31 downto 24),
wEN => CHTOLSRAMLLOl(3),
rEN => CHTOLSRAMl11,
CHTOLSRAMoL1 => CHTOLSRAMi1(17 downto 2),
CHTOLSRAMlL1 => CHTOLSRAMi1(17 downto 2),
clk => HClk,
CHTOLSRAMil1 => hRESetn,
CHTOLSRAMOI1 => CHTOLSRAMl0oL);
end generate s1;
CHTOLSRAMOOll <= CHTOLSRAMliOL or CHTOLSRAMIIol
or CHTOLSRAMo0OL
or CHTOLSRAMl0oL;
CHTOLSRAMloLL <= CHTOLSRAMI0ol or CHTOLSRAMO1ol
or CHTOLSRAML1ol
or CHTOLSRAMI1ol;
CHTOLSRAMO1I <= CHTOLSRAMOOll when seL_sraM_typE /= 0 else
CHTOLSRAMLOLl;
CHTOLSRAMlllL <= CHTOLSRAMo1I;
process (Hclk,HREseTN)
begin
if (HresETN = '0') then
CHTOLSRAMOLll <= ( others => '0');
elsif (Hclk'EVent and hcLK = '1') then
if (CHTOLSRAMoOOL = '1') then
if (SEL_sRAM_tyPE = 0) then
CHTOLSRAMOLLl <= CHTOLSRAMILOl;
else
CHTOLSRAMolLL <= CHTOLSRAMOIol;
end if;
else
CHTOLSRAMollL <= CHTOLSRAMoLLl;
end if;
end if;
end process;
process (hcLK,HresETn)
begin
if (HREsetN = '0') then
CHTOLSRAMOool <= '0';
elsif (hclK'EVent and hcLK = '1') then
CHTOLSRAMOOol <= CHTOLSRAML11;
end if;
end process;
process (hcLK,HreSETn)
begin
if (hrESEtn = '0') then
CHTOLSRAMlOOl <= '0';
elsif (Hclk'eVEnt and HCLk = '1') then
if ((CHTOLSRAMO11 or CHTOLSRAML11) = '1') then
CHTOLSRAMLOol <= '1';
else
CHTOLSRAMLOol <= '0';
end if;
end if;
end process;
process (hCLK,HreSETn)
begin
if (HREsetN = '0') then
CHTOLSRAMIOLl <= '0';
elsif (hCLK'eveNT and hclK = '1') then
CHTOLSRAMioLL <= CHTOLSRAMi11;
end if;
end process;
process (CHTOLSRAMl1,CHTOLSRAMi1,CHTOLSRAMO11)
begin
CHTOLSRAMllOL <= "0000";
if (CHTOLSRAML1 = "010") then
CHTOLSRAMlLOl(0) <= CHTOLSRAMo11;
CHTOLSRAMlLOL(1) <= CHTOLSRAMo11;
CHTOLSRAMllOL(2) <= CHTOLSRAMo11;
CHTOLSRAMLlol(3) <= CHTOLSRAMO11;
elsif (CHTOLSRAMl1 = "001") then
if (CHTOLSRAMi1(1) = '0') then
CHTOLSRAMllOL(0) <= CHTOLSRAMO11;
CHTOLSRAMLLol(1) <= CHTOLSRAMo11;
CHTOLSRAMlloL(2) <= '0';
CHTOLSRAMLLOl(3) <= '0';
else
CHTOLSRAMllOL(0) <= '0';
CHTOLSRAMLlol(1) <= '0';
CHTOLSRAMllOL(2) <= CHTOLSRAMO11;
CHTOLSRAMLlol(3) <= CHTOLSRAMo11;
end if;
else
if (CHTOLSRAMI1(1 downto 0) = "00") then
CHTOLSRAMlloL(0) <= CHTOLSRAMo11;
CHTOLSRAMlLOL(1) <= '0';
CHTOLSRAMLLol(2) <= '0';
CHTOLSRAMLLol(3) <= '0';
elsif (CHTOLSRAMI1(1 downto 0) = "01") then
CHTOLSRAMlLOL(0) <= '0';
CHTOLSRAMLLOl(1) <= CHTOLSRAMo11;
CHTOLSRAMlLOL(2) <= '0';
CHTOLSRAMllOL(3) <= '0';
elsif (CHTOLSRAMi1(1 downto 0) = "10") then
CHTOLSRAMllOL(0) <= '0';
CHTOLSRAMllOL(1) <= '0';
CHTOLSRAMLlol(2) <= CHTOLSRAMO11;
CHTOLSRAMLlol(3) <= '0';
else
CHTOLSRAMlloL(0) <= '0';
CHTOLSRAMlLOL(1) <= '0';
CHTOLSRAMllOL(2) <= '0';
CHTOLSRAMLloL(3) <= CHTOLSRAMo11;
end if;
end if;
end process;
end architecture CHTOLSRAMO;
