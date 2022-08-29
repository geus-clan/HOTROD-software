EESchema Schematic File Version 4
LIBS:instrumnet-cache
EELAYER 26 0
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
$Comp
L isl3160e:ISL3160E U4
U 1 1 5DADBA15
P 7800 1750
F 0 "U4" H 7800 2628 50  0000 C CNN
F 1 "ISL3160E" H 7800 2537 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-14_3.9x8.7mm_Pitch1.27mm" H 7800 1750 50  0001 C CIN
F 3 "" H 7800 1750 50  0000 C CNN
	1    7800 1750
	1    0    0    -1  
$EndComp
$Comp
L 2164VCA-rescue:R R6
U 1 1 5DADBAB2
P 9850 1150
F 0 "R6" V 9643 1150 50  0000 C CNN
F 1 "Rtermination" V 9734 1150 50  0000 C CNN
F 2 "New folder:R_1206_HandSoldering_silkskreenlabel" V 9780 1150 50  0001 C CNN
F 3 "" H 9850 1150 50  0001 C CNN
	1    9850 1150
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J4
U 1 1 5DADBBA9
P 11450 1050
F 0 "J4" H 11477 1026 50  0000 L CNN
F 1 "RS485_in" H 11477 935 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 11450 1050 50  0001 C CNN
F 3 "~" H 11450 1050 50  0001 C CNN
	1    11450 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 1250 10000 1150
Connection ~ 10000 1150
Wire Wire Line
	9700 1150 9700 1050
Connection ~ 9700 1050
Wire Wire Line
	9700 1050 10000 1050
$Comp
L _saved_synth-cache:C_Small C10
U 1 1 5DADBCFB
P 8150 900
F 0 "C10" H 8242 900 50  0000 L CNN
F 1 ".1u" H 8242 855 50  0001 L CNN
F 2 "New folder:C_1206_HandSoldering_decouple" H 8150 900 50  0001 C CNN
F 3 "" H 8150 900 50  0000 C CNN
	1    8150 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 1050 7700 800 
Wire Wire Line
	7700 800  8150 800 
$Comp
L power:GND #PWR0101
U 1 1 5DADBDA8
P 8150 1000
F 0 "#PWR0101" H 8150 750 50  0001 C CNN
F 1 "GND" H 8155 827 50  0000 C CNN
F 2 "" H 8150 1000 50  0001 C CNN
F 3 "" H 8150 1000 50  0001 C CNN
	1    8150 1000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 5DADBDDD
P 7700 800
F 0 "#PWR0102" H 7700 650 50  0001 C CNN
F 1 "+5V" H 7715 973 50  0000 C CNN
F 2 "" H 7700 800 50  0001 C CNN
F 3 "" H 7700 800 50  0001 C CNN
	1    7700 800 
	1    0    0    -1  
$EndComp
Connection ~ 7700 800 
$Comp
L power:GND #PWR0103
U 1 1 5DADBE33
P 7950 2450
F 0 "#PWR0103" H 7950 2200 50  0001 C CNN
F 1 "GND" H 7955 2277 50  0000 C CNN
F 2 "" H 7950 2450 50  0001 C CNN
F 3 "" H 7950 2450 50  0001 C CNN
	1    7950 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 2450 7950 2450
Connection ~ 7950 2450
Wire Wire Line
	7950 2450 8000 2450
Text Notes 9000 300  0    197  Italic 0
RS485
Text Notes 2100 7300 0    197  Italic 0
i2c pull up resistors\n
Text Notes 1550 7950 0    197  Italic 0
1.7k?
$Comp
L Sensor_Temperature:MAX31855KASA U2
U 1 1 5DADC27A
P 2150 4000
F 0 "U2" H 1700 3700 50  0000 C CNN
F 1 "MAX31855KASA" H 1750 3600 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-8-1EP_3.9x4.9mm_Pitch1.27mm" H 3150 3650 50  0001 C CIN
F 3 "http://datasheets.maximintegrated.com/en/ds/MAX31855.pdf" H 2150 4000 50  0001 C CNN
	1    2150 4000
	1    0    0    -1  
$EndComp
Text Notes 0    -550 0    197  Italic 0
3.3v operating supply and 5V RS485 signals\n3v3 for thermocouple driver & BNO
$Comp
L Regulator_Linear:LP2985-3.3 U1
U 1 1 5DADC734
P 2000 1800
F 0 "U1" H 2000 2142 50  0000 C CNN
F 1 "LP2985-3.3" H 2000 2051 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5_HandSoldering" H 2000 2125 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lp2985.pdf" H 2000 1800 50  0001 C CNN
	1    2000 1800
	1    0    0    -1  
$EndComp
$Comp
L 2164VCA-rescue:CP C6
U 1 1 5DADC79B
P 2750 1750
F 0 "C6" H 2868 1796 50  0000 L CNN
F 1 "10u" H 2868 1705 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 2788 1600 50  0001 C CNN
F 3 "" H 2750 1750 50  0001 C CNN
	1    2750 1750
	1    0    0    -1  
$EndComp
$Comp
L 2164VCA-rescue:CP C7
U 1 1 5DADC841
P 3100 1750
F 0 "C7" H 3218 1796 50  0000 L CNN
F 1 "10u" H 3218 1705 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 3138 1600 50  0001 C CNN
F 3 "" H 3100 1750 50  0001 C CNN
	1    3100 1750
	1    0    0    -1  
$EndComp
Text Notes 1700 1350 0    197  Italic 0
150mA max
Text Notes 2850 2250 0    59   ~ 0
ceramic\nbypass C0G\noutput caps X7R / C0G
$Comp
L _saved_synth-cache:C_Small C5
U 1 1 5DADC92F
P 2400 1900
F 0 "C5" H 2492 1946 50  0000 L CNN
F 1 "10n" H 2492 1855 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2400 1900 50  0001 C CNN
F 3 "" H 2400 1900 50  0000 C CNN
	1    2400 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 2100 2400 2100
