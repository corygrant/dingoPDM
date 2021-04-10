EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 17 17
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
L Memory_FRAM:MB85RC256V U?
U 1 1 5F66182A
P 1775 6500
AR Path="/5F66182A" Ref="U?"  Part="1" 
AR Path="/5F5B7065/5F66182A" Ref="U?"  Part="1" 
AR Path="/5F6489A2/5F66182A" Ref="U?"  Part="1" 
F 0 "U?" H 2153 6659 50  0000 L CNN
F 1 "MB85RC256V" H 2153 6568 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 1775 6500 50  0001 C CNN
F 3 "" H 1775 6500 50  0001 C CNN
	1    1775 6500
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5F661830
P 1775 5950
AR Path="/5F5B7065/5F661830" Ref="#PWR?"  Part="1" 
AR Path="/5F6489A2/5F661830" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1775 5800 50  0001 C CNN
F 1 "+3V3" H 1790 6123 50  0000 C CNN
F 2 "" H 1775 5950 50  0001 C CNN
F 3 "" H 1775 5950 50  0001 C CNN
	1    1775 5950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F661836
P 1775 7100
AR Path="/5F5B7065/5F661836" Ref="#PWR?"  Part="1" 
AR Path="/5F6489A2/5F661836" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1775 6850 50  0001 C CNN
F 1 "GND" H 1780 6927 50  0000 C CNN
F 2 "" H 1775 7100 50  0001 C CNN
F 3 "" H 1775 7100 50  0001 C CNN
	1    1775 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1775 7000 1775 7050
Wire Wire Line
	1325 6800 1175 6800
Wire Wire Line
	1175 6800 1175 7050
Connection ~ 1775 7050
Wire Wire Line
	1775 7050 1775 7100
Wire Wire Line
	1325 6400 1175 6400
Wire Wire Line
	1175 6400 1175 6500
Connection ~ 1175 6800
Wire Wire Line
	1325 6500 1175 6500
Connection ~ 1175 6500
Wire Wire Line
	1175 6500 1175 6600
Wire Wire Line
	1325 6600 1175 6600
Connection ~ 1175 6600
Wire Wire Line
	1175 6600 1175 6800
Text HLabel 1325 6250 0    50   Input ~ 0
SCL
Text HLabel 1325 6150 0    50   Input ~ 0
SDA
Text Notes 875  6550 0    50   ~ 0
ADDR\n0X50
Text Notes 4175 6775 2    50   ~ 10
Memory FRAM
$Comp
L Device:C_Small C?
U 1 1 5F66184F
P 3075 6500
AR Path="/5F5B7065/5F66184F" Ref="C?"  Part="1" 
AR Path="/5F6489A2/5F66184F" Ref="C?"  Part="1" 
F 0 "C?" H 3167 6546 50  0000 L CNN
F 1 "100nF" H 3167 6455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3075 6500 50  0001 C CNN
F 3 "~" H 3075 6500 50  0001 C CNN
	1    3075 6500
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5F661855
P 3075 6400
AR Path="/5F5B7065/5F661855" Ref="#PWR?"  Part="1" 
AR Path="/5F6489A2/5F661855" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3075 6250 50  0001 C CNN
F 1 "+3V3" H 3090 6573 50  0000 C CNN
F 2 "" H 3075 6400 50  0001 C CNN
F 3 "" H 3075 6400 50  0001 C CNN
	1    3075 6400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F66185B
P 3075 6600
AR Path="/5F5B7065/5F66185B" Ref="#PWR?"  Part="1" 
AR Path="/5F6489A2/5F66185B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3075 6350 50  0001 C CNN
F 1 "GND" H 3080 6427 50  0000 C CNN
F 2 "" H 3075 6600 50  0001 C CNN
F 3 "" H 3075 6600 50  0001 C CNN
	1    3075 6600
	1    0    0    -1  
