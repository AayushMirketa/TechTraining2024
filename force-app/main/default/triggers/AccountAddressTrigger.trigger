/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-10-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger AccountAddressTrigger on Account (after insert, after update, after delete) {
    AccountTriggerHandler.AccountTriggerHandler(trigger.operationType, trigger.new, trigger.old, trigger.oldMap);

}