Wire Wire Line
	2400 2100 2400 2000
Wire Wire Line
	2400 1700 2500 1700
Wire Wire Line
	2500 1700 2500 1600
Wire Wire Line
	2500 1600 2750 1600
Connection ~ 2750 1600
Wire Wire Line
	2750 1600 3100 1600
Wire Wire Line
	2750 1900 2750 2100
Wire Wire Line
	2750 2100 2400 2100
Connection ~ 2750 1900
Connection ~ 2400 2100
Wire Wire Line
	2750 1900 3100 1900
Text Notes 1450 800  0    39   Italic 0
\n'TI recommends that the trace from lead 2\n be extended under the package body and \nconnected to an internal ground plane with \nthermal vias.'
Text Notes 1500 2550 0    118  Italic 24
only ESD rated for HBM
$Comp
L power:+3.3V #PWR0104
U 1 1 5DADDE08
P 3100 1600
F 0 "#PWR0104" H 3100 1450 50  0001 C CNN
F 1 "+3.3V" H 3115 1773 50  0000 C CNN
F 2 "" H 3100 1600 50  0001 C CNN
F 3 "" H 3100 1600 50  0001 C CNN
	1    3100 1600
	1    0    0    -1  
$EndComp
Connection ~ 3100 1600
$Comp
L power:+3.3V #PWR0105
U 1 1 5DADDE2E
P 2150 3250
F 0 "#PWR0105" H 2150 3100 50  0001 C CNN
F 1 "+3.3V" H 2165 3423 50  0000 C CNN
F 2 "" H 2150 3250 50  0001 C CNN
F 3 "" H 2150 3250 50  0001 C CNN
	1    2150 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 3600 2150 3250
$Comp
L power:GND #PWR0106
U 1 1 5DADE3D4
P 2000 2100
F 0 "#PWR0106" H 2000 1850 50  0001 C CNN
F 1 "GND" H 2005 1927 50  0000 C CNN
F 2 "" H 2000 2100 50  0001 C CNN
F 3 "" H 2000 2100 50  0001 C CNN
	1    2000 2100
	1    0    0    -1  
$EndComp
Connection ~ 2000 2100
$Comp
L power:GND #PWR0107
U 1 1 5DADE3FA
P 2150 4400
F 0 "#PWR0107" H 2150 4150 50  0001 C CNN
F 1 "GND" H 2155 4227 50  0000 C CNN
F 2 "" H 2150 4400 50  0001 C CNN
F 3 "" H 2150 4400 50  0001 C CNN
	1    2150 4400
	1    0    0    -1  
$EndComp
Text GLabel 3350 3800 2    118  Input ~ 0
sck
Text GLabel 3350 4000 2    118  Input ~ 0
do
Text GLabel 3350 4200 2    118  Input ~ 0
cs_0
Text Notes 3450 3600 0    118  ~ 0
SPI
Wire Wire Line
	2550 3900 2700 3900
Wire Wire Line
	2700 3900 2700 4000
Wire Wire Line
	2550 4100 2700 4100
Wire Wire Line
	2700 4100 2700 4200
Wire Wire Line
	2700 4200 2800 4200
Text Notes 5400 8800 0    118  ~ 0
Consult page about PCB crystal routing for tips\nbasically nothing close\nground plane underneath
Text Notes 1200 3000 0    118  ~ 0
k-type thermocouple driver
$Comp
L MCU_Microchip_ATmega:ATmega328-AU U5
U 1 1 5DB1976B
P 9150 5050
F 0 "U5" H 9050 4100 50  0000 C CNN
F 1 "ATmega328-AU" H 9050 3950 50  0000 C CNN
F 2 "Housings_QFP:TQFP-32_7x7mm_Pitch0.8mm" H 9150 5050 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 9150 5050 50  0001 C CNN
	1    9150 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:Resonator Y1
U 1 1 5DB1C2D6
P 10250 4500
F 0 "Y1" V 10550 4200 50  0000 L CNN
F 1 "8MHz Resonator" V 10450 4050 50  0000 L CNN
F 2 "" H 10225 4500 50  0001 C CNN
F 3 "~" H 10225 4500 50  0001 C CNN
	1    10250 4500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10000 4650 10250 4650
Wire Wire Line
	9750 4550 10000 4550
Wire Wire Line
	10000 4550 10000 4650
Wire Wire Line
	10000 4450 10000 4350
Wire Wire Line
	10000 4350 10250 4350
Wire Wire Line
	9750 4450 10000 4450
Wire Wire Line
	10450 4500 10600 4500
Wire Wire Line
	10600 4500 10600 4650
$Comp
L power:GND #PWR0108
U 1 1 5DB1D674
P 10600 4650
F 0 "#PWR0108" H 10600 4400 50  0001 C CNN
F 1 "GND" H 10605 4477 50  0000 C CNN
F 2 "" H 10600 4650 50  0001 C CNN
F 3 "" H 10600 4650 50  0001 C CNN
	1    10600 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 3850 8550 3550
Wire Wire Line
	8550 3550 9150 3550
Connection ~ 9150 3550
$Comp
L _saved_synth-cache:C_Small C12
U 1 1 5DB1EAA8
P 10400 5350
F 0 "C12" H 10492 5396 50  0000 L CNN
F 1 "10n" H 10492 5305 50  0000 L CNN
F 2 "New folder:C_1206_HandSoldering" H 10400 5350 50  0001 C CNN
F 3 "" H 10400 5350 50  0000 C CNN
	1    10400 5350
	0    1    1    0   
$EndComp
$Comp
L 2164VCA-rescue:R R12
U 1 1 5DB1ECBE
P 10300 5200
F 0 "R12" H 10370 5246 50  0000 L CNN
F 1 "R" H 10370 5155 50  0000 L CNN
F 2 "New folder:R_1206_HandSoldering_silkskreenlabel" V 10230 5200 50  0001 C CNN
F 3 "" H 10300 5200 50  0001 C CNN
	1    10300 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 5350 10300 5350
