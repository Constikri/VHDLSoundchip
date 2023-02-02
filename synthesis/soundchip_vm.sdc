# Written by Synplify Pro version map202109actsp1, Build 056R. Synopsys Run ID: sid1674824129 
# Top Level Design Parameters 

# Clocks 
create_clock -period 20.000 -waveform {0.000 10.000} -name {OSC_0} [get_pins {OSC_C0_0/OSC_C0_0/I_RCOSC_25_50MHZ/CLKOUT}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {spi_slave|SPI_DONE_inferred_clock} [get_pins {spi_slave_0/SPI_DONE/Q}] 

# Virtual Clocks 

# Generated Clocks 
create_generated_clock -name {FCCC_C0_0} -add -multiply_by {6} -master_clock [get_clocks {OSC_0}] -source [get_pins {FCCC_C0_0/FCCC_C0_0/CCC_INST/RCOSC_25_50MHZ}]  [get_pins {FCCC_C0_0/FCCC_C0_0/CCC_INST/GL0}] 

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
set_clock_groups -asynchronous -group [get_clocks {spi_slave|SPI_DONE_inferred_clock}]

# syn_mode Attributes 

# Cells 

# Port DRC Rules 

# Input Transition Constraints 

# Unused constraints (intentionally commented out) 


# Non-forward-annotatable constraints (intentionally commented out) 

# Block Path constraints 

