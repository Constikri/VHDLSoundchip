open_project -project {C:\Users\Constantin\Documents\VHDLSoundchip\designer\soundchip\soundchip_fp\soundchip.pro}\
         -connect_programmers {FALSE}
load_programming_data \
    -name {M2S010} \
    -fpga {C:\Users\Constantin\Documents\VHDLSoundchip\designer\soundchip\soundchip.map} \
    -header {C:\Users\Constantin\Documents\VHDLSoundchip\designer\soundchip\soundchip.hdr} \
    -spm {C:\Users\Constantin\Documents\VHDLSoundchip\designer\soundchip\soundchip.spm} \
    -dca {C:\Users\Constantin\Documents\VHDLSoundchip\designer\soundchip\soundchip.dca}
export_single_stapl \
    -name {M2S010} \
    -file {C:\Users\Constantin\Documents\VHDLSoundchip\designer\soundchip\export\soundchip.stp} \
    -secured

export_single_ppd \
    -name {M2S010} \
    -file {C:\Users\Constantin\Documents\VHDLSoundchip\designer\soundchip\export\soundchip.ppd}

export_single_svf \
    -name {M2S010} \
    -file {C:\Users\Constantin\Documents\VHDLSoundchip\designer\soundchip\export\soundchip} \
    -secured

export_single_dat \
    -name {M2S010} \
    -file {C:\Users\Constantin\Documents\VHDLSoundchip\designer\soundchip\export\soundchip.dat} \
    -secured

export_spi_master \
    -name {M2S010} \
    -file {C:\Users\Constantin\Documents\VHDLSoundchip\designer\soundchip\export\soundchip.spi} \
    -secured

save_project
close_project
