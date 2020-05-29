If (Form event code:C388=On Clicked:K2:4)
	
	
	C_TEXT:C284($toClip)
	$toClip:=""
	
	If (CoORDARequest.length>0)
		
		C_OBJECT:C1216($Line)
		For each ($Line;CoORDARequest)
			$toClip:=$toClip+$Line.url+Char:C90(Carriage return:K15:38)
		End for each 
		
		SET TEXT TO PASTEBOARD:C523($toClip)
		
	End if 
	
End if 
