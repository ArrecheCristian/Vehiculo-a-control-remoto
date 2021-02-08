EESchema Schematic File Version 4
LIBS:auto-ciaa-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Kika"
Date "2019-10-09"
Rev "0.1"
Comp "UNLP"
Comment1 "Autores: Arreche, Cristian - Blasco, Federico - Borini, Angel - Paradiso, Martín"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L basico:OSHWA #G102
U 1 1 560A0A28
P 10800 6050
F 0 "#G102" H 10770 6450 60  0001 C CNN
F 1 "OSHWA" H 10800 6353 60  0001 C CNN
F 2 "Poncho_Esqueleto:Logo_OSHWA" H 10800 6050 60  0001 C CNN
F 3 "" H 10800 6050 60  0000 C CNN
	1    10800 6050
	1    0    0    -1  
$EndComp
$Comp
L basico:Logo_Poncho #G101
U 1 1 560CFFC0
P 10150 6000
F 0 "#G101" H 10100 5600 60  0001 C CNN
F 1 "Logo_Poncho" H 10350 5600 60  0001 C CNN
F 2 "Poncho_Esqueleto:Logo_Poncho" H 10150 6000 60  0001 C CNN
F 3 "" H 10150 6000 60  0001 C CNN
	1    10150 6000
	1    0    0    -1  
$EndComp
$Comp
L basico:+5V #PWR02
U 1 1 560EB7BE
P 2950 950
F 0 "#PWR02" H 2950 1040 20  0001 C CNN
F 1 "+5V" H 2950 1100 30  0000 C CNN
F 2 "" H 2950 950 60  0000 C CNN
F 3 "" H 2950 950 60  0000 C CNN
	1    2950 950 
	1    0    0    -1  
$EndComp
$Comp
L basico:+5VP #PWR05
U 1 1 560EE7D3
P 3000 4700
F 0 "#PWR05" H 3000 4790 20  0001 C CNN
F 1 "+5VP" H 3000 4850 30  0000 C CNN
F 2 "" H 3000 4700 60  0000 C CNN
F 3 "" H 3000 4700 60  0000 C CNN
	1    3000 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 4950 3000 4950
Wire Wire Line
	3000 4950 3000 4700
Wire Wire Line
	2950 1150 2950 950 
$Comp
L basico:GND #PWR0101
U 1 1 5D9E93A7
P 5700 6100
F 0 "#PWR0101" H 5700 5850 50  0001 C CNN
F 1 "GND" H 5705 5927 50  0000 C CNN
F 2 "" H 5700 6100 50  0000 C CNN
F 3 "" H 5700 6100 50  0000 C CNN
	1    5700 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 5950 5500 6100
Wire Wire Line
	5500 6100 5600 6100
Connection ~ 5700 6100
Wire Wire Line
	5900 5950 5900 6100
Wire Wire Line
	5900 6100 5800 6100
Wire Wire Line
	5600 4150 5450 4150
Wire Wire Line
	5450 4150 5450 4050
Wire Wire Line
	5800 4150 5950 4150
Wire Wire Line
	5950 4150 5950 4050
$Comp
L basico:PWR_FLAG #FLG0101
U 1 1 5D9F87CD
P 5500 7100
F 0 "#FLG0101" H 5500 7195 50  0001 C CNN
F 1 "PWR_FLAG" H 5500 7323 50  0000 C CNN
F 2 "" H 5500 7100 50  0000 C CNN
F 3 "" H 5500 7100 50  0000 C CNN
	1    5500 7100
	1    0    0    -1  
$EndComp
$Comp
L basico:PWR_FLAG #FLG0102
U 1 1 5D9F8B61
P 5950 7100
F 0 "#FLG0102" H 5950 7195 50  0001 C CNN
F 1 "PWR_FLAG" H 5950 7323 50  0000 C CNN
F 2 "" H 5950 7100 50  0000 C CNN
F 3 "" H 5950 7100 50  0000 C CNN
	1    5950 7100
	1    0    0    -1  
$EndComp
$Comp
L basico:GND #PWR0104
U 1 1 5D9F8E69
P 5500 7150
F 0 "#PWR0104" H 5500 6900 50  0001 C CNN
F 1 "GND" H 5505 6977 50  0000 C CNN
F 2 "" H 5500 7150 50  0000 C CNN
F 3 "" H 5500 7150 50  0000 C CNN
	1    5500 7150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0105
U 1 1 5D9F935F
P 5950 7150
F 0 "#PWR0105" H 5950 7000 50  0001 C CNN
F 1 "VCC" H 5968 7323 50  0000 C CNN
F 2 "" H 5950 7150 50  0001 C CNN
F 3 "" H 5950 7150 50  0001 C CNN
	1    5950 7150
	-1   0    0    1   
$EndComp
$Comp
L Driver_Motor:L293D U1
U 1 1 5D9E70BB
P 5700 5150
F 0 "U1" H 5700 6450 50  0000 C CNN
F 1 "L293D" H 5700 6350 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 5950 4400 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/l293.pdf" H 5400 5850 50  0001 C CNN
	1    5700 5150
	1    0    0    -1  
