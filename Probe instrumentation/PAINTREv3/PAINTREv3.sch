EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 9000 300  0    197  Italic 0
RS485
Text Notes 10350 3500 0    197  Italic 0
i2c
$Comp
L Regulator_Linear:LP2985-3.3 U1
U 1 1 5DADC734
P 1900 1600
F 0 "U1" H 1900 1942 50  0000 C CNN
F 1 "LP2985-3.3" H 1900 1851 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5_HandSoldering" H 1900 1925 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lp2985.pdf" H 1900 1600 50  0001 C CNN
	1    1900 1600
	1    0    0    -1  
$EndComp
$Comp
L instrumnet-rescue:CP-2164VCA-rescue C6
U 1 1 5DADC79B
P 2650 1550
F 0 "C6" H 2768 1596 50  0000 L CNN
F 1 "10u" H 2768 1505 50  0000 L CNN
F 2 "New folder:C_1206_HandSoldering_silkscreenlabel" H 2688 1400 50  0001 C CNN
F 3 "" H 2650 1550 50  0001 C CNN
	1    2650 1550
	1    0    0    -1  
$EndComp
$Comp
L instrumnet-rescue:CP-2164VCA-rescue C7
U 1 1 5DADC841
P 3000 1550
F 0 "C7" H 3118 1596 50  0000 L CNN
F 1 "10u" H 3118 1505 50  0000 L CNN
F 2 "New folder:C_1206_HandSoldering_silkscreenlabel" H 3038 1400 50  0001 C CNN
F 3 "" H 3000 1550 50  0001 C CNN
	1    3000 1550
	1    0    0    -1  
$EndComp
Text Notes 1650 2300 0    59   Italic 0
150mA max draw\n
Text Notes 2750 2050 0    59   ~ 0
ceramic\nbypass C0G\noutput caps X7R / C0G
$Comp
L instrumnet-rescue:C_Small-_saved_synth-cache C5
U 1 1 5DADC92F
P 2300 1700
F 0 "C5" H 2392 1746 50  0000 L CNN
F 1 "10n" H 2392 1655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H 2300 1700 50  0001 C CNN
F 3 "" H 2300 1700 50  0000 C CNN
	1    2300 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 1900 2300 1900
Wire Wire Line
	2300 1900 2300 1800
Wire Wire Line
	2300 1500 2400 1500
Wire Wire Line
	2400 1500 2400 1400
Wire Wire Line
	2400 1400 2650 1400
Connection ~ 2650 1400
Wire Wire Line
	2650 1400 3000 1400
Wire Wire Line
	2650 1700 2650 1900
Wire Wire Line
	2650 1900 2300 1900
Connection ~ 2650 1700
Connection ~ 2300 1900
Wire Wire Line
	2650 1700 3000 1700
Text Notes 1450 800  0    39   Italic 0
\n'TI recommends that the trace from lead 2\n be extended under the package body and \nconnected to an internal ground plane with \nthermal vias.'
$Comp
L power:+3.3V #PWR0104
U 1 1 5DADDE08
P 3000 1400
F 0 "#PWR0104" H 3000 1250 50  0001 C CNN
F 1 "+3.3V" H 3015 1573 50  0000 C CNN
F 2 "" H 3000 1400 50  0001 C CNN
F 3 "" H 3000 1400 50  0001 C CNN
	1    3000 1400
	1    0    0    -1  
$EndComp
Connection ~ 3000 1400
$Comp
L power:GND #PWR0106
U 1 1 5DADE3D4
P 1900 1900
F 0 "#PWR0106" H 1900 1650 50  0001 C CNN
F 1 "GND" H 1905 1727 50  0000 C CNN
F 2 "" H 1900 1900 50  0001 C CNN
F 3 "" H 1900 1900 50  0001 C CNN
	1    1900 1900
	1    0    0    -1  
$EndComp
Connection ~ 1900 1900
Text Notes 1100 4000 0    118  ~ 0
k-type thermocouple driver
$Comp
L instrumnet-rescue:ATmega328P-AU-MCU_Microchip_ATmega U5
U 1 1 5DB1976B
P 7400 4550
F 0 "U5" H 7300 3600 50  0000 C CNN
F 1 "ATmega328P-AU" H 7300 3450 50  0000 C CNN
F 2 "Housings_QFP:TQFP-32_7x7mm_Pitch0.8mm" H 7400 4550 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 7400 4550 50  0001 C CNN
	1    7400 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:Resonator Y1
U 1 1 5DB1C2D6
P 8500 4000
F 0 "Y1" V 8800 3700 50  0000 L CNN
F 1 "8MHz Resonator" V 8700 3550 50  0000 L CNN
F 2 "New folder:Resonator_SMD_muRata_CSTNE" H 8475 4000 50  0001 C CNN
F 3 "~" H 8475 4000 50  0001 C CNN
	1    8500 4000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8250 4150 8500 4150
Wire Wire Line
	8000 4050 8250 4050
Wire Wire Line
	8250 4050 8250 4150
Wire Wire Line
	8250 3950 8250 3850
Wire Wire Line
	8250 3850 8500 3850
Wire Wire Line
	8000 3950 8250 3950
Wire Wire Line
	8700 4000 8850 4000
Wire Wire Line
	8850 4000 8850 4150
$Comp
L power:GND #PWR0108
U 1 1 5DB1D674
P 8850 4150
F 0 "#PWR0108" H 8850 3900 50  0001 C CNN
F 1 "GND" H 8855 3977 50  0000 C CNN
F 2 "" H 8850 4150 50  0001 C CNN
F 3 "" H 8850 4150 50  0001 C CNN
	1    8850 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 3350 6800 3050
Wire Wire Line
	6800 3050 7400 3050
Connection ~ 7400 3050
$Comp
L power:GND #PWR0109
U 1 1 5DB2131C
P 7400 6050
F 0 "#PWR0109" H 7400 5800 50  0001 C CNN
F 1 "GND" H 7405 5877 50  0000 C CNN
F 2 "" H 7400 6050 50  0001 C CNN
F 3 "" H 7400 6050 50  0001 C CNN
	1    7400 6050
	1    0    0    -1  
$EndComp
Text Notes -2250 1400 0    118  ~ 0
3.6V - 16V input
$Comp
L power:GND #PWR0110
U 1 1 5DB21F68
P 6250 3400
F 0 "#PWR0110" H 6250 3150 50  0001 C CNN
F 1 "GND" H 6255 3227 50  0000 C CNN
F 2 "" H 6250 3400 50  0001 C CNN
F 3 "" H 6250 3400 50  0001 C CNN
	1    6250 3400
	1    0    0    -1  
$EndComp
$Comp
L instrumnet-rescue:C_Small-_saved_synth-cache C13
U 1 1 5DB22128
P 6250 3250
F 0 "C13" H 6342 3296 50  0000 L CNN
F 1 "1u" H 6342 3205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H 6250 3250 50  0001 C CNN
F 3 "" H 6250 3250 50  0000 C CNN
	1    6250 3250
	1    0    0    -1  
$EndComp
$Comp
L instrumnet-rescue:C_Small-_saved_synth-cache C14
U 1 1 5DB23C55
P 6550 3250
F 0 "C14" H 6642 3296 50  0000 L CNN
F 1 ".1u" H 6642 3205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H 6550 3250 50  0001 C CNN
F 3 "" H 6550 3250 50  0000 C CNN
	1    6550 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 3150 6250 3150
Wire Wire Line
	6250 3350 6550 3350
Wire Wire Line
	6250 3350 6250 3400
Text GLabel 8000 4750 2    59   Input ~ 0
scl
Text GLabel 8000 4650 2    59   Input ~ 0
sda
Text Notes 8350 5700 0    118  ~ 0
SPI
Text GLabel 8000 5150 2    59   Input ~ 0
txd
Wire Wire Line
	1500 1600 1300 1600
Wire Wire Line
	7400 3050 7500 3050
$Comp
L power:+3.3V #PWR0122
U 1 1 5DBE13B6
P 7400 2850
F 0 "#PWR0122" H 7400 2700 50  0001 C CNN
F 1 "+3.3V" H 7250 2900 50  0000 C CNN
F 2 "" H 7400 2850 50  0001 C CNN
F 3 "" H 7400 2850 50  0001 C CNN
	1    7400 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 1600 1300 1500
Wire Wire Line
	1300 1500 1500 1500
$Comp
L power:GND #PWR0132
U 1 1 5DC6D3B9
P 5750 4450
F 0 "#PWR0132" H 5750 4200 50  0001 C CNN
F 1 "GND" H 5755 4277 50  0000 C CNN
F 2 "" H 5750 4450 50  0001 C CNN
F 3 "" H 5750 4450 50  0001 C CNN
	1    5750 4450
	1    0    0    -1  
$EndComp
$Comp
L instrumnet-rescue:Connector_Conn_01x04_Female-newvco-cache J7
U 1 1 5DBB51B0
P 10650 4900
F 0 "J7" H 10677 4876 50  0000 L CNN
F 1 "BN080" H 10677 4785 50  0000 L CNN
F 2 "Connectors_JST:JST_SH_SM04B-SRSS-TB_04x1.00mm_Angled" H 10650 4900 50  0001 C CNN
F 3 "" H 10650 4900 50  0001 C CNN
	1    10650 4900
	1    0    0    -1  
