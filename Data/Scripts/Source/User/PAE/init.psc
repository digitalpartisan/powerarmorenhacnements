Scriptname PAE:Init extends Quest

InjectTec:Injector:Bulk Property PAENamingRuleGlobalInjections Auto Const
InjectTec:Injector:Bulk Property PAENamingRuleAutomatronInjections Auto Const
InjectTec:Injector:Bulk Property PAENamingRuleNukaWorldInjections Auto Const

InjectTec:Injector:Bulk Property PAEVendorInjections Auto Const

Message Property PAEInitMessage Auto Const

Event OnQuestInit()
	PAENamingRuleGlobalInjections.inject()
	PAENamingRuleAutomatronInjections.inject()
	PAENamingRuleNukaWorldInjections.inject()
	PAEVendorInjections.inject()

	Utility.Wait(3) ; so we don't miss the message in the UI
	PAEInitMessage.Show()
EndEvent