Connection ~ 10300 5350
Text GLabel 10500 5350 2    118  Input ~ 0
dtr
$Comp
L Connector:Conn_01x06_Male J6
U 1 1 5DB1FA48
P 12350 7050
F 0 "J6" H 12323 6930 50  0000 R CNN
F 1 "Conn_01x06_Male" H 12323 7021 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 12350 7050 50  0001 C CNN
F 3 "~" H 12350 7050 50  0001 C CNN
	1    12350 7050
	-1   0    0    1   
$EndComp
Text GLabel 12150 6750 0    39   Input ~ 0
dtr
Text GLabel 12150 6950 0    39   Input ~ 0
txo
Text GLabel 12150 7150 0    39   Input ~ 0
cts
Text GLabel 12150 7250 0    39   Input ~ 0
gnd
Text GLabel 12150 6850 0    39   Input ~ 0
rxi
$Comp
L power:GND #PWR0109
U 1 1 5DB2131C
P 9150 6550
F 0 "#PWR0109" H 9150 6300 50  0001 C CNN
F 1 "GND" H 9155 6377 50  0000 C CNN
F 2 "" H 9150 6550 50  0001 C CNN
F 3 "" H 9150 6550 50  0001 C CNN
	1    9150 6550
	1    0    0    -1  
$EndComp
Text Notes -2900 1400 0    118  ~ 0
3.1-16 V input
$Comp
L 2164VCA-rescue:CP C11
U 1 1 5DB21CDF
P 10150 3800
F 0 "C11" H 10268 3846 50  0000 L CNN
F 1 "47u" H 10268 3755 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 10188 3650 50  0001 C CNN
F 3 "" H 10150 3800 50  0001 C CNN
	1    10150 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5DB21F68
P 10150 3950
F 0 "#PWR0110" H 10150 3700 50  0001 C CNN
F 1 "GND" H 10155 3777 50  0000 C CNN
F 2 "" H 10150 3950 50  0001 C CNN
F 3 "" H 10150 3950 50  0001 C CNN
	1    10150 3950
	1    0    0    -1  
$EndComp
$Comp
L _saved_synth-cache:C_Small C13
U 1 1 5DB22128
P 10600 3800
F 0 "C13" H 10692 3846 50  0000 L CNN
F 1 "1u" H 10692 3755 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 10600 3800 50  0001 C CNN
F 3 "" H 10600 3800 50  0000 C CNN
	1    10600 3800
	1    0    0    -1  
$EndComp
$Comp
L _saved_synth-cache:C_Small C14
U 1 1 5DB23C55
P 10900 3800
F 0 "C14" H 10992 3846 50  0000 L CNN
F 1 ".1u" H 10992 3755 50  0000 L CNN
F 2 "New folder:C_1206_HandSoldering_decouple" H 10900 3800 50  0001 C CNN
F 3 "" H 10900 3800 50  0000 C CNN
	1    10900 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 3700 10600 3700
Wire Wire Line
	10150 3650 10150 3700
Wire Wire Line
	10150 3700 10600 3700
Connection ~ 10600 3700
Wire Wire Line
	10150 3900 10600 3900
Connection ~ 10600 3900
Wire Wire Line
	10600 3900 10900 3900
Wire Wire Line
	10150 3900 10150 3950
Connection ~ 10150 3950
Text GLabel 9750 5250 2    59   Input ~ 0
scl
Text GLabel 9750 5150 2    59   Input ~ 0
sda
$Comp
L Device:Ferrite_Bead_Small L1
U 1 1 5DB27C07
P 850 3900
F 0 "L1" V 705 3900 50  0000 C CNN
F 1 "Ferrite_Bead_Small" V 704 3900 50  0001 C CNN
F 2 "New folder:ferrite_bead_handsolder-1206" V 780 3900 50  0001 C CNN
F 3 "~" H 850 3900 50  0001 C CNN
	1    850  3900
	0    1    1    0   
$EndComp
$Comp
L Device:Ferrite_Bead_Small L2
U 1 1 5DB27D28
P 850 4100
F 0 "L2" V 700 4100 50  0000 C CNN
F 1 "Ferrite_Bead_Small" V 700 4100 50  0001 C CNN
F 2 "New folder:ferrite_bead_handsolder-1206" V 780 4100 50  0001 C CNN
F 3 "~" H 850 4100 50  0001 C CNN
	1    850  4100
	0    -1   -1   0   
$EndComp
$Comp
L _saved_synth-cache:C_Small C3
U 1 1 5DB27FB2
P 1250 4000
F 0 "C3" H 1342 4046 50  0000 L CNN
F 1 "10n" H 1342 3955 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1250 4000 50  0001 C CNN
F 3 "" H 1250 4000 50  0000 C CNN
	1    1250 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  3900 1250 3900
Connection ~ 1250 3900
Wire Wire Line
	1250 3900 1750 3900
Wire Wire Line
	950  4100 1250 4100
Connection ~ 1250 4100
Wire Wire Line
	1250 4100 1750 4100
$Comp
L Connector:Conn_01x02_Female J2
U 1 1 5DB29DB1
P 0 4050
F 0 "J2" H -106 3817 50  0000 C CNN
F 1 "Conn_01x02_Female" H -106 3816 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 0   4050 50  0001 C CNN
F 3 "~" H 0   4050 50  0001 C CNN
	1    0    4050
	-1   0    0    1   
$EndComp
$Comp
L _saved_synth-cache:C_Small C1
U 1 1 5DB2C295
P 450 4000
F 0 "C1" H 542 4046 50  0000 L CNN
F 1 "optional" H 350 3850 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 450 4000 50  0001 C CNN
F 3 "" H 450 4000 50  0000 C CNN
	1    450  4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	200  3950 350  3950
Wire Wire Line
	350  3950 350  3900
Wire Wire Line
	350  3900 450  3900
