/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-12-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger ContactTrigger on Contact (after insert, after delete, after update) {
    ContactTriggerHandler.ContactTriggerCountHandler(trigger.operationType, trigger.new, trigger.old, trigger.oldMap);
}