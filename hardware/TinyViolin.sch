EESchema Schematic File Version 4
LIBS:TinyViolin-cache
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
Text Label 2300 6200 0    50   ~ 0
PB4
Text Label 2300 6100 0    50   ~ 0
PB3
Text Label 2300 6000 0    50   ~ 0
PB2
Text Label 5850 3800 0    50   ~ 0
PB2
Text Label 7850 3800 0    50   ~ 0
PB4
$Comp
L power:GND #PWR0101
U 1 1 5DAD1E50
P 7850 4200
F 0 "#PWR0101" H 7850 3950 50  0001 C CNN
F 1 "GND" H 7855 4027 50  0000 C CNN
F 2 "" H 7850 4200 50  0001 C CNN
F 3 "" H 7850 4200 50  0001 C CNN
	1    7850 4200
	1    0    0    -1  
$EndComp
Text Label 6850 3800 0    50   ~ 0
PB3
$Comp
L power:GND #PWR0102
U 1 1 5DAD1E43
P 6850 4200
F 0 "#PWR0102" H 6850 3950 50  0001 C CNN
F 1 "GND" H 6855 4027 50  0000 C CNN
F 2 "" H 6850 4200 50  0001 C CNN
F 3 "" H 6850 4200 50  0001 C CNN
	1    6850 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5DAD10BC
P 5850 4200
F 0 "#PWR0103" H 5850 3950 50  0001 C CNN
F 1 "GND" H 5855 4027 50  0000 C CNN
F 2 "" H 5850 4200 50  0001 C CNN
F 3 "" H 5850 4200 50  0001 C CNN
	1    5850 4200
	1    0    0    -1  
$EndComp
Text Label 4850 3800 0    50   ~ 0
PB1
Text Label 2300 5900 0    50   ~ 0
PB1
$Comp
L power:GND #PWR0104
U 1 1 5DACF829
P 4850 4200
F 0 "#PWR0104" H 4850 3950 50  0001 C CNN
F 1 "GND" H 4855 4027 50  0000 C CNN
F 2 "" H 4850 4200 50  0001 C CNN
F 3 "" H 4850 4200 50  0001 C CNN
	1    4850 4200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0105
U 1 1 5DACB720
P 6200 2200
F 0 "#PWR0105" H 6200 2050 50  0001 C CNN
F 1 "+5V" H 6215 2373 50  0000 C CNN
F 2 "" H 6200 2200 50  0001 C CNN
F 3 "" H 6200 2200 50  0001 C CNN
	1    6200 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 1600 5200 2000
Connection ~ 8200 2200
$Comp
L power:+3.3V #PWR0106
U 1 1 5DAC00A0
P 8200 2200
F 0 "#PWR0106" H 8200 2050 50  0001 C CNN
F 1 "+3.3V" H 8215 2373 50  0000 C CNN
F 2 "" H 8200 2200 50  0001 C CNN
F 3 "" H 8200 2200 50  0001 C CNN
	1    8200 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5DABFCD5
P 8200 2850
F 0 "#PWR0107" H 8200 2600 50  0001 C CNN
F 1 "GND" H 8205 2677 50  0000 C CNN
F 2 "" H 8200 2850 50  0001 C CNN
F 3 "" H 8200 2850 50  0001 C CNN
	1    8200 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 2550 8200 2500
Connection ~ 7800 2200
Wire Wire Line
	7800 2200 7900 2200
Wire Wire Line
	7800 2200 7600 2200
Wire Wire Line
	7800 2250 7800 2200
$Comp
L power:GND #PWR0108
U 1 1 5DABB9C6
P 7800 2550
F 0 "#PWR0108" H 7800 2300 50  0001 C CNN
F 1 "GND" H 7805 2377 50  0000 C CNN
F 2 "" H 7800 2550 50  0001 C CNN
F 3 "" H 7800 2550 50  0001 C CNN
	1    7800 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5DAB9F5C
P 7200 2600
F 0 "#PWR0109" H 7200 2350 50  0001 C CNN
F 1 "GND" H 7205 2427 50  0000 C CNN
F 2 "" H 7200 2600 50  0001 C CNN
F 3 "" H 7200 2600 50  0001 C CNN
	1    7200 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5DAB99F6
P 6200 2550
F 0 "#PWR0110" H 6200 2300 50  0001 C CNN
F 1 "GND" H 6205 2377 50  0000 C CNN
F 2 "" H 6200 2550 50  0001 C CNN
F 3 "" H 6200 2550 50  0001 C CNN
	1    6200 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 2250 6200 2200
Connection ~ 5200 1200
$Comp
L power:+5V #PWR0111
U 1 1 5DAAC10A
P 5200 1200
F 0 "#PWR0111" H 5200 1050 50  0001 C CNN
F 1 "+5V" H 5215 1373 50  0000 C CNN
F 2 "" H 5200 1200 50  0001 C CNN
F 3 "" H 5200 1200 50  0001 C CNN
	1    5200 1200
	1    0    0    -1  
$EndComp
Connection ~ 5200 1600
Wire Wire Line
	5200 1200 5200 1600
Wire Wire Line
	4950 1200 5200 1200
Wire Wire Line
	4100 1200 4650 1200
Connection ~ 3500 1600
Wire Wire Line
	3500 1200 3500 1600
Wire Wire Line
	3800 1200 3500 1200
Connection ~ 5200 2000
Wire Wire Line
	4500 1600 5200 1600
Wire Wire Line
	3500 2600 3650 2600
Connection ~ 3500 2600
Wire Wire Line
	3500 1600 3500 2600
Wire Wire Line
	4200 1600 3500 1600
