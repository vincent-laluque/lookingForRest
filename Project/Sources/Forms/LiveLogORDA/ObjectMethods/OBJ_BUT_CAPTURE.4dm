If (Form event code:C388=On Clicked:K2:4)
	
	C_LONGINT:C283($value)
	$value:=Get database parameter:C643(Client log recording:K37:44)
	
	OB SET:C1220(Form:C1466;"clientLogRecording";$value)
	
	If ($value=0)
		SET DATABASE PARAMETER:C642(Client log recording:K37:44;1)
	End if 
	
	ds:C1482.startRequestLog(100)
	SET TIMER:C645(60)
	
	OBJECT SET VISIBLE:C603(*;"OBJ_ASYNCHRO";True:C214)
	
	thermoASynchro:=1
	
	OBJECT SET ENABLED:C1123(*;"OBJ_BUT_CAPTURE";False:C215)
	OBJECT SET ENABLED:C1123(*;"OBJ_BUT_STOP";True:C214)
	OBJECT SET ENABLED:C1123(*;"OBJ_BUT_CLEAR";False:C215)
	
End if 