$EndComp
$Comp
L basico:GND #PWR0106
U 1 1 5DA32ABE
P 8850 6150
F 0 "#PWR0106" H 8850 5900 50  0001 C CNN
F 1 "GND" H 8855 5977 50  0000 C CNN
F 2 "" H 8850 6150 50  0000 C CNN
F 3 "" H 8850 6150 50  0000 C CNN
	1    8850 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 4150 8600 4150
Wire Wire Line
	8600 4150 8600 4050
Wire Wire Line
	8950 4150 9100 4150
Wire Wire Line
	9100 4150 9100 4050
$Comp
L Driver_Motor:L293D U2
U 1 1 5DA32AF1
P 8850 5150
F 0 "U2" H 8850 6450 50  0000 C CNN
F 1 "L293D" H 8850 6350 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 9100 4400 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/l293.pdf" H 8550 5850 50  0001 C CNN
	1    8850 5150
	1    0    0    -1  
$EndComp
Text GLabel 5150 4550 0    50   Input ~ 0
H1_IN_+
Text GLabel 8300 4950 0    50   Input ~ 0
H3_ENABLE
Text GLabel 8300 4550 0    50   Input ~ 0
H3_IN_+
Text GLabel 8300 4750 0    50   Input ~ 0
H3_IN_-
Text GLabel 8300 5550 0    50   Input ~ 0
H4_ENABLE
Text GLabel 5150 4950 0    50   Input ~ 0
H1_ENABLE
Text GLabel 8300 5350 0    50   Input ~ 0
H4_IN_-
Text GLabel 8300 5150 0    50   Input ~ 0
H4_IN_+
Text GLabel 5150 5550 0    50   Input ~ 0
H2_ENABLE
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 5DA67892
P 6900 4700
F 0 "J2" H 6980 4692 50  0000 L CNN
F 1 "H1_OUT" H 6980 4601 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 6900 4700 50  0001 C CNN
F 3 "~" H 6900 4700 50  0001 C CNN
	1    6900 4700
	1    0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 5DA681E9
P 6900 5300
F 0 "J3" H 6980 5292 50  0000 L CNN
F 1 "H2_OUT" H 6980 5201 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 6900 5300 50  0001 C CNN
F 3 "~" H 6900 5300 50  0001 C CNN
	1    6900 5300
	1    0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J4
U 1 1 5DA68697
P 10050 4700
F 0 "J4" H 10130 4692 50  0000 L CNN
F 1 "H3_OUT" H 10130 4601 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 10050 4700 50  0001 C CNN
F 3 "~" H 10050 4700 50  0001 C CNN
	1    10050 4700
	1    0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J5
U 1 1 5DA686A1
P 10050 5300
F 0 "J5" H 10130 5292 50  0000 L CNN
F 1 "H4_OUT" H 10130 5201 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 10050 5300 50  0001 C CNN
F 3 "~" H 10050 5300 50  0001 C CNN
	1    10050 5300
	1    0    0    1   
$EndComp
Wire Wire Line
	9350 5150 9850 5150
Wire Wire Line
	9850 5150 9850 5200
Wire Wire Line
	9350 5350 9850 5350
Wire Wire Line
	9850 5350 9850 5300
Wire Wire Line
	9350 4550 9850 4550
Wire Wire Line
	9850 4550 9850 4600
Wire Wire Line
	9350 4750 9850 4750
Wire Wire Line
	9850 4750 9850 4700
Wire Wire Line
	6200 4550 6700 4550
Wire Wire Line
	6700 4550 6700 4600
Wire Wire Line
	6200 4750 6700 4750
Wire Wire Line
	6700 4750 6700 4700
Wire Wire Line
	6200 5150 6700 5150
Wire Wire Line
	6700 5150 6700 5200
Wire Wire Line
	6200 5350 6700 5350
Wire Wire Line
	6700 5350 6700 5300
Wire Wire Line
	9100 4050 9300 4050
Connection ~ 9100 4050
Wire Wire Line
	9100 4050 9100 4000
Wire Wire Line
	8400 4050 8600 4050
Connection ~ 8600 4050
Wire Wire Line
	8600 4050 8600 4000
$Comp
L basico:GND #PWR0109
U 1 1 5DA937E1
P 9650 4100
F 0 "#PWR0109" H 9650 3850 50  0001 C CNN
F 1 "GND" H 9655 3927 50  0000 C CNN
F 2 "" H 9650 4100 50  0000 C CNN
F 3 "" H 9650 4100 50  0000 C CNN
	1    9650 4100
	1    0    0    -1  
$EndComp
$Comp
L basico:GND #PWR0110
U 1 1 5DA93EFD
P 8050 4100
F 0 "#PWR0110" H 8050 3850 50  0001 C CNN
F 1 "GND" H 8050 3950 50  0000 C CNN
F 2 "" H 8050 4100 50  0000 C CNN
F 3 "" H 8050 4100 50  0000 C CNN
	1    8050 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5DA972C3
P 8250 4050
F 0 "C2" V 7998 4050 50  0000 C CNN
F 1 "0.1uf" V 8089 4050 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 8288 3900 50  0001 C CNN
F 3 "~" H 8250 4050 50  0001 C CNN
	1    8250 4050
	0    1    1    0   