Wire Wire Line
	5200 2000 5050 2000
Wire Wire Line
	5200 2250 5200 2150
Connection ~ 5200 2800
Wire Wire Line
	5200 2800 5200 2700
Wire Wire Line
	5050 2800 5200 2800
$Comp
L power:GND #PWR0112
U 1 1 5DA90536
P 5200 2800
F 0 "#PWR0112" H 5200 2550 50  0001 C CNN
F 1 "GND" H 5205 2627 50  0000 C CNN
F 2 "" H 5200 2800 50  0001 C CNN
F 3 "" H 5200 2800 50  0001 C CNN
	1    5200 2800
	1    0    0    -1  
$EndComp
NoConn ~ 3650 2400
NoConn ~ 3650 2200
Wire Wire Line
	3450 2600 3500 2600
NoConn ~ 2800 2400
Wire Wire Line
	2400 2500 1700 2500
Text Label 3800 4050 0    50   ~ 0
~RST
Text Label 2350 5700 0    50   ~ 0
~RST
Text Label 3800 3850 0    50   ~ 0
MOSI
Text Label 3800 3750 0    50   ~ 0
MISO
Text Label 3800 3950 0    50   ~ 0
SCK
Text Label 2300 4700 0    50   ~ 0
SCK
Text Label 2300 4600 0    50   ~ 0
MISO
$Comp
L power:GND #PWR0113
U 1 1 5DA99D57
P 3300 4350
F 0 "#PWR0113" H 3300 4100 50  0001 C CNN
F 1 "GND" H 3305 4177 50  0000 C CNN
F 2 "" H 3300 4350 50  0001 C CNN
F 3 "" H 3300 4350 50  0001 C CNN
	1    3300 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5DA9082B
P 1700 6900
F 0 "#PWR0114" H 1700 6650 50  0001 C CNN
F 1 "GND" H 1705 6727 50  0000 C CNN
F 2 "" H 1700 6900 50  0001 C CNN
F 3 "" H 1700 6900 50  0001 C CNN
	1    1700 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5DA8E14F
P 4450 6250
F 0 "#PWR0115" H 4450 6000 50  0001 C CNN
F 1 "GND" H 4455 6077 50  0000 C CNN
F 2 "" H 4450 6250 50  0001 C CNN
F 3 "" H 4450 6250 50  0001 C CNN
	1    4450 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 5700 2300 5700
Wire Wire Line
	3000 6050 3000 5700
Wire Wire Line
	3350 6050 3000 6050
$Comp
L power:+3.3V #PWR0116
U 1 1 5DA8D759
P 3350 5750
F 0 "#PWR0116" H 3350 5600 50  0001 C CNN
F 1 "+3.3V" H 3365 5923 50  0000 C CNN
F 2 "" H 3350 5750 50  0001 C CNN
F 3 "" H 3350 5750 50  0001 C CNN
	1    3350 5750
	1    0    0    -1  
$EndComp
Connection ~ 2650 4700
Wire Wire Line
	2500 4700 2650 4700
Wire Wire Line
	2500 4800 2500 4700
Wire Wire Line
	2300 4800 2500 4800
Connection ~ 2650 5000
Wire Wire Line
	2500 4900 2300 4900
Wire Wire Line
	2500 5000 2500 4900
Wire Wire Line
	2650 5000 2500 5000
Connection ~ 3000 5000
Wire Wire Line
	3000 5000 2650 5000
Connection ~ 3000 4700
Wire Wire Line
	2650 4700 3000 4700
$Comp
L power:GND #PWR0117
U 1 1 5DA87E49
P 3000 5300
F 0 "#PWR0117" H 3000 5050 50  0001 C CNN
F 1 "GND" H 3005 5127 50  0000 C CNN
F 2 "" H 3000 5300 50  0001 C CNN
F 3 "" H 3000 5300 50  0001 C CNN
	1    3000 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 5DA87D90
P 3700 5300
F 0 "#PWR0118" H 3700 5050 50  0001 C CNN
F 1 "GND" H 3705 5127 50  0000 C CNN
F 2 "" H 3700 5300 50  0001 C CNN
F 3 "" H 3700 5300 50  0001 C CNN
	1    3700 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 4700 3000 4700
Wire Wire Line
	3700 5000 3700 4700
Connection ~ 2950 2600
Wire Wire Line
	2800 2600 2950 2600
Wire Wire Line
	2950 2600 3150 2600
NoConn ~ 1100 4200
$Comp
L power:+3.3V #PWR0119
U 1 1 5DA90F8A
P 1700 3550
F 0 "#PWR0119" H 1700 3400 50  0001 C CNN
F 1 "+3.3V" H 1715 3723 50  0000 C CNN
F 2 "" H 1700 3550 50  0001 C CNN
F 3 "" H 1700 3550 50  0001 C CNN
	1    1700 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 3900 1700 3550
$Comp
L power:GND #PWR0120
U 1 1 5DA9380D
P 2400 3850
F 0 "#PWR0120" H 2400 3600 50  0001 C CNN
F 1 "GND" H 2405 3677 50  0000 C CNN
F 2 "" H 2400 3850 50  0001 C CNN
F 3 "" H 2400 3850 50  0001 C CNN
	1    2400 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 3550 2400 3550
Connection ~ 1700 3550
Text Label 2300 4500 0    50   ~ 0
MOSI
$Comp
L power:GND #PWR0121
U 1 1 5DAA4917
P 1700 2800
F 0 "#PWR0121" H 1700 2550 50  0001 C CNN
F 1 "GND" H 1705 2627 50  0000 C CNN
F 2 "" H 1700 2800 50  0001 C CNN
F 3 "" H 1700 2800 50  0001 C CNN
	1    1700 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 5DA82FB0
