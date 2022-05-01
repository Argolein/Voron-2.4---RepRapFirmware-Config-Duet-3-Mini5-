if !exists(global.ProbeResult1)
	global ProbeResult1 = 99
else
	set global.ProbeResult1 = 99

if !exists(global.ProbeResult2)
	global ProbeResult2 = 999
else
	set global.ProbeResult2 = 999

if !exists(global.ProbeDeviation)
	global ProbeDeviation = 9999
else
	set global.ProbeDeviation = 9999

while global.ProbeDeviation >= 0.003
	G30 S-1		;Probe the bed at the current XY position. When the probe is triggered, do not adjust the Z coordinate, just report the machine height at which the probe was triggered.
	M400		; Clear Buffer
	G1 Z2		; Raise head
	set global.ProbeResult1 = sensors.probes[0].lastStopHeight
	G30 S-1
	M400
	G1 Z2
	set global.ProbeResult2 = sensors.probes[0].lastStopHeight
	; Calculating accuracy
	set global.ProbeDeviation = abs(global.ProbeResult1-global.ProbeResult2)
	echo sensors.probes[0].lastStopHeight
