; Frame Heat Expansion Compensation
;if state.status == "processing"
;	M98 P"/macros/RailTempCompensation/railCompensation.g" 		; Script to compensation for heat expanson of the aluminium frame


; Case Fans MCU TEMP
if boards[0].mcuTemp.current > 60
    if boards[0].mcuTemp.current >= 65
        M106 P1 T40 S250 L250 X250 H0                 ; Case Fan 1 Settings 
    else
        M106 P1 T40 S200 L200 X200 H0                 ; Case Fan 1 Settings 

if boards[0].mcuTemp.current < 58
    M106 P1 T40 S175 L175 X175 H0