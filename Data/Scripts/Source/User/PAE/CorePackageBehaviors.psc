Scriptname PAE:CorePackageBehaviors extends Chronicle:Package:CustomBehavior

Group Injections
	InjectTec:Injector:Bulk Property PAENamingInjectionBaseGame Auto Const Mandatory
	InjectTec:Injector:Bulk Property PAENamingRuleAutomatronInjections Auto Const Mandatory
	InjectTec:Injector:Bulk Property PAEVendorInjections Auto Const Mandatory
	InjectTec:Injector:Bulk Property PAENamingRuleNukaWorldInjections Auto Const Mandatory
EndGroup

Perk[] Property Perks Auto Const Mandatory

Group LegacySettings
	PAE:Init Property PAEInitQuest Auto Const Mandatory
EndGroup

Function handlePerk(Perk pPerk, Bool bAdd = true)
	Actor aPlayer = Game.GetPlayer()

	if (bAdd)
		if (!aPlayer.HasPerk(pPerk))
			aPlayer.AddPerk(pPerk)
		endif
	else
		if (aPlayer.HasPerk(pPerk))
			aPlayer.RemovePerk(pPerk)
		endif
	endif
EndFunction

Function handlePerks(Bool bAdd = true)
	Int iCounter = 0
	while (iCounter < Perks.Length)
		handlePerk(Perks[iCounter], bAdd)
		iCounter += 1
	endWhile
EndFunction

Function handleInjection(InjectTec:Injector:Bulk injectors, Bool bInject = true)
	if (bInject)
		injectors.inject()
	else
		injectors.revert()
	endif
EndFunction

Function handleInjections(Bool bInject = true)
	handleInjection(PAENamingInjectionBaseGame, bInject)
	handleInjection(PAENamingRuleAutomatronInjections, bInject)
	handleInjection(PAEVendorInjections, bInject)
	handleInjection(PAENamingRuleNukaWorldInjections, bInject)
EndFunction

Bool Function installBehavior()
	if (PAEInitQuest.IsRunning() || PAEInitQuest.IsStarting())
		PAEInitQuest.Stop() ; this record is legacy and needs to go away
	endif
	
	handleInjections()
	handlePerks()
	
	return parent.installBehavior()
EndFunction

Bool Function postloadBehavior()
	handleInjections()
	handlePerks()
	
	return parent.postloadBehavior()
EndFunction

Bool Function uninstallBehavior()
	handleInjections(false)
	handlePerks(false)
	
	return parent.uninstallBehavior()
EndFunction
