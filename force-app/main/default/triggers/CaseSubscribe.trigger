/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-13-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger CaseSubscribe on New_Case_Entry__e (after insert) {

    CaseEntry.NewCaseEntry(trigger.operationType, trigger.new);
}