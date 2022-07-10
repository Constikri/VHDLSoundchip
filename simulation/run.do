quietly set ACTELLIBNAME SmartFusion2
quietly set PROJECT_DIR "C:/Users/Constantin/Documents/VHDLSoundchip"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap SmartFusion2 "C:/Microsemi/Libero_SoC_v2022.1/Designer/lib/modelsimpro/precompiled/vlog/SmartFusion2"
if {[file exists CORERESET_PF_LIB/_info]} {
   echo "INFO: Simulation library CORERESET_PF_LIB already exists"
} else {
   file delete -force CORERESET_PF_LIB 
   vlib CORERESET_PF_LIB
}
vmap CORERESET_PF_LIB "CORERESET_PF_LIB"

vcom -2008 -explicit  -work CORERESET_PF_LIB "${PROJECT_DIR}/component/work/CORERESET_PF_C0/CORERESET_PF_C0_0/core/corereset_pf.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/CORERESET_PF_C0/CORERESET_PF_C0.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/FCCC_C0/FCCC_C0_0/FCCC_C0_FCCC_C0_0_FCCC.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/FCCC_C0/FCCC_C0.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/OSC_C0/OSC_C0_0/OSC_C0_OSC_C0_0_OSC.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/OSC_C0/OSC_C0.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/spi_slave.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/delta_adder.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/sigma_adder.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/dac.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/data_receiver.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/component/work/soundchip/soundchip.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/data_receiver_tb.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/delta_adder_tb.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/sigma_adder_tb.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/dac_tb.vhd"
vcom -2008 -explicit  -work CORERESET_PF_LIB "${PROJECT_DIR}/component/work/CORERESET_PF_C0/CORERESET_PF_C0_0/test/corereset_pf_tb.vhd"

vsim -L SmartFusion2 -L presynth -L CORERESET_PF_LIB  -t 1fs CORERESET_PF_LIB.soundchip_tb
add wave /corereset_pf_tb/*
run 1000ns
