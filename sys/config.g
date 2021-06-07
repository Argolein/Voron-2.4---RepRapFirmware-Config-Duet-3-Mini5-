; General preferences
G90                                         ; Send absolute coordinates...
M83                                         ; ...but relative extruder moves

; Network
M550 P"Walross"                        	; Set machine name
M552 S1                                     	; Enable network
;*** Access point is configured manually via M587
M586 P0 S1                                  ; Enable HTTP
M586 P1 S0                                  ; Disable FTP
M586 P2 S0                                  ; Disable Telnet
M575 P1 S1 B57600							; Panel Due

; Printer geometry
M669 K1                	                    ; Select CoreXY mode
M208 X0:290 Y0:290 Z-0.3:260              ; Axis Limits
M564 H0							            ; allow unhomed movement

;------- drives from top---------------------------------------------------
;  B -------+------ A   
;   | P.02 | P.03 |
;   -------+-------  Z-Drives
;   | P0.1 | P0.4 |
;   -------+-------
;        Front

; Drive Mappings
M569 P0.0 S1 V0                             ; Drive 0: E Axis
M569 P0.1 S1 V0                             ; Drive 1: Z-LeftFront Axis
M569 P0.2 S0 V0                             ; Drive 2: Z-LeftRear Axis
M569 P0.3 S1 V0                             ; Drive 3: Z-RightRear Axis
M569 P0.4 S0 V0                             ; Drive 4: Z-RightFront Axis
M569 P0.5 S1 V0                             ; Drive 5: Expansion: B motor (X-axis)
M569 P0.6 S0 V0                             ; Drive 6: Expansion: A motor (Y-axis)


; Motor remapping for dual Z and axis Limits
M584 X5 Y6 Z1:2:3:4 E0                              ; Motor mapping
M671 X-60:-60:360:360 Y-10:370:370:-10 S20	        ; Z leadscrews positions Left Front - Let Rear - Right Rear - Right Front

; Microstepping and Speed
M350 X32 Y32 E16 Z16 I1                     ; Configure microstepping with interpolation   
M92 X160.00 Y160.00 Z400.00 E400.00         ; Set steps per mm	1.8 motors							

; Speeds, Acceleration and Jerk
M566 X300.00 Y300.00 Z25.00 E600.00 P1          ; Set maximum instantaneous speed changes (mm/min)
M203 X12000.00 Y12000.00 Z900.00 E1200.00       ; Set maximum speeds (mm/min)
M201 X2000.00 Y2000.00 Z1000.00 E5000.00        ; Set accelerations (mm/s^2)

; Motor currents
M906 X1200.00 Y1200.00 Z1200.00 E700.00 I60        ; Set motor currents (mA) and motor idle factor in percent 
M84 S600                                            ; Set idle timeout

; Endstops for each Axis
M574 X2 S1 P"io1.in" 					 	; Set X endstop controlled by switch
M574 Y2 S1 P"io2.in"                      	; Set Y endstop controlled by switch
;M574 Z1 S2                                  ; Set endstops controlled by probe OLD VINDA
M574 Z1 S1 P"io6.in"						; Z endstop switch

; Stallgaurd Sensitivy (maybe use to pause print after crash)
M915 X S2 F0 H200 R0		                ; Set X axis Sensitivity  1.8 motors
M915 Y S2 F0 H200 R0		                ; Set y axis Sensitivity  1.8 motors

; Input Shaper and Accelerometer
;M955 P0 C"io4.out+io4.in"
M593 F46.75 S0.2
;M593 F19 P4 S0.3 ; experimental 

; Z-Probe Super PINDA
M558 P5 C"io3.in" I1 H2.5 F250 T12000 A500 S0.003  	; VINDA  C"^io3.in" for PINDA... Vinda C"io3.in" ??

; Mesh Grid 
M557 X5:280 Y30:250 P5                         ; 

; Z Probe Offset (Probe behind Afterburner)
G31 P1000 X0 Y25 Z1.367

; Heatbed Heaters and Thermistor Bed 
M308 S0 P"temp0" Y"thermistor" T100000 B4725 C7.060000e-8       ; Heatbed Thermistor
M950 H0 C"out0" T0 Q10					                        ; Creates Bed Heater (SSR)
M307 H0 B0 R0.821 C62.7 D6.19 S1.00								; PID since 3.2
M140 H0										                    ; Bed uses Heater 0
M143 H0 S116                                                    ; Set temperature limit for heater 0 to 115C Bed


; HotEnd Heaters and Thermistor HotEnd      
M308 S1 P"temp1" Y"thermistor" T100000 B3950 C0     	; define E0 temperature sensor 
M950 H1 C"out1" T1 Q100					                            ; Create HotEnd Heater
M307 H1 B0 R2.310 C158.7:115.4 D5.24 S1.00 V24.5					; PID
M143 H1 S295                                                    	; Set temperature limit for heater 1 to 285C HotEnd
M302 S185 R185														; min extrusion (cold extrusion) temp


; Fans Hotend + Part
M950 F3 C"out5" Q100				; Creates HOTEND Fan
M106 P3 T65 S240 H1                 ; HOTEND Fan Settings
M950 F0 C"out6" Q100				; Creates PARTS COOLING FAN
M106 P0 H-1                         ; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned off PARTS COOLING FAN

; Fans Electronic compartment & Exhaust
M950 F1 C"out3" Q100				    ; Creates Case Fan 1
M106 P1 T40 S150 H0                 ; Case Fan 1 Settings (Turns on at 60Â°C tool temp) at low speed
M950 F2 C"out4" Q100				    ; Creates Case Fan 2
M106 P2 T40 S150 H0                  ; Case Fan 2 Settings (Turns on at 60Â°C tool temp) at low speed
M950 F5 C"out2" Q100				    ; Creates Case Fan 2
M106 P5 T95 S50 H0                  ; Exhaust fan

; Filament Runout sensor
M950 J4 C"io5.in"               ; Input 4 filament sensor
M581 P4 T2 S1 R1                ; Filament Sensor P4 triggers  inactive-to-active edge (S1) tigger2.g (T2) only when printing (R1)
;M591 D0 P1 C"io5.in" S1			; Filament Sensor 

; Tools
M563 P0 D0 H1 F0                            ; Define tool 0
G10 P0 X0 Y0 Z0                             ; Set tool 0 axis offsets
G10 P0 R0 S0                                ; Set initial tool 0 active and standby temperatures to 0C










