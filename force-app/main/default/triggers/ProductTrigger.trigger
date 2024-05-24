/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-10-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger ProductTrigger on Product2 (after insert) {
    ProductTriggerHandler.ProductTriggerHandlerUpdate(trigger.operationType, trigger.new);

}