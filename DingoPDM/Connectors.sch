EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 12 16
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:+12V #PWR?
U 1 1 5F5B6666
P 900 1100
AR Path="/5F5B6666" Ref="#PWR?"  Part="1" 
AR Path="/5F5B308F/5F5B6666" Ref="#PWR051"  Part="1" 
F 0 "#PWR051" H 900 950 50  0001 C CNN
F 1 "+12V" H 915 1273 50  0000 C CNN
F 2 "" H 900 1100 50  0001 C CNN
F 3 "" H 900 1100 50  0001 C CNN
	1    900  1100
	1    0    0    -1  
$EndComp
Text GLabel 9500 5500 2    50   Output ~ 0
INPUT6
Text GLabel 9500 5600 2    50   Output ~ 0
INPUT5
Text GLabel 8500 4900 0    50   Output ~ 0
INPUT4
Text GLabel 8500 4800 0    50   Output ~ 0
INPUT3
Text GLabel 8500 4700 0    50   Output ~ 0
INPUT2
Text GLabel 8500 4600 0    50   Output ~ 0
INPUT1
Text GLabel 9500 5200 2    50   BiDi ~ 0
CAN_L
Text GLabel 9500 5100 2    50   BiDi ~ 0
CAN_H
Text GLabel 8500 5600 0    50   Input ~ 0
PF_OUT1
Text GLabel 9500 5000 2    50   Input ~ 0
PF_OUT12
Text GLabel 9500 4900 2    50   Input ~ 0
PF_OUT11
Text GLabel 9500 4800 2    50   Input ~ 0
PF_OUT10
Text GLabel 9500 4700 2    50   Input ~ 0
PF_OUT9
Text GLabel 9500 4600 2    50   Input ~ 0
PF_OUT8
Text GLabel 9500 4500 2    50   Input ~ 0
PF_OUT7
$Comp
L RedCube:RedCubeTerminal J?
U 1 1 5F5B6660
P 900 1250
AR Path="/5F5B6660" Ref="J?"  Part="1" 
AR Path="/5F5B308F/5F5B6660" Ref="J1"  Part="1" 
F 0 "J1" V 1100 1150 50  0000 L CNN
F 1 "RedCubeTerminal" V 900 1450 50  0000 L CNN
F 2 "RedCube:M6_Hole_8Pin_7461084" H 900 1250 50  0001 C CNN
F 3 "" H 900 1250 50  0001 C CNN
F 4 "732-3203-ND" H 900 1250 50  0001 C CNN "Digi-Key_PN"
	1    900  1250
	0    1    1    0   
$EndComp
Text Notes 1975 2075 2    50   ~ 10
Battery Lug
Text Notes 7550 4150 2    50   ~ 10
DTM Connector
Text GLabel 8500 5500 0    50   Input ~ 0
PF_OUT2
Text GLabel 8500 5400 0    50   Input ~ 0
PF_OUT3
Text GLabel 8500 5300 0    50   Input ~ 0
PF_OUT4
Text GLabel 8500 5200 0    50   Input ~ 0
PF_OUT5
Text GLabel 8500 5100 0    50   Input ~ 0
PF_OUT6
$Comp
L Deutsch_DTM:DTM1312PA12PBR008 J?
U 1 1 5F5B6699
P 9000 5000
AR Path="/5F5B6699" Ref="J?"  Part="1" 
AR Path="/5F5B308F/5F5B6699" Ref="J3"  Part="1" 
F 0 "J3" H 9000 5765 50  0000 C CNN
F 1 "DTM1312PA12PBR008" H 9000 5674 50  0000 C CNN
F 2 "Deutsch_DTM:TE_DTM1312PA12PBR008" H 9000 5000 50  0001 L BNN
F 3 "TE Connectivity" H 9000 5000 50  0001 L BNN
F 4 "https://www.snapeda.com/parts/DTM1312PA12PBR008/TE%20Connectivity/datasheet/" H 9050 4700 50  0001 L BNN "Field4"
F 5 "Compliant" H 9000 5000 50  0001 L BNN "Field5"
F 6 "18.76 USD" H 9000 5000 50  0001 L BNN "Field6"
F 7 "Good" H 9000 5000 50  0001 L BNN "Field7"
F 8 "Manufacturer recommendation" H 9000 5000 50  0001 L BNN "Field8"
F 9 "E" H 9000 5000 50  0001 L BNN "Field9"
F 10 "Double Header 24 pin receptacle" H 9000 5000 50  0001 L BNN "Field10"
F 11 "None" H 9000 5000 50  0001 L BNN "Field11"
F 12 "DTM1312PA12PBR008" H 9000 5000 50  0001 L BNN "Field12"
F 13 "1734-1131-ND" H 9000 5000 50  0001 C CNN "Digi-Key_PN"
	1    9000 5000
	1    0    0    -1  
