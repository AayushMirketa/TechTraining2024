/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-09-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger PersondetailTrigger on Persondetail__c (before update, after delete) {

    PersondetailTriggerHandler.PersondetailTriggerHandler(trigger.operationType, trigger.newMap, trigger.oldMap);



}