P 2950 2900
F 0 "#PWR0122" H 2950 2650 50  0001 C CNN
F 1 "GND" H 2955 2727 50  0000 C CNN
F 2 "" H 2950 2900 50  0001 C CNN
F 3 "" H 2950 2900 50  0001 C CNN
	1    2950 2900
	1    0    0    -1  
$EndComp
Text Label 2300 4400 0    50   ~ 0
SS
$Comp
L power:+3.3V #PWR0123
U 1 1 5DB047CF
P 4700 5950
F 0 "#PWR0123" H 4700 5800 50  0001 C CNN
F 1 "+3.3V" H 4715 6123 50  0000 C CNN
F 2 "" H 4700 5950 50  0001 C CNN
F 3 "" H 4700 5950 50  0001 C CNN
	1    4700 5950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 5DB04F80
P 5000 5950
F 0 "#PWR0124" H 5000 5700 50  0001 C CNN
F 1 "GND" H 5005 5777 50  0000 C CNN
F 2 "" H 5000 5950 50  0001 C CNN
F 3 "" H 5000 5950 50  0001 C CNN
	1    5000 5950
	0    -1   -1   0   
$EndComp
Text Label 4850 5650 0    50   ~ 0
BOW
Text Label 2300 5100 0    50   ~ 0
BOW
$Comp
L power:GND #PWR0125
U 1 1 5DB1D193
P 7850 5300
F 0 "#PWR0125" H 7850 5050 50  0001 C CNN
F 1 "GND" H 7855 5127 50  0000 C CNN
F 2 "" H 7850 5300 50  0001 C CNN
F 3 "" H 7850 5300 50  0001 C CNN
	1    7850 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 5DB1D572
P 6850 5300
F 0 "#PWR0126" H 6850 5050 50  0001 C CNN
F 1 "GND" H 6855 5127 50  0000 C CNN
F 2 "" H 6850 5300 50  0001 C CNN
F 3 "" H 6850 5300 50  0001 C CNN
	1    6850 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0127
U 1 1 5DB1DA49
P 5850 5300
F 0 "#PWR0127" H 5850 5050 50  0001 C CNN
F 1 "GND" H 5855 5127 50  0000 C CNN
F 2 "" H 5850 5300 50  0001 C CNN
F 3 "" H 5850 5300 50  0001 C CNN
	1    5850 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0128
U 1 1 5DB1DCB9
P 4850 5300
F 0 "#PWR0128" H 4850 5050 50  0001 C CNN
F 1 "GND" H 4855 5127 50  0000 C CNN
F 2 "" H 4850 5300 50  0001 C CNN
F 3 "" H 4850 5300 50  0001 C CNN
	1    4850 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 5000 5550 5000
Wire Wire Line
	6150 5000 6550 5000
Wire Wire Line
	7150 5000 7550 5000
Text Label 2300 6300 0    50   ~ 0
LEDS
Text Label 4250 5000 2    50   ~ 0
LEDS
NoConn ~ 8150 5000
NoConn ~ 9550 4400
NoConn ~ 9550 5100
Text Label 9100 5000 2    50   ~ 0
MISO
Text Label 9100 4900 2    50   ~ 0
GND
Text Label 9100 4800 2    50   ~ 0
SCK
Text Label 9100 4700 2    50   ~ 0
+3.3V
Text Label 9100 4500 2    50   ~ 0
SS
Text Label 9100 4600 2    50   ~ 0
MOSI
Wire Wire Line
	6350 5950 6500 5950
$Comp
L power:GND #PWR0129
U 1 1 5DB3A832
P 6400 6200
F 0 "#PWR0129" H 6400 5950 50  0001 C CNN
F 1 "GND" H 6405 6027 50  0000 C CNN
F 2 "" H 6400 6200 50  0001 C CNN
F 3 "" H 6400 6200 50  0001 C CNN
	1    6400 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 6050 6400 6050
Wire Wire Line
	6400 6050 6400 6200
Text Label 2300 6400 0    50   ~ 0
SPEAKER
Text Label 5650 5950 2    50   ~ 0
SPEAKER
NoConn ~ 1100 5900
NoConn ~ 1100 6000
NoConn ~ 1100 6100
NoConn ~ 1100 6200
NoConn ~ 2300 6600
NoConn ~ 2300 6500
NoConn ~ 2300 4200
NoConn ~ 2300 4300
NoConn ~ 2300 5200
NoConn ~ 2300 5300
NoConn ~ 2300 5400
NoConn ~ 2300 5500
NoConn ~ 2300 5600
Connection ~ 6200 2200
Wire Wire Line
	6550 2400 6550 2200
Connection ~ 6550 2200
Wire Wire Line
	6550 2200 6400 2200
Wire Wire Line
	6550 2200 6800 2200
Wire Wire Line
	6550 2400 6800 2400
Connection ~ 1700 2500
Wire Wire Line
	1700 2800 1350 2800
Connection ~ 1700 2800
Connection ~ 6400 2200
Wire Wire Line
	6400 2200 6200 2200
Connection ~ 7900 2200
Wire Wire Line
	7900 2200 8200 2200
Wire Wire Line
	9100 4500 9150 4500
Wire Wire Line
	9100 4600 9400 4600
Wire Wire Line
	9100 4800 9400 4800
Connection ~ 9150 4500
Wire Wire Line
	9400 4300 9400 4600
Connection ~ 9400 4600
Wire Wire Line
	9400 5200 9400 4800
Connection ~ 9400 4800
Wire Wire Line
	4550 5000 4350 5000
