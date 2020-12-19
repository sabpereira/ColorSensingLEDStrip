EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "Color Sensing LED Strip"
Date "2020-10-22"
Rev "Rev. 1.1"
Comp "Sabrina Pereira & Co."
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5F871177
P 2050 4800
F 0 "A1" H 1700 3800 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 2050 3350 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 2050 4800 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 2050 4800 50  0001 C CNN
F 4 "Amazon" H 2050 4800 50  0001 C CNN "Vendor"
	1    2050 4800
	1    0    0    -1  
$EndComp
$Comp
L MicrocontrollersProject:OLED U2
U 1 1 5F8CE77D
P 8500 2600
F 0 "U2" H 8878 2854 50  0000 L CNN
F 1 "OLED" H 8878 2763 50  0000 L CNN
F 2 "MicrocontrollersProject:OLED_0.96" H 8500 2600 50  0001 C CNN
F 3 "" H 8500 2600 50  0001 C CNN
F 4 "Amazon" H 8500 2600 50  0001 C CNN "Vendor"
	1    8500 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5F8CF4A5
P 7950 1950
F 0 "#PWR011" H 7950 1700 50  0001 C CNN
F 1 "GND" H 7955 1777 50  0000 C CNN
F 2 "" H 7950 1950 50  0001 C CNN
F 3 "" H 7950 1950 50  0001 C CNN
	1    7950 1950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR014
U 1 1 5F8CFF75
P 8400 1850
F 0 "#PWR014" H 8400 1700 50  0001 C CNN
F 1 "+5V" H 8415 2023 50  0000 C CNN
F 2 "" H 8400 1850 50  0001 C CNN
F 3 "" H 8400 1850 50  0001 C CNN
	1    8400 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 2000 8400 1850
Wire Wire Line
	8250 2000 8250 1850
Wire Wire Line
	8250 1850 7950 1850
Wire Wire Line
	7950 1850 7950 1950
Text GLabel 9100 1950 2    50   Input ~ 0
I2C_SDA
Text GLabel 9100 1750 2    50   Input ~ 0
I2C_SCL
Wire Wire Line
	8750 1950 8750 2000
Wire Wire Line
	9100 1950 8750 1950
Wire Wire Line
	8600 2000 8600 1750
Wire Wire Line
	8600 1750 9100 1750
$Comp
L Connector:Barrel_Jack_Switch J1
U 1 1 5F8D3804
P 1700 2100
F 0 "J1" H 1757 2417 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 1757 2326 50  0000 C CNN
F 2 "digikey-footprints:Barrel_Jack_5.5mmODx2.1mmID_PJ-202A" H 1750 2060 50  0001 C CNN
F 3 "~" H 1750 2060 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/cui-devices/PJ-202A/252007?s=N4IgTCBcDaIMIAUC0YAMYCCSByAREAugL5A" H 1700 2100 50  0001 C CNN "Link"
F 5 "DK: CP-202A-ND" H 1700 2100 50  0001 C CNN "Vendor"
	1    1700 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5F8D4CE7
P 2300 2300
F 0 "#PWR05" H 2300 2050 50  0001 C CNN
F 1 "GND" H 2305 2127 50  0000 C CNN
F 2 "" H 2300 2300 50  0001 C CNN
F 3 "" H 2300 2300 50  0001 C CNN
	1    2300 2300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 5F8D5763
P 2300 1850
F 0 "#PWR04" H 2300 1700 50  0001 C CNN
F 1 "+5V" H 2315 2023 50  0000 C CNN
F 2 "" H 2300 1850 50  0001 C CNN
F 3 "" H 2300 1850 50  0001 C CNN
	1    2300 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 2300 2300 2250
