EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 16
Title "Dingo_PDM"
Date "2020-11-24"
Rev "v3"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 "Cory Grant"
$EndDescr
$Sheet
S 10050 700  900  850 
U 5F54B02A
F0 "HighCurrentDrivers" 50
F1 "HighCurrentDrivers.sch" 50
$EndSheet
$Sheet
S 10050 1950 900  850 
U 5F54BF48
F0 "LowCurrentDrivers" 50
F1 "LowCurrentDrivers.sch" 50
$EndSheet
Text Notes 5225 4750 0    50   ~ 10
Microcontroller
$Sheet
S 600  1825 900  850 
U 5F5B308F
F0 "Connectors" 50
F1 "Connectors.sch" 50
$EndSheet
$Sheet
S 600  625  900  850 
U 5F5CF2EB
F0 "Power" 50
F1 "Power.sch" 50
$EndSheet
Text GLabel 6425 2650 2    50   BiDi ~ 0
CAN_H
Text GLabel 6425 2750 2    50   BiDi ~ 0
CAN_L
Wire Wire Line
	6425 2750 6325 2750
Wire Wire Line
	6425 2650 6325 2650
$Comp
L Device:R_Small_US R57
U 1 1 5F5A2652
P 3325 4200
F 0 "R57" H 3393 4246 50  0000 L CNN
F 1 "47k" H 3393 4155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 3325 4200 50  0001 C CNN
F 3 "~" H 3325 4200 50  0001 C CNN
F 4 "311-47.0KCRCT-ND" H 3325 4200 50  0001 C CNN "Digi-Key_PN"
	1    3325 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R58
U 1 1 5F5A2A39
P 3325 4700
F 0 "R58" H 3393 4746 50  0000 L CNN
F 1 "10k" H 3393 4655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 3325 4700 50  0001 C CNN
F 3 "~" H 3325 4700 50  0001 C CNN
F 4 "311-10.0KCRDKR-ND" H 3325 4700 50  0001 C CNN "Digi-Key_PN"
	1    3325 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener_Small D36
U 1 1 5F5A2D00
P 4075 4700
F 0 "D36" V 4029 4770 50  0000 L CNN
F 1 "3.3V" V 4120 4770 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" V 4075 4700 50  0001 C CNN
F 3 "~" V 4075 4700 50  0001 C CNN
F 4 "SZMMSZ4684T1GOSCT-ND" H 4075 4700 50  0001 C CNN "Digi-Key_PN"
	1    4075 4700
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C38
U 1 1 5F5A32B6
P 3675 4700
F 0 "C38" H 3767 4746 50  0000 L CNN
F 1 "100nF" H 3767 4655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3675 4700 50  0001 C CNN
F 3 "~" H 3675 4700 50  0001 C CNN
F 4 "478-1395-1-ND" H 3675 4700 50  0001 C CNN "Digi-Key_PN"
	1    3675 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0103
U 1 1 5F5A3642
P 3325 4050
F 0 "#PWR0103" H 3325 3900 50  0001 C CNN
F 1 "+12V" H 3340 4223 50  0000 C CNN
F 2 "" H 3325 4050 50  0001 C CNN
F 3 "" H 3325 4050 50  0001 C CNN
	1    3325 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3325 4050 3325 4100
$Comp
L power:GND #PWR0107
U 1 1 5F5A3BFC
P 3325 4800
F 0 "#PWR0107" H 3325 4550 50  0001 C CNN
F 1 "GND" H 3330 4627 50  0000 C CNN
F 2 "" H 3325 4800 50  0001 C CNN
F 3 "" H 3325 4800 50  0001 C CNN
	1    3325 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5F5A3EEB
P 3675 4800
F 0 "#PWR0109" H 3675 4550 50  0001 C CNN
F 1 "GND" H 3680 4627 50  0000 C CNN
F 2 "" H 3675 4800 50  0001 C CNN
F 3 "" H 3675 4800 50  0001 C CNN
	1    3675 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0134
U 1 1 5F5A407F
P 4075 4800
F 0 "#PWR0134" H 4075 4550 50  0001 C CNN
F 1 "GND" H 4080 4627 50  0000 C CNN
F 2 "" H 4075 4800 50  0001 C CNN
F 3 "" H 4075 4800 50  0001 C CNN
	1    4075 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4625 4450 4075 4450
Wire Wire Line
	3325 4450 3325 4300
Wire Wire Line
	3325 4450 3325 4600
Connection ~ 3325 4450
Wire Wire Line
	3675 4600 3675 4450
Connection ~ 3675 4450
Wire Wire Line
	3675 4450 3325 4450
Wire Wire Line
	4075 4600 4075 4450
Connection ~ 4075 4450
Wire Wire Line
	4075 4450 3675 4450
Text GLabel 6425 2950 2    50   BiDi ~ 0
USB_D-
Text GLabel 6425 3050 2    50   BiDi ~ 0
USB_D+
Wire Wire Line
	6425 3050 6325 3050
Wire Wire Line
	6425 2950 6325 2950
Wire Wire Line
	4625 2950 4575 2950
Wire Wire Line
	4625 3050 4575 3050
Wire Wire Line
	4575 2725 4625 2725
Wire Wire Line
	4575 2625 4625 2625