$EndComp
Text HLabel 7950 1900 0    50   Input ~ 0
SCL
Text HLabel 7950 2000 0    50   Input ~ 0
SDA
$Comp
L power:+3V3 #PWR?
U 1 1 5F6837FC
P 8450 1600
AR Path="/5F5B7065/5F6837FC" Ref="#PWR?"  Part="1" 
AR Path="/5F6489A2/5F6837FC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8450 1450 50  0001 C CNN
F 1 "+3V3" H 8465 1773 50  0000 C CNN
F 2 "" H 8450 1600 50  0001 C CNN
F 3 "" H 8450 1600 50  0001 C CNN
	1    8450 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 1600 8450 1700
$Comp
L power:GND #PWR?
U 1 1 5F683803
P 8450 3800
AR Path="/5F5B7065/5F683803" Ref="#PWR?"  Part="1" 
AR Path="/5F6489A2/5F683803" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8450 3550 50  0001 C CNN
F 1 "GND" H 8455 3627 50  0000 C CNN
F 2 "" H 8450 3800 50  0001 C CNN
F 3 "" H 8450 3800 50  0001 C CNN
	1    8450 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F683809
P 7700 2900
AR Path="/5F5B7065/5F683809" Ref="#PWR?"  Part="1" 
AR Path="/5F6489A2/5F683809" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7700 2650 50  0001 C CNN
F 1 "GND" H 7705 2727 50  0000 C CNN
F 2 "" H 7700 2900 50  0001 C CNN
F 3 "" H 7700 2900 50  0001 C CNN
	1    7700 2900
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5F68380F
P 7450 2650
AR Path="/5F5B7065/5F68380F" Ref="#PWR?"  Part="1" 
AR Path="/5F6489A2/5F68380F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7450 2500 50  0001 C CNN
F 1 "+3V3" H 7465 2823 50  0000 C CNN
F 2 "" H 7450 2650 50  0001 C CNN
F 3 "" H 7450 2650 50  0001 C CNN
	1    7450 2650
	1    0    0    -1  
$EndComp
Text Notes 7200 2250 0    50   ~ 0
ADDR\n0X30
Text Notes 7450 6500 2    50   ~ 10
Status LEDs
$Comp
L Device:LED_Small D?
U 1 1 5F683817
P 10350 850
AR Path="/5F5B7065/5F683817" Ref="D?"  Part="1" 
AR Path="/5F6489A2/5F683817" Ref="D?"  Part="1" 
F 0 "D?" H 10350 1085 50  0000 C CNN
F 1 "LED_Small" H 10350 994 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 10350 850 50  0001 C CNN
F 3 "~" V 10350 850 50  0001 C CNN
	1    10350 850 
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Small D?
U 1 1 5F68381D
P 10350 1150
AR Path="/5F5B7065/5F68381D" Ref="D?"  Part="1" 
AR Path="/5F6489A2/5F68381D" Ref="D?"  Part="1" 
F 0 "D?" H 10350 1385 50  0000 C CNN
F 1 "LED_Small" H 10350 1294 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 10350 1150 50  0001 C CNN
F 3 "~" V 10350 1150 50  0001 C CNN
	1    10350 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Small D?
U 1 1 5F683823
P 10350 1450
AR Path="/5F5B7065/5F683823" Ref="D?"  Part="1" 
AR Path="/5F6489A2/5F683823" Ref="D?"  Part="1" 
F 0 "D?" H 10350 1685 50  0000 C CNN
F 1 "LED_Small" H 10350 1594 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 10350 1450 50  0001 C CNN
F 3 "~" V 10350 1450 50  0001 C CNN
	1    10350 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Small D?
U 1 1 5F683829
P 10350 1750
AR Path="/5F5B7065/5F683829" Ref="D?"  Part="1" 
AR Path="/5F6489A2/5F683829" Ref="D?"  Part="1" 
F 0 "D?" H 10350 1985 50  0000 C CNN
F 1 "LED_Small" H 10350 1894 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 10350 1750 50  0001 C CNN
F 3 "~" V 10350 1750 50  0001 C CNN
	1    10350 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Small D?