Connection ~ 450  3900
Wire Wire Line
	450  3900 750  3900
Wire Wire Line
	200  4050 350  4050
Wire Wire Line
	350  4050 350  4100
Wire Wire Line
	350  4100 450  4100
Connection ~ 450  4100
Wire Wire Line
	450  4100 750  4100
Wire Notes Line
	-150 200  4300 200 
Text Notes 800  150  0    118  ~ 0
have this section near each other
$Comp
L Diode:1N4148 D2
U 1 1 5DB31C33
P 2950 4200
F 0 "D2" H 2850 4400 50  0000 C CNN
F 1 "1N4148" H 2750 4300 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 2950 4025 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/1N4148_1N4448.pdf" H 2950 4200 50  0001 C CNN
	1    2950 4200
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N4148 D1
U 1 1 5DB31CD5
P 2950 3800
F 0 "D1" H 2850 3600 50  0000 C CNN
F 1 "1N4148" H 2750 3700 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 2950 3625 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/1N4148_1N4448.pdf" H 2950 3800 50  0001 C CNN
	1    2950 3800
	-1   0    0    1   
$EndComp
Wire Wire Line
	3100 3800 3350 3800
Wire Wire Line
	3100 4200 3350 4200
Wire Wire Line
	2700 4000 3350 4000
Text GLabel 9750 5850 2    59   Input ~ 0
sck
Text GLabel 9750 6150 2    59   Input ~ 0
cs_0
Text GLabel 9750 6050 2    59   Input ~ 0
do
Text Notes 10000 6000 0    118  ~ 0
SPI
Text GLabel 9750 5550 2    59   Input ~ 0
rxd_3v3
Text GLabel 9750 5650 2    59   Input ~ 0
txd_3v3
Text Notes 6050 9250 0    118  ~ 0
add connectors for important pins (rx, tx, spi bus, reset, etc)
Text GLabel 7300 1950 0    59   Input ~ 0
txd
Text Notes 7450 -400 0    197  ~ 0
COM 1 and 2 of firn compaction logger deal with max 0-5V signals.
Text Notes 12100 5450 0    197  ~ 0
BNO85 quiic connector\nBNO rocks 3v3 input
Text Notes 12150 4500 0    197  ~ 0
12V power signal down the cable?
Text Notes 12350 2700 0    197  ~ 0
value of termination resistor should match characteristic impedence of cabĺe
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 5DB86B98
P -1000 1850
F 0 "J1" H -1106 1525 50  0000 C CNN
F 1 "vin" H -1106 1616 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H -1000 1850 50  0001 C CNN
F 3 "~" H -1000 1850 50  0001 C CNN
	1    -1000 1850
	-1   0    0    1   
$EndComp
$Comp
L 2164VCA-rescue:R R9
U 1 1 5DB8CB07
P 10000 1400
F 0 "R9" H 9800 1450 50  0000 L CNN
F 1 "opt_low" H 9600 1350 50  0000 L CNN
F 2 "New folder:R_1206_HandSoldering_silkskreenlabel" V 9930 1400 50  0001 C CNN
F 3 "" H 10000 1400 50  0001 C CNN
	1    10000 1400
	1    0    0    -1  
$EndComp
Connection ~ 10000 1250
$Comp
L 2164VCA-rescue:R R8
U 1 1 5DB8CBD6
P 10000 900
F 0 "R8" H 9800 1150 50  0000 L CNN
F 1 "opt_high" H 9600 1050 50  0000 L CNN
F 2 "New folder:R_1206_HandSoldering_silkskreenlabel" V 9930 900 50  0001 C CNN
F 3 "" H 10000 900 50  0001 C CNN
	1    10000 900 
	1    0    0    -1  
$EndComp
Connection ~ 10000 1050
$Comp
L power:+5V #PWR0111
U 1 1 5DB8CC4E
P 10000 750
F 0 "#PWR0111" H 10000 600 50  0001 C CNN
F 1 "+5V" H 10015 923 50  0000 C CNN
F 2 "" H 10000 750 50  0001 C CNN
F 3 "" H 10000 750 50  0001 C CNN
	1    10000 750 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5DB8CC99
P 10000 1550
F 0 "#PWR0112" H 10000 1300 50  0001 C CNN
F 1 "GND" H 10005 1377 50  0000 C CNN
F 2 "" H 10000 1550 50  0001 C CNN
F 3 "" H 10000 1550 50  0001 C CNN
	1    10000 1550
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Temperature:MAX31855KASA U3
U 1 1 5DB8F898
P 2150 6000
F 0 "U3" H 2150 6578 50  0000 C CNN
F 1 "MAX31855KASA" H 2150 6487 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-8-1EP_3.9x4.9mm_Pitch1.27mm" H 3150 5650 50  0001 C CIN
F 3 "http://datasheets.maximintegrated.com/en/ds/MAX31855.pdf" H 2150 6000 50  0001 C CNN
	1    2150 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0113
U 1 1 5DB8F89E
P 2150 5250
F 0 "#PWR0113" H 2150 5100 50  0001 C CNN
F 1 "+3.3V" H 2165 5423 50  0000 C CNN
F 2 "" H 2150 5250 50  0001 C CNN
F 3 "" H 2150 5250 50  0001 C CNN
	1    2150 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 5600 2150 5250
$Comp
L power:GND #PWR0114
U 1 1 5DB8F8A5
P 2150 6400
F 0 "#PWR0114" H 2150 6150 50  0001 C CNN
F 1 "GND" H 2155 6227 50  0000 C CNN
F 2 "" H 2150 6400 50  0001 C CNN
F 3 "" H 2150 6400 50  0001 C CNN
	1    2150 6400
	1    0    0    -1  
$EndComp
Text GLabel 3350 5800 2    118  Input ~ 0
sck
Text GLabel 3350 6000 2    118  Input ~ 0
do
Text GLabel 3350 6200 2    118  Input ~ 0
cs_1
Text Notes 3450 5600 0    118  ~ 0
SPI
Wire Wire Line
	2550 5900 2700 5900
