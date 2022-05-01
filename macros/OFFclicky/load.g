; Load Klicky
G1 Y280 F3600;
G1 X30 F3600;
G1 X30 Y300 F3600		;Load Klicky				;Wait a second
G1 Y270 F3600;			Get Away from station
G4 S2					;Wait a second
M400

if sensors.probes[0].value[0] = 1000
	M291 T5 R"AutoZ failed!" P"Probe not detected - abort" 
	abort
