if !exists(global.railtempDifference)
	global railtempDifference = abs(global.railtemp - sensors.analog[3].lastReading)				; Difference should be negative values
else 
	set global.railtempDifference = abs(global.railtemp - sensors.analog[3].lastReading)



if !exists(global.railtempExpansionFactor)
	global railtempExpansionFactor = 0.009				; Microns per rising °C temp ; 0.0300	; ASA / PC 105°C bed
	;global railtempExpansionFactor = 0.002				; Microns per rising °C temp ; 0.0300		; PLA / PETG (chamber open)


else 
	set global.railtempExpansionFactor = 0.009		; Microns per rising °C temp				; ASA / PC 105°C bed
	;set global.railtempExpansionFactor = 0.002		; Microns per rising °C temp					; PLA / PETG (chamber open)

if global.railtempDifference >= 0.4
	if !exists(global.zCompensation)
		global zCompensation = -(global.railtempDifference * global.railtempExpansionFactor)
	else 
		set global.zCompensation = -(global.railtempDifference * global.railtempExpansionFactor)
	M290 R0 S{global.zCompensation}  ; babystepping
else
    M290 R0 S0