Wire Wire Line
	2700 5900 2700 6000
Wire Wire Line
	2550 6100 2700 6100
Wire Wire Line
	2700 6100 2700 6200
Wire Wire Line
	2700 6200 2800 6200
$Comp
L Device:Ferrite_Bead_Small L3
U 1 1 5DB8F8B6
P 850 5900
F 0 "L3" V 705 5900 50  0000 C CNN
F 1 "Ferrite_Bead_Small" V 704 5900 50  0001 C CNN
F 2 "New folder:ferrite_bead_handsolder-1206" V 780 5900 50  0001 C CNN
F 3 "~" H 850 5900 50  0001 C CNN
	1    850  5900
	0    1    1    0   
$EndComp
$Comp
L Device:Ferrite_Bead_Small L4
U 1 1 5DB8F8BC
P 850 6100
F 0 "L4" V 700 6100 50  0000 C CNN
F 1 "Ferrite_Bead_Small" V 700 6100 50  0001 C CNN
F 2 "New folder:ferrite_bead_handsolder-1206" V 780 6100 50  0001 C CNN
F 3 "~" H 850 6100 50  0001 C CNN
	1    850  6100
	0    -1   -1   0   
$EndComp
$Comp
L _saved_synth-cache:C_Small C4
U 1 1 5DB8F8C2
P 1250 6000
F 0 "C4" H 1342 6046 50  0000 L CNN
F 1 "10n" H 1342 5955 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1250 6000 50  0001 C CNN
F 3 "" H 1250 6000 50  0000 C CNN
	1    1250 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  5900 1250 5900
Connection ~ 1250 5900
Wire Wire Line
	1250 5900 1750 5900
Wire Wire Line
	950  6100 1250 6100
Connection ~ 1250 6100
Wire Wire Line
	1250 6100 1750 6100
$Comp
L Connector:Conn_01x02_Female J3
U 1 1 5DB8F8CE
P 0 6050
F 0 "J3" H -106 5817 50  0000 C CNN
F 1 "Conn_01x02_Female" H -106 5816 50  0001 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 0   6050 50  0001 C CNN
F 3 "~" H 0   6050 50  0001 C CNN
	1    0    6050
	-1   0    0    1   
$EndComp
$Comp
L _saved_synth-cache:C_Small C2
U 1 1 5DB8F8D4
P 450 6000
F 0 "C2" H 542 6046 50  0000 L CNN
F 1 "optional" H 350 5850 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 450 6000 50  0001 C CNN
F 3 "" H 450 6000 50  0000 C CNN
	1    450  6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	200  5950 350  5950
Wire Wire Line
	350  5950 350  5900
Wire Wire Line
	350  5900 450  5900
Connection ~ 450  5900
Wire Wire Line
	450  5900 750  5900
Wire Wire Line
	200  6050 350  6050
Wire Wire Line
	350  6050 350  6100
Wire Wire Line
	350  6100 450  6100
Connection ~ 450  6100
Wire Wire Line
	450  6100 750  6100
$Comp
L Diode:1N4148 D4
U 1 1 5DB8F8E4
P 2950 6200
F 0 "D4" H 2800 6400 50  0000 C CNN
F 1 "1N4148" H 2700 6300 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 2950 6025 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/1N4148_1N4448.pdf" H 2950 6200 50  0001 C CNN
	1    2950 6200
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N4148 D3
U 1 1 5DB8F8EA
P 2950 5800
F 0 "D3" H 2800 5600 50  0000 C CNN
F 1 "1N4148" H 2700 5700 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 2950 5625 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/1N4148_1N4448.pdf" H 2950 5800 50  0001 C CNN
	1    2950 5800
	-1   0    0    1   
$EndComp
Wire Wire Line
	3100 5800 3350 5800
Wire Wire Line
	3100 6200 3350 6200
Wire Wire Line
	2700 6000 3350 6000
Text GLabel 9750 6250 2    59   Input ~ 0
cs_1
$Comp
L power:+5V #PWR0115
U 1 1 5DB9494F
P 900 1700
F 0 "#PWR0115" H 900 1550 50  0001 C CNN
F 1 "+5V" H 915 1873 50  0000 C CNN
F 2 "" H 900 1700 50  0001 C CNN
F 3 "" H 900 1700 50  0001 C CNN
	1    900  1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 1800 1400 1800
$Comp
L 2164VCA-rescue:R R1
U 1 1 5DBA743E
P 5950 4200
F 0 "R1" H 6020 4246 50  0000 L CNN
F 1 "10k" H 6020 4155 50  0000 L CNN
F 2 "New folder:R_1206_HandSoldering_silkskreenlabel" V 5880 4200 50  0001 C CNN
F 3 "" H 5950 4200 50  0001 C CNN
	1    5950 4200
	1    0    0    -1  
$EndComp
Wire Notes Line
	5150 8400 -150 8400
Wire Notes Line
	-150 200  -150 8400
Text GLabel 12150 7050 0    39   Input ~ 0
vcc
Text Notes 11950 7650 0    197  ~ 0
FTDI
$Comp
L _saved_synth-cache:C_Small C9
U 1 1 5DBBD8E3
P 7100 4200
F 0 "C9" H 7192 4200 50  0000 L CNN
F 1 ".1u" H 7192 4155 50  0001 L CNN
F 2 "New folder:C_1206_HandSoldering_decouple" H 7100 4200 50  0001 C CNN
F 3 "" H 7100 4200 50  0000 C CNN
	1    7100 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5DBBD9B1
P 7100 4300
F 0 "#PWR0116" H 7100 4050 50  0001 C CNN
F 1 "GND" H 7105 4127 50  0000 C CNN
F 2 "" H 7100 4300 50  0001 C CNN
F 3 "" H 7100 4300 50  0001 C CNN
	1    7100 4300
	1    0    0    -1  
