new_project \
         -name {soundchip} \
         -location {C:\Users\Constantin\Documents\VHDLSoundchip\designer\soundchip\soundchip_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {M2S010} \
         -name {M2S010}
enable_device \
         -name {M2S010} \
         -enable {TRUE}
save_project
close_project