$EndComp
Text Notes 10100 5400 0    79   ~ 0
<10mA
$Comp
L power:GND #PWR0135
U 1 1 5DC00EA3
P 1150 1900
F 0 "#PWR0135" H 1150 1650 50  0001 C CNN
F 1 "GND" H 1155 1727 50  0000 C CNN
F 2 "" H 1150 1900 50  0001 C CNN
F 3 "" H 1150 1900 50  0001 C CNN
	1    1150 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 1700 1150 1900
Wire Wire Line
	100  1700 150  1700
Wire Wire Line
	150  1700 150  1800
Wire Wire Line
	150  1800 300  1800
Wire Wire Line
	450  1400 450  1500
$Comp
L Device:D_TVS D7
U 1 1 5DC455CC
P 300 1600
F 0 "D7" V 254 1679 50  0000 L CNN
F 1 "AQ12" V 345 1679 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_handsoldering" H 300 1600 50  0001 C CNN
F 3 "~" H 300 1600 50  0001 C CNN
	1    300  1600
	0    1    1    0   
$EndComp
Wire Wire Line
	300  1400 300  1450
Connection ~ 300  1400
Wire Wire Line
	300  1400 450  1400
Wire Wire Line
	300  1750 300  1800
Connection ~ 300  1800
Wire Wire Line
	300  1800 650  1800
$Comp
L power:GND #PWR0136
U 1 1 5DC56003
P 10150 4900
F 0 "#PWR0136" H 10150 4650 50  0001 C CNN
F 1 "GND" H 10155 4727 50  0000 C CNN
F 2 "" H 10150 4900 50  0001 C CNN
F 3 "" H 10150 4900 50  0001 C CNN
	1    10150 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 4800 10150 4800
Wire Wire Line
	10150 4800 10150 4900
$Comp
L power:+3.3V #PWR0138
U 1 1 5DC5E0AF
P 10400 4400
F 0 "#PWR0138" H 10400 4250 50  0001 C CNN
F 1 "+3.3V" H 10250 4450 50  0000 C CNN
F 2 "" H 10400 4400 50  0001 C CNN
F 3 "" H 10400 4400 50  0001 C CNN
	1    10400 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 4900 10400 4900
Wire Wire Line
	10400 4900 10400 4700
Text GLabel 10450 5100 0    59   Input ~ 0
scl
Text GLabel 10450 5000 0    59   Input ~ 0
sda
$Comp
L instrumnet-rescue:R-2164VCA-rescue Ri2cSCL1
U 1 1 5DC0F2C7
P 10800 4100
F 0 "Ri2cSCL1" H 10350 4150 50  0000 L CNN
F 1 "500" H 10350 4050 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V 10730 4100 50  0001 C CNN
F 3 "" H 10800 4100 50  0001 C CNN
	1    10800 4100
	1    0    0    -1  
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue Ri2cSDA1
U 1 1 5DC0F391
P 11000 4100
F 0 "Ri2cSDA1" H 11100 4150 50  0000 L CNN
F 1 "500" H 11100 4050 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V 10930 4100 50  0001 C CNN
F 3 "" H 11000 4100 50  0001 C CNN
	1    11000 4100
	1    0    0    -1  
$EndComp
Text GLabel 11000 4250 3    59   Input ~ 0
sda
Text GLabel 10800 4250 3    59   Input ~ 0
scl
$Comp
L power:+3.3V #PWR0137
U 1 1 5DC0F80B
P 10800 3650
F 0 "#PWR0137" H 10800 3500 50  0001 C CNN
F 1 "+3.3V" H 10500 3700 50  0000 C CNN
F 2 "" H 10800 3650 50  0001 C CNN
F 3 "" H 10800 3650 50  0001 C CNN
	1    10800 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0139
U 1 1 5DC0F9C8
P 11000 3650
F 0 "#PWR0139" H 11000 3500 50  0001 C CNN
F 1 "+3.3V" H 11200 3700 50  0000 C CNN
F 2 "" H 11000 3650 50  0001 C CNN
F 3 "" H 11000 3650 50  0001 C CNN
	1    11000 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0140
U 1 1 5DC40D15
P 13000 7250
F 0 "#PWR0140" H 13000 7100 50  0001 C CNN
F 1 "+3.3V" H 12850 7300 50  0000 C CNN
F 2 "" H 13000 7250 50  0001 C CNN
F 3 "" H 13000 7250 50  0001 C CNN
	1    13000 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0141
U 1 1 5DC40D9E
P 13000 7550
F 0 "#PWR0141" H 13000 7300 50  0001 C CNN
F 1 "GND" H 13005 7377 50  0000 C CNN
F 2 "" H 13000 7550 50  0001 C CNN
F 3 "" H 13000 7550 50  0001 C CNN
	1    13000 7550
	1    0    0    -1  
$EndComp
Text GLabel 13000 6800 0    39   Input ~ 0
reset
Text GLabel 13000 6600 0    39   Input ~ 0
miso
Text GLabel 13000 6500 0    39   Input ~ 0
mosi
Text GLabel 13000 6700 0    39   Input ~ 0
sck
Text GLabel 8000 3750 2    39   Input ~ 0
miso
Text GLabel 8000 3650 2    39   Input ~ 0
mosi
Text GLabel 8000 3850 2    39   Input ~ 0
sck
$Comp
L instrumnet-rescue:C_Small-_saved_synth-cache C12
U 1 1 5DC0BE24
P 9550 4950
F 0 "C12" H 9642 4950 50  0000 L CNN
F 1 ".1u" H 9642 4905 50  0001 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H 9550 4950 50  0001 C CNN
F 3 "" H 9550 4950 50  0000 C CNN
	1    9550 4950
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0124
U 1 1 5DC0C0EE
P 9550 4850
F 0 "#PWR0124" H 9550 4700 50  0001 C CNN
F 1 "+3.3V" H 9400 4900 50  0000 C CNN
F 2 "" H 9550 4850 50  0001 C CNN
F 3 "" H 9550 4850 50  0001 C CNN
	1    9550 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0142
U 1 1 5DC0C173
P 9550 5050
F 0 "#PWR0142" H 9550 4800 50  0001 C CNN
F 1 "GND" H 9555 4877 50  0000 C CNN
F 2 "" H 9550 5050 50  0001 C CNN
F 3 "" H 9550 5050 50  0001 C CNN
	1    9550 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:Ferrite_Bead_Small L6
U 1 1 5DC0F2D9
P 7400 2950
F 0 "L6" V 7255 2950 50  0000 C CNN
F 1 "Ferrite_Bead_Small" V 7254 2950 50  0001 C CNN
F 2 "New folder:ferrite_bead_handsolder-1206" V 7330 2950 50  0001 C CNN
F 3 "~" H 7400 2950 50  0001 C CNN
	1    7400 2950
	-1   0    0    -1  
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R14
U 1 1 5DC17D75
P 8650 4650
F 0 "R14" H 8450 4700 50  0000 L CNN
F 1 "4.7k" H 8400 4600 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V 8580 4650 50  0001 C CNN
F 3 "" H 8650 4650 50  0001 C CNN
	1    8650 4650
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0143
U 1 1 5DC17EC2
P 8650 4500
F 0 "#PWR0143" H 8650 4350 50  0001 C CNN
F 1 "+3.3V" H 8800 4550 50  0000 C CNN
F 2 "" H 8650 4500 50  0001 C CNN
F 3 "" H 8650 4500 50  0001 C CNN
	1    8650 4500
	1    0    0    -1  
$EndComp
$Comp
L instrumnet-rescue:C_Small-_saved_synth-cache C15
U 1 1 5DC185A7
P 8650 4900
F 0 "C15" H 8742 4946 50  0000 L CNN
F 1 "1u" H 8742 4855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H 8650 4900 50  0001 C CNN
F 3 "" H 8650 4900 50  0000 C CNN
	1    8650 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0144
U 1 1 5DC18717
P 8650 5000
F 0 "#PWR0144" H 8650 4750 50  0001 C CNN
F 1 "GND" H 8655 4827 50  0000 C CNN
F 2 "" H 8650 5000 50  0001 C CNN
F 3 "" H 8650 5000 50  0001 C CNN
	1    8650 5000
	1    0    0    -1  
$EndComp
Text Notes 9100 4250 0    50   ~ 0
an2519 for info
$Comp
L instrumnet-rescue:C_Small-_saved_synth-cache C16
U 1 1 5DC1A794
P 1150 1600
F 0 "C16" H 1242 1600 50  0000 L CNN
F 1 "1u" H 1242 1555 50  0001 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H 1150 1600 50  0001 C CNN
F 3 "" H 1150 1600 50  0000 C CNN
	1    1150 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  1500 1150 1500
Connection ~ 1150 1500
Wire Wire Line
	1150 1500 1300 1500