$EndComp
$Comp
L _saved_synth-cache:C_Small C8
U 1 1 5DBBDCAB
P 5350 4150
F 0 "C8" H 5442 4150 50  0000 L CNN
F 1 ".1u" H 5442 4105 50  0001 L CNN
F 2 "New folder:C_1206_HandSoldering_decouple" H 5350 4150 50  0001 C CNN
F 3 "" H 5350 4150 50  0000 C CNN
	1    5350 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 5DBBDCB1
P 5350 4250
F 0 "#PWR0117" H 5350 4000 50  0001 C CNN
F 1 "GND" H 5355 4077 50  0000 C CNN
F 2 "" H 5350 4250 50  0001 C CNN
F 3 "" H 5350 4250 50  0001 C CNN
	1    5350 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 4100 7100 4050
Wire Wire Line
	5350 4050 5350 4000
Wire Wire Line
	2550 5800 2800 5800
$Comp
L Transistor_FET:BSS138 Q1
U 1 1 5DBD21B3
P 6350 4250
F 0 "Q1" V 6600 4250 50  0000 C CNN
F 1 "BSS138" V 6691 4250 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_handsoldering" H 6550 4175 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 6350 4250 50  0001 L CNN
	1    6350 4250
	0    1    1    0   
$EndComp
$Comp
L 2164VCA-rescue:R R3
U 1 1 5DBD5966
P 6650 4200
F 0 "R3" H 6720 4246 50  0000 L CNN
F 1 "10k" H 6720 4155 50  0000 L CNN
F 2 "New folder:R_1206_HandSoldering_silkskreenlabel" V 6580 4200 50  0001 C CNN
F 3 "" H 6650 4200 50  0001 C CNN
	1    6650 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 3800 2800 3800
Wire Wire Line
	6350 4050 5950 4050
Wire Wire Line
	6150 4350 5950 4350
$Comp
L power:+3.3V #PWR0118
U 1 1 5DBDC42C
P 5950 4050
F 0 "#PWR0118" H 5950 3900 50  0001 C CNN
F 1 "+3.3V" H 5800 4100 50  0000 C CNN
F 2 "" H 5950 4050 50  0001 C CNN
F 3 "" H 5950 4050 50  0001 C CNN
	1    5950 4050
	1    0    0    -1  
$EndComp
Connection ~ 5950 4050
$Comp
L power:+5V #PWR0119
U 1 1 5DBDC48D
P 6650 4050
F 0 "#PWR0119" H 6650 3900 50  0001 C CNN
F 1 "+5V" H 6800 4100 50  0000 C CNN
F 2 "" H 6650 4050 50  0001 C CNN
F 3 "" H 6650 4050 50  0001 C CNN
	1    6650 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 4350 6550 4350
$Comp
L power:+3.3V #PWR0120
U 1 1 5DBDFCD3
P 5350 4000
F 0 "#PWR0120" H 5350 3850 50  0001 C CNN
F 1 "+3.3V" H 5200 4050 50  0000 C CNN
F 2 "" H 5350 4000 50  0001 C CNN
F 3 "" H 5350 4000 50  0001 C CNN
	1    5350 4000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0121
U 1 1 5DBDFD34
P 7100 4050
F 0 "#PWR0121" H 7100 3900 50  0001 C CNN
F 1 "+5V" H 7250 4100 50  0000 C CNN
F 2 "" H 7100 4050 50  0001 C CNN
F 3 "" H 7100 4050 50  0001 C CNN
	1    7100 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 3550 9250 3550
$Comp
L power:+3.3V #PWR0122
U 1 1 5DBE13B6
P 9150 3550
F 0 "#PWR0122" H 9150 3400 50  0001 C CNN
F 1 "+3.3V" H 9000 3600 50  0000 C CNN
F 2 "" H 9150 3550 50  0001 C CNN
F 3 "" H 9150 3550 50  0001 C CNN
	1    9150 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0123
U 1 1 5DBE1646
P 10150 3650
F 0 "#PWR0123" H 10150 3500 50  0001 C CNN
F 1 "+3.3V" H 10000 3700 50  0000 C CNN
F 2 "" H 10150 3650 50  0001 C CNN
F 3 "" H 10150 3650 50  0001 C CNN
	1    10150 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0124
U 1 1 5DBE19DD
P 10300 5050
F 0 "#PWR0124" H 10300 4900 50  0001 C CNN
F 1 "+3.3V" H 10150 5100 50  0000 C CNN
F 2 "" H 10300 5050 50  0001 C CNN
F 3 "" H 10300 5050 50  0001 C CNN
	1    10300 5050
	1    0    0    -1  
$EndComp
$Comp
L 2164VCA-rescue:R R5
U 1 1 5DBE3207
P 6950 2350
F 0 "R5" H 6750 2400 50  0000 L CNN
F 1 "1k" H 6750 2300 50  0000 L CNN
F 2 "New folder:R_1206_HandSoldering_silkskreenlabel" V 6880 2350 50  0001 C CNN
F 3 "" H 6950 2350 50  0001 C CNN
	1    6950 2350
	-1   0    0    1   
$EndComp
Wire Wire Line
	6950 2200 6950 2150
Wire Wire Line
	6950 2150 7300 2150
$Comp
L power:+5V #PWR0125
U 1 1 5DBE64A3
P 6950 2500
F 0 "#PWR0125" H 6950 2350 50  0001 C CNN
F 1 "+5V" H 6965 2673 50  0000 C CNN
F 2 "" H 6950 2500 50  0001 C CNN
F 3 "" H 6950 2500 50  0001 C CNN
	1    6950 2500
	-1   0    0    1   
