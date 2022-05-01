if !exists(global.railtemp)
	global railtemp = sensors.analog[3].lastReading
else 
	set global.railtemp = sensors.analog[3].lastReading