$EndComp
$Comp
L Device:CP1 C4
U 1 1 5DA980B8
P 9450 4050
F 0 "C4" V 9702 4050 50  0000 C CNN
F 1 "1uf" V 9611 4050 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 9450 4050 50  0001 C CNN
F 3 "~" H 9450 4050 50  0001 C CNN
	1    9450 4050
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP1 C3
U 1 1 5DAA14F0
P 6300 4050
F 0 "C3" V 6552 4050 50  0000 C CNN
F 1 "1uf" V 6461 4050 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 6300 4050 50  0001 C CNN
F 3 "~" H 6300 4050 50  0001 C CNN
	1    6300 4050
	0    -1   -1   0   
$EndComp
$Comp
L basico:GND #PWR0111
U 1 1 5DAA1750
P 6500 4100
F 0 "#PWR0111" H 6500 3850 50  0001 C CNN
F 1 "GND" H 6505 3927 50  0000 C CNN
F 2 "" H 6500 4100 50  0000 C CNN
F 3 "" H 6500 4100 50  0000 C CNN
	1    6500 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 4050 6150 4050
Connection ~ 5950 4050
Wire Wire Line
	5950 4050 5950 4000
$Comp
L Device:C C1
U 1 1 5DAAE8BE
P 5100 4050
F 0 "C1" V 4848 4050 50  0000 C CNN
F 1 "0.1uf" V 4939 4050 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 5138 3900 50  0001 C CNN
F 3 "~" H 5100 4050 50  0001 C CNN
	1    5100 4050
	0    1    1    0   
$EndComp
$Comp
L basico:GND #PWR0112
U 1 1 5DAAFBBB
P 4900 4100
F 0 "#PWR0112" H 4900 3850 50  0001 C CNN
F 1 "GND" H 4905 3927 50  0000 C CNN
F 2 "" H 4900 4100 50  0000 C CNN
F 3 "" H 4900 4100 50  0000 C CNN
	1    4900 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 4050 5450 4050
Connection ~ 5450 4050
Wire Wire Line
	5450 4050 5450 4000
$Comp
L Device:LED D1
U 1 1 5DB23EA0
P 5800 1000
F 0 "D1" H 5793 745 50  0000 C CNN
F 1 "Pwr_LED" H 5793 836 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" H 5800 1000 50  0001 C CNN
F 3 "~" H 5800 1000 50  0001 C CNN
	1    5800 1000
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D2
U 1 1 5DB244DC
P 7350 1000
F 0 "D2" H 7343 745 50  0000 C CNN
F 1 "Bluetooth_LED" H 7343 836 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" H 7350 1000 50  0001 C CNN
F 3 "~" H 7350 1000 50  0001 C CNN
	1    7350 1000
	-1   0    0    1   
$EndComp
Text GLabel 5200 1000 0    50   Input ~ 0
PWR_LED
$Comp
L basico:GND #PWR0115
U 1 1 5DB26C52
P 6000 1050
F 0 "#PWR0115" H 6000 800 50  0001 C CNN
F 1 "GND" H 6005 877 50  0000 C CNN
F 2 "" H 6000 1050 50  0000 C CNN
F 3 "" H 6000 1050 50  0000 C CNN
	1    6000 1050
	1    0    0    -1  
$EndComp
$Comp
L basico:GND #PWR0116
U 1 1 5DB26E98
P 7550 1050
F 0 "#PWR0116" H 7550 800 50  0001 C CNN
F 1 "GND" H 7555 877 50  0000 C CNN
F 2 "" H 7550 1050 50  0000 C CNN
F 3 "" H 7550 1050 50  0000 C CNN
	1    7550 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 5DB271E4
P 8800 1000
F 0 "D3" H 8793 745 50  0000 C CNN
F 1 "State_LED" H 8793 836 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" H 8800 1000 50  0001 C CNN
F 3 "~" H 8800 1000 50  0001 C CNN
	1    8800 1000
	-1   0    0    1   
$EndComp
$Comp
L basico:GND #PWR0117
U 1 1 5DB271EF
P 9000 1050
F 0 "#PWR0117" H 9000 800 50  0001 C CNN
F 1 "GND" H 9005 877 50  0000 C CNN
F 2 "" H 9000 1050 50  0000 C CNN
F 3 "" H 9000 1050 50  0000 C CNN
	1    9000 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5DB50365
P 5400 1000
F 0 "R1" V 5193 1000 50  0000 C CNN
F 1 "420Ω" V 5284 1000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5330 1000 50  0001 C CNN
F 3 "~" H 5400 1000 50  0001 C CNN
	1    5400 1000
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5DB519D2
P 6950 1000
F 0 "R2" V 6743 1000 50  0000 C CNN
F 1 "420Ω" V 6834 1000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6880 1000 50  0001 C CNN
F 3 "~" H 6950 1000 50  0001 C CNN
	1    6950 1000
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5DB5A743
P 8400 1000
F 0 "R3" V 8193 1000 50  0000 C CNN
F 1 "420Ω" V 8284 1000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 8330 1000 50  0001 C CNN
F 3 "~" H 8400 1000 50  0001 C CNN
	1    8400 1000
	0    1    1    0   
$EndComp
Wire Wire Line
	5550 1000 5650 1000