Connection ~ 4350 5000
Wire Wire Line
	4250 5000 4350 5000
Wire Wire Line
	4850 5800 4850 5750
Wire Wire Line
	4350 4900 4350 5000
Wire Wire Line
	4750 5750 4850 5750
Connection ~ 4850 5750
Wire Wire Line
	4850 5750 4850 5650
Wire Wire Line
	9150 4450 9150 4500
Wire Wire Line
	9100 5000 9150 5000
Wire Wire Line
	9150 5000 9150 5050
Connection ~ 9150 5000
Wire Wire Line
	7900 2150 7900 2200
Wire Wire Line
	6400 2150 6400 2200
Wire Wire Line
	1700 2450 1700 2500
Wire Wire Line
	1350 2450 1350 2800
Wire Wire Line
	5650 5950 5750 5950
Wire Wire Line
	5750 5900 5750 5950
Connection ~ 5750 5950
Wire Wire Line
	5750 5950 6050 5950
Connection ~ 3700 4700
$Comp
L power:+3.3V #PWR0130
U 1 1 5DA9A983
P 3300 3450
F 0 "#PWR0130" H 3300 3300 50  0001 C CNN
F 1 "+3.3V" H 3315 3623 50  0000 C CNN
F 2 "" H 3300 3450 50  0001 C CNN
F 3 "" H 3300 3450 50  0001 C CNN
	1    3300 3450
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW6
U 1 1 5DAD1E4A
P 7850 4000
F 0 "SW6" V 7804 4148 50  0000 L CNN
F 1 "SW_Push" V 7895 4148 50  0000 L CNN
F 2 "D6:D6" H 7850 4200 50  0001 C CNN
F 3 "https://www.ckswitches.com/media/1341/d6.pdf" H 7850 4200 50  0001 C CNN
F 4 "D6L90 F2 LFS" H 7850 4000 50  0001 C CNN "Part Number"
	1    7850 4000
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_Push SW5
U 1 1 5DAD1E3D
P 6850 4000
F 0 "SW5" V 6804 4148 50  0000 L CNN
F 1 "SW_Push" V 6895 4148 50  0000 L CNN
F 2 "D6:D6" H 6850 4200 50  0001 C CNN
F 3 "https://www.ckswitches.com/media/1341/d6.pdf" H 6850 4200 50  0001 C CNN
F 4 "D6L90 F2 LFS" H 6850 4000 50  0001 C CNN "Part Number"
	1    6850 4000
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_Push SW4
U 1 1 5DAD10B6
P 5850 4000
F 0 "SW4" V 5804 4148 50  0000 L CNN
F 1 "SW_Push" V 5895 4148 50  0000 L CNN
F 2 "D6:D6" H 5850 4200 50  0001 C CNN
F 3 "https://www.ckswitches.com/media/1341/d6.pdf" H 5850 4200 50  0001 C CNN
F 4 "D6L90 F2 LFS" H 5850 4000 50  0001 C CNN "Part Number"
	1    5850 4000
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_Push SW3
U 1 1 5DACD6C9
P 4850 4000
F 0 "SW3" V 4804 4148 50  0000 L CNN
F 1 "SW_Push" V 4895 4148 50  0000 L CNN
F 2 "D6:D6" H 4850 4200 50  0001 C CNN
F 3 "https://www.ckswitches.com/media/1341/d6.pdf" H 4850 4200 50  0001 C CNN
F 4 "D6L90 F2 LFS" H 4850 4000 50  0001 C CNN "Part Number"
	1    4850 4000
	0    1    1    0   
$EndComp
$Comp
L Device:C C5
U 1 1 5DA83BC4
P 5200 2400
F 0 "C5" H 5315 2446 50  0000 L CNN
F 1 "22uF" H 5315 2355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5238 2250 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL21B224KBFNNNE.jsp" H 5200 2400 50  0001 C CNN
F 4 "CL21B224KBFNNNE" H 5200 2400 50  0001 C CNN "Part Number"
	1    5200 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5DABDF08
P 8200 2700
F 0 "R4" H 8270 2746 50  0000 L CNN
F 1 "220" H 8270 2655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8130 2700 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 8200 2700 50  0001 C CNN
F 4 "RMCF0805FT220R" H 8200 2700 50  0001 C CNN "Part Number"
	1    8200 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 5DABCDE0
P 8200 2350
F 0 "D2" V 8239 2233 50  0000 R CNN
F 1 "LED" V 8148 2233 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8200 2350 50  0001 C CNN
F 3 "https://dammedia.osram.info/media/resource/hires/osram-dam-2493936/LG%20R971.pdf" H 8200 2350 50  0001 C CNN
F 4 "LG R971-KN-1	" H 8200 2350 50  0001 C CNN "Part Number"
	1    8200 2350
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C9
U 1 1 5DABAFC3
P 7800 2400
F 0 "C9" H 7915 2446 50  0000 L CNN
F 1 "1uF" H 7915 2355 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 7838 2250 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2019/06/18/19-CL31F105ZBFNNNE.pdf" H 7800 2400 50  0001 C CNN
F 4 "CL31F105ZBFNNNE" H 7800 2400 50  0001 C CNN "Part Number"
	1    7800 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5DAAE01C
P 6200 2400
F 0 "C8" H 6315 2446 50  0000 L CNN
F 1 "1uF" H 6315 2355 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6238 2250 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2019/06/18/19-CL31F105ZBFNNNE.pdf" H 6200 2400 50  0001 C CNN
F 4 "CL31F105ZBFNNNE" H 6200 2400 50  0001 C CNN "Part Number"
	1    6200 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5DA94D9F
