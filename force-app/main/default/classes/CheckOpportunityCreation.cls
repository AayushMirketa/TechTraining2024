/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-17-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class CheckOpportunityCreation {
    public static void CheckOpportunityCreation(System.TriggerOperation sysTrigger, List<Account> newTrigger) {

        if(Schema.sObjectType.opportunity.isCreateable()){
            List<opportunity> oppList= new List<opportunity>();
            for(Account acc:newTrigger){
                opportunity opp= new opportunity();
                opp.Name=acc.Name;
                opp.StageName='Prospecting';
                opp.CloseDate=date.today().addDays(3);
                oppList.add(opp);
            }
            insert oppList;
        }
        List<opportunity> oppList= new List<opportunity>();
        for(Account acc:newTrigger){
            opportunity opp= new opportunity();
            opp.Name=acc.Name;
            opp.StageName='Prospecting';
            opp.CloseDate=date.today().addDays(3);
            oppList.add(opp);
        }

        database.insert(oppList,False,AccessLevel.USER_MODE);
    }
}