Wire Wire Line
	2300 1850 2300 1950
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 5F8E2FFC
P 8500 4550
F 0 "J2" H 8450 4250 50  0000 L CNN
F 1 "4-Wire Screw Terminal" H 8580 4451 50  0001 L CNN
F 2 "Connector_Phoenix_MC:PhoenixContact_MCV_1,5_4-G-3.5_1x04_P3.50mm_Vertical" H 8500 4550 50  0001 C CNN
F 3 "~" H 8500 4550 50  0001 C CNN
F 4 "https://www.digikey.com/en/products/detail/stackpole-electronics-inc/CF18JT10K0/1741566?s=N4IgTCBcDaIMIDECMAOAUgFSQBgNLbgwFoA5AERAF0BfIA" H 8500 4550 50  0001 C CNN "Link"
F 5 "DK: 277-5744-ND" H 8500 4550 50  0001 C CNN "Vendor"
	1    8500 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5F8E4FB5
P 6500 4750
F 0 "#PWR013" H 6500 4500 50  0001 C CNN
F 1 "GND" H 6505 4577 50  0000 C CNN
F 2 "" H 6500 4750 50  0001 C CNN
F 3 "" H 6500 4750 50  0001 C CNN
	1    6500 4750
	1    0    0    -1  
$EndComp
Text Notes 9800 5050 2    50   ~ 0
LED Strip
Text GLabel 8200 4550 0    50   Input ~ 0
LED_CI
Text GLabel 8200 4650 0    50   Input ~ 0
LED_DI
Wire Wire Line
	8300 4550 8200 4550
Wire Wire Line
	8300 4650 8200 4650
Text GLabel 1400 4600 0    50   Input ~ 0
LED_CI
Text GLabel 1400 4700 0    50   Input ~ 0
LED_DI
Wire Wire Line
	1550 4600 1400 4600
Wire Wire Line
	1550 4700 1400 4700
$Comp
L power:+5V #PWR03
U 1 1 5F8E9FF8
P 2250 3600
F 0 "#PWR03" H 2250 3450 50  0001 C CNN
F 1 "+5V" H 2265 3773 50  0000 C CNN
F 2 "" H 2250 3600 50  0001 C CNN
F 3 "" H 2250 3600 50  0001 C CNN
	1    2250 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5F8EA7FB
P 2000 5950
F 0 "#PWR01" H 2000 5700 50  0001 C CNN
F 1 "GND" H 2005 5777 50  0000 C CNN
F 2 "" H 2000 5950 50  0001 C CNN
F 3 "" H 2000 5950 50  0001 C CNN
	1    2000 5950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5F8EAD38
P 2200 5950
F 0 "#PWR02" H 2200 5700 50  0001 C CNN
F 1 "GND" H 2205 5777 50  0000 C CNN
F 2 "" H 2200 5950 50  0001 C CNN
F 3 "" H 2200 5950 50  0001 C CNN
	1    2200 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 5800 2050 5950
Wire Wire Line
	2050 5950 2000 5950
Wire Wire Line
	2150 5800 2150 5950
Wire Wire Line
	2150 5950 2200 5950
Wire Wire Line
	2250 3800 2250 3600
Text GLabel 2750 5300 2    50   Input ~ 0
I2C_SCL
Wire Wire Line
	2750 5300 2550 5300
Text GLabel 2750 5200 2    50   Input ~ 0
I2C_SDA
Wire Wire Line
	2750 5200 2550 5200
$Comp
L Device:Rotary_Encoder_Switch SW1
U 1 1 5F8FB728
P 5500 2200
F 0 "SW1" H 5500 1950 50  0000 C CNN
F 1 "Rotary_Encoder_Switch" H 5950 2550 50  0000 C CNN
F 2 "Rotary_Encoder:RotaryEncoder_Alps_EC12E-Switch_Vertical_H20mm" H 5350 2360 50  0001 C CNN
F 3 "~" H 5500 2460 50  0001 C CNN
F 4 "Amazon" H 5500 2200 50  0001 C CNN "Vendor"
	1    5500 2200
	1    0    0    -1  
$EndComp
Text GLabel 6050 2100 2    50   Input ~ 0
ENCODER_SW
Wire Wire Line
	5800 2100 6050 2100