U 1 1 5F68382F
P 10350 2050
AR Path="/5F5B7065/5F68382F" Ref="D?"  Part="1" 
AR Path="/5F6489A2/5F68382F" Ref="D?"  Part="1" 
F 0 "D?" H 10350 2285 50  0000 C CNN
F 1 "LED_Small" H 10350 2194 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 10350 2050 50  0001 C CNN
F 3 "~" V 10350 2050 50  0001 C CNN
	1    10350 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Small D?
U 1 1 5F683835
P 10350 2350
AR Path="/5F5B7065/5F683835" Ref="D?"  Part="1" 
AR Path="/5F6489A2/5F683835" Ref="D?"  Part="1" 
F 0 "D?" H 10350 2585 50  0000 C CNN
F 1 "LED_Small" H 10350 2494 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 10350 2350 50  0001 C CNN
F 3 "~" V 10350 2350 50  0001 C CNN
	1    10350 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Small D?
U 1 1 5F68383B
P 10350 2650
AR Path="/5F5B7065/5F68383B" Ref="D?"  Part="1" 
AR Path="/5F6489A2/5F68383B" Ref="D?"  Part="1" 
F 0 "D?" H 10350 2885 50  0000 C CNN
F 1 "LED_Small" H 10350 2794 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 10350 2650 50  0001 C CNN
F 3 "~" V 10350 2650 50  0001 C CNN
	1    10350 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Small D?
U 1 1 5F683841
P 10350 2950
AR Path="/5F5B7065/5F683841" Ref="D?"  Part="1" 
AR Path="/5F6489A2/5F683841" Ref="D?"  Part="1" 
F 0 "D?" H 10350 3185 50  0000 C CNN
F 1 "LED_Small" H 10350 3094 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 10350 2950 50  0001 C CNN
F 3 "~" V 10350 2950 50  0001 C CNN
	1    10350 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Small D?
U 1 1 5F683847
P 10350 3250
AR Path="/5F5B7065/5F683847" Ref="D?"  Part="1" 
AR Path="/5F6489A2/5F683847" Ref="D?"  Part="1" 
F 0 "D?" H 10350 3485 50  0000 C CNN
F 1 "LED_Small" H 10350 3394 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 10350 3250 50  0001 C CNN
F 3 "~" V 10350 3250 50  0001 C CNN
	1    10350 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Small D?
U 1 1 5F68384D
P 10350 3550
AR Path="/5F5B7065/5F68384D" Ref="D?"  Part="1" 
AR Path="/5F6489A2/5F68384D" Ref="D?"  Part="1" 
F 0 "D?" H 10350 3785 50  0000 C CNN
F 1 "LED_Small" H 10350 3694 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 10350 3550 50  0001 C CNN
F 3 "~" V 10350 3550 50  0001 C CNN
	1    10350 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Small D?
U 1 1 5F683853
P 10350 3850
AR Path="/5F5B7065/5F683853" Ref="D?"  Part="1" 
AR Path="/5F6489A2/5F683853" Ref="D?"  Part="1" 
F 0 "D?" H 10350 4085 50  0000 C CNN
F 1 "LED_Small" H 10350 3994 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 10350 3850 50  0001 C CNN
F 3 "~" V 10350 3850 50  0001 C CNN
	1    10350 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Small D?
U 1 1 5F683859
P 10350 4150
AR Path="/5F5B7065/5F683859" Ref="D?"  Part="1" 
AR Path="/5F6489A2/5F683859" Ref="D?"  Part="1" 
F 0 "D?" H 10350 4385 50  0000 C CNN
F 1 "LED_Small" H 10350 4294 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 10350 4150 50  0001 C CNN
F 3 "~" V 10350 4150 50  0001 C CNN
	1    10350 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Small D?
U 1 1 5F68385F
P 10350 4450
AR Path="/5F5B7065/5F68385F" Ref="D?"  Part="1" 
AR Path="/5F6489A2/5F68385F" Ref="D?"  Part="1" 
F 0 "D?" H 10350 4685 50  0000 C CNN
F 1 "LED_Small" H 10350 4594 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 10350 4450 50  0001 C CNN
F 3 "~" V 10350 4450 50  0001 C CNN
	1    10350 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Small D?
