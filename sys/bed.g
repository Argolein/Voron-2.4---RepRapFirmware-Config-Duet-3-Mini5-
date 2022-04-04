; bed.g
; called to perform automatic bed compensation via G32

M574 Z1 S1 P"io6.in"						; Z endstop switch
M558 H10 F250:100 T6000 A20 S0.003  		; Klicky Probe settings


M561 ; clear any bed transform

if move.axes[0].homed = false		; home when not homed
	G28 ; home

M913 X100 Y100 Z40                   ; Lower Z Current

; Load Klicky
M98 P"/macros/clicky/load.g" ; load Clicky Probe

; bed.g script
while iterations <=1                                       	; Perform 2 passes.
	G30 P0 X0 Y25 Z-99999 F6000 									; probe Z left front
	G30 P1 X0 Y270 Z-99999 F6000      							; probe Z left rear
	G30 P2 X275 Y270 Z-99999 F6000 							    ; probe Z right rear
	G30 P3 X275 Y25 Z-99999 S4 F6000 								; probe Z right front
	;G1 H2 Z5 F2600 												; raise head 4mm to ensure it is above the Z probe trigger height
	M400 														; finish move, clear buffer
	M558 H1.5 ; reduce probe height to 2mm

M558 H1.5 ; Probe  height to 10mm


while move.calibration.initial.deviation >= 0.005          ; Perform additional leveling if previous deviation was over 0.01mm.
	G30 P0 X0 Y25 Z-99999 F6000 									; probe Z left front
	G30 P1 X0 Y270 Z-99999 F6000      							; probe Z left rear
	G30 P2 X275 Y270 Z-99999 F6000 							    ; probe Z right rear
	G30 P3 X275 Y25 Z-99999 S4 F6000 								; probe Z right front
	;G1 H2 Z5 F2600 												; raise head 4mm to ensure it is above the Z probe trigger height
	M400 														; finish move, clear buffer

echo "Gantry deviation of " ^ move.calibration.initial.deviation ^ "mm obtained."


M913 X100 Y100 Z100                   ; Z current back default

G1 Z8                                                      ; Raise nozzle 8mm to ensure it is above the Z probe trigger height.

; Unload Klicky
M98 P"/macros/clicky/unload.g" ; load Clicky Probe

G28 ; Homing again for accurate Z offset



