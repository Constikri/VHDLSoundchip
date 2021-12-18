--  Copyright 2011 Actel Corporation.  All rights reserved.
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- Revision Information:
-- SVN Revision Information:
-- SVN $Revision: 4805 $
library IeeE;
use iEEe.stD_loGIc_1164.all;
use IEee.std_LogiC_AriTH.all;
use iEEE.Std_LOGic_UNsigNED.all;
use ieeE.STd_LOGic_MISc.all;
entity CHTOLSRAMli1 is
generic (CHTOLSRAMIi1: INtegER := 2048); port (CHTOLSRAMlo1: in std_LogiC_VecTOR(7 downto 0);
CHTOLSRAMIO1: out STd_lOGic_VECtor(7 downto 0);
wEN: in Std_LOGic;
ren: in STd_LOGic;
CHTOLSRAMOL1: in STD_loGIC_vECTor(15 downto 0);
CHTOLSRAMlL1: in stD_LogIC_vecTOR(15 downto 0);
CLk: in STD_loGIC;
CHTOLSRAMIL1: in STd_lOGIc;
CHTOLSRAMo01: out std_LogiC);
end entity CHTOLSRAMli1;

architecture CHTOLSRAMo of CHTOLSRAMLi1 is

component Ram1K18
port (A_dOUT: out Std_LOgic_VectOR(17 downto 0);
B_doUT: out Std_LOgic_VEctOR(17 downto 0);
a_CLk: in Std_LOGic;
b_CLK: in STd_LOGic;
a_ARst_N: in STD_lOGIc;
b_aRST_n: in stD_logIC;
a_BLK: in stD_LogIC_vecTOR(2 downto 0);
B_Blk: in STD_lOGIc_vECTor(2 downto 0);
a_DIN: in sTD_loGIC_veCTOr(17 downto 0);
b_dIN: in sTD_logIC_veCTOr(17 downto 0);
A_adDR: in STd_LOGic_VECtoR(13 downto 0);
b_ADdr: in stD_logIC_vecTOr(13 downto 0);
A_wen: in Std_LOGic_VEctoR(1 downto 0);
b_wEN: in std_LogiC_VecTOR(1 downto 0);
A_Dout_Clk: in std_LOgic;
b_DOut_CLk: in STd_LOGic;
a_dOUt_eN: in sTD_loGIC;
B_DouT_En: in STd_lOGic;
a_dOUT_aRST_n: in Std_LOgic;
b_DOut_ARst_N: in sTD_logIC;
a_DOut_SRst_N: in stD_LogIC;
b_Dout_SRst_N: in sTD_loGIC;
a_DOut_LAT: in sTD_loGIC;
b_Dout_LAt: in STd_lOGIc;
a_WIdth: in sTD_loGIC_veCTor(2 downto 0);
B_wIDTh: in stD_LogiC_vecTOR(2 downto 0);
A_wmODE: in STD_loGIc;
b_WMOde: in STd_lOGIc;
A_en: in Std_LOGic;
B_en: in STd_lOGIc;
BUsy: out STD_lOGIc;
sII_loCK: in std_LOgiC);
end component;

signal CHTOLSRAML1ll: STD_loGIc_vECTor(15 downto 9);

signal wIDTh0: stD_LogIC_vecTOR(2 downto 0);

signal wiDTh1: Std_LOGic_VECtoR(2 downto 0);

signal wiDTh2: sTD_loGIC_veCTOr(2 downto 0);

signal CHTOLSRAMI1ll: STd_LOGic_VEctoR(2 downto 0);

signal CHTOLSRAMoOIL: std_LOgiC_VectOR(2 downto 0);

signal CHTOLSRAMloiL: STD_loGIc_vECTor(2 downto 0);

signal CHTOLSRAMiOIl: Std_LOgic_VectOR(2 downto 0);

signal CHTOLSRAMOLil: stD_logIC_vecTOr(2 downto 0);

signal CHTOLSRAMlLIl: std_LOgiC_VectOR(2 downto 0);

signal CHTOLSRAMilIL: Std_LOgic_VEctoR(2 downto 0);

signal CHTOLSRAMOIil: sTD_loGIC_veCTOr(2 downto 0);

signal CHTOLSRAMLiil: Std_LOgic_VectOR(2 downto 0);

signal CHTOLSRAMIiil: stD_logIC_veCTOr(2 downto 0);

signal CHTOLSRAMo0Il: stD_LogiC_vecTOR(2 downto 0);

signal CHTOLSRAMl0IL: stD_logIC_veCTOr(2 downto 0);

signal CHTOLSRAMi0IL: Std_LOgic_VEctoR(2 downto 0);

signal CHTOLSRAMo1IL: Std_LOGic_VEctoR(2 downto 0);

signal CHTOLSRAMl1Il: std_LOgic_VectOR(2 downto 0);

signal CHTOLSRAMI1il: sTD_logIC_veCTOr(1 downto 0);

signal CHTOLSRAMOO0l: stD_logIC_vecTOr(1 downto 0);

signal CHTOLSRAMLO0l: stD_LogiC_vecTOR(1 downto 0);

signal CHTOLSRAMIo0L: STD_loGIC_vECTor(1 downto 0);

signal CHTOLSRAMOL0l: stD_logIC_veCTOr(1 downto 0);

signal CHTOLSRAMll0L: STd_lOGIc_vECtor(1 downto 0);

signal CHTOLSRAMIl0l: stD_logIC_vecTOr(1 downto 0);

signal CHTOLSRAMoi0L: Std_LOGic_VEctoR(1 downto 0);

signal CHTOLSRAMLI0l: stD_logIC_vecTOr(1 downto 0);

signal CHTOLSRAMIi0l: sTD_logIC_veCTOr(1 downto 0);

signal CHTOLSRAMO00l: stD_logIC_veCTOr(1 downto 0);

signal CHTOLSRAMl00L: STd_lOGIc_VECtor(1 downto 0);

signal CHTOLSRAMI00l: stD_LogiC_vecTOR(1 downto 0);

signal CHTOLSRAMo10l: std_LogiC_VectOR(1 downto 0);

signal CHTOLSRAML10l: sTD_logIC_veCTOr(1 downto 0);

signal CHTOLSRAMi10L: Std_logIC_veCTOr(1 downto 0);

signal CHTOLSRAMoo1L: Std_LOGic_VEctoR(1 downto 0);

signal CHTOLSRAMlo1L: stD_logIC_vecTOr(1 downto 0);

signal CHTOLSRAMIO1l: sTD_logIC_veCTOr(1 downto 0);

signal CHTOLSRAMOl1l: STD_loGIc_vECTor(1 downto 0);

signal CHTOLSRAMLL1l: std_LOgiC_VectOR(1 downto 0);

signal CHTOLSRAMiL1L: std_LOgic_VectOR(1 downto 0);

signal CHTOLSRAMOI1l: sTD_logIC_veCTOr(1 downto 0);

signal CHTOLSRAMLi1L: STD_loGIC_vECTor(1 downto 0);

signal CHTOLSRAMiI1L: Std_LOGic_VEctoR(1 downto 0);

signal CHTOLSRAMO01l: sTD_loGIC_veCTOr(1 downto 0);

signal CHTOLSRAML01l: sTD_loGIC_veCTOr(1 downto 0);

signal CHTOLSRAMI01l: std_LogiC_VecTOR(1 downto 0);

signal CHTOLSRAMO11l: std_LogiC_VectOR(1 downto 0);

signal CHTOLSRAML11l: std_LogiC_VectOR(1 downto 0);

signal CHTOLSRAMi11L: STD_loGIc_vECTor(1 downto 0);

signal CHTOLSRAMOOoi: Std_LOgic_VectOR(1 downto 0);

signal CHTOLSRAMlOOI: Std_LOgic_VEctoR(1 downto 0);

signal CHTOLSRAMIOoi: std_LogiC_VectOR(1 downto 0);

signal CHTOLSRAMolOI: stD_logIC_veCTOr(1 downto 0);

signal CHTOLSRAMlLOI: STd_lOGIc_VECtor(1 downto 0);

signal CHTOLSRAMiLOI: Std_LOgic_VEctoR(17 downto 0);

signal CHTOLSRAMOIOi: stD_LogIC_vecTOR(17 downto 0);

signal CHTOLSRAMlioI: sTD_logIC_veCTOr(17 downto 0);

signal CHTOLSRAMiioI: STD_loGIC_vECTor(17 downto 0);

signal CHTOLSRAMO0oi: sTD_logIC_veCTOr(17 downto 0);

signal CHTOLSRAMl0OI: std_LogiC_VectOR(17 downto 0);

signal CHTOLSRAMi0Oi: Std_LOgic_VEctOR(17 downto 0);

signal CHTOLSRAMO1Oi: Std_LOgic_VectOR(17 downto 0);

signal CHTOLSRAML1oi: stD_logIC_veCTOr(17 downto 0);

signal CHTOLSRAMi1OI: STd_LOGic_VECtoR(17 downto 0);

signal CHTOLSRAMoOLI: STd_lOGIc_VECtor(17 downto 0);

signal CHTOLSRAMlolI: STD_loGIc_vECTor(17 downto 0);

signal CHTOLSRAMiOLI: STD_loGIc_vECTor(17 downto 0);

signal CHTOLSRAMolLI: STd_lOGIc_VECtor(17 downto 0);

signal CHTOLSRAMLLLi: stD_LogiC_vecTOR(17 downto 0);

signal CHTOLSRAMILLi: stD_LogIC_vecTOR(17 downto 0);

signal CHTOLSRAMOili: sTD_loGIC_veCTOr(17 downto 0);

signal CHTOLSRAMLIli: std_LOgiC_VectOR(17 downto 0);

signal CHTOLSRAMIili: sTD_logIC_veCTOr(17 downto 0);

signal CHTOLSRAMo0LI: stD_logIC_veCTOr(17 downto 0);

signal CHTOLSRAMl0Li: std_LOgiC_VectOR(17 downto 0);

signal CHTOLSRAMI0li: sTD_logIC_veCTOr(17 downto 0);

signal CHTOLSRAMO1li: stD_LogIC_vecTOr(17 downto 0);

signal CHTOLSRAMl1LI: std_LOgic_VectOR(17 downto 0);

signal CHTOLSRAMi1lI: STD_lOGIc_vECTor(17 downto 0);

signal CHTOLSRAMooiI: STd_lOGic_VECtor(17 downto 0);

signal CHTOLSRAMlOII: Std_LOGic_VEctoR(17 downto 0);

signal CHTOLSRAMIoiI: STD_loGIc_vECTor(17 downto 0);

signal CHTOLSRAMOLIi: Std_LOgic_VectOR(17 downto 0);

signal CHTOLSRAMlLII: std_LOgic_VectOR(17 downto 0);

signal CHTOLSRAMiLIi: STD_loGIC_vECTor(17 downto 0);

signal CHTOLSRAMoiiI: STD_lOGIc_vECTor(17 downto 0);

signal CHTOLSRAMliiI: STd_lOGIc_vECtor(17 downto 0);

signal CHTOLSRAMIiii: sTD_logIC_veCTOr(17 downto 0);

signal CHTOLSRAMo0II: STd_lOGIc_vECtor(17 downto 0);

signal CHTOLSRAMl0II: STd_lOGic_VECtor(17 downto 0);

signal CHTOLSRAMi0II: STd_lOGic_VECtor(13 downto 0);

signal CHTOLSRAMo1II: STd_lOGIc_vECtor(13 downto 0);

signal CHTOLSRAMl1II: sTD_loGIC_veCTor(13 downto 0);

signal CHTOLSRAMI1Ii: Std_LOGic_VECtoR(13 downto 0);

signal CHTOLSRAMOO0i: std_LOgic_VectOR(13 downto 0);

signal CHTOLSRAMLO0i: std_LOgic_VectOR(13 downto 0);

signal CHTOLSRAMiO0I: Std_LOgic_VEctoR(13 downto 0);

signal CHTOLSRAMOl0i: sTD_logIC_veCTOr(13 downto 0);

signal CHTOLSRAMlL0I: std_LogiC_VectOR(13 downto 0);

signal CHTOLSRAMiL0I: Std_LOgic_VEctoR(13 downto 0);

signal CHTOLSRAMoi0I: Std_LOGic_VECtoR(13 downto 0);

signal CHTOLSRAMli0I: STD_lOGIc_vECTor(13 downto 0);

signal CHTOLSRAMII0i: stD_LogIC_vecTOR(13 downto 0);

signal CHTOLSRAMO00i: Std_LOgic_VectOR(13 downto 0);

signal CHTOLSRAML00i: stD_LogiC_vecTOR(13 downto 0);

signal CHTOLSRAMi00i: Std_LOGic_VEctoR(13 downto 0);

signal CHTOLSRAMO10I: STD_loGIc_vECTor(13 downto 0);

signal CHTOLSRAML10i: stD_logIC_veCTOr(13 downto 0);

signal CHTOLSRAMI10i: sTD_loGIC_veCTor(13 downto 0);

signal CHTOLSRAMOo1i: stD_LogIC_vecTOR(13 downto 0);

signal CHTOLSRAMLo1i: sTD_loGIC_veCTOr(13 downto 0);

signal CHTOLSRAMIO1i: stD_LogiC_VecTOR(13 downto 0);

signal CHTOLSRAMOL1i: sTD_loGIC_veCTor(13 downto 0);

signal CHTOLSRAMLL1i: Std_LOgic_VectOR(13 downto 0);

signal CHTOLSRAMiL1I: STd_LOGic_VECtoR(13 downto 0);

signal CHTOLSRAMOI1i: sTD_loGIC_veCTOr(13 downto 0);

signal CHTOLSRAMli1I: STD_lOGIc_vECTor(13 downto 0);

signal CHTOLSRAMII1i: std_LogiC_VecTOR(13 downto 0);

signal CHTOLSRAMo01I: stD_logIC_veCTOr(13 downto 0);

signal CHTOLSRAML01i: sTD_loGIC_veCTOr(13 downto 0);

signal CHTOLSRAMI01I: sTD_loGIC_veCTor(13 downto 0);

signal CHTOLSRAMO11i: stD_LogiC_VecTOR(13 downto 0);

signal CHTOLSRAML11i: STD_lOGIc_vECTor(13 downto 0);

signal CHTOLSRAMi11I: STd_lOGIc_vECtor(13 downto 0);

signal CHTOLSRAMOOO0: Std_LOGic_VEctoR(13 downto 0);

signal CHTOLSRAMLoo0: stD_logIC_vecTOr(13 downto 0);

signal CHTOLSRAMIoo0: sTD_logIC;

signal CHTOLSRAMOLo0: Std_LOGic;

signal CHTOLSRAMllo0: Std_LOGic;

signal CHTOLSRAMIlo0: STd_lOGic;

signal CHTOLSRAMOio0: STd_lOGic;

signal CHTOLSRAMLio0: Std_LOgic;

signal CHTOLSRAMIio0: STd_LOGic;

signal CHTOLSRAMo0o0: Std_LOGic;

signal CHTOLSRAML0o0: sTD_loGIC;

signal CHTOLSRAMI0o0: sTD_loGIC;

signal CHTOLSRAMO1o0: STD_loGIC;

signal CHTOLSRAML1o0: STD_lOGIc;

signal CHTOLSRAMI1o0: STd_lOGIc;

signal CHTOLSRAMOol0: Std_LOGic;

signal CHTOLSRAMLOl0: STd_lOGIc;

signal CHTOLSRAMIOl0: STd_lOGIc;

signal CHTOLSRAMoLL0: stD_logIC;

signal CHTOLSRAMLLL0: sTD_logIC;

signal CHTOLSRAMill0: sTD_loGIC_veCTor(7 downto 0);

signal CHTOLSRAMoIL0: sTD_loGIC;

