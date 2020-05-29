If (Form event code:C388=On Clicked:K2:4)
	
	CoORDARequest:=CoORDARequest.clear()
	SET WINDOW TITLE:C213("Requests: "+String:C10(CoORDARequest.count()))
	
End if 