$EndComp
$Comp
L DingoPDM-rescue:M3-MountingHoles H1
U 1 1 5F634049
P 1025 3100
AR Path="/5F634049" Ref="H1"  Part="1" 
AR Path="/5F5B308F/5F634049" Ref="H1"  Part="1" 
F 0 "H1" H 1103 3146 50  0000 L CNN
F 1 "M3" H 1103 3055 50  0000 L CNN
F 2 "MountingHole:MountingHole_3mm_Pad" H 875 3300 50  0001 C CNN
F 3 "" H 875 3300 50  0001 C CNN
	1    1025 3100
	1    0    0    -1  
$EndComp
$Comp
L DingoPDM-rescue:M3-MountingHoles H2
U 1 1 5F6343FE
P 1375 3100
AR Path="/5F6343FE" Ref="H2"  Part="1" 
AR Path="/5F5B308F/5F6343FE" Ref="H2"  Part="1" 
F 0 "H2" H 1453 3146 50  0000 L CNN
F 1 "M3" H 1453 3055 50  0000 L CNN
F 2 "MountingHole:MountingHole_3mm_Pad" H 1225 3300 50  0001 C CNN
F 3 "" H 1225 3300 50  0001 C CNN
	1    1375 3100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR057
U 1 1 5F608485
P 4400 5350
F 0 "#PWR057" H 4400 5200 50  0001 C CNN
F 1 "+5V" H 4415 5523 50  0000 C CNN
F 2 "" H 4400 5350 50  0001 C CNN
F 3 "" H 4400 5350 50  0001 C CNN
	1    4400 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D39
U 1 1 5F60C1B9
P 4075 5350
F 0 "D39" H 4075 5133 50  0000 C CNN
F 1 "Schottky" H 4075 5224 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" H 4075 5350 50  0001 C CNN
F 3 "~" H 4075 5350 50  0001 C CNN
F 4 "1727-2394-1-ND" H 4075 5350 50  0001 C CNN "Digi-Key_PN"
	1    4075 5350
	-1   0    0    1   
$EndComp
Wire Wire Line
	4400 5350 4225 5350
$Comp
L power:GND #PWR?
U 1 1 5F62A8B5
P 2200 6850
AR Path="/5F62A8B5" Ref="#PWR?"  Part="1" 
AR Path="/5F5B308F/5F62A8B5" Ref="#PWR053"  Part="1" 
F 0 "#PWR053" H 2200 6600 50  0001 C CNN
F 1 "GND" H 2205 6677 50  0000 C CNN
F 2 "" H 2200 6850 50  0001 C CNN
F 3 "" H 2200 6850 50  0001 C CNN
	1    2200 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F62ACFF
P 2500 6850
AR Path="/5F62ACFF" Ref="#PWR?"  Part="1" 
AR Path="/5F5B308F/5F62ACFF" Ref="#PWR054"  Part="1" 
F 0 "#PWR054" H 2500 6600 50  0001 C CNN
F 1 "GND" H 2505 6677 50  0000 C CNN
F 2 "" H 2500 6850 50  0001 C CNN
F 3 "" H 2500 6850 50  0001 C CNN
	1    2500 6850
	1    0    0    -1  