Wire Wire Line
	7100 1000 7200 1000
Wire Wire Line
	8550 1000 8650 1000
Text GLabel 3100 4950 2    50   Input ~ 0
PWR_LED
Text GLabel 2750 6850 2    50   Input ~ 0
BT_LED
Text GLabel 8200 1000 0    50   Input ~ 0
ST_LED
$Comp
L Device:Buzzer BZ1
U 1 1 5DB802F5
P 10300 1950
F 0 "BZ1" V 10351 1763 50  0000 R CNN
F 1 "Buzzer" V 10260 1763 50  0000 R CNN
F 2 "Buzzer_Beeper:Buzzer_12x9.5RM7.6" V 10275 2050 50  0001 C CNN
F 3 "~" V 10275 2050 50  0001 C CNN
	1    10300 1950
	0    1    -1   0   
$EndComp
Text GLabel 9800 1000 0    50   Input ~ 0
SR04_TR
Text GLabel 9800 1100 0    50   Input ~ 0
SR04_ECHO
$Comp
L basico:GND #PWR0120
U 1 1 5DB89736
P 9800 1250
F 0 "#PWR0120" H 9800 1000 50  0001 C CNN
F 1 "GND" H 9805 1077 50  0000 C CNN
F 2 "" H 9800 1250 50  0000 C CNN
F 3 "" H 9800 1250 50  0000 C CNN
	1    9800 1250
	1    0    0    -1  
$EndComp
Text GLabel 2750 6650 2    50   Input ~ 0
SR04_TR
Text GLabel 2750 6550 2    50   Input ~ 0
SR04_ECHO
$Comp
L basico:GNDA #PWR03
U 1 1 5DB90DF3
P 6400 7150
F 0 "#PWR03" H 6400 6900 50  0001 C CNN
F 1 "GNDA" H 6400 7000 50  0000 C CNN
F 2 "" H 6400 7150 50  0000 C CNN
F 3 "" H 6400 7150 50  0000 C CNN
	1    6400 7150
	1    0    0    -1  
$EndComp
$Comp
L basico:PWR_FLAG #FLG01
U 1 1 5DB92375
P 6400 7100
F 0 "#FLG01" H 6400 7195 50  0001 C CNN
F 1 "PWR_FLAG" H 6400 7323 50  0000 C CNN
F 2 "" H 6400 7100 50  0000 C CNN
F 3 "" H 6400 7100 50  0000 C CNN
	1    6400 7100
	1    0    0    -1  
$EndComp
Text GLabel 1150 2250 0    50   Input ~ 0
HM10_RX
Text GLabel 1150 2350 0    50   Input ~ 0
HM10_TX
$Comp
L basico:GNDD #PWR0121
U 1 1 5DB9871E
P 5050 7150
F 0 "#PWR0121" H 5050 6900 50  0001 C CNN
F 1 "GNDD" H 5050 7000 50  0000 C CNN
F 2 "" H 5050 7150 50  0000 C CNN
F 3 "" H 5050 7150 50  0000 C CNN
	1    5050 7150
	1    0    0    -1  
$EndComp
$Comp
L basico:PWR_FLAG #FLG0103
U 1 1 5DB98CA0
P 5050 7100
F 0 "#FLG0103" H 5050 7195 50  0001 C CNN
F 1 "PWR_FLAG" H 5050 7323 50  0000 C CNN
F 2 "" H 5050 7100 50  0000 C CNN
F 3 "" H 5050 7100 50  0000 C CNN
	1    5050 7100
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7000 Q1
U 1 1 5D9EDDEB
P 10100 2650
F 0 "Q1" H 10306 2696 50  0000 L CNN
F 1 "2N7000" H 10306 2605 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 10300 2575 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7000.pdf" H 10100 2650 50  0001 L CNN
	1    10100 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5D9FF9A4
P 10200 2250
F 0 "R6" H 10000 2300 50  0000 L CNN
F 1 "250R" H 9900 2200 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 10130 2250 50  0001 C CNN
F 3 "~" H 10200 2250 50  0001 C CNN
	1    10200 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 2100 10200 2050
Wire Wire Line
	10200 2400 10200 2450
$Comp
L basico:GND #PWR013
U 1 1 5DA0A115
P 10200 2900
F 0 "#PWR013" H 10200 2650 50  0001 C CNN
F 1 "GND" H 10205 2727 50  0000 C CNN
F 2 "" H 10200 2900 50  0000 C CNN
F 3 "" H 10200 2900 50  0000 C CNN
	1    10200 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 2900 10200 2850
$Comp
L Device:R R4
U 1 1 5DA0F726
P 9850 2850
F 0 "R4" H 9920 2896 50  0000 L CNN
F 1 "10k" H 9920 2805 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 9780 2850 50  0001 C CNN
F 3 "~" H 9850 2850 50  0001 C CNN
	1    9850 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5DA0FB8F
P 9850 3250
F 0 "R5" H 9920 3296 50  0000 L CNN
F 1 "330k" H 9920 3205 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 9780 3250 50  0001 C CNN
F 3 "~" H 9850 3250 50  0001 C CNN
	1    9850 3250
	1    0    0    -1  
