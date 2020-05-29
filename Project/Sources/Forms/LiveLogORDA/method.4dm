Case of 
		
		
	: (Form event code:C388=On Load:K2:1)
		
		C_POINTER:C301($p)
		
		C_TEXT:C284($nomHeader)
		$nomHeader:="OBJ_Header_seqNum"
		$p:=Get pointer:C304("Header_seqNum")
		LISTBOX INSERT COLUMN FORMULA:C970(*;"OBJ_LOG";1;"Col_seqNum";"This.sequenceNumber";Is real:K8:4;$nomHeader;$p->)
		
		OBJECT SET HORIZONTAL ALIGNMENT:C706(*;"Col_seqNum";Align center:K42:3)
		
		LISTBOX SET COLUMN WIDTH:C833(*;$nomHeader;80)
		
		OBJECT SET TITLE:C194(*;$nomHeader;"seq. num.")
		OBJECT SET HORIZONTAL ALIGNMENT:C706(*;$nomHeader;Align center:K42:3)
		OBJECT SET VERTICAL ALIGNMENT:C1187(*;$nomHeader;Align center:K42:3)
		OBJECT SET FONT:C164(*;$nomHeader;"Verdana")
		OBJECT SET FONT STYLE:C166(*;$nomHeader;Bold:K14:2)
		OBJECT SET FONT SIZE:C165(*;$nomHeader;10)
		
		$nomHeader:="OBJ_Header_howLong"
		$p:=Get pointer:C304("Header_howLong")
		LISTBOX INSERT COLUMN FORMULA:C970(*;"OBJ_LOG";2;"Col_howLong";"This.duration";Is real:K8:4;$nomHeader;$p->)
		
		OBJECT SET HORIZONTAL ALIGNMENT:C706(*;"Col_howLong";Align center:K42:3)
		
		LISTBOX SET COLUMN WIDTH:C833(*;$nomHeader;60)
		
		OBJECT SET TITLE:C194(*;$nomHeader;"duration")
		OBJECT SET HORIZONTAL ALIGNMENT:C706(*;$nomHeader;Align center:K42:3)
		OBJECT SET VERTICAL ALIGNMENT:C1187(*;$nomHeader;Align center:K42:3)
		OBJECT SET FONT:C164(*;$nomHeader;"Verdana")
		OBJECT SET FONT STYLE:C166(*;$nomHeader;Bold:K14:2)
		OBJECT SET FONT SIZE:C165(*;$nomHeader;10)
		
		$nomHeader:="OBJ_Header_status"
		$p:=Get pointer:C304("Header_status")
		LISTBOX INSERT COLUMN FORMULA:C970(*;"OBJ_LOG";3;"Col_status";"This.response.status";Is real:K8:4;$nomHeader;$p->)
		
		OBJECT SET HORIZONTAL ALIGNMENT:C706(*;"Col_status";Align center:K42:3)
		
		LISTBOX SET COLUMN WIDTH:C833(*;$nomHeader;60)
		
		OBJECT SET TITLE:C194(*;$nomHeader;"status")
		OBJECT SET HORIZONTAL ALIGNMENT:C706(*;$nomHeader;Align center:K42:3)
		OBJECT SET VERTICAL ALIGNMENT:C1187(*;$nomHeader;Align center:K42:3)
		OBJECT SET FONT:C164(*;$nomHeader;"Verdana")
		OBJECT SET FONT STYLE:C166(*;$nomHeader;Bold:K14:2)
		OBJECT SET FONT SIZE:C165(*;$nomHeader;10)
		
		$nomHeader:="OBJ_Header_url"
		$p:=Get pointer:C304("Header_url")
		LISTBOX INSERT COLUMN FORMULA:C970(*;"OBJ_LOG";4;"Col_url";"This.url";Is text:K8:3;$nomHeader;$p->)
		
		OBJECT SET TITLE:C194(*;$nomHeader;"url")
		OBJECT SET HORIZONTAL ALIGNMENT:C706(*;$nomHeader;Align left:K42:2)
		OBJECT SET VERTICAL ALIGNMENT:C1187(*;$nomHeader;Align center:K42:3)
		OBJECT SET FONT:C164(*;$nomHeader;"Verdana")
		OBJECT SET FONT STYLE:C166(*;$nomHeader;Bold:K14:2)
		OBJECT SET FONT SIZE:C165(*;$nomHeader;10)
		
		
		  // Rows
		LISTBOX SET ROWS HEIGHT:C835(*;"OBJ_COL";21)
		  // ---
		
		OBJECT SET VISIBLE:C603(*;"OBJ_ASYNCHRO";False:C215)
		OBJECT SET ENABLED:C1123(*;"OBJ_BUT_STOP";False:C215)
		OBJECT SET ENABLED:C1123(*;"OBJ_BUT_CLEAR";False:C215)
		
		
		
	: (Form event code:C388=On Timer:K2:25)
		
		  // Quelle est la ligne de la listbox collection actuellement sélectionnée ?
		C_COLLECTION:C1488($coORDARequestsSelected)
		$coORDARequestsSelected:=Form:C1466.selectedElements
		
		CoORDARequest:=ds:C1482.getRequestLog()
		SET WINDOW TITLE:C213("Requests: "+String:C10(CoORDARequest.count()))
		thermoASynchro:=thermoASynchro+1
		
		If ($coORDARequestsSelected.length>0)
			Form:C1466.selectedElements:=$coORDARequestsSelected
			
			C_OBJECT:C1216($item)
			For each ($item;$coORDARequestsSelected)
				
				C_LONGINT:C283($index)
				$index:=CoORDARequest.indexOf($item)
				If ($index>0)
					$index:=$index+1
					LISTBOX SELECT ROW:C912(*;"OBJ_LOG";$index;lk add to selection:K53:2)
				End if 
			End for each 
			
		End if 
		
		
		
	: (Form event code:C388=On Close Box:K2:21)
		
		  // 6.39b Si on quitte le dialogue alors qu'on est en cours d'enregistrement:
		If (thermoASynchro>0)
			ds:C1482.stopRequestLog()
			C_LONGINT:C283($value)
			$value:=OB Get:C1224(Form:C1466;"clientLogRecording";Is longint:K8:6)
			If ($value=0)
				SET DATABASE PARAMETER:C642(Client log recording:K37:44;0)
			End if 
		End if 
		
		CANCEL:C270
		
		
		
		
		
		
		
		
End case 