P 4800 1200
F 0 "C7" V 4548 1200 50  0000 C CNN
F 1 "120pF" V 4639 1200 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4838 1050 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL21C121JBANNNC.jsp" H 4800 1200 50  0001 C CNN
F 4 "CL21C121JBANNNC" H 4800 1200 50  0001 C CNN "Part Number"
	1    4800 1200
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5DA94052
P 3950 1200
F 0 "R3" V 3743 1200 50  0000 C CNN
F 1 "5" V 3834 1200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3880 1200 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rncp.pdf" H 3950 1200 50  0001 C CNN
F 4 "RNCP0805FTD10K0" H 3950 1200 50  0001 C CNN "Part Number"
	1    3950 1200
	0    1    1    0   
$EndComp
$Comp
L Device:D_Schottky D1
U 1 1 5DA91645
P 4350 1600
F 0 "D1" H 4350 1384 50  0000 C CNN
F 1 "D_Schottky" H 4350 1475 50  0000 C CNN
F 2 "DO219:DO219-AB" H 4350 1600 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85687/sl02.pdf" H 4350 1600 50  0001 C CNN
F 4 "SL02-GS08" H 4350 1600 50  0001 C CNN "Part Number"
	1    4350 1600
	-1   0    0    1   
$EndComp
$Comp
L Device:L L1
U 1 1 5DA81DE3
P 3300 2600
F 0 "L1" V 3490 2600 50  0000 C CNN
F 1 "2.2uH" V 3399 2600 50  0000 C CNN
F 2 "Inductor_SMD:L_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3300 2600 50  0001 C CNN
F 3 "https://search.murata.co.jp/Ceramy/image/img/P02/JELF243B-0013.pdf" H 3300 2600 50  0001 C CNN
F 4 "LQM31PN2R2M00L" H 3300 2600 50  0001 C CNN "Part Number"
	1    3300 2600
	0    -1   -1   0   
$EndComp
$Comp
L TPS613222ADBVT:TPS613222ADBVT U2
U 1 1 5DA7F96D
P 4350 2400
F 0 "U2" H 4350 3070 50  0000 C CNN
F 1 "TPS613222ADBVT" H 4350 2979 50  0000 C CNN
F 2 "SOT95P280X145-5N" H 4350 2400 50  0001 L BNN
F 3 "http://www.ti.com/lit/ds/symlink/tps61322.pdf" H 4350 2400 50  0001 L BNN
F 4 "TPS613222ADBVR" H 4350 2400 50  0001 C CNN "Part Number"
	1    4350 2400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPDT SW1
U 1 1 5DAA50F5
P 2600 2500
F 0 "SW1" H 2600 2785 50  0000 C CNN
F 1 "SW_SPDT" H 2600 2694 50  0000 C CNN
F 2 "MHS122:MHS122" H 2600 2500 50  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1825255&DocType=Customer+Drawing&DocLang=English" H 2600 2500 50  0001 C CNN
F 4 "1825255-1" H 2600 2500 50  0001 C CNN "Part Number"
	1    2600 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery_Cell BT1
U 1 1 5DAA293B
P 1700 2700
F 0 "BT1" H 1818 2796 50  0000 L CNN
F 1 "Battery_Cell" H 1818 2705 50  0000 L CNN
F 2 "BAT-HLD-001-THM:LINX_BAT-HLD-001-THM" V 1700 2760 50  0001 C CNN
F 3 "https://linxtechnologies.com/wp/wp-content/uploads/bat-hld-001-thm.pdf" V 1700 2760 50  0001 C CNN
F 4 "BAT-HLD-001-THM" H 1700 2700 50  0001 C CNN "Part Number"
	1    1700 2700
	1    0    0    -1  
$EndComp
$Comp
L Connector:AVR-ISP-6 J1
U 1 1 5DA97199
P 3400 3950
F 0 "J1" H 3121 4046 50  0000 R CNN
F 1 "AVR-ISP-6" H 3121 3955 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x03_P2.54mm_Vertical" V 3150 4000 50  0001 C CNN
F 3 "https://katalog.we-online.de/em/datasheet/6120xx21621.pdf" H 2125 3400 50  0001 C CNN
F 4 "61200621621" H 3400 3950 50  0001 C CNN "Part Number"
	1    3400 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5DA8D049
P 3350 5900
F 0 "R2" H 3420 5946 50  0000 L CNN
F 1 "10k" H 3420 5855 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3280 5900 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rncp.pdf" H 3350 5900 50  0001 C CNN
F 4 "RNCP0805FTD4R70" H 3350 5900 50  0001 C CNN "Part Number"
	1    3350 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5DA87537
P 2650 4850
F 0 "R1" H 2720 4896 50  0000 L CNN
F 1 "1M" H 2720 4805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2580 4850 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 2650 4850 50  0001 C CNN
F 4 "RMCF0805FT1M00	" H 2650 4850 50  0001 C CNN "Part Number"
	1    2650 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5DA852FE
P 3700 5150
F 0 "C2" H 3815 5196 50  0000 L CNN
F 1 "22pF" H 3815 5105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3738 5000 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL21C220JBANNNC.jsp" H 3700 5150 50  0001 C CNN
F 4 "CL21C220JBANNNC" H 3700 5150 50  0001 C CNN "Part Number"
	1    3700 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5DA83A95
P 3000 5150
F 0 "C1" H 3115 5196 50  0000 L CNN
F 1 "22pF" H 3115 5105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3038 5000 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL21C220JBANNNC.jsp" H 3000 5150 50  0001 C CNN
F 4 "CL21C220JBANNNC" H 3000 5150 50  0001 C CNN "Part Number"
	1    3000 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 5DA81CDA
