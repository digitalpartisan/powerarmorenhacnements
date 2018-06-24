Scriptname PAE:PlayerAliasRepair extends Quest

Chronicle:Engine Property PAE_Engine Auto Const Mandatory
ReferenceAlias Property PlayerAlias Auto Const Mandatory

Event OnInit()
	if (PAE_Engine.IsRunning() && !PlayerAlias.GetReference())
		PlayerAlias.ForceRefTo(Game.GetPlayer())
		PAE_Engine.gameLoaded()
	endif
	
	Stop()
EndEvent