$Sheet
S 575  4600 900  850 
U 5F5B7065
F0 "I2C" 50
F1 "I2C.sch" 50
$EndSheet
$Sheet
S 4625 2500 1700 2050
U 5F4DB108
F0 "MCU" 50
F1 "MCU.sch" 50
F2 "I2C2_SCL" B L 4625 3050 50 
F3 "I2C2_SDA" B L 4625 2950 50 
F4 "CAN_H" B R 6325 2650 50 
F5 "CAN_L" B R 6325 2750 50 
F6 "USB_DM" B R 6325 2950 50 
F7 "USB_DP" B R 6325 3050 50 
F8 "BATT_SENSE" I L 4625 4450 50 
F9 "I2C1_SDA" B L 4625 2625 50 
F10 "I2C1_SCL" B L 4625 2725 50 
F11 "USB_PULLUP" O R 6325 3150 50 
F12 "USB_VBUS" I L 4625 3150 50 
F13 "BOOT_PULLUP" O R 6325 3250 50 
F14 "SYS_WKUP2" I L 4625 3500 50 
F15 "PF_GPIO_RESET" O R 6325 3750 50 
F16 "IN_GPIO_IRQ" I L 4625 3750 50 
F17 "PF_ADC2_IRQ" I L 4625 3950 50 
F18 "PF_ADC1_IRQ" I L 4625 3850 50 
F19 "CAN_TERM_RESISTOR" O L 4625 4125 50 
$EndSheet
Text GLabel 4575 3050 0    50   BiDi ~ 0
I2C2_SCL
Text GLabel 4575 2950 0    50   BiDi ~ 0
I2C2_SDA
Text GLabel 4575 2725 0    50   BiDi ~ 0
I2C1_SCL
Text GLabel 4575 2625 0    50   BiDi ~ 0
I2C1_SDA
$Comp
L DRT_Logo:DRT_Logo G1
U 1 1 5F65317D
P 10625 5950
F 0 "G1" H 10650 5996 50  0000 L CNN
F 1 "DRT_Logo" H 10650 5905 50  0000 L CNN
F 2 "DRTLogo:DRTLogo" H 10625 5950 50  0001 C CNN
F 3 "" H 10625 5950 50  0001 C CNN
	1    10625 5950
	1    0    0    -1  
$EndComp
$Comp
L DRT_Logo:DRT_Logo G2
U 1 1 5F65336D
P 10625 6225
F 0 "G2" H 10650 6271 50  0000 L CNN
F 1 "DingoFace" H 10650 6180 50  0000 L CNN
F 2 "DRTLogo:DingoFaceNoFill" H 10625 6225 50  0001 C CNN
F 3 "" H 10625 6225 50  0001 C CNN
	1    10625 6225
	1    0    0    -1  
$EndComp
Text GLabel 6425 3150 2    50   Output ~ 0
USB_PULLUP
Text GLabel 4575 3150 0    50   Input ~ 0
USB_VBUS
Wire Wire Line
	4575 3150 4625 3150
Text Notes 3425 7450 0    50   ~ 0
V3\n-Removed 5V out and 2nd ground from DTM connector (replaced with inputs)\n-FRAM VDD/VSS pins swapped to correct pinout\n-USB pullup added when in BOOT1\n-ADS1115 16bit ADC replaced with ADS1015 12bit ADC for speed\n-Replaced PCA9555 with PCA9539, no pullups and a reset input\n-Analog In replaced with Digital Inputs using PCAL9554\n-CAN term resistor switch replaced with TLP175A SSR controlled by GPIO\n-SPI CS moved to hardware NSS signal\n-Interrupt signals added to ADS1015 and PCAL9554\n-Reset signal added for PCA9539\n-Moved Extra1/3 pad signals to be USART2 compatible if needed\n-Changed Profet IS line zener to 3.3V and increased current limiting resistor to 220k\n-Test points changed to through hole and moved around to fit
Wire Wire Line
	6325 3150 6425 3150
Text GLabel 6425 3250 2    50   Output ~ 0
BOOT_PULLUP
Wire Wire Line
	6425 3250 6325 3250
Text GLabel 4575 3500 0    50   Input ~ 0
SYS_WKUP
Wire Wire Line
	4575 3500 4625 3500
Text GLabel 4575 3750 0    50   Input ~ 0
IN_GPIO_IRQ
Text GLabel 4575 3850 0    50   Input ~ 0
PF_ADC1_IRQ
Text GLabel 4575 3950 0    50   Input ~ 0
PF_ADC2_IRQ
Wire Wire Line
	4575 3950 4625 3950
Wire Wire Line
	4575 3850 4625 3850
Wire Wire Line
	4575 3750 4625 3750
Text GLabel 6425 3750 2    50   Output ~ 0
PF_GPIO_RESET
Wire Wire Line
	6425 3750 6325 3750
Text GLabel 4575 4125 0    50   Input ~ 0
CAN_TERM_RESISTOR
Wire Wire Line
	4575 4125 4625 4125
Wire Notes Line
	10525 6500 10525 5825
Wire Notes Line
	10525 5825 11175 5825
$Sheet
S 575  5675 900  850 
U 605F89A8
F0 "DigitalInputs" 50
F1 "DigIn.sch" 50
$EndSheet
$EndSCHEMATC