Wire Wire Line
	650  1800 650  1700
Wire Wire Line
	450  1500 650  1500
Text GLabel 8650 4800 2    39   Input ~ 0
reset
Wire Wire Line
	8450 4850 8450 4800
Wire Wire Line
	8450 4800 8650 4800
Wire Wire Line
	8000 4850 8450 4850
Connection ~ 8650 4800
Wire Wire Line
	100  1500 100  1700
Connection ~ 1150 1700
Text Notes -500 1400 0    50   ~ 0
+
Text Notes -500 1500 0    50   ~ 0
-
NoConn ~ 8000 3350
NoConn ~ 8000 3450
NoConn ~ 8000 3550
NoConn ~ 6800 3650
NoConn ~ 8000 4550
NoConn ~ 8000 5350
NoConn ~ 8000 5450
Connection ~ 6250 3150
Connection ~ 6250 3350
$Comp
L Device:Ferrite_Bead_Small L5
U 1 1 5DE07C7E
P 750 1500
F 0 "L5" V 605 1500 50  0000 C CNN
F 1 "Ferrite_Bead_Small" V 604 1500 50  0001 C CNN
F 2 "New folder:ferrite_bead_handsolder-1206" V 680 1500 50  0001 C CNN
F 3 "~" H 750 1500 50  0001 C CNN
	1    750  1500
	0    1    1    0   
$EndComp
Wire Wire Line
	650  1700 1150 1700
Text Notes -4250 -3800 0    591  ~ 0
V1 (2021 version)
$Comp
L instrumnet-rescue:R-2164VCA-rescue R17
U 1 1 6005022F
P 1800 5650
F 0 "R17" V 1800 5650 50  0000 L CNN
F 1 "50" V 1650 5600 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V 1730 5650 50  0001 C CNN
F 3 "" H 1800 5650 50  0001 C CNN
	1    1800 5650
	0    -1   1    0   
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R18
U 1 1 600507CC
P 1800 5750
F 0 "R18" V 1800 5750 50  0000 L CNN
F 1 "50" V 1600 5700 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V 1730 5750 50  0001 C CNN
F 3 "" H 1800 5750 50  0001 C CNN
	1    1800 5750
	0    -1   1    0   
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R19
U 1 1 6005086C
P 1800 5850
F 0 "R19" V 1800 5850 50  0000 L CNN
F 1 "50" V 2000 5800 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V 1730 5850 50  0001 C CNN
F 3 "" H 1800 5850 50  0001 C CNN
	1    1800 5850
	0    -1   1    0   
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R21
U 1 1 60050910
P 1800 5950
F 0 "R21" V 1800 5950 50  0000 L CNN
F 1 "50" V 2000 5900 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V 1730 5950 50  0001 C CNN
F 3 "" H 1800 5950 50  0001 C CNN
	1    1800 5950
	0    -1   1    0   
$EndComp
$Comp
L power:GNDA #PWR0105
U 1 1 60051656
P 1250 6350
F 0 "#PWR0105" H 1250 6100 50  0001 C CNN
F 1 "GNDA" H 1255 6177 50  0000 C CNN
F 2 "" H 1250 6350 50  0001 C CNN
F 3 "" H 1250 6350 50  0001 C CNN
	1    1250 6350
	-1   0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0107
U 1 1 60051B63
P 1250 5350
F 0 "#PWR0107" H 1250 5200 50  0001 C CNN
F 1 "+3.3V" H 1265 5523 50  0000 C CNN
F 2 "" H 1250 5350 50  0001 C CNN
F 3 "" H 1250 5350 50  0001 C CNN
	1    1250 5350
	-1   0    0    -1  
$EndComp
Text GLabel 1950 5650 2    59   Input ~ 0
sck
Text GLabel 1950 5950 2    59   Input ~ 0
cs_1
Text GLabel 1950 5750 2    39   Input ~ 0
mosi
Text GLabel 1950 5850 2    39   Input ~ 0
miso
$Comp
L instrumnet-rescue:R-2164VCA-rescue R20
U 1 1 60069FDA
P 3000 5850
F 0 "R20" V 3000 5850 50  0000 L CNN
F 1 "1M" V 3100 5800 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V 2930 5850 50  0001 C CNN
F 3 "" H 3000 5850 50  0001 C CNN
	1    3000 5850
	1    0    0    1   
$EndComp
Text GLabel 3000 6000 2    59   Input ~ 0
cs_1
$Comp
L power:+3.3V #PWR0113
U 1 1 6006A178
P 3000 5700
F 0 "#PWR0113" H 3000 5550 50  0001 C CNN
F 1 "+3.3V" H 3015 5873 50  0000 C CNN
F 2 "" H 3000 5700 50  0001 C CNN
F 3 "" H 3000 5700 50  0001 C CNN
	1    3000 5700
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 6008E879
P -350 5850
F 0 "C2" H -258 5896 50  0000 L CNN
F 1 ".1u" H -258 5805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H -350 5850 50  0001 C CNN
F 3 "~" H -350 5850 50  0001 C CNN
	1    -350 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 6008E942
P -350 6250
F 0 "C4" H -258 6296 50  0000 L CNN
F 1 ".1u" H -258 6205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H -350 6250 50  0001 C CNN
F 3 "~" H -350 6250 50  0001 C CNN
	1    -350 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 6008EC2A
P -650 6050
F 0 "C3" H -558 6096 50  0000 L CNN
F 1 "1u" H -558 6005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H -650 6050 50  0001 C CNN
F 3 "~" H -650 6050 50  0001 C CNN
	1    -650 6050
	1    0    0    -1  
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R13
U 1 1 6008EF7F
P -1050 5950
F 0 "R13" V -1050 5950 50  0000 L CNN
F 1 "500" V -1150 5900 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1120 5950 50  0001 C CNN
F 3 "" H -1050 5950 50  0001 C CNN
	1    -1050 5950
	0    -1   1    0   
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R15
U 1 1 6008F0BE
P -1050 6150
F 0 "R15" V -1050 6150 50  0000 L CNN
F 1 "500" V -950 6100 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1120 6150 50  0001 C CNN
F 3 "" H -1050 6150 50  0001 C CNN
	1    -1050 6150
	0    -1   1    0   
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R12
U 1 1 6008F219
P -1200 5800
F 0 "R12" V -1200 5800 50  0000 L CNN
F 1 "1M" V -1100 5750 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1270 5800 50  0001 C CNN
F 3 "" H -1200 5800 50  0001 C CNN
	1    -1200 5800
	-1   0    0    -1  
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R16
U 1 1 6008F326
P -1200 6300
F 0 "R16" V -1200 6300 50  0000 L CNN
F 1 "1M" V -1100 6250 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1270 6300 50  0001 C CNN
F 3 "" H -1200 6300 50  0001 C CNN
	1    -1200 6300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	-900 6150 -650 6150
Connection ~ -650 6150
Wire Wire Line
	-650 6150 -350 6150
Wire Wire Line
	-900 5950 -650 5950
Connection ~ -650 5950
Wire Wire Line
	-650 5950 -350 5950
$Comp
L power:+3.3V #PWR0114
U 1 1 600DF3FB
P -1200 5650
F 0 "#PWR0114" H -1200 5500 50  0001 C CNN
F 1 "+3.3V" H -1185 5823 50  0000 C CNN
F 2 "" H -1200 5650 50  0001 C CNN
F 3 "" H -1200 5650 50  0001 C CNN
	1    -1200 5650
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0123
U 1 1 600DF55C
P -1200 6450
F 0 "#PWR0123" H -1200 6200 50  0001 C CNN
F 1 "GNDA" H -1195 6277 50  0000 C CNN
F 2 "" H -1200 6450 50  0001 C CNN
F 3 "" H -1200 6450 50  0001 C CNN
	1    -1200 6450
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0145
U 1 1 600DF60F
P -350 6350
F 0 "#PWR0145" H -350 6100 50  0001 C CNN
F 1 "GNDA" H -345 6177 50  0000 C CNN
F 2 "" H -350 6350 50  0001 C CNN
F 3 "" H -350 6350 50  0001 C CNN
	1    -350 6350
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0147
U 1 1 600DF6C2
P -350 5750
F 0 "#PWR0147" H -350 5500 50  0001 C CNN
F 1 "GNDA" H -345 5577 50  0000 C CNN
F 2 "" H -350 5750 50  0001 C CNN
F 3 "" H -350 5750 50  0001 C CNN
	1    -350 5750
	1    0    0    1   
$EndComp
$Comp
L Device:C_Small C20
U 1 1 600E92D1
P -350 4500
F 0 "C20" H -258 4546 50  0000 L CNN
F 1 ".1u" H -258 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H -350 4500 50  0001 C CNN
F 3 "~" H -350 4500 50  0001 C CNN
	1    -350 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C22
U 1 1 600E92D7
P -350 4900
F 0 "C22" H -258 4946 50  0000 L CNN
F 1 ".1u" H -258 4855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H -350 4900 50  0001 C CNN
F 3 "~" H -350 4900 50  0001 C CNN
	1    -350 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C21
