; *** CNC Kitchen Auto Flow Pattern Generator 0.93
; *** 02/04/26 Stefan Hermann

;####### Settings
; Voron
; bedWidth = 290
; bedLength = 283
; bedMargin = 10
; filamentDiameter = 1.75
; movementSpeed = 300
; stabilizationTime = 10
; bedTemp = 60
; primeLength = 25
; primeAmount = 20
; primeSpeed = 5
; retractionDistance = 4
; retractionSpeed = 60
; blobHeight = 18
; extrusionAmount = 300
; xSpacing = 85
; ySpacing = 45
; startFlow = 20
; flowOffset = 2
; flowSteps = 6
; startTemp = 250
; tempOffset = -20
; tempSteps = 1
; direction = 1

M104 S240 ; Set Nozzle Temperature
M140 S62 ; Set Bed Temperature
G0 Z10 ; Lift nozzle
G21; unit in mm
G92 E0; reset extruder
M83; set extruder to relative mode
M190 S60 ; Set Bed Temperature & Wait
M106 S0 ; Set Fan Speed

;####### 250C
G4 S0 ; Dwell
M109 R240

;####### 20mm3/s
M117 240∞C // 20mm3/s
G0 X10 Y10 Z23.5 F18000
G4 S10; Stabalize
G0 Z0.3 ; Drop down
G1 X35 E20 F300 ;Prime
G1 E-4 F3600; Retract
G0 X50 F18000 ; Wipe
G0 Z0.5 ; Lift
G1 E4 F3600 ; De-Retract
G1 Z18.5 E300 F29.93 ; Extrude
G1 E-4 F3600 ; Retract
G0 Z23.5; Lift
G0 X10 Y10 F18000
G92 E0 ; Reset Extruder

;####### 22mm3/s
M117 240∞C // 22mm3/s
G0 X10 Y55 Z23.5 F18000
G4 S10; Stabalize
G0 Z0.3 ; Drop down
G1 X35 E20 F300 ;Prime
G1 E-4 F3600; Retract
G0 X50 F18000 ; Wipe
G0 Z0.5 ; Lift
G1 E4 F3600 ; De-Retract
G1 Z18.5 E300 F32.93 ; Extrude
G1 E-4 F3600 ; Retract
G0 Z23.5; Lift
G0 X10 Y55 F18000
G92 E0 ; Reset Extruder

;####### 24mm3/s
M117 240∞C // 24mm3/s
G0 X10 Y100 Z23.5 F18000
G4 S10; Stabalize
G0 Z0.3 ; Drop down
G1 X35 E20 F300 ;Prime
G1 E-4 F3600; Retract
G0 X50 F18000 ; Wipe
G0 Z0.5 ; Lift
G1 E4 F3600 ; De-Retract
G1 Z18.5 E300 F35.92 ; Extrude
G1 E-4 F3600 ; Retract
G0 Z23.5; Lift
G0 X10 Y100 F18000
G92 E0 ; Reset Extruder

;####### 26mm3/s
M117 240∞C // 26mm3/s
G0 X10 Y145 Z23.5 F18000
G4 S10; Stabalize
G0 Z0.3 ; Drop down
G1 X35 E20 F300 ;Prime
G1 E-4 F3600; Retract
G0 X50 F18000 ; Wipe
G0 Z0.5 ; Lift
G1 E4 F3600 ; De-Retract
G1 Z18.5 E300 F38.91 ; Extrude
G1 E-4 F3600 ; Retract
G0 Z23.5; Lift
G0 X10 Y145 F18000
G92 E0 ; Reset Extruder

;####### 28mm3/s
M117 240∞C // 28mm3/s
G0 X10 Y190 Z23.5 F18000
G4 S10; Stabalize
G0 Z0.3 ; Drop down
G1 X35 E20 F300 ;Prime
G1 E-4 F3600; Retract
G0 X50 F18000 ; Wipe
G0 Z0.5 ; Lift
G1 E4 F3600 ; De-Retract
G1 Z18.5 E300 F41.91 ; Extrude
G1 E-4 F3600 ; Retract
G0 Z23.5; Lift
G0 X10 Y190 F18000
G92 E0 ; Reset Extruder

;####### 250C
G4 S0 ; Dwell
M109 R240

;####### 30mm3/s
M117 240∞C // 30mm3/s
G0 X135 Y10 Z23.5 F18000
G4 S10; Stabalize
G0 Z0.3 ; Drop down
G1 X160 E20 F300 ;Prime
G1 E-4 F3600; Retract
G0 X175 F18000 ; Wipe
G0 Z0.5 ; Lift
G1 E4 F3600 ; De-Retract
G1 Z18.5 E300 F44.9 ; Extrude
G1 E-4 F3600 ; Retract
G0 Z23.5; Lift
G0 X135 Y10 F18000
G92 E0 ; Reset Extruder

;####### End G-Code
G0 X280 Y273 ; Move to Corner
M104 S0 T0 ; Turn Off Hotend
M140 S0 ; Turn Off Bed