U 1 1 5F683865
P 10350 4800
AR Path="/5F5B7065/5F683865" Ref="D?"  Part="1" 
AR Path="/5F6489A2/5F683865" Ref="D?"  Part="1" 
F 0 "D?" H 10350 5035 50  0000 C CNN
F 1 "LED_Small" H 10350 4944 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 10350 4800 50  0001 C CNN
F 3 "~" V 10350 4800 50  0001 C CNN
	1    10350 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Small D?
U 1 1 5F68386B
P 10350 5100
AR Path="/5F5B7065/5F68386B" Ref="D?"  Part="1" 
AR Path="/5F6489A2/5F68386B" Ref="D?"  Part="1" 
F 0 "D?" H 10350 5335 50  0000 C CNN
F 1 "LED_Small" H 10350 5244 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 10350 5100 50  0001 C CNN
F 3 "~" V 10350 5100 50  0001 C CNN
	1    10350 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Small D?
U 1 1 5F683871
P 10350 5400
AR Path="/5F5B7065/5F683871" Ref="D?"  Part="1" 
AR Path="/5F6489A2/5F683871" Ref="D?"  Part="1" 
F 0 "D?" H 10350 5635 50  0000 C CNN
F 1 "LED_Small" H 10350 5544 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 10350 5400 50  0001 C CNN
F 3 "~" V 10350 5400 50  0001 C CNN
	1    10350 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5F683877
P 10750 850
AR Path="/5F5B7065/5F683877" Ref="R?"  Part="1" 
AR Path="/5F6489A2/5F683877" Ref="R?"  Part="1" 
F 0 "R?" V 10545 850 50  0000 C CNN
F 1 "2k" V 10636 850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10750 850 50  0001 C CNN
F 3 "~" H 10750 850 50  0001 C CNN
	1    10750 850 
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5F68387D
P 10750 1150
AR Path="/5F5B7065/5F68387D" Ref="R?"  Part="1" 
AR Path="/5F6489A2/5F68387D" Ref="R?"  Part="1" 
F 0 "R?" V 10545 1150 50  0000 C CNN
F 1 "2k" V 10636 1150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10750 1150 50  0001 C CNN
F 3 "~" H 10750 1150 50  0001 C CNN
	1    10750 1150
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5F683883
P 10750 1450
AR Path="/5F5B7065/5F683883" Ref="R?"  Part="1" 
AR Path="/5F6489A2/5F683883" Ref="R?"  Part="1" 
F 0 "R?" V 10545 1450 50  0000 C CNN
F 1 "2k" V 10636 1450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10750 1450 50  0001 C CNN
F 3 "~" H 10750 1450 50  0001 C CNN
	1    10750 1450
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5F683889
P 10750 1750
AR Path="/5F5B7065/5F683889" Ref="R?"  Part="1" 
AR Path="/5F6489A2/5F683889" Ref="R?"  Part="1" 
F 0 "R?" V 10545 1750 50  0000 C CNN
F 1 "2k" V 10636 1750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10750 1750 50  0001 C CNN
F 3 "~" H 10750 1750 50  0001 C CNN
	1    10750 1750
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5F68388F
P 10750 2050
AR Path="/5F5B7065/5F68388F" Ref="R?"  Part="1" 
AR Path="/5F6489A2/5F68388F" Ref="R?"  Part="1" 
F 0 "R?" V 10545 2050 50  0000 C CNN
F 1 "2k" V 10636 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10750 2050 50  0001 C CNN
F 3 "~" H 10750 2050 50  0001 C CNN
	1    10750 2050
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5F683895
P 10750 2350
AR Path="/5F5B7065/5F683895" Ref="R?"  Part="1" 
AR Path="/5F6489A2/5F683895" Ref="R?"  Part="1" 
F 0 "R?" V 10545 2350 50  0000 C CNN
F 1 "2k" V 10636 2350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10750 2350 50  0001 C CNN
F 3 "~" H 10750 2350 50  0001 C CNN
	1    10750 2350
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5F68389B
P 10750 2650
AR Path="/5F5B7065/5F68389B" Ref="R?"  Part="1" 
AR Path="/5F6489A2/5F68389B" Ref="R?"  Part="1" 
F 0 "R?" V 10545 2650 50  0000 C CNN
F 1 "2k" V 10636 2650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10750 2650 50  0001 C CNN
F 3 "~" H 10750 2650 50  0001 C CNN
	1    10750 2650
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5F6838A1
P 10750 2950
AR Path="/5F5B7065/5F6838A1" Ref="R?"  Part="1" 
AR Path="/5F6489A2/5F6838A1" Ref="R?"  Part="1" 
F 0 "R?" V 10545 2950 50  0000 C CNN
F 1 "2k" V 10636 2950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10750 2950 50  0001 C CNN
F 3 "~" H 10750 2950 50  0001 C CNN
	1    10750 2950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5F6838A7