U 1 1 600E92DD
P -650 4700
F 0 "C21" H -558 4746 50  0000 L CNN
F 1 "1u" H -558 4655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H -650 4700 50  0001 C CNN
F 3 "~" H -650 4700 50  0001 C CNN
	1    -650 4700
	1    0    0    -1  
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R23
U 1 1 600E92E3
P -1050 4600
F 0 "R23" V -1050 4600 50  0000 L CNN
F 1 "500" V -1150 4550 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1120 4600 50  0001 C CNN
F 3 "" H -1050 4600 50  0001 C CNN
	1    -1050 4600
	0    -1   1    0   
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R24
U 1 1 600E92E9
P -1050 4800
F 0 "R24" V -1050 4800 50  0000 L CNN
F 1 "500" V -950 4750 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1120 4800 50  0001 C CNN
F 3 "" H -1050 4800 50  0001 C CNN
	1    -1050 4800
	0    -1   1    0   
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R22
U 1 1 600E92EF
P -1200 4450
F 0 "R22" V -1200 4450 50  0000 L CNN
F 1 "1M" V -1100 4400 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1270 4450 50  0001 C CNN
F 3 "" H -1200 4450 50  0001 C CNN
	1    -1200 4450
	-1   0    0    -1  
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R25
U 1 1 600E92F5
P -1200 4950
F 0 "R25" V -1200 4950 50  0000 L CNN
F 1 "1M" V -1100 4900 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1270 4950 50  0001 C CNN
F 3 "" H -1200 4950 50  0001 C CNN
	1    -1200 4950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	-900 4800 -650 4800
Connection ~ -650 4800
Wire Wire Line
	-650 4800 -350 4800
Wire Wire Line
	-900 4600 -650 4600
Connection ~ -650 4600
Wire Wire Line
	-650 4600 -350 4600
$Comp
L power:+3.3V #PWR0148
U 1 1 600E9307
P -1200 4300
F 0 "#PWR0148" H -1200 4150 50  0001 C CNN
F 1 "+3.3V" H -1185 4473 50  0000 C CNN
F 2 "" H -1200 4300 50  0001 C CNN
F 3 "" H -1200 4300 50  0001 C CNN
	1    -1200 4300
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0149
U 1 1 600E930D
P -1200 5100
F 0 "#PWR0149" H -1200 4850 50  0001 C CNN
F 1 "GNDA" H -1195 4927 50  0000 C CNN
F 2 "" H -1200 5100 50  0001 C CNN
F 3 "" H -1200 5100 50  0001 C CNN
	1    -1200 5100
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0150
U 1 1 600E9313
P -350 5000
F 0 "#PWR0150" H -350 4750 50  0001 C CNN
F 1 "GNDA" H -345 4827 50  0000 C CNN
F 2 "" H -350 5000 50  0001 C CNN
F 3 "" H -350 5000 50  0001 C CNN
	1    -350 5000
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0151
U 1 1 600E9319
P -350 4400
F 0 "#PWR0151" H -350 4150 50  0001 C CNN
F 1 "GNDA" H -345 4227 50  0000 C CNN
F 2 "" H -350 4400 50  0001 C CNN
F 3 "" H -350 4400 50  0001 C CNN
	1    -350 4400
	1    0    0    1   
$EndComp
Wire Wire Line
	850  5650 800  5650
Connection ~ -350 5950
Wire Wire Line
	600  6150 -350 6150
Connection ~ -350 6150
Connection ~ -350 4600
Connection ~ -350 4800
Text Notes -600 5350 0    39   ~ 0
first order noise filtering
$Comp
L Device:C_Small C1
U 1 1 601240AC
P 1650 5000
F 0 "C1" H 1742 5046 50  0000 L CNN
F 1 ".1u" H 1742 4955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H 1650 5000 50  0001 C CNN
F 3 "~" H 1650 5000 50  0001 C CNN
	1    1650 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0152
U 1 1 6012419F
P 1650 5100
F 0 "#PWR0152" H 1650 4850 50  0001 C CNN
F 1 "GNDA" H 1655 4927 50  0000 C CNN
F 2 "" H 1650 5100 50  0001 C CNN
F 3 "" H 1650 5100 50  0001 C CNN
	1    1650 5100
	-1   0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0153
U 1 1 60124264
P 1650 4900
F 0 "#PWR0153" H 1650 4750 50  0001 C CNN
F 1 "+3.3V" H 1665 5073 50  0000 C CNN
F 2 "" H 1650 4900 50  0001 C CNN
F 3 "" H 1650 4900 50  0001 C CNN
	1    1650 4900
	-1   0    0    -1  
$EndComp
Text Notes 1900 5000 0    39   ~ 0
MLCC\nLow ESR
$Comp
L instrumnet-rescue:Connector_Conn_01x04_Female-newvco-cache J2
U 1 1 60141F8C
P 13200 6600
F 0 "J2" H 13227 6576 50  0000 L CNN
F 1 "SPI" H 13227 6485 50  0000 L CNN
F 2 "Connectors_JST:JST_SH_SM04B-SRSS-TB_04x1.00mm_Angled" H 13200 6600 50  0001 C CNN
F 3 "" H 13200 6600 50  0001 C CNN
	1    13200 6600
	1    0    0    -1  
$EndComp
$Comp
L instrumnet-rescue:THVD1428DR-Interface_UART U2
U 1 1 6015ABBA
P 9600 1550
F 0 "U2" H 9850 2250 50  0000 C CNN
F 1 "THVD1428DR" H 10000 2150 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 9600 650 50  0001 C CNN
F 3 "http://www.analog.com/media/en/technical-documentation/data-sheets/ADM1490E_1491E.pdf" H 9100 1650 50  0001 C CNN
	1    9600 1550
	1    0    0    -1  
$EndComp
Connection ~ 1300 1500
$Comp
L Device:C_Small C9
U 1 1 60176151
P 8800 800
F 0 "C9" H 8892 846 50  0000 L CNN
F 1 ".1u" H 8892 755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H 8800 800 50  0001 C CNN
F 3 "~" H 8800 800 50  0001 C CNN
	1    8800 800 
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0101
U 1 1 6017615D
P 8800 700
F 0 "#PWR0101" H 8800 550 50  0001 C CNN
F 1 "+3.3V" H 8815 873 50  0000 C CNN
F 2 "" H 8800 700 50  0001 C CNN
F 3 "" H 8800 700 50  0001 C CNN
	1    8800 700 
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 601793C2
P 9600 2150
F 0 "#PWR0102" H 9600 1900 50  0001 C CNN
F 1 "GND" H 9605 1977 50  0000 C CNN
F 2 "" H 9600 2150 50  0001 C CNN
F 3 "" H 9600 2150 50  0001 C CNN
	1    9600 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 60179433
P 8800 900
F 0 "#PWR0103" H 8800 650 50  0001 C CNN
F 1 "GND" H 8805 727 50  0000 C CNN
F 2 "" H 8800 900 50  0001 C CNN
F 3 "" H 8800 900 50  0001 C CNN
	1    8800 900 
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 5DD6EC64
P 8000 4450
F 0 "TP4" V 7954 4637 50  0001 L CNN
F 1 "pc2" V 8000 4650 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 8200 4450 50  0001 C CNN
F 3 "~" H 8200 4450 50  0001 C CNN
	1    8000 4450
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 5DD6EBC2
P 8000 4350
F 0 "TP3" V 8000 4800 50  0001 L CNN
F 1 "pc1" V 8000 4550 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 8200 4350 50  0001 C CNN
F 3 "~" H 8200 4350 50  0001 C CNN
	1    8000 4350
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 5DD6E8FE
P 6800 3550
F 0 "TP2" V 6800 4000 50  0001 L CNN
F 1 "pc0" V 6800 3750 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 7000 3550 50  0001 C CNN
F 3 "~" H 7000 3550 50  0001 C CNN
	1    6800 3550
	0    -1   -1   0   
$EndComp
Text Notes 3400 1700 0    98   ~ 0
<10mA 328p\n<10mA BNO080
Text GLabel 9200 1750 0    59   Input ~ 0
txd
$Comp
L instrumnet-rescue:R-2164VCA-rescue Rterm1
U 1 1 60184817
P 10450 1350
F 0 "Rterm1" H 10550 1400 50  0000 L CNN
F 1 "50" H 10550 1300 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V 10380 1350 50  0001 C CNN
F 3 "" H 10450 1350 50  0001 C CNN
	1    10450 1350
	1    0    0    -1  
$EndComp
Text GLabel 8000 5050 2    59   Input ~ 0
rxd
$Comp
L power:+3.3V #PWR0111
U 1 1 6018A1AA
P 8850 1550
F 0 "#PWR0111" H 8850 1400 50  0001 C CNN
F 1 "+3.3V" H 8865 1723 50  0000 C CNN
F 2 "" H 8850 1550 50  0001 C CNN
F 3 "" H 8850 1550 50  0001 C CNN
	1    8850 1550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8850 1550 9200 1550
