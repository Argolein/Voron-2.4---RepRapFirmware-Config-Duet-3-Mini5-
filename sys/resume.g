; resume.g
; called before a print from SD card is resumed
;


if sensors.gpIn[4].value == 0
	M291 P"Please add filament first" R"No Filament!" S2 ; Confirm Message

if sensors.gpIn[4].value == 0
	G1 R1 X0 Y0          ; go back to the last print move
	M83                  ; relative extruder moves