P 10750 3250
AR Path="/5F5B7065/5F6838A7" Ref="R?"  Part="1" 
AR Path="/5F6489A2/5F6838A7" Ref="R?"  Part="1" 
F 0 "R?" V 10545 3250 50  0000 C CNN
F 1 "2k" V 10636 3250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10750 3250 50  0001 C CNN
F 3 "~" H 10750 3250 50  0001 C CNN
	1    10750 3250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5F6838AD
P 10750 3550
AR Path="/5F5B7065/5F6838AD" Ref="R?"  Part="1" 
AR Path="/5F6489A2/5F6838AD" Ref="R?"  Part="1" 
F 0 "R?" V 10545 3550 50  0000 C CNN
F 1 "2k" V 10636 3550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10750 3550 50  0001 C CNN
F 3 "~" H 10750 3550 50  0001 C CNN
	1    10750 3550
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5F6838B3
P 10750 3850
AR Path="/5F5B7065/5F6838B3" Ref="R?"  Part="1" 
AR Path="/5F6489A2/5F6838B3" Ref="R?"  Part="1" 
F 0 "R?" V 10545 3850 50  0000 C CNN
F 1 "2k" V 10636 3850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10750 3850 50  0001 C CNN
F 3 "~" H 10750 3850 50  0001 C CNN
	1    10750 3850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5F6838B9
P 10750 4150
AR Path="/5F5B7065/5F6838B9" Ref="R?"  Part="1" 
AR Path="/5F6489A2/5F6838B9" Ref="R?"  Part="1" 
F 0 "R?" V 10545 4150 50  0000 C CNN
F 1 "2k" V 10636 4150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10750 4150 50  0001 C CNN
F 3 "~" H 10750 4150 50  0001 C CNN
	1    10750 4150
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5F6838BF
P 10750 4450
AR Path="/5F5B7065/5F6838BF" Ref="R?"  Part="1" 
AR Path="/5F6489A2/5F6838BF" Ref="R?"  Part="1" 
F 0 "R?" V 10545 4450 50  0000 C CNN
F 1 "2k" V 10636 4450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10750 4450 50  0001 C CNN
F 3 "~" H 10750 4450 50  0001 C CNN
	1    10750 4450
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5F6838C5
P 10750 4800
AR Path="/5F5B7065/5F6838C5" Ref="R?"  Part="1" 
AR Path="/5F6489A2/5F6838C5" Ref="R?"  Part="1" 
F 0 "R?" V 10545 4800 50  0000 C CNN
F 1 "2k" V 10636 4800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10750 4800 50  0001 C CNN
F 3 "~" H 10750 4800 50  0001 C CNN
	1    10750 4800
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5F6838CB
P 10750 5100
AR Path="/5F5B7065/5F6838CB" Ref="R?"  Part="1" 
AR Path="/5F6489A2/5F6838CB" Ref="R?"  Part="1" 
F 0 "R?" V 10545 5100 50  0000 C CNN
F 1 "2k" V 10636 5100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10750 5100 50  0001 C CNN
F 3 "~" H 10750 5100 50  0001 C CNN
	1    10750 5100
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5F6838D1
P 10750 5400
AR Path="/5F5B7065/5F6838D1" Ref="R?"  Part="1" 
AR Path="/5F6489A2/5F6838D1" Ref="R?"  Part="1" 
F 0 "R?" V 10545 5400 50  0000 C CNN
F 1 "2k" V 10636 5400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10750 5400 50  0001 C CNN
F 3 "~" H 10750 5400 50  0001 C CNN
	1    10750 5400
	0    1    1    0   