$Comp
L power:GND #PWR010
U 1 1 5F8FD4B8
P 5850 2450
F 0 "#PWR010" H 5850 2200 50  0001 C CNN
F 1 "GND" H 5855 2277 50  0000 C CNN
F 2 "" H 5850 2450 50  0001 C CNN
F 3 "" H 5850 2450 50  0001 C CNN
	1    5850 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 2300 5850 2300
$Comp
L power:GND #PWR09
U 1 1 5F8FEC52
P 5150 2450
F 0 "#PWR09" H 5150 2200 50  0001 C CNN
F 1 "GND" H 5155 2277 50  0000 C CNN
F 2 "" H 5150 2450 50  0001 C CNN
F 3 "" H 5150 2450 50  0001 C CNN
	1    5150 2450
	1    0    0    -1  
$EndComp
Text GLabel 4850 2100 0    50   Input ~ 0
ENCODER_A
Text GLabel 4850 2300 0    50   Input ~ 0
ENCODER_B
Wire Wire Line
	5200 2200 5150 2200
Wire Wire Line
	5150 2200 5150 2450
Text GLabel 2750 5000 2    50   Input ~ 0
ENCODER_B
Text GLabel 2750 4900 2    50   Input ~ 0
ENCODER_A
Text GLabel 2750 4800 2    50   Input ~ 0
ENCODER_SW
Wire Wire Line
	2750 5000 2550 5000
Wire Wire Line
	2750 4900 2550 4900
Wire Wire Line
	2750 4800 2550 4800
$Comp
L MicrocontrollersProject:LED_Strip_1m U3
U 1 1 5F918332
P 9400 4600
F 0 "U3" H 9379 5015 50  0000 C CNN
F 1 "LED_Strip_1m" H 9500 4900 50  0000 C CNN
F 2 "" H 9400 4600 50  0001 C CNN
F 3 "" H 9400 4600 50  0001 C CNN
F 4 "Adafruit: 2239" H 9400 4600 50  0001 C CNN "Vendor"
	1    9400 4600
	1    0    0    -1  
$EndComp
NoConn ~ 8650 4450
NoConn ~ 8650 4550
NoConn ~ 8650 4650
NoConn ~ 8650 4750
Wire Wire Line
	8650 4750 9100 4750
Wire Wire Line
	9100 4650 8650 4650
Wire Wire Line
	9100 4550 8650 4550
Wire Wire Line
	9100 4450 8650 4450
Wire Wire Line
	4850 2100 5200 2100
Wire Wire Line
	5200 2300 4850 2300
Wire Wire Line
	5850 2450 5850 2300
Text Notes 5450 5500 2    50   ~ 0
Color Sensor Spectrometer
NoConn ~ 4750 5150
NoConn ~ 4750 5050
Wire Wire Line
	4050 4800 4050 4750
Wire Wire Line
	4750 4750 4050 4750
Wire Wire Line
	4750 4950 4700 4950
Wire Wire Line
	4750 4850 4700 4850
Wire Wire Line
	4400 4650 4750 4650
Wire Wire Line
	4400 4550 4400 4650
$Comp
L power:+5V #PWR07
U 1 1 5F8DAC33
P 4400 4550
F 0 "#PWR07" H 4400 4400 50  0001 C CNN
F 1 "+5V" H 4415 4723 50  0000 C CNN
F 2 "" H 4400 4550 50  0001 C CNN
F 3 "" H 4400 4550 50  0001 C CNN
	1    4400 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5F8DA64B
P 4050 4800
F 0 "#PWR06" H 4050 4550 50  0001 C CNN
F 1 "GND" H 4055 4627 50  0000 C CNN
F 2 "" H 4050 4800 50  0001 C CNN
F 3 "" H 4050 4800 50  0001 C CNN
	1    4050 4800
	1    0    0    -1  
