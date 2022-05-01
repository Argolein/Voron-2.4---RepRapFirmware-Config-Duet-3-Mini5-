;G30 S-1 ; Probe the bed at the current XY position. When the probe is triggered, do not adjust the Z coordinate, just report the machine height at which the probe was triggered.
; sensors.probes[0].lastStopHeight
; sensors.analog[3].lastReading ; last reading of the frame thermistor
; Reading temp and save as variable from 24°C up to 32°C
; Do test after printer bootet and has done bed.g Z leveling
; Set Globals


; Initial base measurement with cold bed
if global.ProbeTempAtCold = 999
	G1 X140 Y150 Z3
	M98 P"/macros/Tests/ThermalExpansionMeasurment/Probing.g" ; Probing with target accuracy
	M400
	set global.ProbeTempAtCold = sensors.probes[0].lastStopHeight
	M291 P"Break1" S0 T1
	M400

; measurement at temp target
if global.ProbeTempAt28 = 999 && sensors.analog[3].lastReading >= 28
	G1 X140 Y150 Z3
	M98 P"/macros/Tests/ThermalExpansionMeasurment/Probing.g" ; Probing with target accuracy
	set global.ProbeTemp28 = sensors.probes[0].lastStopHeight
	M400

	
	
	
	