$EndComp
$Comp
L basico:GND #PWR04
U 1 1 5DA19F98
P 9850 3450
F 0 "#PWR04" H 9850 3200 50  0001 C CNN
F 1 "GND" H 9855 3277 50  0000 C CNN
F 2 "" H 9850 3450 50  0000 C CNN
F 3 "" H 9850 3450 50  0000 C CNN
	1    9850 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 3000 9850 3050
Wire Wire Line
	9850 3450 9850 3400
Wire Wire Line
	9900 2650 9850 2650
Wire Wire Line
	9850 2650 9850 2700
Text GLabel 1100 6650 0    50   Input ~ 0
BUZZER
Text GLabel 9700 3050 0    50   Input ~ 0
BUZZER
Wire Wire Line
	9700 3050 9850 3050
Connection ~ 9850 3050
Wire Wire Line
	9850 3050 9850 3100
$Comp
L Connector:Conn_01x04_Female J6
U 1 1 5DB82610
P 10050 1000
F 0 "J6" H 10000 700 50  0000 R CNN
F 1 "HC-SR04" H 10150 1250 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 10050 1000 50  0001 C CNN
F 3 "~" H 10050 1000 50  0001 C CNN
	1    10050 1000
	1    0    0    -1  
$EndComp
Text Notes 10100 950  0    51   ~ 0
VCC
Text Notes 10100 1050 0    51   ~ 0
Trigger
Text Notes 10100 1150 0    51   ~ 0
Echo
Text Notes 10100 1250 0    51   ~ 0
GND
Wire Wire Line
	8200 1000 8250 1000
Wire Wire Line
	6800 1000 6750 1000
Wire Wire Line
	5200 1000 5250 1000
Wire Wire Line
	9800 1100 9850 1100
Wire Wire Line
	9850 1000 9800 1000
Wire Wire Line
	4900 4100 4900 4050
Wire Wire Line
	4900 4050 4950 4050
Wire Wire Line
	6500 4100 6500 4050
Wire Wire Line
	6500 4050 6450 4050
Wire Wire Line
	8050 4100 8050 4050
Wire Wire Line
	8050 4050 8100 4050
Wire Wire Line
	9650 4100 9650 4050
Wire Wire Line
	9650 4050 9600 4050
Wire Wire Line
	8650 6150 8750 6150
Wire Wire Line
	8650 5950 8650 6150
Wire Wire Line
	8750 5950 8750 6150
Connection ~ 8750 6150
Wire Wire Line
	8750 6150 8850 6150
Wire Wire Line
	8950 6150 8850 6150
Wire Wire Line
	8950 5950 8950 6150
Connection ~ 8850 6150
Wire Wire Line
	9050 6150 8950 6150
Wire Wire Line
	9050 5950 9050 6150
Connection ~ 8950 6150
Wire Wire Line
	5600 5950 5600 6100
Connection ~ 5600 6100
Wire Wire Line
	5600 6100 5700 6100
Wire Wire Line
	5800 5950 5800 6100
Connection ~ 5800 6100
Wire Wire Line
	5800 6100 5700 6100
Wire Wire Line
	5150 4550 5200 4550
Wire Wire Line
	5200 4750 5150 4750
Wire Wire Line
	5150 4950 5200 4950
Wire Wire Line
	5200 5150 5150 5150
Wire Wire Line
	5150 5350 5200 5350
Wire Wire Line
	5150 5550 5200 5550
Wire Wire Line
	8300 4550 8350 4550
Wire Wire Line
	8300 4750 8350 4750
Wire Wire Line
	8300 4950 8350 4950
Wire Wire Line
	8300 5150 8350 5150
Wire Wire Line
	8300 5350 8350 5350
Wire Wire Line
	8350 5550 8300 5550
Wire Wire Line
	2750 6550 2550 6550
Wire Wire Line
	2550 6750 2750 6750
Wire Wire Line
	2750 6850 2550 6850
Wire Wire Line
	1150 2250 1350 2250
Wire Wire Line
	1350 2350 1150 2350
Wire Wire Line
	5050 7150 5050 7100
Wire Wire Line
	5500 7100 5500 7150
Wire Wire Line
	5950 7100 5950 7150
Wire Wire Line
	6400 7100 6400 7150
Wire Wire Line
	6000 1050 6000 1000
Wire Wire Line
	6000 1000 5950 1000
Wire Wire Line
	7550 1050 7550 1000
Wire Wire Line
	7550 1000 7500 1000
Wire Wire Line
	9000 1050 9000 1000
Wire Wire Line
	9000 1000 8950 1000
Wire Wire Line
	9800 1250 9800 1200
Wire Wire Line
	9800 1200 9850 1200
Wire Wire Line
	9700 850  9700 900 
Wire Wire Line
	9700 900  9850 900 
$Comp
L Connector:Screw_Terminal_01x02 J7
U 1 1 5DC470EC
P 5000 2700
F 0 "J7" H 5080 2692 50  0000 L CNN
F 1 "POWER-IN" H 5080 2601 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 5000 2700 50  0001 C CNN
F 3 "~" H 5000 2700 50  0001 C CNN
	1    5000 2700
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_SPST SW1
U 1 1 5D9F9803
P 5450 2600
F 0 "SW1" H 5450 2835 50  0000 C CNN
F 1 "SW_SPST" H 5450 2744 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx01_Slide_9.78x4.72mm_W7.62mm_P2.54mm" H 5450 2600 50  0001 C CNN
F 3 "~" H 5450 2600 50  0001 C CNN
	1    5450 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2600 5250 2600
