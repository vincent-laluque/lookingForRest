//%attributes = {"shared":true}
  // 6.39


C_TEXT:C284($1)

C_TEXT:C284($opCode)
If (Count parameters:C259=0)
	LOGsView ("JUMP")
Else 
	$opCode:=$1
End if 


Case of 
		
		  // ----------------------------------------------------------------------------------------------------------------------
	: ($opCode="JUMP")
		  // ----------------------------------------------------------------------------------------------------------------------
		
		LOGsView ("LISTE")
		
		
		  // ----------------------------------------------------------------------------------------------------------------------
	: ($opCode="LISTE")
		  // ----------------------------------------------------------------------------------------------------------------------
		
		C_LONGINT:C283($pId)
		$pId:=New process:C317("LOGsView";128*1024;"Requests Log ("+Current system user:C484+")";"VOIR LISTE")
		
		
		  // ----------------------------------------------------------------------------------------------------------------------
	: ($opCode="VOIR LISTE")
		  // ----------------------------------------------------------------------------------------------------------------------
		
		
		C_COLLECTION:C1488(CoORDARequest)
		CoORDARequest:=New collection:C1472()
		
		C_LONGINT:C283(thermoASynchro)
		
		C_LONGINT:C283($SHOTsWindowId)
		$SHOTsWindowId:=000WindowCentered (920;620;Plain window:K34:13;"Stats items";"000CloseWithNoCodeInside")  // 6.00
		SET WINDOW TITLE:C213("Requests: "+String:C10(CoORDARequest.count()))
		
		DIALOG:C40("LiveLogORDA")
		CLOSE WINDOW:C154
		
		
		
		
		
End case 
