# Written by Synplify Pro version map202109act, Build 055R. Synopsys Run ID: sid1657480686 
# Top Level Design Parameters 

# Clocks 
create_clock -period 20.000 -waveform {0.000 10.000} -name {OSC_C0_0/OSC_C0_0/I_RCOSC_25_50MHZ/CLKOUT} [get_pins {OSC_C0_0/OSC_C0_0/I_RCOSC_25_50MHZ/CLKOUT}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {FCCC_C0_FCCC_C0_0_FCCC|GL0_net_inferred_clock} [get_pins {FCCC_C0_0/FCCC_C0_0/CCC_INST/GL0}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {FCCC_C0_FCCC_C0_0_FCCC|GL1_net_inferred_clock} [get_pins {FCCC_C0_0/FCCC_C0_0/CCC_INST/GL1}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {SPI_SLAVE|DOUT_VLD_inferred_clock} [get_pins {SPI_SLAVE_0/DOUT_VLD/Y}] 

# Virtual Clocks 

# Generated Clocks 

# Paths Between Clocks 

# Multicycle Constraints 

# Point-to-point Delay Constraints 

# False Path Constraints 
set_false_path -through [get_pins {SYSRESET_0/POWER_ON_RESET_N}] 

# Output Load Constraints 

# Driving Cell Constraints 

# Input Delay Constraints 

# Output Delay Constraints 

# Wire Loads 

# Other Constraints 

# syn_hier Attributes 

# set_case Attributes 

# Clock Delay Constraints 
set_clock_groups -asynchronous -group [get_clocks {FCCC_C0_FCCC_C0_0_FCCC|GL0_net_inferred_clock}]
set_clock_groups -asynchronous -group [get_clocks {FCCC_C0_FCCC_C0_0_FCCC|GL1_net_inferred_clock}]
set_clock_groups -asynchronous -group [get_clocks {SPI_SLAVE|DOUT_VLD_inferred_clock}]

# syn_mode Attributes 

# Cells 

# Port DRC Rules 

# Input Transition Constraints 

# Unused constraints (intentionally commented out) 


# Non-forward-annotatable constraints (intentionally commented out) 

# Block Path constraints 

