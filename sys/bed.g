; bed.g
; called to perform automatic bed compensation via G32

M558 H10 ; VINDA  height to 10mm

M561 ; clear any bed transform
G28 ; home

while iterations <=1                                       	; Perform 2 passes.
	G30 P0 X0 Y25 Z-99999 F6000 									; probe Z left front
	G30 P1 X0 Y260 Z-99999 F6000      							; probe Z left rear
	G30 P2 X282 Y260 Z-99999 F6000 							    ; probe Z right rear
	G30 P3 X282 Y25 Z-99999 S4 F6000 								; probe Z right front
	G1 H2 Z8 F2600 												; raise head 4mm to ensure it is above the Z probe trigger height
	M400 														; finish move, clear buffer
	M558 H2.5  													; VINDA  height to 2.5mm after first run

while move.calibration.initial.deviation >= 0.003          ; Perform additional leveling if previous deviation was over 0.01mm.
	G30 P0 X0 Y25 Z-99999 F6000 									; probe Z left front
	G30 P1 X0 Y260 Z-99999 F6000      							; probe Z left rear
	G30 P2 X282 Y260 Z-99999 F6000 							    ; probe Z right rear
	G30 P3 X282 Y25 Z-99999 S4 F6000 								; probe Z right front
	G1 H2 Z8 F2600 												; raise head 4mm to ensure it is above the Z probe trigger height
	M400 														; finish move, clear buffer

echo "Gantry deviation of " ^ move.calibration.initial.deviation ^ "mm obtained."
G1 Z8                                                      ; Raise nozzle 8mm to ensure it is above the Z probe trigger height.

G28 ; Homing again for accurate Z offset


