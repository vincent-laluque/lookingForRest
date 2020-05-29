If (Form event code:C388=On Clicked:K2:4)
	
	ds:C1482.stopRequestLog()
	SET TIMER:C645(0)
	
	OBJECT SET VISIBLE:C603(*;"OBJ_ASYNCHRO";False:C215)
	
	thermoASynchro:=0
	
	OBJECT SET ENABLED:C1123(*;"OBJ_BUT_CAPTURE";True:C214)
	OBJECT SET ENABLED:C1123(*;"OBJ_BUT_STOP";False:C215)
	OBJECT SET ENABLED:C1123(*;"OBJ_BUT_CLEAR";True:C214)
	
	
	
	C_LONGINT:C283($value)
	$value:=OB Get:C1224(Form:C1466;"clientLogRecording";Is longint:K8:6)
	
	If ($value=0)
		SET DATABASE PARAMETER:C642(Client log recording:K37:44;0)
	End if 
	
End if 