$Comp
L power:+3.3V #PWR0112
U 1 1 6018C83A
P 9600 950
F 0 "#PWR0112" H 9600 800 50  0001 C CNN
F 1 "+3.3V" H 9615 1123 50  0000 C CNN
F 2 "" H 9600 950 50  0001 C CNN
F 3 "" H 9600 950 50  0001 C CNN
	1    9600 950 
	-1   0    0    -1  
$EndComp
NoConn ~ 9200 1450
NoConn ~ 9200 1350
Wire Wire Line
	6250 3050 6800 3050
Wire Wire Line
	6250 3050 6250 3150
Connection ~ 6800 3050
Wire Wire Line
	-450 1400 300  1400
Wire Wire Line
	-450 1500 100  1500
Text GLabel 13000 7350 0    59   Input ~ 0
txd
$Comp
L instrumnet-rescue:Connector_Conn_01x04_Female-newvco-cache J5
U 1 1 6002C675
P 13200 7350
F 0 "J5" H 13227 7326 50  0000 L CNN
F 1 "debug" H 13227 7235 50  0000 L CNN
F 2 "Connectors_JST:JST_SH_SM04B-SRSS-TB_04x1.00mm_Angled" H 13200 7350 50  0001 C CNN
F 3 "" H 13200 7350 50  0001 C CNN
	1    13200 7350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 6002DCF5
P 5700 7600
F 0 "H1" H 5800 7646 50  0000 L CNN
F 1 "MountingHole" H 5800 7555 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 5700 7600 50  0001 C CNN
F 3 "~" H 5700 7600 50  0001 C CNN
	1    5700 7600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 6002E052
P 6400 7600
F 0 "H2" H 6500 7646 50  0000 L CNN
F 1 "MountingHole" H 6500 7555 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 6400 7600 50  0001 C CNN
F 3 "~" H 6400 7600 50  0001 C CNN
	1    6400 7600
	1    0    0    -1  
$EndComp
Wire Wire Line
	-1450 5950 -1200 5950
Connection ~ -1200 5950
Wire Wire Line
	-1450 6150 -1200 6150
Connection ~ -1200 6150
Wire Wire Line
	-1450 4600 -1200 4600
Wire Wire Line
	-1450 4800 -1200 4800
Connection ~ -1200 4600
Connection ~ -1200 4800
$Comp
L Connector:Conn_01x08_Male J1
U 1 1 601A042B
P -650 1600
F 0 "J1" H -544 2078 50  0000 C CNN
F 1 "ethernet" H -544 1987 50  0000 C CNN
F 2 "Connector_PinSocket_2.00mm:PinSocket_1x08_P2.00mm_Vertical" H -650 1600 50  0001 C CNN
F 3 "~" H -650 1600 50  0001 C CNN
	1    -650 1600
	1    0    0    -1  
$EndComp
Text Notes 1800 6650 0    59   ~ 0
short circuit protection\n50 ohms\n
Text Notes 3200 5850 0    59   ~ 0
avoid floating during reset
Text Notes -2100 4000 0    59   ~ 0
no ESD protection on thermocouple inputs
$Comp
L Device:Polyfuse F1
U 1 1 60094555
P 10400 4550
F 0 "F1" H 10488 4596 50  0000 L CNN
F 1 "Polyfuse" H 10488 4505 50  0000 L CNN
F 2 "Fuse:Fuse_0603_1608Metric" H 10450 4350 50  0001 L CNN
F 3 "~" H 10400 4550 50  0001 C CNN
	1    10400 4550
	1    0    0    -1  
$EndComp
Text GLabel -1450 4600 0    59   Input ~ 0
tc1+
Text GLabel -1450 4800 0    59   Input ~ 0
tc1-
Text GLabel -1450 5950 0    59   Input ~ 0
tc2+
Text GLabel -1450 6150 0    59   Input ~ 0
tc2-
$Comp
L Analog_ADC:ADS1118IDGS U7
U 1 1 60025720
P 1250 5850
F 0 "U7" H 1250 5750 50  0000 C CNN
F 1 "ADS1118IDGS" H 1550 6350 50  0000 C CNN
F 2 "Package_SO:TSSOP-10_3x3mm_P0.5mm" H 1200 5800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ads1118.pdf" H 350 6250 50  0001 C CNN
	1    1250 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	-450 1300 -450 1400
Connection ~ -450 1400
Wire Wire Line
	-450 1500 -450 1600
Connection ~ -450 1500
Text GLabel 10650 900  2    59   Input ~ 0
RS485-A
Text GLabel 10550 1500 2    59   Input ~ 0
RS485-B
Text GLabel -450 1950 2    59   Input ~ 0
RS485-A
Text GLabel -450 1750 2    59   Input ~ 0
RS485-B
Wire Wire Line
	-450 1800 -450 1700
Wire Wire Line
	-450 2000 -450 1900
Wire Wire Line
	10000 1450 10250 1450
Wire Wire Line
	10250 1450 10250 1500
Wire Wire Line
	10000 1250 10250 1250
Connection ~ 10450 1500
Wire Wire Line
	10450 1500 10550 1500
Wire Wire Line
	10250 1500 10450 1500
Wire Wire Line
	-350 5950 850  5950
Wire Wire Line
	600  6050 850  6050
Wire Wire Line
	600  6050 600  6150
Wire Wire Line
	600  5750 600  4800
Wire Wire Line
	600  5750 850  5750
Wire Wire Line
	600  4800 -350 4800
Wire Wire Line
	800  4600 800  5650
Wire Wire Line
	-350 4600 800  4600
$Comp
L instrumnet-rescue:R-2164VCA-rescue R9
U 1 1 6021257D
P 1800 8800
F 0 "R9" V 1800 8800 50  0000 L CNN
F 1 "50" V 1650 8750 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V 1730 8800 50  0001 C CNN
F 3 "" H 1800 8800 50  0001 C CNN
	1    1800 8800
	0    -1   1    0   
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R10
U 1 1 60212587
P 1800 8900
F 0 "R10" V 1800 8900 50  0000 L CNN
F 1 "50" V 1600 8850 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V 1730 8900 50  0001 C CNN
F 3 "" H 1800 8900 50  0001 C CNN
	1    1800 8900
	0    -1   1    0   
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R11
U 1 1 60212591
P 1800 9000
F 0 "R11" V 1800 9000 50  0000 L CNN
F 1 "50" V 2000 8950 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V 1730 9000 50  0001 C CNN
F 3 "" H 1800 9000 50  0001 C CNN
	1    1800 9000
	0    -1   1    0   
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R26
U 1 1 6021259B
P 1800 9100
F 0 "R26" V 1800 9100 50  0000 L CNN
F 1 "50" V 2000 9050 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V 1730 9100 50  0001 C CNN
F 3 "" H 1800 9100 50  0001 C CNN
	1    1800 9100
	0    -1   1    0   
$EndComp
$Comp
L power:GNDA #PWR0115
U 1 1 602125A5
P 1250 9500
F 0 "#PWR0115" H 1250 9250 50  0001 C CNN
F 1 "GNDA" H 1255 9327 50  0000 C CNN
F 2 "" H 1250 9500 50  0001 C CNN
F 3 "" H 1250 9500 50  0001 C CNN
	1    1250 9500
	-1   0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0116
U 1 1 602125AF
P 1250 8500
F 0 "#PWR0116" H 1250 8350 50  0001 C CNN
F 1 "+3.3V" H 1265 8673 50  0000 C CNN
F 2 "" H 1250 8500 50  0001 C CNN
F 3 "" H 1250 8500 50  0001 C CNN
	1    1250 8500
	-1   0    0    -1  
$EndComp
Text GLabel 1950 8800 2    59   Input ~ 0
sck
Text GLabel 1950 9100 2    59   Input ~ 0
cs_2
Text GLabel 1950 8900 2    39   Input ~ 0
mosi
Text GLabel 1950 9000 2    39   Input ~ 0
miso
$Comp
L instrumnet-rescue:R-2164VCA-rescue R27
U 1 1 602125BD
P 3000 9000
F 0 "R27" V 3000 9000 50  0000 L CNN
F 1 "1M" V 3100 8950 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V 2930 9000 50  0001 C CNN
F 3 "" H 3000 9000 50  0001 C CNN
	1    3000 9000
	1    0    0    1   
$EndComp
Text GLabel 3000 9150 2    59   Input ~ 0
cs_2
$Comp
L power:+3.3V #PWR0117
U 1 1 602125C8
P 3000 8850
F 0 "#PWR0117" H 3000 8700 50  0001 C CNN
F 1 "+3.3V" H 3015 9023 50  0000 C CNN
F 2 "" H 3000 8850 50  0001 C CNN
F 3 "" H 3000 8850 50  0001 C CNN
	1    3000 8850
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C18
U 1 1 602125D2
P -350 9000
F 0 "C18" H -258 9046 50  0000 L CNN
F 1 ".1u" H -258 8955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H -350 9000 50  0001 C CNN
F 3 "~" H -350 9000 50  0001 C CNN
	1    -350 9000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C19