$EndComp
Text Notes 10900 6000 2    50   ~ 0
6mA each at 100%\n96mA total\n\nLY R976-PS-36
$Comp
L Device:C_Small C?
U 1 1 5F6838D8
P 7500 1050
AR Path="/5F5B7065/5F6838D8" Ref="C?"  Part="1" 
AR Path="/5F6489A2/5F6838D8" Ref="C?"  Part="1" 
F 0 "C?" H 7592 1096 50  0000 L CNN
F 1 "100nF" H 7592 1005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7500 1050 50  0001 C CNN
F 3 "~" H 7500 1050 50  0001 C CNN
	1    7500 1050
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5F6838DE
P 7500 950
AR Path="/5F5B7065/5F6838DE" Ref="#PWR?"  Part="1" 
AR Path="/5F6489A2/5F6838DE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7500 800 50  0001 C CNN
F 1 "+3V3" H 7515 1123 50  0000 C CNN
F 2 "" H 7500 950 50  0001 C CNN
F 3 "" H 7500 950 50  0001 C CNN
	1    7500 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F6838E4
P 7500 1150
AR Path="/5F5B7065/5F6838E4" Ref="#PWR?"  Part="1" 
AR Path="/5F6489A2/5F6838E4" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7500 900 50  0001 C CNN
F 1 "GND" H 7505 977 50  0000 C CNN
F 2 "" H 7500 1150 50  0001 C CNN
F 3 "" H 7500 1150 50  0001 C CNN
	1    7500 1150
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 5F6838EA
P 11050 800
AR Path="/5F5B7065/5F6838EA" Ref="#PWR?"  Part="1" 
AR Path="/5F6489A2/5F6838EA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 11050 650 50  0001 C CNN
F 1 "+12V" H 11065 973 50  0000 C CNN
F 2 "" H 11050 800 50  0001 C CNN
F 3 "" H 11050 800 50  0001 C CNN
	1    11050 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 5400 11050 5400
Wire Wire Line
	11050 5400 11050 5100
Wire Wire Line
	10450 850  10650 850 
Wire Wire Line
	10850 850  11050 850 
Connection ~ 11050 850 
Wire Wire Line
	11050 850  11050 800 
Wire Wire Line
	10450 1150 10650 1150
Wire Wire Line
	10850 1150 11050 1150
Connection ~ 11050 1150
Wire Wire Line
	11050 1150 11050 850 
Wire Wire Line
	10450 1450 10650 1450
Wire Wire Line
	10850 1450 11050 1450
Connection ~ 11050 1450
Wire Wire Line
	11050 1450 11050 1150
Wire Wire Line
	10450 1750 10650 1750
Wire Wire Line
	10850 1750 11050 1750
Connection ~ 11050 1750
Wire Wire Line
	11050 1750 11050 1450
Wire Wire Line
	10450 2050 10650 2050
Wire Wire Line
	10850 2050 11050 2050
Connection ~ 11050 2050
Wire Wire Line
	11050 2050 11050 1750
Wire Wire Line
	10450 2350 10650 2350
Wire Wire Line
	10850 2350 11050 2350
Connection ~ 11050 2350
Wire Wire Line
	11050 2350 11050 2050
Wire Wire Line
	10450 2650 10650 2650
Wire Wire Line
	10850 2650 11050 2650
Connection ~ 11050 2650
Wire Wire Line
	11050 2650 11050 2350