P 3000 4850
F 0 "Y1" V 3046 4719 50  0000 R CNN
F 1 "Crystal 16MHz" V 2955 4719 50  0000 R CNN
F 2 "Crystal:Crystal_HC49-U_Vertical" H 3000 4850 50  0001 C CNN
F 3 "https://abracon.com/Resonators/ABL.pdf" H 3000 4850 50  0001 C CNN
F 4 "ABL-16.000MHZ-B2	" H 3000 4850 50  0001 C CNN "Part Number"
	1    3000 4850
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C3
U 1 1 5DA91F34
P 2400 3700
F 0 "C3" H 2515 3746 50  0000 L CNN
F 1 "100nF" H 2515 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2438 3550 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL21B104JBCNNNC.jsp" H 2400 3700 50  0001 C CNN
F 4 "CL21B104JBCNNNC" H 2400 3700 50  0001 C CNN "Part Number"
	1    2400 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5DA81362
P 2950 2750
F 0 "C4" H 3065 2796 50  0000 L CNN
F 1 "2.2uF" H 3065 2705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2988 2600 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL21B224KBFNNNE.jsp" H 2950 2750 50  0001 C CNN
F 4 "CL21B224KBFNNNE" H 2950 2750 50  0001 C CNN "Part Number"
	1    2950 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV1
U 1 1 5DB00D8C
P 4850 5950
F 0 "RV1" V 4735 5950 50  0000 C CNN
F 1 "R_POT" V 4644 5950 50  0000 C CNN
F 2 "PTA:PTA4543" H 4850 5950 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/pta.pdf" H 4850 5950 50  0001 C CNN
F 4 "PTA4543-2015DPB103	" H 4850 5950 50  0001 C CNN "Part Number"
	1    4850 5950
	0    -1   -1   0   
$EndComp
$Comp
L Device:Speaker LS1
U 1 1 5DB36837
P 6700 5950
F 0 "LS1" H 6870 5946 50  0000 L CNN
F 1 "Speaker" H 6870 5855 50  0000 L CNN
F 2 "SP-1605:SP-1605" H 6700 5750 50  0001 C CNN
F 3 "https://www.soberton.com/wp-content/uploads/2018/07/SP-1605-June-2018.pdf" H 6690 5900 50  0001 C CNN
F 4 "SP-1605" H 6700 5950 50  0001 C CNN "Part Number"
	1    6700 5950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 5DB3816F
P 6200 5950
F 0 "C10" V 5948 5950 50  0000 C CNN
F 1 "100uF" V 6039 5950 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 6238 5800 50  0001 C CNN
F 3 "http://industrial.panasonic.com/www-cgi/jvcr13pz.cgi?E+PZ+3+ABA0015+ECEA0JKS101+7+WW" H 6200 5950 50  0001 C CNN
F 4 "ECE-A0JKS101	" H 6200 5950 50  0001 C CNN "Part Number"
	1    6200 5950
	0    1    1    0   
$EndComp
$Comp
L Regulator_Linear:MIC5504-3.3YM5 U3
U 1 1 5DAAF7D5
P 7200 2300
F 0 "U3" H 7200 2667 50  0000 C CNN
F 1 "MIC5504-3.3YM5" H 7200 2576 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 7200 1900 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/MIC550X.pdf" H 6950 2550 50  0001 C CNN
F 4 "MIC5504-3.3YM5-TR" H 7200 2300 50  0001 C CNN "Part Number"
	1    7200 2300
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 5DB550E0
P 1700 2450
F 0 "TP1" H 1758 2568 50  0000 L CNN
F 1 "VBT" H 1758 2477 50  0000 L CNN
F 2 "TestPoint:TestPoint_Plated_Hole_D2.0mm" H 1900 2450 50  0001 C CNN
F 3 "~" H 1900 2450 50  0001 C CNN
F 4 "~" H 1700 2450 50  0001 C CNN "Part Number"
	1    1700 2450
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 5DB55599
P 1350 2450
F 0 "TP2" H 1408 2568 50  0000 L CNN
F 1 "GND" H 1408 2477 50  0000 L CNN
F 2 "TestPoint:TestPoint_Plated_Hole_D2.0mm" H 1550 2450 50  0001 C CNN
F 3 "~" H 1550 2450 50  0001 C CNN
F 4 "~" H 1350 2450 50  0001 C CNN "Part Number"
	1    1350 2450
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 5DB589D8
P 6400 2150
F 0 "TP3" H 6458 2268 50  0000 L CNN
F 1 "5V" H 6458 2177 50  0000 L CNN
F 2 "TestPoint:TestPoint_Plated_Hole_D2.0mm" H 6600 2150 50  0001 C CNN
F 3 "~" H 6600 2150 50  0001 C CNN
F 4 "~" H 6400 2150 50  0001 C CNN "Part Number"
	1    6400 2150
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 5DB58E96
P 7900 2150
F 0 "TP4" H 7958 2268 50  0000 L CNN
F 1 "3.3V" H 7958 2177 50  0000 L CNN
F 2 "TestPoint:TestPoint_Plated_Hole_D2.0mm" H 8100 2150 50  0001 C CNN
F 3 "~" H 8100 2150 50  0001 C CNN
F 4 "~" H 7900 2150 50  0001 C CNN "Part Number"
	1    7900 2150
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP5
U 1 1 5DB65B13
P 9150 4450
F 0 "TP5" H 9208 4568 50  0000 L CNN
F 1 "SS" H 9208 4477 50  0000 L CNN
F 2 "TestPoint:TestPoint_Plated_Hole_D2.0mm" H 9350 4450 50  0001 C CNN
F 3 "~" H 9350 4450 50  0001 C CNN
F 4 "~" H 9150 4450 50  0001 C CNN "Part Number"
	1    9150 4450
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP6
U 1 1 5DB66225
P 9400 4300
F 0 "TP6" H 9458 4418 50  0000 L CNN
F 1 "MOSI" H 9458 4327 50  0000 L CNN
F 2 "TestPoint:TestPoint_Plated_Hole_D2.0mm" H 9600 4300 50  0001 C CNN
F 3 "~" H 9600 4300 50  0001 C CNN
F 4 "~" H 9400 4300 50  0001 C CNN "Part Number"
	1    9400 4300
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP7
U 1 1 5DB67BA8
P 9150 5050
F 0 "TP7" H 9092 5076 50  0000 R CNN
F 1 "MISO" H 9092 5167 50  0000 R CNN
F 2 "TestPoint:TestPoint_Plated_Hole_D2.0mm" H 9350 5050 50  0001 C CNN
F 3 "~" H 9350 5050 50  0001 C CNN
F 4 "~" H 9150 5050 50  0001 C CNN "Part Number"
	1    9150 5050
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP8
U 1 1 5DB6883D
P 9400 5200
F 0 "TP8" H 9342 5226 50  0000 R CNN
F 1 "SCK" H 9342 5317 50  0000 R CNN
F 2 "TestPoint:TestPoint_Plated_Hole_D2.0mm" H 9600 5200 50  0001 C CNN
F 3 "~" H 9600 5200 50  0001 C CNN
F 4 "~" H 9400 5200 50  0001 C CNN "Part Number"
	1    9400 5200
	-1   0    0    1   