Wire Wire Line
	3800 1550 4100 1550
Text GLabel 4100 1550 2    50   Input ~ 0
HM10_STATE
Text GLabel 4100 1350 2    50   Input ~ 0
HM10_TX
Text GLabel 4100 1450 2    50   Input ~ 0
HM10_RX
Wire Wire Line
	3800 1450 4100 1450
Wire Wire Line
	3800 1350 4100 1350
Wire Wire Line
	3800 1150 4050 1150
$Comp
L basico:GND #PWR0113
U 1 1 5DB05690
P 3900 1700
F 0 "#PWR0113" H 3900 1450 50  0001 C CNN
F 1 "GND" H 3905 1527 50  0000 C CNN
F 2 "" H 3900 1700 50  0000 C CNN
F 3 "" H 3900 1700 50  0000 C CNN
	1    3900 1700
	1    0    0    -1  
$EndComp
NoConn ~ 3800 1050
$Comp
L Connector:Conn_01x06_Female J1
U 1 1 5DAE33B5
P 3600 1350
F 0 "J1" H 3600 950 50  0000 R CNN
F 1 "HM-10" H 3600 850 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Vertical" H 3600 1350 50  0001 C CNN
F 3 "~" H 3600 1350 50  0001 C CNN
	1    3600 1350
	-1   0    0    1   
$EndComp
Wire Wire Line
	4050 900  4050 1150
Wire Wire Line
	3900 1700 3900 1250
Wire Wire Line
	3900 1250 3800 1250
Text Notes 3350 1200 0    51   ~ 0
VCC
Text Notes 3350 1300 0    51   ~ 0
GND
Text Notes 3350 1400 0    51   ~ 0
Tx
Text Notes 3350 1500 0    51   ~ 0
Rx
Text Notes 3350 1600 0    51   ~ 0
STATE
$Comp
L basico:GND #PWR018
U 1 1 5DC86E84
P 7100 3050
F 0 "#PWR018" H 7100 2800 50  0001 C CNN
F 1 "GND" H 7105 2877 50  0000 C CNN
F 2 "" H 7100 3050 50  0000 C CNN
F 3 "" H 7100 3050 50  0000 C CNN
	1    7100 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 2750 7100 3050
Wire Wire Line
	6950 2750 7100 2750
$Comp
L fuentes:CONVERSROR_DC-DC U4
U 1 1 5DC46BCF
P 6500 2700
F 0 "U4" H 6475 3075 50  0000 C CNN
F 1 "STEP-DOWN" H 6475 2984 50  0000 C CNN
F 2 "footprint:mini360" H 6400 2700 50  0001 C CNN
F 3 "" H 6400 2700 50  0001 C CNN
	1    6500 2700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J8
U 1 1 5DC8B6BA
P 7900 2600
F 0 "J8" H 7928 2576 50  0000 L CNN
F 1 "CONN_A_EDU_CIAA" H 7928 2485 50  0000 L CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-02A_1x02_P2.54mm_Vertical" H 7900 2600 50  0001 C CNN
F 3 "~" H 7900 2600 50  0001 C CNN
	1    7900 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 2750 7250 2750
Connection ~ 7100 2750
Wire Wire Line
	6950 2550 7100 2550
Wire Wire Line
	5650 2600 5850 2600
Wire Wire Line
	5850 2600 5850 2550
Wire Wire Line
	5850 2550 6000 2550
Wire Wire Line
	5850 2700 5850 2750
Wire Wire Line
	5850 2750 6000 2750
Wire Wire Line
	5200 2700 5550 2700
$Comp
L power:+8V #PWR0102
U 1 1 5DCD3FFB
P 5850 2350
F 0 "#PWR0102" H 5850 2200 50  0001 C CNN
F 1 "+8V" H 5865 2523 50  0000 C CNN
F 2 "" H 5850 2350 50  0001 C CNN
F 3 "" H 5850 2350 50  0001 C CNN
	1    5850 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 2350 5850 2550
Connection ~ 5850 2550
Wire Wire Line
	7100 2350 7100 2550
Connection ~ 7100 2550
Wire Wire Line
	7100 2550 7250 2550
$Comp
L power:+8V #PWR0108
U 1 1 5DCEDBC7
P 5950 4000
F 0 "#PWR0108" H 5950 3850 50  0001 C CNN
F 1 "+8V" H 5965 4173 50  0000 C CNN
F 2 "" H 5950 4000 50  0001 C CNN
F 3 "" H 5950 4000 50  0001 C CNN
	1    5950 4000
	1    0    0    -1  
$EndComp
$Comp
L power:+8V #PWR0114
U 1 1 5DCF0F32
P 9100 4000
F 0 "#PWR0114" H 9100 3850 50  0001 C CNN
F 1 "+8V" H 9115 4173 50  0000 C CNN
F 2 "" H 9100 4000 50  0001 C CNN
F 3 "" H 9100 4000 50  0001 C CNN
	1    9100 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 2050 10850 2200
