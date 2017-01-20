Scriptname PAE:Init extends Quest

InjectTec:Injector:NamingRules Property PAENamingRuleInjection Auto Const
InjectTec:Injector:Bulk Property PAEVendorInjections Auto Const

Message Property PAEInitMessage Auto Const

Event OnQuestInit()
	PAENamingRuleInjection.inject()
	PAEVendorInjections.inject()
	Utility.Wait(3) ; so we don't miss the message in the UI
	PAEInitMessage.Show()
EndEvent