$EndComp
Text GLabel 5175 6050 2    50   BiDi ~ 0
USB_D+
Text GLabel 3475 5850 2    50   BiDi ~ 0
USB_D-
Wire Wire Line
	3100 5850 3175 5850
Wire Wire Line
	3100 6050 3175 6050
$Comp
L Device:R_Small_US R?
U 1 1 5F84C08E
P 4775 5900
AR Path="/5F84C08E" Ref="R?"  Part="1" 
AR Path="/5F5B308F/5F84C08E" Ref="R88"  Part="1" 
F 0 "R88" H 4843 5946 50  0000 L CNN
F 1 "1.5K" H 4843 5855 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 4775 5900 50  0001 C CNN
F 3 "~" H 4775 5900 50  0001 C CNN
F 4 "311-1.50KCRCT-ND" H 4775 5900 50  0001 C CNN "Digi-Key_PN"
	1    4775 5900
	1    0    0    1   
$EndComp
Wire Wire Line
	4775 6000 4775 6050
Connection ~ 4775 6050
Wire Wire Line
	4775 6050 5175 6050
Wire Wire Line
	4850 5600 4775 5600
Wire Wire Line
	4775 5600 4775 5800
Text GLabel 4850 5600 2    50   Input ~ 0
USB_PULLUP
$Comp
L Connector:TestPoint TP11
U 1 1 5F9AC729
P 3325 5775
F 0 "TP11" H 3383 5893 50  0000 L CNN
F 1 "USB_D-" H 3383 5802 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5000-5004_Miniature" H 3525 5775 50  0001 C CNN
F 3 "~" H 3525 5775 50  0001 C CNN
	1    3325 5775
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP12
U 1 1 5F9AF556
P 3975 5975
F 0 "TP12" H 4033 6093 50  0000 L CNN
F 1 "USB_D+" H 4033 6002 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5000-5004_Miniature" H 4175 5975 50  0001 C CNN
F 3 "~" H 4175 5975 50  0001 C CNN
	1    3975 5975
	1    0    0    -1  
$EndComp
Wire Wire Line
	3975 5975 3975 6050
Connection ~ 3975 6050
Wire Wire Line
	3975 6050 4475 6050
Wire Wire Line
	3325 5775 3325 5850
Connection ~ 3325 5850
Wire Wire Line
	3325 5850 3475 5850
$Comp
L Device:R_Small_US R?
U 1 1 5F89485F
P 3900 4625
AR Path="/5F89485F" Ref="R?"  Part="1" 
AR Path="/5F5B308F/5F89485F" Ref="R90"  Part="1" 
F 0 "R90" H 3968 4671 50  0000 L CNN
F 1 "4.7K" H 3968 4580 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 3900 4625 50  0001 C CNN
F 3 "~" H 3900 4625 50  0001 C CNN
F 4 "311-4.70KCRCT-ND" H 3900 4625 50  0001 C CNN "Digi-Key_PN"
	1    3900 4625
	1    0    0    1   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5F89527E
P 3675 4525
AR Path="/5F89527E" Ref="R?"  Part="1" 
AR Path="/5F5B308F/5F89527E" Ref="R89"  Part="1" 
F 0 "R89" H 3743 4571 50  0000 L CNN
F 1 "4.7K" H 3743 4480 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 3675 4525 50  0001 C CNN
F 3 "~" H 3675 4525 50  0001 C CNN
F 4 "311-4.70KCRCT-ND" H 3675 4525 50  0001 C CNN "Digi-Key_PN"
	1    3675 4525
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F897339
P 3900 4800
AR Path="/5F897339" Ref="#PWR?"  Part="1" 
AR Path="/5F5B308F/5F897339" Ref="#PWR0171"  Part="1" 
F 0 "#PWR0171" H 3900 4550 50  0001 C CNN
F 1 "GND" H 3905 4627 50  0000 C CNN
F 2 "" H 3900 4800 50  0001 C CNN
F 3 "" H 3900 4800 50  0001 C CNN
	1    3900 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 5350 3300 5350
Wire Wire Line
	3575 4525 3300 4525
