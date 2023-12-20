#set IOSTANDARD to LVCMOS33 for all ports
set_property IOSTANDARD LVCMOS33 [get_ports]

#define PACKAGE_PIN for debouncer clock
set_property PACKAGE_PIN W5 [get_ports CLK]
create_clock -add -name CLK_PIN -period 10.00 -waveform {0 5} [get_ports CLK]

#define PACKAGE_PIN for button cross
set_property PACKAGE_PIN T18 [get_ports {BTN[0]}]; # BTNU
set_property PACKAGE_PIN T17 [get_ports {BTN[1]}]; # BTNR
set_property PACKAGE_PIN U17 [get_ports {BTN[2]}]; # BTND
set_property PACKAGE_PIN W19 [get_ports {BTN[3]}]; # BTNL
set_property PACKAGE_PIN U18 [get_ports {BTN[4]}]; # BTNC

#define PACKAGE_PIN for GPIO LEDs
set_property PACKAGE_PIN U16 [get_ports {LD[0]}]
set_property PACKAGE_PIN E19 [get_ports {LD[1]}]
set_property PACKAGE_PIN U19 [get_ports {LD[2]}]
set_property PACKAGE_PIN V19 [get_ports {LD[3]}]
set_property PACKAGE_PIN W18 [get_ports {LD[4]}]
set_property PACKAGE_PIN U15 [get_ports {LD[5]}]
set_property PACKAGE_PIN U14 [get_ports {LD[6]}]
set_property PACKAGE_PIN V14 [get_ports {LD[7]}]
set_property PACKAGE_PIN V13 [get_ports {LD[8]}]
set_property PACKAGE_PIN V3  [get_ports {LD[9]}]
set_property PACKAGE_PIN W3  [get_ports {LD[10]}]
set_property PACKAGE_PIN U3  [get_ports {LD[11]}]
set_property PACKAGE_PIN P3  [get_ports {LD[12]}]
set_property PACKAGE_PIN N3  [get_ports {LD[13]}]
set_property PACKAGE_PIN P1  [get_ports {LD[14]}]
set_property PACKAGE_PIN L1  [get_ports {LD[15]}]

#define PACKAGE_PIN for GPIO Switches
set_property PACKAGE_PIN V17 [get_ports {SW[0]}]
set_property PACKAGE_PIN V16 [get_ports {SW[1]}]
set_property PACKAGE_PIN W16 [get_ports {SW[2]}]
set_property PACKAGE_PIN W17 [get_ports {SW[3]}]
set_property PACKAGE_PIN W15 [get_ports {SW[4]}]
set_property PACKAGE_PIN V15 [get_ports {SW[5]}]
set_property PACKAGE_PIN W14 [get_ports {SW[6]}]
set_property PACKAGE_PIN W13 [get_ports {SW[7]}]
set_property PACKAGE_PIN V2  [get_ports {SW[8]}]
set_property PACKAGE_PIN T3  [get_ports {SW[9]}]
set_property PACKAGE_PIN T2  [get_ports {SW[10]}]
set_property PACKAGE_PIN R3  [get_ports {SW[11]}]
set_property PACKAGE_PIN W2  [get_ports {SW[12]}]
set_property PACKAGE_PIN U1  [get_ports {SW[13]}]
set_property PACKAGE_PIN T1  [get_ports {SW[14]}]
set_property PACKAGE_PIN R2  [get_ports {SW[15]}]

#define PACKAGE_PIN for 7 segment parts
set_property PACKAGE_PIN W7 [get_ports {DISP_CAT[0]}]; # CA
set_property PACKAGE_PIN W6 [get_ports {DISP_CAT[1]}]; # CB
set_property PACKAGE_PIN U8 [get_ports {DISP_CAT[2]}]; # CC
set_property PACKAGE_PIN V8 [get_ports {DISP_CAT[3]}]; # CD
set_property PACKAGE_PIN U5 [get_ports {DISP_CAT[4]}]; # CE
set_property PACKAGE_PIN V5 [get_ports {DISP_CAT[5]}]; # CF
set_property PACKAGE_PIN U7 [get_ports {DISP_CAT[6]}]; # CG
set_property PACKAGE_PIN V7 [get_ports {DISP_CAT[7]}]; # DP

#define PACKAGE_PIN for 7 segment selectors
set_property PACKAGE_PIN W4 [get_ports {DISP_AN[3]}]
set_property PACKAGE_PIN V4 [get_ports {DISP_AN[2]}]
set_property PACKAGE_PIN U4 [get_ports {DISP_AN[1]}]
set_property PACKAGE_PIN U2 [get_ports {DISP_AN[0]}]
