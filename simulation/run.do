quietly set ACTELLIBNAME SmartFusion2
quietly set PROJECT_DIR "C:/Users/Constantin/Documents/VHDLSoundchip"

if {[file exists ../designer/soundchip/simulation/postlayout/_info]} {
   echo "INFO: Simulation library ../designer/soundchip/simulation/postlayout already exists"
} else {
   file delete -force ../designer/soundchip/simulation/postlayout 
   vlib ../designer/soundchip/simulation/postlayout
}
vmap postlayout ../designer/soundchip/simulation/postlayout
vmap SmartFusion2 "C:/Microchip/Libero_SoC_v2022.2/Designer/lib/modelsimpro/precompiled/vlog/SmartFusion2"

vcom -2008 -explicit  -work postlayout "${PROJECT_DIR}/designer/soundchip/soundchip_ba.vhd"
vcom -2008 -explicit  -work postlayout "${PROJECT_DIR}/stimulus/soundchip_tb.vhd"

vsim -L SmartFusion2 -L postlayout  -t 1fs -sdfmax /soundchip_0=${PROJECT_DIR}/designer/soundchip/soundchip_ba.sdf +transport_path_delays postlayout.soundchip_tb
add wave /soundchip_tb/*
run 6000ms