$EndComp
$Comp
L RGB_LED:RGB_LED D3
U 1 1 5DB7F0DB
P 4850 5000
F 0 "D3" H 5194 5046 50  0000 L CNN
F 1 "RGB_LED" H 5194 4955 50  0000 L CNN
F 2 "LED_THT:LED_D5.0mm-4_RGB" H 4750 5000 50  0001 C CNN
F 3 "https://cdn.sparkfun.com/datasheets/Components/LED/COM-12877.pdf" H 4750 5000 50  0001 C CNN
F 4 "COM-12877" H 4850 5000 50  0001 C CNN "Part Number"
	1    4850 5000
	1    0    0    -1  
$EndComp
$Comp
L RGB_LED:RGB_LED D4
U 1 1 5DB817E9
P 5850 5000
F 0 "D4" H 6194 5046 50  0000 L CNN
F 1 "RGB_LED" H 6194 4955 50  0000 L CNN
F 2 "LED_THT:LED_D5.0mm-4_RGB" H 5750 5000 50  0001 C CNN
F 3 "https://cdn.sparkfun.com/datasheets/Components/LED/COM-12877.pdf" H 5750 5000 50  0001 C CNN
F 4 "COM-12877" H 5850 5000 50  0001 C CNN "Part Number"
	1    5850 5000
	1    0    0    -1  
$EndComp
$Comp
L RGB_LED:RGB_LED D5
U 1 1 5DB81F44
P 6850 5000
F 0 "D5" H 7194 5046 50  0000 L CNN
F 1 "RGB_LED" H 7194 4955 50  0000 L CNN
F 2 "LED_THT:LED_D5.0mm-4_RGB" H 6750 5000 50  0001 C CNN
F 3 "https://cdn.sparkfun.com/datasheets/Components/LED/COM-12877.pdf" H 6750 5000 50  0001 C CNN
F 4 "COM-12877" H 6850 5000 50  0001 C CNN "Part Number"
	1    6850 5000
	1    0    0    -1  
$EndComp
$Comp
L RGB_LED:RGB_LED D6
U 1 1 5DB82447
P 7850 5000
F 0 "D6" H 8194 5046 50  0000 L CNN
F 1 "RGB_LED" H 8194 4955 50  0000 L CNN
F 2 "LED_THT:LED_D5.0mm-4_RGB" H 7750 5000 50  0001 C CNN
F 3 "https://cdn.sparkfun.com/datasheets/Components/LED/COM-12877.pdf" H 7750 5000 50  0001 C CNN
F 4 "COM-12877" H 7850 5000 50  0001 C CNN "Part Number"
	1    7850 5000
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP9
U 1 1 5DB8346D
P 4350 4900
F 0 "TP9" H 4408 5018 50  0000 L CNN
F 1 "LEDS" H 4408 4927 50  0000 L CNN
F 2 "TestPoint:TestPoint_Plated_Hole_D2.0mm" H 4550 4900 50  0001 C CNN
F 3 "~" H 4550 4900 50  0001 C CNN
F 4 "~" H 4350 4900 50  0001 C CNN "Part Number"
	1    4350 4900
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP10
U 1 1 5DB86EFB
P 4750 5750
F 0 "TP10" V 4945 5822 50  0000 C CNN
F 1 "BOW" V 4854 5822 50  0000 C CNN
F 2 "TestPoint:TestPoint_Plated_Hole_D2.0mm" H 4950 5750 50  0001 C CNN
F 3 "~" H 4950 5750 50  0001 C CNN
F 4 "~" H 4750 5750 50  0001 C CNN "Part Number"
	1    4750 5750
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP11
U 1 1 5DB9FB9D
P 5750 5900
F 0 "TP11" H 5808 6018 50  0000 L CNN
F 1 "SPEAKER" H 5808 5927 50  0000 L CNN
F 2 "TestPoint:TestPoint_Plated_Hole_D2.0mm" H 5950 5900 50  0001 C CNN
F 3 "~" H 5950 5900 50  0001 C CNN
F 4 "~" H 5750 5900 50  0001 C CNN "Part Number"
	1    5750 5900
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP12
U 1 1 5DBAB191
P 3700 4700
F 0 "TP12" H 3758 4818 50  0000 L CNN
F 1 "CRYSTAL" H 3758 4727 50  0000 L CNN
F 2 "TestPoint:TestPoint_Plated_Hole_D2.0mm" H 3900 4700 50  0001 C CNN
F 3 "~" H 3900 4700 50  0001 C CNN
F 4 "~" H 3700 4700 50  0001 C CNN "Part Number"
	1    3700 4700
	1    0    0    -1  