Wire Wire Line
	10450 2950 10650 2950
Wire Wire Line
	10850 2950 11050 2950
Connection ~ 11050 2950
Wire Wire Line
	11050 2950 11050 2650
Wire Wire Line
	10450 3250 10650 3250
Wire Wire Line
	10850 3250 11050 3250
Connection ~ 11050 3250
Wire Wire Line
	11050 3250 11050 2950
Wire Wire Line
	10450 3550 10650 3550
Wire Wire Line
	10850 3550 11050 3550
Connection ~ 11050 3550
Wire Wire Line
	11050 3550 11050 3250
Wire Wire Line
	10450 3850 10650 3850
Wire Wire Line
	10850 3850 11050 3850
Connection ~ 11050 3850
Wire Wire Line
	11050 3850 11050 3550
Wire Wire Line
	10450 4150 10650 4150
Wire Wire Line
	10850 4150 11050 4150
Connection ~ 11050 4150
Wire Wire Line
	11050 4150 11050 3850
Wire Wire Line
	10450 4450 10650 4450
Wire Wire Line
	10850 4450 11050 4450
Connection ~ 11050 4450
Wire Wire Line
	11050 4450 11050 4150
Wire Wire Line
	10450 4800 10650 4800
Wire Wire Line
	10850 4800 11050 4800
Connection ~ 11050 4800
Wire Wire Line
	11050 4800 11050 4450
Wire Wire Line
	10450 5100 10650 5100
Wire Wire Line
	10850 5100 11050 5100
Connection ~ 11050 5100
Wire Wire Line
	11050 5100 11050 4800
Wire Wire Line
	10450 5400 10650 5400
$Comp
L Driver_LED:PCA9635 U?
U 1 1 5F68392F
P 8450 2700
AR Path="/5F5B7065/5F68392F" Ref="U?"  Part="1" 
AR Path="/5F6489A2/5F68392F" Ref="U?"  Part="1" 
F 0 "U?" H 8100 3650 50  0000 C CNN
F 1 "PCA9635" H 8700 3650 50  0000 C CNN
F 2 "Package_SO:TSSOP-28_4.4x9.7mm_P0.65mm" H 8450 2700 50  0001 C CNN
F 3 "https://www.nxp.com/docs/en/data-sheet/PCA9635.pdf" H 8450 2700 50  0001 C CNN
	1    8450 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 3600 8450 3800
Wire Wire Line
	10250 850  9050 850 
Wire Wire Line
	9050 850  9050 1900
Wire Wire Line
	9050 1900 8950 1900
Wire Wire Line
	10250 1150 9100 1150
Wire Wire Line
	9100 1150 9100 2000
Wire Wire Line
	9100 2000 8950 2000
Wire Wire Line
	10250 1450 9150 1450
Wire Wire Line
	9150 1450 9150 2100
Wire Wire Line
	9150 2100 8950 2100
Wire Wire Line
	10250 1750 9200 1750
Wire Wire Line
	9200 1750 9200 2200
Wire Wire Line
	9200 2200 8950 2200
Wire Wire Line
	10250 2050 9250 2050
Wire Wire Line
	9250 2050 9250 2300
Wire Wire Line
	9250 2300 8950 2300
Wire Wire Line
	10250 2350 9300 2350
Wire Wire Line
	9300 2350 9300 2400
Wire Wire Line
	9300 2400 8950 2400
Wire Wire Line
	10250 2650 9950 2650
Wire Wire Line
	9950 2650 9950 2500
Wire Wire Line
	9950 2500 8950 2500
Wire Wire Line
	10250 2950 9900 2950
Wire Wire Line
	9900 2950 9900 2600
Wire Wire Line
	9900 2600 8950 2600
Wire Wire Line
	10250 3250 9850 3250
Wire Wire Line
	9850 3250 9850 2700
Wire Wire Line
	9850 2700 8950 2700
Wire Wire Line
	10250 3550 9800 3550
Wire Wire Line
	9800 3550 9800 2800
Wire Wire Line
	9800 2800 8950 2800