$EndComp
Text GLabel 6650 4350 2    59   Input ~ 0
txd
Text GLabel 7300 1450 0    59   Input ~ 0
rxd
$Comp
L power:GND #PWR0126
U 1 1 5DBE7220
P 7300 1650
F 0 "#PWR0126" H 7300 1400 50  0001 C CNN
F 1 "GND" H 7305 1477 50  0000 C CNN
F 2 "" H 7300 1650 50  0001 C CNN
F 3 "" H 7300 1650 50  0001 C CNN
	1    7300 1650
	0    1    1    0   
$EndComp
Wire Wire Line
	900  1700 1400 1700
Wire Wire Line
	1400 1800 1400 1700
Connection ~ 1400 1700
Wire Wire Line
	1400 1700 1600 1700
Text GLabel 5950 4350 0    59   Input ~ 0
txd_3v3
$Comp
L 2164VCA-rescue:R R2
U 1 1 5DBF57ED
P 5950 5100
F 0 "R2" H 6020 5146 50  0000 L CNN
F 1 "10k" H 6020 5055 50  0000 L CNN
F 2 "New folder:R_1206_HandSoldering_silkskreenlabel" V 5880 5100 50  0001 C CNN
F 3 "" H 5950 5100 50  0001 C CNN
	1    5950 5100
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:BSS138 Q2
U 1 1 5DBF57F3
P 6350 5150
F 0 "Q2" V 6600 5150 50  0000 C CNN
F 1 "BSS138" V 6691 5150 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_handsoldering" H 6550 5075 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 6350 5150 50  0001 L CNN
	1    6350 5150
	0    1    1    0   
$EndComp
$Comp
L 2164VCA-rescue:R R4
U 1 1 5DBF57F9
P 6650 5100
F 0 "R4" H 6720 5146 50  0000 L CNN
F 1 "10k" H 6720 5055 50  0000 L CNN
F 2 "New folder:R_1206_HandSoldering_silkskreenlabel" V 6580 5100 50  0001 C CNN
F 3 "" H 6650 5100 50  0001 C CNN
	1    6650 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 4950 5950 4950
Wire Wire Line
	6150 5250 5950 5250
$Comp
L power:+3.3V #PWR0127
U 1 1 5DBF5801
P 5950 4950
F 0 "#PWR0127" H 5950 4800 50  0001 C CNN
F 1 "+3.3V" H 5800 5000 50  0000 C CNN
F 2 "" H 5950 4950 50  0001 C CNN
F 3 "" H 5950 4950 50  0001 C CNN
	1    5950 4950
	1    0    0    -1  
$EndComp
Connection ~ 5950 4950
$Comp
L power:+5V #PWR0128
U 1 1 5DBF5808
P 6650 4950
F 0 "#PWR0128" H 6650 4800 50  0001 C CNN
F 1 "+5V" H 6800 5000 50  0000 C CNN
F 2 "" H 6650 4950 50  0001 C CNN
F 3 "" H 6650 4950 50  0001 C CNN
	1    6650 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 5250 6550 5250
Text GLabel 6650 5250 2    59   Input ~ 0
rxd
Text GLabel 5950 5250 0    59   Input ~ 0
rxd_3v3
Connection ~ 10150 3650
$Comp
L 2164VCA-rescue:R R7
U 1 1 5DC081FE
P 9850 2500
F 0 "R7" V 9643 2500 50  0000 C CNN
F 1 "Rtermination" V 9734 2500 50  0000 C CNN
F 2 "New folder:R_1206_HandSoldering_silkskreenlabel" V 9780 2500 50  0001 C CNN
F 3 "" H 9850 2500 50  0001 C CNN
	1    9850 2500
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J5
U 1 1 5DC08205
P 11550 2400
F 0 "J5" H 11577 2376 50  0000 L CNN
F 1 "RS485_out" H 11577 2285 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 11550 2400 50  0001 C CNN
F 3 "~" H 11550 2400 50  0001 C CNN
	1    11550 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 2600 10000 2500
Connection ~ 10000 2500
Wire Wire Line
	9700 2500 9700 2400
Connection ~ 9700 2400
Wire Wire Line
	9700 2400 10000 2400
$Comp
L 2164VCA-rescue:R R11
U 1 1 5DC0822C
P 10000 2750
F 0 "R11" H 9800 2800 50  0000 L CNN
F 1 "opt_low" H 9600 2700 50  0000 L CNN
F 2 "New folder:R_1206_HandSoldering_silkskreenlabel" V 9930 2750 50  0001 C CNN
F 3 "" H 10000 2750 50  0001 C CNN
	1    10000 2750
	1    0    0    -1  
$EndComp
$Comp
L 2164VCA-rescue:R R10
U 1 1 5DC08233
P 10000 2250
F 0 "R10" H 9800 2500 50  0000 L CNN
F 1 "opt_high" H 9600 2400 50  0000 L CNN
F 2 "New folder:R_1206_HandSoldering_silkskreenlabel" V 9930 2250 50  0001 C CNN
F 3 "" H 10000 2250 50  0001 C CNN
	1    10000 2250
	1    0    0    -1  
$EndComp
Connection ~ 10000 2400
$Comp
L power:+5V #PWR0129
U 1 1 5DC0823B
P 10000 2100
F 0 "#PWR0129" H 10000 1950 50  0001 C CNN
F 1 "+5V" H 10015 2273 50  0000 C CNN
F 2 "" H 10000 2100 50  0001 C CNN
F 3 "" H 10000 2100 50  0001 C CNN
	1    10000 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0130
U 1 1 5DC08241
P 10000 2900
F 0 "#PWR0130" H 10000 2650 50  0001 C CNN
F 1 "GND" H 10005 2727 50  0000 C CNN
F 2 "" H 10000 2900 50  0001 C CNN
F 3 "" H 10000 2900 50  0001 C CNN
	1    10000 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 1550 9000 1250
Wire Wire Line
	9000 1250 10000 1250
Wire Wire Line
	8300 1350 8850 1350
Wire Wire Line
	8850 1350 8850 1050
Wire Wire Line
	8850 1050 9700 1050
Wire Wire Line
	8300 1550 9000 1550
