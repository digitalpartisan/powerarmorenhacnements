Scriptname PAE:RepairKit extends ObjectReference

Group ContentSettings
	MiscObject Property Part Auto Const Mandatory
	MiscObject Property Torso Auto Const Mandatory
EndGroup

String sStatePreactivate = "Preactivate" Const
String sStateActivated = "Activated" Const
String sStatePostactivate = "Postactivate" Const

Function unpack()

EndFunction

Auto State Preactivate
	Function unpack()
		GoToState(sStateActivated)
	EndFunction
EndState

State Activated
	Event OnBeginState(String asOldState)
		PlaceAtMe(Part, 5)
		PlaceAtMe(Torso)
		GoToState(sStatePostactivate)
	EndEvent
EndState

State Postactivate
	Event OnBeginState(String asOldState)
		Disable()
		Delete()
	EndEvent
EndState