$EndComp
Text GLabel 4700 4850 0    50   Input ~ 0
I2C_SCL
Text GLabel 4700 4950 0    50   Input ~ 0
I2C_SDA
$Comp
L MicrocontrollersProject:Adafruit_AS7341 U1
U 1 1 5F8D7A4F
P 5100 4900
F 0 "U1" H 5428 4946 50  0000 L CNN
F 1 "Adafruit_AS7341" H 5428 4855 50  0000 L CNN
F 2 "MicrocontrollersProject:Adafruit_AS7341_PinSocket" H 5300 4900 50  0001 C CNN
F 3 "" H 5300 4900 50  0001 C CNN
F 4 "Adafruit: 4698, DK: 1528-4698-ND" H 5100 4900 50  0001 C CNN "Vendor"
	1    5100 4900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR012
U 1 1 5F8E3CD8
P 6750 4450
F 0 "#PWR012" H 6750 4300 50  0001 C CNN
F 1 "+5V" H 6765 4623 50  0000 C CNN
F 2 "" H 6750 4450 50  0001 C CNN
F 3 "" H 6750 4450 50  0001 C CNN
	1    6750 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C2
U 1 1 5F9281CE
P 3100 2100
F 0 "C2" H 3215 2146 50  0000 L CNN
F 1 "100 uf" H 3150 2000 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 3100 2100 50  0001 C CNN
F 3 "~" H 3100 2100 50  0001 C CNN
F 4 "DK: 493-10478-1-ND" H 3100 2100 50  0001 C CNN "Vendor"
	1    3100 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5F927167
P 2650 2100
F 0 "C1" H 2750 2150 50  0000 L CNN
F 1 "0.1 uf" H 2700 2000 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 2688 1950 50  0001 C CNN
F 3 "~" H 2650 2100 50  0001 C CNN
F 4 "DK: BC1084TR-ND" H 2650 2100 50  0001 C CNN "Vendor"
	1    2650 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C3
U 1 1 5F934A0A
P 7050 4600
F 0 "C3" H 7200 4650 50  0000 L CNN
F 1 "1000 uf" H 7150 4500 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 7050 4600 50  0001 C CNN
F 3 "~" H 7050 4600 50  0001 C CNN
F 4 "DK: 1189-4233-1-ND" H 7050 4600 50  0001 C CNN "Vendor"
	1    7050 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5F9356A9
P 7550 4600
F 0 "C4" H 7665 4646 50  0000 L CNN
F 1 "0.1 uf" H 7600 4500 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 7588 4450 50  0001 C CNN
F 3 "~" H 7550 4600 50  0001 C CNN
F 4 "DK: BC1084TR-ND" H 7550 4600 50  0001 C CNN "Vendor"
	1    7550 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 1950 2150 2000
Wire Wire Line
	2150 2000 2000 2000
Wire Wire Line
	2150 1950 2300 1950
Connection ~ 2300 1950
Wire Wire Line
	2000 2200 2150 2200
Wire Wire Line
	2150 2200 2150 2250
Wire Wire Line
	2150 2250 2300 2250
Connection ~ 2300 2250
Connection ~ 2650 1950
Wire Wire Line
	2650 1950 2300 1950
Connection ~ 2650 2250
Wire Wire Line
	2650 2250 2300 2250
Wire Wire Line
	2650 1950 3100 1950
Wire Wire Line
	2650 2250 3100 2250
Connection ~ 7550 4450
Wire Wire Line
	7550 4450 8300 4450
Connection ~ 7550 4750
Wire Wire Line
	7550 4750 8300 4750
Text Notes 1500 2400 0    50   ~ 0
5V DC 2A
Wire Wire Line
	6750 4450 7050 4450
Wire Wire Line
	6500 4750 7050 4750
Connection ~ 7050 4450
Wire Wire Line
	7050 4450 7550 4450
Connection ~ 7050 4750
Wire Wire Line
	7050 4750 7550 4750
$EndSCHEMATC