U 1 1 602125DC
P -350 9400
F 0 "C19" H -258 9446 50  0000 L CNN
F 1 ".1u" H -258 9355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H -350 9400 50  0001 C CNN
F 3 "~" H -350 9400 50  0001 C CNN
	1    -350 9400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C10
U 1 1 602125E6
P -650 9200
F 0 "C10" H -558 9246 50  0000 L CNN
F 1 "1u" H -558 9155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H -650 9200 50  0001 C CNN
F 3 "~" H -650 9200 50  0001 C CNN
	1    -650 9200
	1    0    0    -1  
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R7
U 1 1 602125F0
P -1050 9100
F 0 "R7" V -1050 9100 50  0000 L CNN
F 1 "500" V -1150 9050 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1120 9100 50  0001 C CNN
F 3 "" H -1050 9100 50  0001 C CNN
	1    -1050 9100
	0    -1   1    0   
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R8
U 1 1 602125FA
P -1050 9300
F 0 "R8" V -1050 9300 50  0000 L CNN
F 1 "500" V -950 9250 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1120 9300 50  0001 C CNN
F 3 "" H -1050 9300 50  0001 C CNN
	1    -1050 9300
	0    -1   1    0   
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R3
U 1 1 60212604
P -1200 8950
F 0 "R3" V -1200 8950 50  0000 L CNN
F 1 "1M" V -1100 8900 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1270 8950 50  0001 C CNN
F 3 "" H -1200 8950 50  0001 C CNN
	1    -1200 8950
	-1   0    0    -1  
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R4
U 1 1 6021260E
P -1200 9450
F 0 "R4" V -1200 9450 50  0000 L CNN
F 1 "1M" V -1100 9400 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1270 9450 50  0001 C CNN
F 3 "" H -1200 9450 50  0001 C CNN
	1    -1200 9450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	-900 9300 -650 9300
Connection ~ -650 9300
Wire Wire Line
	-650 9300 -350 9300
Wire Wire Line
	-900 9100 -650 9100
Connection ~ -650 9100
Wire Wire Line
	-650 9100 -350 9100
$Comp
L power:+3.3V #PWR0118
U 1 1 6021261E
P -1200 8800
F 0 "#PWR0118" H -1200 8650 50  0001 C CNN
F 1 "+3.3V" H -1185 8973 50  0000 C CNN
F 2 "" H -1200 8800 50  0001 C CNN
F 3 "" H -1200 8800 50  0001 C CNN
	1    -1200 8800
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0119
U 1 1 60212628
P -1200 9600
F 0 "#PWR0119" H -1200 9350 50  0001 C CNN
F 1 "GNDA" H -1195 9427 50  0000 C CNN
F 2 "" H -1200 9600 50  0001 C CNN
F 3 "" H -1200 9600 50  0001 C CNN
	1    -1200 9600
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0120
U 1 1 60212632
P -350 9500
F 0 "#PWR0120" H -350 9250 50  0001 C CNN
F 1 "GNDA" H -345 9327 50  0000 C CNN
F 2 "" H -350 9500 50  0001 C CNN
F 3 "" H -350 9500 50  0001 C CNN
	1    -350 9500
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0121
U 1 1 6021263C
P -350 8900
F 0 "#PWR0121" H -350 8650 50  0001 C CNN
F 1 "GNDA" H -345 8727 50  0000 C CNN
F 2 "" H -350 8900 50  0001 C CNN
F 3 "" H -350 8900 50  0001 C CNN
	1    -350 8900
	1    0    0    1   
$EndComp
$Comp
L Device:C_Small C11
U 1 1 60212646
P -350 7650
F 0 "C11" H -258 7696 50  0000 L CNN
F 1 ".1u" H -258 7605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H -350 7650 50  0001 C CNN
F 3 "~" H -350 7650 50  0001 C CNN
	1    -350 7650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C17
U 1 1 60212650
P -350 8050
F 0 "C17" H -258 8096 50  0000 L CNN
F 1 ".1u" H -258 8005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H -350 8050 50  0001 C CNN
F 3 "~" H -350 8050 50  0001 C CNN
	1    -350 8050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 6021265A
P -650 7850
F 0 "C8" H -558 7896 50  0000 L CNN
F 1 "1u" H -558 7805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H -650 7850 50  0001 C CNN
F 3 "~" H -650 7850 50  0001 C CNN
	1    -650 7850
	1    0    0    -1  
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R5
U 1 1 60212664
P -1050 7750
F 0 "R5" V -1050 7750 50  0000 L CNN
F 1 "500" V -1150 7700 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1120 7750 50  0001 C CNN
F 3 "" H -1050 7750 50  0001 C CNN
	1    -1050 7750
	0    -1   1    0   
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R6
U 1 1 6021266E
P -1050 7950
F 0 "R6" V -1050 7950 50  0000 L CNN
F 1 "500" V -950 7900 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1120 7950 50  0001 C CNN
F 3 "" H -1050 7950 50  0001 C CNN
	1    -1050 7950
	0    -1   1    0   
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R1
U 1 1 60212678
P -1200 7600
F 0 "R1" V -1200 7600 50  0000 L CNN
F 1 "1M" V -1100 7550 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1270 7600 50  0001 C CNN
F 3 "" H -1200 7600 50  0001 C CNN
	1    -1200 7600
	-1   0    0    -1  
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R2
U 1 1 60212682
P -1200 8100
F 0 "R2" V -1200 8100 50  0000 L CNN
F 1 "1M" V -1100 8050 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1270 8100 50  0001 C CNN
F 3 "" H -1200 8100 50  0001 C CNN
	1    -1200 8100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	-900 7950 -650 7950
Connection ~ -650 7950
Wire Wire Line
	-650 7950 -350 7950
Wire Wire Line
	-900 7750 -650 7750
Connection ~ -650 7750
Wire Wire Line
	-650 7750 -350 7750
$Comp
L power:+3.3V #PWR0125
U 1 1 60212692
P -1200 7450
F 0 "#PWR0125" H -1200 7300 50  0001 C CNN
F 1 "+3.3V" H -1185 7623 50  0000 C CNN
F 2 "" H -1200 7450 50  0001 C CNN
F 3 "" H -1200 7450 50  0001 C CNN
	1    -1200 7450
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0126
U 1 1 6021269C
P -1200 8250
F 0 "#PWR0126" H -1200 8000 50  0001 C CNN
F 1 "GNDA" H -1195 8077 50  0000 C CNN
F 2 "" H -1200 8250 50  0001 C CNN
F 3 "" H -1200 8250 50  0001 C CNN
	1    -1200 8250
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0127
U 1 1 602126A6
P -350 8150
F 0 "#PWR0127" H -350 7900 50  0001 C CNN
F 1 "GNDA" H -345 7977 50  0000 C CNN
F 2 "" H -350 8150 50  0001 C CNN
F 3 "" H -350 8150 50  0001 C CNN
	1    -350 8150
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0128
U 1 1 602126B0
P -350 7550
F 0 "#PWR0128" H -350 7300 50  0001 C CNN
F 1 "GNDA" H -345 7377 50  0000 C CNN
F 2 "" H -350 7550 50  0001 C CNN
F 3 "" H -350 7550 50  0001 C CNN
	1    -350 7550
	1    0    0    1   
$EndComp
Wire Wire Line
	850  8800 800  8800
Connection ~ -350 9100
Wire Wire Line
	600  9300 -350 9300
Connection ~ -350 9300
Connection ~ -350 7750
Connection ~ -350 7950
$Comp
L Device:C_Small C23
U 1 1 602126C1
P 1650 8150
F 0 "C23" H 1742 8196 50  0000 L CNN
F 1 ".1u" H 1742 8105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H 1650 8150 50  0001 C CNN
F 3 "~" H 1650 8150 50  0001 C CNN
	1    1650 8150
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0129
U 1 1 602126CB
P 1650 8250
F 0 "#PWR0129" H 1650 8000 50  0001 C CNN
F 1 "GNDA" H 1655 8077 50  0000 C CNN
F 2 "" H 1650 8250 50  0001 C CNN
F 3 "" H 1650 8250 50  0001 C CNN
	1    1650 8250
	-1   0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0130
U 1 1 602126D5
P 1650 8050
F 0 "#PWR0130" H 1650 7900 50  0001 C CNN
F 1 "+3.3V" H 1665 8223 50  0000 C CNN
F 2 "" H 1650 8050 50  0001 C CNN
F 3 "" H 1650 8050 50  0001 C CNN
	1    1650 8050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	-1450 9100 -1200 9100
Connection ~ -1200 9100
Wire Wire Line
	-1450 9300 -1200 9300
Connection ~ -1200 9300
Wire Wire Line
	-1450 7750 -1200 7750
Wire Wire Line
	-1450 7950 -1200 7950
Connection ~ -1200 7750
Connection ~ -1200 7950
Text GLabel -1450 9100 0    59   Input ~ 0
tc4+
$Comp
L Analog_ADC:ADS1118IDGS U3
U 1 1 602126F3
P 1250 9000
F 0 "U3" H 1250 8900 50  0000 C CNN
F 1 "ADS1118IDGS" H 1550 9500 50  0000 C CNN
F 2 "Package_SO:TSSOP-10_3x3mm_P0.5mm" H 1200 8950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ads1118.pdf" H 350 9400 50  0001 C CNN
	1    1250 9000
	1    0    0    -1  
