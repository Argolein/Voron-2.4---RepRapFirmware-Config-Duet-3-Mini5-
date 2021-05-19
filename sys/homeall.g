; homeall.g
; called to home all axes



M913 X70 Y70 Z100                   ; set X Y Z motors to 70% of their normal current

G91                                 ; relative positioning
G1 Z8 F800 H2                       ; lift Z relative to current position

; Homing Moves
G1 H1 X310 F2000                    ; move quickly to X axis endstops and stop there (first pass)
G1 H1 Y310 F2000                    ; move quickly to Y axis endstops and stop there (first pass)
G1 Y288 F2000

G90                                 ; back to absolute mode

;Homing Z
M913 Z60							; Z Motor current 70%
G1 X198 Y287 F3600 ;position of Z swtich
G1 H1 Z-200 F360 ; move Z down until the switch triggers

; Z Offset
G92 Z0.670							; Z position of switch / offset. Lower numbers = higher Z | Higher numbers = lower Z

; Parking Position
G1 X10 Y10 Z20 F6000	            ; put head over the centre of the bed
M913 X100 Y100 Z100                 ; set X Y Z motors to 100% of their normal current









