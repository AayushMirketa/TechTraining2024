/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-17-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger CreateOpportunity on Account (after insert) {

    CheckOpportunityCreation.CheckOpportunityCreation(trigger.operationType, trigger.new);

}