Wire Wire Line
	10850 2200 10400 2200
Wire Wire Line
	10400 2200 10400 2050
$Comp
L basico:+5V #PWR0123
U 1 1 5DD08486
P 4050 900
F 0 "#PWR0123" H 4050 990 20  0001 C CNN
F 1 "+5V" H 4050 1050 30  0000 C CNN
F 2 "" H 4050 900 60  0000 C CNN
F 3 "" H 4050 900 60  0000 C CNN
	1    4050 900 
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C5
U 1 1 5DD78138
P 7450 2650
F 0 "C5" V 7702 2650 50  0000 C CNN
F 1 "10uf" V 7611 2650 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P2.50mm" H 7450 2650 50  0001 C CNN
F 3 "~" H 7450 2650 50  0001 C CNN
	1    7450 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 2550 7250 2500
Wire Wire Line
	7250 2500 7450 2500
Wire Wire Line
	7700 2500 7700 2600
Connection ~ 7450 2500
Wire Wire Line
	7450 2500 7600 2500
Wire Wire Line
	7700 2700 7700 2800
Wire Wire Line
	7700 2800 7450 2800
Wire Wire Line
	7250 2800 7250 2750
Connection ~ 7450 2800
Wire Wire Line
	7450 2800 7250 2800
Text GLabel 5150 5150 0    50   Input ~ 0
H2_IN_+
Text GLabel 5150 5350 0    50   Input ~ 0
H2_IN_-
$Comp
L basico:GND #PWR0124
U 1 1 5DCF9A96
P 5550 3050
F 0 "#PWR0124" H 5550 2800 50  0001 C CNN
F 1 "GND" H 5555 2877 50  0000 C CNN
F 2 "" H 5550 3050 50  0000 C CNN
F 3 "" H 5550 3050 50  0000 C CNN
	1    5550 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 3050 5550 2700
Connection ~ 5550 2700
Wire Wire Line
	5550 2700 5850 2700
Text GLabel 6750 1000 0    50   Input ~ 0
BT_LED
Text GLabel 5150 4750 0    50   Input ~ 0
H1_IN_-
$Comp
L power:+5VL #PWR0103
U 1 1 5DC8F56A
P 7100 2350
F 0 "#PWR0103" H 7100 2200 50  0001 C CNN
F 1 "+5VL" H 7115 2523 50  0000 C CNN
F 2 "" H 7100 2350 50  0001 C CNN
F 3 "" H 7100 2350 50  0001 C CNN
	1    7100 2350
	1    0    0    -1  
$EndComp
$Comp
L power:+5VL #PWR0107
U 1 1 5DC90E66
P 8600 4000
F 0 "#PWR0107" H 8600 3850 50  0001 C CNN
F 1 "+5VL" H 8615 4173 50  0000 C CNN
F 2 "" H 8600 4000 50  0001 C CNN
F 3 "" H 8600 4000 50  0001 C CNN
	1    8600 4000
	1    0    0    -1  
$EndComp
$Comp
L power:+5VL #PWR0118
U 1 1 5DC9170F
P 5450 4000
F 0 "#PWR0118" H 5450 3850 50  0001 C CNN
F 1 "+5VL" H 5465 4173 50  0000 C CNN
F 2 "" H 5450 4000 50  0001 C CNN
F 3 "" H 5450 4000 50  0001 C CNN
	1    5450 4000
	1    0    0    -1  
$EndComp
$Comp
L basico:+5VP #PWR0119
U 1 1 5DCAD75C
P 9700 850
F 0 "#PWR0119" H 9700 940 20  0001 C CNN
F 1 "+5VP" H 9700 1000 30  0000 C CNN
F 2 "" H 9700 850 60  0000 C CNN
F 3 "" H 9700 850 60  0000 C CNN
	1    9700 850 
	1    0    0    -1  
$EndComp
$Comp
L basico:+5VP #PWR0122
U 1 1 5DCB083A
P 10850 2050
F 0 "#PWR0122" H 10850 2140 20  0001 C CNN
F 1 "+5VP" H 10850 2200 30  0000 C CNN
F 2 "" H 10850 2050 60  0000 C CNN
F 3 "" H 10850 2050 60  0000 C CNN
	1    10850 2050
	1    0    0    -1  
$EndComp
Text GLabel 2750 6750 2    50   Input ~ 0
ST_LED
Wire Wire Line
	1350 6650 1100 6650
Wire Wire Line
	2550 6650 2750 6650
$Comp
L power:+8V #PWR0125
U 1 1 5DCB0308
P 4150 7150
F 0 "#PWR0125" H 4150 7000 50  0001 C CNN
F 1 "+8V" H 4165 7323 50  0000 C CNN
F 2 "" H 4150 7150 50  0001 C CNN
F 3 "" H 4150 7150 50  0001 C CNN
	1    4150 7150
	-1   0    0    1   