Wire Wire Line
	10250 3850 9750 3850
Wire Wire Line
	9750 3850 9750 2900
Wire Wire Line
	9750 2900 8950 2900
Wire Wire Line
	10250 4150 9700 4150
Wire Wire Line
	9700 4150 9700 3000
Wire Wire Line
	9700 3000 8950 3000
Wire Wire Line
	9650 3100 8950 3100
Wire Wire Line
	10250 4450 9650 4450
Wire Wire Line
	9650 3100 9650 4450
Wire Wire Line
	10250 4800 9600 4800
Wire Wire Line
	9600 4800 9600 3200
Wire Wire Line
	9600 3200 8950 3200
Wire Wire Line
	10250 5100 9550 5100
Wire Wire Line
	9550 5100 9550 3300
Wire Wire Line
	9550 3300 8950 3300
Wire Wire Line
	10250 5400 9500 5400
Wire Wire Line
	9500 5400 9500 3400
Wire Wire Line
	9500 3400 8950 3400
Wire Wire Line
	7950 2900 7700 2900
Wire Wire Line
	7950 2300 7700 2300
Wire Wire Line
	7700 2300 7700 2400
Connection ~ 7700 2900
Wire Wire Line
	7950 2400 7700 2400
Connection ~ 7700 2400
Wire Wire Line
	7700 2400 7700 2500
Wire Wire Line
	7950 2500 7700 2500
Connection ~ 7700 2500
Wire Wire Line
	7700 2500 7700 2600
Wire Wire Line
	7950 2600 7700 2600
Connection ~ 7700 2600
Wire Wire Line
	7700 2600 7700 2900
Wire Wire Line
	7950 2700 7900 2700
Wire Wire Line
	7450 2700 7450 2650
Wire Wire Line
	7950 2800 7900 2800
Wire Wire Line
	7900 2800 7900 2700
Connection ~ 7900 2700
Wire Wire Line
	7900 2700 7450 2700
Wire Wire Line
	7950 2100 7700 2100
Wire Wire Line
	7700 2100 7700 2300
Connection ~ 7700 2300
$Comp
L Device:R_Small_US R?
U 1 1 5F69B2D4
P 1075 1150
AR Path="/5F5B7065/5F69B2D4" Ref="R?"  Part="1" 
AR Path="/5F6489A2/5F69B2D4" Ref="R?"  Part="1" 
F 0 "R?" H 1143 1196 50  0000 L CNN
F 1 "10k" H 1143 1105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 1075 1150 50  0001 C CNN
F 3 "~" H 1075 1150 50  0001 C CNN
	1    1075 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R?
U 1 1 5F69B2DA
P 1375 1150
AR Path="/5F5B7065/5F69B2DA" Ref="R?"  Part="1" 
AR Path="/5F6489A2/5F69B2DA" Ref="R?"  Part="1" 
F 0 "R?" H 1443 1196 50  0000 L CNN
F 1 "10k" H 1443 1105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 1375 1150 50  0001 C CNN
F 3 "~" H 1375 1150 50  0001 C CNN
	1    1375 1150
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5F69B2E0
P 1075 850
AR Path="/5F5B7065/5F69B2E0" Ref="#PWR?"  Part="1" 
AR Path="/5F6489A2/5F69B2E0" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1075 700 50  0001 C CNN
F 1 "+3V3" H 1090 1023 50  0000 C CNN
F 2 "" H 1075 850 50  0001 C CNN
F 3 "" H 1075 850 50  0001 C CNN
	1    1075 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1075 850  1375 850 
Wire Wire Line
	1375 850  1375 1050
Wire Wire Line
	1075 1050 1075 850 
Connection ~ 1075 850 
Text HLabel 1075 1350 3    50   Input ~ 0
SCL
Text HLabel 1375 1350 3    50   Input ~ 0
SDA
Wire Wire Line
	1375 1250 1375 1350
Wire Wire Line
	1075 1250 1075 1350
Wire Wire Line
	1175 7050 1775 7050
$EndSCHEMATC