begin
CHTOLSRAMIO1 <= CHTOLSRAMilL0;
CHTOLSRAMo01 <= CHTOLSRAMOil0;
process (CLk,CHTOLSRAMiL1)
begin
if (not CHTOLSRAMil1 = '1') then
CHTOLSRAMl1LL(15 downto 9) <= "0000000";
elsif (clK'evENt and Clk = '1') then
CHTOLSRAMl1LL(15 downto 9) <= CHTOLSRAMLL1(15 downto 9);
end if;
end process;
process (CLk,CHTOLSRAMLO1,CHTOLSRAMIl1,CHTOLSRAMl1LL,CHTOLSRAMLL1,CHTOLSRAMoLIi,CHTOLSRAMllII,CHTOLSRAMilII,CHTOLSRAMOiii,CHTOLSRAMLIIi,CHTOLSRAMiiII,weN,CHTOLSRAMo0II,CHTOLSRAML0ii,CHTOLSRAMIIli,CHTOLSRAMo0LI,CHTOLSRAML0lI,CHTOLSRAMI0li,CHTOLSRAMo1lI,CHTOLSRAML1Li,CHTOLSRAMi1lI,CHTOLSRAMoOIi,CHTOLSRAMLOii,CHTOLSRAMioII,CHTOLSRAMOL1)
variable CHTOLSRAMLil0: std_LogiC_VectOR(2 downto 0);
variable CHTOLSRAMiil0: sTD_logIC_veCTOr(2 downto 0);
variable CHTOLSRAMo0l0: STd_lOGIc_VECtor(2 downto 0);
variable CHTOLSRAMl0L0: stD_logIC_vecTOr(2 downto 0);
variable CHTOLSRAMI0L0: STD_loGIc_vECTor(2 downto 0);
variable CHTOLSRAMO1l0: STD_lOGIc_vECTor(2 downto 0);
variable CHTOLSRAMl1L0: Std_LOgic_VEctOR(2 downto 0);
variable CHTOLSRAMi1L0: Std_LOgic_VectOR(2 downto 0);
variable CHTOLSRAMOOi0: sTD_logIC_veCTOr(2 downto 0);
variable CHTOLSRAMLOi0: stD_LogIC_vecTOR(2 downto 0);
variable CHTOLSRAMIOI0: STd_lOGIc_VECtor(2 downto 0);
variable CHTOLSRAMoli0: STD_lOGIc_vECTor(2 downto 0);
variable CHTOLSRAMllI0: STd_lOGIc_VECtor(2 downto 0);
variable CHTOLSRAMILi0: sTD_loGIC_veCTOr(2 downto 0);
variable CHTOLSRAMoII0: std_LogiC_VectOR(2 downto 0);
variable CHTOLSRAMLIi0: stD_logIC_vecTOr(2 downto 0);
variable CHTOLSRAMiiI0: STd_lOGIc_vECtor(2 downto 0);
variable CHTOLSRAMo0I0: STd_lOGIc_vECtor(2 downto 0);
variable CHTOLSRAMl0i0: STD_lOGIc_vECTor(1 downto 0);
variable CHTOLSRAMi0I0: stD_logIC_vecTOr(1 downto 0);
variable CHTOLSRAMo1I0: Std_LOGic_VEctoR(1 downto 0);
variable CHTOLSRAML1i0: stD_logIC_vecTOr(1 downto 0);
variable CHTOLSRAMI1i0: stD_LogiC_vecTOR(1 downto 0);
variable CHTOLSRAMOO00: std_LogiC_VecTOR(1 downto 0);
variable CHTOLSRAMLO00: stD_logIC_vecTOr(1 downto 0);
variable CHTOLSRAMIo00: sTD_loGIC_veCTOr(1 downto 0);
variable CHTOLSRAMOl00: STD_loGIC_vECTor(1 downto 0);
variable CHTOLSRAMLl00: sTD_logIC_veCTOr(1 downto 0);
variable CHTOLSRAMiL00: Std_LOGic_VEctoR(1 downto 0);
variable CHTOLSRAMoI00: std_LogiC_VecTOR(1 downto 0);
variable CHTOLSRAMli00: Std_LOGic_VEctoR(1 downto 0);
variable CHTOLSRAMII00: std_LogiC_vecTOR(1 downto 0);
variable CHTOLSRAMo000: Std_LOgic_VEctoR(1 downto 0);
variable CHTOLSRAML000: std_LOgiC_VectOR(1 downto 0);
variable CHTOLSRAMi000: STd_lOGIc_vECtor(1 downto 0);
variable CHTOLSRAMO100: stD_LogiC_vecTOR(1 downto 0);
variable CHTOLSRAMl100: sTD_loGIC_veCTor(1 downto 0);
variable CHTOLSRAMI100: stD_logIC_vecTOr(1 downto 0);
variable CHTOLSRAMoO10: sTD_logIC_veCTOr(1 downto 0);
variable CHTOLSRAMlO10: STD_loGIC_vECTor(1 downto 0);
variable CHTOLSRAMio10: STd_lOGIc_VECtor(1 downto 0);
variable CHTOLSRAMol10: STd_lOGIc_vECTor(1 downto 0);
variable CHTOLSRAMLl10: STd_LOGic_VECtoR(1 downto 0);
variable CHTOLSRAMIL10: std_LogiC_VectOR(1 downto 0);
variable CHTOLSRAMoi10: STd_lOGIc_VECtor(1 downto 0);
variable CHTOLSRAMLI10: stD_logIC_vecTOr(1 downto 0);
variable CHTOLSRAMIi10: sTD_loGIC_veCTOr(1 downto 0);
variable CHTOLSRAMO010: Std_LOgic_VectOR(1 downto 0);
variable CHTOLSRAML010: stD_logIC_vecTOr(1 downto 0);
variable CHTOLSRAMi010: Std_LOgic_VEctoR(1 downto 0);
variable CHTOLSRAMO110: sTD_logIC_veCTOr(1 downto 0);
variable CHTOLSRAML110: stD_logIC_vecTOr(1 downto 0);
variable CHTOLSRAMi110: std_LOgiC_VectOR(1 downto 0);
variable CHTOLSRAMooO1: STd_lOGIc_VECtor(1 downto 0);
variable CHTOLSRAMloo1: STd_lOGIc_vECtor(17 downto 0);
variable CHTOLSRAMiOO1: std_LOgiC_VectOR(17 downto 0);
variable CHTOLSRAMOLo1: stD_logIC_vecTOr(17 downto 0);
variable CHTOLSRAMllo1: sTD_loGIC_veCTor(17 downto 0);
variable CHTOLSRAMilO1: STd_lOGic_VECtor(17 downto 0);
variable CHTOLSRAMoIO1: STd_lOGic_VECtor(17 downto 0);
variable CHTOLSRAMliO1: STd_lOGIc_VECtor(17 downto 0);
variable CHTOLSRAMIIO1: std_LogiC_VectOR(17 downto 0);
variable CHTOLSRAMO0o1: sTD_loGIC_veCTor(17 downto 0);
variable CHTOLSRAML0o1: stD_logIC_veCTOr(17 downto 0);
variable CHTOLSRAMi0o1: STd_lOGIc_VECtor(17 downto 0);
variable CHTOLSRAMo1O1: Std_LOGic_VEctoR(17 downto 0);
variable CHTOLSRAML1o1: sTD_loGIC_veCTor(17 downto 0);
variable CHTOLSRAMI1O1: std_LOgiC_VecTOR(17 downto 0);
variable CHTOLSRAMOOl1: stD_logIC_veCTOr(17 downto 0);
variable CHTOLSRAMlOL1: Std_LOGic_VEctoR(17 downto 0);
variable CHTOLSRAMiOL1: Std_LOgic_VEctOR(17 downto 0);
variable CHTOLSRAMoll1: sTD_loGIC_veCTor(17 downto 0);
variable CHTOLSRAMlLL1: Std_LOGic_VEctoR(13 downto 0);
variable CHTOLSRAMiLL1: Std_LOGic_VEctoR(13 downto 0);
variable CHTOLSRAMOIl1: stD_LogiC_vecTOR(13 downto 0);
variable CHTOLSRAMLIl1: stD_LogIC_vecTOr(13 downto 0);
variable CHTOLSRAMiIL1: Std_LOgic_VectOR(13 downto 0);
variable CHTOLSRAMo0L1: Std_LOgic_VEctOR(13 downto 0);
variable CHTOLSRAML0l1: sTD_loGIC_veCTor(13 downto 0);
variable CHTOLSRAMi0L1: STd_lOGic_VECtor(13 downto 0);
variable CHTOLSRAMO1L1: std_LogiC_VecTOR(13 downto 0);
variable CHTOLSRAML1l1: stD_LogIC_vecTOr(13 downto 0);
variable CHTOLSRAMi1L1: STD_lOGIc_vECTor(13 downto 0);
variable CHTOLSRAMoOI1: Std_LOgic_VEctOR(13 downto 0);
variable CHTOLSRAMLOI1: std_LOgiC_VectOR(13 downto 0);
variable CHTOLSRAMiOI1: Std_LOgic_VectOR(13 downto 0);
variable CHTOLSRAMOLi1: sTD_logIC_veCTOr(13 downto 0);
variable CHTOLSRAMllI1: Std_LOgic_VEctOR(13 downto 0);
variable CHTOLSRAMILi1: sTD_loGIC_veCTOr(13 downto 0);
variable CHTOLSRAMOIi1: sTD_loGIC_veCTOr(13 downto 0);
variable CHTOLSRAMLII1: stD_logIC_veCTOr(13 downto 0);
variable CHTOLSRAMiii1: STD_loGIc_vECTor(13 downto 0);
variable CHTOLSRAMO0I1: std_LOgiC_VectOR(13 downto 0);
variable CHTOLSRAML0I1: Std_LOgic_VectOR(13 downto 0);
variable CHTOLSRAMi0I1: std_LogiC_VecTOR(13 downto 0);
variable CHTOLSRAMo1i1: Std_LOgic_VectOR(13 downto 0);
variable CHTOLSRAMl1I1: Std_LOgic_VectOR(13 downto 0);
variable CHTOLSRAMI1i1: stD_logIC_veCTOr(13 downto 0);
variable CHTOLSRAMOO01: stD_LogiC_vecTOR(13 downto 0);
variable CHTOLSRAMlO01: sTD_logIC_veCTOr(13 downto 0);
variable CHTOLSRAMIo01: stD_logIC_veCTOr(13 downto 0);
variable CHTOLSRAMOl01: sTD_loGIC_veCTOr(13 downto 0);
variable CHTOLSRAMLL01: stD_LogIC_vecTOr(13 downto 0);
variable CHTOLSRAMiL01: Std_LOgic_VectOR(13 downto 0);
variable CHTOLSRAMOI01: sTD_loGIC_veCTor(13 downto 0);
variable CHTOLSRAMLI01: stD_LogIC_vecTOR(13 downto 0);
variable CHTOLSRAMII01: std_LogiC_VecTOR(13 downto 0);
variable CHTOLSRAMO001: STd_lOGIc_vECtor(13 downto 0);
variable CHTOLSRAMl001: STd_lOGic_VECtor(7 downto 0);
begin
CHTOLSRAMliL0 := "000";
CHTOLSRAMiil0 := "000";
CHTOLSRAMo0l0 := "000";
CHTOLSRAMl0L0 := "000";
CHTOLSRAMi0L0 := "000";
CHTOLSRAMO1l0 := "000";
CHTOLSRAMl1L0 := "000";
CHTOLSRAMi1l0 := "000";
CHTOLSRAMOOi0 := "000";
CHTOLSRAMloi0 := "000";
CHTOLSRAMIOi0 := "000";
CHTOLSRAMOLi0 := "000";
CHTOLSRAMllI0 := "000";
CHTOLSRAMIli0 := "000";
CHTOLSRAMOIi0 := "000";
CHTOLSRAMlII0 := "000";
CHTOLSRAMiiI0 := "000";
CHTOLSRAMO0I0 := "000";
CHTOLSRAMl0i0 := "00";
CHTOLSRAMi0I0 := "00";
CHTOLSRAMO1i0 := "00";
CHTOLSRAMl1I0 := "00";
CHTOLSRAMi1I0 := "00";
CHTOLSRAMOO00 := "00";
CHTOLSRAMLo00 := "00";
CHTOLSRAMIo00 := "00";
CHTOLSRAMOL00 := "00";
CHTOLSRAMLl00 := "00";
CHTOLSRAMiL00 := "00";
CHTOLSRAMOI00 := "00";
CHTOLSRAMlI00 := "00";
CHTOLSRAMII00 := "00";
CHTOLSRAMO000 := "00";
CHTOLSRAMl000 := "00";
CHTOLSRAMi000 := "00";
CHTOLSRAMO100 := "00";
CHTOLSRAML100 := "00";
CHTOLSRAMI100 := "00";
CHTOLSRAMOO10 := "00";
CHTOLSRAMlO10 := "00";
CHTOLSRAMio10 := "00";
CHTOLSRAMOl10 := "00";
CHTOLSRAMll10 := "00";
CHTOLSRAMIL10 := "00";
CHTOLSRAMoi10 := "00";
CHTOLSRAMLi10 := "00";
CHTOLSRAMII10 := "00";
CHTOLSRAMO010 := "00";
CHTOLSRAML010 := "00";
CHTOLSRAMi010 := "00";
CHTOLSRAMo110 := "00";
CHTOLSRAMl110 := "00";
CHTOLSRAMI110 := "00";
CHTOLSRAMooo1 := "00";
CHTOLSRAMLoo1 := "000000000000000000";
CHTOLSRAMIoo1 := "000000000000000000";
CHTOLSRAMOLO1 := "000000000000000000";
CHTOLSRAMllO1 := "000000000000000000";
CHTOLSRAMiLO1 := "000000000000000000";
CHTOLSRAMoiO1 := "000000000000000000";
CHTOLSRAMLIo1 := "000000000000000000";
CHTOLSRAMiIO1 := "000000000000000000";
CHTOLSRAMO0o1 := "000000000000000000";
CHTOLSRAMl0O1 := "000000000000000000";
CHTOLSRAMI0o1 := "000000000000000000";
CHTOLSRAMo1O1 := "000000000000000000";
CHTOLSRAML1o1 := "000000000000000000";
CHTOLSRAMi1O1 := "000000000000000000";
CHTOLSRAMOOL1 := "000000000000000000";
CHTOLSRAMlol1 := "000000000000000000";
CHTOLSRAMiOL1 := "000000000000000000";
CHTOLSRAMolL1 := "000000000000000000";
CHTOLSRAMlll1 := "00000000000000";
CHTOLSRAMilL1 := "00000000000000";
CHTOLSRAMOIL1 := "00000000000000";
CHTOLSRAMLIl1 := "00000000000000";
CHTOLSRAMiil1 := "00000000000000";
CHTOLSRAMo0L1 := "00000000000000";
CHTOLSRAMl0L1 := "00000000000000";
CHTOLSRAMi0L1 := "00000000000000";
CHTOLSRAMO1l1 := "00000000000000";
CHTOLSRAMl1L1 := "00000000000000";
CHTOLSRAMI1L1 := "00000000000000";
CHTOLSRAMOoi1 := "00000000000000";
CHTOLSRAMloI1 := "00000000000000";
CHTOLSRAMiOI1 := "00000000000000";
CHTOLSRAMOLI1 := "00000000000000";
CHTOLSRAMLli1 := "00000000000000";
CHTOLSRAMilI1 := "00000000000000";
CHTOLSRAMOII1 := "00000000000000";
CHTOLSRAMLIi1 := "00000000000000";
CHTOLSRAMiii1 := "00000000000000";
CHTOLSRAMo0I1 := "00000000000000";
CHTOLSRAMl0I1 := "00000000000000";
CHTOLSRAMi0I1 := "00000000000000";
CHTOLSRAMO1i1 := "00000000000000";
CHTOLSRAML1i1 := "00000000000000";
CHTOLSRAMi1i1 := "00000000000000";
CHTOLSRAMoo01 := "00000000000000";
CHTOLSRAMlO01 := "00000000000000";
CHTOLSRAMIO01 := "00000000000000";
CHTOLSRAMOL01 := "00000000000000";
CHTOLSRAMLL01 := "00000000000000";
CHTOLSRAMIL01 := "00000000000000";
CHTOLSRAMoi01 := "00000000000000";
CHTOLSRAMlI01 := "00000000000000";
CHTOLSRAMII01 := "00000000000000";
CHTOLSRAMo001 := "00000000000000";
CHTOLSRAML001 := ( others => '0');
case CHTOLSRAMIi1 is
when 512
| 1024
| 1536
| 2048 =>
CHTOLSRAMiIL0 := "011";
CHTOLSRAMILL1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMiiI1 := CHTOLSRAMll1(10 downto 0)&"000";
CHTOLSRAMIoo1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
CHTOLSRAMi0i0 := '0'&Wen;
CHTOLSRAMl001 := CHTOLSRAMO0li(7 downto 0);
when 2560
| 3072
| 3584
| 4096 =>
CHTOLSRAMiiL0 := "011";
CHTOLSRAMLIl0 := "011";
CHTOLSRAMILl1 := CHTOLSRAMOl1(10 downto 0)&"000";
CHTOLSRAMLLL1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMIIi1 := CHTOLSRAMLL1(10 downto 0)&"000";
CHTOLSRAMlii1 := CHTOLSRAMll1(10 downto 0)&"000";
CHTOLSRAMIoo1 := "0000000000"&CHTOLSRAMlO1(7 downto 0);
CHTOLSRAMlOO1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
case CHTOLSRAMoL1(13 downto 10) is
when "0000"
| "0001" =>
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&Wen;
when "0010"
| "0011" =>
CHTOLSRAMi0I0 := '0'&wEN;
CHTOLSRAML0i0 := '0'&'0';
when others =>
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
end case;
case CHTOLSRAMl1LL(13 downto 10) is
when "0000"
| "0001" =>
CHTOLSRAML001 := CHTOLSRAMiILI(7 downto 0);
when "0010"
| "0011" =>
CHTOLSRAML001 := CHTOLSRAMO0li(7 downto 0);
when others =>
CHTOLSRAMl001 := ( others => '0');
end case;
when 4608
| 5120
| 5632
| 6144 =>
CHTOLSRAMO0l0 := "011";
CHTOLSRAMIil0 := "011";
CHTOLSRAMlIL0 := "011";
CHTOLSRAMoil1 := CHTOLSRAMoL1(10 downto 0)&"000";
CHTOLSRAMIll1 := CHTOLSRAMOl1(10 downto 0)&"000";
CHTOLSRAMlll1 := CHTOLSRAMol1(10 downto 0)&"000";
CHTOLSRAMo0I1 := CHTOLSRAMLL1(10 downto 0)&"000";
CHTOLSRAMiii1 := CHTOLSRAMll1(10 downto 0)&"000";
CHTOLSRAMLIi1 := CHTOLSRAMLL1(10 downto 0)&"000";
CHTOLSRAMolO1 := "0000000000"&CHTOLSRAMLo1(7 downto 0);
CHTOLSRAMioO1 := "0000000000"&CHTOLSRAMLo1(7 downto 0);
CHTOLSRAMloO1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
case CHTOLSRAMol1(13 downto 10) is
when "0000"
| "0001" =>
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAML0i0 := '0'&Wen;
when "0010"
| "0011" =>
CHTOLSRAMO1I0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&Wen;
CHTOLSRAML0I0 := '0'&'0';
when "0100"
| "0101" =>
CHTOLSRAMo1I0 := '0'&WEn;
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAML0I0 := '0'&'0';
when others =>
CHTOLSRAMo1i0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAML0I0 := '0'&'0';
end case;
case CHTOLSRAMl1LL(13 downto 10) is
when "0000"
| "0001" =>
CHTOLSRAMl001 := CHTOLSRAMiilI(7 downto 0);
when "0010"
| "0011" =>
CHTOLSRAML001 := CHTOLSRAMo0lI(7 downto 0);
when "0100"
| "0101" =>
CHTOLSRAMl001 := CHTOLSRAML0li(7 downto 0);
when others =>
CHTOLSRAMl001 := ( others => '0');
end case;
when 6656
| 7168
| 7680
| 8192 =>
CHTOLSRAML0l0 := "011";
CHTOLSRAMo0L0 := "011";
CHTOLSRAMiiL0 := "011";
CHTOLSRAMLIl0 := "011";
CHTOLSRAMlIL1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMoIL1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMilL1 := CHTOLSRAMol1(10 downto 0)&"000";
CHTOLSRAMlLL1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAML0i1 := CHTOLSRAMLL1(10 downto 0)&"000";
CHTOLSRAMo0I1 := CHTOLSRAMlL1(10 downto 0)&"000";
CHTOLSRAMIIi1 := CHTOLSRAMLL1(10 downto 0)&"000";
CHTOLSRAMLII1 := CHTOLSRAMll1(10 downto 0)&"000";
CHTOLSRAMLLO1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
CHTOLSRAMoLO1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
CHTOLSRAMIoo1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
CHTOLSRAMLoo1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
case CHTOLSRAMoL1(13 downto 10) is
when "0110"
| "0111" =>
CHTOLSRAMl1I0 := '0'&weN;
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMi0i0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
when "0100"
| "0101" =>
CHTOLSRAML1I0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&WEN;
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAML0I0 := '0'&'0';
when "0010"
| "0011" =>
CHTOLSRAMl1i0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&Wen;
CHTOLSRAMl0I0 := '0'&'0';
when "0000"
| "0001" =>
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAML0i0 := '0'&weN;
when others =>
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMI0I0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
end case;
case CHTOLSRAMl1LL(13 downto 10) is
when "0110"
| "0111" =>
CHTOLSRAMl001 := CHTOLSRAMI0li(7 downto 0);
when "0100"
| "0101" =>
CHTOLSRAML001 := CHTOLSRAML0li(7 downto 0);
when "0010"
| "0011" =>
CHTOLSRAML001 := CHTOLSRAMO0li(7 downto 0);
when "0000"
| "0001" =>
CHTOLSRAMl001 := CHTOLSRAMIIli(7 downto 0);
when others =>
CHTOLSRAML001 := ( others => '0');
end case;
when 8704
| 9216
| 9728
| 10240 =>
CHTOLSRAMi0l0 := "011";
CHTOLSRAMl0L0 := "011";
CHTOLSRAMO0l0 := "011";
CHTOLSRAMiiL0 := "011";
CHTOLSRAMlIL0 := "011";
CHTOLSRAMIIL1 := CHTOLSRAMOl1(10 downto 0)&"000";
CHTOLSRAMlil1 := CHTOLSRAMoL1(10 downto 0)&"000";
CHTOLSRAMOIl1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMiLL1 := CHTOLSRAMoL1(10 downto 0)&"000";
CHTOLSRAMlll1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMI0I1 := CHTOLSRAMLL1(10 downto 0)&"000";
CHTOLSRAMl0i1 := CHTOLSRAMll1(10 downto 0)&"000";
CHTOLSRAMo0I1 := CHTOLSRAMll1(10 downto 0)&"000";
CHTOLSRAMIIi1 := CHTOLSRAMLL1(10 downto 0)&"000";
CHTOLSRAMlII1 := CHTOLSRAMLL1(10 downto 0)&"000";
CHTOLSRAMiLO1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
CHTOLSRAMLlo1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
CHTOLSRAMOLo1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
CHTOLSRAMiOO1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
CHTOLSRAMloo1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
case CHTOLSRAMOL1(13 downto 10) is
when "1000"
| "1001" =>
CHTOLSRAMI1i0 := '0'&Wen;
CHTOLSRAML1I0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMi0i0 := '0'&'0';
CHTOLSRAMl0i0 := '0'&'0';
when "0110"
| "0111" =>
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAML1i0 := '0'&wEN;
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "0100"
| "0101" =>
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&wen;
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "0010"
| "0011" =>
CHTOLSRAMi1i0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&wen;
CHTOLSRAMl0I0 := '0'&'0';
when "0000"
| "0001" =>
CHTOLSRAMI1I0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMO1I0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAML0i0 := '0'&WEn;
when others =>
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
end case;
case CHTOLSRAMl1LL(13 downto 10) is
when "1000"
| "1001" =>
CHTOLSRAML001 := CHTOLSRAMo1LI(7 downto 0);
when "0110"
| "0111" =>
CHTOLSRAMl001 := CHTOLSRAMi0LI(7 downto 0);
when "0100"
| "0101" =>
CHTOLSRAMl001 := CHTOLSRAMl0LI(7 downto 0);
when "0010"
| "0011" =>
CHTOLSRAMl001 := CHTOLSRAMO0li(7 downto 0);
when "0000"
| "0001" =>
CHTOLSRAMl001 := CHTOLSRAMiiLI(7 downto 0);
when others =>
CHTOLSRAML001 := ( others => '0');
end case;
when 10752
| 11264
| 11776
| 12288 =>
CHTOLSRAMo1L0 := "011";
CHTOLSRAMI0L0 := "011";
CHTOLSRAML0L0 := "011";
CHTOLSRAMO0l0 := "011";
CHTOLSRAMiiL0 := "011";
CHTOLSRAMLIL0 := "011";
CHTOLSRAMO0L1 := CHTOLSRAMol1(10 downto 0)&"000";
CHTOLSRAMIIL1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMliL1 := CHTOLSRAMol1(10 downto 0)&"000";
CHTOLSRAMoiL1 := CHTOLSRAMOl1(10 downto 0)&"000";
CHTOLSRAMILL1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMLLl1 := CHTOLSRAMOl1(10 downto 0)&"000";
CHTOLSRAMo1i1 := CHTOLSRAMLl1(10 downto 0)&"000";
CHTOLSRAMi0I1 := CHTOLSRAMLL1(10 downto 0)&"000";
CHTOLSRAMl0I1 := CHTOLSRAMLL1(10 downto 0)&"000";
CHTOLSRAMO0i1 := CHTOLSRAMlL1(10 downto 0)&"000";
CHTOLSRAMiiI1 := CHTOLSRAMll1(10 downto 0)&"000";
CHTOLSRAMLii1 := CHTOLSRAMLl1(10 downto 0)&"000";
CHTOLSRAMoiO1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
CHTOLSRAMILo1 := "0000000000"&CHTOLSRAMlO1(7 downto 0);
CHTOLSRAMLLO1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
CHTOLSRAMolo1 := "0000000000"&CHTOLSRAMlO1(7 downto 0);
CHTOLSRAMIOo1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
CHTOLSRAMloO1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
case CHTOLSRAMOL1(13 downto 10) is
when "1010"
| "1011" =>
CHTOLSRAMOo00 := '0'&Wen;
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "1000"
| "1001" =>
CHTOLSRAMoo00 := '0'&'0';
CHTOLSRAMi1i0 := '0'&Wen;
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMI0I0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "0110"
| "0111" =>
CHTOLSRAMoO00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&wEN;
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
when "0100"
| "0101" =>
CHTOLSRAMOO00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&WEN;
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "0010"
| "0011" =>
CHTOLSRAMOO00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMI0I0 := '0'&WEn;
CHTOLSRAMl0I0 := '0'&'0';
when "0000"
| "0001" =>
CHTOLSRAMoO00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMo1i0 := '0'&'0';
CHTOLSRAMi0i0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&WEN;
when others =>
CHTOLSRAMoO00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAML0I0 := '0'&'0';
end case;
case CHTOLSRAML1ll(13 downto 10) is
when "1010"
| "1011" =>
CHTOLSRAMl001 := CHTOLSRAMl1lI(7 downto 0);
when "1000"
| "1001" =>
CHTOLSRAMl001 := CHTOLSRAMo1LI(7 downto 0);
when "0110"
| "0111" =>
CHTOLSRAML001 := CHTOLSRAMI0Li(7 downto 0);
when "0100"
| "0101" =>
CHTOLSRAMl001 := CHTOLSRAML0li(7 downto 0);
when "0010"
| "0011" =>
CHTOLSRAML001 := CHTOLSRAMO0lI(7 downto 0);
when "0000"
| "0001" =>
CHTOLSRAML001 := CHTOLSRAMIIli(7 downto 0);
when others =>
CHTOLSRAML001 := ( others => '0');
end case;
when 12800
| 13312
| 13824
| 14336 =>
CHTOLSRAMl1L0 := "011";
CHTOLSRAMo1l0 := "011";
CHTOLSRAMi0l0 := "011";
CHTOLSRAMl0L0 := "011";
CHTOLSRAMo0L0 := "011";
CHTOLSRAMiIL0 := "011";
CHTOLSRAMlIL0 := "011";
CHTOLSRAMl0L1 := CHTOLSRAMol1(10 downto 0)&"000";
CHTOLSRAMo0l1 := CHTOLSRAMol1(10 downto 0)&"000";
CHTOLSRAMiiL1 := CHTOLSRAMol1(10 downto 0)&"000";
CHTOLSRAMlIL1 := CHTOLSRAMol1(10 downto 0)&"000";
CHTOLSRAMoIL1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMILl1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMLll1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMl1i1 := CHTOLSRAMlL1(10 downto 0)&"000";
CHTOLSRAMO1i1 := CHTOLSRAMLl1(10 downto 0)&"000";
CHTOLSRAMi0I1 := CHTOLSRAMlL1(10 downto 0)&"000";
CHTOLSRAMl0I1 := CHTOLSRAMLL1(10 downto 0)&"000";
CHTOLSRAMO0i1 := CHTOLSRAMlL1(10 downto 0)&"000";
CHTOLSRAMiiI1 := CHTOLSRAMlL1(10 downto 0)&"000";
CHTOLSRAMLII1 := CHTOLSRAMlL1(10 downto 0)&"000";
CHTOLSRAMLIo1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
CHTOLSRAMoio1 := "0000000000"&CHTOLSRAMlO1(7 downto 0);
CHTOLSRAMiLO1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
CHTOLSRAMllO1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
CHTOLSRAMOLo1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
CHTOLSRAMioO1 := "0000000000"&CHTOLSRAMLo1(7 downto 0);
CHTOLSRAMLOo1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
case CHTOLSRAMol1(13 downto 10) is
when "1100"
| "1101" =>
CHTOLSRAMLo00 := '0'&wEN;
CHTOLSRAMoo00 := '0'&'0';
CHTOLSRAMi1i0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMI0I0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "1010"
| "1011" =>
CHTOLSRAMLO00 := '0'&'0';
CHTOLSRAMOO00 := '0'&weN;
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAMl1i0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "1000"
| "1001" =>
CHTOLSRAMLO00 := '0'&'0';
CHTOLSRAMoO00 := '0'&'0';
CHTOLSRAMi1i0 := '0'&weN;
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMi0i0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
when "0110"
| "0111" =>
CHTOLSRAMLO00 := '0'&'0';
CHTOLSRAMoo00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&weN;
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
when "0100"
| "0101" =>
CHTOLSRAMLo00 := '0'&'0';
CHTOLSRAMOO00 := '0'&'0';
CHTOLSRAMI1I0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&wen;
CHTOLSRAMI0I0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "0010"
| "0011" =>
CHTOLSRAMlo00 := '0'&'0';
CHTOLSRAMoO00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&WEn;
CHTOLSRAMl0I0 := '0'&'0';
when "0000"
| "0001" =>
CHTOLSRAMLo00 := '0'&'0';
CHTOLSRAMOO00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&weN;
when others =>
CHTOLSRAMlo00 := '0'&'0';
CHTOLSRAMOo00 := '0'&'0';
CHTOLSRAMi1i0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMI0I0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
end case;
case CHTOLSRAML1lL(13 downto 10) is
when "1100"
| "1101" =>
CHTOLSRAMl001 := CHTOLSRAMI1li(7 downto 0);
when "1010"
| "1011" =>
CHTOLSRAMl001 := CHTOLSRAML1li(7 downto 0);
when "1000"
| "1001" =>
CHTOLSRAMl001 := CHTOLSRAMo1LI(7 downto 0);
when "0110"
| "0111" =>
CHTOLSRAMl001 := CHTOLSRAMi0LI(7 downto 0);
when "0100"
| "0101" =>
CHTOLSRAML001 := CHTOLSRAML0Li(7 downto 0);
when "0010"
| "0011" =>
CHTOLSRAMl001 := CHTOLSRAMO0li(7 downto 0);
when "0000"
| "0001" =>
CHTOLSRAMl001 := CHTOLSRAMiiLI(7 downto 0);
when others =>
CHTOLSRAMl001 := ( others => '0');
end case;
when 14848
| 15360
| 15872
| 16384 =>
CHTOLSRAMi1L0 := "011";
CHTOLSRAMl1L0 := "011";
CHTOLSRAMO1l0 := "011";
CHTOLSRAMi0L0 := "011";
CHTOLSRAMl0L0 := "011";
CHTOLSRAMO0l0 := "011";
CHTOLSRAMIIl0 := "011";
CHTOLSRAMLIl0 := "011";
CHTOLSRAMi0l1 := CHTOLSRAMoL1(10 downto 0)&"000";
CHTOLSRAMl0L1 := CHTOLSRAMOl1(10 downto 0)&"000";
CHTOLSRAMO0l1 := CHTOLSRAMol1(10 downto 0)&"000";
CHTOLSRAMIil1 := CHTOLSRAMoL1(10 downto 0)&"000";
CHTOLSRAMLIL1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMoiL1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMILl1 := CHTOLSRAMol1(10 downto 0)&"000";
CHTOLSRAMLll1 := CHTOLSRAMOl1(10 downto 0)&"000";
CHTOLSRAMi1I1 := CHTOLSRAMLL1(10 downto 0)&"000";
CHTOLSRAML1i1 := CHTOLSRAMll1(10 downto 0)&"000";
CHTOLSRAMO1i1 := CHTOLSRAMll1(10 downto 0)&"000";
CHTOLSRAMI0i1 := CHTOLSRAMll1(10 downto 0)&"000";
CHTOLSRAMl0I1 := CHTOLSRAMll1(10 downto 0)&"000";
CHTOLSRAMO0I1 := CHTOLSRAMLL1(10 downto 0)&"000";
CHTOLSRAMiII1 := CHTOLSRAMLL1(10 downto 0)&"000";
CHTOLSRAMliI1 := CHTOLSRAMll1(10 downto 0)&"000";
CHTOLSRAMIIo1 := "0000000000"&CHTOLSRAMlO1(7 downto 0);
CHTOLSRAMlio1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
CHTOLSRAMOio1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
CHTOLSRAMILo1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
CHTOLSRAMllo1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
CHTOLSRAMOLO1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
CHTOLSRAMiOO1 := "0000000000"&CHTOLSRAMLo1(7 downto 0);
CHTOLSRAMloo1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
case CHTOLSRAMoL1(13 downto 10) is
when "1110"
| "1111" =>
CHTOLSRAMIO00 := '0'&wEN;
CHTOLSRAMlO00 := '0'&'0';
CHTOLSRAMOo00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
when "1100"
| "1101" =>
CHTOLSRAMiO00 := '0'&'0';
CHTOLSRAMLO00 := '0'&wEN;
CHTOLSRAMoo00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMi0i0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "1010"
| "1011" =>
CHTOLSRAMio00 := '0'&'0';
CHTOLSRAMLO00 := '0'&'0';
CHTOLSRAMOO00 := '0'&wEN;
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMo1i0 := '0'&'0';
CHTOLSRAMi0i0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "1000"
| "1001" =>
CHTOLSRAMIO00 := '0'&'0';
CHTOLSRAMlo00 := '0'&'0';
CHTOLSRAMOo00 := '0'&'0';
CHTOLSRAMi1i0 := '0'&wen;
CHTOLSRAML1I0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMI0I0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
when "0110"
| "0111" =>
CHTOLSRAMIO00 := '0'&'0';
CHTOLSRAMLO00 := '0'&'0';
CHTOLSRAMoo00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&weN;
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "0100"
| "0101" =>
CHTOLSRAMiO00 := '0'&'0';
CHTOLSRAMLo00 := '0'&'0';
CHTOLSRAMOO00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMO1I0 := '0'&WEn;
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "0010"
| "0011" =>
CHTOLSRAMiO00 := '0'&'0';
CHTOLSRAMLO00 := '0'&'0';
CHTOLSRAMOo00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAMl1i0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&Wen;
CHTOLSRAMl0I0 := '0'&'0';
when "0000"
| "0001" =>
CHTOLSRAMio00 := '0'&'0';
CHTOLSRAMlo00 := '0'&'0';
CHTOLSRAMOo00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMO1I0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAML0i0 := '0'&wen;
when others =>
CHTOLSRAMIo00 := '0'&'0';
CHTOLSRAMLO00 := '0'&'0';
CHTOLSRAMOO00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAML0I0 := '0'&'0';
end case;
case CHTOLSRAML1Ll(13 downto 10) is
when "1110"
| "1111" =>
CHTOLSRAMl001 := CHTOLSRAMOoiI(7 downto 0);
when "1100"
| "1101" =>
CHTOLSRAML001 := CHTOLSRAMi1LI(7 downto 0);
when "1010"
| "1011" =>
CHTOLSRAML001 := CHTOLSRAMl1LI(7 downto 0);
when "1000"
| "1001" =>
CHTOLSRAML001 := CHTOLSRAMO1li(7 downto 0);
when "0110"
| "0111" =>
CHTOLSRAMl001 := CHTOLSRAMi0lI(7 downto 0);
when "0100"
| "0101" =>
CHTOLSRAMl001 := CHTOLSRAML0li(7 downto 0);
when "0010"
| "0011" =>
CHTOLSRAML001 := CHTOLSRAMo0LI(7 downto 0);
when "0000"
| "0001" =>
CHTOLSRAMl001 := CHTOLSRAMIIli(7 downto 0);
when others =>
CHTOLSRAMl001 := ( others => '0');
end case;
when 16896
| 17408
| 17920
| 18432 =>
CHTOLSRAMOOI0 := "011";
CHTOLSRAMi1L0 := "000";
CHTOLSRAML1l0 := "000";
CHTOLSRAMo1L0 := "000";
CHTOLSRAMi0L0 := "000";
CHTOLSRAML0L0 := "000";
CHTOLSRAMO0l0 := "000";
CHTOLSRAMIil0 := "000";
CHTOLSRAMliL0 := "000";
CHTOLSRAMO1l1 := CHTOLSRAMOl1(10 downto 0)&"000";
CHTOLSRAMi0L1 := CHTOLSRAMoL1(13 downto 0);
CHTOLSRAMl0L1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMo0L1 := CHTOLSRAMOl1(13 downto 0);
CHTOLSRAMiIL1 := CHTOLSRAMoL1(13 downto 0);
CHTOLSRAMLIl1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMoIL1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMILl1 := CHTOLSRAMOl1(13 downto 0);
CHTOLSRAMLLL1 := CHTOLSRAMoL1(13 downto 0);
CHTOLSRAMoo01 := CHTOLSRAMlL1(10 downto 0)&"000";
CHTOLSRAMI1i1 := CHTOLSRAMlL1(13 downto 0);
CHTOLSRAMl1i1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMO1I1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMI0i1 := CHTOLSRAMlL1(13 downto 0);
CHTOLSRAML0i1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMO0i1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMIIi1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMLIi1 := CHTOLSRAMlL1(13 downto 0);
CHTOLSRAMo0O1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
CHTOLSRAMiiO1 := "00000000000000000"&CHTOLSRAMlo1(7);
CHTOLSRAMLio1 := "00000000000000000"&CHTOLSRAMlO1(6);
CHTOLSRAMoiO1 := "00000000000000000"&CHTOLSRAMlO1(5);
CHTOLSRAMIlo1 := "00000000000000000"&CHTOLSRAMLO1(4);
CHTOLSRAMllO1 := "00000000000000000"&CHTOLSRAMlO1(3);
CHTOLSRAMolO1 := "00000000000000000"&CHTOLSRAMlO1(2);
CHTOLSRAMIOO1 := "00000000000000000"&CHTOLSRAMlo1(1);
CHTOLSRAMlOO1 := "00000000000000000"&CHTOLSRAMLO1(0);
case CHTOLSRAMOL1(14 downto 10) is
when "10000"
| "10001" =>
CHTOLSRAMoL00 := '0'&wen;
CHTOLSRAMIO00 := '0'&'0';
CHTOLSRAMlO00 := '0'&'0';
CHTOLSRAMOo00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "00000"
| "00001"
| "00010"
| "00011"
| "00100"
| "00101"
| "00110"
| "00111"
| "01000"
| "01001"
| "01010"
| "01011"
| "01100"
| "01101"
| "01110"
| "01111" =>
CHTOLSRAMoL00 := '0'&'0';
CHTOLSRAMiO00 := '0'&WEn;
CHTOLSRAMLo00 := '0'&Wen;
CHTOLSRAMOO00 := '0'&weN;
CHTOLSRAMI1i0 := '0'&wen;
CHTOLSRAML1I0 := '0'&WEN;
CHTOLSRAMO1i0 := '0'&wen;
CHTOLSRAMI0I0 := '0'&weN;
CHTOLSRAML0i0 := '0'&wen;
when others =>
CHTOLSRAMOL00 := '0'&'0';
CHTOLSRAMio00 := '0'&'0';
CHTOLSRAMlo00 := '0'&'0';
CHTOLSRAMoO00 := '0'&'0';
CHTOLSRAMi1i0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
end case;
case CHTOLSRAML1ll(14 downto 10) is
when "10000"
| "10001" =>
CHTOLSRAMl001 := CHTOLSRAMLOIi(7 downto 0);
when "00000"
| "00001"
| "00010"
| "00011"
| "00100"
| "00101"
| "00110"
| "00111"
| "01000"
| "01001"
| "01010"
| "01011"
| "01100"
| "01101"
| "01110"
| "01111" =>
CHTOLSRAML001 := CHTOLSRAMoOII(0)&CHTOLSRAMi1lI(0)&CHTOLSRAML1li(0)&CHTOLSRAMO1li(0)&CHTOLSRAMi0LI(0)&CHTOLSRAMl0LI(0)&CHTOLSRAMO0lI(0)&CHTOLSRAMiilI(0);
when others =>
CHTOLSRAMl001 := ( others => '0');
end case;
when 18944
| 19456
| 19968
| 20480 =>
CHTOLSRAMloI0 := "011";
CHTOLSRAMoOI0 := "011";
CHTOLSRAMi1L0 := "000";
CHTOLSRAMl1L0 := "000";
CHTOLSRAMO1l0 := "000";
CHTOLSRAMi0l0 := "000";
CHTOLSRAMl0l0 := "000";
CHTOLSRAMo0l0 := "000";
CHTOLSRAMiiL0 := "000";
CHTOLSRAMliL0 := "000";
CHTOLSRAMl1l1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMo1L1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMi0l1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMl0l1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMo0L1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMIIL1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMlil1 := CHTOLSRAMoL1(13 downto 0);
CHTOLSRAMOIl1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMiLL1 := CHTOLSRAMoL1(13 downto 0);
CHTOLSRAMLLl1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMLo01 := CHTOLSRAMll1(10 downto 0)&"000";
CHTOLSRAMoO01 := CHTOLSRAMLL1(10 downto 0)&"000";
CHTOLSRAMI1i1 := CHTOLSRAMLl1(13 downto 0);
CHTOLSRAMl1I1 := CHTOLSRAMlL1(13 downto 0);
CHTOLSRAMO1i1 := CHTOLSRAMlL1(13 downto 0);
CHTOLSRAMI0i1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMl0I1 := CHTOLSRAMll1(13 downto 0);
CHTOLSRAMo0I1 := CHTOLSRAMll1(13 downto 0);
CHTOLSRAMiII1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMLii1 := CHTOLSRAMll1(13 downto 0);
CHTOLSRAML0o1 := "0000000000"&CHTOLSRAMLo1(7 downto 0);
CHTOLSRAMo0O1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
CHTOLSRAMIIo1 := "00000000000000000"&CHTOLSRAMlo1(7);
CHTOLSRAMLIo1 := "00000000000000000"&CHTOLSRAMlo1(6);
CHTOLSRAMOIo1 := "00000000000000000"&CHTOLSRAMLO1(5);
CHTOLSRAMILo1 := "00000000000000000"&CHTOLSRAMLo1(4);
CHTOLSRAMlLO1 := "00000000000000000"&CHTOLSRAMLO1(3);
CHTOLSRAMOLo1 := "00000000000000000"&CHTOLSRAMlo1(2);
CHTOLSRAMioO1 := "00000000000000000"&CHTOLSRAMlO1(1);
CHTOLSRAMlOO1 := "00000000000000000"&CHTOLSRAMlO1(0);
case CHTOLSRAMOl1(14 downto 10) is
when "10010"
| "10011" =>
CHTOLSRAMLL00 := '0'&WEn;
CHTOLSRAMOL00 := '0'&'0';
CHTOLSRAMIO00 := '0'&'0';
CHTOLSRAMlO00 := '0'&'0';
CHTOLSRAMoo00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAML0I0 := '0'&'0';
when "10000"
| "10001" =>
CHTOLSRAMLL00 := '0'&'0';
CHTOLSRAMoL00 := '0'&wen;
CHTOLSRAMIO00 := '0'&'0';
CHTOLSRAMLO00 := '0'&'0';
CHTOLSRAMOO00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "00000"
| "00001"
| "00010"
| "00011"
| "00100"
| "00101"
| "00110"
| "00111"
| "01000"
| "01001"
| "01010"
| "01011"
| "01100"
| "01101"
| "01110"
| "01111" =>
CHTOLSRAMLL00 := '0'&'0';
CHTOLSRAMOL00 := '0'&'0';
CHTOLSRAMiO00 := '0'&wen;
CHTOLSRAMLO00 := '0'&wEN;
CHTOLSRAMOo00 := '0'&wEN;
CHTOLSRAMI1i0 := '0'&wEN;
CHTOLSRAMl1I0 := '0'&WEN;
CHTOLSRAMO1i0 := '0'&Wen;
CHTOLSRAMi0I0 := '0'&wen;
CHTOLSRAML0I0 := '0'&WEn;
when others =>
CHTOLSRAMlL00 := '0'&'0';
CHTOLSRAMOL00 := '0'&'0';
CHTOLSRAMIO00 := '0'&'0';
CHTOLSRAMLo00 := '0'&'0';
CHTOLSRAMOO00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAMl0i0 := '0'&'0';
end case;
case CHTOLSRAMl1LL(14 downto 10) is
when "10010"
| "10011" =>
CHTOLSRAML001 := CHTOLSRAMioiI(7 downto 0);
when "10000"
| "10001" =>
CHTOLSRAMl001 := CHTOLSRAMlOIi(7 downto 0);
when "00000"
| "00001"
| "00010"
| "00011"
| "00100"
| "00101"
| "00110"
| "00111"
| "01000"
| "01001"
| "01010"
| "01011"
| "01100"
| "01101"
| "01110"
| "01111" =>
CHTOLSRAML001 := CHTOLSRAMooiI(0)&CHTOLSRAMi1LI(0)&CHTOLSRAMl1LI(0)&CHTOLSRAMO1li(0)&CHTOLSRAMi0LI(0)&CHTOLSRAML0li(0)&CHTOLSRAMo0LI(0)&CHTOLSRAMiILI(0);
when others =>
CHTOLSRAMl001 := ( others => '0');
end case;
when 20992
| 21504
| 22016
| 22528 =>
CHTOLSRAMIOI0 := "011";
CHTOLSRAMLoi0 := "011";
CHTOLSRAMOOI0 := "011";
CHTOLSRAMI1l0 := "000";
CHTOLSRAML1l0 := "000";
CHTOLSRAMO1l0 := "000";
CHTOLSRAMI0l0 := "000";
CHTOLSRAML0l0 := "000";
CHTOLSRAMO0l0 := "000";
CHTOLSRAMIil0 := "000";
CHTOLSRAMLil0 := "000";
CHTOLSRAMi1L1 := CHTOLSRAMOl1(10 downto 0)&"000";
CHTOLSRAML1L1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMO1l1 := CHTOLSRAMOl1(10 downto 0)&"000";
CHTOLSRAMI0l1 := CHTOLSRAMoL1(13 downto 0);
CHTOLSRAMl0L1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMo0l1 := CHTOLSRAMOl1(13 downto 0);
CHTOLSRAMiIL1 := CHTOLSRAMoL1(13 downto 0);
CHTOLSRAMLil1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMOIL1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMILl1 := CHTOLSRAMoL1(13 downto 0);
CHTOLSRAMLll1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMIo01 := CHTOLSRAMLl1(10 downto 0)&"000";
CHTOLSRAMlO01 := CHTOLSRAMlL1(10 downto 0)&"000";
CHTOLSRAMoo01 := CHTOLSRAMlL1(10 downto 0)&"000";
CHTOLSRAMi1I1 := CHTOLSRAMll1(13 downto 0);
CHTOLSRAMl1I1 := CHTOLSRAMlL1(13 downto 0);
CHTOLSRAMO1i1 := CHTOLSRAMLl1(13 downto 0);
CHTOLSRAMi0i1 := CHTOLSRAMLl1(13 downto 0);
CHTOLSRAMl0I1 := CHTOLSRAMll1(13 downto 0);
CHTOLSRAMO0i1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMiiI1 := CHTOLSRAMlL1(13 downto 0);
CHTOLSRAMLIi1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMi0o1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
CHTOLSRAML0o1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
CHTOLSRAMO0o1 := "0000000000"&CHTOLSRAMLo1(7 downto 0);
CHTOLSRAMIio1 := "00000000000000000"&CHTOLSRAMLO1(7);
CHTOLSRAMlIO1 := "00000000000000000"&CHTOLSRAMlO1(6);
CHTOLSRAMoio1 := "00000000000000000"&CHTOLSRAMlo1(5);
CHTOLSRAMILo1 := "00000000000000000"&CHTOLSRAMlO1(4);
CHTOLSRAMLLo1 := "00000000000000000"&CHTOLSRAMlo1(3);
CHTOLSRAMolO1 := "00000000000000000"&CHTOLSRAMLO1(2);
CHTOLSRAMioO1 := "00000000000000000"&CHTOLSRAMlo1(1);
CHTOLSRAMlOO1 := "00000000000000000"&CHTOLSRAMlO1(0);
case CHTOLSRAMOl1(14 downto 10) is
when "10100"
| "10101" =>
CHTOLSRAMil00 := '0'&Wen;
CHTOLSRAMLL00 := '0'&'0';
CHTOLSRAMOl00 := '0'&'0';
CHTOLSRAMiO00 := '0'&'0';
CHTOLSRAMlo00 := '0'&'0';
CHTOLSRAMOO00 := '0'&'0';
CHTOLSRAMi1i0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMO1I0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "10010"
| "10011" =>
CHTOLSRAMiL00 := '0'&'0';
CHTOLSRAMlL00 := '0'&weN;
CHTOLSRAMOL00 := '0'&'0';
CHTOLSRAMiO00 := '0'&'0';
CHTOLSRAMlO00 := '0'&'0';
CHTOLSRAMoO00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAML1I0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
when "10000"
| "10001" =>
CHTOLSRAMil00 := '0'&'0';
CHTOLSRAMll00 := '0'&'0';
CHTOLSRAMol00 := '0'&Wen;
CHTOLSRAMiO00 := '0'&'0';
CHTOLSRAMLo00 := '0'&'0';
CHTOLSRAMoo00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMO1I0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
when "00000"
| "00001"
| "00010"
| "00011"
| "00100"
| "00101"
| "00110"
| "00111"
| "01000"
| "01001"
| "01010"
| "01011"
| "01100"
| "01101"
| "01110"
| "01111" =>
CHTOLSRAMIL00 := '0'&'0';
CHTOLSRAMll00 := '0'&'0';
CHTOLSRAMol00 := '0'&'0';
CHTOLSRAMIO00 := '0'&weN;
CHTOLSRAMLo00 := '0'&wen;
CHTOLSRAMOO00 := '0'&Wen;
CHTOLSRAMI1i0 := '0'&wen;
CHTOLSRAML1i0 := '0'&weN;
CHTOLSRAMO1i0 := '0'&wEN;
CHTOLSRAMi0I0 := '0'&Wen;
CHTOLSRAMl0i0 := '0'&wen;
when others =>
CHTOLSRAMIL00 := '0'&'0';
CHTOLSRAMlL00 := '0'&'0';
CHTOLSRAMol00 := '0'&'0';
CHTOLSRAMio00 := '0'&'0';
CHTOLSRAMlO00 := '0'&'0';
CHTOLSRAMoO00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
end case;
case CHTOLSRAMl1LL(14 downto 10) is
when "10100"
| "10101" =>
CHTOLSRAMl001 := CHTOLSRAMoLII(7 downto 0);
when "10010"
| "10011" =>
CHTOLSRAML001 := CHTOLSRAMioII(7 downto 0);
when "10000"
| "10001" =>
CHTOLSRAML001 := CHTOLSRAMLOii(7 downto 0);
when "00000"
| "00001"
| "00010"
| "00011"
| "00100"
| "00101"
| "00110"
| "00111"
| "01000"
| "01001"
| "01010"
| "01011"
| "01100"
| "01101"
| "01110"
| "01111" =>
CHTOLSRAML001 := CHTOLSRAMooII(0)&CHTOLSRAMI1li(0)&CHTOLSRAML1Li(0)&CHTOLSRAMO1Li(0)&CHTOLSRAMI0Li(0)&CHTOLSRAML0Li(0)&CHTOLSRAMo0LI(0)&CHTOLSRAMIili(0);
when others =>
CHTOLSRAML001 := ( others => '0');
end case;
when 23040
| 23552
| 24064
| 24576 =>
CHTOLSRAMOLi0 := "011";
CHTOLSRAMiOI0 := "011";
CHTOLSRAMloI0 := "011";
CHTOLSRAMOoi0 := "011";
CHTOLSRAMi1L0 := "000";
CHTOLSRAMl1L0 := "000";
CHTOLSRAMo1L0 := "000";
CHTOLSRAMI0L0 := "000";
CHTOLSRAMl0l0 := "000";
CHTOLSRAMo0L0 := "000";
CHTOLSRAMIIl0 := "000";
CHTOLSRAMLil0 := "000";
CHTOLSRAMooi1 := CHTOLSRAMOl1(10 downto 0)&"000";
CHTOLSRAMI1l1 := CHTOLSRAMol1(10 downto 0)&"000";
CHTOLSRAML1l1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMO1l1 := CHTOLSRAMol1(10 downto 0)&"000";
CHTOLSRAMi0L1 := CHTOLSRAMoL1(13 downto 0);
CHTOLSRAMl0L1 := CHTOLSRAMoL1(13 downto 0);
CHTOLSRAMO0l1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMIil1 := CHTOLSRAMoL1(13 downto 0);
CHTOLSRAMliL1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMOIl1 := CHTOLSRAMOl1(13 downto 0);
CHTOLSRAMilL1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMlll1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMOL01 := CHTOLSRAMll1(10 downto 0)&"000";
CHTOLSRAMio01 := CHTOLSRAMll1(10 downto 0)&"000";
CHTOLSRAMLO01 := CHTOLSRAMLL1(10 downto 0)&"000";
CHTOLSRAMOo01 := CHTOLSRAMll1(10 downto 0)&"000";
CHTOLSRAMi1I1 := CHTOLSRAMlL1(13 downto 0);
CHTOLSRAML1i1 := CHTOLSRAMll1(13 downto 0);
CHTOLSRAMo1I1 := CHTOLSRAMll1(13 downto 0);
CHTOLSRAMI0i1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMl0I1 := CHTOLSRAMlL1(13 downto 0);
CHTOLSRAMo0I1 := CHTOLSRAMll1(13 downto 0);
CHTOLSRAMiII1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMliI1 := CHTOLSRAMll1(13 downto 0);
CHTOLSRAMo1O1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
CHTOLSRAMi0O1 := "0000000000"&CHTOLSRAMlO1(7 downto 0);
CHTOLSRAMl0O1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
CHTOLSRAMo0O1 := "0000000000"&CHTOLSRAMLo1(7 downto 0);
CHTOLSRAMIIO1 := "00000000000000000"&CHTOLSRAMlO1(7);
CHTOLSRAMlIO1 := "00000000000000000"&CHTOLSRAMLO1(6);
CHTOLSRAMoIO1 := "00000000000000000"&CHTOLSRAMLo1(5);
CHTOLSRAMILO1 := "00000000000000000"&CHTOLSRAMlo1(4);
CHTOLSRAMllO1 := "00000000000000000"&CHTOLSRAMLO1(3);
CHTOLSRAMOlo1 := "00000000000000000"&CHTOLSRAMLO1(2);
CHTOLSRAMIOO1 := "00000000000000000"&CHTOLSRAMlO1(1);
CHTOLSRAMLOO1 := "00000000000000000"&CHTOLSRAMlo1(0);
case CHTOLSRAMol1(14 downto 10) is
when "10110"
| "10111" =>
CHTOLSRAMoI00 := '0'&WEn;
CHTOLSRAMIL00 := '0'&'0';
CHTOLSRAMLl00 := '0'&'0';
CHTOLSRAMoL00 := '0'&'0';
CHTOLSRAMiO00 := '0'&'0';
CHTOLSRAMlO00 := '0'&'0';
CHTOLSRAMoo00 := '0'&'0';
CHTOLSRAMi1i0 := '0'&'0';
CHTOLSRAML1I0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAMl0i0 := '0'&'0';
when "10100"
| "10101" =>
CHTOLSRAMOI00 := '0'&'0';
CHTOLSRAMIl00 := '0'&WEN;
CHTOLSRAMll00 := '0'&'0';
CHTOLSRAMol00 := '0'&'0';
CHTOLSRAMIO00 := '0'&'0';
CHTOLSRAMlo00 := '0'&'0';
CHTOLSRAMoo00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
when "10010"
| "10011" =>
CHTOLSRAMOI00 := '0'&'0';
CHTOLSRAMIl00 := '0'&'0';
CHTOLSRAMLl00 := '0'&WEn;
CHTOLSRAMoL00 := '0'&'0';
CHTOLSRAMiO00 := '0'&'0';
CHTOLSRAMlo00 := '0'&'0';
CHTOLSRAMOO00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMO1I0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "10000"
| "10001" =>
CHTOLSRAMoi00 := '0'&'0';
CHTOLSRAMil00 := '0'&'0';
CHTOLSRAMLl00 := '0'&'0';
CHTOLSRAMol00 := '0'&WEN;
CHTOLSRAMio00 := '0'&'0';
CHTOLSRAMLO00 := '0'&'0';
CHTOLSRAMoo00 := '0'&'0';
CHTOLSRAMI1I0 := '0'&'0';
CHTOLSRAMl1i0 := '0'&'0';
CHTOLSRAMO1I0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "00000"
| "00001"
| "00010"
| "00011"
| "00100"
| "00101"
| "00110"
| "00111"
| "01000"
| "01001"
| "01010"
| "01011"
| "01100"
| "01101"
| "01110"
| "01111" =>
CHTOLSRAMoi00 := '0'&'0';
CHTOLSRAMil00 := '0'&'0';
CHTOLSRAMLL00 := '0'&'0';
CHTOLSRAMoL00 := '0'&'0';
CHTOLSRAMiO00 := '0'&wen;
CHTOLSRAMLO00 := '0'&Wen;
CHTOLSRAMoo00 := '0'&wen;
CHTOLSRAMI1i0 := '0'&wEN;
CHTOLSRAML1i0 := '0'&Wen;
CHTOLSRAMO1I0 := '0'&Wen;
CHTOLSRAMi0I0 := '0'&WEn;
CHTOLSRAMl0I0 := '0'&WEn;
when others =>
CHTOLSRAMoI00 := '0'&'0';
CHTOLSRAMil00 := '0'&'0';
CHTOLSRAMLL00 := '0'&'0';
CHTOLSRAMoL00 := '0'&'0';
CHTOLSRAMiO00 := '0'&'0';
CHTOLSRAMlO00 := '0'&'0';
CHTOLSRAMoo00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMo1i0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
end case;
case CHTOLSRAML1ll(14 downto 10) is
when "10110"
| "10111" =>
CHTOLSRAMl001 := CHTOLSRAMLLIi(7 downto 0);
when "10100"
| "10101" =>
CHTOLSRAML001 := CHTOLSRAMoliI(7 downto 0);
when "10010"
| "10011" =>
CHTOLSRAMl001 := CHTOLSRAMIOIi(7 downto 0);
when "10000"
| "10001" =>
CHTOLSRAML001 := CHTOLSRAMlOII(7 downto 0);
when "00000"
| "00001"
| "00010"
| "00011"
| "00100"
| "00101"
| "00110"
| "00111"
| "01000"
| "01001"
| "01010"
| "01011"
| "01100"
| "01101"
| "01110"
| "01111" =>
CHTOLSRAML001 := CHTOLSRAMoOII(0)&CHTOLSRAMi1LI(0)&CHTOLSRAMl1LI(0)&CHTOLSRAMo1LI(0)&CHTOLSRAMI0li(0)&CHTOLSRAML0li(0)&CHTOLSRAMo0LI(0)&CHTOLSRAMiiLI(0);
when others =>
CHTOLSRAML001 := ( others => '0');
end case;
when 25088
| 25600
| 26112
| 26624 =>
CHTOLSRAMLli0 := "011";
CHTOLSRAMolI0 := "011";
CHTOLSRAMIoi0 := "011";
CHTOLSRAMlOI0 := "011";
CHTOLSRAMooI0 := "011";
CHTOLSRAMI1l0 := "000";
CHTOLSRAMl1L0 := "000";
CHTOLSRAMo1L0 := "000";
CHTOLSRAMI0l0 := "000";
CHTOLSRAMl0L0 := "000";
CHTOLSRAMO0l0 := "000";
CHTOLSRAMIil0 := "000";
CHTOLSRAMLIL0 := "000";
CHTOLSRAMLOi1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMOOi1 := CHTOLSRAMol1(10 downto 0)&"000";
CHTOLSRAMI1l1 := CHTOLSRAMol1(10 downto 0)&"000";
CHTOLSRAMl1L1 := CHTOLSRAMoL1(10 downto 0)&"000";
CHTOLSRAMo1L1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMI0L1 := CHTOLSRAMOl1(13 downto 0);
CHTOLSRAML0l1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMo0L1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMIIl1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMlIL1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMoIL1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMILl1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMLLl1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMlL01 := CHTOLSRAMlL1(10 downto 0)&"000";
CHTOLSRAMOL01 := CHTOLSRAMLL1(10 downto 0)&"000";
CHTOLSRAMio01 := CHTOLSRAMlL1(10 downto 0)&"000";
CHTOLSRAMlO01 := CHTOLSRAMLL1(10 downto 0)&"000";
CHTOLSRAMoO01 := CHTOLSRAMll1(10 downto 0)&"000";
CHTOLSRAMI1i1 := CHTOLSRAMll1(13 downto 0);
CHTOLSRAML1I1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMO1i1 := CHTOLSRAMlL1(13 downto 0);
CHTOLSRAMi0I1 := CHTOLSRAMLl1(13 downto 0);
CHTOLSRAML0i1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMO0i1 := CHTOLSRAMll1(13 downto 0);
CHTOLSRAMIii1 := CHTOLSRAMlL1(13 downto 0);
CHTOLSRAMlII1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAML1o1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
CHTOLSRAMo1O1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
CHTOLSRAMi0O1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
CHTOLSRAML0o1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
CHTOLSRAMO0o1 := "0000000000"&CHTOLSRAMlO1(7 downto 0);
CHTOLSRAMiiO1 := "00000000000000000"&CHTOLSRAMlO1(7);
CHTOLSRAMLIO1 := "00000000000000000"&CHTOLSRAMlO1(6);
CHTOLSRAMOio1 := "00000000000000000"&CHTOLSRAMLO1(5);
CHTOLSRAMilO1 := "00000000000000000"&CHTOLSRAMLO1(4);
CHTOLSRAMLlo1 := "00000000000000000"&CHTOLSRAMlO1(3);
CHTOLSRAMOLO1 := "00000000000000000"&CHTOLSRAMlo1(2);
CHTOLSRAMIOO1 := "00000000000000000"&CHTOLSRAMLo1(1);
CHTOLSRAMloO1 := "00000000000000000"&CHTOLSRAMLO1(0);
case CHTOLSRAMoL1(14 downto 10) is
when "11000"
| "11001" =>
CHTOLSRAMLi00 := '0'&Wen;
CHTOLSRAMoI00 := '0'&'0';
CHTOLSRAMIL00 := '0'&'0';
CHTOLSRAMlL00 := '0'&'0';
CHTOLSRAMol00 := '0'&'0';
CHTOLSRAMio00 := '0'&'0';
CHTOLSRAMLo00 := '0'&'0';
CHTOLSRAMOO00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMo1i0 := '0'&'0';
CHTOLSRAMI0I0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
when "10110"
| "10111" =>
CHTOLSRAMli00 := '0'&'0';
CHTOLSRAMoI00 := '0'&wEN;
CHTOLSRAMil00 := '0'&'0';
CHTOLSRAMll00 := '0'&'0';
CHTOLSRAMOL00 := '0'&'0';
CHTOLSRAMIo00 := '0'&'0';
CHTOLSRAMlO00 := '0'&'0';
CHTOLSRAMoo00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMi0i0 := '0'&'0';
CHTOLSRAML0I0 := '0'&'0';
when "10100"
| "10101" =>
CHTOLSRAMLI00 := '0'&'0';
CHTOLSRAMOi00 := '0'&'0';
CHTOLSRAMil00 := '0'&weN;
CHTOLSRAMLL00 := '0'&'0';
CHTOLSRAMOL00 := '0'&'0';
CHTOLSRAMIO00 := '0'&'0';
CHTOLSRAMlo00 := '0'&'0';
CHTOLSRAMOo00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMi0i0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "10010"
| "10011" =>
CHTOLSRAMLI00 := '0'&'0';
CHTOLSRAMOi00 := '0'&'0';
CHTOLSRAMIL00 := '0'&'0';
CHTOLSRAMLl00 := '0'&wEN;
CHTOLSRAMol00 := '0'&'0';
CHTOLSRAMIo00 := '0'&'0';
CHTOLSRAMlO00 := '0'&'0';
CHTOLSRAMOo00 := '0'&'0';
CHTOLSRAMi1i0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMO1I0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
when "10000"
| "10001" =>
CHTOLSRAMLI00 := '0'&'0';
CHTOLSRAMOI00 := '0'&'0';
CHTOLSRAMIL00 := '0'&'0';
CHTOLSRAMll00 := '0'&'0';
CHTOLSRAMol00 := '0'&Wen;
CHTOLSRAMIO00 := '0'&'0';
CHTOLSRAMLO00 := '0'&'0';
CHTOLSRAMoo00 := '0'&'0';
CHTOLSRAMi1i0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMo1i0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "00000"
| "00001"
| "00010"
| "00011"
| "00100"
| "00101"
| "00110"
| "00111"
| "01000"
| "01001"
| "01010"
| "01011"
| "01100"
| "01101"
| "01110"
| "01111" =>
CHTOLSRAMLI00 := '0'&'0';
CHTOLSRAMOi00 := '0'&'0';
CHTOLSRAMIL00 := '0'&'0';
CHTOLSRAMll00 := '0'&'0';
CHTOLSRAMOL00 := '0'&'0';
CHTOLSRAMiO00 := '0'&WEn;
CHTOLSRAMlo00 := '0'&WEN;
CHTOLSRAMoO00 := '0'&wen;
CHTOLSRAMI1I0 := '0'&weN;
CHTOLSRAML1i0 := '0'&WEN;
CHTOLSRAMO1i0 := '0'&weN;
CHTOLSRAMI0i0 := '0'&wen;
CHTOLSRAML0I0 := '0'&Wen;
when others =>
CHTOLSRAMLi00 := '0'&'0';
CHTOLSRAMoi00 := '0'&'0';
CHTOLSRAMIL00 := '0'&'0';
CHTOLSRAMlL00 := '0'&'0';
CHTOLSRAMOL00 := '0'&'0';
CHTOLSRAMio00 := '0'&'0';
CHTOLSRAMlo00 := '0'&'0';
CHTOLSRAMOO00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
end case;
case CHTOLSRAMl1LL(14 downto 10) is
when "11000"
| "11001" =>
CHTOLSRAMl001 := CHTOLSRAMIliI(7 downto 0);
when "10110"
| "10111" =>
CHTOLSRAMl001 := CHTOLSRAMlLIi(7 downto 0);
when "10100"
| "10101" =>
CHTOLSRAMl001 := CHTOLSRAMoliI(7 downto 0);
when "10010"
| "10011" =>
CHTOLSRAMl001 := CHTOLSRAMIOii(7 downto 0);
when "10000"
| "10001" =>
CHTOLSRAMl001 := CHTOLSRAMLOIi(7 downto 0);
when "00000"
| "00001"
| "00010"
| "00011"
| "00100"
| "00101"
| "00110"
| "00111"
| "01000"
| "01001"
| "01010"
| "01011"
| "01100"
| "01101"
| "01110"
| "01111" =>
CHTOLSRAML001 := CHTOLSRAMooII(0)&CHTOLSRAMI1Li(0)&CHTOLSRAML1lI(0)&CHTOLSRAMo1LI(0)&CHTOLSRAMI0li(0)&CHTOLSRAMl0LI(0)&CHTOLSRAMo0LI(0)&CHTOLSRAMIILi(0);
when others =>
CHTOLSRAMl001 := ( others => '0');
end case;
when 27136
| 27648
| 28160
| 28672 =>
CHTOLSRAMILi0 := "011";
CHTOLSRAMlLI0 := "011";
CHTOLSRAMOLi0 := "011";
CHTOLSRAMIoi0 := "011";
CHTOLSRAMlOI0 := "011";
CHTOLSRAMoOI0 := "011";
CHTOLSRAMI1l0 := "000";
CHTOLSRAMl1L0 := "000";
CHTOLSRAMO1l0 := "000";
CHTOLSRAMi0L0 := "000";
CHTOLSRAML0l0 := "000";
CHTOLSRAMO0l0 := "000";
CHTOLSRAMIil0 := "000";
CHTOLSRAMliL0 := "000";
CHTOLSRAMIOI1 := CHTOLSRAMol1(10 downto 0)&"000";
CHTOLSRAMLoi1 := CHTOLSRAMol1(10 downto 0)&"000";
CHTOLSRAMOOi1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMI1L1 := CHTOLSRAMoL1(10 downto 0)&"000";
CHTOLSRAMl1L1 := CHTOLSRAMoL1(10 downto 0)&"000";
CHTOLSRAMo1l1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMi0l1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAML0l1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMO0l1 := CHTOLSRAMoL1(13 downto 0);
CHTOLSRAMIIl1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMLil1 := CHTOLSRAMOl1(13 downto 0);
CHTOLSRAMOIl1 := CHTOLSRAMoL1(13 downto 0);
CHTOLSRAMill1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMLLl1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMil01 := CHTOLSRAMLL1(10 downto 0)&"000";
CHTOLSRAMLL01 := CHTOLSRAMLl1(10 downto 0)&"000";
CHTOLSRAMOl01 := CHTOLSRAMll1(10 downto 0)&"000";
CHTOLSRAMIO01 := CHTOLSRAMLl1(10 downto 0)&"000";
CHTOLSRAMlO01 := CHTOLSRAMLL1(10 downto 0)&"000";
CHTOLSRAMoO01 := CHTOLSRAMLL1(10 downto 0)&"000";
CHTOLSRAMi1i1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMl1I1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMo1I1 := CHTOLSRAMLl1(13 downto 0);
CHTOLSRAMI0i1 := CHTOLSRAMLl1(13 downto 0);
CHTOLSRAML0i1 := CHTOLSRAMLl1(13 downto 0);
CHTOLSRAMO0i1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMIIi1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMliI1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMI1o1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
CHTOLSRAMl1o1 := "0000000000"&CHTOLSRAMLo1(7 downto 0);
CHTOLSRAMO1o1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
CHTOLSRAMI0o1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
CHTOLSRAML0o1 := "0000000000"&CHTOLSRAMlO1(7 downto 0);
CHTOLSRAMo0o1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
CHTOLSRAMiIO1 := "00000000000000000"&CHTOLSRAMLO1(7);
CHTOLSRAMLio1 := "00000000000000000"&CHTOLSRAMLO1(6);
CHTOLSRAMOIo1 := "00000000000000000"&CHTOLSRAMLO1(5);
CHTOLSRAMilo1 := "00000000000000000"&CHTOLSRAMlo1(4);
CHTOLSRAMLLo1 := "00000000000000000"&CHTOLSRAMlO1(3);
CHTOLSRAMOLO1 := "00000000000000000"&CHTOLSRAMlO1(2);
CHTOLSRAMioO1 := "00000000000000000"&CHTOLSRAMLO1(1);
CHTOLSRAMloO1 := "00000000000000000"&CHTOLSRAMLO1(0);
case CHTOLSRAMoL1(14 downto 10) is
when "11010"
| "11011" =>
CHTOLSRAMii00 := '0'&WEN;
CHTOLSRAMLI00 := '0'&'0';
CHTOLSRAMoi00 := '0'&'0';
CHTOLSRAMiL00 := '0'&'0';
CHTOLSRAMLL00 := '0'&'0';
CHTOLSRAMoL00 := '0'&'0';
CHTOLSRAMiO00 := '0'&'0';
CHTOLSRAMlO00 := '0'&'0';
CHTOLSRAMoO00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAMl1i0 := '0'&'0';
CHTOLSRAMO1I0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "11000"
| "11001" =>
CHTOLSRAMiI00 := '0'&'0';
CHTOLSRAMli00 := '0'&Wen;
CHTOLSRAMOI00 := '0'&'0';
CHTOLSRAMIl00 := '0'&'0';
CHTOLSRAMLl00 := '0'&'0';
CHTOLSRAMol00 := '0'&'0';
CHTOLSRAMio00 := '0'&'0';
CHTOLSRAMlo00 := '0'&'0';
CHTOLSRAMOO00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMI0I0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
when "10110"
| "10111" =>
CHTOLSRAMiI00 := '0'&'0';
CHTOLSRAMli00 := '0'&'0';
CHTOLSRAMoi00 := '0'&WEn;
CHTOLSRAMIL00 := '0'&'0';
CHTOLSRAMLL00 := '0'&'0';
CHTOLSRAMol00 := '0'&'0';
CHTOLSRAMio00 := '0'&'0';
CHTOLSRAMLo00 := '0'&'0';
CHTOLSRAMOO00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAML1I0 := '0'&'0';
CHTOLSRAMo1i0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
when "10100"
| "10101" =>
CHTOLSRAMii00 := '0'&'0';
CHTOLSRAMLI00 := '0'&'0';
CHTOLSRAMOi00 := '0'&'0';
CHTOLSRAMil00 := '0'&wen;
CHTOLSRAMLl00 := '0'&'0';
CHTOLSRAMOL00 := '0'&'0';
CHTOLSRAMIO00 := '0'&'0';
CHTOLSRAMlo00 := '0'&'0';
CHTOLSRAMOO00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAMl1i0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
when "10010"
| "10011" =>
CHTOLSRAMiI00 := '0'&'0';
CHTOLSRAMLI00 := '0'&'0';
CHTOLSRAMoI00 := '0'&'0';
CHTOLSRAMIL00 := '0'&'0';
CHTOLSRAMLL00 := '0'&Wen;
CHTOLSRAMOL00 := '0'&'0';
CHTOLSRAMIo00 := '0'&'0';
CHTOLSRAMLO00 := '0'&'0';
CHTOLSRAMoO00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAMl1i0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "10000"
| "10001" =>
CHTOLSRAMii00 := '0'&'0';
CHTOLSRAMlI00 := '0'&'0';
CHTOLSRAMoi00 := '0'&'0';
CHTOLSRAMil00 := '0'&'0';
CHTOLSRAMlL00 := '0'&'0';
CHTOLSRAMOL00 := '0'&WEn;
CHTOLSRAMIO00 := '0'&'0';
CHTOLSRAMlO00 := '0'&'0';
CHTOLSRAMoo00 := '0'&'0';
CHTOLSRAMi1i0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "00000"
| "00001"
| "00010"
| "00011"
| "00100"
| "00101"
| "00110"
| "00111"
| "01000"
| "01001"
| "01010"
| "01011"
| "01100"
| "01101"
| "01110"
| "01111" =>
CHTOLSRAMiI00 := '0'&'0';
CHTOLSRAMLi00 := '0'&'0';
CHTOLSRAMoi00 := '0'&'0';
CHTOLSRAMil00 := '0'&'0';
CHTOLSRAMLL00 := '0'&'0';
CHTOLSRAMOL00 := '0'&'0';
CHTOLSRAMiO00 := '0'&weN;
CHTOLSRAMLo00 := '0'&wEN;
CHTOLSRAMOO00 := '0'&Wen;
CHTOLSRAMI1i0 := '0'&Wen;
CHTOLSRAML1I0 := '0'&Wen;
CHTOLSRAMO1I0 := '0'&WEn;
CHTOLSRAMi0I0 := '0'&weN;
CHTOLSRAML0i0 := '0'&wEN;
when others =>
CHTOLSRAMIi00 := '0'&'0';
CHTOLSRAMLI00 := '0'&'0';
CHTOLSRAMoi00 := '0'&'0';
CHTOLSRAMIl00 := '0'&'0';
CHTOLSRAMlL00 := '0'&'0';
CHTOLSRAMol00 := '0'&'0';
CHTOLSRAMiO00 := '0'&'0';
CHTOLSRAMLO00 := '0'&'0';
CHTOLSRAMoo00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMo1i0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
end case;
case CHTOLSRAMl1LL(14 downto 10) is
when "11010"
| "11011" =>
CHTOLSRAMl001 := CHTOLSRAMOIii(7 downto 0);
when "11000"
| "11001" =>
CHTOLSRAML001 := CHTOLSRAMilII(7 downto 0);
when "10110"
| "10111" =>
CHTOLSRAML001 := CHTOLSRAMlLII(7 downto 0);
when "10100"
| "10101" =>
CHTOLSRAMl001 := CHTOLSRAMolII(7 downto 0);
when "10010"
| "10011" =>
CHTOLSRAMl001 := CHTOLSRAMIoiI(7 downto 0);
when "10000"
| "10001" =>
CHTOLSRAMl001 := CHTOLSRAMloII(7 downto 0);
when "00000"
| "00001"
| "00010"
| "00011"
| "00100"
| "00101"
| "00110"
| "00111"
| "01000"
| "01001"
| "01010"
| "01011"
| "01100"
| "01101"
| "01110"
| "01111" =>
CHTOLSRAMl001 := CHTOLSRAMooII(0)&CHTOLSRAMI1Li(0)&CHTOLSRAML1Li(0)&CHTOLSRAMo1Li(0)&CHTOLSRAMi0LI(0)&CHTOLSRAML0Li(0)&CHTOLSRAMO0lI(0)&CHTOLSRAMIILi(0);
when others =>
CHTOLSRAMl001 := ( others => '0');
end case;
when 29184
| 29696
| 30208
| 30720 =>
CHTOLSRAMoii0 := "011";
CHTOLSRAMili0 := "011";
CHTOLSRAMLLI0 := "011";
CHTOLSRAMolI0 := "011";
CHTOLSRAMIoi0 := "011";
CHTOLSRAMlOI0 := "011";
CHTOLSRAMOoi0 := "011";
CHTOLSRAMi1L0 := "000";
CHTOLSRAML1l0 := "000";
CHTOLSRAMO1l0 := "000";
CHTOLSRAMI0l0 := "000";
CHTOLSRAMl0l0 := "000";
CHTOLSRAMO0L0 := "000";
CHTOLSRAMIil0 := "000";
CHTOLSRAMLIL0 := "000";
CHTOLSRAMoli1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMIOi1 := CHTOLSRAMOl1(10 downto 0)&"000";
CHTOLSRAMloI1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMooI1 := CHTOLSRAMoL1(10 downto 0)&"000";
CHTOLSRAMI1l1 := CHTOLSRAMol1(10 downto 0)&"000";
CHTOLSRAMl1L1 := CHTOLSRAMOL1(10 downto 0)&"000";
CHTOLSRAMo1L1 := CHTOLSRAMOl1(10 downto 0)&"000";
CHTOLSRAMi0L1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMl0L1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMO0L1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMiIL1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMlil1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMOIl1 := CHTOLSRAMOl1(13 downto 0);
CHTOLSRAMIll1 := CHTOLSRAMoL1(13 downto 0);
CHTOLSRAMLLL1 := CHTOLSRAMOl1(13 downto 0);
CHTOLSRAMoI01 := CHTOLSRAMll1(10 downto 0)&"000";
CHTOLSRAMIL01 := CHTOLSRAMLl1(10 downto 0)&"000";
CHTOLSRAMll01 := CHTOLSRAMLl1(10 downto 0)&"000";
CHTOLSRAMOL01 := CHTOLSRAMLL1(10 downto 0)&"000";
CHTOLSRAMIO01 := CHTOLSRAMll1(10 downto 0)&"000";
CHTOLSRAMlo01 := CHTOLSRAMll1(10 downto 0)&"000";
CHTOLSRAMOO01 := CHTOLSRAMll1(10 downto 0)&"000";
CHTOLSRAMI1i1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMl1I1 := CHTOLSRAMLl1(13 downto 0);
CHTOLSRAMO1i1 := CHTOLSRAMll1(13 downto 0);
CHTOLSRAMi0I1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMl0I1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMo0I1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMIii1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMLii1 := CHTOLSRAMll1(13 downto 0);
CHTOLSRAMOol1 := "0000000000"&CHTOLSRAMlO1(7 downto 0);
CHTOLSRAMI1o1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
CHTOLSRAMl1o1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
CHTOLSRAMo1O1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
CHTOLSRAMI0O1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
CHTOLSRAML0O1 := "0000000000"&CHTOLSRAMlo1(7 downto 0);
CHTOLSRAMo0O1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
CHTOLSRAMIIO1 := "00000000000000000"&CHTOLSRAMLO1(7);
CHTOLSRAMLio1 := "00000000000000000"&CHTOLSRAMlO1(6);
CHTOLSRAMoIO1 := "00000000000000000"&CHTOLSRAMLO1(5);
CHTOLSRAMILo1 := "00000000000000000"&CHTOLSRAMlo1(4);
CHTOLSRAMlLO1 := "00000000000000000"&CHTOLSRAMLO1(3);
CHTOLSRAMOLo1 := "00000000000000000"&CHTOLSRAMLO1(2);
CHTOLSRAMiOO1 := "00000000000000000"&CHTOLSRAMLO1(1);
CHTOLSRAMlOO1 := "00000000000000000"&CHTOLSRAMlo1(0);
case CHTOLSRAMOL1(14 downto 10) is
when "11100"
| "11101" =>
CHTOLSRAMo000 := '0'&wEN;
CHTOLSRAMiI00 := '0'&'0';
CHTOLSRAMlI00 := '0'&'0';
CHTOLSRAMoI00 := '0'&'0';
CHTOLSRAMil00 := '0'&'0';
CHTOLSRAMLl00 := '0'&'0';
CHTOLSRAMOL00 := '0'&'0';
CHTOLSRAMIo00 := '0'&'0';
CHTOLSRAMLO00 := '0'&'0';
CHTOLSRAMOO00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAMl0i0 := '0'&'0';
when "11010"
| "11011" =>
CHTOLSRAMo000 := '0'&'0';
CHTOLSRAMii00 := '0'&WEn;
CHTOLSRAMLI00 := '0'&'0';
CHTOLSRAMOI00 := '0'&'0';
CHTOLSRAMIl00 := '0'&'0';
CHTOLSRAMll00 := '0'&'0';
CHTOLSRAMol00 := '0'&'0';
CHTOLSRAMio00 := '0'&'0';
CHTOLSRAMlo00 := '0'&'0';
CHTOLSRAMOo00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMI0I0 := '0'&'0';
CHTOLSRAMl0i0 := '0'&'0';
when "11000"
| "11001" =>
CHTOLSRAMO000 := '0'&'0';
CHTOLSRAMii00 := '0'&'0';
CHTOLSRAMli00 := '0'&weN;
CHTOLSRAMoi00 := '0'&'0';
CHTOLSRAMil00 := '0'&'0';
CHTOLSRAMLL00 := '0'&'0';
CHTOLSRAMOL00 := '0'&'0';
CHTOLSRAMiO00 := '0'&'0';
CHTOLSRAMlo00 := '0'&'0';
CHTOLSRAMOO00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
when "10110"
| "10111" =>
CHTOLSRAMo000 := '0'&'0';
CHTOLSRAMii00 := '0'&'0';
CHTOLSRAMli00 := '0'&'0';
CHTOLSRAMOI00 := '0'&wEN;
CHTOLSRAMiL00 := '0'&'0';
CHTOLSRAMll00 := '0'&'0';
CHTOLSRAMOL00 := '0'&'0';
CHTOLSRAMIO00 := '0'&'0';
CHTOLSRAMLO00 := '0'&'0';
CHTOLSRAMoo00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMO1I0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "10100"
| "10101" =>
CHTOLSRAMO000 := '0'&'0';
CHTOLSRAMii00 := '0'&'0';
CHTOLSRAMLI00 := '0'&'0';
CHTOLSRAMOi00 := '0'&'0';
CHTOLSRAMIl00 := '0'&wen;
CHTOLSRAMLL00 := '0'&'0';
CHTOLSRAMoL00 := '0'&'0';
CHTOLSRAMio00 := '0'&'0';
CHTOLSRAMlo00 := '0'&'0';
CHTOLSRAMoo00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMI0I0 := '0'&'0';
CHTOLSRAML0i0 := '0'&'0';
when "10010"
| "10011" =>
CHTOLSRAMO000 := '0'&'0';
CHTOLSRAMIi00 := '0'&'0';
CHTOLSRAMLI00 := '0'&'0';
CHTOLSRAMOI00 := '0'&'0';
CHTOLSRAMiL00 := '0'&'0';
CHTOLSRAMll00 := '0'&Wen;
CHTOLSRAMOL00 := '0'&'0';
CHTOLSRAMiO00 := '0'&'0';
CHTOLSRAMlo00 := '0'&'0';
CHTOLSRAMOo00 := '0'&'0';
CHTOLSRAMI1I0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMI0I0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "10000"
| "10001" =>
CHTOLSRAMo000 := '0'&'0';
CHTOLSRAMiI00 := '0'&'0';
CHTOLSRAMli00 := '0'&'0';
CHTOLSRAMoi00 := '0'&'0';
CHTOLSRAMiL00 := '0'&'0';
CHTOLSRAMLL00 := '0'&'0';
CHTOLSRAMol00 := '0'&WEn;
CHTOLSRAMio00 := '0'&'0';
CHTOLSRAMLO00 := '0'&'0';
CHTOLSRAMoo00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "00000"
| "00001"
| "00010"
| "00011"
| "00100"
| "00101"
| "00110"
| "00111"
| "01000"
| "01001"
| "01010"
| "01011"
| "01100"
| "01101"
| "01110"
| "01111" =>
CHTOLSRAMO000 := '0'&'0';
CHTOLSRAMII00 := '0'&'0';
CHTOLSRAMli00 := '0'&'0';
CHTOLSRAMOi00 := '0'&'0';
CHTOLSRAMil00 := '0'&'0';
CHTOLSRAMll00 := '0'&'0';
CHTOLSRAMOl00 := '0'&'0';
CHTOLSRAMIO00 := '0'&Wen;
CHTOLSRAMLO00 := '0'&Wen;
CHTOLSRAMoO00 := '0'&wEN;
CHTOLSRAMi1I0 := '0'&WEN;
CHTOLSRAMl1I0 := '0'&wEN;
CHTOLSRAMo1I0 := '0'&weN;
CHTOLSRAMI0i0 := '0'&wEN;
CHTOLSRAML0i0 := '0'&WEn;
when others =>
CHTOLSRAMO000 := '0'&'0';
CHTOLSRAMii00 := '0'&'0';
CHTOLSRAMlI00 := '0'&'0';
CHTOLSRAMoI00 := '0'&'0';
CHTOLSRAMil00 := '0'&'0';
CHTOLSRAMLL00 := '0'&'0';
CHTOLSRAMol00 := '0'&'0';
CHTOLSRAMio00 := '0'&'0';
CHTOLSRAMlo00 := '0'&'0';
CHTOLSRAMOO00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMO1I0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAML0I0 := '0'&'0';
end case;
case CHTOLSRAML1ll(14 downto 10) is
when "11100"
| "11101" =>
CHTOLSRAML001 := CHTOLSRAMlIII(7 downto 0);
when "11010"
| "11011" =>
CHTOLSRAML001 := CHTOLSRAMoIII(7 downto 0);
when "11000"
| "11001" =>
CHTOLSRAMl001 := CHTOLSRAMiLIi(7 downto 0);
when "10110"
| "10111" =>
CHTOLSRAMl001 := CHTOLSRAMlLII(7 downto 0);
when "10100"
| "10101" =>
CHTOLSRAML001 := CHTOLSRAMOLIi(7 downto 0);
when "10010"
| "10011" =>
CHTOLSRAML001 := CHTOLSRAMIOii(7 downto 0);
when "10000"
| "10001" =>
CHTOLSRAMl001 := CHTOLSRAMlOII(7 downto 0);
when "00000"
| "00001"
| "00010"
| "00011"
| "00100"
| "00101"
| "00110"
| "00111"
| "01000"
| "01001"
| "01010"
| "01011"
| "01100"
| "01101"
| "01110"
| "01111" =>
CHTOLSRAMl001 := CHTOLSRAMOOIi(0)&CHTOLSRAMi1LI(0)&CHTOLSRAMl1Li(0)&CHTOLSRAMO1li(0)&CHTOLSRAMI0li(0)&CHTOLSRAMl0LI(0)&CHTOLSRAMO0Li(0)&CHTOLSRAMIili(0);
when others =>
CHTOLSRAMl001 := ( others => '0');
end case;
when 31232
| 31744
| 32256
| 32768 =>
CHTOLSRAMliI0 := "000";
CHTOLSRAMOII0 := "000";
CHTOLSRAMili0 := "000";
CHTOLSRAMllI0 := "000";
CHTOLSRAMolI0 := "000";
CHTOLSRAMIoi0 := "000";
CHTOLSRAMlOI0 := "000";
CHTOLSRAMOOi0 := "000";
CHTOLSRAMi1L0 := "000";
CHTOLSRAMl1L0 := "000";
CHTOLSRAMO1L0 := "000";
CHTOLSRAMi0L0 := "000";
CHTOLSRAML0l0 := "000";
CHTOLSRAMO0l0 := "000";
CHTOLSRAMIil0 := "000";
CHTOLSRAMlIL0 := "000";
CHTOLSRAMlLI1 := CHTOLSRAMOl1(13 downto 0);
CHTOLSRAMolI1 := CHTOLSRAMoL1(13 downto 0);
CHTOLSRAMioI1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMLOI1 := CHTOLSRAMoL1(13 downto 0);
CHTOLSRAMOOi1 := CHTOLSRAMoL1(13 downto 0);
CHTOLSRAMi1L1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAML1l1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMo1L1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMi0L1 := CHTOLSRAMoL1(13 downto 0);
CHTOLSRAML0l1 := CHTOLSRAMOl1(13 downto 0);
CHTOLSRAMO0l1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMIIl1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMLIL1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMOil1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMIll1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMLLL1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMLI01 := CHTOLSRAMLl1(13 downto 0);
CHTOLSRAMOI01 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMil01 := CHTOLSRAMll1(13 downto 0);
CHTOLSRAMLl01 := CHTOLSRAMLl1(13 downto 0);
CHTOLSRAMoL01 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMiO01 := CHTOLSRAMlL1(13 downto 0);
CHTOLSRAMlo01 := CHTOLSRAMLl1(13 downto 0);
CHTOLSRAMoO01 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMi1I1 := CHTOLSRAMlL1(13 downto 0);
CHTOLSRAMl1I1 := CHTOLSRAMll1(13 downto 0);
CHTOLSRAMO1i1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMI0I1 := CHTOLSRAMll1(13 downto 0);
CHTOLSRAML0I1 := CHTOLSRAMLl1(13 downto 0);
CHTOLSRAMO0i1 := CHTOLSRAMLl1(13 downto 0);
CHTOLSRAMIii1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMlII1 := CHTOLSRAMll1(13 downto 0);
CHTOLSRAMLOL1 := "00000000000000000"&CHTOLSRAMlo1(7);
CHTOLSRAMooL1 := "00000000000000000"&CHTOLSRAMLO1(6);
CHTOLSRAMI1o1 := "00000000000000000"&CHTOLSRAMlO1(5);
CHTOLSRAML1o1 := "00000000000000000"&CHTOLSRAMlO1(4);
CHTOLSRAMo1O1 := "00000000000000000"&CHTOLSRAMLO1(3);
CHTOLSRAMi0o1 := "00000000000000000"&CHTOLSRAMlo1(2);
CHTOLSRAML0O1 := "00000000000000000"&CHTOLSRAMLO1(1);
CHTOLSRAMo0O1 := "00000000000000000"&CHTOLSRAMLo1(0);
CHTOLSRAMIIO1 := "00000000000000000"&CHTOLSRAMLO1(7);
CHTOLSRAMLIo1 := "00000000000000000"&CHTOLSRAMLO1(6);
CHTOLSRAMOIo1 := "00000000000000000"&CHTOLSRAMLo1(5);
CHTOLSRAMILO1 := "00000000000000000"&CHTOLSRAMLO1(4);
CHTOLSRAMLLO1 := "00000000000000000"&CHTOLSRAMLo1(3);
CHTOLSRAMOLO1 := "00000000000000000"&CHTOLSRAMlo1(2);
CHTOLSRAMIoo1 := "00000000000000000"&CHTOLSRAMLo1(1);
CHTOLSRAMLOo1 := "00000000000000000"&CHTOLSRAMLo1(0);
case CHTOLSRAMOL1(14 downto 10) is
when "10000"
| "10001"
| "10010"
| "10011"
| "10100"
| "10101"
| "10110"
| "10111"
| "11000"
| "11001"
| "11010"
| "11011"
| "11100"
| "11101"
| "11110"
| "11111" =>
CHTOLSRAMl000 := '0'&wen;
CHTOLSRAMo000 := '0'&WEn;
CHTOLSRAMiI00 := '0'&Wen;
CHTOLSRAMLI00 := '0'&wEN;
CHTOLSRAMoi00 := '0'&wEN;
CHTOLSRAMil00 := '0'&WEN;
CHTOLSRAMll00 := '0'&wEN;
CHTOLSRAMOl00 := '0'&Wen;
CHTOLSRAMiO00 := '0'&'0';
CHTOLSRAMlO00 := '0'&'0';
CHTOLSRAMoo00 := '0'&'0';
CHTOLSRAMi1i0 := '0'&'0';
CHTOLSRAMl1i0 := '0'&'0';
CHTOLSRAMO1I0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "00000"
| "00001"
| "00010"
| "00011"
| "00100"
| "00101"
| "00110"
| "00111"
| "01000"
| "01001"
| "01010"
| "01011"
| "01100"
| "01101"
| "01110"
| "01111" =>
CHTOLSRAMl000 := '0'&'0';
CHTOLSRAMO000 := '0'&'0';
CHTOLSRAMII00 := '0'&'0';
CHTOLSRAMli00 := '0'&'0';
CHTOLSRAMoI00 := '0'&'0';
CHTOLSRAMil00 := '0'&'0';
CHTOLSRAMlL00 := '0'&'0';
CHTOLSRAMol00 := '0'&'0';
CHTOLSRAMio00 := '0'&weN;
CHTOLSRAMlO00 := '0'&WEn;
CHTOLSRAMOO00 := '0'&wEN;
CHTOLSRAMI1i0 := '0'&wEN;
CHTOLSRAMl1i0 := '0'&Wen;
CHTOLSRAMo1I0 := '0'&Wen;
CHTOLSRAMi0I0 := '0'&weN;
CHTOLSRAMl0i0 := '0'&Wen;
when others =>
CHTOLSRAMl000 := '0'&'0';
CHTOLSRAMO000 := '0'&'0';
CHTOLSRAMII00 := '0'&'0';
CHTOLSRAMLi00 := '0'&'0';
CHTOLSRAMOI00 := '0'&'0';
CHTOLSRAMiL00 := '0'&'0';
CHTOLSRAMlL00 := '0'&'0';
CHTOLSRAMOl00 := '0'&'0';
CHTOLSRAMiO00 := '0'&'0';
CHTOLSRAMlO00 := '0'&'0';
CHTOLSRAMoo00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAML1I0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
end case;
case CHTOLSRAMl1Ll(14 downto 10) is
when "10000"
| "10001"
| "10010"
| "10011"
| "10100"
| "10101"
| "10110"
| "10111"
| "11000"
| "11001"
| "11010"
| "11011"
| "11100"
| "11101"
| "11110"
| "11111" =>
CHTOLSRAMl001 := CHTOLSRAMIiii(0)&CHTOLSRAMLIii(0)&CHTOLSRAMOiii(0)&CHTOLSRAMILii(0)&CHTOLSRAMLlii(0)&CHTOLSRAMoliI(0)&CHTOLSRAMIOii(0)&CHTOLSRAMlOIi(0);
when "00000"
| "00001"
| "00010"
| "00011"
| "00100"
| "00101"
| "00110"
| "00111"
| "01000"
| "01001"
| "01010"
| "01011"
| "01100"
| "01101"
| "01110"
| "01111" =>
CHTOLSRAML001 := CHTOLSRAMooII(0)&CHTOLSRAMi1LI(0)&CHTOLSRAMl1lI(0)&CHTOLSRAMO1li(0)&CHTOLSRAMi0LI(0)&CHTOLSRAML0lI(0)&CHTOLSRAMo0LI(0)&CHTOLSRAMIIli(0);
when others =>
CHTOLSRAML001 := ( others => '0');
end case;
when 33280
| 33792
| 34304
| 34816 =>
CHTOLSRAMIIi0 := "011";
CHTOLSRAMlII0 := "000";
CHTOLSRAMOIi0 := "000";
CHTOLSRAMili0 := "000";
CHTOLSRAMllI0 := "000";
CHTOLSRAMOli0 := "000";
CHTOLSRAMiOI0 := "000";
CHTOLSRAMLoi0 := "000";
CHTOLSRAMooI0 := "000";
CHTOLSRAMI1l0 := "000";
CHTOLSRAML1l0 := "000";
CHTOLSRAMo1l0 := "000";
CHTOLSRAMi0L0 := "000";
CHTOLSRAML0l0 := "000";
CHTOLSRAMo0L0 := "000";
CHTOLSRAMIil0 := "000";
CHTOLSRAMLIl0 := "000";
CHTOLSRAMilI1 := CHTOLSRAMOl1(10 downto 0)&"000";
CHTOLSRAMllI1 := CHTOLSRAMOl1(13 downto 0);
CHTOLSRAMoli1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMioI1 := CHTOLSRAMoL1(13 downto 0);
CHTOLSRAMloI1 := CHTOLSRAMoL1(13 downto 0);
CHTOLSRAMooI1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMi1L1 := CHTOLSRAMoL1(13 downto 0);
CHTOLSRAML1l1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMo1l1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMI0L1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAML0l1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMo0L1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMiIL1 := CHTOLSRAMol1(13 downto 0);
CHTOLSRAMLIl1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMoIL1 := CHTOLSRAMoL1(13 downto 0);
CHTOLSRAMill1 := CHTOLSRAMOL1(13 downto 0);
CHTOLSRAMLll1 := CHTOLSRAMOl1(13 downto 0);
CHTOLSRAMII01 := CHTOLSRAMLl1(10 downto 0)&"000";
CHTOLSRAMlI01 := CHTOLSRAMll1(13 downto 0);
CHTOLSRAMoi01 := CHTOLSRAMll1(13 downto 0);
CHTOLSRAMil01 := CHTOLSRAMll1(13 downto 0);
CHTOLSRAMLL01 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMol01 := CHTOLSRAMlL1(13 downto 0);
CHTOLSRAMIo01 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMLO01 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMOo01 := CHTOLSRAMLl1(13 downto 0);
CHTOLSRAMi1i1 := CHTOLSRAMLl1(13 downto 0);
CHTOLSRAML1i1 := CHTOLSRAMLl1(13 downto 0);
CHTOLSRAMo1I1 := CHTOLSRAMlL1(13 downto 0);
CHTOLSRAMI0i1 := CHTOLSRAMlL1(13 downto 0);
CHTOLSRAML0i1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMO0i1 := CHTOLSRAMlL1(13 downto 0);
CHTOLSRAMiiI1 := CHTOLSRAMll1(13 downto 0);
CHTOLSRAMLIi1 := CHTOLSRAMLL1(13 downto 0);
CHTOLSRAMIol1 := "0000000000"&CHTOLSRAMLO1(7 downto 0);
CHTOLSRAMlol1 := "00000000000000000"&CHTOLSRAMLO1(7);
CHTOLSRAMOOl1 := "00000000000000000"&CHTOLSRAMLo1(6);
CHTOLSRAMi1O1 := "00000000000000000"&CHTOLSRAMlO1(5);
CHTOLSRAMl1O1 := "00000000000000000"&CHTOLSRAMlo1(4);
CHTOLSRAMo1O1 := "00000000000000000"&CHTOLSRAMlO1(3);
CHTOLSRAMi0O1 := "00000000000000000"&CHTOLSRAMlO1(2);
CHTOLSRAMl0O1 := "00000000000000000"&CHTOLSRAMlo1(1);
CHTOLSRAMO0O1 := "00000000000000000"&CHTOLSRAMLO1(0);
CHTOLSRAMiIO1 := "00000000000000000"&CHTOLSRAMlO1(7);
CHTOLSRAMLIO1 := "00000000000000000"&CHTOLSRAMlo1(6);
CHTOLSRAMoIO1 := "00000000000000000"&CHTOLSRAMLO1(5);
CHTOLSRAMilO1 := "00000000000000000"&CHTOLSRAMlO1(4);
CHTOLSRAMLLO1 := "00000000000000000"&CHTOLSRAMLO1(3);
CHTOLSRAMOlo1 := "00000000000000000"&CHTOLSRAMLo1(2);
CHTOLSRAMIoo1 := "00000000000000000"&CHTOLSRAMLo1(1);
CHTOLSRAMLOo1 := "00000000000000000"&CHTOLSRAMlo1(0);
case CHTOLSRAMOL1(15 downto 10) is
when "100000"
| "100001" =>
CHTOLSRAMI000 := '0'&Wen;
CHTOLSRAML000 := '0'&'0';
CHTOLSRAMo000 := '0'&'0';
CHTOLSRAMII00 := '0'&'0';
CHTOLSRAMlI00 := '0'&'0';
CHTOLSRAMoi00 := '0'&'0';
CHTOLSRAMiL00 := '0'&'0';
CHTOLSRAMLl00 := '0'&'0';
CHTOLSRAMol00 := '0'&'0';
CHTOLSRAMIO00 := '0'&'0';
CHTOLSRAMlo00 := '0'&'0';
CHTOLSRAMoo00 := '0'&'0';
CHTOLSRAMi1I0 := '0'&'0';
CHTOLSRAML1i0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMI0i0 := '0'&'0';
CHTOLSRAMl0i0 := '0'&'0';
when "010000"
| "010001"
| "010010"
| "010011"
| "010100"
| "010101"
| "010110"
| "010111"
| "011000"
| "011001"
| "011010"
| "011011"
| "011100"
| "011101"
| "011110"
| "011111" =>
CHTOLSRAMI000 := '0'&'0';
CHTOLSRAML000 := '0'&Wen;
CHTOLSRAMo000 := '0'&WEn;
CHTOLSRAMii00 := '0'&weN;
CHTOLSRAMLI00 := '0'&wen;
CHTOLSRAMoI00 := '0'&WEn;
CHTOLSRAMil00 := '0'&weN;
CHTOLSRAMLl00 := '0'&Wen;
CHTOLSRAMol00 := '0'&Wen;
CHTOLSRAMio00 := '0'&'0';
CHTOLSRAMlo00 := '0'&'0';
CHTOLSRAMoO00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMo1I0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
when "000000"
| "000001"
| "000010"
| "000011"
| "000100"
| "000101"
| "000110"
| "000111"
| "001000"
| "001001"
| "001010"
| "001011"
| "001100"
| "001101"
| "001110"
| "001111" =>
CHTOLSRAMi000 := '0'&'0';
CHTOLSRAML000 := '0'&'0';
CHTOLSRAMo000 := '0'&'0';
CHTOLSRAMII00 := '0'&'0';
CHTOLSRAMli00 := '0'&'0';
CHTOLSRAMoi00 := '0'&'0';
CHTOLSRAMiL00 := '0'&'0';
CHTOLSRAMLL00 := '0'&'0';
CHTOLSRAMOL00 := '0'&'0';
CHTOLSRAMIo00 := '0'&weN;
CHTOLSRAMLO00 := '0'&Wen;
CHTOLSRAMoo00 := '0'&wen;
CHTOLSRAMI1I0 := '0'&Wen;
CHTOLSRAMl1I0 := '0'&wen;
CHTOLSRAMo1I0 := '0'&weN;
CHTOLSRAMi0I0 := '0'&weN;
CHTOLSRAMl0I0 := '0'&wEN;
when others =>
CHTOLSRAMI000 := '0'&'0';
CHTOLSRAML000 := '0'&'0';
CHTOLSRAMo000 := '0'&'0';
CHTOLSRAMii00 := '0'&'0';
CHTOLSRAMli00 := '0'&'0';
CHTOLSRAMOI00 := '0'&'0';
CHTOLSRAMil00 := '0'&'0';
CHTOLSRAMLl00 := '0'&'0';
CHTOLSRAMOL00 := '0'&'0';
CHTOLSRAMiO00 := '0'&'0';
CHTOLSRAMlO00 := '0'&'0';
CHTOLSRAMoo00 := '0'&'0';
CHTOLSRAMI1i0 := '0'&'0';
CHTOLSRAMl1I0 := '0'&'0';
CHTOLSRAMO1i0 := '0'&'0';
CHTOLSRAMi0I0 := '0'&'0';
CHTOLSRAMl0I0 := '0'&'0';
end case;
case CHTOLSRAMl1LL(15 downto 10) is
when "100000"
| "100001" =>
CHTOLSRAMl001 := CHTOLSRAMo0II(7 downto 0);
when "010000"
| "010001"
| "010010"
| "010011"
| "010100"
| "010101"
| "010110"
| "010111"
| "011000"
| "011001"
| "011010"
| "011011"
| "011100"
| "011101"
| "011110"
| "011111" =>
CHTOLSRAML001 := CHTOLSRAMiiiI(0)&CHTOLSRAMliII(0)&CHTOLSRAMOIii(0)&CHTOLSRAMIlii(0)&CHTOLSRAMLliI(0)&CHTOLSRAMoliI(0)&CHTOLSRAMIoii(0)&CHTOLSRAMlOII(0);
when "000000"
| "000001"
| "000010"
| "000011"
| "000100"
| "000101"
| "000110"
| "000111"
| "001000"
| "001001"
| "001010"
| "001011"
| "001100"
| "001101"
| "001110"
| "001111" =>
CHTOLSRAMl001 := CHTOLSRAMooII(0)&CHTOLSRAMi1LI(0)&CHTOLSRAML1li(0)&CHTOLSRAMO1li(0)&CHTOLSRAMI0Li(0)&CHTOLSRAMl0lI(0)&CHTOLSRAMO0li(0)&CHTOLSRAMiILI(0);
when others =>
CHTOLSRAMl001 := ( others => '0');
end case;
when others =>
null
;
end case;
wiDTH0 <= CHTOLSRAMlil0;
wiDTH1 <= CHTOLSRAMIIl0;
WIDth2 <= CHTOLSRAMo0l0;
CHTOLSRAMi1LL <= CHTOLSRAMl0l0;
CHTOLSRAMooIL <= CHTOLSRAMI0L0;
CHTOLSRAMloiL <= CHTOLSRAMo1L0;
CHTOLSRAMIoil <= CHTOLSRAMl1l0;
CHTOLSRAMolIL <= CHTOLSRAMI1l0;
CHTOLSRAMLlil <= CHTOLSRAMOOi0;
CHTOLSRAMilIL <= CHTOLSRAMlOI0;
CHTOLSRAMOIil <= CHTOLSRAMIOi0;
CHTOLSRAMliiL <= CHTOLSRAMoLI0;
CHTOLSRAMIIIl <= CHTOLSRAMLLi0;
CHTOLSRAMo0IL <= CHTOLSRAMiLI0;
CHTOLSRAML0Il <= CHTOLSRAMOIi0;
CHTOLSRAMi0iL <= CHTOLSRAMliI0;
CHTOLSRAMO1il <= CHTOLSRAMIii0;
CHTOLSRAMl1IL <= CHTOLSRAMO0i0;
CHTOLSRAMI1il <= CHTOLSRAMl0i0;
CHTOLSRAMoO0L <= CHTOLSRAMI0I0;
CHTOLSRAMLo0l <= CHTOLSRAMO1i0;
CHTOLSRAMio0L <= CHTOLSRAMl1I0;
CHTOLSRAMoL0L <= CHTOLSRAMi1I0;
CHTOLSRAMLL0l <= CHTOLSRAMOO00;
CHTOLSRAMIl0l <= CHTOLSRAMLo00;
CHTOLSRAMoI0l <= CHTOLSRAMio00;
CHTOLSRAMli0L <= CHTOLSRAMoL00;
CHTOLSRAMIi0l <= CHTOLSRAMll00;
CHTOLSRAMo00l <= CHTOLSRAMIL00;
CHTOLSRAML00l <= CHTOLSRAMOI00;
CHTOLSRAMi00L <= CHTOLSRAMli00;
CHTOLSRAMO10l <= CHTOLSRAMii00;
CHTOLSRAMl10L <= CHTOLSRAMO000;
CHTOLSRAMi10L <= CHTOLSRAMl000;
CHTOLSRAMOO1l <= CHTOLSRAMI000;
CHTOLSRAMlo1L <= CHTOLSRAMo100;
CHTOLSRAMio1L <= CHTOLSRAML100;
CHTOLSRAMOL1l <= CHTOLSRAMi100;
CHTOLSRAMLL1l <= CHTOLSRAMoo10;
CHTOLSRAMil1L <= CHTOLSRAMlO10;
CHTOLSRAMOI1l <= CHTOLSRAMio10;
CHTOLSRAMlI1L <= CHTOLSRAMoL10;
CHTOLSRAMii1L <= CHTOLSRAMlL10;
CHTOLSRAMo01L <= CHTOLSRAMiL10;
CHTOLSRAML01L <= CHTOLSRAMoi10;
CHTOLSRAMi01L <= CHTOLSRAMli10;
CHTOLSRAMO11l <= CHTOLSRAMII10;
CHTOLSRAMl11L <= CHTOLSRAMO010;
CHTOLSRAMi11L <= CHTOLSRAML010;
CHTOLSRAMOOoi <= CHTOLSRAMI010;
CHTOLSRAMLOoi <= CHTOLSRAMo110;
CHTOLSRAMioOI <= CHTOLSRAMl110;
CHTOLSRAMoloI <= CHTOLSRAMi110;
CHTOLSRAMlLOI <= CHTOLSRAMooO1;
CHTOLSRAMilOI <= CHTOLSRAMLOo1;
CHTOLSRAMOIOi <= CHTOLSRAMIoo1;
CHTOLSRAMLioi <= CHTOLSRAMolo1;
CHTOLSRAMiiOI <= CHTOLSRAMllO1;
CHTOLSRAMo0oI <= CHTOLSRAMilo1;
CHTOLSRAML0oi <= CHTOLSRAMoio1;
CHTOLSRAMI0oi <= CHTOLSRAMLio1;
CHTOLSRAMO1oi <= CHTOLSRAMIio1;
CHTOLSRAML1oi <= CHTOLSRAMO0o1;
CHTOLSRAMi1OI <= CHTOLSRAML0o1;
CHTOLSRAMooLI <= CHTOLSRAMi0O1;
CHTOLSRAMloLI <= CHTOLSRAMo1O1;
CHTOLSRAMiOLI <= CHTOLSRAMl1O1;
CHTOLSRAMolLI <= CHTOLSRAMI1o1;
CHTOLSRAMlLLI <= CHTOLSRAMOOl1;
CHTOLSRAMIlli <= CHTOLSRAMlol1;
CHTOLSRAMOIli <= CHTOLSRAMIOl1;
CHTOLSRAMLILi <= CHTOLSRAMOLl1;
CHTOLSRAMI0Ii <= CHTOLSRAMlLL1;
CHTOLSRAMo1II <= CHTOLSRAMilL1;
CHTOLSRAML1ii <= CHTOLSRAMoil1;
CHTOLSRAMI1ii <= CHTOLSRAMlil1;
CHTOLSRAMoo0I <= CHTOLSRAMIil1;
CHTOLSRAMLO0i <= CHTOLSRAMO0L1;
CHTOLSRAMio0I <= CHTOLSRAMl0L1;
CHTOLSRAMOl0i <= CHTOLSRAMI0l1;
CHTOLSRAMlL0i <= CHTOLSRAMo1L1;
CHTOLSRAMil0I <= CHTOLSRAMl1L1;
CHTOLSRAMOI0i <= CHTOLSRAMI1l1;
CHTOLSRAMlI0I <= CHTOLSRAMoOI1;
CHTOLSRAMii0I <= CHTOLSRAMloI1;
CHTOLSRAMO00i <= CHTOLSRAMIoi1;
CHTOLSRAML00i <= CHTOLSRAMOLi1;
CHTOLSRAMI00i <= CHTOLSRAMLLi1;
CHTOLSRAMo10i <= CHTOLSRAMILi1;
CHTOLSRAMl10I <= CHTOLSRAMoII1;
CHTOLSRAMi10I <= CHTOLSRAMLIi1;
CHTOLSRAMoo1I <= CHTOLSRAMiII1;
CHTOLSRAMLo1i <= CHTOLSRAMO0I1;
CHTOLSRAMiO1I <= CHTOLSRAMl0I1;
CHTOLSRAMOL1i <= CHTOLSRAMI0i1;
CHTOLSRAMLL1i <= CHTOLSRAMO1i1;
CHTOLSRAMil1I <= CHTOLSRAMl1i1;
CHTOLSRAMOI1i <= CHTOLSRAMi1I1;
CHTOLSRAMLI1i <= CHTOLSRAMoo01;
CHTOLSRAMii1I <= CHTOLSRAMlO01;
CHTOLSRAMo01I <= CHTOLSRAMio01;
CHTOLSRAMl01I <= CHTOLSRAMOL01;
CHTOLSRAMi01I <= CHTOLSRAMll01;
CHTOLSRAMO11i <= CHTOLSRAMil01;
CHTOLSRAML11i <= CHTOLSRAMoI01;
CHTOLSRAMi11I <= CHTOLSRAMLi01;
CHTOLSRAMOOO0 <= CHTOLSRAMIi01;
CHTOLSRAMLOo0 <= CHTOLSRAMo001;
CHTOLSRAMiLL0 <= CHTOLSRAMl001;
end process;
CHTOLSRAMi001: Ram1K18
port map (a_DOut => CHTOLSRAML0iI,
B_doUT => open ,
A_clK => Clk,
b_cLK => cLK,
A_arsT_n => CHTOLSRAMil1,
B_arsT_N => CHTOLSRAMil1,
A_Blk => "111",
B_bLK => "111",
A_din => CHTOLSRAMLILi,
B_Din => CHTOLSRAMliLI,
A_adDR => CHTOLSRAMl10I,
b_ADDr => CHTOLSRAMl10I,
a_wEN => CHTOLSRAMLo1l,
B_weN => CHTOLSRAMllOI,
a_DOUt_CLK => '1',
b_dOUT_clK => '1',
a_DOUt_EN => '1',
b_DOUt_EN => '1',
A_doUT_arST_n => '1',
b_dOUt_aRST_n => '1',
a_DOut_SRSt_n => '1',
b_dOUT_srST_n => '1',
A_doUT_lat => '1',
B_douT_Lat => '1',
a_WIdth => CHTOLSRAMl1IL,
b_WIDth => CHTOLSRAMl1iL,
A_wmoDE => '0',
b_WmodE => '0',
A_en => '1',
b_EN => '1',
BUsy => CHTOLSRAMiOO0,
sII_locK => '0');
CHTOLSRAMO101: Ram1K18
port map (A_doUT => CHTOLSRAMo0II,
b_DOut => open ,
a_CLk => clK,
b_cLK => CLK,
A_Arst_N => CHTOLSRAMIL1,
b_aRSt_n => CHTOLSRAMil1,
a_BLk => "111",
b_BLK => "111",
a_DIN => CHTOLSRAMoilI,
b_DIn => CHTOLSRAMoiLI,
A_Addr => CHTOLSRAMO10i,
b_Addr => CHTOLSRAMo10I,
A_weN => CHTOLSRAMOO1l,
B_Wen => CHTOLSRAMoLOI,
A_doUT_clK => '1',
b_DOUt_CLK => '1',
A_douT_En => '1',
b_dOUT_en => '1',
a_Dout_ARst_N => '1',
B_doUT_arsT_N => '1',
A_doUT_srST_n => '1',
b_Dout_SRst_N => '1',
A_douT_Lat => '1',
b_DOut_LAT => '1',
A_WidTH => CHTOLSRAMo1iL,
b_WidtH => CHTOLSRAMo1IL,
A_WmodE => '0',
B_wmODE => '0',
a_EN => '1',
b_eN => '1',
Busy => CHTOLSRAMOLo0,
siI_Lock => '0');
CHTOLSRAML101: rAM1k18
port map (a_dOUT => CHTOLSRAMiIII,
B_Dout => open ,
A_Clk => Clk,
B_Clk => cLK,
a_aRSt_n => CHTOLSRAMIl1,
b_ARSt_n => CHTOLSRAMiL1,
A_blK => "111",
B_blk => "111",
a_dIN => CHTOLSRAMiLLI,
B_diN => CHTOLSRAMilLI,
A_adDR => CHTOLSRAMI00i,
b_ADdr => CHTOLSRAMi00I,
A_wen => CHTOLSRAMi10L,
B_weN => CHTOLSRAMIOoi,
a_DOut_CLK => '1',
b_dOUT_cLK => '1',
a_DOut_EN => '1',
B_doUT_en => '1',
A_doUT_arST_n => '1',
b_DOUt_ARSt_n => '1',
A_DouT_Srst_N => '1',
b_DOUt_sRST_n => '1',
a_DOut_LAt => '1',
B_doUT_lat => '1',
a_wIDTh => CHTOLSRAMi0iL,
B_widTH => CHTOLSRAMI0Il,
a_WMOde => '0',
b_WMode => '0',
A_en => '1',
B_En => '1',
buSY => CHTOLSRAMLLo0,
siI_locK => '0');
CHTOLSRAMI101: rAM1k18
port map (A_douT => CHTOLSRAMLIii,
B_doUT => open ,
A_clk => cLK,
b_CLK => cLK,
a_aRST_n => CHTOLSRAMIl1,
B_arST_n => CHTOLSRAMIL1,
a_Blk => "111",
B_blk => "111",
A_din => CHTOLSRAMlLLI,
B_diN => CHTOLSRAMLLli,
a_aDDR => CHTOLSRAML00i,
b_ADDr => CHTOLSRAMl00I,
A_wen => CHTOLSRAMl10l,
B_weN => CHTOLSRAMloOI,
A_douT_Clk => '1',
B_doUT_clK => '1',
A_douT_en => '1',
B_dOUT_en => '1',
A_douT_ArsT_N => '1',
b_Dout_ARst_N => '1',
a_DOut_SRSt_n => '1',
B_douT_SrsT_N => '1',
A_doUT_laT => '1',
b_DOut_LAt => '1',
a_WIDth => CHTOLSRAML0il,
b_WIdth => CHTOLSRAMl0IL,
A_wmODE => '0',
B_wmoDE => '0',
a_EN => '1',
B_eN => '1',
Busy => CHTOLSRAMILo0,
sII_loCK => '0');
CHTOLSRAMOO11: raM1K18
port map (A_douT => CHTOLSRAMOIii,
b_dOUT => open ,
A_clK => CLK,
B_clK => cLK,
a_ARst_N => CHTOLSRAMIL1,
B_aRST_n => CHTOLSRAMIL1,
a_BLK => "111",
B_blK => "111",
A_Din => CHTOLSRAMoLLI,
b_dIN => CHTOLSRAMOlli,
a_ADdr => CHTOLSRAMO00i,
b_ADdr => CHTOLSRAMo00i,
A_weN => CHTOLSRAMO10l,
B_wen => CHTOLSRAMooOI,
A_doUT_clK => '1',
B_doUT_clk => '1',
A_doUT_en => '1',
B_doUT_en => '1',
A_doUT_arST_n => '1',
B_DouT_Arst_N => '1',
a_DOUt_SRSt_n => '1',
B_DouT_Srst_N => '1',
a_DOUt_lAT => '1',
B_doUT_laT => '1',
a_WIdth => CHTOLSRAMO0il,
b_WIDth => CHTOLSRAMO0il,
A_WmodE => '0',
b_wMOde => '0',
a_eN => '1',
B_en => '1',
BUsy => CHTOLSRAMOIo0,
sII_locK => '0');
CHTOLSRAMlo11: Ram1K18
port map (A_Dout => CHTOLSRAMilII,
b_DOut => open ,
a_CLK => clK,
B_clK => cLK,
a_ARst_N => CHTOLSRAMil1,
B_ArsT_N => CHTOLSRAMIl1,
A_blK => "111",
B_blk => "111",
a_dIN => CHTOLSRAMIOli,
b_dIN => CHTOLSRAMIOli,
A_addR => CHTOLSRAMII0i,
b_ADDr => CHTOLSRAMii0I,
A_wen => CHTOLSRAMi00L,
B_wen => CHTOLSRAMI11l,
a_DOUt_CLK => '1',
B_dOUT_clK => '1',
A_Dout_En => '1',
b_DOut_EN => '1',
a_DOut_ARSt_N => '1',
B_doUT_arST_n => '1',
A_douT_Srst_N => '1',
b_dOUT_sRST_n => '1',
A_DouT_Lat => '1',
b_dOUT_laT => '1',
a_WIdth => CHTOLSRAMIIil,
B_widTH => CHTOLSRAMIIil,
a_WMOde => '0',
b_WMode => '0',
A_en => '1',
B_en => '1',
busY => CHTOLSRAMliO0,
Sii_LOCk => '0');
CHTOLSRAMIO11: RAM1k18
port map (A_doUT => CHTOLSRAMllII,
b_DOut => open ,
a_CLk => clK,
b_CLk => clK,
a_ARSt_N => CHTOLSRAMIL1,
B_arST_n => CHTOLSRAMIl1,
a_bLK => "111",
b_Blk => "111",
A_diN => CHTOLSRAMLOli,
b_DIN => CHTOLSRAMLOli,
a_ADDr => CHTOLSRAMli0I,
b_aDDR => CHTOLSRAMLi0i,
a_WEN => CHTOLSRAMl00L,
B_Wen => CHTOLSRAMl11L,
A_douT_clk => '1',
b_Dout_CLk => '1',
a_DOUt_EN => '1',
B_dOUT_en => '1',
a_Dout_ARst_N => '1',
b_dOUt_aRST_n => '1',
a_DOUt_SRSt_n => '1',
b_Dout_SRst_N => '1',
a_dOUT_laT => '1',
B_doUT_laT => '1',
a_wIDth => CHTOLSRAMLIIl,
b_WIDth => CHTOLSRAMliiL,
a_WmodE => '0',
b_wMOde => '0',
a_EN => '1',
b_EN => '1',
Busy => CHTOLSRAMIio0,
sII_loCK => '0');
CHTOLSRAMOL11: raM1K18
port map (a_Dout => CHTOLSRAMOlii,
B_doUT => open ,
a_Clk => cLK,
b_CLk => clK,
a_aRSt_n => CHTOLSRAMiL1,
b_ARst_N => CHTOLSRAMIl1,
a_BLK => "111",
b_BLK => "111",
A_dIN => CHTOLSRAMoolI,
b_DIn => CHTOLSRAMooLI,
A_adDR => CHTOLSRAMOi0i,
b_Addr => CHTOLSRAMOI0i,
A_weN => CHTOLSRAMO00l,
b_wEN => CHTOLSRAMO11l,
a_DOUt_CLK => '1',
b_DOUt_CLK => '1',
A_doUT_en => '1',
b_DOut_EN => '1',
A_douT_ArsT_N => '1',
b_dOUT_aRST_n => '1',
a_DOut_SRst_N => '1',
B_douT_Srst_N => '1',
a_dOUT_laT => '1',
B_douT_Lat => '1',
a_wIDTh => CHTOLSRAMoIIL,
B_widTH => CHTOLSRAMOIIl,
A_wmODE => '0',
b_WMOde => '0',
A_en => '1',
b_En => '1',
busY => CHTOLSRAMO0o0,
sII_loCK => '0');
CHTOLSRAMLL11: raM1K18
port map (a_DOUt => CHTOLSRAMioiI,
b_DOUt => open ,
A_cLK => CLK,
b_CLk => clK,
a_ARSt_N => CHTOLSRAMiL1,
B_arsT_N => CHTOLSRAMIL1,
A_blk => "111",
B_Blk => "111",
A_din => CHTOLSRAMi1OI,
b_Din => CHTOLSRAMi1oI,
a_Addr => CHTOLSRAMiL0i,
b_aDDR => CHTOLSRAMil0I,
a_WEn => CHTOLSRAMIi0L,
b_WEn => CHTOLSRAMI01L,
A_dOUT_clK => '1',
b_dOUT_clK => '1',
A_doUT_en => '1',
b_DOut_EN => '1',
A_Dout_Arst_N => '1',
b_dOUt_aRST_n => '1',
a_dOUt_sRST_n => '1',
b_Dout_SRst_N => '1',
a_DOut_LAt => '1',
b_dOUT_lAT => '1',
a_WIDth => CHTOLSRAMiLIl,
b_wIDTh => CHTOLSRAMILil,
a_wMODe => '0',
B_WmodE => '0',
A_en => '1',
b_En => '1',
buSY => CHTOLSRAML0o0,
SII_lOCK => '0');
CHTOLSRAMIL11: raM1K18
port map (a_DOut => CHTOLSRAMLOii,
B_doUT => open ,
A_clK => clK,
b_cLK => CLk,
A_arST_n => CHTOLSRAMIl1,
b_ARst_N => CHTOLSRAMiL1,
A_Blk => "111",
B_blk => "111",
A_din => CHTOLSRAML1Oi,
B_diN => CHTOLSRAMl1oI,
a_ADdr => CHTOLSRAMLL0i,
b_ADdr => CHTOLSRAMLL0i,
a_WEN => CHTOLSRAMLI0l,
b_WEN => CHTOLSRAML01l,
a_Dout_CLk => '1',
b_DOUt_cLK => '1',
A_douT_en => '1',
b_dOUt_eN => '1',
A_douT_ArsT_N => '1',
b_dOUT_aRST_n => '1',
a_Dout_SRst_N => '1',
B_DouT_Srst_N => '1',
a_DOut_LAT => '1',
B_doUT_laT => '1',
A_wiDTH => CHTOLSRAMlLIL,
B_wiDTH => CHTOLSRAMLLil,
a_wMODe => '0',
B_wmODE => '0',
a_EN => '1',
B_en => '1',
BUSy => CHTOLSRAMi0O0,
SII_lOCK => '0');
CHTOLSRAMOI11: ram1K18
port map (A_doUT => CHTOLSRAMoOII,
b_DOut => open ,
a_CLK => CLK,
B_clK => clK,
a_ARst_N => CHTOLSRAMil1,
b_ARst_N => CHTOLSRAMil1,
a_BLk => "111",
B_blk => "111",
a_Din => CHTOLSRAMo1oI,
b_DIn => CHTOLSRAMO1Oi,
a_ADDr => CHTOLSRAMol0I,
B_addR => CHTOLSRAMoL0i,
A_wen => CHTOLSRAMoi0L,
B_Wen => CHTOLSRAMo01L,
a_dOUT_clK => '1',
B_doUT_clK => '1',
A_Dout_En => '1',
B_doUT_en => '1',
a_DOut_ARst_N => '1',
B_dOUT_arST_n => '1',
a_DOut_SRSt_n => '1',
B_dOUT_srST_n => '1',
A_douT_lat => '1',
B_DouT_Lat => '1',
A_WidtH => CHTOLSRAMOLIl,
b_wIDTh => CHTOLSRAMOlil,
a_WMOde => '0',
B_wmODE => '0',
a_EN => '1',
b_EN => '1',
busY => CHTOLSRAMO1o0,
sII_loCK => '0');
CHTOLSRAMli11: RAm1k18
port map (A_doUT => CHTOLSRAMI1Li,
B_douT => open ,
A_clK => cLK,
b_CLk => cLK,
a_ARst_N => CHTOLSRAMiL1,
B_arST_n => CHTOLSRAMIL1,
a_bLK => "111",
B_Blk => "111",
A_din => CHTOLSRAMi0OI,
B_din => CHTOLSRAMI0oI,
a_ADDr => CHTOLSRAMio0I,
B_addR => CHTOLSRAMio0I,
A_wen => CHTOLSRAMil0L,
B_wen => CHTOLSRAMii1L,
A_doUT_clk => '1',
b_Dout_CLk => '1',
a_DOUt_EN => '1',
b_dOUt_eN => '1',
a_DOut_ARst_N => '1',
B_douT_ArsT_N => '1',
A_doUT_srST_n => '1',
B_doUT_srST_n => '1',
a_Dout_LAt => '1',
B_doUT_laT => '1',
a_WIDth => CHTOLSRAMiOIL,
B_widTH => CHTOLSRAMiOIl,
A_wmODE => '0',
b_WMOde => '0',
A_en => '1',
b_EN => '1',
Busy => CHTOLSRAML1O0,
siI_locK => '0');
CHTOLSRAMIi11: raM1K18
port map (a_DOUt => CHTOLSRAMl1Li,
b_DOut => open ,
A_clK => clk,
b_CLk => cLK,
A_arsT_N => CHTOLSRAMiL1,
B_arST_n => CHTOLSRAMil1,
a_BLk => "111",
b_bLK => "111",
a_DIn => CHTOLSRAML0Oi,
b_dIN => CHTOLSRAML0oi,
a_aDDr => CHTOLSRAMLO0i,
b_ADdr => CHTOLSRAMLo0i,
a_WEn => CHTOLSRAMll0L,
b_WEn => CHTOLSRAMli1L,
A_doUT_clk => '1',
B_doUT_clk => '1',
a_DOUt_eN => '1',
b_DOut_EN => '1',
A_douT_Arst_N => '1',
B_doUT_arST_n => '1',
a_dOUT_srST_n => '1',
b_dOUT_sRST_n => '1',
a_DOut_LAT => '1',
B_douT_lat => '1',
a_wIDth => CHTOLSRAMloiL,
b_WIdtH => CHTOLSRAMloiL,
A_WmodE => '0',
b_WMOde => '0',
A_En => '1',
b_En => '1',
BUsy => CHTOLSRAMi1O0,
SIi_LOCk => '0');
CHTOLSRAMo011: Ram1K18
port map (a_dOUt => CHTOLSRAMO1Li,
B_doUT => open ,
A_clK => cLK,
b_CLK => CLK,
a_ARst_N => CHTOLSRAMIL1,
B_arST_n => CHTOLSRAMIl1,
a_BLK => "111",
b_Blk => "111",
a_dIN => CHTOLSRAMo0Oi,
b_DIn => CHTOLSRAMo0OI,
A_AddR => CHTOLSRAMOO0i,
b_ADDr => CHTOLSRAMOO0i,
A_wEN => CHTOLSRAMOL0l,
B_wEN => CHTOLSRAMOI1l,
A_doUT_clK => '1',
B_Dout_Clk => '1',
A_doUT_en => '1',
B_doUT_en => '1',
A_dOUT_arST_n => '1',
B_douT_arsT_N => '1',
A_Dout_Srst_N => '1',
B_DouT_Srst_N => '1',
a_Dout_LAt => '1',
B_doUT_lat => '1',
A_widTH => CHTOLSRAMoOIl,
b_WIDth => CHTOLSRAMooIL,
A_wmoDE => '0',
b_WMode => '0',
A_en => '1',
b_En => '1',
buSY => CHTOLSRAMool0,
SIi_LOCk => '0');
CHTOLSRAMl011: ram1K18
port map (A_doUT => CHTOLSRAMI0li,
B_doUT => open ,
A_clK => cLK,
b_CLk => CLk,
a_ARst_N => CHTOLSRAMiL1,
B_arST_n => CHTOLSRAMIl1,
A_blK => "111",
b_bLK => "111",
A_diN => CHTOLSRAMIIOi,
B_diN => CHTOLSRAMiioI,
a_ADDr => CHTOLSRAMI1Ii,
B_adDR => CHTOLSRAMI1ii,
A_wen => CHTOLSRAMio0L,
B_Wen => CHTOLSRAMIl1L,
a_DOUt_CLK => '1',
b_Dout_CLk => '1',
A_doUT_en => '1',
B_doUT_en => '1',
a_DOUt_ARSt_n => '1',
b_DOut_ARst_N => '1',
A_douT_SrsT_N => '1',
b_Dout_SRst_N => '1',
a_Dout_LAt => '1',
b_dOUT_laT => '1',
a_wIDTh => CHTOLSRAMi1LL,
B_widTH => CHTOLSRAMI1ll,
a_WMOde => '0',
B_wmoDE => '0',
a_eN => '1',
b_eN => '1',
buSY => CHTOLSRAMlOL0,
sii_LOck => '0');
CHTOLSRAMi011: RAm1k18
port map (A_douT => CHTOLSRAML0lI,
b_dOUT => open ,
a_cLK => clk,
b_cLK => CLk,
a_Arst_N => CHTOLSRAMIl1,
B_arST_n => CHTOLSRAMIL1,
A_Blk => "111",
B_blK => "111",
A_diN => CHTOLSRAMLIoi,
B_diN => CHTOLSRAMliOI,
a_ADdr => CHTOLSRAML1ii,
b_ADDr => CHTOLSRAML1ii,
A_weN => CHTOLSRAMlO0L,
b_Wen => CHTOLSRAMlL1L,
A_doUT_clk => '1',
b_dOUT_clK => '1',
a_DOUt_eN => '1',
B_dOUT_en => '1',
A_doUT_arST_n => '1',
B_douT_ArsT_N => '1',
A_Dout_Srst_N => '1',
b_dOUt_sRST_n => '1',
A_douT_Lat => '1',
B_doUT_laT => '1',
A_wIDTh => widTH2,
B_wiDTH => wiDTH2,
A_wMODe => '0',
B_wmoDE => '0',
a_EN => '1',
b_EN => '1',
buSY => CHTOLSRAMioL0,
Sii_LOck => '0');
CHTOLSRAMo111: RAM1k18
port map (a_dOUT => CHTOLSRAMO0li,
b_dOUt => open ,
a_CLK => clK,
B_cLK => Clk,
A_arsT_n => CHTOLSRAMIL1,
b_aRST_n => CHTOLSRAMIl1,
a_BLK => "111",
B_blK => "111",
a_DIn => CHTOLSRAMOIoi,
b_dIN => CHTOLSRAMOIoi,
a_ADDr => CHTOLSRAMo1iI,
B_addR => CHTOLSRAMo1II,
a_WEn => CHTOLSRAMoo0L,
B_Wen => CHTOLSRAMOl1l,
a_DOut_CLK => '1',
B_douT_Clk => '1',
a_dOUt_eN => '1',
b_DOUt_eN => '1',
a_DOUt_aRSt_n => '1',
b_DOUt_aRST_n => '1',
a_DOUt_sRSt_n => '1',
b_dOUT_sRST_n => '1',
A_doUT_laT => '1',
b_dOUT_laT => '1',
a_WidtH => WIdtH1,
b_WIDth => wIDTh1,
A_wmoDE => '0',
b_wMODe => '0',
a_eN => '1',
B_en => '1',
BUsy => CHTOLSRAMOLl0,
siI_locK => '0');
CHTOLSRAMl111: rAM1k18
port map (a_Dout => CHTOLSRAMiILI,
b_Dout => open ,
a_CLk => clK,
B_cLK => clk,
A_arsT_n => CHTOLSRAMil1,
b_ARst_N => CHTOLSRAMiL1,
a_Blk => "111",
B_blk => "111",
A_din => CHTOLSRAMiloI,
b_DIN => CHTOLSRAMILoi,
A_aDDR => CHTOLSRAMi0iI,
b_ADdr => CHTOLSRAMi0iI,
a_WEN => CHTOLSRAMI1iL,
b_wEN => CHTOLSRAMIO1l,
a_dOUT_clK => '1',
B_doUT_clk => '1',
a_DOUt_eN => '1',
B_Dout_En => '1',
A_dOUT_arST_n => '1',
b_DOUt_aRSt_n => '1',
a_Dout_SRst_N => '1',
B_douT_SrsT_N => '1',
A_Dout_Lat => '1',
B_doUT_laT => '1',
A_WidTH => wiDTh0,
B_wiDTH => widTH0,
A_WmodE => '0',
b_WMOde => '0',
a_En => '1',
b_EN => '1',
bUSY => CHTOLSRAMllL0,
SIi_lOCK => '0');
CHTOLSRAMoiL0 <= CHTOLSRAMllL0 or CHTOLSRAMoll0
or CHTOLSRAMiol0
or CHTOLSRAMLol0
or CHTOLSRAMoOL0
or CHTOLSRAMI1o0
or CHTOLSRAMl1O0
or CHTOLSRAMo1O0
or CHTOLSRAMI0o0
or CHTOLSRAMl0O0
or CHTOLSRAMo0O0
or CHTOLSRAMiiO0
or CHTOLSRAMlio0
or CHTOLSRAMoio0
or CHTOLSRAMILo0
or CHTOLSRAMLLo0
or CHTOLSRAMOLO0
or CHTOLSRAMiOO0;
end architecture CHTOLSRAMo;
