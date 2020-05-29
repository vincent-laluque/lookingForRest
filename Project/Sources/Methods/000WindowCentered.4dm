//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Nom utilisateur (OS) : Vincent Laluque
  // Date et heure : 22/02/07, 09:57:49
  // ----------------------------------------------------
  // Méthode : 000WindowCentered
  // Description
  // Créer une fenêtre centrée en plein écran
  //
  // Paramètres
  // Largeur - Hauteur - Type - Titre - Case de Fermeture
  // ----------------------------------------------------

C_LONGINT:C283($1)  // Largeur
C_LONGINT:C283($2)  // Hauteur

C_LONGINT:C283($3)  // Type
C_TEXT:C284($4)  // Titre
C_TEXT:C284($5)  // Nom de la méthode associée à la case de fermeture


C_LONGINT:C283($0)  // On renvoie l'identifiant de la fenêtre créée

  // Calcul de la position d'affichage de la fenêtre
C_REAL:C285($ve_gauche;$ve_haut;$ve_droite;$ve_bas)

C_LONGINT:C283($vl_hauteurMenu)
$vl_hauteurMenu:=Menu bar height:C440

$ve_gauche:=(Screen width:C187/2)-($1/2)
$ve_droite:=(Screen width:C187/2)+($1/2)

$ve_haut:=((Screen height:C188-$vl_hauteurMenu)/2)-($2/2)
$ve_bas:=((Screen height:C188-$vl_hauteurMenu)/2)+($2/2)

Case of 
		
	: (Count parameters:C259=4)
		$0:=Open window:C153($ve_gauche;$ve_haut;$ve_droite;$ve_bas;$3;$4)
		
	: (Count parameters:C259=5)
		$0:=Open window:C153($ve_gauche;$ve_haut;$ve_droite;$ve_bas;$3;$4;$5)
		
End case 
