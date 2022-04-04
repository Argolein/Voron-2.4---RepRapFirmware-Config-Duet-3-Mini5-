;trigger2.g filament sensor

if sensors.gpIn[4].value == 0
		M226     ; calls pause.g


; Untested idea:
;if sensors.gpIn[4].value == 0
;	var triggerheight = move.extruders[0].position + 100 - move.axes[2].machinePosition
;	set var.triggerheight = move.extruders[0].position + 100 - move.axes[2].machinePosition
;	while move.extruders[0].position < var.triggerheight 
;		if sensors.gpIn[4].value == 1
;			break
;	if sensors.gpIn[4].value == 0
;		M226     ; calls pause.g
    




