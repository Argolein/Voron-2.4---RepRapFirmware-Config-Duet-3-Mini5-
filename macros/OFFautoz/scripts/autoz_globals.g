
; ---------- ---------- DO NOT EDIT THIS FILE ---------- ----------


; ---------- Data ----------


if !exists(global.autoz)
 global autoz = 0

if !exists(global.autoz_avg0)
 global autoz_avg0 = 0

if !exists(global.autoz_temp0)
 global autoz_temp0 = 10
 
if !exists(global.autoz_temp1)
 global autoz_temp1 = 15
 
if !exists(global.autoz_temp2)
 global autoz_temp2 = 10

if !exists(global.clickystatus)
 global clickystatus = "none"

; ---------- ---------- DRIVE ---------- ----------

if !exists(global.restorezidle)
 global restorezidle = move.idle.factor

if !exists(global.restorezcurrent)
 global restorezcurrent = move.axes[2].current

if !exists(global.restorezspeed)
 global restorezspeed = move.axes[2].speed

if !exists(global.restorezaccel)
 global restorezaccel = move.axes[2].acceleration

if !exists(global.restorezjerk)
 global restorezjerk = move.axes[2].jerk


; ---------- Machine limmits ----------


if !exists(global.centerx)
 global centerx = move.axes[0].max / 2

if !exists(global.centery)
 global centery = move.axes[1].max / 2


; ---------- ---------- Verbose outputs ---------- ----------

; output current values
echo "global.clickystatus defined. Value : " , global.clickystatus
echo "global.clickyoffset defined. Value : " , global.clickyoffset
echo "global.autoz defined. Value : " , global.autoz
