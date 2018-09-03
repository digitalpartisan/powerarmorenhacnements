Scriptname PAE:CorePackageBehaviors extends Chronicle:Package:CustomBehavior

Group LegacySettings
	InjectTec:Injector:Bulk Property PAEVendorInjections Auto Const Mandatory
	PAE:Init Property PAEInitQuest Auto Const Mandatory
EndGroup

Bool Function installBehavior()
	if (PAEInitQuest.IsRunning() || PAEInitQuest.IsStarting())
		PAEInitQuest.Stop() ; this record is legacy and needs to go away
		PAEVendorInjections.revert() ; older vendor injections are invalid now and need reverted in order to reapply them with newer, better vendor contents
	endif
	
	return true
EndFunction