$EndComp
$Comp
L 503182-1852:503182-1852 J2
U 1 1 5DBBD4B3
P 10000 5000
F 0 "J2" H 10530 5046 50  0000 L CNN
F 1 "503182-1852" H 10530 4955 50  0000 L CNN
F 2 "MOLEX_503182-1852" H 10000 5000 50  0001 L BNN
F 3 "https://www.molex.com/pdm_docs/sd/5031821852_sd.pdf" H 10000 5000 50  0001 L BNN
F 4 "5031821852" H 10000 5000 50  0001 C CNN "Part Number"
	1    10000 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 4400 9800 4400
Wire Wire Line
	9150 4500 9800 4500
Wire Wire Line
	9400 4600 9800 4600
Wire Wire Line
	9100 4700 9800 4700
Wire Wire Line
	9400 4800 9800 4800
Wire Wire Line
	9100 4900 9800 4900
Wire Wire Line
	9150 5000 9800 5000
Wire Wire Line
	9550 5100 9800 5100
NoConn ~ 9800 5300
NoConn ~ 9800 5400
NoConn ~ 9800 5600
$Comp
L power:+5V #PWR0131
U 1 1 5DA91E7E
P 4850 4700
F 0 "#PWR0131" H 4850 4550 50  0001 C CNN
F 1 "+5V" H 4865 4873 50  0000 C CNN
F 2 "" H 4850 4700 50  0001 C CNN
F 3 "" H 4850 4700 50  0001 C CNN
	1    4850 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0132
U 1 1 5DA9234F
P 5850 4700
F 0 "#PWR0132" H 5850 4550 50  0001 C CNN
F 1 "+5V" H 5865 4873 50  0000 C CNN
F 2 "" H 5850 4700 50  0001 C CNN
F 3 "" H 5850 4700 50  0001 C CNN
	1    5850 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0133
U 1 1 5DA92990
P 6850 4700
F 0 "#PWR0133" H 6850 4550 50  0001 C CNN
F 1 "+5V" H 6865 4873 50  0000 C CNN
F 2 "" H 6850 4700 50  0001 C CNN
F 3 "" H 6850 4700 50  0001 C CNN
	1    6850 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0134
U 1 1 5DA9316B
P 7850 4700
F 0 "#PWR0134" H 7850 4550 50  0001 C CNN
F 1 "+5V" H 7865 4873 50  0000 C CNN
F 2 "" H 7850 4700 50  0001 C CNN
F 3 "" H 7850 4700 50  0001 C CNN
	1    7850 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5DAA8B78
P 5650 2400
F 0 "C6" H 5765 2446 50  0000 L CNN
F 1 "22uF" H 5765 2355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5688 2250 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/CL21B224KBFNNNE.jsp" H 5650 2400 50  0001 C CNN
F 4 "CL21B224KBFNNNE" H 5650 2400 50  0001 C CNN "Part Number"
	1    5650 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 2250 5650 2150
Wire Wire Line
	5650 2150 5200 2150
Connection ~ 5200 2150
Wire Wire Line
	5200 2150 5200 2000
Wire Wire Line
	5650 2550 5650 2700
Wire Wire Line
	5650 2700 5200 2700
Connection ~ 5200 2700
Wire Wire Line
	5200 2700 5200 2550
$Comp
L 1825910-7:1825910-7 SW2
U 1 1 5DABD775
P 4050 6150
F 0 "SW2" H 4050 6517 50  0000 C CNN
F 1 "Tactile" H 4050 6426 50  0000 C CNN
F 2 "SW_1825910-7" H 4050 6150 50  0001 L BNN
F 3 "https://www.te.com/usa-en/product-1825910-7.html?te_bu=Cor&te_type=disp&te_campaign=seda_glo_cor-seda-global-disp-prtnr-fy19-seda-model-bom-cta_sma-317_1&elqCampaignId=32493" H 4050 6150 50  0001 L BNN
F 4 "1825910-7" H 4050 6150 50  0001 L BNN "Part Number"
	1    4050 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 6250 3650 6050
Wire Wire Line
	3650 6050 3350 6050
Connection ~ 3650 6050
Connection ~ 3350 6050
Wire Wire Line
	4450 6050 4450 6250
Connection ~ 4450 6250
$Comp
L MCU_Microchip_ATmega:ATmega328PB-AU U1
U 1 1 5DB3D4B2
P 1700 5400
F 0 "U1" H 1250 3950 50  0000 C CNN
F 1 "ATmega328PB-AU" H 2100 3950 50  0000 C CNN
F 2 "Package_QFP:TQFP-32_7x7mm_P0.8mm" H 1700 5400 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/40001906C.pdf" H 1700 5400 50  0001 C CNN
F 4 "ATmega328PB-AU" H 0   0   50  0001 C CNN "Part Number"
	1    1700 5400
	1    0    0    -1  
$EndComp
$EndSCHEMATC