$EndComp
Wire Wire Line
	-350 9100 850  9100
Wire Wire Line
	600  9200 850  9200
Wire Wire Line
	600  9200 600  9300
Wire Wire Line
	600  8900 600  7950
Wire Wire Line
	600  8900 850  8900
Wire Wire Line
	600  7950 -350 7950
Wire Wire Line
	800  7750 800  8800
Wire Wire Line
	-350 7750 800  7750
Text GLabel -1450 9300 0    59   Input ~ 0
tc4-
Text GLabel -1450 7750 0    59   Input ~ 0
tc3+
Text GLabel -1450 7950 0    59   Input ~ 0
tc3-
$Comp
L Connector:Conn_01x12_Male J3
U 1 1 60323D1A
P -3200 5000
F 0 "J3" H -3092 5681 50  0000 C CNN
F 1 "TC" H -3092 5590 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:ScrewTerminal_1x12_P2.54mm_Vertical" H -3200 5000 50  0001 C CNN
F 3 "~" H -3200 5000 50  0001 C CNN
	1    -3200 5000
	1    0    0    -1  
$EndComp
Text GLabel -3000 5200 2    59   Input ~ 0
tc4+
Text GLabel -3000 5100 2    59   Input ~ 0
tc4-
Text GLabel -3000 4900 2    59   Input ~ 0
tc3-
Text GLabel -3000 5000 2    59   Input ~ 0
tc3+
Text GLabel -3000 4700 2    59   Input ~ 0
tc2-
Text GLabel -3000 4800 2    59   Input ~ 0
tc2+
Text GLabel -3000 4500 2    59   Input ~ 0
tc1-
Text GLabel -3000 4600 2    59   Input ~ 0
tc1+
$Comp
L instrumnet-rescue:R-2164VCA-rescue R36
U 1 1 6042B9DF
P 1750 11850
F 0 "R36" V 1750 11850 50  0000 L CNN
F 1 "50" V 1600 11800 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V 1680 11850 50  0001 C CNN
F 3 "" H 1750 11850 50  0001 C CNN
	1    1750 11850
	0    -1   1    0   
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R37
U 1 1 6042B9E9
P 1750 11950
F 0 "R37" V 1750 11950 50  0000 L CNN
F 1 "50" V 1550 11900 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V 1680 11950 50  0001 C CNN
F 3 "" H 1750 11950 50  0001 C CNN
	1    1750 11950
	0    -1   1    0   
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R38
U 1 1 6042B9F3
P 1750 12050
F 0 "R38" V 1750 12050 50  0000 L CNN
F 1 "50" V 1950 12000 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V 1680 12050 50  0001 C CNN
F 3 "" H 1750 12050 50  0001 C CNN
	1    1750 12050
	0    -1   1    0   
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R39
U 1 1 6042B9FD
P 1750 12150
F 0 "R39" V 1750 12150 50  0000 L CNN
F 1 "50" V 1950 12100 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V 1680 12150 50  0001 C CNN
F 3 "" H 1750 12150 50  0001 C CNN
	1    1750 12150
	0    -1   1    0   
$EndComp
$Comp
L power:GNDA #PWR0131
U 1 1 6042BA07
P 1200 12550
F 0 "#PWR0131" H 1200 12300 50  0001 C CNN
F 1 "GNDA" H 1205 12377 50  0000 C CNN
F 2 "" H 1200 12550 50  0001 C CNN
F 3 "" H 1200 12550 50  0001 C CNN
	1    1200 12550
	-1   0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0133
U 1 1 6042BA11
P 1200 11550
F 0 "#PWR0133" H 1200 11400 50  0001 C CNN
F 1 "+3.3V" H 1215 11723 50  0000 C CNN
F 2 "" H 1200 11550 50  0001 C CNN
F 3 "" H 1200 11550 50  0001 C CNN
	1    1200 11550
	-1   0    0    -1  
$EndComp
Text GLabel 1900 11850 2    59   Input ~ 0
sck
Text GLabel 1900 12150 2    59   Input ~ 0
cs_3
Text GLabel 1900 11950 2    39   Input ~ 0
mosi
Text GLabel 1900 12050 2    39   Input ~ 0
miso
$Comp
L instrumnet-rescue:R-2164VCA-rescue R40
U 1 1 6042BA1F
P 2950 12050
F 0 "R40" V 2950 12050 50  0000 L CNN
F 1 "1M" V 3050 12000 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V 2880 12050 50  0001 C CNN
F 3 "" H 2950 12050 50  0001 C CNN
	1    2950 12050
	1    0    0    1   
$EndComp
Text GLabel 2950 12200 2    59   Input ~ 0
cs_3
$Comp
L power:+3.3V #PWR0134
U 1 1 6042BA2A
P 2950 11900
F 0 "#PWR0134" H 2950 11750 50  0001 C CNN
F 1 "+3.3V" H 2965 12073 50  0000 C CNN
F 2 "" H 2950 11900 50  0001 C CNN
F 3 "" H 2950 11900 50  0001 C CNN
	1    2950 11900
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C28
U 1 1 6042BA34
P -400 12050
F 0 "C28" H -308 12096 50  0000 L CNN
F 1 ".1u" H -308 12005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H -400 12050 50  0001 C CNN
F 3 "~" H -400 12050 50  0001 C CNN
	1    -400 12050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C29
U 1 1 6042BA3E
P -400 12450
F 0 "C29" H -308 12496 50  0000 L CNN
F 1 ".1u" H -308 12405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H -400 12450 50  0001 C CNN
F 3 "~" H -400 12450 50  0001 C CNN
	1    -400 12450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C25
U 1 1 6042BA48
P -700 12250
F 0 "C25" H -608 12296 50  0000 L CNN
F 1 "1u" H -608 12205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H -700 12250 50  0001 C CNN
F 3 "~" H -700 12250 50  0001 C CNN
	1    -700 12250
	1    0    0    -1  
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R34
U 1 1 6042BA52
P -1100 12150
F 0 "R34" V -1100 12150 50  0000 L CNN
F 1 "500" V -1200 12100 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1170 12150 50  0001 C CNN
F 3 "" H -1100 12150 50  0001 C CNN
	1    -1100 12150
	0    -1   1    0   
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R35
U 1 1 6042BA5C
P -1100 12350
F 0 "R35" V -1100 12350 50  0000 L CNN
F 1 "500" V -1000 12300 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1170 12350 50  0001 C CNN
F 3 "" H -1100 12350 50  0001 C CNN
	1    -1100 12350
	0    -1   1    0   
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R30
U 1 1 6042BA66
P -1250 12000
F 0 "R30" V -1250 12000 50  0000 L CNN
F 1 "1M" V -1150 11950 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1320 12000 50  0001 C CNN
F 3 "" H -1250 12000 50  0001 C CNN
	1    -1250 12000
	-1   0    0    -1  
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R31
U 1 1 6042BA70
P -1250 12500
F 0 "R31" V -1250 12500 50  0000 L CNN
F 1 "1M" V -1150 12450 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1320 12500 50  0001 C CNN
F 3 "" H -1250 12500 50  0001 C CNN
	1    -1250 12500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	-950 12350 -700 12350
Connection ~ -700 12350
Wire Wire Line
	-700 12350 -400 12350
Wire Wire Line
	-950 12150 -700 12150
Connection ~ -700 12150
Wire Wire Line
	-700 12150 -400 12150
$Comp
L power:+3.3V #PWR0146
U 1 1 6042BA80
P -1250 11850
F 0 "#PWR0146" H -1250 11700 50  0001 C CNN
F 1 "+3.3V" H -1235 12023 50  0000 C CNN
F 2 "" H -1250 11850 50  0001 C CNN
F 3 "" H -1250 11850 50  0001 C CNN
	1    -1250 11850
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0154
U 1 1 6042BA8A
P -1250 12650
F 0 "#PWR0154" H -1250 12400 50  0001 C CNN
F 1 "GNDA" H -1245 12477 50  0000 C CNN
F 2 "" H -1250 12650 50  0001 C CNN
F 3 "" H -1250 12650 50  0001 C CNN
	1    -1250 12650
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0155
U 1 1 6042BA94
P -400 12550
F 0 "#PWR0155" H -400 12300 50  0001 C CNN
F 1 "GNDA" H -395 12377 50  0000 C CNN
F 2 "" H -400 12550 50  0001 C CNN
F 3 "" H -400 12550 50  0001 C CNN
	1    -400 12550
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0156
U 1 1 6042BA9E
P -400 11950
F 0 "#PWR0156" H -400 11700 50  0001 C CNN
F 1 "GNDA" H -395 11777 50  0000 C CNN
F 2 "" H -400 11950 50  0001 C CNN
F 3 "" H -400 11950 50  0001 C CNN
	1    -400 11950
	1    0    0    1   