$EndComp
$Comp
L power:+5VL #PWR0126
U 1 1 5DCB0AD7
P 4600 7150
F 0 "#PWR0126" H 4600 7000 50  0001 C CNN
F 1 "+5VL" H 4615 7323 50  0000 C CNN
F 2 "" H 4600 7150 50  0001 C CNN
F 3 "" H 4600 7150 50  0001 C CNN
	1    4600 7150
	-1   0    0    1   
$EndComp
$Comp
L basico:PWR_FLAG #FLG0104
U 1 1 5DCC1E8B
P 4600 7100
F 0 "#FLG0104" H 4600 7195 50  0001 C CNN
F 1 "PWR_FLAG" H 4600 7323 50  0000 C CNN
F 2 "" H 4600 7100 50  0000 C CNN
F 3 "" H 4600 7100 50  0000 C CNN
	1    4600 7100
	1    0    0    -1  
$EndComp
$Comp
L basico:PWR_FLAG #FLG0105
U 1 1 5DCC1E95
P 4150 7100
F 0 "#FLG0105" H 4150 7195 50  0001 C CNN
F 1 "PWR_FLAG" H 4150 7323 50  0000 C CNN
F 2 "" H 4150 7100 50  0000 C CNN
F 3 "" H 4150 7100 50  0000 C CNN
	1    4150 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 7150 4150 7100
Wire Wire Line
	4600 7100 4600 7150
Wire Wire Line
	2550 1150 2950 1150
Text GLabel 2750 2850 2    50   Input ~ 0
H1_ENABLE
Text GLabel 2750 2750 2    50   Input ~ 0
H2_ENABLE
Text GLabel 1150 3050 0    50   Input ~ 0
H3_ENABLE
Text GLabel 1150 2650 0    50   Input ~ 0
H4_ENABLE
Wire Wire Line
	1150 2650 1350 2650
Wire Wire Line
	1150 3050 1350 3050
Wire Wire Line
	2550 2750 2750 2750
Wire Wire Line
	2750 2850 2550 2850
Text GLabel 2750 6450 2    50   Input ~ 0
H1_IN_+
Text GLabel 2750 6150 2    50   Input ~ 0
H1_IN_-
Text GLabel 2750 6250 2    50   Input ~ 0
H2_IN_+
Text GLabel 2750 6350 2    50   Input ~ 0
H2_IN_-
Text GLabel 1100 6350 0    50   Input ~ 0
H3_IN_+
Text GLabel 2750 5950 2    50   Input ~ 0
H3_IN_-
Text GLabel 2750 6050 2    50   Input ~ 0
H4_IN_+
Text GLabel 1100 6450 0    50   Input ~ 0
H4_IN_-
Wire Wire Line
	2550 6150 2750 6150
Wire Wire Line
	2550 6250 2750 6250
Wire Wire Line
	2550 6350 2750 6350
Wire Wire Line
	2550 6450 2750 6450
Wire Wire Line
	2550 6050 2750 6050
Wire Wire Line
	2750 5950 2550 5950
Wire Wire Line
	1100 6450 1350 6450
Wire Wire Line
	1100 6350 1350 6350
NoConn ~ 2550 3050
NoConn ~ 2550 2950
NoConn ~ 1350 2950
NoConn ~ 1350 2850
NoConn ~ 2550 2650
NoConn ~ 1350 2450
NoConn ~ 1350 2550
NoConn ~ 2550 2550
NoConn ~ 2550 2450
NoConn ~ 2550 2350
NoConn ~ 2550 2250
NoConn ~ 1350 1150
NoConn ~ 1350 1250
NoConn ~ 2550 1250
NoConn ~ 1350 4950
NoConn ~ 1350 5050
NoConn ~ 2550 5050
NoConn ~ 1350 6850
NoConn ~ 1350 6750
NoConn ~ 1350 6250
NoConn ~ 1350 6150
NoConn ~ 1350 5950
$Comp
L basico:Conn_Poncho2P_2x_20x2_redux XA1
U 2 1 5DE7D8CF
P 1600 5250
F 0 "XA1" H 1950 5797 60  0000 C CNN
F 1 "Conn_Poncho2P_2x_20x2_redux" H 1950 5691 60  0000 C CNN
F 2 "footprint:Conn_Poncho_SinBorde" H 1600 5250 60  0001 C CNN
F 3 "" H 1600 5250 60  0000 C CNN
	2    1600 5250
	1    0    0    -1  
$EndComp
$Comp
L basico:Conn_Poncho2P_2x_20x2_redux XA1
U 1 1 5DE8C81E
P 1600 1450
F 0 "XA1" H 1950 1997 60  0000 C CNN
F 1 "Conn_Poncho2P_2x_20x2_redux" H 1950 1891 60  0000 C CNN
F 2 "footprint:Conn_Poncho_SinBorde" H 1600 1450 60  0001 C CNN
F 3 "" H 1600 1450 60  0000 C CNN
	1    1600 1450
	1    0    0    -1  
$EndComp
NoConn ~ 1350 2750
Wire Wire Line
	7700 2300 7600 2300
Wire Wire Line
	7600 2300 7600 2500
Connection ~ 7600 2500
Wire Wire Line
	7600 2500 7700 2500
NoConn ~ 1350 6550
Wire Wire Line
	3100 4950 3000 4950
Connection ~ 3000 4950
NoConn ~ 1350 6050
$EndSCHEMATC