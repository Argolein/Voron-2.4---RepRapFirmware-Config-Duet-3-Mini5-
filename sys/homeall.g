; homeall.g
; called to home all axes



M913 X50 Y50 Z40                   ; set X Y Z reduce currents

G91                                 ; relative positioning
G1 Z8 F800 H2                       ; lift Z relative to current position

; Homing Moves
G1 H1 X310 F2000                    ; move to X axis endstops and stop there (first pass)
G1 H1 Y310 F2000                    ; move to Y axis endstops and stop there (first pass)
G1 Y288 F2000

G90                                 ; back to absolute mode

;Homing Z
M913 Z60							; Z Motor current 60%
G1 Y290								; back off a bit from chain
G1 X196.2							; back off a bit from chain
G1 X196.2 Y299.9 F2000 				;position of Z swtich
G1 H1 Z-260 F360 					; move Z down until the switch triggers


; Z Offset
;G92 Z0.435							; Z position of switch / offset. Lower numbers = higher Z | Higher numbers = lower Z | PEI Side 0.4  NOZZLE  60-85°C bed temp
;G92 Z0.455							; Z position of switch / offset. Lower numbers = higher Z | Higher numbers = lower Z | PEI Side 0.4  NOZZLE  100+°C bed temp
;G92 Z0.380							; Z position of switch / offset. Lower numbers = higher Z | Higher numbers = lower Z | PEI Side 0.25
;G92 Z0.430							; Z position of switch / offset. Lower numbers = higher Z | Higher numbers = lower Z | textured sheet 0.6 nozzle
;G92 Z0.455							; Z position of switch / offset. Lower numbers = higher Z | Higher numbers = lower Z | textured sheet 0.4 nozzle
;G92 Z0.675							; Z position of switch / offset. Lower numbers = higher Z | Higher numbers = lower Z | satin like sheet 0.4 Bondtech NOZZLE  60-85°C bed temp
G92 Z0.560							; Z position of switch / offset. Lower numbers = higher Z | Higher numbers = lower Z | 3DJake Nano Sheet
;G92 Z0.870						; Z position of switch / offset. Lower numbers = higher Z | Higher numbers = lower Z | satin sheet 0.4 Bondtech NOZZLE  100+°C bed temp

;G92 Z0.710							; Z position of switch / offset. Lower numbers = higher Z | Higher numbers = lower Z | satin sheet 0.6 Bondtech NOZZLE 

M913 X100 Y100 Z100                 ; set X Y Z motors to 100% of their normal current

G1 Z5 F3600

; Parking Position
G1 X10 Y10 Z20 F6000	            ; put head over the centre of the bed
M913 X100 Y100 Z100                 ; set X Y Z motors to 100% of their normal current









