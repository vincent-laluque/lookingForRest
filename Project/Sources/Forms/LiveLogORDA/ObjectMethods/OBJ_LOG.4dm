Case of 
		
		
	: (Form event code:C388=On Clicked:K2:4)
		
		C_COLLECTION:C1488($coORDARequestsSelected)
		$coORDARequestsSelected:=Form:C1466.selectedElements
		
		If ($coORDARequestsSelected.length>0)
			
			C_LONGINT:C283($mouseX;$mouseY;$mouseButton)
			GET MOUSE:C468($mouseX;$mouseY;$mouseButton)
			If ($mouseButton=2)
				
				C_LONGINT:C283($item)
				$item:=Pop up menu:C542("Copy;Copy url only")
				
				Case of 
						
					: ($item=1)
						
						C_TEXT:C284($truc)
						$truc:=JSON Stringify:C1217($coORDARequestsSelected[0];*)
						SET TEXT TO PASTEBOARD:C523($truc)
						
						
					: ($item=2)
						
						C_TEXT:C284($truc)
						$truc:=JSON Stringify:C1217($coORDARequestsSelected[0].url;*)
						SET TEXT TO PASTEBOARD:C523($truc)
						
						
				End case 
				
				
			End if 
			
		End if 
		
		
		
	: (Form event code:C388=On Mouse Enter:K2:33)
		SET DATABASE PARAMETER:C642(Tips delay:K37:80;15)
		SET DATABASE PARAMETER:C642(Tips duration:K37:81;300)
		
	: (Form event code:C388=On Mouse Move:K2:35)
		
		C_LONGINT:C283($mouseX;$mouseY;$mouseZ)
		C_LONGINT:C283($col;$row)
		
		  //#1 : trouver quelle ligne est survolée
		GET MOUSE:C468($mouseX;$mouseY;$mouseZ)
		LISTBOX GET CELL POSITION:C971(*;"OBJ_LOG";$mouseX;$mouseY;$col;$row)
		
		C_TEXT:C284($truc)
		$truc:=""
		
		If ($col=1)
			  //#2 : définir l'infobulle à afficher
			If ($row#0)
				
				If ($row<=coORDARequest.length)
					$truc:=JSON Stringify:C1217(coORDARequest[($row-1)];*)
					$truc:=Substring:C12($truc;1;1024)+Char:C90(Carriage return:K15:38)+" ..."
					OBJECT SET HELP TIP:C1181(*;"OBJ_LOG";$truc)
				Else 
					OBJECT SET HELP TIP:C1181(*;"OBJ_LOG";$truc)
				End if 
				
			Else 
				OBJECT SET HELP TIP:C1181(*;"OBJ_LOG";$truc)
			End if 
			
		Else 
			OBJECT SET HELP TIP:C1181(*;"OBJ_LOG";$truc)
		End if 
		
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		SET DATABASE PARAMETER:C642(Tips delay:K37:80;45)  //Retour délai normal
		SET DATABASE PARAMETER:C642(Tips duration:K37:81;720)
		
		
		
		
End case 