Wire Wire Line
	8300 1850 9000 1850
Wire Wire Line
	9000 1850 9000 2400
Wire Wire Line
	9000 2400 9700 2400
Wire Wire Line
	8300 2050 8850 2050
Wire Wire Line
	8850 2050 8850 2600
Wire Wire Line
	8850 2600 10000 2600
Connection ~ 10000 2600
Text Notes 16000 800  0    197  ~ 0
read amazing AN about routing TVS\nhttp://www.ti.com/lit/an/slla292a/slla292a.pdf
Text Notes 7950 -2900 0    197  ~ 0
4-layer PCB\n\ndifferential signals\nground\npower\ncontrol signals
$Comp
L Device:D_TVS_x2_AAC D6
U 1 1 5DC633E0
P 10750 1500
F 0 "D6" H 10750 1716 50  0000 C CNN
F 1 "SM712" H 10750 1625 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_handsoldering" H 10600 1500 50  0001 C CNN
F 3 "~" H 10600 1500 50  0001 C CNN
	1    10750 1500
	1    0    0    -1  
$EndComp
Text Notes 11800 1350 0    197  ~ 0
dual tvs are sm712\nsot-23-3
Wire Wire Line
	10000 1050 10400 1050
Wire Wire Line
	10400 1050 10400 1500
Connection ~ 10400 1050
Wire Wire Line
	11100 1150 11100 1500
Connection ~ 11100 1150
Wire Wire Line
	11100 1150 11250 1150
$Comp
L power:GND #PWR0131
U 1 1 5DC6D0C5
P 10750 1650
F 0 "#PWR0131" H 10750 1400 50  0001 C CNN
F 1 "GND" H 10755 1477 50  0000 C CNN
F 2 "" H 10750 1650 50  0001 C CNN
F 3 "" H 10750 1650 50  0001 C CNN
	1    10750 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 2500 10450 2500
$Comp
L Device:D_TVS_x2_AAC D8
U 1 1 5DC6D31D
P 10800 2900
F 0 "D8" H 10800 3116 50  0000 C CNN
F 1 "SM712" H 10800 3025 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_handsoldering" H 10650 2900 50  0001 C CNN
F 3 "~" H 10650 2900 50  0001 C CNN
	1    10800 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0132
U 1 1 5DC6D3B9
P 10800 3050
F 0 "#PWR0132" H 10800 2800 50  0001 C CNN
F 1 "GND" H 10805 2877 50  0000 C CNN
F 2 "" H 10800 3050 50  0001 C CNN
F 3 "" H 10800 3050 50  0001 C CNN
	1    10800 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 2900 10450 2500
Connection ~ 10450 2500
Wire Wire Line
	11150 2900 11150 2400
Connection ~ 11150 2400
Wire Wire Line
	11150 2400 11350 2400
Text Notes 12650 6650 0    50   ~ 0
fix pin globals
Text Notes 12750 6850 0    50   ~ 0
footprint
$Comp
L newvco-cache:Connector_Conn_01x04_Female J7
U 1 1 5DBB51B0
P 12450 5750
F 0 "J7" H 12477 5726 50  0000 L CNN
F 1 "Connector_Conn_01x04_Female" H 12477 5635 50  0000 L CNN
F 2 "Connectors_JST:JST_SH_SM04B-SRSS-TB_1x04-1MP_P1.00mm_Horizontal" H 12450 5750 50  0001 C CNN
F 3 "" H 12450 5750 50  0001 C CNN
	1    12450 5750
	1    0    0    -1  
$EndComp
Text Notes -5250 5250 0    197  ~ 0
keep thermocouple drivers really \nfar away from anything that \ngenerates heat on the pcb!
Text Notes -5250 6250 0    197  ~ 0
consider special solder for this \nconnection... look into it
Wire Wire Line
	10000 2400 11150 2400
Wire Wire Line
	10450 2500 11350 2500
Wire Wire Line
	10400 1050 11250 1050
Wire Wire Line
	10000 1150 11100 1150
$Comp
L Power_Protection:SP0502BAHT D5
U 1 1 5DBC5C24
P 8650 900
F 0 "D5" V 8992 900 50  0000 C CNN
F 1 "SM05" V 8901 900 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8875 850 50  0001 L CNN
F 3 "http://www.littelfuse.com/~/media/files/littelfuse/technical%20resources/documents/data%20sheets/sp05xxba.pdf" H 8775 1025 50  0001 C CNN
	1    8650 900 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8450 800  8150 800 
Connection ~ 8150 800 
Wire Wire Line
	8450 1000 8150 1000
Connection ~ 8150 1000
NoConn ~ 8850 900 
Text Notes 2550 3300 0    197  ~ 0
1mA each
Text Notes 8050 3400 0    197  ~ 0
<10mA
Text Notes 13800 5750 0    197  ~ 0
<10mA
Text Notes 3500 1900 0    98   ~ 0
<10mA 328p\n<10mA BNO080\n<3mA both MAX31655
Text Notes 6550 1100 0    197  ~ 0
40mA?
Text Notes 3350 950  0    98   ~ 0
best case 76.7% efficiency (@150mA)\ne.g. 200mA input
$Comp
L power:GND #PWR0133
U 1 1 5DC0380C
P 12250 5650
F 0 "#PWR0133" H 12250 5400 50  0001 C CNN
F 1 "GND" H 12255 5477 50  0000 C CNN
F 2 "" H 12250 5650 50  0001 C CNN
F 3 "" H 12250 5650 50  0001 C CNN
	1    12250 5650
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0134
U 1 1 5DC038B3
P 11950 5750
F 0 "#PWR0134" H 11950 5600 50  0001 C CNN
F 1 "+3.3V" H 11800 5800 50  0000 C CNN
F 2 "" H 11950 5750 50  0001 C CNN
F 3 "" H 11950 5750 50  0001 C CNN
	1    11950 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	11950 5750 12250 5750
$EndSCHEMATC