Wire Wire Line
	3300 4525 3300 5350
Connection ~ 3300 5350
Wire Wire Line
	3300 5350 3925 5350
Wire Wire Line
	3775 4525 3900 4525
Wire Wire Line
	3900 4725 3900 4800
Text GLabel 4275 4525 2    50   Output ~ 0
USB_VBUS
Wire Wire Line
	3900 4525 4275 4525
Connection ~ 3900 4525
Text GLabel 8500 4500 0    50   Output ~ 0
12V_SW
$Comp
L power:GND #PWR?
U 1 1 5FB3ABD1
P 7950 5000
AR Path="/5FB3ABD1" Ref="#PWR?"  Part="1" 
AR Path="/5F5B308F/5FB3ABD1" Ref="#PWR0175"  Part="1" 
F 0 "#PWR0175" H 7950 4750 50  0001 C CNN
F 1 "GND" H 7955 4827 50  0000 C CNN
F 2 "" H 7950 5000 50  0001 C CNN
F 3 "" H 7950 5000 50  0001 C CNN
	1    7950 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 5000 8500 5000
$Comp
L Device:R_Small_US R?
U 1 1 5FABA73B
P 4475 5900
AR Path="/5FABA73B" Ref="R?"  Part="1" 
AR Path="/5F5B308F/5FABA73B" Ref="R107"  Part="1" 
F 0 "R107" H 4543 5946 50  0000 L CNN
F 1 "1.5K" H 4543 5855 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 4475 5900 50  0001 C CNN
F 3 "~" H 4475 5900 50  0001 C CNN
F 4 "311-1.50KCRCT-ND" H 4475 5900 50  0001 C CNN "Digi-Key_PN"
	1    4475 5900
	1    0    0    1   
$EndComp
Wire Wire Line
	4475 6000 4475 6050
Connection ~ 4475 6050
Wire Wire Line
	4475 6050 4775 6050
Text GLabel 4850 5475 2    50   Input ~ 0
BOOT_PULLUP
Wire Wire Line
	4850 5475 4475 5475
Wire Wire Line
	4475 5475 4475 5800
$Comp
L Connector:USB_C_Receptacle_USB2.0 J2
U 1 1 5FA67060
P 2500 5950
AR Path="/5FA67060" Ref="J2"  Part="1" 
AR Path="/5F5B308F/5FA67060" Ref="J2"  Part="1" 
F 0 "J2" H 2607 6817 50  0000 C CNN
F 1 "USB_C_Receptacle_USB2.0" H 2607 6726 50  0000 C CNN
F 2 "Connector_USB:USB_C_Receptacle_GCT_USB4085" H 2650 5950 50  0001 C CNN
F 3 "https://www.usb.org/sites/default/files/documents/usb_type-c.zip" H 2650 5950 50  0001 C CNN
F 4 "2073-USB4085-GF-ACT-ND" H 2500 5950 50  0001 C CNN "Digi-Key_PN"
	1    2500 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 5950 3175 5950
Wire Wire Line
	3175 5950 3175 5850
Connection ~ 3175 5850
Wire Wire Line
	3175 5850 3325 5850
Wire Wire Line
	3100 6150 3175 6150
Wire Wire Line
	3175 6150 3175 6050
Connection ~ 3175 6050
Wire Wire Line
	3175 6050 3975 6050
NoConn ~ 3100 5550
NoConn ~ 3100 5650
NoConn ~ 3100 6450
NoConn ~ 3100 6550
Text GLabel 9500 5400 2    50   Output ~ 0
INPUT7
Text GLabel 9500 5300 2    50   Output ~ 0
INPUT8
Wire Notes Line
	475  4000 11200 4000
Text Notes 6850 4150 2    50   ~ 10
USB C Connector
Wire Notes Line
	2025 4000 2025 475 
Wire Notes Line
	2025 2175 475  2175
Text Notes 1975 2300 2    50   ~ 10
Mounting Holes
Wire Notes Line
	6950 475  6950 6550
$EndSCHEMATC
