Scriptname PAE:Init extends Quest

InjectTec:Injector:Bulk Property PAENamingRuleGlobalInjections Auto Const
InjectTec:Injector:Bulk Property PAENamingRuleAutomatronInjections Auto Const
InjectTec:Injector:Bulk Property PAENamingRuleNukaWorldInjections Auto Const
InjectTec:Injector:Bulk Property PAEVendorInjections Auto Const

Event OnQuestInit()
	PAENamingRuleGlobalInjections.inject()
	PAENamingRuleAutomatronInjections.inject()
	PAENamingRuleNukaWorldInjections.inject()
	PAEVendorInjections.inject()
EndEvent
