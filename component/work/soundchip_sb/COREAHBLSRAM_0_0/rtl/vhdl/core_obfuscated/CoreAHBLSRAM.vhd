--  Copyright 2011 Actel Corporation.  All rights reserved.
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- Revision Information:
-- SVN Revision Information:
-- SVN $Revision: 4805 $
library iEEE;
use ieEE.stD_loGIC_1164.all;
use IEEe.sTD_logIC_arITH.all;
use ieEE.sTD_loGIC_uNSIgneD.all;
use ieEE.sTD_logIC_miSC.all;
entity soundchip_sb_COREAHBLSRAM_0_0_COREAHBLSRAM is
generic (FAmilY: InteGER := 19;
Ahb_DWidtH: inTEGer := 32;
Ahb_AWidtH: intEGer := 32;
lsrAM_num_LocaTIOns_DwidTH32: iNTEgeR := 512;
usRAm_nUM_locATionS_dwiDTh32: iNTegeR := 128;
SEl_sRAm_tYPE: iNTEger := 1); port (hcLK: in Std_LOgic;
HReseTN: in Std_LOGic;
hseL: in stD_logIC;
HreaDYIn: in std_LogiC;
hsiZE: in sTD_logIC_veCTOr(2 downto 0);
htRAns: in sTD_loGIC_vECTor(1 downto 0);
hbURst: in sTD_loGIC_veCTor(2 downto 0);
HadDR: in std_LOgiC_VectOR(aHB_awIDTh-1 downto 0);
hWRite: in sTD_loGIC;
hwDAta: in std_LogiC_VecTOR(Ahb_DWidtH-1 downto 0);
hREAdyOUT: out stD_LogIC;
hrdATa: out stD_logIC_veCTOr(Ahb_DWIdth-1 downto 0);
HResp: out stD_logIC_vecTOr(1 downto 0));
end entity soundchip_sb_COREAHBLSRAM_0_0_COREAHBLSRAM;

architecture CHTOLSRAMO of soundchip_sb_COREAHBLSRAM_0_0_COREAHBLSRAM is

component CHTOLSRAMl
generic (AHB_dwIDTh: INtegER := 32;
AHb_AWIdth: InteGEr := 32;
CHTOLSRAMI: stD_logIC_vecTOr(1 downto 0) := "00";
CHTOLSRAMOL: std_LOgiC_VectOR(1 downto 0) := "01";
CHTOLSRAMLL: sTD_loGIC_veCTOr(1 downto 0) := "00";
CHTOLSRAMIl: stD_LogiC_VecTOR(1 downto 0) := "01";
CHTOLSRAMoi: sTD_loGIC_veCTOr(1 downto 0) := "11";
CHTOLSRAMLI: STd_LOGic_VECtor(1 downto 0) := "10");
port (Hclk: in sTD_loGIC;
HresETN: in std_LOgiC;
hsEL: in STd_lOGIc;
hTRAns: in stD_LogiC_VecTOR(1 downto 0);
hBURst: in Std_LOGic_VEctoR(2 downto 0);
hwRIte: in std_LogiC;
HsizE: in Std_LOgic_VectOR(2 downto 0);
hadDR: in Std_LOgic_VectOR(19 downto 0);
HWdaTA: in stD_LogiC_vecTOR(AHb_dWIdth-1 downto 0);
HReadYIN: in STd_lOGic;
CHTOLSRAMIi: in std_LOgic;
CHTOLSRAMO0: in std_LogiC_VecTOR(ahB_DwidTH-1 downto 0);
hREsp: out sTD_loGIC_veCTor(1 downto 0);
hrEADyoUT: out Std_LOgic;
HRDatA: out STd_lOGic_VECtor(AHB_dwIDth-1 downto 0);
CHTOLSRAMl0: out sTD_loGIC;
CHTOLSRAMI0: out Std_LOGic;
CHTOLSRAMO1: out std_LogiC_VecTOR(AHb_aWIdth-1 downto 0);
CHTOLSRAMl1: out Std_LOGic_VEctoR(2 downto 0);
CHTOLSRAMI1: out sTD_loGIC_veCTOr(19 downto 0);
Busy: in std_LOgiC);
end component;