$EndComp
$Comp
L Device:C_Small C26
U 1 1 6042BAA8
P -400 10700
F 0 "C26" H -308 10746 50  0000 L CNN
F 1 ".1u" H -308 10655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H -400 10700 50  0001 C CNN
F 3 "~" H -400 10700 50  0001 C CNN
	1    -400 10700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C27
U 1 1 6042BAB2
P -400 11100
F 0 "C27" H -308 11146 50  0000 L CNN
F 1 ".1u" H -308 11055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H -400 11100 50  0001 C CNN
F 3 "~" H -400 11100 50  0001 C CNN
	1    -400 11100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C24
U 1 1 6042BABC
P -700 10900
F 0 "C24" H -608 10946 50  0000 L CNN
F 1 "1u" H -608 10855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H -700 10900 50  0001 C CNN
F 3 "~" H -700 10900 50  0001 C CNN
	1    -700 10900
	1    0    0    -1  
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R32
U 1 1 6042BAC6
P -1100 10800
F 0 "R32" V -1100 10800 50  0000 L CNN
F 1 "500" V -1200 10750 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1170 10800 50  0001 C CNN
F 3 "" H -1100 10800 50  0001 C CNN
	1    -1100 10800
	0    -1   1    0   
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R33
U 1 1 6042BAD0
P -1100 11000
F 0 "R33" V -1100 11000 50  0000 L CNN
F 1 "500" V -1000 10950 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1170 11000 50  0001 C CNN
F 3 "" H -1100 11000 50  0001 C CNN
	1    -1100 11000
	0    -1   1    0   
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R28
U 1 1 6042BADA
P -1250 10650
F 0 "R28" V -1250 10650 50  0000 L CNN
F 1 "1M" V -1150 10600 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1320 10650 50  0001 C CNN
F 3 "" H -1250 10650 50  0001 C CNN
	1    -1250 10650
	-1   0    0    -1  
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue R29
U 1 1 6042BAE4
P -1250 11150
F 0 "R29" V -1250 11150 50  0000 L CNN
F 1 "1M" V -1150 11100 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V -1320 11150 50  0001 C CNN
F 3 "" H -1250 11150 50  0001 C CNN
	1    -1250 11150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	-950 11000 -700 11000
Connection ~ -700 11000
Wire Wire Line
	-700 11000 -400 11000
Wire Wire Line
	-950 10800 -700 10800
Connection ~ -700 10800
Wire Wire Line
	-700 10800 -400 10800
$Comp
L power:+3.3V #PWR0157
U 1 1 6042BAF4
P -1250 10500
F 0 "#PWR0157" H -1250 10350 50  0001 C CNN
F 1 "+3.3V" H -1235 10673 50  0000 C CNN
F 2 "" H -1250 10500 50  0001 C CNN
F 3 "" H -1250 10500 50  0001 C CNN
	1    -1250 10500
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0158
U 1 1 6042BAFE
P -1250 11300
F 0 "#PWR0158" H -1250 11050 50  0001 C CNN
F 1 "GNDA" H -1245 11127 50  0000 C CNN
F 2 "" H -1250 11300 50  0001 C CNN
F 3 "" H -1250 11300 50  0001 C CNN
	1    -1250 11300
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0159
U 1 1 6042BB08
P -400 11200
F 0 "#PWR0159" H -400 10950 50  0001 C CNN
F 1 "GNDA" H -395 11027 50  0000 C CNN
F 2 "" H -400 11200 50  0001 C CNN
F 3 "" H -400 11200 50  0001 C CNN
	1    -400 11200
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0160
U 1 1 6042BB12
P -400 10600
F 0 "#PWR0160" H -400 10350 50  0001 C CNN
F 1 "GNDA" H -395 10427 50  0000 C CNN
F 2 "" H -400 10600 50  0001 C CNN
F 3 "" H -400 10600 50  0001 C CNN
	1    -400 10600
	1    0    0    1   
$EndComp
Wire Wire Line
	800  11850 750  11850
Connection ~ -400 12150
Wire Wire Line
	550  12350 -400 12350
Connection ~ -400 12350
Connection ~ -400 10800
Connection ~ -400 11000
$Comp
L Device:C_Small C30
U 1 1 6042BB22
P 1600 11200
F 0 "C30" H 1692 11246 50  0000 L CNN
F 1 ".1u" H 1692 11155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_fabdesignatorsmall" H 1600 11200 50  0001 C CNN
F 3 "~" H 1600 11200 50  0001 C CNN
	1    1600 11200
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0161
U 1 1 6042BB2C
P 1600 11300
F 0 "#PWR0161" H 1600 11050 50  0001 C CNN
F 1 "GNDA" H 1605 11127 50  0000 C CNN
F 2 "" H 1600 11300 50  0001 C CNN
F 3 "" H 1600 11300 50  0001 C CNN
	1    1600 11300
	-1   0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0162
U 1 1 6042BB36
P 1600 11100
F 0 "#PWR0162" H 1600 10950 50  0001 C CNN
F 1 "+3.3V" H 1615 11273 50  0000 C CNN
F 2 "" H 1600 11100 50  0001 C CNN
F 3 "" H 1600 11100 50  0001 C CNN
	1    1600 11100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	-1500 12150 -1250 12150
Connection ~ -1250 12150
Wire Wire Line
	-1500 12350 -1250 12350
Connection ~ -1250 12350
Wire Wire Line
	-1500 10800 -1250 10800
Wire Wire Line
	-1500 11000 -1250 11000
Connection ~ -1250 10800
Connection ~ -1250 11000
Text GLabel -1500 12150 0    59   Input ~ 0
tc6+
$Comp
L Analog_ADC:ADS1118IDGS U4
U 1 1 6042BB49
P 1200 12050
F 0 "U4" H 1200 11950 50  0000 C CNN
F 1 "ADS1118IDGS" H 1500 12550 50  0000 C CNN
F 2 "Package_SO:TSSOP-10_3x3mm_P0.5mm" H 1150 12000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ads1118.pdf" H 300 12450 50  0001 C CNN
	1    1200 12050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-400 12150 800  12150
Wire Wire Line
	550  12250 800  12250
Wire Wire Line
	550  12250 550  12350
Wire Wire Line
	550  11950 550  11000
Wire Wire Line
	550  11950 800  11950
Wire Wire Line
	550  11000 -400 11000
Wire Wire Line
	750  10800 750  11850
Wire Wire Line
	-400 10800 750  10800
Text GLabel -1500 12350 0    59   Input ~ 0
tc6-
Text GLabel -1500 10800 0    59   Input ~ 0
tc5+
Text GLabel -1500 11000 0    59   Input ~ 0
tc5-
Text GLabel 8000 5550 2    59   Input ~ 0
cs_1
Text GLabel 8000 5650 2    59   Input ~ 0
cs_2
Text GLabel 8000 5750 2    59   Input ~ 0
cs_3
Text GLabel 13000 7450 0    59   Input ~ 0
rxd
Text GLabel -3000 5600 2    59   Input ~ 0
tc6+
Text GLabel -3000 5500 2    59   Input ~ 0
tc6-
Text GLabel -3000 5400 2    59   Input ~ 0
tc5+
Text GLabel -3000 5300 2    59   Input ~ 0
tc5-
NoConn ~ 8000 4250
NoConn ~ 8000 5250
$Comp
L power:GNDA #PWR0163
U 1 1 600DF0B5
P 5500 4450
F 0 "#PWR0163" H 5500 4200 50  0001 C CNN
F 1 "GNDA" H 5505 4277 50  0000 C CNN
F 2 "" H 5500 4450 50  0001 C CNN
F 3 "" H 5500 4450 50  0001 C CNN
	1    5500 4450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5500 4450 5750 4450
$Comp
L instrumnet-rescue:R-2164VCA-rescue Rterm2
U 1 1 6010A8B9
P 10450 1050
F 0 "Rterm2" H 10550 1000 50  0000 L CNN
F 1 "50" H 10550 900 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V 10380 1050 50  0001 C CNN
F 3 "" H 10450 1050 50  0001 C CNN
	1    10450 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 900  10450 900 
Wire Wire Line
	10250 900  10250 1250
Connection ~ 10450 900 
Wire Wire Line
	10450 900  10650 900 
$Comp
L instrumnet-rescue:R-2164VCA-rescue Ri2cSCL2
U 1 1 6011D5A0
P 10800 3800
F 0 "Ri2cSCL2" H 10350 3850 50  0000 L CNN
F 1 "500" H 10350 3750 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V 10730 3800 50  0001 C CNN
F 3 "" H 10800 3800 50  0001 C CNN
	1    10800 3800
	1    0    0    -1  
$EndComp
$Comp
L instrumnet-rescue:R-2164VCA-rescue Ri2cSDA2
U 1 1 6011D5AA
P 11000 3800
F 0 "Ri2cSDA2" H 11100 3850 50  0000 L CNN
F 1 "500" H 11100 3750 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_fabdesignatorsmall" V 10930 3800 50  0001 C CNN
F 3 "" H 11000 3800 50  0001 C CNN
	1    11000 3800
	1    0    0    -1  
$EndComp
$EndSCHEMATC
