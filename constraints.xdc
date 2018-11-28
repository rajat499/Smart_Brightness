## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
#Bank = 34, Pin name = ,					Sch name = CLK100MHZ
		set_property PACKAGE_PIN W5 [get_ports finalInputClock]
		set_property IOSTANDARD LVCMOS33 [get_ports finalInputClock]
		create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports finalInputClock]

# Switches
set_property PACKAGE_PIN R2 [get_ports mode]
set_property IOSTANDARD LVCMOS33 [get_ports mode]

#set_property PACKAGE_PIN V17 [get_ports incs]
#set_property IOSTANDARD LVCMOS33 [get_ports incs]

set_property PACKAGE_PIN K17 [get_ports CS]
set_property IOSTANDARD LVCMOS33 [get_ports CS]

set_property PACKAGE_PIN P18 [get_ports SCK]
set_property IOSTANDARD LVCMOS33 [get_ports SCK]

set_property PACKAGE_PIN N17 [get_ports sdoFromBoard]
set_property IOSTANDARD LVCMOS33 [get_ports sdoFromBoard]

# LEDs
set_property PACKAGE_PIN U16 [get_ports {output[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output[0]}]

set_property PACKAGE_PIN E19 [get_ports {output[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output[1]}]

set_property PACKAGE_PIN U19 [get_ports {output[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output[2]}]

set_property PACKAGE_PIN V19 [get_ports {output[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output[3]}]

set_property PACKAGE_PIN W18 [get_ports {output[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output[4]}]

set_property PACKAGE_PIN U15 [get_ports {output[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output[5]}]

set_property PACKAGE_PIN U14 [get_ports {output[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output[6]}]

set_property PACKAGE_PIN V14 [get_ports {output[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output[7]}]

set_property PACKAGE_PIN V13 [get_ports {output[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output[8]}]

set_property PACKAGE_PIN V3 [get_ports {output[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output[9]}]

set_property PACKAGE_PIN W3 [get_ports {output[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output[10]}]

set_property PACKAGE_PIN U3 [get_ports {output[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output[11]}]

set_property PACKAGE_PIN P3 [get_ports {output[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output[12]}]

set_property PACKAGE_PIN N3 [get_ports {output[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output[13]}]

set_property PACKAGE_PIN P1 [get_ports {output[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output[14]}]

set_property PACKAGE_PIN L1 [get_ports {output[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {output[15]}]


#seven_segment
set_property PACKAGE_PIN W7 [get_ports {cathode[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cathode[0]}]
set_property PACKAGE_PIN W6 [get_ports {cathode[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cathode[1]}]
set_property PACKAGE_PIN U8 [get_ports {cathode[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cathode[2]}]
set_property PACKAGE_PIN V8 [get_ports {cathode[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cathode[3]}]
set_property PACKAGE_PIN U5 [get_ports {cathode[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cathode[4]}]
set_property PACKAGE_PIN V5 [get_ports {cathode[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cathode[5]}]
set_property PACKAGE_PIN U7 [get_ports {cathode[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {cathode[6]}]

#set_property PACKAGE_PIN V7 [get_ports dp]							
	#set_property IOSTANDARD LVCMOS33 [get_ports dp]

set_property PACKAGE_PIN W4 [get_ports {anode[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[0]}]
set_property PACKAGE_PIN V4 [get_ports {anode[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[1]}]
set_property PACKAGE_PIN U4 [get_ports {anode[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[2]}]
set_property PACKAGE_PIN U2 [get_ports {anode[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anode[3]}]

# Others (BITSTREAM, CONFIG)
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]

set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]