component soundchip_sb_COREAHBLSRAM_0_0_SRamCTRlIf
generic (Sel_SRAm_tYPe: INtegER := 1;
LSram_Num_LOCatiONs_dWIdth32: intEGEr := 512;
usrAM_nuM_LocaTIons_DwidTH32: inTEGer := 128;
ahb_DwidTH: InteGEr := 32);
port (HClk: in Std_LOGic;
hrESEtn: in STd_lOGIc;
CHTOLSRAMl0: in std_LOgic;
CHTOLSRAMI0: in sTD_loGIC;
CHTOLSRAMO1: in Std_LOgic_VEctOR(AHB_dWIDth-1 downto 0);
CHTOLSRAMl1: in sTD_loGIC_veCTOr(2 downto 0);
CHTOLSRAMI1: in std_LOgiC_VectOR(19 downto 0);
CHTOLSRAMii: out STd_lOGIc;
CHTOLSRAMO0: out Std_LOgic_VectOR(AHb_dWIDth-1 downto 0);
BUsy: out STD_loGIc);
end component;

signal CHTOLSRAMOOl: STd_LOGic_VECtoR(19 downto 0);

signal CHTOLSRAML1: stD_LogIC_vecTOR(2 downto 0);

signal CHTOLSRAMI1: sTD_loGIC_veCTOr(19 downto 0);

signal CHTOLSRAMo1: std_LOgiC_VectOR(31 downto 0);

signal CHTOLSRAMI0: stD_LogiC;

signal CHTOLSRAMo0: Std_LOgic_VEctoR(31 downto 0);

signal CHTOLSRAMloL: sTD_logIC_veCTOr(ahB_DwidTH-1 downto 0);

signal CHTOLSRAMioL: stD_LogiC_vecTOR(1 downto 0);

signal CHTOLSRAMolL: std_LogiC;

signal bUSY: STd_lOGic;

signal CHTOLSRAML0: std_LOgiC;

signal CHTOLSRAMIi: stD_logIC;

begin
HRdatA <= CHTOLSRAMlol;
HResp <= CHTOLSRAMIol;
HReadYOUt <= CHTOLSRAMolL;
CHTOLSRAMOol <= hADDr(19 downto 0);
CHTOLSRAMlLL: CHTOLSRAML
port map (HClk => hcLK,
hrESetn => hREsetN,
hSEL => hSEl,
HTranS => hTRAns,
hbuRST => HbuRST,
hWRIte => hWRIte,
HwdaTA => HWdatA,
HsizE => hSIze,
HAddr => CHTOLSRAMool,
hREadyIN => HreaDYIn,
CHTOLSRAMII => CHTOLSRAMIi,
CHTOLSRAMO0 => CHTOLSRAMO0,
HReaDYOut => CHTOLSRAMolL,
hreSP => CHTOLSRAMIol,
CHTOLSRAML0 => CHTOLSRAML0,
CHTOLSRAMI0 => CHTOLSRAMi0,
CHTOLSRAMo1 => CHTOLSRAMo1,
CHTOLSRAMl1 => CHTOLSRAML1,
CHTOLSRAMi1 => CHTOLSRAMi1,
HrdaTA => CHTOLSRAMLOL,
Busy => Busy);
CHTOLSRAMIll: soundchip_sb_COREAHBLSRAM_0_0_SRAmCtRLIf
generic map (Sel_SRAm_tYPE => sEL_sraM_typE,
lsRAm_nUM_locATionS_dwiDTh32 => lSRam_NUM_loCATioNS_dwIDTh32,
usrAM_nuM_LocATIons_DwidTH32 => usrAM_nuM_LocaTIons_DwidTH32)
port map (HclK => hcLK,
HresETN => HresETN,
CHTOLSRAMl0 => CHTOLSRAML0,
CHTOLSRAMI0 => CHTOLSRAMi0,
CHTOLSRAMo1 => CHTOLSRAMo1,
CHTOLSRAML1 => CHTOLSRAML1,
CHTOLSRAMi1 => CHTOLSRAMi1,
CHTOLSRAMii => CHTOLSRAMii,
CHTOLSRAMO0 => CHTOLSRAMo0,
BUsy => Busy);
end architecture CHTOLSRAMo;
