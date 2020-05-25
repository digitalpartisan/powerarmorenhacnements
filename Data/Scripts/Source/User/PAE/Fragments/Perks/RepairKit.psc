;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname PAE:Fragments:Perks:RepairKit Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
PAE:RepairKit kitRef = akTargetRef as PAE:RepairKit
kitRef && kitRef.unpack()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
