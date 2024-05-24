/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-13-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class CaseEntry {
    public static void NewCaseEntry(system.TriggerOperation sysTrigger, List<New_Case_Entry__e> newTrigger) {
        List<Case> caseList=new List<Case>();
        switch on sysTrigger{
            when AFTER_INSERT{
                for(New_Case_Entry__e event: newTrigger){
                    system.debug(event);


                }
            }
        }

    }
}