/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-07-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    // system.debug('trigger.operationType:'+trigger.operationType);
    OpportunityTriggerHandler.OpportunityTriggerHandler(trigger.operationType,trigger.new);

}